import test from "node:test";
import assert from "node:assert/strict";
import { createCard, interleaveOccurrences, upsertCardContent, ensureDeck, syncDeckDescription, syncDeckTitle, removeDeck } from "../../src/injectDeck.js";
import { fixtureDecks, fixtureCards } from "../fixtures/deckCardFixture.js";

test("createCard inserts a new card keyed by an externally-supplied id", () => {
  const cards = fixtureCards();
  const card = createCard(cards, { id: "A01003", deckId: "A01", N: "n", E: "e", D: "Deck A1", X: "x", A: "N" });
  assert.equal(cards.length, 4);
  assert.deepEqual(card, { DECK_ID: "A01", ID: "A01003", N: "n", E: "e", D: "Deck A1", X: "x", A: "N" });
});

test("createCard rejects an id that isn't exactly 6 characters", () => {
  const cards = fixtureCards();
  assert.throws(() => createCard(cards, { id: "A0100", deckId: "A01", N: "n", E: "e", D: "d", X: "x", A: "N" }), /6 characters/);
  assert.throws(() => createCard(cards, { id: "A010033", deckId: "A01", N: "n", E: "e", D: "d", X: "x", A: "N" }), /6 characters/);
});

test("createCard rejects a duplicate id and an invalid audio target", () => {
  const cards = fixtureCards();
  assert.throws(() => createCard(cards, { id: "A01001", deckId: "A01", N: "n", E: "e", D: "d", X: "x", A: "N" }), /already exists/);
  assert.throws(() => createCard(cards, { id: "A01003", deckId: "A01", N: "n", E: "e", D: "d", X: "x", A: "Q" }), /audio target/);
});

test("interleaveOccurrences achieves lag >= 11 for a block large enough to allow it", () => {
  const deck = { Name: "C20", Cards: [] };
  const ids = Array.from({ length: 23 }, (_, i) => `C20${String(i + 1).padStart(3, "0")}`);
  interleaveOccurrences(deck, ids, () => ["N", "E"]);

  assert.equal(deck.Cards.length, ids.length * 2);
  const positionOf = new Map();
  deck.Cards.forEach((ref, i) => {
    const cardId = ref.Card.slice(0, -1);
    const letter = ref.Card.slice(-1);
    if (letter === "N") positionOf.set(cardId, i);
    else {
      const nPos = positionOf.get(cardId);
      assert.ok(nPos !== undefined, `E occurrence for ${cardId} appeared before its N`);
      assert.ok(i - nPos >= 11, `lag for ${cardId} was only ${i - nPos}, want >= 11`);
    }
  });
});

test("interleaveOccurrences on a 6-card two-occurrence block (the hard floor) maximizes achievable lag without crashing", () => {
  const deck = { Name: "C20", Cards: [] };
  const ids = ["C20001", "C20002", "C20003", "C20004", "C20005", "C20006"];
  interleaveOccurrences(deck, ids, () => ["N", "E"]);

  assert.equal(deck.Cards.length, 12);
  // 12 slots, 6 cards, 2 occurrences each: the provably-optimal minimum lag
  // achievable for every card simultaneously is 6 (all N's then all E's, in
  // the same relative order) — 11 is mathematically unreachable here, same
  // reasoning as the hard floor existing at all (one card alone gets lag 0).
  const positionOf = new Map();
  deck.Cards.forEach((ref, i) => {
    const cardId = ref.Card.slice(0, -1);
    const letter = ref.Card.slice(-1);
    if (letter === "N") positionOf.set(cardId, i);
    else {
      const lag = i - positionOf.get(cardId);
      assert.equal(lag, 6);
    }
  });
});

test("interleaveOccurrences handles mixed occurrence sets per card", () => {
  const deck = { Name: "C20", Cards: [] };
  const ids = Array.from({ length: 15 }, (_, i) => `C20${String(i + 1).padStart(3, "0")}`);
  interleaveOccurrences(deck, ids, (id) => (id === ids[0] ? ["A", "E", "N"] : ["N"]));
  assert.equal(deck.Cards.length, 14 + 3);
});

