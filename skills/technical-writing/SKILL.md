---
name: technical-writing
description: Write or review technical docs, RFCs, READMEs, PR descriptions, and commit messages for clear structure, precise instructions, and readable English.
---

# Technical writing

Write so a tired engineer can understand the text on the first read. Preserve the requested format, repository conventions, facts, uncertainty, and intended audience. A review request produces feedback unless edits are requested; drafting prose does not authorize publishing it.

Choose the document's main purpose. A tutorial teaches through visible results. A how-to solves a task with steps and relevant branches. Reference presents facts for lookup. Explanation develops context, reasons, and tradeoffs. Separate substantial mixed purposes with links when useful, but do not impose a rigid taxonomy on a short PR briefing.

Lead with the reader's goal or the concrete point. Use real symbols, commands, files, and flags. Verify commands and counts when they matter; distinguish illustrative examples from executable instructions. Respect the project's indentation and language instead of forcing tabs into every snippet.

Use active voice when the actor matters. Put conditions before instructions and give each procedural step a clear action and observable result. Keep prerequisites and consequential warnings before the step they govern. Give pronouns clear referents, place “only” beside what it modifies, and unpack ambiguous noun strings.

Prefer familiar words and concrete mechanisms. Keep necessary articles and verbs. Split sentences that carry too many ideas, but vary sentence length when a longer sentence remains clear. Use one name per concept. Rules serve clarity: preserve a sentence that is better in its existing form.

Use informative sentence-case headings, descriptive links, numbered sequences, parallel comparison lists, and code formatting for code. Apply [unslop](../unslop/SKILL.md) for redundant filler and mannered prose. Do not erase supported qualifications to sound decisive.

For PR descriptions, state the trigger or problem and resulting behavior, then relevant validation and limitations. Scale detail to the change and follow the repository template. A commit message should identify the substantive change. Avoid pasting orchestration logs; link proof artifacts when needed. Product UI strings follow the product's copy conventions.

For Jira-backed work, include the verified ticket key and link when relevant, and connect substantive acceptance criteria to the checks actually performed. Keep proposed ticket comments distinct from authorized published updates. Do not invent requirement text, claim unexecuted verification, or require a duplicate GitHub Issue.
