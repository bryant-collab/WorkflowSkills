# WorkflowSkills

Reusable engineering workflows for Codex, adapted from Lauren Tan's **pstack** for Windows development. The 54 skills work across codebases: each task uses the current repository's instructions, contracts, remotes and existing checks. C#, Python, PowerShell, batch and web projects keep their own tooling. Jira requirements and PR hosting are independent; work profiles prohibit AI merging and make PR delivery and babysitting separate options.

## Layout

```text
WorkflowSkills/
  README.md
  LICENSE.md
  skill-dependencies.json
  install.ps1
  skills/
    how/SKILL.md
    github-delivery/SKILL.md
    poteto-mode/
      SKILL.md
      references/playbooks/
    show-me-your-work/
      SKILL.md
      scripts/decision_log.py
    principle-*/SKILL.md
    ...
```

Every skill has a `SKILL.md` manifest. Supporting references, guides, templates and executable helpers live inside their owning skill. `skill-dependencies.json` lists sibling skills needed to preserve local reference links, including conditional dependencies. Preserve that sibling layout when copying selected skills.

## Choose a workflow

Start with the skill that matches the requested outcome. Small tasks can run directly. The optional router selects a relevant guide; it does not require every task to use a panel, create a PR or load all principles.

| Skill | Use it to |
| --- | --- |
| [how](skills/how/SKILL.md) | Trace how current code behaves. |
| [why](skills/why/SKILL.md) | Investigate decisions using scoped Git history, issues and PR evidence. |
| [teach](skills/teach/SKILL.md) | Explain a subsystem through its behavior and history. |
| [architect](skills/architect/SKILL.md) | Explore consequential unresolved design choices and ownership boundaries. |
| [blast-radius](skills/blast-radius/SKILL.md) | Check affected callers, consumers and contracts beyond a diff. |
| [tdd](skills/tdd/SKILL.md) | Demonstrate a meaningful regression failing before and passing after a fix. |
| [benchmark-checklist](skills/benchmark-checklist/SKILL.md) | Assess performance measurements, completed work and uncertainty. |
| [create-verification-skill](skills/create-verification-skill/SKILL.md) | Generate and execute a project-specific launch, drive, evidence and cleanup workflow. |
| [maintain-verification-skill](skills/maintain-verification-skill/SKILL.md) | Reconcile an existing verification skill with source and observed behavior. |
| [correct](skills/correct/SKILL.md) | Turn demonstrated recurring mistakes into structural safeguards. |
| [technical-writing](skills/technical-writing/SKILL.md) | Write clear issues, PR descriptions and technical documentation. |
| [unslop](skills/unslop/SKILL.md) | Remove filler and unsupported claims while preserving precision. |
| [github-delivery](skills/github-delivery/SKILL.md) | Deliver an authorized change through repository checks and a PR, or inspect current-head PR status. |
| [pr-delivery](skills/pr-delivery/SKILL.md) | Deliver Jira, GitHub Issue, or supplied requirements as a PR and hand off after one initial status pass. |
| [pr-babysit](skills/pr-babysit/SKILL.md) | Inspect, explicitly watch, or repair an existing PR; always stop before merging or auto-merge. |
| [jira-workflow](skills/jira-workflow/SKILL.md) | Ground work in Jira acceptance criteria and linked evidence, with supplied-text fallback and separately authorized ticket updates. |
| [work-mode](skills/work-mode/SKILL.md) | Route work C# development through Jira and engineering checks, with a strict no-merge policy and optional PR modules. |
| [arena](skills/arena/SKILL.md) | Compare bounded candidates and synthesize a coherent result. |
| [swarm](skills/swarm/SKILL.md) | Divide substantial coverage into isolated slices and aggregate actual evidence. |
| [interrogate](skills/interrogate/SKILL.md) | Review adversarially, verify findings and return a report before changes. |
| [reflect](skills/reflect/SKILL.md) | Propose evidence-backed lessons from accessible, scoped context. |
| [show-me-your-work](skills/show-me-your-work/SKILL.md) | Record and audit actual decisions, pivots and checkpoints in a UTC TSV trail. |
| [figure-it-out](skills/figure-it-out/SKILL.md) | Execute a bounded complex task without a narrower recipe. |
| [recall](skills/recall/SKILL.md) | Recover scoped project history and reconcile it with live state. |
| [automate-me](skills/automate-me/SKILL.md) | Capture explicit working preferences in a personal-style skill. |
| [poteto-mode](skills/poteto-mode/SKILL.md) | Use the optional work style and task router with its 25 packaged guides. |
| [setup-pstack](skills/setup-pstack/SKILL.md) | Inspect supported model/effort choices and configure requested preferences. |
| [comment-quality](skills/comment-quality/SKILL.md) | Improve comments while preserving useful documentation, constraints and attribution. |
| [typescript-best-practices](skills/typescript-best-practices/SKILL.md) | Apply optional TypeScript guidance to real type and runtime boundaries. |
| [bro](skills/bro/SKILL.md) | Restate selected prose plainly and briefly. |

