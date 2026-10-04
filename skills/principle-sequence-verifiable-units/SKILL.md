---
name: principle-sequence-verifiable-units
description: Apply to multi-step edits, migrations, and delivery; divide the work into units that can each be checked before continuing.
---

# Sequence Verifiable Units

For a sweep, migration, or multi-phase task, order work so each unit ends in a state that can be checked.

- Establish the relevant baseline when practical.
- Make one bounded change, run its targeted check, and record the outcome before layering on more work.
- Stop to understand a failure instead of hiding it in a larger batch.
- Arrange commits or review units so the evidence tells a coherent story when delivery is in scope.

A planned intermediate failure may exist inside an isolated, reversible development phase. Required checks must pass at the published delivery boundary. Do not create or merge a failing regression commit as a standalone deliverable merely to preserve a red-before-green story.

