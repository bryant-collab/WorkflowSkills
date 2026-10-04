---
name: principle-test-behavior-not-implementation
description: Apply when writing or reviewing tests; assert observable contract behavior while preserving meaningful failure and interaction cases.
---

# Test Behavior, Not Implementation

Prefer tests that call the code through a realistic boundary and assert the behavior a user or caller can observe.

- Use a concrete input and expected result, state change, file effect, or interaction.
- Keep negative, exception, and interaction tests when they prove an important contract.
- A mock call assertion can be useful when the interaction itself is the contract; otherwise assert the resulting behavior as well.
- Remove or rewrite tests that cannot fail for a defect, but judge each assertion in its language and context.

The JavaScript undefined-return heuristic can help spot vacuous assertions in JavaScript tests. It is not a universal deletion rule. Do not discard meaningful absence, exception, failure, or interaction coverage just because an assertion mentions undefined or is negative.

