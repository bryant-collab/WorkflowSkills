#Requires -Version 5.1
<#
.SYNOPSIS
Interactively install WorkflowSkills, or select a profile with parameters.
.EXAMPLE
.\install.ps1
.EXAMPLE
.\install.ps1 -Profile WorkCore -ProjectPath D:\git\WorkApp -WhatIf
.EXAMPLE
.\install.ps1 -Profile PRDelivery -Scope Project -ProjectPath D:\git\WorkApp
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
    [ValidateSet('HomeFull', 'WorkCore', 'WorkDelivery', 'WorkBabysit', 'WorkBoth', 'PRDelivery', 'PRBabysit')]
    [string]$Profile,
    [ValidateSet('User', 'Project')]
    [string]$Scope,
    [string]$ProjectPath,
    # Allows portable user installs and isolated verification without changing USERPROFILE.
    [string]$UserPath = [Environment]::GetFolderPath('UserProfile')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$sourceRoot = $PSScriptRoot
$utf8 = New-Object System.Text.UTF8Encoding($false)

function Get-FullPath([string]$Path) {
    return [IO.Path]::GetFullPath($Path).TrimEnd([IO.Path]::DirectorySeparatorChar)
}

function Assert-Contained([string]$Path, [string]$Root) {
    $fullPath = Get-FullPath $Path
    $fullRoot = Get-FullPath $Root
    if (-not $fullPath.StartsWith($fullRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the intended directory: $fullPath"
    }
}

function Assert-NoLinks([string]$Path) {
    $cursor = Get-FullPath $Path
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) {
            $item = Get-Item -LiteralPath $cursor -Force
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Linked paths are not supported by this installer: $cursor"
            }
        }
        $parent = [IO.Path]::GetDirectoryName($cursor)
        if ($parent -eq $cursor) { break }
        $cursor = $parent
    }
}

function Get-SkillHash([string]$Path) {
    Assert-NoLinks $Path
    $rootPath = Get-FullPath $Path
    $items = @(Get-ChildItem -LiteralPath $rootPath -Recurse -Force)
    foreach ($item in $items) {
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Linked skill contents are not supported: $($item.FullName)"
        }
    }
    $lines = @($items | Where-Object { -not $_.PSIsContainer } | Sort-Object FullName | ForEach-Object {
        $relative = $_.FullName.Substring($rootPath.Length + 1).Replace('\', '/')
        '{0}:{1}' -f $relative, (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    })
    $hasher = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($hasher.ComputeHash($utf8.GetBytes(($lines -join "`n"))))).Replace('-', '')
    } finally { $hasher.Dispose() }
}

function Resolve-Skills([string[]]$Seeds, [hashtable]$Map) {
    $queue = New-Object 'System.Collections.Generic.Queue[string]'
    $seen = New-Object 'System.Collections.Generic.HashSet[string]'
    foreach ($name in $Seeds) { $queue.Enqueue($name) }
    while ($queue.Count -gt 0) {
        $name = $queue.Dequeue()
        if ($name -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$' -or -not $Map.ContainsKey($name)) {
            throw "Unknown or invalid skill in dependency closure: $name"
        }
        if ($seen.Add($name)) {
            foreach ($dependency in $Map[$name]) { $queue.Enqueue($dependency) }
        }
    }
    return @($seen | Sort-Object)
}

if (-not $Profile) {
    Write-Host "`nWorkflowSkills installation"
    Write-Host '1. Home full collection (includes both PR modules; excludes work-only skills)'
    Write-Host '2. Work C# + Jira core (no PR delivery or babysitting)'
    Write-Host '3. Work core + PR delivery'
    Write-Host '4. Work core + PR babysitting'
    Write-Host '5. Work core + both PR modules'
    Write-Host '6. PR delivery only (add-on; keeps existing managed skills)'
    Write-Host '7. PR babysitting only (add-on; keeps existing managed skills)'
    Write-Host 'Q. Quit'
    $choices = @('HomeFull', 'WorkCore', 'WorkDelivery', 'WorkBabysit', 'WorkBoth', 'PRDelivery', 'PRBabysit')
    do { $answer = (Read-Host 'Choose an option').Trim() } while ($answer -notmatch '^[1-7qQ]$')
    if ($answer -match '^[qQ]$') { return }
    $Profile = $choices[[int]$answer - 1]
}

