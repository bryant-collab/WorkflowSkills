# Trace forensics

Treat the supplied profile, trace, or heap capture as the fixed dataset. Identify format, workload, runtime, timestamps, and available symbols. Use an appropriate parser; a queryable table helps large captures but is not required for a small artifact. Preserve the source capture.

Find the expensive path, retained objects, or blocked thread, then attribute it to source using the artifact's symbols. Compare paired captures when provided. Distinguish a correlation in one capture from an experimentally confirmed cause. Do not silently rerun an unrelated workload or claim source attribution without symbols.

Return the strongest supported diagnosis, evidence pointers, source mapping, and limits. Implementation requires a separate authorized fix scope, using [Bug fix](bug-fix.md) or [Perf issue](perf-issue.md).
