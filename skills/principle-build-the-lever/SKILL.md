---
name: principle-build-the-lever
description: Apply to nontrivial repeated work or verification when a small rerunnable tool would improve consistency, speed, or reviewer confidence.
---

# Build the Lever

For repeated edits, structured analysis, or checks that are costly to reproduce, consider a small tool that performs the work or makes the result rerunnable.

- First do one representative unit by hand when that helps reveal the actual recipe.
- Build only the smallest script, generator, codemod, query, or instruction set that materially improves the task.
- Run it on the representative unit and compare the output with the known result.
- Make reruns safe and limit writes to owned paths and state.
- Keep the command and useful output visible to reviewers when reproducibility matters.

A helper is not the goal. Ordinary small edits should stay small, and a helper's expected benefit must justify creating and maintaining it. No helper grants authority to publish, message others, or modify unrelated state.

