---
name: principle-separate-before-serializing-shared-state
description: Apply when concurrent work might write the same mutable resource; isolate independent ownership before adding locks or sequencing.
---

# Separate Before Serializing Shared State

When two actors might write the same file, branch, key, or state object, determine whether they really need one shared write target.

- Give independent work separate owned outputs, scratch data, branches, or state files, then combine results at a deliberate boundary.
- If one canonical mutable resource is a real invariant, enforce single-writer ownership, atomic updates, or an appropriate lock.
- Prefer structural concurrency control over instructions that merely ask actors to avoid collisions.
- Keep delivery ownership explicit for shared branch changes and external writes.

A lock is not the default design. First check whether separating the work removes the race and makes failures easier to inspect.

