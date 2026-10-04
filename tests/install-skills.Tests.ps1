#Requires -Version 5.1
# Standalone integration tests; no Pester or live user installation required.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$installer = Join-Path (Split-Path $PSScriptRoot -Parent) 'install.ps1'
$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('WorkflowSkills-tests-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testRoot | Out-Null
$passed = 0

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}
function Assert-Throws([scriptblock]$Action, [string]$MessageFragment) {
    $caught = $false
    try { & $Action } catch {
        $caught = $true
        Assert-True ($_.Exception.Message.Contains($MessageFragment)) "Unexpected failure: $_"
    }
    Assert-True $caught "Expected failure containing: $MessageFragment"
}
function New-Repository([string]$Name) {
    $path = Join-Path $testRoot $Name
    New-Item -ItemType Directory -Path $path | Out-Null
    return $path
}
function Install-Profile([string]$Profile, [string]$Repository) {
    & $installer -Profile $Profile -Scope Project -ProjectPath $Repository *> $null
}
function Get-Names([string]$Repository) {
    return @(Get-ChildItem -LiteralPath (Join-Path $Repository '.agents\skills') -Directory | Select-Object -ExpandProperty Name)
}
function Passed([string]$Name) {
    $script:passed++
    Write-Output "PASS $Name"
}

