# Choose evidence for the project's actual language

Use existing repository configuration as the source of truth. Detect tools rather than presuming they exist. A command timeout, missing runtime, or unavailable credentials is a reported gap, not successful execution.

| Project | Evidence and traps |
| --- | --- |
| C# | Existing `dotnet build`, `dotnet test`, analyzers, and real CLI/service/desktop paths. Confirm SDK availability and target framework. Performance proof uses Release. A runtime alone cannot build a project. |
| Python | Existing test/lint/typing commands, actual CLI/API behavior, and file/database effects. Preserve runtime validation at external boundaries despite annotations. Use argument arrays and UTF-8 for portable artifact names. |
| PowerShell | Existing Pester/analyzer checks when present. Use terminating error handling where needed, and inspect `$LASTEXITCODE` immediately after native commands; `$ErrorActionPreference` alone does not reliably propagate every native failure. Test partial failure and rerun convergence. Use `-LiteralPath` for filesystem operations and quote paths with spaces. |
| DOS batch | Execute through `cmd.exe /d` in disposable fixtures. Observe `ERRORLEVEL`, spaces, quotes, and delayed expansion. `!` can change meaning with delayed expansion; `%` expands in batch. Preserve comments explaining these constraints. Keep destructive operations within one verified shell/path boundary. |
| Web | Project-native checks and available browser driving. Verify actual user actions, observable results, and backend effects where appropriate. Use the project's own framework. |

For servers, retain owned process identities and readiness proof. Isolate port and data directories before concurrent runs. If the application cannot isolate, serialize drives; do not commandeer the user's instance. Avoid fixed sleep as the only readiness check and bound retries.

For an unavailable native UI driver, provide the exact build/launch command, version, fixture/preconditions, user actions, expected visible and stored results, screenshots/logs to capture, and cleanup. Label the UI proof pending until that recipe is executed. Non-UI tests do not prove mouse/keyboard, focus, window behavior, or desktop rendering.
