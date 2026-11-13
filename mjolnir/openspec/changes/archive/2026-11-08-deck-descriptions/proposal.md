## Why

The app's deck-list screen already renders a `Description` field for every
deck (mod 2119: `content: "<div>" + t.Description + "</div>"`), and stock
decks ship with real description text there. Builder's own custom decks
(C20-C29) support the exact same field (`src/deckData.js`'s
`NEW_DECK_DEFAULTS.Description`) but it's never populated — every custom
deck `ensureDeck` creates always defaults it to `""`, so the operator's own
decks show a blank panel where stock decks show real content. This is a
pure gap-closing fix, not new on-device surface area.

## What Changes

- `hub`'s `decks` table gains a `description` column (operator-editable,
  alongside the existing `code`/`title`/`category`), seeded with a short
  default description per deck in `DECK_ALLOCATION`.
- A new `deckDescription(pool, deckCode)` helper in `builder/src/mint.js`,
  mirroring the existing `deckTitle(pool, deckCode)`.
- Every `ensureDeck` call site in `builder/src/pipeline.js` passes
  `overrides: { Description: <the deck's description> }`, so newly-created
  and already-existing custom decks alike get their real description baked
  into the published bundle (an existing deck's `Description` field updates
  on its next regen, the same way title/content already do — `ensureDeck`
  only sets fields at creation time today, so this also needs a path to
  update an EXISTING deck's `Description`, not just a brand-new one — see
  design.md).
- No change to the operator console's deck UI surface beyond exposing the
  new field for editing (same pattern as `publications.label`'s existing
  edit affordance).

## Capabilities

### New Capabilities
(none — this fills in an existing, already-defined on-device field)

### Modified Capabilities
- `hub-schema`: `decks` gains a `description` column.

## Impact

- `hub/migrations/`: new migration adding `decks.description`.
- `hub/src/decks.js`: `DECK_ALLOCATION` gains a `description` per deck;
  `seedDecks` writes it.
- `builder/src/mint.js`: new `deckDescription` export.
- `builder/src/pipeline.js`: every `ensureDeck` call site threads
  `Description` through.
- `src/injectDeck.js`: confirm/extend `ensureDeck` to update `Description`
  on an already-existing deck entry, not only set it at creation.
- No app-side patch changes — the on-device rendering of `Description`
  already exists and needs no modification.
