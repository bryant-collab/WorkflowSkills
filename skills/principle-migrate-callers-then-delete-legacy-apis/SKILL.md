---
name: principle-migrate-callers-then-delete-legacy-apis
description: Apply when replacing an internal API; migrate its owned callers together and remove the old path only when compatibility is not required.
---

# Migrate Callers Then Delete Legacy APIs

For an internal API whose callers are all owned by the same change, inventory and migrate those callers before removing the old entry point.

- Confirm who consumes the API, including scripts, tests, generated code, and repository integrations.
- When no external compatibility obligation exists, update the callers and remove the old internal path in one coherent change.
- Keep temporary adapters only when they serve a documented migration need, and define when they can be removed.
- Update tests to prove the new contract rather than protecting an implementation detail.

Public libraries, CLI consumers, persisted file formats, plugins, and external integrations may need compatibility and staged migration. Check that boundary before deleting an old path; a coordinated internal refactor does not justify breaking unknown consumers.

