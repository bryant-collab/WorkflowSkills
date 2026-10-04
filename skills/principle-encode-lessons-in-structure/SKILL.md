---
name: principle-encode-lessons-in-structure
description: Apply when a correction recurs; encode durable rules in the narrowest useful mechanism instead of repeating prose.
---

# Encode Lessons in Structure

When the same correction or failure recurs, decide whether the project can prevent it structurally.

- Prefer a type, schema, focused lint rule, canonical helper, or runtime check when it reliably prevents a meaningful repeated error.
- Use project guidance such as AGENTS.md for rules that still require judgment.
- Match the mechanism to the recurrence and risk; a one-off does not automatically justify a new abstraction or automation.
- Put the guard where future contributors encounter it, and verify its failure and success behavior.
- Keep exceptions visible and avoid encoding a rule broader than the evidence supports.

Capture the lesson in the smallest durable place that changes future decisions.

