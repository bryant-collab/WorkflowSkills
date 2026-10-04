# Pause safely

Use only when the user explicitly pauses or stops the work. Going away while asking the agent to continue is not a pause, and ordinary context compaction is continuity work.

Stop admitting new work and bring owned atomic operations to a safe boundary. Stop authorized delegates or processes through their owning interfaces when safe; preserve committed results and record uncertain outcomes. A pause does not authorize branch rewrites, merge, deletion, a new PR, or publication.

Write a durable checkpoint in the requested project location or existing decision trail. Include objective and steering, current branch/worktree, changed files, completed verification, remaining work, owned processes, and the first resume action. Preserve uncommitted edits; make a WIP commit only when that fits the user's authorization and repository rules. Do not stage unrelated changes.

Report the paused state and checkpoint location. Resume through [Session pickup](session-pickup.md).
