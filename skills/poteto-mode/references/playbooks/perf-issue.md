# Perf issue

Capture the user's slow path with a realistic workload, output correctness, metric, and units. Use [benchmark checklist](../../../benchmark-checklist/SKILL.md) to inspect completed work, noise, tuning, and the limiting resource. Diagnose from the measured path, using [how](../../../how/SKILL.md) to connect it to source.

Try cheaper changes first: eliminate unused work, avoid repeats, reduce frequency, defer it where acceptable, then consider concurrency or a cheaper implementation. Keep a change only when the same harness shows improvement beyond noise and behavior remains correct. Profile separately from reported timing. A source-level guess or faster rejection is not a speedup.

Compare baseline and changed artifacts, record environment and revision, and use [Opening a PR](opening-a-pr.md) if delivery is authorized. Report before/after with units, variation, limiter evidence, and artifact paths. Sustained metric optimization uses [Hillclimb](hillclimb.md).
