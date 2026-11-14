## Why

A deck's card id is `<deckCode><3-digit card_no>` — exactly 6 characters,
non-negotiable (`tun/docs/03-data-model.md`, mod 2112's `getCard`/mods
2110/2124/2131's `card.slice(0,6)`). That caps any single deck at 999
cards. The data model doc already names the intended mechanism ("`C30` =
`substantiv II` when `C20` hits 999") but it has never been implemented —
`builder/src/mint.js`'s `mintCardSlots` always mints into whatever single
deck code `assignDeck` returns, with no capacity check at all. This hasn't
mattered yet because today's 10-way type/PoS split keeps per-deck volume
low. `deck-consolidation` (a separate, dependent change) is about to
concentrate far more content into far fewer decks, making the 999 ceiling
reachable in practice — this change builds the rollover mechanism that
makes that safe.

## What Changes

- A **deck family**: a name, a starting deck code, and an ordered sequence
  of overflow codes used once the current one fills (e.g. family `lexic`:
  `C30`, `C31`, `C32`, ...). `builder/src/deckAssignment.js`'s per-type/PoS
  deck codes become per-family starting codes.
- Before minting into a family's currently-active deck, builder checks that
  deck's current card count; if it's at the 999 cap, the family's NEXT code
  in sequence becomes active instead — created on first use, both on the
  bundle side (`ensureDeck`, already idempotent) and on hub's side (a new
  `decks` row, auto-seeded with a derived title like `"<family title> II"`
  and an empty description, per `deck-descriptions`).
- `assignDeck`/`partitionByDeck` resolve a note's family, not a fixed deck
  code directly — the actual deck code is resolved per-run, since it can
  change once a family rolls over.
- No operator action required — rollover is fully automatic, the same way
  minting itself has no floor or manual step today.

## Capabilities

### New Capabilities
- `deck-rollover`: a deck family's automatic overflow to the next code in
  its sequence once the currently-active deck hits its 999-card capacity.

### Modified Capabilities
(none — `assignDeck`'s existing contract, "a note resolves to exactly one
deck code," is preserved; only the derivation of that code becomes
family-and-capacity-aware instead of a flat lookup table)

## Impact

- `builder/src/deckAssignment.js`: `WORD_POS_DECK`/`TYPE_DECK` become
  per-family starting codes; `assignDeck` returns a family identifier
  resolved to an actual code via the new rollover logic.
- `builder/src/mint.js`/`pipeline.js`: `mintCardSlots`'s deck-code
  resolution happens through the new capacity-aware lookup, not a direct
  `assignDeck` call.
- `hub/src/decks.js`: a new function to auto-create a rollover deck's row
  (title/description derivation), separate from the static
  `DECK_ALLOCATION`/`seedDecks` path used for a family's starting codes.
- No app-side patch changes — rollover produces ordinary deck codes the
  app already understands (still "C"-prefixed, still within mod 2119's
  contiguous-range assumption for that category).
