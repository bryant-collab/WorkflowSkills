# Record a design decision

Scale this to the change. A small design can use a few paragraphs.

1. State the problem and grounded constraints.
2. Show caller usage and realistic inputs, outputs, and errors.
3. Sketch types, signatures, module ownership, and dominant data flows. Mark unimplemented bodies explicitly. Identify invariants enforced by types and those requiring runtime validation.
4. Compare at least two distinct candidate shapes for substantial work. Name the chosen base, what was incorporated, and what was rejected, with reasons.
5. State accepted tradeoffs, public compatibility, and required migration stages.
6. Identify open questions, execution risks, and the next verifiable implementation unit.

The sketch and usage must agree. Do not invent unresolved questions just to fill the format. No arena dependency is required for this sequential core path.
