---
name: create-verification-skill
description: Generate and execute a project-local verification skill for an application's real CLI, API, browser, or desktop paths using its existing launch commands and observable evidence.
---

# Create a project verification skill

Inspect the target repository's instructions, runtime configuration, documented commands, and existing checks. Identify the user-facing interfaces, launch prerequisites, available driving tools, observable effects, isolation options, and cleanup ownership. Ask only for missing information that affects execution. Do not impose a language stack or auto-install dependencies.

Run the existing launch/build path before writing instructions around it. Report a broken baseline precisely; fixes outside the requested scope are separate work. Declare unsupported interfaces. Native desktop driving unavailable means executable non-UI proof plus [a concrete manual coverage recipe](references/windows-verification.md), not full UI verification.

Write `.agents/skills/verify-<app>/SKILL.md` for the requested project. Use a valid manifest with the actual app name and discriminating description. Check existing skill names first; preserve an existing skill or reconcile it rather than overwriting blindly. Generation of a requested project-local skill includes that local destination; it does not install this collection globally.

Ground these sections in actual source and commands, without placeholders:

- **Launch:** exact command, directory, environment, build identity, readiness criterion, bounded timeout, and instance ownership. Short-lived CLIs start fresh per drive. Servers need distinct ports/data when available.
- **Doctor:** read-only health and identity check before driving, after unexpected behavior, and for each new short-lived session. Confirm that the process or endpoint belongs to this run. A healthy process with a wedged UI requires resetting or relaunching owned state.
- **Drive:** actual commands or stable selectors, preconditions, realistic user inputs, and expected visible/persistent effects. Use existing harnesses first. A dry-run label is not proof it avoids network or filesystem writes; observe the effects.
- **Evidence:** commands, stdout, stderr, exit codes, response bodies, action/result screenshots, logs, and second-view persistence checks as relevant. Capture what the user did and what resulted. Record build/revision and feature/entry-point identity. Keep proof outside disposable state.
- **Cleanup:** remove only owned instances and scratch state on both success and failure. Use retained process handles/PIDs with identity checks, never kill by name. Resolve and check absolute scratch paths before recursive removal. Preserve evidence and unrelated sessions.
- **Helpers:** introduce a script only for a demonstrated recurring need or fragile deterministic operation. Document its explicit invocation and run it. Supporting scripts live with the generated skill unless several real consumers justify sharing.

Use [Windows execution guidance](references/windows-verification.md) only for the relevant language. Build a feature-map index and one file per meaningful user feature, with reachable entry points and unmet prerequisites. The [feature-map format](references/feature-map-format.md) keeps the user perspective distinct from implementation details.

Execute the generated instructions end to end: launch, doctor, drive at least one mapped feature, capture evidence, cleanup, and read the evidence after cleanup. Failed iterations also clean owned state. Fix instruction/helper drift and rerun the changed path. Unexecuted instructions remain a draft. Record unsupported/unreachable paths without substituting a different path as proof.

Return the generated location, executed feature and commands, retained proof, and coverage gaps. [Maintain verification](../maintain-verification-skill/SKILL.md) is a separate on-demand pass; do not create recurring jobs.
