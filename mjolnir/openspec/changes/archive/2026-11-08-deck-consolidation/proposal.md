## Why

10 decks split by type/PoS (`builder-sliding-window-shipping`'s per-deck
multiple-of-5 flush threshold) means several receive very little content
each — grammar, listening, and pronunciation in particular mint far fewer
notes than the word-PoS decks. A deck that rarely crosses 5 newly-staged
occurrences in a single run almost never reaches the next multiple of 5,
so its content sits staged-and-held for a very long time in practice —
not "permanently stranded" by the sliding-window design itself, but
functionally close to it for these specific decks given their real
volume. Consolidating into fewer, bigger decks concentrates volume so the
5-multiple threshold is actually reachable on a normal timescale.

## What Changes

- Collapse the 10 existing decks into 2 deck families (`deck-rollover`
  provides the mechanism; this change defines the actual families):
  - **Lexic** — every word-PoS type (substantiv, adjektiv, verb, adverb,
    preposisjon, konjunksjon/subjunksjon) plus expression (same `{A,E}`
    occurrence shape) — starts at **C30**.
  - **Practice** — grammar, listening, pronunciation (all single-occurrence
    types) — starts at **C20**.
- **C20 is reused, not kept as-is**: today's C20 (substantiv) moves to the
  Lexic family; C20 the deck code becomes Practice's starting point. This
  is a genuine repurposing of an existing code, not a rename — see
  design.md for why this means re-minting cards under new ids, not just
  flipping a `deck_code` column.
- **Real production data is migrated** (this is a single-user app, D01 —
  exactly one real device/install; `replay.js` already rebuilds
  `Cards[]`/`decks` entirely from hub's DB every publish, so only hub's
  tables need migrating, never the device directly): every existing
  `card_slots` row moves to a new id under its new family's active code,
  with `card_content`, `occurrence_shipments`, `pending_occurrences`,
  `staged_occurrences`, and `minted_notes` all repointed to match.
- **Study progress on migrated decks resets** (operator's explicit,
  informed choice, after the seen/unseen-preserving alternative was fully
  scoped and judged not worth the complexity) — the new decks start at
  `PullCounter: 0`; no attempt is made to reconstruct "already studied"
  state from the old per-deck `PullCounter` values.
- **The 8 old deck codes that aren't a family's starting point** (C21-C26,
  C27-C29) **are removed from the live decks array entirely**, not left
  as permanent empty entries — a new deck-removal capability, which must
  preserve mod 2119's requirement that every "C"-prefixed deck forms one
  contiguous block in the decks array.
- `builder/src/deckAssignment.js`'s `assignDeck` returns a family key
  (`deck-rollover`'s contract) resolving to `"lexic"`/`"practice"` instead
  of 10 individual deck codes.

## Capabilities

### New Capabilities
- `deck-removal`: removing a deck entirely from the live decks array,
  while preserving the app's category-contiguity requirement for whatever
  decks remain.

### Modified Capabilities
- `builder-pipeline`: deck assignment resolves to one of 2 families instead
  of 10 fixed decks; a one-time migration moves every existing card between
  deck codes.

## Impact

- `builder/src/deckAssignment.js`: `WORD_POS_DECK`/`TYPE_DECK` collapse
  into the two families (depends on `deck-rollover`'s `DECK_FAMILIES`).
- `hub/src/decks.js`: `DECK_ALLOCATION` becomes the 2 starting codes (C20,
  C30) instead of 10; the 8 retired codes' rows are removed (or marked
  retired — see design.md) once migration completes.
- A new one-time, operator-triggered migration script (not a regular
  auto-run hub migration, given its irreversible, data-transforming
  nature) — touches `card_slots`, `card_content`, `occurrence_shipments`,
  `pending_occurrences`, `staged_occurrences`, `minted_notes`.
- `src/injectDeck.js`: a new deck-removal function.
- **This is the riskiest of the three related changes** (migrates real
  production data, resets study progress on affected decks, removes live
  deck entries) — depends on `deck-rollover` landing first (the Lexic
  family will very likely need rollover immediately, given it absorbs 6
  decks' worth of content at once) and should get the most scrutiny/
  testing of the three before being applied to the real device.
