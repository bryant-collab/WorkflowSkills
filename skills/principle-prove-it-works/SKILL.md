---
name: principle-prove-it-works
description: Apply before reporting completion; check the real changed artifact or user path and match the claim to the evidence.
---

# Prove It Works

Verify the result through the project’s existing, relevant checks and the actual artifact or user path required by the claim.

- Read back the changed files and inspect the diff for scope and correctness.
- Run the smallest appropriate project-native check, then the broader required checks for the delivery boundary.
- Exercise a changed runtime path when compilation or a unit test alone cannot establish the behavior.
- Observe actual output, state, or side effects rather than inferring them from a cache, timestamp, or self-report.
- Report what passed, failed, was skipped, or could not be checked.

Do not create or run a broad suite for a trivial task when it would add no useful evidence. A validator can establish packaging or syntax without proving that a workflow behaves well.

