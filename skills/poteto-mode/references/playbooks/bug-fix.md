# Bug fix

Identify the reported observable failure and preserve unrelated work. Reproduce it through the actual CLI, API, application harness, or available UI driver. When a surface is inaccessible, state the exact gap and exercise the reachable boundary; do not call that full user-path proof.

Trace the mechanism with [how](../../../how/SKILL.md), and use [why](../../../why/SKILL.md) when regression history changes the fix. Choose the smallest evidenced correction. Use [architect](../../../architect/SKILL.md) only for a significant unresolved ownership or interface change. Direct implementation is the normal small-task path; optional delegation needs authorization and isolated writable outputs.

Use [tdd](../../../tdd/SKILL.md) when a meaningful cheap regression test exists. Capture failing-before and passing-after evidence without publishing intentionally failing delivery boundaries. Run project-native checks and the original repro after the fix. Remove unsuccessful experiments without undoing user changes. If PR delivery is requested, continue through [Opening a PR](opening-a-pr.md).

Report the failure, cause, correction, observed verification, and remaining coverage gaps.