test("interleaveOccurrences rejects an invalid letter", () => {
  const deck = { Name: "C20", Cards: [] };
  assert.throws(() => interleaveOccurrences(deck, ["C20001"], () => ["Q"]), /invalid occurrence letter/);
});

test("upsertCardContent overwrites only content fields, leaving ID/DECK_ID untouched", () => {
  const cards = fixtureCards();
  const updated = upsertCardContent(cards, "A01001", { N: "new N", E: "new E" });
  assert.equal(updated.N, "new N");
  assert.equal(updated.E, "new E");
  assert.equal(updated.X, "<div>X1</div>");
  assert.equal(updated.ID, "A01001");
  assert.equal(updated.DECK_ID, "A01");
});

test("upsertCardContent never touches Cards[] or any other card", () => {
  const decks = fixtureDecks();
  const cards = fixtureCards();
  const before = JSON.parse(JSON.stringify(decks));
  upsertCardContent(cards, "A01001", { N: "edited" });
  assert.deepEqual(decks, before);
  assert.equal(cards.find((c) => c.ID === "A01002").N, "<div>Q2</div>");
});

test("upsertCardContent throws on a nonexistent id", () => {
  const cards = fixtureCards();
  assert.throws(() => upsertCardContent(cards, "ZZZ999", { N: "x" }), /no card with id/);
});

test("upsertCardContent throws on multiple matches rather than silently picking one", () => {
  const cards = fixtureCards();
  cards.push({ ...cards[0] });
  assert.throws(() => upsertCardContent(cards, "A01001", { N: "x" }), /multiple cards/);
});

test("ensureDeck creates a new deck with nextDeckId/NEW_DECK_DEFAULTS, idempotently", () => {
  const decks = fixtureDecks();
  const deck = ensureDeck(decks, { name: "C20", title: "Substantiv" });
  assert.equal(deck.Name, "C20");
  assert.equal(deck.Title, "Substantiv");
  assert.equal(deck.ID, 2);
  assert.deepEqual(deck.Cards, []);
  assert.equal(deck.Enabled, true);
  assert.equal(decks.length, 3);

  const again = ensureDeck(decks, { name: "C20", title: "ignored on repeat" });
  assert.equal(again, deck);
  assert.equal(decks.length, 3);
});

test("ensureDeck accepts overrides for the deck defaults", () => {
  const decks = fixtureDecks();
  const deck = ensureDeck(decks, { name: "C27", title: "Listening", overrides: { MaxInterval: 20 } });
  assert.equal(deck.MaxInterval, 20);
  assert.equal(deck.AutoTickStreak, 1);
});

test("ensureDeck: a brand-new deck gets a real Description when passed as an override, not blank", () => {
  const decks = [];
  const deck = ensureDeck(decks, { name: "C30", title: "Lexic", overrides: { Description: "Vocabulary." } });
  assert.equal(deck.Description, "Vocabulary.");
});

test("ensureDeck: Description defaults to empty string when no override is given", () => {
  const decks = [];
  const deck = ensureDeck(decks, { name: "C20", title: "Substantiv" });
  assert.equal(deck.Description, "");
});

test("syncDeckDescription: updates only Description on an already-existing deck, no other field", () => {
  const decks = [{ Name: "C20", Title: "Substantiv", Description: "", PullCounter: 7, MaxInterval: 10 }];
  syncDeckDescription(decks, "C20", "Nouns.");
  assert.equal(decks[0].Description, "Nouns.");
  assert.equal(decks[0].PullCounter, 7, "PullCounter must never be touched");
  assert.equal(decks[0].MaxInterval, 10, "MaxInterval must never be touched");
  assert.equal(decks[0].Title, "Substantiv", "Title must never be touched");
});

test("syncDeckDescription: a nonexistent deck name is a silent no-op, not an error", () => {
  const decks = [{ Name: "C20", Description: "" }];
  assert.doesNotThrow(() => syncDeckDescription(decks, "C99-nonexistent", "x"));
  assert.equal(decks.length, 1, "no deck is created as a side effect");
});

test("syncDeckDescription: an undefined description leaves the existing value untouched", () => {
  const decks = [{ Name: "C20", Description: "already set" }];
  syncDeckDescription(decks, "C20", undefined);
  assert.equal(decks[0].Description, "already set");
});

