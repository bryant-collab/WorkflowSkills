---
name: setup-pstack
description: Inspect and configure pstack model, reasoning, and workflow preferences when the user requests pstack setup or budget changes. Preserve client defaults unless an override is requested.
---

# Set up pstack preferences

Inspect relevant project instructions and the current client's exposed capabilities. Read only the configuration fields needed for this task; do not print authentication, environment values, or unrelated personal settings. Start from inherited model and reasoning settings. A previous user's preferences are not collection defaults.

Build the available choice list from current tool metadata or the client's supported model selector. Treat this as locally advertised capability, not proof of remote entitlement or a successful model call. Do not invent a models API or command. If enumeration is unavailable, preserve inheritance or use choices the user can confirm. Do not run a paid model probe merely to discover availability.

Keep model identifiers and reasoning efforts separate. For each requested role, record its purpose, inherited or selected model, and supported effort. An unavailable selection needs a supported replacement or an explicit gap; never manufacture an effort-suffixed model slug. Panel size and concurrency are separate decisions, sized to the task and the client's limits. Same-model reviewers do not establish vendor diversity.

When the user has not specified a budget, explain the actual supported tradeoff and ask only if their preference changes the configuration. Avoid a universal budget ladder. A preference already supplied in this task is sufficient; do not reconfirm it.

Show the concrete scoped change before any required approval. For requested project persistence, prefer a small pstack-specific section in the repository's existing `AGENTS.md`, preserving unrelated guidance. Such per-role preferences are instructions consumed by agents, not native Codex configuration keys. Creating or updating a project guidance file is not installation of this collection. If the user only asks for advice, return the proposal without writing it.

Native Codex settings are a separate option when requested. Recheck current [configuration documentation](https://learn.chatgpt.com/docs/config-file/config-reference) and the installed client's help. `model` and `model_reasoning_effort` describe session settings; [subagent documentation](https://learn.chatgpt.com/docs/agent-configuration/subagents) describes inheritance and custom agent files. Do not add an invented pstack role table to `config.toml`. Preserve existing fields, and use global configuration or custom-agent files only when the user requests that destination and those semantics. This skill grants no broader execution permissions.

If installation is requested, use the available installer and selected dependency closure. Repository skills use `.agents/skills`; personal skills use `~/.agents/skills` according to [Build skills](https://learn.chatgpt.com/docs/build-skills). Check name collisions first and retain a removal path. Do not install, alter global settings, or claim fresh-session discovery as a side effect of model setup. Report the exact destination, changed preferences, locally verified capabilities, and any runtime or discovery checks still pending.
