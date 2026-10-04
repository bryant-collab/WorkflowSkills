---
name: principle-subtract-before-you-add
description: Apply when evolving or simplifying a system; remove verified dead or redundant complexity before building on it.
---

# Subtract Before You Add

Before adding a layer, option, validator, or workflow, look for complexity that can safely be removed.

- Confirm that code, configuration, documentation, and tests are truly obsolete before deleting them.
- Simplify from observed requirements and actual callers, not speculative edge cases.
- Preserve useful C# XML documentation, Python docstrings, PowerShell comment-based help, batch shell-quirk explanations, license headers, and justified suppressions.
- Keep tests that protect negative, exception, and interaction behavior even when their assertions do not resemble a simple success case.
- Preserve compatibility obligations for public APIs, CLI consumers, file formats, and external integrations.

Subtraction is a way to reduce the cost of the requested change, not a reason to broaden it. For internal API cleanup, see [Migrate Callers Then Delete Legacy APIs](../principle-migrate-callers-then-delete-legacy-apis/SKILL.md).

