# Current-head PR status

Resolve the canonical PR, current head SHA, base, open/closed/merged state, draft status, mergeability verdict, required checks, approvals, changes requested, and unresolved review threads. Use the hosting provider's supported commands and paginate when necessary. Comments are not approvals, and a review summary is not the complete unresolved-thread list.

Associate checks and commit statuses with the current head. Earlier-head success is stale. Distinguish passed, failed, running, pending, skipped, absent, cancelled, and inaccessible results. If protection rules, mergeability, or thread state are inaccessible or still computing, report the gap instead of inventing a readiness verdict. A draft remains draft when checks pass.

Treat review findings as evidence to verify. State the head and observation time so changes are detectable. Return checks, approvals, unresolved threads, blockers, and uncertainty separately. A read-only pass never commits, pushes, edits a PR, marks ready, replies, resolves threads, reruns CI, merges, enables auto-merge, or starts monitoring. Watching and repair require their own requested scope.
