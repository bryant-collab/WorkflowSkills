---
name: principle-outcome-oriented-execution
description: Apply to planned rewrites and migrations; prioritize a verified target state and isolate any temporary breakage to unpublished phases.
---

# Outcome-Oriented Execution

For a planned rewrite or migration, optimize for the intended end state and the checks that demonstrate it.

- Define the target behavior, compatibility requirements, and verification boundaries before removing old paths.
- Temporary breakage is acceptable only inside an isolated, reversible development phase.
- Keep each phase bounded and run the relevant checks before building further work on it.
- Required checks must pass at the published delivery boundary. Do not publish a known failing intermediate state as a completed change.
- Report skipped or blocked checks honestly; an intermediate plan does not make missing final evidence optional.

This principle does not authorize public breaking changes, delivery actions, or scope beyond the user's request.

