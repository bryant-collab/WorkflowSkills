---
name: recall
description: Recover recent project-scoped working context from accessible chats or session summaries and reconcile it with current Git, GitHub, and repository state before resuming work.
---

# Recall

Return a current-state brief, not invented memory. Use an adequate user-provided state capsule directly rather than searching for the same information again. A request for a retrospective summary may end with the brief; it does not authorize implementation, external messages, or durable memory edits.

State the repository, topic, and time window before searching. Default an unspecified recent window to the last seven days in the user's timezone; honor an explicit broader range. Stay in that repository unless the user explicitly requests others. Verify repository identity and referenced branch/PR ownership rather than relying on a similar chat title.

Use supported Codex chat-list/read access when available, narrowing by project and topic before reading relevant turns. Read session summaries or explicit handoff artifacts if raw history is unavailable. Do not infer private transcript paths, scan global chat stores, or use UUID order as recency. Exclude irrelevant evaluation and agent chatter. If no accessible record exists, state the gap and use live state; request a missing handoff only when necessary to resume safely. Summaries cannot prove commands or side effects they omit.

For a named subsystem, feature, or bug, also examine Git history, repository docs, linked GitHub Issues and PRs using [why](../why/SKILL.md), steering the question toward current state, failed prior fixes, and remaining reports. Keep optional connected sources limited to relevant authorized scope and disclose unavailable sources. Pure activity recall without a named code target can use scoped chat evidence and live state alone.

Reconcile each surfaced branch, commit, PR, and Issue against live read-only evidence. A prior chat saying tests passed does not prove the current head passes; a planned edit is not completed work. Preserve contradictions, reverted fixes, uncommitted changes, and stale evidence. Use supported GitHub tools or actual command help for available CLI operations; do not invent tools or flags.

Lead with a capsule of at most five bullets, then concise topic threads with evidence-backed states such as merged, open PR, in flight, verified uncommitted, reverted, planned, or unknown. Include up to five recurring problems and one concrete next move. Cite real chat IDs or summary paths and Git/PR/Issue sources. Use `unknown` when a state cannot be established rather than forcing a completion label. Keep adjacent work out unless it blocks this topic. Use [unslop](../unslop/SKILL.md) for concise prose and sanitize private context before any separately authorized public output.
