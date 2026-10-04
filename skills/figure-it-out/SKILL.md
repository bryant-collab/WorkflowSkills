---
name: figure-it-out
description: Design and execute a bounded, auditable phase recipe for a complex migration or multi-part engineering task when no narrower workflow fits.
---

# Figure it out

Create a concrete phase recipe before a substantial run, then execute within the user's scope and permissions. A specific task with an established workflow should use that workflow directly. This skill does not require a router, vendor model, background daemon, or special orchestration runtime.

Frame the goal as an observable definition of done using [prove-it-works](../principle-prove-it-works/SKILL.md). Ground it in repository state, rough work units, constraints, unknowns, and existing checks. State the rigor level and why consequences warrant it. Present the phases and expected proof before committing to an extended run; proceed with authorized reversible work. Obtain missing decisions only when they materially block the work.

Sequence independently verifiable units, with the riskiest unknown early and an appropriate pre-change baseline. Use the repository's existing verification commands first; build a new harness only for a real coverage gap. Use [architect](../architect/SKILL.md) for an unsettled consequential design; skip repeated design exploration over a settled mechanical change. Use [sequence-verifiable-units](../principle-sequence-verifiable-units/SKILL.md) to put checks near each change.

For each phase, write its hypothesis, smallest useful action, observable check, and stop condition. Bound uncertain loops by an explicit attempt or time budget appropriate to the task. At the bound, report the unresolved predicate and choose a justified new approach within scope or request the missing input; do not repeat indefinitely. Failure, inconclusive proof, and unavailable capabilities are distinct results, never passes.

Parallel work is optional and requires available, authorized delegation and isolated writable outputs. Inherit supported defaults and assign one owner for shared branch, delivery, ports, and process lifecycle. Use a sequential path when delegation is unavailable. Review actual artifacts rather than worker summaries. Undo only owned changes when an experiment fails, preserving unrelated edits and useful proof.

Keep the trail during execution through [show-me-your-work](../show-me-your-work/SKILL.md), which owns the log schema, helper, and audit. Record actual decisions and checkpoints while they happen, not an invented retrospective experiment narrative. Do not automatically commit the trail or widen delivery authorization.

Finally check the whole against the original definition of done, review scope and evidence, and report the designed phases, rigor, trail path, demonstrated outcomes, and open gaps. Use [correct](../correct/SKILL.md) where systematic correction is needed. Propose recurring checks under [encode-lessons-in-structure](../principle-encode-lessons-in-structure/SKILL.md); additional durable configuration or skill changes require their own authorized scope.
