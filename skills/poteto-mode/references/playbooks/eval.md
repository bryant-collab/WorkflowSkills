# Evaluate instruction behavior

Define the variant, representative task, and observable success criteria before running candidates. Include near misses that should not trigger the workflow. Packaging checks remain separate from behavioral evidence.

Use equivalent isolated candidate fixtures and organic task prompts. Keep the private grading rubric and variant/model identities out of candidate-visible instructions where blinding is useful. An installed `arena` skill can structure an authorized comparison; otherwise use a bounded sequential comparison and label its limitations. Delegation and different models require available capabilities and authorization, not hardcoded model families.

Judge output and actual actions against the rubric. Supported tool traces or scoped chat summaries can establish which resources were read; missing traces cannot be replaced by self-report. Inspect outputs yourself and investigate disagreements with the judge. Preserve failures and rejected variants as evidence. Return the rubric, observed results, limitations, and promotion recommendation; do not promote from manifest validity alone.
