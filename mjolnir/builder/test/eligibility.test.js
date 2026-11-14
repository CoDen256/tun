import test from "node:test";
import assert from "node:assert/strict";
import { filterAudioEligible } from "../src/stabburClient.js";
import { partitionByDeck } from "../src/eligibility.js";
import { fixtureNote } from "./fixtures/stabburNotes.js";

test("filterAudioEligible drops notes with no audio_blob regardless of type (D74)", () => {
  const notes = [
    fixtureNote({ type: "word", audio_blob: "sha1" }),
    fixtureNote({ type: "pronunciation", audio_blob: null }),
    fixtureNote({ type: "grammar", audio_blob: "sha2" }),
  ];
  const eligible = filterAudioEligible(notes);
  assert.equal(eligible.length, 2);
  assert.ok(eligible.every((n) => n.audio_blob));
});

// deck-consolidation: `assignDeck` returns a family key (lexic/practice),
// not a literal deck code — n2/n3 (both type=word, any pos) share the SAME
// family, so a grammar note stands in for the second group here.
test("partitionByDeck splits already-minted vs newly-eligible, grouping the latter by family", () => {
  const notes = [
    fixtureNote({ id: "n1", type: "word", pos: "substantiv" }),
    fixtureNote({ id: "n2", type: "word", pos: "verb" }),
    fixtureNote({ id: "n3", type: "grammar", pos: null }),
  ];
  const { alreadyMinted, newlyEligibleByDeck } = partitionByDeck(notes, new Set(["n1"]));
  assert.deepEqual(alreadyMinted.map((n) => n.id), ["n1"]);
  assert.deepEqual(newlyEligibleByDeck.get("lexic").map((n) => n.id), ["n2"]);
  assert.deepEqual(newlyEligibleByDeck.get("practice").map((n) => n.id), ["n3"]);
});

test("partitionByDeck: a single newly-eligible note is enough (D91 — no floor of any kind)", () => {
  const { newlyEligibleByDeck } = partitionByDeck([fixtureNote({ id: "n1", type: "word", pos: "substantiv" })], new Set());
  assert.deepEqual(newlyEligibleByDeck.get("lexic").map((n) => n.id), ["n1"]);
});
