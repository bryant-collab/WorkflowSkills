# Feature

Translate the approved request into visible behavior and acceptance criteria. Inspect the affected subsystem with [how](../../../how/SKILL.md) when its contracts are nontrivial. Name the domain data, state owner, and integration boundary before introducing logic. Use [architect](../../../architect/SKILL.md) for consequential unresolved design choices; do not reopen approved product decisions without concrete conflict evidence.

Build the smallest complete user path, including required persistence and error behavior. Small changes run directly. Larger work separates prerequisites, independent outputs, and shared state before authorized delegation; one owner integrates shared contracts and delivery. Optional competing-design or adversarial-review skills are useful only when the task warrants them and their prerequisites are available.

Verify the visible result and relevant failure, cancellation, restart, or compatibility behavior with the project's actual checks and harnesses. Keep intermediate scaffolds private and required checks green at delivery boundaries. Continue through [Opening a PR](opening-a-pr.md) only when delivery is within scope. Report what users can now do, important choices, evidence, and unresolved criteria.
