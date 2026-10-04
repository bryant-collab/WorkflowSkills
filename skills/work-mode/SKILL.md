---
name: work-mode
description: Route explicitly identified work sessions or work repositories through Jira-grounded C# engineering, evidence-based verification, and a strict no-merge policy. Does not apply work policy to personal or home projects.
---

# Work mode

Use this router when the user requests work mode, identifies the session as work, or repository instructions establish that it is a work repository. Jira or C# alone does not establish that every project is work. Keep this policy scoped to that session or repository; do not impose it on unrelated personal work.

**Never merge a work PR or enable auto-merge, even when asked.** This includes equivalent hosting APIs, queued merges, and commands that complete the merge indirectly. Prepare and verify the change and leave the merge to a human. Explain this work policy briefly if a requested action conflicts with it. PR delivery and babysitting are available according to the repository's selected installation policy; when disabled, hand off and offer the corresponding add-on instead of bypassing the policy through another skill or direct tool calls.

Read repository instructions, Git state, and the actual solution layout before changing code. Use [Jira workflow](../jira-workflow/SKILL.md) when the task has a ticket. Requirements come from Jira or supplied ticket text; the Git host remains the repository's actual host. A small well-defined change can proceed directly. Do not create a mandatory design ceremony, GitHub Issue, PR, or persistent verification skill for every ticket.

| Need | Engineering skill |
| --- | --- |
| Trace behavior, decisions, or explain a subsystem | [how](../how/SKILL.md), [why](../why/SKILL.md), [teach](../teach/SKILL.md) as needed |
| Resolve meaningful interface or ownership choices | [architect](../architect/SKILL.md) |
| Plan substantial work with unclear implementation | [figure-it-out](../figure-it-out/SKILL.md) |
| Reproduce and fix a defect | [tdd](../tdd/SKILL.md) when a behavioral regression is practical |
| Check callers, contracts, and affected components | [blast-radius](../blast-radius/SKILL.md) |
| Requested adversarial review | [interrogate](../interrogate/SKILL.md) |
| Reusable repository verification is needed | [create-verification-skill](../create-verification-skill/SKILL.md) or [maintain-verification-skill](../maintain-verification-skill/SKILL.md) |
| Write handoff, docs, or a PR description | [technical-writing](../technical-writing/SKILL.md), [comment-quality](../comment-quality/SKILL.md), [unslop](../unslop/SKILL.md) as relevant |
| Resume an established task | [recall](../recall/SKILL.md) |

Read [C# changes and verification](references/csharp.md) for implementation or code review in a .NET repository. Apply [model the domain](../principle-model-the-domain/SKILL.md), [type system discipline](../principle-type-system-discipline/SKILL.md), [boundary discipline](../principle-boundary-discipline/SKILL.md), [make operations idempotent](../principle-make-operations-idempotent/SKILL.md), [fix root causes](../principle-fix-root-causes/SKILL.md), and [prove it works](../principle-prove-it-works/SKILL.md) when they change an actual decision. Do not load every principle for a routine edit.

For requested PR delivery, offer the separately installed `pr-delivery` skill by name when available; it is optional and does not belong to this router's dependency closure. An authorized delivery request can also use the host's existing tools and repository conventions directly. Preserve the no-merge rule in either path.

There is no monitoring by default. A one-time status check is not a watcher. Only on an explicit monitoring request, offer the separately installed `pr-babysit` skill by name when available, or perform a bounded watch through available capabilities. Maintain one watcher owner for the same work PR; reuse or replace an existing watcher instead of adding a second loop. A watcher must never merge or enable auto-merge. Report inability to start a requested watcher rather than claiming it is running.

Return the implemented behavior, Jira acceptance evidence, checks and material gaps, and the current delivery state. Keep internal orchestration out of ticket and PR prose.
