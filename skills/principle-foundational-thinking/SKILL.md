---
name: principle-foundational-thinking
description: Apply before choosing core data shapes, ownership, concurrency boundaries, or work sequence; make later behavior clear from the foundation.
---

# Foundational Thinking

Before writing complex behavior, identify the core requirements, data shapes, access patterns, owners, and concurrency assumptions.

- Shape types and collections around the real domain and dominant reads or writes.
- Ask which actors can mutate shared state and whether their writes can be independent.
- Put scaffolding first only when it benefits the later phases; avoid turning a small task into a platform project.
- Prefer explicit code to clever code. Similar lines can stay similar without gaining an abstraction.
- Plan verifiable increments. If an intermediate phase must break compatibility, isolate it and make the required checks pass at the delivery boundary.

Use structure to make the next behavior obvious, not to anticipate every imagined future.

