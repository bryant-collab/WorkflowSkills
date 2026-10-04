---
name: arena
description: Compare multiple candidate artifacts for a substantial unresolved design or implementation choice, select a base, and synthesize verified strengths. Use for arena requests or when competing shapes materially affect the result; handle small tasks directly.
---

# Arena

Produce one coherent artifact and a short synthesis record. Multiple attempts are candidate generation, not proof of model diversity, independence, or correctness.

## Frame the contract

State the artifact, acceptance criteria, scope, and fixed constraints. Preserve an approved design, supplied reference, or product decision; compare only unresolved options. Reopen a fixed choice only on concrete acceptance or safety conflict, and report the conflict. Derive a small rubric of observable criteria before evaluating candidates. Give each candidate the same task and grounding; keep the evaluation rubric for the lead and judge unless its criteria are task requirements.

Choose a bounded candidate count and a stop condition before launch. Two or three candidates usually suffice; a routine small change should run directly. Select models only from the actual runtime and user-authorized choices, inheriting defaults unless an authorized override has a purpose. Unsupported choices are disclosed gaps or supported fallbacks, never invented vendor diversity.

## Generate with isolated ownership

Delegation is optional and requires available tools and session authorization. Cap simultaneous workers at the smaller of the session limit and the planned cap, reserving the lead's slot; queue remaining candidates. Do not spawn nested teams without authorization. If delegation is unavailable, generate bounded sequential alternatives in separate notes and identify the result as one agent's non-independent exploration.

Give each writer a disjoint output directory or isolated worktree, exact baseline, verification method, and rationale deliverable. For code that needs a whole checkout, use separate worktrees rather than separate files in a shared mutable checkout. Name each worktree's owner and lifecycle owner. Allocate separate ports, data, caches, and owned processes when relevant. Workers may write only their assigned outputs and must not change the integration branch or deliver externally. One lead owns integration and any authorized delivery. Apply [separate before serializing shared state](../principle-separate-before-serializing-shared-state/SKILL.md).

Brief each candidate to produce the artifact and a concise rationale naming rejected alternatives. Collect actual artifacts after completion; a summary is insufficient. A missing candidate is a dropout, not a successful comparison. Preserve useful outputs and proof; clean up only owned temporary resources, using managed lifecycle tools for managed worktrees.

## Judge, select, and synthesize

Read every completed candidate end to end and score each criterion. When authorized and useful, give a separate read-only judge the rubric and frozen candidate paths after writers finish; do not expose the lead's preferred answer. A judge may share the same model: describe the actual setup, and do not call it cross-vendor evidence. Resolve disagreement by inspecting evidence and rationale; agreement alone does not validate the pick.

Select the base that meets acceptance criteria with the clearest boundaries and least maintenance burden. Inspect losing candidates for specific improvements, adapting each into the base's coherent design rather than mechanically pasting. Use [redesign from first principles](../principle-redesign-from-first-principles/SKILL.md) when integration reveals incompatible mental models. Similar candidates indicate convergence, not exhaustive search or correctness. If divergence exposes an underspecified contract, clarify the disputed constraint and rerun only within the agreed budget; do not average incompatible designs.

Verify the integrated artifact using repository-native checks and the relevant user path, following [prove it works](../principle-prove-it-works/SKILL.md). Distinguish failed framing from an integration mistake and correct that cause. Recheck after grafts; earlier candidate checks do not prove the synthesized artifact.

Return the artifact and a synthesis note naming the rubric, base and reason, judge setup/verdict if used, graft sources, concrete rejections, dropouts, verification results, and remaining gaps. Design-only or review-only requests remain reports; this workflow does not grant permission to fix, post, push, publish, or merge.
