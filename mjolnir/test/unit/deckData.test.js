import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { runExplode } from "../../src/commands/explode.js";
import {
  loadDeckCardModel,
  deckCategory,
  validateReferences,
  nextCardId,
  stripHtml,
  cardDirectionsInDeck,
  addOccurrence,
  updateOccurrenceLetter,
  removeOccurrence,
  searchDecks,
  searchCards,
} from "../../src/deckData.js";
import {
  buildFixtureBundleSource,
  fixtureDecks,
  fixtureCards,
} from "../fixtures/deckCardFixture.js";

function withFixtureBundle(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-deckdata-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, buildFixtureBundleSource());
  runExplode(bundlePath);
  try {
    return fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("locates the deck-catalog and card-content modules by structural shape", () => {
  withFixtureBundle((bundlePath) => {
    const { deckModuleId, cardModuleId, decks, cards } = loadDeckCardModel(bundlePath);
    assert.equal(deckModuleId, "100");
    assert.equal(cardModuleId, "101");
    assert.equal(decks.length, 2);
    assert.equal(cards.length, 3);
  });
});

test("derives a deck's category as the first character of its Name", () => {
  const [deckA, deckB] = fixtureDecks();
  assert.equal(deckCategory(deckA), "A");
  assert.equal(deckCategory(deckB), "B");
});

test("validation passes for referentially consistent decks/cards", () => {
  const { valid, errors } = validateReferences(fixtureDecks(), fixtureCards());
  assert.equal(valid, true);
  assert.deepEqual(errors, []);
});

test("validation catches a deck referencing a nonexistent card", () => {
  const decks = fixtureDecks();
  decks[0].Cards.push({ Card: "A01999N", P: "N" });
  const { valid, errors } = validateReferences(decks, fixtureCards());
  assert.equal(valid, false);
  assert.match(errors.join("\n"), /A01999/);
});

test("validation catches a card with an unresolved DECK_ID", () => {
  const cards = fixtureCards();
  cards[0].DECK_ID = "Z99";
  const { valid, errors } = validateReferences(fixtureDecks(), cards);
  assert.equal(valid, false);
  assert.match(errors.join("\n"), /Z99/);
});

test("cardDirectionsInDeck maps each card id to its set of direction letters", () => {
  const [deckA, deckB] = fixtureDecks();
  const a = cardDirectionsInDeck(deckA);
  assert.deepEqual([...a.get("A01001")].sort(), ["N"]);
  assert.deepEqual([...a.get("A01002")].sort(), ["N"]);

  const b = cardDirectionsInDeck(deckB);
  assert.deepEqual([...b.get("B01001")].sort(), ["E", "N"]);
});

test("cardDirectionsInDeck handles a deck with no Cards", () => {
  const directions = cardDirectionsInDeck({ Name: "X01", Cards: [] });
  assert.equal(directions.size, 0);
});

test("addOccurrence appends a new occurrence with the given letter", () => {
  const deck = fixtureDecks()[0];
  addOccurrence(deck, "A01001", "E");
  assert.deepEqual(deck.Cards[deck.Cards.length - 1], { Card: "A01001E", P: "N" });
  assert.equal(deck.Cards.length, 3);
});

test("addOccurrence rejects an invalid letter", () => {
  const deck = fixtureDecks()[0];
  assert.throws(() => addOccurrence(deck, "A01001", "Z"), /invalid occurrence letter/);
});

test("updateOccurrenceLetter changes an occurrence's letter in place, preserving position", () => {
  const deck = fixtureDecks()[0];
  updateOccurrenceLetter(deck, 0, "A");
  assert.deepEqual(deck.Cards[0], { Card: "A01001A", P: "N" });
  assert.equal(deck.Cards.length, 2);
  assert.equal(deck.Cards[1].Card, "A01002N");
});

test("updateOccurrenceLetter rejects an out-of-range index", () => {
  const deck = fixtureDecks()[0];
  assert.throws(() => updateOccurrenceLetter(deck, 99, "N"), /no occurrence at index 99/);
});

test("updateOccurrenceLetter rejects an invalid letter", () => {
  const deck = fixtureDecks()[0];
  assert.throws(() => updateOccurrenceLetter(deck, 0, "Q"), /invalid occurrence letter/);
});

test("removeOccurrence removes only the targeted occurrence", () => {
  const deck = fixtureDecks()[1];
  removeOccurrence(deck, 0);
  assert.equal(deck.Cards.length, 1);
  assert.equal(deck.Cards[0].Card, "B01001E");
});

test("removeOccurrence rejects an out-of-range index", () => {
  const deck = fixtureDecks()[0];
  assert.throws(() => removeOccurrence(deck, 99), /no occurrence at index 99/);
});

test("searchDecks matches deck titles case-insensitively", () => {
  const matches = searchDecks(fixtureDecks(), "deck a");
  assert.equal(matches.length, 1);
  assert.equal(matches[0].Name, "A01");
});

test("searchDecks returns nothing for an empty query", () => {
  assert.deepEqual(searchDecks(fixtureDecks(), "   "), []);
});

test("searchCards matches plain-text content, ignoring HTML markup", () => {
  const matches = searchCards(fixtureCards(), "q2");
  assert.equal(matches.length, 1);
  assert.equal(matches[0].ID, "A01002");
});

test("stripHtml removes tags and collapses whitespace", () => {
  assert.equal(
    stripHtml('<div class="center">Does Norwegian have<br><b class="bold">long</b> vowels?</div>'),
    "Does Norwegian have long vowels?"
  );
});

test("stripHtml handles empty/missing input", () => {
  assert.equal(stripHtml(""), "");
  assert.equal(stripHtml(undefined), "");
});

test("nextCardId picks the next sequence number", () => {
  assert.equal(nextCardId("A01", fixtureCards()), "A01003");
});

test("nextCardId handles non-contiguous existing sequence numbers", () => {
  const cards = [
    { ID: "C01001", DECK_ID: "C01" },
    { ID: "C01007", DECK_ID: "C01" },
    { ID: "C01003", DECK_ID: "C01" },
  ];
  assert.equal(nextCardId("C01", cards), "C01008");
});

test("nextCardId starts a fresh deck's sequence at 001", () => {
  assert.equal(nextCardId("D01", fixtureCards()), "D01001");
});