try {
    foreach ($profile in @('HomeFull', 'WorkCore', 'WorkDelivery', 'WorkBabysit', 'WorkBoth', 'PRDelivery', 'PRBabysit')) {
        $repository = New-Repository $profile
        Install-Profile $profile $repository
        $names = Get-Names $repository
        $expectDelivery = $profile -in @('HomeFull', 'WorkDelivery', 'WorkBoth', 'PRDelivery')
        $expectBabysit = $profile -in @('HomeFull', 'WorkBabysit', 'WorkBoth', 'PRBabysit')
        Assert-True (('pr-delivery' -in $names) -eq $expectDelivery) "$profile delivery isolation failed"
        Assert-True (('pr-babysit' -in $names) -eq $expectBabysit) "$profile babysit isolation failed"
        if ($profile -ne 'HomeFull') {
            Assert-True ('poteto-mode' -notin $names -and 'github-delivery' -notin $names) "$profile pulled in combined PR workflows"
        }
        if ($profile.StartsWith('Work')) {
            Assert-True ('jira-workflow' -in $names -and 'work-mode' -in $names) "$profile missing Jira/work skills"
            $policy = Get-Content -LiteralPath (Join-Path $repository 'AGENTS.md') -Raw
            Assert-True ($policy.Contains('Never merge pull requests or enable auto-merge')) "$profile missing no-merge policy"
            Assert-True ($policy.Contains('Ongoing PR monitoring and babysitting are disabled') -eq (-not $expectBabysit)) "$profile wrong monitoring policy"
        } else {
            Assert-True ('work-mode' -notin $names -and 'jira-workflow' -notin $names) "$profile contaminated with work-only skills"
            Assert-True (-not (Test-Path -LiteralPath (Join-Path $repository 'AGENTS.md'))) "$profile created a work policy"
        }
        # Every packaged relative Markdown link must resolve in the actual installed subset.
        foreach ($file in Get-ChildItem -LiteralPath (Join-Path $repository '.agents\skills') -Filter '*.md' -Recurse) {
            $content = [IO.File]::ReadAllText($file.FullName)
            foreach ($match in [regex]::Matches($content, '\]\(([^)]+)\)')) {
                $link = $match.Groups[1].Value
                if ($link -match '^(https?://|#|app://)' -or $link -notmatch '\.md($|#)') { continue }
                $relative = ($link -split '#')[0]
                Assert-True (Test-Path -LiteralPath (Join-Path $file.DirectoryName $relative)) "Broken installed reference: $($file.FullName) -> $link"
            }
        }
        Passed "$profile install and dependency/reference isolation ($($names.Count) skills)"
    }

    $repository = New-Repository 'switching with spaces'
    $agentsPath = Join-Path $repository 'AGENTS.md'
    [IO.File]::WriteAllText($agentsPath, "# Existing guidance`nKeep our project conventions.`n")
    Install-Profile 'WorkCore' $repository
    Install-Profile 'PRDelivery' $repository
    Assert-True ('work-mode' -in (Get-Names $repository) -and 'pr-delivery' -in (Get-Names $repository)) 'Delivery add-on dropped work core'
    Assert-True ('pr-babysit' -notin (Get-Names $repository)) 'Delivery add-on installed babysitting'
    Install-Profile 'PRBabysit' $repository
    Assert-True ('pr-delivery' -in (Get-Names $repository) -and 'pr-babysit' -in (Get-Names $repository)) 'Add-ons did not accumulate'
    Assert-True ((Get-Content $agentsPath -Raw).Contains('PR babysitting is available only when explicitly requested')) 'Add-on did not enable selected policy'
    Install-Profile 'WorkCore' $repository
    $names = Get-Names $repository
    Assert-True ('pr-delivery' -notin $names -and 'pr-babysit' -notin $names) 'Core downgrade left managed PR modules'
    $policy = Get-Content $agentsPath -Raw
    Assert-True ($policy.StartsWith("# Existing guidance`nKeep our project conventions.`n")) 'Existing AGENTS text was lost'
    Assert-True (([regex]::Matches($policy, '<!-- workflowskills:work-policy:start -->')).Count -eq 1) 'Duplicate policy block'
    $backups = @(Get-ChildItem -LiteralPath (Join-Path $repository '.agents\.workflowskills\backups') -Filter SKILL.md -Recurse)
    Assert-True ($backups.Count -ge 2) 'Removed skills were not backed up'
    $policyBefore = [IO.File]::ReadAllBytes($agentsPath)
    Install-Profile 'WorkCore' $repository
    Assert-True ([Convert]::ToBase64String([IO.File]::ReadAllBytes($agentsPath)) -eq [Convert]::ToBase64String($policyBefore)) 'Repeat changed AGENTS policy'
    Passed 'Add-ons, profile downgrade, backups, AGENTS preservation, and repeat install'

    $editedPath = Join-Path $repository '.agents\skills\how\SKILL.md'
    Add-Content -LiteralPath $editedPath -Value 'Local team customization'
    $editedBefore = [IO.File]::ReadAllText($editedPath)
    Assert-Throws { Install-Profile 'WorkBoth' $repository } 'local edits'
    Assert-True ([IO.File]::ReadAllText($editedPath) -eq $editedBefore) 'Edited skill was overwritten'
    Assert-True ('pr-babysit' -notin (Get-Names $repository)) 'Failed preflight partly installed addon'
    Passed 'Local edits block the whole operation before writes'

    $unmanaged = New-Repository 'unmanaged'
    $unmanagedPath = Join-Path $unmanaged '.agents\skills\pr-delivery'
    New-Item -ItemType Directory -Path $unmanagedPath -Force | Out-Null
    [IO.File]::WriteAllText((Join-Path $unmanagedPath 'SKILL.md'), 'Unmanaged content')
    Assert-Throws { Install-Profile 'PRDelivery' $unmanaged } 'unmanaged skill'
    Assert-True (-not (Test-Path -LiteralPath (Join-Path $unmanaged '.agents\.workflowskills'))) 'Unmanaged collision wrote state'
    Passed 'Unmanaged name collisions are preserved'

    $dryRun = New-Repository 'dry run'
    & $installer -Profile WorkBoth -ProjectPath $dryRun -WhatIf *> $null
    Assert-True (@(Get-ChildItem -LiteralPath $dryRun -Force).Count -eq 0) 'WhatIf wrote to destination'
    Passed 'WhatIf leaves destination untouched'

    $malformed = New-Repository 'malformed policy'
    [IO.File]::WriteAllText((Join-Path $malformed 'AGENTS.md'), '<!-- workflowskills:work-policy:start -->')
    Assert-Throws { Install-Profile 'WorkCore' $malformed } 'Malformed'
    Assert-True (-not (Test-Path -LiteralPath (Join-Path $malformed '.agents'))) 'Malformed policy partly installed'
    Passed 'Malformed policy blocks writes'

    Assert-Throws { & $installer -Profile WorkCore -Scope User -UserPath $testRoot *> $null } 'require Project scope'
    $workRepository = Join-Path $testRoot 'WorkCore'
    Assert-Throws { Install-Profile 'HomeFull' $workRepository } 'work policy'
    Passed 'Work cannot install user-wide or silently become a home profile'

    $portableUser = New-Repository 'portable user'
    & $installer -Profile PRDelivery -Scope User -UserPath $portableUser *> $null
    Assert-True (Test-Path -LiteralPath (Join-Path $portableUser '.agents\skills\pr-delivery\SKILL.md')) 'User scope did not install'
    Assert-True (-not (Test-Path -LiteralPath (Join-Path $portableUser 'AGENTS.md'))) 'User add-on created work policy'
    Passed 'Portable user destination'

    $interactive = New-Repository 'interactive'
    $mockAnswers = New-Object 'System.Collections.Generic.Queue[string]'
    foreach ($answer in @('7', 'P', $interactive)) { $mockAnswers.Enqueue($answer) }
    Set-Item Function:\Read-Host -Value ({ param([string]$Prompt) return $mockAnswers.Dequeue() }.GetNewClosure())
    try { & $installer *> $null }
    finally { Remove-Item Function:\Read-Host }
    Assert-True ('pr-babysit' -in (Get-Names $interactive) -and 'pr-delivery' -notin (Get-Names $interactive)) 'Interactive choice installed the wrong module'
    Assert-True ($mockAnswers.Count -eq 0) 'Interactive destination prompts were not consumed'
    Passed 'Interactive profile and destination selection'

    $updateSource = New-Repository 'update source'
    foreach ($file in @('install.ps1', 'skill-dependencies.json', 'LICENSE.md')) {
        Copy-Item -LiteralPath (Join-Path (Split-Path $PSScriptRoot -Parent) $file) -Destination $updateSource
    }
    $updateSkills = Join-Path $updateSource 'skills'
    New-Item -ItemType Directory -Path $updateSkills | Out-Null
    foreach ($name in (Get-Names $portableUser)) {
        Copy-Item -LiteralPath (Join-Path (Split-Path $PSScriptRoot -Parent) "skills\$name") -Destination $updateSkills -Recurse
    }
    $sourceSkill = Join-Path $updateSkills 'pr-delivery\SKILL.md'
    Add-Content -LiteralPath $sourceSkill -Value 'Updated source fixture'
    & (Join-Path $updateSource 'install.ps1') -Profile PRDelivery -Scope User -UserPath $portableUser *> $null
    Assert-True ((Get-Content (Join-Path $portableUser '.agents\skills\pr-delivery\SKILL.md') -Raw).Contains('Updated source fixture')) 'Managed update did not replace the old version'
    $retained = @(Get-ChildItem -LiteralPath (Join-Path $portableUser '.agents\.workflowskills\backups') -Filter SKILL.md -Recurse)
    Assert-True (@($retained | Where-Object { $_.FullName -match 'previous\\pr-delivery\\SKILL.md$' }).Count -eq 1) 'Managed update did not retain the original'
    Passed 'Source update replaces managed version with retained backup'

    # Inject a late I/O failure to prove rollback restores the previous installation.
    $rollback = New-Repository 'rollback'
    Install-Profile 'WorkCore' $rollback
    $receiptPath = Join-Path $rollback '.agents\.workflowskills\receipt.json'
    $receiptBefore = [IO.File]::ReadAllBytes($receiptPath)
    $agentsBefore = [IO.File]::ReadAllBytes((Join-Path $rollback 'AGENTS.md'))
    $lock = [IO.File]::Open($receiptPath, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)
    try { Assert-Throws { Install-Profile 'WorkBoth' $rollback } 'used by another process' }
    finally { $lock.Dispose() }
    Assert-True ('pr-delivery' -notin (Get-Names $rollback) -and 'pr-babysit' -notin (Get-Names $rollback)) 'Rollback left new PR modules'
    Assert-True ([Convert]::ToBase64String([IO.File]::ReadAllBytes($receiptPath)) -eq [Convert]::ToBase64String($receiptBefore)) 'Rollback changed receipt'
    Assert-True ([Convert]::ToBase64String([IO.File]::ReadAllBytes((Join-Path $rollback 'AGENTS.md'))) -eq [Convert]::ToBase64String($agentsBefore)) 'Rollback changed work policy'
    Passed 'Late I/O failure rolls back modules, receipt, and policy'

    Write-Output "$passed integration checks passed."
} finally {
    $resolvedRoot = [IO.Path]::GetFullPath($testRoot)
    $tempPrefix = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\WorkflowSkills-tests-'
    if (-not $resolvedRoot.StartsWith($tempPrefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe test cleanup path.' }
    Remove-Item -LiteralPath $resolvedRoot -Recurse -Force
}
