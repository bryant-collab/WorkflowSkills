---
name: automate-me
description: Create or update a personal working-style skill from the user's explicit preferences and scoped observed evidence when they ask to capture their conventions or refresh their mode skill.
---

# Capture a personal working style

Create one concise skill that reflects this user's conventions. This request concerns reusable instructions; it does not imply a recurring automation, messaging, or a publishing workflow.

Find an existing matching skill in the selected project or personal skill location. An explicit update request authorizes an in-place revision; preserve conventions not contradicted by the user. For a new skill, use the user's chosen handle and scope. Default to a repository-local `.agents/skills/<handle>-mode/SKILL.md` when project scope is appropriate; a personal installation requires the user's requested personal destination. Use a discriminating description about this working style, not generic coding keywords.

Start with preferences the user explicitly supplied. When they request history-based discovery, inspect only accessible chats for the requested project and time window, using supported history tools or supplied session summaries. Do not search unrelated transcript directories. Read summaries first, then only the turns needed to verify a candidate preference. Repeated observed corrections can support a proposed convention; an inferred one remains labeled until the user confirms it. A single explicit standing preference is sufficient and does not require artificial repetition. Separate session-specific model choices from durable conventions.

If history is unavailable or intent remains unclear, proceed with explicit preferences and ask a small focused question about the missing decision. Do not require a questionnaire when the brief already supplies the answers. Delegated history mining is optional only when authorized, with disjoint evidence slices and a scoped summary for each.

Use the available **Skill Creator** to author or revise the skill and validate its manifest. If it is unavailable, report that dependency before substituting a manual authoring workflow. Apply [unslop](../unslop/SKILL.md) when prose cleanup is needed. Keep only rules that change an agent's decisions; reference a relied-on workflow instead of duplicating it. Do not copy another person's mode or add universal process, model, or autonomy rules.

Show the concrete draft and incorporate feedback. Preserve the requested invocation policy; ordinary discovery stays enabled unless the user asks for explicit-only invocation. A personal-style review is evidence of fit, while manifest and link validation prove packaging. Fresh-session triggering requires a separate observed check. Commit, PR creation, installation, recurring schedules, and external messages happen only when separately within the user's request.

Return the skill path, preferences captured, evidence used, intentional omissions, and validation limits. If future scheduled work is explicitly requested, use the current Codex automation tool as a separate task and preserve its notification and stopping intent.
