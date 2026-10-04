# Ship authorized verified work

Confirm explicit merge or merge-when-ready authorization and the intended PRs before landing. Use supported GitHub operations through the delivery workflow, honoring repository rules and human gates. A green check list alone is not a behavioral verification verdict.

Record the current head/base and appropriate verification evidence for each PR. Independent review is valuable when requested or warranted; state whether it occurred. After patch, base, or dependency changes, revalidate affected scenarios and current-head CI. Matching patch IDs can aid diagnosis, but cannot prove unchanged runtime behavior after base changes. Never substitute older-head green checks for current ones.

For a requested stack, land only the verified contiguous sequence from the actual base, one PR at a time. Do not arm descendants prematurely. After each merge, confirm the new base and re-evaluate the next PR. Preserve independent PR delivery when no stack was requested. Unexpected queue or remote outcomes require observation and reconciliation before retry; never infer a merge from an accepted request.

Return confirmed merged PRs, current frontier, remaining gates, and evidence. No background watcher or review message is implied by shipping; future monitoring requires the user's request.
