# Write a feature map from the user perspective

Create `features/README.md` as a concise index linking the feature files. Record baseline prerequisites, isolation, instance identity, evidence location, and reset conventions shared by the actual recipes. Include a reproduction or source path supporting every claimed user entry point.

Each feature file explains the behavior in a paragraph, followed by:

1. **Sub-features:** short stable IDs for observable behaviors, not implementation tasks.
2. **How to get to it (user POV):** actual menu, command, route, shortcut, or API entry points. Cover distinct entries explicitly.
3. **Driving it with the actual harness:** named prerequisites and exact commands/actions paired with observable results. Include independent persistence or side-effect observation when relevant.
4. **Gotchas:** actual prerequisites, reset needs, identity traps, or unreachable paths that affect this feature.

A status message alone may not prove persistence. A different entry point may not prove the listed shortcut. Failed authentication or entitlement is an unmet prerequisite with the attempted path recorded. Do not invent a universal number of features or fill headings with guessed commands.
