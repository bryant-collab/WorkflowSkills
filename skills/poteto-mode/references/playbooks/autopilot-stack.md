# Autopilot-stack: deferred program execution

The upstream mode builds a verified linear PR chain for the user to land. This collection has not proved persistent queue coordination, branch topology serialization, rebasing across owners, stale verdict invalidation, or restart recovery at fleet scale. No owner should launch that program from this file.

Plan the requested dependency chain through [Multi-phase plan](multi-phase-plan.md). Preserve review granularity and one topology owner. Describe how each branch, base/head, acceptance evidence, and current-head CI will be tracked; do not automatically rebase, force-push, retarget, or arm descendants. Prove an isolated small chain and its failure recovery before wider rollout.

Ordinary authorized dependent PRs can use [Opening a PR](opening-a-pr.md) without a fleet. Keep merge authority with the user unless explicitly granted. Report the stack proposal and lifecycle gaps; do not claim this deferred mode has been exercised.
