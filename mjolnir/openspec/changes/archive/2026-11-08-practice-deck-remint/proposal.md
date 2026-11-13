## Why

Two cards (`C30011`, `C30012`) live permanently in `C30`/Lexic even though
their source notes are now classified `pronunciation` and belong in
`C20`/Practice. This happened because they were minted before
`deck-consolidation` existed, under whatever deck assignment applied at the
time, and `deck-consolidation`'s migration deliberately keeps a card under
the family it was *actually minted into* rather than re-deriving it from the
note's current type — by design, not a bug. The operator has decided this
specific case should be corrected: C20/Practice is a genuinely thin content
stream, and losing 2 of its only 4 rightful cards to a misclassification
window makes an already-stalled deck's "stalled" status look worse than its
real content volume. Checking the current `userdata` snapshot confirms this
is fixable **right now without risk**: neither card has been pulled by any
real device (`C30` never appears in any device's `decksStatus`), so moving
them does not shift any already-studied card's position. That window closes
the moment any device studies `C30`.

## What Changes

- Add a one-time, precondition-gated correction: move `card_slots` for
  `C30011` and `C30012` from `C30` to `C20`, repointing every referencing
  table (`card_content`, `minted_notes`, `occurrence_shipments`,
  `staged_occurrences`, `pending_occurrences`) the same way
  `deckConsolidationMigration.js` already does for its own moves — new ids
  `C20005`/`C20006`, assigned by the normal next-`card_no` rule.
- The correction tool SHALL refuse to run if any device's synced userdata
  shows evidence that the source deck (`C30`) has ever been pulled (a
  nonzero `PullCounter`, or any `C30`-prefixed card id present in a device's
  `totalCards`) — this is the one invariant that makes the move safe at all
  (`replay.js` rejoins each shipped occurrence's deck from `card_slots`'s
  *current* `deck_code` on every publish, so moving a card already woven
  into a studied deck's `Cards[]` would shift every later occurrence's
  position for that device).
- **BREAKING** (data, not API): the next publish after this correction runs
  will show `C30` with 33 occurrences instead of 35 (2 fewer) and `C20` with
  6 instead of 4 — any dashboard, cached count, or external report built
  against the pre-correction totals needs to expect this one-time shift.

## Capabilities

### New Capabilities
- `card-deck-reassignment`: a safe, precondition-gated operator tool for
  moving a `card_slots` row (and everything that references it) to a
  different deck, refusing to run unless it can confirm the move cannot
  shift any already-studied device's existing pull position. General enough
  to reuse if a similar misclassification is found again, not a one-off
  script thrown away after this fix.

### Modified Capabilities
(none — `deck-consolidation`'s existing requirements are unchanged; this is
a new, narrower tool, not a change to that migration's own behavior)

## Impact

- `hub/src/` — new reassignment function alongside
  `deckConsolidationMigration.js` (shares its repoint-every-table pattern),
  plus the userdata precondition check (new read path against `userdata`).
- `builder/src/deckFamilies.js`, `builder/src/mint.js` — unaffected; next
  `card_no` for `C20` is already computed the normal way
  (`resolveActiveDeckCode`/existing `MAX(card_no)` query), no special-casing
  needed for the reassigned ids.
- One-time operator action: run the tool once for `C30011`→`C20005` and
  `C30012`→`C20006`, then a normal publish.
