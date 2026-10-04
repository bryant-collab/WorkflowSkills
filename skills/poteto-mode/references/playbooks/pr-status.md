# PR status

For “check this PR” or “is it green,” perform one read-only pass using [the PR-status guide](../../../github-delivery/references/pr-status.md). Resolve the canonical repository and current PR head, then report checks, draft/state, approvals, unresolved threads, merge blockers, and access gaps. Status alone authorizes no external mutation or recurring observation.

This retains the upstream babysit playbook's distinction between a status pass, repairs, and landing while removing the mandatory watcher and loop machinery. A merge-ready repair request routes to [GitHub delivery](github-delivery.md); merging and auto-merge remain separately authorized actions.
