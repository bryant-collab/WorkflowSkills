# Worktree cleanup: audit first, execution deferred

The upstream Bash audit, macOS simulator cleanup, and editor-cache deletion were not ported. Do not run those tools or treat a merged branch as evidence that every local file is disposable.

For a requested audit, read `git worktree list --porcelain`, task attachments, current use, status, untracked/ignored files, branch reachability, and recovery options. Inspect only the relevant project. Produce candidate paths with specific preservation and usage evidence; ambiguous, pinned, shared, active, or dirty checkouts remain held.

For Codex-managed worktrees, use the available list/archival tools under their documented constraints when cleanup is authorized. Archives preserve a recoverable snapshot, while needed ignored files require separate preservation. Ordinary Git worktree removal must use Git's ownership-aware operation on exact verified paths; never substitute a recursive shell delete or automatic `--force`. Any further destructive step requires the user's requested scope and preservation decision.

A reusable automatic cleanup helper remains deferred until disposable Windows fixtures prove path containment, reparse-point handling, dirty/untracked preservation, active-use detection, and reruns. Report candidates, held paths, and any actually authorized cleanup separately. No simulator, global cache, or unrelated chat cleanup is implied.
