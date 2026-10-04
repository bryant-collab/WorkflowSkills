# Decision log format

UTF-8 TSV with this exact header and one single-line row per decision:

```text
ts<TAB>phase<TAB>decision<TAB>why<TAB>evidence<TAB>result
```

`ts` is an automatically generated ISO 8601 UTC recording timestamp ending in `Z`. `phase` identifies the unit or workstream. `decision` describes what was chosen or done. `why` gives the concrete reason. `evidence` is a source pointer, not a paragraph. `result` describes the observed outcome or predicate state. [The template](decision-log-template.tsv) contains the actual tab-separated header.

With a supported Python 3 runtime, invoke the [bundled helper](../scripts/decision_log.py) using quoted absolute paths in PowerShell:

```powershell
python -X utf8 'C:\path to\show-me-your-work\scripts\decision_log.py' 'D:\repo with spaces\.audit\task.tsv' 'verify' 'ran existing tests' 'check acceptance behavior' 'artifacts/test-output.txt' 'VERIFIED'
```

Substitute real paths and observations; do not run the example as historical evidence. The helper creates missing parent directories, writes the header only for an empty file, replaces tabs/CR/newlines with spaces, and prefixes formula-leading cells (including leading whitespace) with an apostrophe. NUL is rejected. It rejects malformed existing logs and emits a nonzero exit status without intentionally appending to them. It does not validate evidence targets or claim truthfulness.

One writer owns a log. An exclusive sibling `.lock` prevents concurrent helper writers; a lock conflict fails without removing that lock. After confirming a crashed owner no longer exists, its owner may remove that specific stale lock. Ordinary completion and handled failures remove only the helper's own lock. Direct writers do not honor the lock. A disk failure or process interruption can leave a partial row; preserve it, report the error, and recover a separate log with a provenance pointer instead of silently repairing historical bytes.

Read the table with `Import-Csv -LiteralPath '<log path>' -Delimiter "`t"` in PowerShell or a TSV viewer. Do not derive verification confidence merely from a row saying `VERIFIED`.
