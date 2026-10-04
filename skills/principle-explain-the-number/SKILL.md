---
name: principle-explain-the-number
description: Apply before trusting or reporting a measured result; identify what limited it and rule out skipped, failed, or noisy work.
---

# Explain the Number

Treat a measured time, throughput, memory use, speedup, or evaluation score as a claim about a specific workload.

- Record the input, environment, configuration, repetitions, and observed spread.
- Check that the intended work actually ran and that neither errors nor caching made the result misleading.
- Identify the limiting resource or code path with runtime evidence when the number supports a performance claim.
- Compare candidates under the same realistic conditions and include enough context for another reader to interpret the result.
- Separate observed values from estimates and explain uncertainty.

A plausible number is not proof that the intended behavior was measured. Do not generalize beyond the workload and evidence.

