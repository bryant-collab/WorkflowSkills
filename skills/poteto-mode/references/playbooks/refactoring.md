# Refactoring

Pin the observable behavior and consumers before moving structure. Use existing meaningful tests, a characterization fixture, or an equivalence harness proportionate to the change. [How](../../../how/SKILL.md) can clarify the contract; [architect](../../../architect/SKILL.md) can compare consequential new boundaries.

Move in small steps and keep the behavior pin passing. Preserve public APIs, formats, external consumers, and documented compatibility unless migration is explicitly authorized. Internal callers can migrate together when they are the complete consumer set. Search strings, help, docs, and back-references after renames. Useful comments and defensive behavior survive the move.

Measure whether the new shape reduces hidden state, coordination, or reader effort. Separate newly discovered behavior changes from the promised refactor. Run appropriate repository checks and equivalence proof; avoid a new harness that only mirrors implementation. Use [Opening a PR](opening-a-pr.md) when authorized. Report the changed structure, preserved contract, proof, and any compatibility gap.
