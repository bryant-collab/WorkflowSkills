---
name: how
description: Explain how code works, trace runtime flow, or identify subsystem ownership and placement from the actual implementation. Use why for historical motivation.
---

# How

Answer the user's question by tracing the implementation. Keep explanations read-only: do not edit files, commit, publish, or change external state.

Start with the narrowest plausible scope. State an interpretation when the referent is ambiguous. For a helper or single module, inspect and explain directly without agents. For a larger subsystem, divide the trace into relevant slices and investigate sequentially; do not make delegation a prerequisite.

Find the entry point with repository searches, then read the implementation. Follow calls and data transformations, identify important types and boundaries, and check tests or configuration where they affect behavior. Do not infer behavior from names alone. Reconcile conflicting observations against the current code. Mark paths you could not trace.

For a Jira-backed question, use the ticket or supplied ticket text to identify the intended behavior and relevant paths. Explain discrepancies between the requirement and current implementation; a ticket describes intent, not proof of runtime behavior. Use the actual repository host for linked code evidence.

Lead with what the component does and the mechanism that answers the question. Explain the trigger, decisions, state changes, and outputs at the reader's requested depth. Cite verified files and symbols with useful line links. Include a small file map, non-obvious constraints, or a diagram only when it helps. Avoid an annotated source dump and unnecessary headings for narrow answers.

For placement questions, explain the owning domain, callers, and boundary constraints before recommending a location. Distinguish an observed convention from a proposed design. Use [why](../why/SKILL.md) when the answer needs the historical rationale rather than runtime mechanics.
