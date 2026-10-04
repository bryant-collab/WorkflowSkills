# Runtime forensics

Diagnose a live runtime symptom without implementing a fix unless asked. Use the actual runtime's supported diagnostics: process counters, .NET profiling, Python instrumentation, or browser/Node profiles as appropriate. Establish instance identity and capture the affected workload. Instrument only within the authorized target; do not install tooling or mutate a shared production process as an implicit diagnostic step.

Reduce the capture to a hot path, retainer chain, scheduling loop, or wait reason. Map it to source and test the mechanism with safe repeatable observations where available. Parallel artifact analysis is optional and read-only when authorized. Missing symbols or inaccessible UI remain evidence gaps.

Return the captured signal, observed mechanism or labeled hypothesis, source location, and retained artifacts. Route an authorized correction to [Bug fix](bug-fix.md) or [Perf issue](perf-issue.md).
