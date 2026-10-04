---
name: principle-minimize-reader-load
description: Apply when code is hard to trace; reduce needless indirection and hidden mutable state while keeping useful boundaries and documentation.
---

# Minimize Reader Load

Make it easy for the next reader to answer where a value comes from, who can change it, and which rule applies.

- Reduce pass-through layers and one-caller wrappers when they hide no meaningful decision.
- Keep boundaries that own a real invariant, isolate a dependency, or hide substantial complexity.
- Prefer narrow state scope and derived values over synchronized mutable copies.
- Name an invariant at the boundary that establishes it instead of repeating the rule in every consumer.
- Preserve useful comments, API documentation, help text, and explanations of platform-specific behavior.

Before removing an abstraction, confirm that the replacement remains as clear to its actual users and maintainers.