$isWork = $Profile.StartsWith('Work')
$isAddon = $Profile -in @('PRDelivery', 'PRBabysit')
if ($isWork) {
    if ($Scope -eq 'User') { throw 'Work profiles require Project scope to keep work policy out of home projects.' }
    $Scope = 'Project'
} elseif (-not $Scope) {
    if ($ProjectPath) { $Scope = 'Project' }
    else {
        do { $answer = (Read-Host 'Install for this user (U) or a specific repository (P)? [U]').Trim() } while ($answer -notmatch '^([uUpP])?$')
        $Scope = if ($answer -match '^[pP]$') { 'Project' } else { 'User' }
    }
}

if ($Scope -eq 'Project') {
    if (-not $ProjectPath) { $ProjectPath = Read-Host 'Full path of the destination repository' }
    if ([string]::IsNullOrWhiteSpace($ProjectPath)) { throw 'A destination repository is required.' }
    $destinationBase = Get-FullPath $ProjectPath
    if (-not (Test-Path -LiteralPath $destinationBase -PathType Container)) {
        throw "Destination repository does not exist: $destinationBase"
    }
} else {
    if ($ProjectPath) { throw 'ProjectPath cannot be combined with User scope.' }
    $destinationBase = Get-FullPath $UserPath
}
$agentsRoot = Join-Path $destinationBase '.agents'
$installRoot = Join-Path $agentsRoot 'skills'
# Backups are outside the skill discovery tree.
$stateRoot = Join-Path $agentsRoot '.workflowskills'
$receiptPath = Join-Path $stateRoot 'receipt.json'
Assert-NoLinks $installRoot
Assert-NoLinks $stateRoot
Assert-NoLinks $receiptPath

$dependencyDocument = Get-Content -LiteralPath (Join-Path $sourceRoot 'skill-dependencies.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$dependencyMap = @{}
foreach ($property in $dependencyDocument.PSObject.Properties) { $dependencyMap[$property.Name] = @($property.Value) }
$previousSeeds = @()
$installed = @{}
if (Test-Path -LiteralPath $receiptPath) {
    $receipt = Get-Content -LiteralPath $receiptPath -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($receipt.Version -ne 1 -or $receipt.InstallRoot -ne (Get-FullPath $installRoot)) {
        throw 'The existing installer receipt does not match this destination/version.'
    }
    $previousSeeds = @($receipt.SelectedSkills)
    foreach ($property in $receipt.Skills.PSObject.Properties) {
        if ($property.Name -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') { throw 'Invalid skill name in installer receipt.' }
        $installed[$property.Name] = [string]$property.Value
    }
}

switch ($Profile) {
    'HomeFull' { $seeds = @($dependencyMap.Keys | Where-Object { $_ -notin @('work-mode', 'jira-workflow') }) }
    'WorkCore' { $seeds = @('work-mode') }
    'WorkDelivery' { $seeds = @('work-mode', 'pr-delivery') }
    'WorkBabysit' { $seeds = @('work-mode', 'pr-babysit') }
    'WorkBoth' { $seeds = @('work-mode', 'pr-delivery', 'pr-babysit') }
    'PRDelivery' { $seeds = @($previousSeeds) + @('pr-delivery') }
    'PRBabysit' { $seeds = @($previousSeeds) + @('pr-babysit') }
}
$seeds = @($seeds | Sort-Object -Unique)
$desired = @(Resolve-Skills $seeds $dependencyMap)
$remove = @($installed.Keys | Where-Object { $_ -notin $desired } | Sort-Object)
$sourceHashes = @{}

# Preflight the entire change before touching the destination.
foreach ($name in $desired) {
    $source = Join-Path $sourceRoot "skills\$name"
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
        throw "Missing skill manifest: $name"
    }
    $sourceHashes[$name] = Get-SkillHash $source
    $target = Join-Path $installRoot $name
    if ((Test-Path -LiteralPath $target) -and -not $installed.ContainsKey($name)) {
        throw "Existing unmanaged skill needs review; it will not be overwritten: $target"
    }
}
foreach ($name in $installed.Keys) {
    $target = Join-Path $installRoot $name
    Assert-Contained $target $installRoot
    if (Test-Path -LiteralPath $target) {
        if ((Get-SkillHash $target) -ne $installed[$name]) {
            throw "Installed skill has local edits; preserve/reconcile them before updating: $target"
        }
    }
}

$hasWork = 'work-mode' -in $desired
$agentsPath = Join-Path $destinationBase 'AGENTS.md'
$oldAgentsText = ''
$newAgentsText = $null
$agentsExisted = Test-Path -LiteralPath $agentsPath
$policyStart = '<!-- workflowskills:work-policy:start -->'
$policyEnd = '<!-- workflowskills:work-policy:end -->'
if ($Scope -eq 'Project') {
    Assert-NoLinks $agentsPath
    if ($agentsExisted) { $oldAgentsText = [IO.File]::ReadAllText($agentsPath) }
    $startCount = ([regex]::Matches($oldAgentsText, [regex]::Escape($policyStart))).Count
    $endCount = ([regex]::Matches($oldAgentsText, [regex]::Escape($policyEnd))).Count
    if ($startCount -ne $endCount -or $startCount -gt 1 -or
        ($startCount -eq 1 -and $oldAgentsText.IndexOf($policyEnd) -lt $oldAgentsText.IndexOf($policyStart))) {
        throw 'Malformed WorkflowSkills policy markers in AGENTS.md; reconcile them before installation.'
    }
    if ($hasWork) {
        $deliveryPolicy = if ('pr-delivery' -in $desired) {
            'PR delivery is available only for requested delivery work; opening a PR does not authorize monitoring.'
        } else { 'PR delivery automation is disabled. Prepare local changes and hand off PR publication unless the user changes this installation policy.' }
        $monitorPolicy = if ('pr-babysit' -in $desired) {
            'PR babysitting is available only when explicitly requested. Keep one watcher per PR; coordinate with the existing PR monitor application.'
        } else { 'Ongoing PR monitoring and babysitting are disabled. Hand off to the existing PR monitor application. A requested single read-only status check is allowed.' }
        $policy = @"
$policyStart
## WorkflowSkills work policy

This is a work repository. Use work-mode for C# development and jira-workflow for Jira requirements. Git hosting is independent of Jira.
Never merge pull requests or enable auto-merge in this repository, including equivalent APIs or merge queues. Leave merging to a human even when a later request asks the AI to merge.
$deliveryPolicy
$monitorPolicy
Jira comments, assignments, field edits, and transitions require authorization covering those actions.
$policyEnd
"@
        if ($startCount -eq 1) {
            $pattern = '(?s)' + [regex]::Escape($policyStart) + '.*?' + [regex]::Escape($policyEnd)
            $newAgentsText = [regex]::Replace($oldAgentsText, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($match) $policy })
        } else { $newAgentsText = $oldAgentsText + $(if ($oldAgentsText) { "`n`n" } else { '' }) + $policy + "`n" }
    } elseif ($startCount -gt 0) {
        # Switching to home must not silently remove an employer's policy.
        throw 'This destination has a work policy. Use a different destination for HomeFull.'
    }
    if ($hasWork) {
        $excluded = @('poteto-mode', 'github-delivery', 'pr-delivery', 'pr-babysit') | Where-Object { $_ -notin $desired }
        foreach ($name in $excluded) {
            if ((Test-Path -LiteralPath (Join-Path $installRoot $name)) -and -not $installed.ContainsKey($name)) {
                throw "An unmanaged $name skill conflicts with this work selection. Use a fresh destination or reconcile it first."
            }
        }
        Write-Warning 'User-wide or ancestor skills remain discoverable. The repository work policy disables excluded PR workflows; use separate user environments if you need physical skill isolation.'
    }
}

