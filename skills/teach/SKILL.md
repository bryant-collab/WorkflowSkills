---
name: teach
description: Teach a change or subsystem in plain language by combining traced behavior with evidence about its reasons, at the reader's requested depth.
---

# Teach

Help the reader understand what the thing is, how it works, and why it has this shape. Teaching is read-only unless the user separately requests an implementation or artifact.

Infer the reader's context from the conversation: onboarding, review, debugging, or preparing a change. Choose the few concepts that answer their question. Do not quiz the reader or demand a knowledge survey.

Use [how](../how/SKILL.md) to trace relevant mechanics and [why](../why/SKILL.md) when motivation matters. Read and apply those instructions directly; they do not require spawning agents. Reuse their findings instead of duplicating searches. A small question may need only one. Keep historical searches scoped to the question.

Start with a plain definition and the smallest complete answer, then add the detail needed for the requested depth. Explain a concrete input or user action through the decisions and resulting state. Define technical terms once and keep their names consistent. Mention verified files when useful without turning the explanation into a symbol list.

Use a diagram, code excerpt, or example when it makes the mechanism easier to understand. Build a complex picture in stages if that helps the reader; a small flow can use one diagram. Choose available tools proportionate to the task. Do not require image generation or a debugger to explain a simple point.

Apply [unslop](../unslop/SKILL.md) to the prose while preserving why's evidence and uncertainty. Keep the explanation conversational, with no pacing theater, compulsory pauses, or stock framing labels. Honor requests for a complete account instead of stopping after two sentences. The reply is the explanation itself.