// deck-consolidation: a deck code can be REUSED by a different family after
// migration (C20: "Substantiv" -> "Practice") — Title needs the exact same
// sync-on-every-publish treatment Description already got.
test("syncDeckTitle: updates only Title on an already-existing deck, no other field", () => {
  const decks = [{ Name: "C20", Title: "Substantiv", Description: "Nouns.", PullCounter: 7, MaxInterval: 10 }];
  syncDeckTitle(decks, "C20", "Practice");
  assert.equal(decks[0].Title, "Practice");
  assert.equal(decks[0].PullCounter, 7, "PullCounter must never be touched");
  assert.equal(decks[0].MaxInterval, 10, "MaxInterval must never be touched");
  assert.equal(decks[0].Description, "Nouns.", "Description must never be touched");
});

test("syncDeckTitle: a nonexistent deck name is a silent no-op, not an error", () => {
  const decks = [{ Name: "C20", Title: "Substantiv" }];
  assert.doesNotThrow(() => syncDeckTitle(decks, "C99-nonexistent", "x"));
  assert.equal(decks.length, 1, "no deck is created as a side effect");
});

test("syncDeckTitle: an undefined title leaves the existing value untouched", () => {
  const decks = [{ Name: "C20", Title: "already set" }];
  syncDeckTitle(decks, "C20", undefined);
  assert.equal(decks[0].Title, "already set");
});

// deck-removal: a decks array shaped like the real pre-consolidation state —
// 10 "C"-prefixed category decks (C20-C29) plus a non-"C" deck on each side,
// to prove removal never disturbs decks outside the category block being
// retired from.
function preConsolidationDecks() {
  const cCodes = ["C20", "C21", "C22", "C23", "C24", "C25", "C26", "C27", "C28", "C29"];
  return [
    { ID: 0, Name: "A01", Title: "Stock deck before", Cards: [] },
    ...cCodes.map((code, i) => ({ ID: i + 1, Name: code, Title: code, Cards: [] })),
    { ID: 11, Name: "D01", Title: "Stock deck after", Cards: [] },
  ];
}

function isContiguousBlock(decks, prefix) {
  const indexes = decks.map((d, i) => (d.Name.startsWith(prefix) ? i : -1)).filter((i) => i !== -1);
  if (indexes.length === 0) return true;
  return indexes[indexes.length - 1] - indexes[0] + 1 === indexes.length;
}

test("removeDeck: removing a deck with zero remaining references succeeds, and surviving 'C' decks stay contiguous", () => {
  const decks = preConsolidationDecks();
  for (const code of ["C21", "C22", "C23", "C24", "C25", "C26", "C27", "C28", "C29"]) {
    removeDeck(decks, code, { cardCount: 0 });
  }
  assert.deepEqual(
    decks.map((d) => d.Name),
    ["A01", "C20", "D01"]
  );
  assert.ok(isContiguousBlock(decks, "C"), "the one surviving 'C' deck trivially forms a contiguous block");
});

test("removeDeck: removing from the middle of the 'C' block keeps every remaining 'C' deck contiguous", () => {
  const decks = preConsolidationDecks();
  removeDeck(decks, "C24", { cardCount: 0 });
  removeDeck(decks, "C25", { cardCount: 0 });
  assert.ok(isContiguousBlock(decks, "C"), "C20-C23 and C26-C29 must still form one contiguous block with no gap");
  assert.equal(decks.find((d) => d.Name === "A01").ID, 0, "the non-'C' deck before the block is untouched");
  assert.equal(decks.find((d) => d.Name === "D01").ID, 11, "the non-'C' deck after the block is untouched");
});

test("removeDeck: a deck that still has referencing card_slots rows throws and changes nothing", () => {
  const decks = preConsolidationDecks();
  const before = JSON.parse(JSON.stringify(decks));
  assert.throws(() => removeDeck(decks, "C21", { cardCount: 3 }), /cannot remove deck "C21".*3 card_slots row/);
  assert.deepEqual(decks, before);
});

test("removeDeck: a nonexistent deck name throws", () => {
  const decks = preConsolidationDecks();
  assert.throws(() => removeDeck(decks, "C99-nonexistent"), /no such deck/);
});
