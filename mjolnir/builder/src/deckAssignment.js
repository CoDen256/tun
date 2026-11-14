// Deck family assignment (tun/docs/03-data-model.md, builder/README.md,
// deck-consolidation). Collapses the original 10-way type/PoS split into 2
// families (`deck-rollover`'s `DECK_FAMILIES`): any `type=word` note
// (regardless of `pos` — no PoS produces a different family anymore) and
// `type=expression` share the `{A,E}` occurrence shape and both resolve to
// `lexic`; the single-occurrence types (grammar/listening/pronunciation)
// resolve to `practice`. An unmapped `type` falls through to `lexic`, same
// precedent as the old `EXPRESSION_CATCHALL_DECK` fallback.
const TYPE_FAMILY = {
  expression: "lexic",
  grammar: "practice",
  listening: "practice",
  pronunciation: "practice",
};

const UNMAPPED_TYPE_FAMILY = "lexic";

export function assignDeck(note) {
  if (note.type === "word") return "lexic";
  return TYPE_FAMILY[note.type] || UNMAPPED_TYPE_FAMILY;
}
