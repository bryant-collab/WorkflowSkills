---
name: pr-delivery
description: Implement an authorized repository change and open or update its pull request from Jira, GitHub Issues, or supplied requirements. Stop after delivery and an initial status report.
---

# PR delivery

Use this workflow for requested implementation-to-PR delivery. A ticket may come from Jira, GitHub Issues, another tracker, or supplied text; the tracker and Git hosting provider are independent. Keep the ticket key/URL and acceptance criteria as the task identity. Do not create a GitHub issue merely to deliver a Jira ticket.

Discover the working tree, local instructions, canonical PR repository, push remote, actual base branch, checks, PR template, and branch naming conventions. Use available provider tools and inspect their documented operations. For GitHub, prefer `gh-axi`, with supported connectors or `gh` for gaps. Do not assume a GitHub tool works for another host or install/authenticate tools as a side effect. With missing access, complete useful local work and return the exact delivery gap.

Preserve unrelated edits and use an isolated checkout when needed. Establish the intended behavior and a useful baseline. Implement the smallest warranted change, run affected and required repository checks, and exercise the changed user path where runtime behavior matters. Use [TDD](../tdd/SKILL.md), [blast radius](../blast-radius/SKILL.md), and [how](../how/SKILL.md) when relevant, rather than mandating them for every change.

When PR publication is within the request, commit only task changes, push to the verified remote, and create or update the PR in the canonical target. Resolve existing PRs first to avoid duplicates. Follow repository conventions and [technical writing](../technical-writing/SKILL.md). Link the source ticket using its key and real URL; GitHub closing keywords are for GitHub issues and must not be assumed to transition Jira. Keep incomplete work draft when warranted and do not change readiness without appropriate authorization and evidence.

After the push, perform one [initial status pass](references/initial-status.md). Report the PR URL, ticket, demonstrated acceptance criteria, validation, and outstanding blockers; hand off ongoing observation to the user or their existing monitor. This skill does not start babysitting or recurring observation, reply to reviews, resolve threads, transition Jira tickets, merge a PR, or enable auto-merge. It always stops before merge. Requested ongoing PR repair/observation belongs to separately installed `pr-babysit`; it is not an installation dependency.
