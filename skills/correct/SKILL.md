---
name: correct
description: Turn evidenced repeated engineering mistakes into structural prevention in a requested repository correction pass. Choose architecture, types or runtime validation, lint, behavioral tests, then focused AGENTS.md guidance for judgment rules.
---

# Correct repeated mistakes

Read accessible commits, reverts, review evidence, relevant agent rules, and workaround comments. Group proven mistakes into classes. A repeated class requires at least two observed occurrences; one correction alone is not proof of a recurring project-wide failure. Do not scan unrelated chat history or invent lessons.

Choose the highest effective prevention level within scope:

1. Eliminate the bad path through ownership, a single authoritative source, or an interface difficult to misuse. Preserve public compatibility when internal callers are not the whole consumer set.
2. Encode invariants in the language's types where enforceable. Python annotations and PowerShell parameter types still require runtime boundary checks. Do not remove necessary defensive behavior on the assumption that annotations prove it.
3. Use existing lint/analyzer or CI mechanisms when they can catch the class. Make the error actionable. For established violations, prevent new violations when broad cleanup is outside scope.
4. Test actual observable behavior. Negative, exception, and interaction tests are legitimate; never delete one just because of its assertion shape.
5. Put remaining judgment calls in a focused `AGENTS.md` rule. See [encode lessons in structure](../principle-encode-lessons-in-structure/SKILL.md).

Prove each new enforcement check fails on a real past mistake, then passes on the corrected implementation. Prefer disposable copies or focused replay; do not revert unrelated work. Use the same project-native check in local and CI contexts where supported. Record any CI proof still pending.

Track rules and their actual enforcement location only when the table adds value to the repository. Remove redundant guidance after structure makes the mistake impossible. Exceptions need a concrete reason and the repository's existing exception policy; do not invent universal expiry or approval requirements.

Return each class with evidence, chosen prevention level, why stronger options were unsuitable, and failing/passing proof. A redesign principle does not authorize unrelated rewrites, global settings, or branch protection changes.
