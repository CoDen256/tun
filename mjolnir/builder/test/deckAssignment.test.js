import test from "node:test";
import assert from "node:assert/strict";
import { assignDeck } from "../src/deckAssignment.js";
import { fixtureNote } from "./fixtures/stabburNotes.js";

// deck-consolidation: `assignDeck` now returns one of 2 deck FAMILY keys,
// not a literal deck code (deck-rollover's D-DR3 contract) — a literal code
// is only derived later, via `resolveActiveDeckCode`.
test("every PoS of a type=word note resolves to the lexic family — no PoS produces a different family", () => {
  for (const pos of ["substantiv", "adjektiv", "verb", "adverb", "preposisjon", "konjunksjon", "subjunksjon", "pronomen", "interjeksjon"]) {
    assert.equal(assignDeck(fixtureNote({ type: "word", pos })), "lexic");
  }
});

test("type=expression resolves to the lexic family, same as word notes", () => {
  assert.equal(assignDeck(fixtureNote({ type: "expression", pos: null })), "lexic");
});

test("single-occurrence types (grammar/listening/pronunciation) resolve to the practice family", () => {
  assert.equal(assignDeck(fixtureNote({ type: "grammar", pos: null })), "practice");
  assert.equal(assignDeck(fixtureNote({ type: "listening", pos: null })), "practice");
  assert.equal(assignDeck(fixtureNote({ type: "pronunciation", pos: null })), "practice");
});

test("an unmapped type falls through to the lexic family, same precedent as the old expression catchall", () => {
  assert.equal(assignDeck(fixtureNote({ type: "something-new", pos: null })), "lexic");
});
