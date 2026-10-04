---
name: interrogate
description: Challenge code changes with adversarial review and synthesize verified, deduplicated findings using lead judgment. Use for interrogate, adversarial review, stress testing code, or finding blind spots; deliver a report without automatically applying changes.
---

# Interrogate

The deliverable is a review verdict first. Do not fix files, post feedback, push, or open a PR from a review-only request. Further action needs task authorization; authorization already given in the session persists within its scope.

## Establish scope and intent

Use the user-selected diff/files. Otherwise identify the actual repository base and relevant changes, including requested uncommitted work; do not assume a branch called main. Record exact head/base SHAs and working-tree state, or the file snapshot being reviewed. Gather callers, types, tests, and constraints needed to assess the change. Separate pre-existing problems from regressions or issues within the requested scope.

State the intended behavior in one paragraph from the user request, requirements, commits, and PR description. Treat approved design and product decisions as constraints. When ambiguity materially changes the review, resolve it before issuing a verdict; useful read-only grounding can continue. Challenge execution against the intent rather than silently replacing it.

## Review

Read [reviewer brief](references/reviewer-prompt.md), [rubric](references/rubric.md), and [code-quality lens](references/code-quality-review.md). Give each reviewer the same intent, snapshot, rubric, and available grounding. Do not include suspected bugs or desired conclusions in an independent review brief. Reviewers apply relevant lenses and may return no findings.

Use multiple reviewers when available, authorized, and worth the cost. Inherit model defaults unless a supported user-authorized override has a purpose. State actual models/efforts when known; multiple agents, perspectives, or candidate generation do not prove cross-model diversity. Cap simultaneous reviewers at the smaller of the runtime limit and the planned cap, reserving the lead slot; queue extras. Assign disjoint report outputs, or require in-chat results; no shared writable checkout or reports. Read-only is a task boundary even if the tool does not enforce a dedicated flag. Tests that mutate fixtures/build output need separate owned scratch/worktrees and an explicit permitted-write scope. One lead owns any later integration. No nested delegation without authorization.

For a narrow task, or unavailable delegation, run the relevant lenses directly and report single-agent review. Sequential passes by the same agent are non-independent and must not be labeled independent reviewers.

## Verify and judge

Collect every result, then inspect the cited code and trace reachable paths. Reproduce important findings with appropriate authorized checks when practical, keeping verification artifacts isolated; otherwise state the evidence limit. Deduplicate by underlying defect and affected path, retaining reviewer attribution and disagreements. Consensus helps prioritize investigation but does not establish truth; a lone finding can be decisive.

Read [lead judgment](references/lead-judgment.md). Decide each finding as **Act on**, **Consider**, **Noted**, or **Dismissed**, with a concrete reason supported by actual callers, constraints, and behavior. Distinguish accepted evidence from an unverified hypothesis. Do not turn a preference, line threshold, or hypothetical impossible input into a blocker. Do not dismiss a real bug because few reviewers saw it.

Return intent and reviewed snapshot, actual reviewer setup and dropouts, categorized findings with locations/evidence/attribution/rationale, and an agreement map with unresolved gaps. Lead with actionable verified concerns. Include why rejected findings fail and what would settle uncertain findings. No-findings means no issues demonstrated within this review's coverage, not a guarantee of correctness.
