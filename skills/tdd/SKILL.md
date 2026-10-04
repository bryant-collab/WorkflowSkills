---
name: tdd
description: Demonstrate a defect failing before and passing after a fix when the user asks for TDD or a regression test, or an obvious cheap local test target exists. Use concrete runtime evidence when adding a test is impractical.
---

# TDD bug fix

Identify intended behavior, actual behavior, and the smallest user-observable reproduction. Prefer the existing nearest unit, component, or integration test. Avoid broad harness setup, brittle mocks, fixture churn, or production-only infrastructure just to satisfy this workflow.

1. Write the smallest practical behavioral regression before changing product code.
2. Run it against the broken implementation. Confirm failure for the intended reason. A missing tool, broken fixture, or import failure is not red evidence for the defect.
3. Make the smallest justified fix while preserving nearby contracts.
4. Rerun the same regression, then the repository's appropriate affected checks.

Do not weaken expectations to match incorrect behavior. Negative, exception, and interaction tests can demonstrate real contracts; evaluate their observed behavior rather than assertion syntax or a JavaScript `undefined` heuristic. See [test behavior](../principle-test-behavior-not-implementation/SKILL.md) when selecting assertions.

If a new test is impractical, use a focused executable script, command reproduction, browser interaction, or concrete manual recipe. Keep evidence status precise: a manual recipe is pending until someone executes it. Report the exact failing-before and passing-after command and relevant output, or explain the gap and closest useful proof. A regression commit need not merge separately; published delivery checks must pass.
