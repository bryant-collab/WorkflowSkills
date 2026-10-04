---
name: architect
description: Design significant interfaces, ownership, or module boundaries before implementation. Use for architecture requests and changes whose shape needs competing alternatives; ordinary small edits can proceed directly.
---

# Architect

Ground the design in the actual system using [how](../how/SKILL.md). Use [why](../why/SKILL.md) when replacing ownership or layering so historical constraints survive. Greenfield work still needs integration requirements, consumers, and deployment constraints.

Write caller usage before types and signatures. Sketch the smallest design that supports those calls; identify domain data, validation boundaries, state ownership, error paths, and compatibility. Python annotations and PowerShell parameter types do not prove runtime invariants. Public libraries, commands, formats, and integrations may require staged compatibility even when internal callers can migrate together.

For substantial unresolved designs, develop at least two structurally distinct alternatives before choosing. Treat an explicitly approved design, supplied reference, or fixed product decision as a constraint; compare alternatives only for remaining implementation choices. Reopen it only when evidence shows an acceptance or safety conflict, and report that conflict. The core path is bounded sequential exploration in separate notes. Parallel candidates are optional only when delegation is authorized and available, with disjoint output directories. No advanced workflow, named role, particular model, or vendor diversity is required. Never claim sequential self-review is independent review.

Screen candidates using [design red flags](references/design-red-flags.md). Compare the complexity hidden behind each public interface, access patterns, ownership, migration cost, and realistic failure modes. Synthesize one coherent design using [the rationale format](references/rationale.md); avoid grafting incompatible candidate pieces together.

Proceed with implementation when it is within the request. Stop at a design checkpoint only when requested or a required unresolved decision prevents safe progress. Explanation or design-only requests remain design-only. Keep temporary scaffolds and planned breakage in isolated development; required checks pass at published delivery boundaries.

Implement against the sketch. Repeated deviations of the same kind, callers coordinating internals, or duplicated state ownership are evidence to reconsider it. One edge case is not permission for an unrelated rewrite. Re-ground and compare alternatives again when the architecture actually fails. Read [redesign from first principles](../principle-redesign-from-first-principles/SKILL.md) or [subtract before you add](../principle-subtract-before-you-add/SKILL.md) only when that decision arises.

Return the recommended shape, caller usage, meaningful rejected alternative, compatibility plan, and the evidence still needed. If implementing, verify the resulting user path through the repository's native checks.
