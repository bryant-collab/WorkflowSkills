# Review rubric

Apply the lenses that change the assessment; a small fix needs no forced architecture essay.

- **Correctness:** Does the reachable happy and failure path meet the intent? Trace empty inputs, boundaries, encoding, numeric behavior, concurrent state, and errors. For partial failures and repeated operations inspect reconciliation/idempotency. Distinguish impossible inputs from actual runtime boundaries; annotations alone may not validate Python or PowerShell inputs.
- **Root cause:** Follow callers, callees, definitions, and sibling behavior. Does a guard, retry, cast, or fallback repair the responsible contract or conceal a violated invariant? Prefer a concrete structural constraint when it removes a demonstrated failure; do not broaden scope into an unrelated redesign.
- **Structural integrity:** Assess ownership, validation boundaries, layering, dependencies, data/access patterns, and coupling. Do not demand an abstraction for simple code. Coordinate internal migrations when all consumers are known; public APIs, commands, file formats, and integrations may require compatibility or staged migration.
- **Verification:** Inspect behavior tests and real integration paths rather than trusting proxy status or worker summaries. A bug fix benefits from a meaningful regression. Negative, exception, and interaction tests can prove behavior. Record missing required coverage and exact artifact/commit identity.
- **Complexity budget:** Identify concrete removable branches, unused configuration, dead paths, wrappers, and duplication with a canonical home. Explain the maintenance or behavioral cost. Preserve compatibility scaffolding still serving real consumers; delete it only when migration is actually complete.
- **Security:** Trace untrusted input to sensitive sinks and permissions. Inspect authentication, authorization, secrets, output disclosure, and time-of-check/time-of-use paths. Name the reachable exploit or exposure, not a speculative dangerous API in isolation.

Shared mutable files, branches, ports, and data need structural ownership, isolation, or genuine synchronization. Multiple worker reports do not substitute for inspecting output evidence.
