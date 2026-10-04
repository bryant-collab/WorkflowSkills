# Lead judgment

Use full task context to decide, rather than counting votes. Reviewers may miss constraints, prior rejected approaches, temporary scaffolding, pending migration, or callers outside their slice. Trace disputed paths and check the exact reviewed snapshot.

- **Act on:** A demonstrated correctness, security, or material maintenance issue against the actual goals. Explain trigger, consequence, and why it should block or be fixed.
- **Consider:** A legitimate concern with uncertain cost/benefit or incomplete evidence. Name the tradeoff or missing check needed to decide.
- **Noted:** Valid observation with low impact or no current action. Explain the contextual reason.
- **Dismissed:** Incorrect, unreachable, already handled, outside scope, or a preference lacking a concrete consequence. Give the actual caller, invariant, constraint, or evidence that refutes it.

Verify input reachability before accepting null/type warnings. Static restrictions may settle a path in some languages; annotations may not prove runtime validation in others. Do not demand speculative interfaces or abstractions without a second real responsibility or benefit. A project-consistent pattern can still contain a bug: conventions inform assessment but do not disprove evidence.

Independently repeated findings prioritize investigation; agreement is not proof. Give lone security/correctness reports full scrutiny. Accept uncomfortable findings when they reveal a reachable path or an incorrect assumption. Never cap the number of real blockers to make a report look clean.

Deduplicate by cause, retain origin and explicit disagreements, and state what you inspected or executed. Keep actionable findings concise and show concrete rejected-findings rationale so the user can assess your judgment. A dismissed claim should not disappear silently. An unavailable check remains a gap, not a passed check.
