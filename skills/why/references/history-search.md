# Search code history on Windows

Use focused reads before expanding the search. These Git commands work from PowerShell; quote real paths and search strings, and replace placeholders with verified values.

```powershell
git blame -L 10,30 -- 'src/example.py'
git log --oneline -20 -- 'src/example.py'
git log --follow -p -- 'src/example.py'
git log -S 'exact threshold text' -- 'src/example.py'
git log -G 'relevant pattern' -- 'src/example.py'
git show COMMIT -- 'src/example.py'
git log -1 --format=%B COMMIT
```

Start with a bounded history window. Follow renames or pickaxe matches when the first pass misses the introduction. Check related files changed in substantive commits and original PR review discussion. Squashed or shallow history can omit branch commits; explain that limit and use accessible PR records. Do not assume Git or authenticated GitHub access exists.

Search repository ADRs, release notes, comments, and related tests with rg. Resolve linked Jira tickets or other issue records as well as PRs on the actual host. A key in a commit message is a lookup lead, not proof of the ticket's contents or a reason to create a GitHub Issue. Use discovered read capabilities or supplied ticket text; record unavailable access and freshness limits. Use source URLs, commit hashes, and verified file lines in findings. Keep source authors and dates when they establish chronology; paraphrase accurately or quote only the relevant permitted excerpt.

Incident-related searches should follow actual IDs, error strings, target symbols, and a bounded time window. Optional chat, document, error, or telemetry tools can answer a remaining question when connected and relevant. Their availability does not justify unrelated history scans, messages, or an enterprise-wide search.
