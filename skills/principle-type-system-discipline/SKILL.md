---
name: principle-type-system-discipline
description: Apply when shaping types or reviewing typed code; encode meaningful invariants while keeping external data runtime-validated.
---

# Type System Discipline

Use types to express domain distinctions, prevent contradictory states, and make incomplete handling visible to the compiler.

- Prefer explicit variants over combinations of fields that allow impossible states.
- Distinguish primitives with different meanings when interchange could cause a real error.
- Parse untrusted data into domain types at each relevant boundary.
- Avoid casts or assertions that merely silence a type error; prove the fact or represent the uncertainty.
- Use exhaustive matching where the language supports it, and derive shapes from authoritative schemas.

Python annotations and PowerShell parameter types do not enforce all runtime constraints. Validate external values where they enter, and keep type-driven structure proportional to the risk. Do not add precision that makes ordinary code harder to use without preventing a meaningful failure.

