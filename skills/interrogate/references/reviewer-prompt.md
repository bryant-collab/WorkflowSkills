# Reviewer brief

Fill this brief with the actual snapshot and accessible grounding. Use the same filled brief for each reviewer; a separate read-only report path may differ.

> Review this change adversarially against the stated intent: {intent}.
> Snapshot: {base/head SHAs, working-tree snapshot or exact files}.
> Scope and constraints: {approved design, consumers, relevant requirements, allowed reads and writes}.
> Code and grounding: {diff/files and context paths}.
> Apply the relevant review rubric and code-quality lens supplied below. Trace callers and boundaries before asserting a defect. Report real problems, not praise or a quota of findings. Do not replace the product goal with your own design preference.
> Read-only review: do not edit source, deliver externally, or delegate further. Use only the allowed isolated output path if writing a report. Report unavailable evidence rather than inventing it.

For each finding return severity (`critical`, `warning`, or `nit`), specific file/line or function, concrete defect, reachable trigger, supporting evidence, consequence, and an optional actionable alternative. Label uncertainty and any untested claim. Critical findings cause broken behavior, security exposure, or data loss; warnings are substantiated design or maintainability risks; nits are minor improvements. Severity is a proposal for the lead to assess, not the final verdict.

Record reviewed snapshot and coverage, checks actually performed, and gaps. If nothing is demonstrated, return no findings. Empty review is valid.
