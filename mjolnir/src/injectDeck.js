import { addOccurrence, nextDeckId, NEW_DECK_DEFAULTS, DECK_OCCURRENCE_LETTERS, CARD_AUDIO_TARGETS } from "./deckData.js";

// Three small, purpose-built operations layered on `deckData.js` (D79/D-P1):
// externally-keyed card creation, lag-11 multi-occurrence interleave, and
// upsert-by-id content regeneration. All three operate on the same in-memory
// `{decks, cards}` shape `loadDeckCardModel` returns; `builder` saves via the
// existing `saveDeckCardModel` path, unchanged.

// Inserts a new card with an externally-supplied id (from hub's `card_slots`
// ledger) — unlike `nextCardId`, this never scans the bundle for the next
// free sequence number. `id` must be exactly 6 characters (findings.md C3);
// occurrence strings built from it are 7, which every native card lookup
// hard-codes.
export function createCard(cards, { id, deckId, N, E, D, X, A }) {
  if (typeof id !== "string" || id.length !== 6) {
    throw new Error(`card id must be exactly 6 characters — got "${id}"`);
  }
  if (cards.some((c) => c.ID === id)) {
    throw new Error(`card id "${id}" already exists`);
  }
  if (!CARD_AUDIO_TARGETS.includes(A)) {
    throw new Error(`card audio target A must be one of ${CARD_AUDIO_TARGETS.join(", ")} — got "${A}"`);
  }
  const card = { DECK_ID: deckId, ID: id, N, E, D, X, A };
  cards.push(card);
  return card;
}

// Computes an order of (cardId, letter) pairs for a freshly-minted block of
// cards, achieving the largest lag between each card's own occurrences that
// the block size allows (C6: minimum-lag re-insertion — a card's own
// occurrences should land at least `minLag` apart, i.e. at least two
// pull-blocks of 5 apart per C4, when the block is large enough to allow it;
// for a block only as large as the 6-note floor, 2 occurrences/card cannot
// reach 11 apart — 12 slots cannot give every one of 6 pairs an 11-gap — the
// floor exists only to avoid the degenerate 1-card case where lag is zero by
// construction, not to guarantee 11 for every batch), then calls the
// existing `addOccurrence` once per pair in that order. Never touches
// `addOccurrence`'s internals.
//
// `occurrenceSetFor(cardId)` returns that card's ordered list of direction
// letters (e.g. `["N", "E"]`, `["A", "E", "N"]`) — the projector (task 4.6)
// decides this per note type.
export function interleaveOccurrences(deck, newCardIds, occurrenceSetFor, { minLag = 11 } = {}) {
  const pending = new Map(newCardIds.map((id) => [id, [...occurrenceSetFor(id)]]));
  for (const [id, letters] of pending) {
    for (const letter of letters) {
      if (!DECK_OCCURRENCE_LETTERS.includes(letter)) {
        throw new Error(`invalid occurrence letter "${letter}" for card "${id}"`);
      }
    }
  }

  const order = [];
  const lastEmittedAt = new Map();

  while ([...pending.values()].some((q) => q.length > 0)) {
    let emittedThisPass = false;
    for (const id of newCardIds) {
      const queue = pending.get(id);
      if (queue.length === 0) continue;
      const last = lastEmittedAt.get(id);
      if (last !== undefined && order.length - last < minLag) continue;
      order.push({ cardId: id, letter: queue.shift() });
      lastEmittedAt.set(id, order.length - 1);
      emittedThisPass = true;
    }
    if (emittedThisPass) continue;

    // No pending card can satisfy minLag yet (block too small to reach it for
    // everyone at once) — emit whichever ready card has waited longest, so
    // the block still achieves the maximum lag its size allows rather than
    // stalling.
    let best = null;
    for (const id of newCardIds) {
      const queue = pending.get(id);
      if (queue.length === 0) continue;
      const last = lastEmittedAt.get(id) ?? -Infinity;
      if (best === null || last < best.last) best = { id, last };
    }
    const queue = pending.get(best.id);
    order.push({ cardId: best.id, letter: queue.shift() });
    lastEmittedAt.set(best.id, order.length - 1);
  }

  for (const { cardId, letter } of order) {
    addOccurrence(deck, cardId, letter);
  }
}

