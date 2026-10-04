---
name: principle-fix-root-causes
description: Apply when debugging a reproducible defect; trace evidence to the cause and correct it without expanding beyond the authorized scope.
---

# Fix Root Causes

Start from a reproducible symptom and follow the evidence to the cause before choosing a correction.

- Capture the failure and its relevant inputs, state, or logs.
- Trace the causal path and check for related instances of the same defect.
- Correct the cause when it lies within the authorized scope; do not replace evidence with a guess or a guard that merely silences the symptom.
- Preserve defensive checks that protect real external boundaries or independent invariants.
- Re-run the failing case and the relevant existing checks.

If the suspected cause points to unrelated work, explain the boundary and ask before expanding scope. A root-cause principle does not authorize an unrelated rewrite.

