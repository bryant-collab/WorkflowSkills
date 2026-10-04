---
name: principle-make-operations-idempotent
description: Apply when commands or state changes may be retried after interruption; make reruns converge safely to the intended state.
---

# Make Operations Idempotent

For a command, lifecycle step, or processing loop that can be retried, define the intended end state and what happens after partial completion.

- Ask what a second run does and what state a crash could leave behind.
- Reconcile with existing state before creating another resource or applying a duplicate effect.
- Use stable identities and content-based comparison where order or timestamps are unreliable.
- Make cleanup ownership explicit; remove only artifacts created by the current operation or otherwise authorized for removal.
- Check native command exit codes and partial failures in scripts rather than assuming a successful wrapper call means the operation completed.

Use a lock or recovery protocol when shared state requires one. Do not make destructive cleanup broader than the operation owns.