The other 24 skills are `principle-*` references. Load the principle that changes a real decision:

| Area | Principles (each has the `principle-` prefix) |
| --- | --- |
| Foundations and outcomes | laziness-protocol, foundational-thinking, redesign-from-first-principles, attack-the-premise, subtract-before-you-add, minimize-reader-load, outcome-oriented-execution, experience-first, exhaust-the-design-space, build-the-lever |
| Architecture | model-the-domain, boundary-discipline, type-system-discipline, make-operations-idempotent, migrate-callers-then-delete-legacy-apis, separate-before-serializing-shared-state |
| Verification | prove-it-works, fix-root-causes, sequence-verifiable-units, test-behavior-not-implementation, explain-the-number |
| Delegation | guard-the-context-window, never-block-on-the-human |
| Learning | encode-lessons-in-structure |

## Install selected skills

Run the interactive installer from this checkout. It asks for the profile, client, and install scope:

```powershell
.\install.ps1
```

It asks which set to install and where to install it, then copies complete skill folders and their dependency closure. It works with Windows PowerShell 5.1 and is designed for PowerShell 7 as well; testing was performed on Windows PowerShell 5.1. No download, tool installation, authentication, watcher, or global configuration change is performed.

Choose the target client in the interactive menu or pass `-Client Codex`, `-Client Copilot`, `-Client ClaudeCode`, or `-Client All`. Codex and Copilot share `.agents/skills`, which both clients discover. Claude Code uses `.claude/skills`. `All` installs the selected profile to both skill roots, preflighting both before it writes either one. Each root keeps its own receipt and backups outside the skill discovery folder. For backward compatibility, a command-line install that supplies `-Profile` but omits `-Client` targets Codex.

| Menu | Profile | Fresh install | Behavior |
| --- | --- | --- | --- |
| 1 | `HomeFull` | 52 skills | Full general collection, including both PR modules and the existing combined GitHub/router workflows. Excludes `work-mode` and `jira-workflow`. |
| 2 | `WorkCore` | 30 skills | C# + Jira engineering; no PR delivery or babysitting modules. |
| 3 | `WorkDelivery` | 31 skills | Work core plus PR delivery and one initial status pass. |
| 4 | `WorkBabysit` | 31 skills | Work core plus status, requested monitoring, and authorized repair of existing PRs. |
| 5 | `WorkBoth` | 32 skills | Work core with both PR modules. |
| 6 | `PRDelivery` | 8 skills | Install delivery independently with its engineering dependencies. Preserve previously managed skills. |
| 7 | `PRBabysit` | 7 skills | Install babysitting independently with its engineering dependencies. Preserve previously managed skills. |

PR delivery never starts ongoing observation. Both standalone PR modules stop before merge and auto-merge. `pr-babysit` does not depend on `pr-delivery`, and vice versa. The existing `github-delivery` and `poteto-mode` remain available in the home collection; work profiles exclude them so they cannot pull combined PR workflows into the work dependency closure.

Work profiles require a destination repository and install into the selected client's skill directory. They also add or update a marked block in root `AGENTS.md`, preserving other content. This block prohibits AI merging/auto-merge, identifies Jira as the requirements source, and enables or disables delivery and ongoing babysitting according to the selected modules. A requested one-time read-only status check remains allowed when babysitting is disabled. Enabled babysitting requires a specific request and one observer coordinated with the user's existing PR monitor application.

