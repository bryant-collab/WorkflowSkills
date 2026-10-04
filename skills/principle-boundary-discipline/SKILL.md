---
name: principle-boundary-discipline
description: Apply when handling external data, errors, or framework wiring; validate at real boundaries and keep internal business logic focused.
---

# Boundary Discipline

Validate, parse, and handle failures where data or control crosses a real system boundary: CLI arguments, environment variables, files, databases, network requests, IPC, and native process calls.

- Convert raw input into domain values at the boundary.
- Keep business rules in focused functions that can be understood and tested without framework wiring.
- After a boundary establishes an invariant, avoid repeating the same defensive check at every internal call.
- Add an internal guard only when a separate invariant, concurrent mutation, or untrusted call path requires it.

Static annotations and parameter types are not runtime validation. Python annotations do not reject invalid values by themselves, and PowerShell types do not validate every semantic constraint. Validate actual boundary inputs and preserve necessary defensive checks without adding speculative guards.

