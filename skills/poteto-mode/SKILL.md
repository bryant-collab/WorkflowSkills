---
name: poteto-mode
description: Use the optional pstack work style and task router when the user asks for Poteto Mode, $poteto-mode, or this collection's deliberate engineering workflow.
---

# Poteto Mode

Support the user's requested outcome with concise explanations, simple code, and observable verification. This optional router does not make itself a rule for unrelated turns. A small, clear task can be completed directly, without a playbook, design panel, decision log, or delegate. Read-only questions stay read-only.

For a task that benefits from a workflow, select one guide below and read only that guide and its relevant dependencies. Inspect the repository's instructions and current state first. Scale planning and checks to the change; a function boundary alone does not require architectural exploration. An approved specification remains a constraint. If no guide fits a substantial task, use the installed `figure-it-out` skill if available, or compose a short plan from the actual acceptance criteria.

| Requested outcome | Selected playbook |
| --- | --- |
| Explain behavior or a historical decision | [Investigation](references/playbooks/investigation.md) |
| Reproduce and fix a defect | [Bug fix](references/playbooks/bug-fix.md) |
| Add or change behavior | [Feature](references/playbooks/feature.md) |
| Change structure while preserving behavior | [Refactoring](references/playbooks/refactoring.md) |
| Open or update an authorized PR | [Opening a PR](references/playbooks/opening-a-pr.md) |
| Inspect PR status once | [PR status](references/playbooks/pr-status.md) |

More specialized guides are available on request in [the extended routing reference](references/extended-routing.md). All guides ship inside this skill folder, with linked sibling skill dependencies supplied by the collection's packaging closure. Packaging every guide does not require reading every guide at runtime. Their presence is not evidence that an autonomous program, fresh installation, or client integration has been exercised. The deferred program modes explain their unmet prerequisites instead of starting a fleet.

Work within the user's scope and existing authorization. Routine reversible work can proceed; a router invocation does not authorize messages, recurring jobs, deployment, merge, destructive cleanup, or changes to global configuration. Publishing a PR follows the selected delivery guide when authorized. Do not make every task end in a PR.

Delegation is optional and requires the current task's authorization and exposed capabilities. Inherit model and reasoning defaults unless the user requests an override; confirm that any override is supported by the current client. Assign disjoint writable outputs and one owner for shared branch, delivery, and watcher state. The coordinator reviews results and checks evidence rather than forwarding a delegate's claims. Sequential self-review is useful but is not independent review or cross-model diversity.

Lead reports with the result and its effect for the user. Include relevant decisions, exact checks, and material gaps. Use plain prose and only links read or produced in this task. Preserve meaningful documentation and constraints when reviewing comments. Load a principle skill only when it changes a real decision; do not recite every principle or force a `no-mistakes` pipeline.