// Overwrites an existing card's content fields by id — never its identity
// (`ID`/`DECK_ID`) and never a deck's `Cards[]`. Throws on zero or multiple
// matches rather than silently picking one (card ids are globally unique and
// permanent by construction — a collision means something upstream is wrong,
// not something to paper over).
export function upsertCardContent(cards, id, { N, E, D, X, A } = {}) {
  const matches = cards.filter((c) => c.ID === id);
  if (matches.length === 0) throw new Error(`no card with id "${id}"`);
  if (matches.length > 1) throw new Error(`multiple cards with id "${id}" — ids must be unique`);

  const card = matches[0];
  if (A !== undefined && !CARD_AUDIO_TARGETS.includes(A)) {
    throw new Error(`card audio target A must be one of ${CARD_AUDIO_TARGETS.join(", ")} — got "${A}"`);
  }
  if (N !== undefined) card.N = N;
  if (E !== undefined) card.E = E;
  if (D !== undefined) card.D = D;
  if (X !== undefined) card.X = X;
  if (A !== undefined) card.A = A;
  return card;
}

// Creates `name` as a new deck if it doesn't already exist, using the same
// `nextDeckId`/`NEW_DECK_DEFAULTS` logic the manual editor's `POST /decks`
// route already uses (ui.js) — reused here for the one-time creation of
// C20–C29 (D-P1). Idempotent: returns the existing deck untouched if `name`
// is already present, since after the first run these decks exist forever.
export function ensureDeck(decks, { name, title, overrides = {} }) {
  const existing = decks.find((d) => d.Name === name);
  if (existing) return existing;

  const deck = { ID: nextDeckId(decks), Name: name, Title: title || "" };
  for (const [key, defaultValue] of Object.entries(NEW_DECK_DEFAULTS)) {
    deck[key] = overrides[key] !== undefined ? overrides[key] : defaultValue;
  }
  deck.Cards = [];
  decks.push(deck);
  return deck;
}

// deck-descriptions (D-DD1): a narrow, single-purpose update — touches
// ONLY `Description` on an already-existing deck, never anything else.
// Deliberately NOT a generalized "merge overrides into an existing deck"
// path on `ensureDeck` itself, which would risk exposing every other
// override key (PullCounter, MaxInterval, ...) to the same already-
// existing-deck update, corrupting live state `ensureDeck`'s own
// idempotent-return-untouched contract exists specifically to protect.
export function syncDeckDescription(decks, name, description) {
  const deck = decks.find((d) => d.Name === name);
  if (deck && description !== undefined) deck.Description = description;
}

// deck-consolidation: the same narrow sync, for `Title` — needed because a
// deck code can now be REUSED by a different family after a one-time
// migration (C20: "Substantiv" before, "Practice" after) without its
// bundle entry ever being recreated. Without this, `ensureDeck`'s
// idempotent-return-untouched contract would leave a repurposed deck
// showing its old, wrong title on-device forever — nothing else in the
// normal publish flow ever revisits an existing deck's `Title`.
export function syncDeckTitle(decks, name, title) {
  const deck = decks.find((d) => d.Name === name);
  if (deck && title !== undefined) deck.Title = title;
}

// deck-removal (D-DC4): removes `name`'s entry entirely via a plain array
// splice — preserves mod 2119's same-category contiguity requirement for
// whatever decks remain, AS LONG AS the caller only ever removes a deck
// that's part of the same contiguous category block as the decks staying
// behind (true for deck-consolidation's retired codes, all "C"-prefixed
// alongside the two kept "C" codes). No reordering of survivors is needed —
// removing one entry and leaving the rest in their relative order preserves
// contiguity of whatever subset remains.
//
// This module stays pure/synchronous like every other function here — it
// has no DB connection of its own, so it can't check `card_slots` itself.
// `cardCount` is the caller's job to supply (the migration script has the
// live connection); passing a nonzero count refuses the removal and leaves
// `decks` untouched, matching deck-removal's "confirm zero references
// first" contract.
export function removeDeck(decks, name, { cardCount = 0 } = {}) {
  const index = decks.findIndex((d) => d.Name === name);
  if (index === -1) throw new Error(`no such deck "${name}"`);
  if (cardCount > 0) {
    throw new Error(`cannot remove deck "${name}" — ${cardCount} card_slots row(s) still reference it`);
  }
  decks.splice(index, 1);
}