For home and individual modules, choose user-wide or repository scope. If both home and work are on the same user account, user-wide and ancestor skills remain discoverable in a work repository; project installation does not hide them. The work `AGENTS.md` block governs their use there. Separate user environments are necessary if you require physical separation of available skills. These instructions are workflow policy, not a Git-host permission control; repository protections remain independent. See the official [skill locations](https://learn.chatgpt.com/docs/build-skills) and [project guidance](https://learn.chatgpt.com/docs/customization/overview).

Parameters support repeatable installation and previews:

```powershell
# Preview the work set without writing files.
.\install.ps1 -Profile WorkCore -Client Codex -ProjectPath D:\git\WorkApp -WhatIf

# Install work skills and policy for Copilot in the selected repository.
.\install.ps1 -Profile WorkCore -Client Copilot -ProjectPath D:\git\WorkApp

# Install work skills and policy for Claude Code.
.\install.ps1 -Profile WorkCore -Client ClaudeCode -ProjectPath D:\git\WorkApp

# Install the full home collection for all supported clients.
.\install.ps1 -Profile HomeFull -Client All -Scope User

# Add only delivery later; existing work skills and no-merge policy remain.
.\install.ps1 -Profile PRDelivery -Scope Project -ProjectPath D:\git\WorkApp

# Add babysitting when you decide to use it.
.\install.ps1 -Profile PRBabysit -Scope Project -ProjectPath D:\git\WorkApp

# Home installation across personal repositories.
.\install.ps1 -Profile HomeFull -Scope User
```

Home/work profiles replace the installer's previously managed selection at that destination; individual PR options are additive. Selecting `WorkCore` after `WorkBoth` removes unchanged, previously managed PR modules and disables their work policy entries. It does not delete unmanaged skills or silently turn a work destination into a home destination. Use a separate destination for home. Updates/removal stop before writing if a managed skill has local edits or a requested name already exists unmanaged; reconcile or back up those files yourself before retrying.

Receipts, retained previous folders, and a license copy live in each client's `.workflowskills` state folder, outside the skill discovery tree. Copies are staged and checked before replacement; installation failures restore replaced skill folders and policy. Windows PowerShell users with very long destination paths should use a shorter checkout path or PowerShell 7. If skills do not appear, refresh or restart the selected client's session. Claude Code can reload project skills with `/reload-skills`.

The Jira workflow discovers integrations already available in the session; the installer does not provide a Jira connector or credentials. Without live Jira access, supplied ticket text remains usable and unverified live state is identified. Ticket changes, comments, and transitions require authorization for those actions. C# verification uses each repository's actual .NET SDK, tests, analyzers, and runtime paths.

### Manual selection

This repository is the source collection. For personal use across repositories, copy selected skill folders to the chosen client's user skill directory. For team use, copy them to a project skill directory: Codex and Copilot share `.agents/skills`; Claude Code uses `.claude/skills`. Keep each selected skill's dependency closure and full folder so relative references resolve. The PowerShell copy example below targets Codex and Copilot; set `$installRoot` to the matching `.claude\skills` path for Claude Code. See [official Build skills documentation](https://learn.chatgpt.com/docs/build-skills) and [project guidance](https://learn.chatgpt.com/docs/customization/overview). Check for duplicate names first and confirm discovery in a fresh session.

Include the selected skills' dependency closure and each complete skill folder. For example, this PowerShell snippet installs `how`, `tdd` and `github-delivery` with their referenced siblings. Change the selection before running it:

```powershell
$sourceRoot = 'D:\git\WorkflowSkills'
$selectedSkills = @('how', 'tdd', 'github-delivery')
$dependencyMap = Get-Content -LiteralPath (Join-Path $sourceRoot 'skill-dependencies.json') -Raw | ConvertFrom-Json
$pendingSkills = [System.Collections.Generic.Queue[string]]::new()
$resolvedSkills = [System.Collections.Generic.HashSet[string]]::new()
foreach ($skillName in $selectedSkills) { $pendingSkills.Enqueue($skillName) }
while ($pendingSkills.Count -gt 0) {
    $skillName = $pendingSkills.Dequeue()
    $entry = $dependencyMap.PSObject.Properties[$skillName]
    if ($null -eq $entry) { throw "Unknown skill: $skillName" }
    if ($resolvedSkills.Add($skillName)) {
        foreach ($dependency in $entry.Value) { $pendingSkills.Enqueue($dependency) }
    }
}
$installRoot = Join-Path ([Environment]::GetFolderPath('UserProfile')) '.agents\skills'
# For project scope instead, set $installRoot to '<project>\.agents\skills'.
$toInstall = @($resolvedSkills | Sort-Object)
foreach ($skillName in $toInstall) {
    if (Test-Path -LiteralPath (Join-Path $installRoot $skillName)) {
        throw "Existing skill needs review before replacement: $skillName"
    }
}
New-Item -ItemType Directory -Path $installRoot -Force | Out-Null
foreach ($skillName in $toInstall) {
    Copy-Item -LiteralPath (Join-Path $sourceRoot "skills\$skillName") -Destination $installRoot -Recurse -ErrorAction Stop
}
```

Record copied destinations and hashes for updates or removal. Preserve later edits; replacements need retained backups. Keep [LICENSE.md](LICENSE.md) with redistributed copies. Generated project-specific verification skills belong in their originating projects unless deliberately adapted.

## Use a skill

After discovery, select the skill in the client's picker or invoke it by name. Codex CLI and IDE extension use `$skill-name`; Copilot and Claude Code use `/skill-name`. All can select a skill automatically when its description matches. These are example prompts, not shell commands; the examples below use Codex syntax. [Invocation documentation](https://learn.chatgpt.com/docs/build-skills)

```text
$how Explain how this repository loads configuration.
$tdd Fix issue #12 using a meaningful regression test.
$interrogate Review this diff and report verified findings.
$create-verification-skill Create and execute verification for this project's CLI.
$github-delivery Implement this issue and open a PR in the named repository.
$github-delivery Check this PR's current-head CI and review status; keep it read-only.
$poteto-mode Help me complete this feature using the appropriate workflow.
$work-mode Implement the supplied Jira ticket using this work repository's C# checks.
$jira-workflow Read PROJ-123 and summarize its acceptance criteria; do not update it.
$pr-delivery Implement this Jira ticket and open a PR; hand off after initial status.
$pr-babysit Watch this existing PR until CI completes; never merge it.
```

Provide the repository, issue or diff, desired outcome and relevant constraints. The workflows inherit supported model settings and use available tools. Delegation needs task authorization and isolated ownership; unavailable delegation can use an honestly labeled sequential fallback. A status or review request remains read-only. PR creation, external messages, recurring work, deployment and merging follow the user's actual authorization.

## Requirements and validation limits

Most skills are instructions. Executable verification uses the target project's existing tools: a supported .NET SDK for C#, its Python environment, PowerShell or `cmd.exe`, or the web project's own stack. The bundled decision-log helper uses Python's standard library. GitHub operations prefer available `gh-axi` commands, with supported alternatives for gaps. Personal-style authoring uses Skill Creator when available.

The original 50 manifests and local references passed packaging validation, with ten packaging regression/closure cases and six decision-log tests. Focused Python and Windows script fixtures, a real Electron/GitHub pilot, and bounded independent review/history/router evaluations supplied behavioral evidence. The Jira/work and modular PR additions have manifest/reference validation and a GPT-6.1 Sol review. Run `tests/install-skills.Tests.ps1` for isolated installer integration checks covering every profile, dependency isolation, additive modules, downgrade/removal, local-edit protection, policy preservation, previews, and rollback. This does not establish every workflow or fresh-session discovery in every client. Live Jira access and real C# repository coverage remain unverified for these additions. Orchestrate, Autopilot-full, Autopilot-stack and automatic worktree cleanup execution remain explicitly deferred in their guides.

## Credit and license

Original workflows: **Lauren Tan (poteto)**, [pstack in cursor/plugins](https://github.com/cursor/plugins/tree/e43c7ee26e0038c6c1fa8380dd34ce86ff94cb2a/pstack), version **0.15.9**, commit `e43c7ee26e0038c6c1fa8380dd34ce86ff94cb2a`. This adaptation replaces Cursor integration assumptions with Codex/Windows guidance, preserves qualified engineering principles, and adds standalone GitHub delivery. The original MIT copyright and permission notice are retained in [LICENSE.md](LICENSE.md).
