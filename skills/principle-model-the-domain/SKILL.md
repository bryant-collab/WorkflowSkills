---
name: principle-model-the-domain
description: Apply when repeated branches, booleans, or shape assumptions obscure stateful logic; choose a structure that matches the real domain.
---

# Model the Domain

Look for a data structure or module boundary that expresses the domain rule currently scattered across branches and callers.

Useful shapes may include explicit state variants, a typed model, a registry, a reducer, an event model, or a normalized collection. Choose based on the actual invariants and access patterns.

- Identify which states are valid and which transitions are allowed.
- Gather related rules where their ownership becomes clear.
- Derive repeated facts from one authoritative value when possible.
- Prefer the existing straightforward shape if it is already local and understandable.

Do not force an abstraction that adds indirection without removing invalid states, duplicated rules, or lifecycle risk. Validate untrusted inputs at their real boundaries; a domain model does not make external data trusted.

