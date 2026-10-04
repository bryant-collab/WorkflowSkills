---
name: benchmark-checklist
description: Validate a measured speedup, regression, or performance comparison for completed work, correctness, tuning, limiter, repeatability, and user relevance before reporting or choosing an option.
---

# Benchmark checklist

Write the claim with workload, metric, and units before measuring. Read the measurement code: what it times, counts, and omits. Use the existing project benchmark and runtime diagnostics. See [explain the number](../principle-explain-the-number/SKILL.md).

Check host contention using available Windows tools, such as `Get-Process`, `Get-CimInstance Win32_Processor`, and `Get-Counter` where supported. If unavailable, record the gap; do not replace missing diagnostics with guessed limits. Interleave candidates when shared host noise cannot be controlled.

1. Name the limiter. Profile a separate run using available runtime tools: .NET diagnostics, Python profiling, browser/Node profiling, process CPU, or I/O counters. Profile the load generator too. Do not include profiling overhead in reported timings.
2. Tune every side realistically. Use Release C# builds, matching runtime versions, production settings, batching, transactions, pools, datasets, and warm/cold cache conditions. Untuned comparisons cannot choose a winner.
3. Check physical limits and arithmetic. Compare throughput with bandwidth and cores. Removing 10% of a run saves at most 10% of its time, about an 11% throughput increase.
4. Count errors and verify outputs. Fast rejections, retries, and timeouts invalidate a success-speed claim.
5. Confirm work happened inside the timed region: awaited completion, consumed iterators/results, actual requests, persisted rows, and bytes processed. A successful exit alone is insufficient.
6. For a comparison, normally run each side at least five times, alternate sides, and report median and range. Smaller differences than variation are not measurable evidence of improvement. Use the harness's statistics when appropriate.
7. Measure the end-to-end user path as well as a microbenchmark. State the micro operation's share of the whole.

A requested quick ballpark may use one run, explicitly labeled, but still requires correctness and completed-work checks. It cannot select between options.

Lead with faster, slower, no measurable difference, or inconclusive. Include units, run counts, variation, limiter evidence, and environment constraints. Call a comparison inconclusive when the limiter is unexplained, a side is untuned, or correctness/completion is unproven. Link detailed artifacts from concise PR prose.
