import { assignDeck } from "./deckAssignment.js";

// Splits a pulled+audio-filtered note list into already-minted (by hub's own
// ledger, D44) and newly-eligible, then groups the newly-eligible ones by
// deck assignment. `mintedNoteIds` is a Set of note ids already in
// `minted_notes` — the caller queries this against hub's database so this
// function stays pure/testable without a live connection.
//
// deck-rollover: `assignDeck` returns a deck FAMILY key now, not a literal
// code (D-DR3) — this function's grouping is unchanged, it just groups by
// family key instead. Resolving a family to its actual active deck code
// happens later, once per family per run, in `pipeline.js`'s `pullAndAssign`.
//
// No minimum-batch floor (D91 — supersedes the earlier 6-note floor):
// lag-11 is no longer a same-batch property to wait for enough cards to
// satisfy, so every deck with at least one newly-eligible note mints and
// publishes this run.
export function partitionByDeck(notes, mintedNoteIds) {
  const alreadyMinted = [];
  const byDeck = new Map();

  for (const note of notes) {
    if (mintedNoteIds.has(note.id)) {
      alreadyMinted.push(note);
      continue;
    }
    const deck = assignDeck(note);
    if (!byDeck.has(deck)) byDeck.set(deck, []);
    byDeck.get(deck).push(note);
  }

  return { alreadyMinted, newlyEligibleByDeck: byDeck };
}
