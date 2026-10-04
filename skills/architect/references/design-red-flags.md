# Screen a design candidate

Adapted from upstream architect's design red flags.

- A shallow module exposes many operations but hides little policy. Prefer a small interface that completes a useful task. Depth describes hidden complexity, not call-chain length.
- Representation or protocol decisions shared across modules force coordinated edits. Parse external data into domain concepts at appropriate boundaries; preserve public compatibility where consumers depend on the representation.
- Modules organized only as load, validate, transform, and save can scatter one domain invariant across all stages. Organize around knowledge and ownership when that reduces coupling.
- A pass-through method adds no policy, adaptation, or useful boundary. Remove unnecessary layers; retain real adapter contracts.
- Multiple writers or copies of authoritative state can diverge. Separate independent writers' state and merge at a read boundary. Serialize structurally when a shared canonical writer is necessary.
- Several supported entry points for the same internal task can preserve obsolete implementation paths. Coordinate internal callers, then remove dead paths. External consumers may need deprecation and staged migration.
- Importable internals become accidental APIs. Use the language's enforceable visibility or package boundaries where practical; Python conventions alone are not compiler enforcement.
- Hand-synchronized lists drift. Derive them from an authoritative source or check consistency when the consequence justifies a check.

Use these as candidate-specific evidence, not a mandatory rewrite checklist. A legitimate public interface or framework constraint is a tradeoff to record.
