# Code-quality lens

Look for meaningful simplifications that preserve intended behavior. Removing an unnecessary mode, branch, wrapper, or duplicate ownership can matter more than local renaming. Present a concrete simpler structure and explain what it preserves and why it improves maintenance; review does not authorize implementing a broad rewrite.

Prioritize tangled feature checks, duplicated state, unclear domain models, leaky boundaries, and needless orchestration. Check whether existing helpers and canonical modules already solve the problem. Thin pass-through abstractions, magic assumptions, casts masking contracts, and scattered fallbacks deserve scrutiny when their cost is demonstrated. Types should express real invariants, with necessary runtime validation at actual boundaries.

Growing a file across roughly 1,000 lines is a useful decomposition prompt, not an automatic blocker. Inspect responsibilities and organization before recommending extraction. Similar caution applies to optionality and dynamic typing: language choice alone is not a defect. Preserve project conventions, useful documentation, and public compatibility.

Consider atomicity of related state updates and unnecessary serialization of truly independent work. Recommend concurrency only when state ownership, failure handling, and actual benefit support it.

Treat maintainability regressions as serious when evidence shows unnecessary complexity, coupling, or fragile behavior. Do not approve solely on happy-path correctness, but do not block on taste. Explain the concrete cost, a feasible alternative, and relevant tradeoff. Be direct and respectful; no finding quota.
