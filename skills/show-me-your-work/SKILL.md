---
name: show-me-your-work
description: Keep an evidence-linked decision trail for substantial multi-phase work, unattended runs, or a requested audit trail. Log consequential choices and checkpoints while they happen.
---

# Show me your work

Keep one project-scoped, append-only decision log. Use [plain language](../unslop/SKILL.md). Log consequential choices, verified checkpoints, actual pivots, reversions, and blockers, not every command. Small ordinary edits do not need a trail unless requested.

Choose a writable task artifact path in the current repository, such as `.audit/<task-slug>.tsv`, respecting its conventions. State the path and one owner before writing. Keep logs from different repositories separate. Do not change ignore rules or commit a log merely because this skill is used; include it in delivery only when requested or warranted by the agreed review artifact. Keep credentials and private transcript content out of the log.

The [format and bundled helper guide](references/decision-log.md) defines the schema and native Windows invocation. Copying this skill folder includes its helper. If Python is unavailable, write the same format directly with generated UTC timestamps and the same cell protections; disclose the fallback. Logging failure does not prove a decision was recorded.

Record only decisions and actions that actually happened. Evidence cells point to a commit, file and line, command output artifact, PR, Issue, or other resolvable source. The log records a claim; it is not independent proof of that claim. Mark untested results `NOT VERIFIED`, ambiguous measurements `INCONCLUSIVE`, and pending work `open`. Never invent pivots to make a run look rigorous.

At a new conversation or resumed run, read the relevant tail and append a `start` row identifying the run and prior rows being resumed, with a supported chat identifier or explicit session-summary pointer when available. A later turn in the same run needs another boundary only if another owner wrote meanwhile. Reserve `start` for run boundaries. Never fabricate an agent ID or transcript location.

Before handing back, reconcile this run's rows against visible tool outputs, actual artifacts, and accessible session summaries or supported chat history. Stay within the active repository and requested time window. If full history is unavailable, disclose that limitation and audit what is accessible. Missing real decisions may be added as explicitly retrospective entries timestamped now with cited earlier evidence; never backdate them. Incorrect rows get a new superseding row naming the original timestamp and correction, without deleting history.

For a substantial trail, an independent read-only reviewer is useful when available and authorized. Inherit supported defaults. A same-model reviewer is independent scrutiny, not cross-vendor review. If unavailable, self-audit and state the missing independent coverage without blocking ordinary delivery. Report the trail path, verification limits, and concrete attention flags with row timestamps and evidence; say no flags only within the coverage actually checked.
