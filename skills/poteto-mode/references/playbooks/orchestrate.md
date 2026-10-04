# Orchestrate: deferred program execution

The upstream standing-project coordinator depends on a persistent queue/store, isolated worker lifecycle, topology ownership, verification ledger, liveness reconciliation, and restart handling. This collection does not ship a tested equivalent daemon or orchestration CLI. A document is not proof those capabilities exist.

For a requested large program, draft its scope, units, dependency graph, ownership, authorization, acceptance ledger, and resource limits using [Multi-phase plan](multi-phase-plan.md). Before fleet execution, prove one isolated unit through worker, verifier, integration, delivery, and interruption recovery with the actual client. Keep one owner for branch topology and external delivery. Do not create cloud tasks, schedules, global configuration, or agents as a consequence of merely asking about this mode.

A bounded task can proceed using [Autonomous run](autonomous-run.md) with explicitly authorized ordinary delegates. Standing multi-day program execution remains deferred until its missing lifecycle and state contracts are implemented and exercised. Report that limitation without inventing model or cloud-environment guarantees.
