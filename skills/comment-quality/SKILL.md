---
name: comment-quality
description: Review or improve comments and documentation in a supplied diff or file scope while preserving public docs, legal notices, operational constraints, and useful explanations.
---

# Review comment quality

Use the caller's files or diff. Otherwise identify the actual repository base and review the current task's changes, preserving unrelated edits. A review-only request produces findings; a cleanup request permits focused comment edits. Do not assume `main` or create a PR automatically.

Classify a comment by its consumer and purpose before changing it. Preserve C# XML documentation, Python docstrings, PowerShell comment-based help, batch usage guidance, public examples, licenses and attribution, security or compatibility constraints, suppression rationales, generated-file markers, and non-obvious explanations of why behavior exists. Missing enforcement does not make a constraint disposable. Uncertain provenance or intent calls for investigation, not deletion.

Remove or rewrite redundant narration, stale descriptions, and misleading claims when the scope allows. Correct a factual claim against the source and relevant history. Review TODOs and suppressions on their merits; do not delete one solely because it is a comment, a negative statement, or an intentional workaround. Preserve necessary defensive behavior and tests.

Where repeated explanatory comments expose a structural problem, report the smallest interface, validation, test, or lint improvement that would make the rule easier to maintain. Implement code changes only when the user's scope authorizes them. Encoding a constraint must preserve its observable protection and consumer documentation; a test is not a substitute for API help or a license.

Use [how](../how/SKILL.md) for an unclear mechanism and [why](../why/SKILL.md) when historical motivation matters. A separate reviewer is optional when authorized; the owning agent checks every proposed deletion. No named role or model is required. Return concrete findings with file/line, purpose, recommended edit, and any unresolved constraint. For implemented cleanup, summarize checks and retained documentation rather than using deletion counts as a quality score.
