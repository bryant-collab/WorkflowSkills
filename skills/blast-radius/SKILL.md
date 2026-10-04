---
name: blast-radius
description: Trace what a concrete change could break beyond its diff and execute the checks its safety depends on. Use for blast-radius reviews, contract migrations, and questions about affected consumers.
---

# Blast radius

Read the diff and affected source, including deletions and changed timing. Use [how](../how/SKILL.md) to resolve runtime flow and [why](../why/SKILL.md) only when historical intent matters. A request to review remains read-only except for disposable proof artifacts.

Find the one or two facts the safety claim depends on. Follow actual consumers beyond symbol references: serialized data, database columns, command exit codes, config, callbacks, event ordering, shutdown, feature flags, pinned libraries, and other languages reading the same bytes. Inspect the actual library version and local patches when its behavior is decisive.

Internal APIs can migrate coordinated callers. Public APIs, file formats, CLI consumers, and external integrations may need compatibility and staged rollout; a search finding no local caller does not prove no external consumer exists.

For each decisive fact, distinguish assertion, cited source, traced failure path, executable proof, and live user-path proof. Run the cheapest meaningful check that exercises the real code, not a substitute model of it. Respect read-only scope and avoid production effects. If execution requires unavailable tools or unauthorized effects, mark the fact unproven and provide a concrete recipe.

For wide changes, divide bounded review slices sequentially or use authorized available delegation with isolated artifacts. Core operation has no parallel arena dependency. Assess confirmed risks by plausible trigger and consequence; do not invent percentage probabilities.

Return what changes, the decisive safety facts and their evidence level, confirmed risks with source citations, risks cleared by evidence, and remaining checks. Apply [unslop](../unslop/SKILL.md) without erasing uncertainty. A persuasive report is not runtime proof.
