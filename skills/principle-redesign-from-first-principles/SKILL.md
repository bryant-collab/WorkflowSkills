---
name: principle-redesign-from-first-principles
description: Apply when a new requirement changes an existing design; derive the simplest in-scope design that would satisfy it from the start.
---

# Redesign from First Principles

When a requirement changes the shape of a feature, API, or workflow, consider the design as if that requirement had been present from the beginning.

- Read the affected implementation and its contracts before choosing the target shape.
- State the new requirement and the invariant it introduces.
- Trace how the change affects types, callers, persisted data, documentation, and user-visible behavior.
- Compare the current design with the simplest design that satisfies the new requirement, then implement in reviewable increments.

Treat redesign as a way to find a coherent answer, not permission for an unrelated rewrite. Preserve public compatibility where consumers depend on it, and keep each change inside the requested scope.

