---
name: principle-guard-the-context-window
description: Apply when reads or outputs threaten to crowd out task context; keep useful summaries and checkpoints instead of carrying bulk.
---

# Guard the Context Window

Use the available context for the decisions that matter to the current task.

- Read focused ranges and search for named symbols before loading whole large files.
- Summarize relevant findings instead of retaining repeated raw outputs.
- For long-running work, preserve a compact checkpoint with decisions, evidence, and next steps.
- Treat compaction as a possible transition to a fresh working window, not as a reason to claim that work cannot continue.
- Delegate only when delegation is available, authorized, and worth the coordination cost; give independent work clear write boundaries.

Keep the main task state recoverable without flooding it with unrelated material.