$change = @($desired | Where-Object {
    -not (Test-Path -LiteralPath (Join-Path $installRoot $_)) -or
    -not $installed.ContainsKey($_) -or $installed[$_] -ne $sourceHashes[$_]
})
Write-Host "`nProfile: $Profile; scope: $Scope"
Write-Host "Destination: $installRoot"
Write-Host ("Skills ({0}): {1}" -f $desired.Count, ($desired -join ', '))
Write-Host ("Install/update: {0}; remove previously managed: {1}" -f $change.Count, $remove.Count)
if ($remove.Count) { Write-Host ('Remove: ' + ($remove -join ', ')) }
if ($null -ne $newAgentsText) { Write-Host "Work policy: $agentsPath (other content preserved)" }
if (-not $PSCmdlet.ShouldProcess($installRoot, "Install $Profile and its dependencies; preserve backups of replaced files")) { return }

$transactionRoot = Join-Path $stateRoot ('backups\' + [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ') + '-' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
Assert-Contained $transactionRoot $stateRoot
# Windows PowerShell's copy operations can hit MAX_PATH before .NET does.
if ($PSVersionTable.PSVersion.Major -le 5) {
    foreach ($name in @($change) + @($remove)) {
        $tree = if ($name -in $desired) { Join-Path $sourceRoot "skills\$name" } else { Join-Path $installRoot $name }
        if (-not (Test-Path -LiteralPath $tree)) { continue }
        foreach ($item in Get-ChildItem -LiteralPath $tree -Recurse -Force) {
            $suffix = $item.FullName.Substring((Get-FullPath $tree).Length + 1)
            $backupItem = Join-Path $transactionRoot "previous\$name\$suffix"
            if ($backupItem.Length -ge 260) {
                throw 'Destination paths are too long for Windows PowerShell. Use a shorter repository path or PowerShell 7.'
            }
        }
    }
}
New-Item -ItemType Directory -Path (Join-Path $transactionRoot 'previous'), (Join-Path $transactionRoot 'staged'), $installRoot -Force | Out-Null
$receiptExisted = Test-Path -LiteralPath $receiptPath
$moved = New-Object 'System.Collections.Generic.List[string]'
$published = New-Object 'System.Collections.Generic.List[string]'
$policyWritten = $false
try {
    # Stage and verify copies before replacing any installed skill.
    foreach ($name in $change) {
        $staged = Join-Path $transactionRoot "staged\$name"
        Copy-Item -LiteralPath (Join-Path $sourceRoot "skills\$name") -Destination $staged -Recurse
        if ((Get-SkillHash $staged) -ne $sourceHashes[$name]) { throw "Staged copy failed verification: $name" }
    }
    if ($receiptExisted) { Copy-Item -LiteralPath $receiptPath -Destination (Join-Path $transactionRoot 'receipt.json') }
    if ($null -ne $newAgentsText -and $agentsExisted) { Copy-Item -LiteralPath $agentsPath -Destination (Join-Path $transactionRoot 'AGENTS.md') }
    foreach ($name in @($change) + @($remove)) {
        $target = Join-Path $installRoot $name
        Assert-Contained $target $installRoot
        if (Test-Path -LiteralPath $target) {
            Move-Item -LiteralPath $target -Destination (Join-Path $transactionRoot "previous\$name")
            $moved.Add($name)
        }
    }
    foreach ($name in $change) {
        $staged = Join-Path $transactionRoot "staged\$name"
        $target = Join-Path $installRoot $name
        Assert-Contained $staged $transactionRoot
        Assert-Contained $target $installRoot
        Move-Item -LiteralPath $staged -Destination $target
        $published.Add($name)
    }
    if ($null -ne $newAgentsText) {
        $policyWritten = $true
        [IO.File]::WriteAllText($agentsPath, $newAgentsText, $utf8)
    }
    $hashRecord = [ordered]@{}
    foreach ($name in $desired) { $hashRecord[$name] = $sourceHashes[$name] }
    $newReceipt = [ordered]@{
        Version = 1; InstallRoot = (Get-FullPath $installRoot); Profile = $Profile
        SelectedSkills = @($seeds); Skills = $hashRecord; UpdatedUtc = [DateTime]::UtcNow.ToString('o')
    }
    Copy-Item -LiteralPath (Join-Path $sourceRoot 'LICENSE.md') -Destination (Join-Path $stateRoot 'LICENSE.md') -Force
    $pendingReceipt = Join-Path $transactionRoot 'pending-receipt.json'
    [IO.File]::WriteAllText($pendingReceipt, ($newReceipt | ConvertTo-Json -Depth 8), $utf8)
    # Commit metadata atomically; a locked destination cannot truncate the old receipt.
    if ($receiptExisted) { [IO.File]::Replace($pendingReceipt, $receiptPath, (Join-Path $transactionRoot 'receipt-replaced.json')) }
    else { [IO.File]::Move($pendingReceipt, $receiptPath) }
} catch {
    $failure = $_
    # Restore replaced folders; only freshly published, owned paths are removed.
    foreach ($name in $published) {
        $target = Join-Path $installRoot $name
        Assert-Contained $target $installRoot
        Assert-NoLinks $target
        Remove-Item -LiteralPath $target -Recurse -Force
    }
    foreach ($name in $moved) {
        $backup = Join-Path $transactionRoot "previous\$name"
        Assert-Contained $backup $transactionRoot
        Move-Item -LiteralPath $backup -Destination (Join-Path $installRoot $name)
    }
    if ($policyWritten) {
        if ($agentsExisted) { Copy-Item -LiteralPath (Join-Path $transactionRoot 'AGENTS.md') -Destination $agentsPath -Force }
        else { Remove-Item -LiteralPath $agentsPath -Force }
    }
    # Receipt replacement is the last operation and is atomic, so failure leaves it unchanged.
    throw $failure
}
Write-Host "Installed successfully. Receipt/license: $stateRoot"
Write-Host "Backups: $transactionRoot"
Write-Host 'If skills do not appear, restart Codex. No tools, credentials, watchers, or global settings were configured.'
