## Why

The app's own `drawNewCards` (module 2110) draws from a deck's `Cards[]`
at an offset of `5 × PullCounter` — a position, not a count. `PullCounter`
only ever increments by a full `+1` per batch, even when the batch had
fewer than 5 cards, so once a deck's size isn't a multiple of 5 the offset
permanently overshoots the array. This isn't just the cosmetic >100%
completion display bug (`deck-completion-display-fix`) — it's a real
softlock: once overshot, no future single new card can ever close the gap,
because the offset never moves back. The deck is stuck "done" forever,
even though genuinely new, unlocked content exists in it.

Confirmed this always was true for custom decks and never for stock ones,
because stock decks were authored in clean multiples of 5 (so the offset
and the array length always agree) and custom decks grow one or two
occurrences at a time via `builder`'s existing staggered shipping (D91).

Fixing this on the app side (clamping the display, removing the resulting
false-positive popup gate — `deck-completion-display-fix`) only hides the
symptom; it doesn't stop the softlock from happening. The real fix is
making sure the condition that causes it — a deck's `Cards.length` ever
landing on a non-multiple-of-5 — never occurs at all. That's a builder-side
guarantee, not an app-side patch.

## What Changes

- `builder` gains a second, persistent per-deck staging buffer (alongside
  the existing D91 11-countdown queue) holding occurrences that are
  eligible to ship (fresh `A`'s from newly-minted cards, `E`'s whose
  11-countdown just drained) but not yet appended to the deck's `Cards[]`.
- On every publish run, each deck's staging buffer only ever flushes the
  **largest multiple of 5** it currently holds — e.g. 11 staged → ship 10,
  hold 1; 9 staged → ship 5, hold 4; 4 staged → ship 0, hold all 4. The
  held remainder persists across however many future runs it takes to
  reach the next multiple of 5 (sliding window — accepted that some cards
  sit staged indefinitely; this mirrors the existing D91 queue's own
  "eventually, not immediately" acceptance).
- **Minting is unaffected** — card_slots/content/audio generation for a
  newly-eligible note happens exactly when it does today, every run.
  Only the shipping step (appending to `Cards[]`/recording in
  `occurrence_shipments`) is deferred.
- A run that stages occurrences but ships none for a given deck (not
  enough to reach a multiple of 5 yet) logs that outcome — no operator
  action needed, no UI surface required, a log line is sufficient.
- **Revert `deck-completion-display-fix` entirely**: delete the
  `2119-deck-completion-display` patch-back pair, its tests, and the
  `deck-completion-display-fix` change folder (which was never archived).
  Once the builder guarantees every deck's `Cards.length` is always a
  multiple of 5, the overshoot this patch worked around can't happen, so
  the patch (and the whole display-fix approach) becomes dead weight
  rather than defensive insurance — the operator's explicit call, since
  the fix is moving to its actual root cause.

## Capabilities

### New Capabilities
- `occurrence-shipment-windowing`: deck occurrence counts only ever grow
  in multiples of 5, guaranteeing the app's own draw-offset math can never
  overshoot the array.

### Modified Capabilities
- `occurrence-shipment-log` (existing spec, if present — confirm exact
  name against `openspec/specs/` at implementation time): shipment
  recording now only happens for occurrences actually flushed this run,
  not every occurrence that became eligible this run.

## Impact

- `builder/src/pipeline.js`: `appendImmediateOccurrences`/`drainThenQueue`
  no longer call `addOccurrence` directly — they stage instead; a new
  per-deck flush step (floor-to-multiple-of-5) runs once per deck per
  publish, after minting/draining, calling `addOccurrence` only for what's
  actually flushed.
- `builder/src/pendingOccurrences.js` (or a new sibling file — exact shape
  in design.md): new staging-buffer storage, separate from the existing
  11-countdown queue.
- A new hub migration for the staging table.
- `builder/test/pipeline.test.js` and friends: new tests for the
  floor-to-5 flush logic, the "not enough yet" log-only case, and that
  minting is unaffected by staging.
- Deleted: `patches/js/2119-deck-completion-display.{baseline,edited}.js`,
  `test/unit/deckCompletionDisplay.test.js`,
  `openspec/changes/deck-completion-display-fix/`.
