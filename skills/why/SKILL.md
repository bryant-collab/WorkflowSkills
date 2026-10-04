---
name: why
description: Investigate the historical reasons for code, design choices, defensive checks, regressions, or thresholds using cited Git, ticket, pull-request, and repository evidence. Use how for runtime mechanics.
---

# Why

Answer what forces led to the code's shape. Keep the investigation read-only, including external sources. Do not modify files, open PRs, post messages, or change external state.

Read [confidence guidance](references/epistemics.md) before synthesizing. Use [how](../how/SKILL.md) only for mechanics needed to understand the target.

Anchor the question in verified files, lines, symbols, and relevant commits. State a scoped interpretation when the target is ambiguous. Start with Git history, linked tickets and PRs on the actual host, code comments, tests, and repository design documents. Follow the focused [history search guide](references/history-search.md). For GitHub, prefer documented gh-axi operations, then available GitHub connectors or gh for gaps; inspect command help rather than inventing flags. For Jira, discover available connector or configured CLI capabilities, or use supplied ticket text with its freshness limits. Do not assume acceptance criteria live in a particular field, or treat a ticket key in a commit message as verified historical evidence.

Trace the introduction and meaningful changes, including renames, instead of treating the latest touch as the original decision. Review diffs as well as messages. A PR reference in a commit subject is a lead to verify. Follow issue, incident, or design links when they bear on the question.

Use optional connected sources only when they are available, relevant, and within the requested project and time range. A complete answer from a PR does not require a seven-category search or agents. If a relevant source is unavailable, record the actual gap. Do not fabricate access or searches. For defensive code, look for incident or postmortem action items; temporal correlation alone does not prove causation.

Synthesize direct evidence separately from supported conclusions, weaker inferences, competing hypotheses, and unknowns. Preserve contradictions and test the user's proposed explanation independently. Cite each historical claim precisely. Explain what each indirect source contributes. Report the sources actually searched and material null results, with scope and access limits. Keep the answer proportional; a narrow direct answer need not have a full report structure.

When the question precedes a change, derive concise Preserve / Change / Avoid / Risk constraints from the evidence. These are planning inputs, not authorization to implement. Verify citations before delivery and keep confidence qualifiers during editing.
