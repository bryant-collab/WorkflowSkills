---
name: swarm
description: Coordinate bounded workers across coverage slices or competing attempts and consolidate evidenced results. Use for swarm requests or substantial parallel coverage, measurements, and races; small tasks can run directly.
---

# Swarm

Return one consolidated report against a defined done predicate. Use the actual session's delegation tools when available and authorized, not assumed cloud workers or a particular model. Otherwise perform the useful slices sequentially and disclose that they are non-independent checks by one agent.

## Frame and allocate

Define required outputs, coverage slices, baseline, and success criteria. Choose partitioned coverage, identical-brief race, or a mixture. For a race declare the selection rule before launching: first verified pass, rank all, or best-of against specified criteria. Count total workers separately from concurrency. Use a small justified count, and set a finite concurrency cap no larger than the runtime limit with a slot reserved for the lead. Queue excess workers. Handle ordinary small tasks directly.

Models inherit session defaults unless an authorized override is useful. Use only supported choices; disclose substitution or missing capability. Different workers or prompts do not establish model diversity or independent evidence.

Give every writer a disjoint directory or isolated worktree and an explicit allowed-write scope. A worker requiring build or Git state gets its own checkout and branch, not shared checkout ownership. Assign worktree and cleanup owners, separate mutable fixtures, ports, and processes. One integration owner controls the target branch and external delivery. Read-only review/status workers may inspect and report, but must not fix, post, commit, or push. Follow [separate before serializing shared state](../principle-separate-before-serializing-shared-state/SKILL.md).

## Brief and collect

Each brief stands alone: goal, intent, exact slice or race arm, baseline, permitted reads/writes, checks, output path, and evidence required. For commit verification name exact SHAs; for measurements name the method, sample count, what constitutes a sample, ordering, and environment constraints. Require the worker to record those identifiers and method in its result. Shared grounding must not include desired findings or another worker's conclusions when an independent assessment is intended.

Workers report `PASS`, `ISSUES`, or `BLOCKED` with evidence and all demonstrable issues in their slice. No evidence or missing required coverage is a gap, not a pass. Collect terminal results and inspect the underlying artifacts. Wait or cancel remaining work deliberately: under first verified pass, validate the winning evidence, stop unneeded workers, and account for their outputs before integrating. Do not leave writers running against resources being cleaned up.

## Aggregate and report

Reject results that omit required baseline or method; allow one bounded retry with the missing requirement restated. A second miss is an explicit gap. Investigate contradictory evidence against the exact baseline instead of voting. Coverage needs a valid result for every required slice; a race uses the declared selection rule. Dropouts do not count as success.

Return a compact table of slice/arm, baseline, status, evidence, and gaps; summarize deduplicated issues and the selection rule when used. A report's scope and evidence determine what it proves. Preserve proof artifacts and clean only owned resources after workers stop. Integration and external delivery happen only within the user's task authorization; a review or status request ends at the report.
