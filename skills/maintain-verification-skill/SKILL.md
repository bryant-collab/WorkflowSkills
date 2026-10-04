---
name: maintain-verification-skill
description: Reconcile an existing project verification skill and feature map with source and live behavior. Fix proven documentation or harness drift within its directory; report product regressions separately.
---

# Maintain a project verification skill

Locate the requested `.agents/skills/verify-*` skill or established verification directory. If no target exists, use [create verification](../create-verification-skill/SKILL.md) only when generation is requested; otherwise report the missing target. Clarify multiple indistinguishable targets rather than editing all of them.

Edit only the verification skill's directory: manifest, feature map, and its owned helpers. Product bugs remain findings, not concealed documentation changes. Read the generation workflow to understand its evidence and ownership invariants.

1. Reconcile the feature index with actual files. Remove broken links or duplicates based on evidence, and locate newly added user behavior in source before adding it to the map.
2. Trace each mapped feature's source entry points, behavior, likely drift, and one concrete live recipe. Use bounded read-only delegation if authorized and useful, with disjoint reports; otherwise inspect sequentially. Source readers do not drive the app or edit files.
3. Reconcile reports and combine overlapping live states. The coordinator owns driving; serialize access to shared instances. Follow the existing skill's launch model and health-check each fresh CLI session or server before driving.
4. Exercise every mapped feature and its required entry points. After a failed drive, doctor and reset/relaunch owned state where necessary. Keep proof outside scratch state throughout. Fix proven skill drift, retry the affected path once, and report a persisting blocker. Every changed harness path must be re-executed.
5. Distinguish doc drift, harness gap, and product regression. Unreachable coverage needs the attempted path plus the concrete missing prerequisite. It is not a pass; do not replace intended behavior with the broken product result.
6. Clean owned processes/state on all outcomes, then read the retained artifacts to prove cleanup preserved them. Never stop an unrelated process, reset a user's session, or remove unrelated files.

Report **clean** only when all required features have source and live coverage with no correction needed; **changed** for proven verification corrections; **blocked** for incomplete required coverage. A subset passing does not make the whole map clean. Keep exact commands, coverage status, failed/unreachable entries, and evidence locations in concise run notes.

Local maintenance does not imply committing, opening a PR, posting messages, merging, or scheduling recurrence. Deliver a PR of verified corrections only when that delivery is requested or already authorized, following repository conventions and current-head checks. A product fix requires separate authorized scope.
