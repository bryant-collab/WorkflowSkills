# Initial delivery status

Read the delivered PR's current head, draft/state, available check results, required approvals, and visible unresolved reviews. Associate checks with the actual current head, distinguishing pending/running, failed, passed, skipped, cancelled, absent, and inaccessible states. If protection rules or review details cannot be read, name the missing evidence. A green visible list alone does not prove readiness.

Record the observed head and time, then return the PR link, validation, check/review state, and blockers. This is one status pass, not a wait-until-green loop. No reruns, review messages, thread resolution, merge, auto-merge, or watcher creation follow from delivery. Another push within the authorized delivery task invalidates head-specific evidence and calls for a fresh initial pass.
