# WorkflowSkills

Reusable engineering workflows for Codex, adapted from Lauren Tan's **pstack** for Windows and GitHub development. The 50 skills work across codebases: each task uses the current repository's instructions, contracts, remotes and existing checks. C#, Python, PowerShell, batch and web projects keep their own tooling.

## Layout

```text
WorkflowSkills/
  README.md
  LICENSE.md
  skill-dependencies.json
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

This repository is the source collection. For personal use across repositories, copy selected skill folders to your user's `.agents/skills`. For team use, copy them to a project's `.agents/skills`. Codex supports these locations and explicit or automatic invocation; see [official Build skills documentation](https://learn.chatgpt.com/docs/build-skills). Check for duplicate names first and confirm discovery in a fresh session.

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

After discovery, select the skill in the client's skill picker or mention its name. Codex CLI and IDE extension support `$skill-name`; automatic selection uses the manifest's description. These are example prompts, not shell commands. [Invocation documentation](https://learn.chatgpt.com/docs/build-skills)

```text
$how Explain how this repository loads configuration.
$tdd Fix issue #12 using a meaningful regression test.
$interrogate Review this diff and report verified findings.
$create-verification-skill Create and execute verification for this project's CLI.
$github-delivery Implement this issue and open a PR in the named repository.
$github-delivery Check this PR's current-head CI and review status; keep it read-only.
$poteto-mode Help me complete this feature using the appropriate workflow.
```

Provide the repository, issue or diff, desired outcome and relevant constraints. The workflows inherit supported model settings and use available tools. Delegation needs task authorization and isolated ownership; unavailable delegation can use an honestly labeled sequential fallback. A status or review request remains read-only. PR creation, external messages, recurring work, deployment and merging follow the user's actual authorization.

## Requirements and validation limits

Most skills are instructions. Executable verification uses the target project's existing tools: a supported .NET SDK for C#, its Python environment, PowerShell or `cmd.exe`, or the web project's own stack. The bundled decision-log helper uses Python's standard library. GitHub operations prefer available `gh-axi` commands, with supported alternatives for gaps. Personal-style authoring uses Skill Creator when available.

Packaging validation passed for all 50 manifests and local references. Ten packaging regression/closure cases and six decision-log tests passed. Focused Python and Windows script fixtures, a real Electron/GitHub pilot, and bounded independent review/history/router evaluations supplied behavioral evidence. This does not establish every workflow or fresh-session discovery in every client. Real C# repository coverage remains incomplete. Orchestrate, Autopilot-full, Autopilot-stack and automatic worktree cleanup execution remain explicitly deferred in their guides.

## Credit and license

Original workflows: **Lauren Tan (poteto)**, [pstack in cursor/plugins](https://github.com/cursor/plugins/tree/e43c7ee26e0038c6c1fa8380dd34ce86ff94cb2a/pstack), version **0.15.9**, commit `e43c7ee26e0038c6c1fa8380dd34ce86ff94cb2a`. This adaptation replaces Cursor integration assumptions with Codex/Windows guidance, preserves qualified engineering principles, and adds standalone GitHub delivery. The original MIT copyright and permission notice are retained in [LICENSE.md](LICENSE.md).
