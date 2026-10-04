---
name: typescript-best-practices
description: Apply TypeScript-specific modeling and boundary guidance when designing or reviewing TypeScript code; follow the repository's compiler, schema and test conventions.
---

# TypeScript boundaries and modeling

Use [type discipline](../principle-type-system-discipline/SKILL.md) where the shape affects correctness. Model distinct lifecycle variants with discriminated unions rather than bags of unrelated optional fields. Keep legitimate optional data optional. Introduce branded IDs or stronger collection types only where they prevent an actual mix-up or make a currently partial operation total.

Treat external input as `unknown` and parse it at its actual boundary. Use the repository's existing runtime schema library and derive types from schemas where available; do not install one incidentally. Guards must verify the claimed shape. Static annotations and `satisfies` do not validate runtime input. Trusted internal domain data need not be reparsed at every function.

Prefer discriminant narrowing, `in`, `typeof` and `instanceof` over unexplained casts. An assertion is appropriate when supported by a checked invariant or a necessary SDK boundary; record the reason where it is non-obvious. Literal `as const` is useful and does not replace runtime validation. Check exhaustive variants with the project's established technique.

Reuse schema-derived types and `Pick`/`Omit`/`Parameters`/`ReturnType`/`Awaited` when they express the real relationship. Do not replace clear domain names with deeply nested utility types. Use named argument objects when they clarify new interfaces; preserve public positional signatures and repository conventions unless a compatibility migration is authorized.

Exercise observable behavior using the project's native checks. Real local boundaries are useful; deterministic fake providers and failure injection are valid when they isolate unavailable, costly or externally mutating dependencies. Preserve negative and exception tests that prove requirements. Verify changed UI in a running build when practical, and report unavailable coverage.

Follow the project's diagnostics contract. Structured service logs should retain correlation context without secrets; CLI stdout, test diagnostics and intentional developer console output remain legitimate. This optional skill does not impose TypeScript on other languages or force unrelated refactoring.
