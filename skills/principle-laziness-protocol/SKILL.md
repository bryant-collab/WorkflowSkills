---
name: principle-laziness-protocol
description: Apply when refactoring or reviewing scope and tempted to add layers, abstractions, or state; seek the smallest clear change that meets the request.
---

# Laziness Protocol

Choose the simplest change that meets the request, project contracts, and required quality. Prefer removing proven complexity before adding more.

- Keep the diff small, but not at the cost of clarity, compatibility, or required behavior.
- Do not abstract merely because two lines look alike. Add a layer when it removes more complexity than it creates.
- Check for redundant state, pass-through wrappers, and duplicated decisions before threading new signals through a system.
- Preserve useful documentation, comments, help text, license notices, and justified suppressions.
- Build a helper or prototype when its concrete benefit exceeds its cost; leave routine small edits direct.

A root-cause fix still needs to stay within the authorized scope. See [Build the Lever](../principle-build-the-lever/SKILL.md) when a repeatable tool would materially improve throughput or reviewability.

