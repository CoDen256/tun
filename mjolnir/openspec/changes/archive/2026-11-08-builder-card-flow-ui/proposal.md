## Why

The builder operator currently cannot see which cards/occurrences are
shipped, staged (short of a deck's next multiple-of-5 flush), or pending
(sitting in the 11-batch spacing lag) without directly querying Postgres and
the published bundle by hand — this was done manually during this review to
diagnose a reported "decks don't publish in multiples of 5" bug, which turned
out not to be a bug in the flush mechanism (`occurrence-shipment-windowing`
is working exactly as specified) but a visibility gap: a deck that was
already off the 5-grid before that mechanism existed (`C20`) is correctly,
silently waiting for enough new content to realign, with nothing surfacing
that it's been stuck for 9+ days. The existing forecast page also uses one
ambiguous label — "queue depth" — for two unrelated waits (staged-short-of-5
vs. pending-11-batch-lag), which was the proximate cause of the operator's
confusion. This change replaces manual SQL archaeology with a per-deck
card-flow view the operator can actually read — see design.md's Context for
the reference mockup:
https://claude.ai/code/artifact/211cc01b-af35-4070-8cc3-4b8d114d44b2

## What Changes

- Add a global totals strip to the builder UI: cards minted, occurrences
  eventual/shipped/staged/pending, as absolute counts (not just this-run
  deltas).
- Rework the existing "this run" forecast rail into a 5-stage pipeline rail
  (Pulled → Minted → Staged → Flushed → Published), each stage showing an
  absolute running total alongside this run's delta. "Pulled" shows a
  neutral note instead of a delta, since every run re-pulls the full
  eligible set rather than accumulating one.
- Retire the "queue depth" label everywhere it appears. Replace with two
  distinct, consistently-used terms: **Staged** (in `staged_occurrences`,
  short of the deck's next multiple-of-5 flush) and **Pending** (in
  `pending_occurrences`, the 11-batch spacing lag on a card's second side).
- Add a per-deck summary row: deck code/title, a compact 5-cell block
  showing the current in-progress batch's shipped/staged/open cells, a
  status chip (**On grid** / **Stalled — N d**) for decks whose published
  total has sat off the 5-multiple grid, and absolute totals alongside this
  run's delta.
- Add a per-deck expandable detail view showing one continuous "ship order"
  strip, in real `Cards[]` order: shipped occurrences, then staged
  occurrences, then **open** slots (occurrences still needed to complete the
  in-progress batch of 5 — not yet minted), then a "now" divider, then the
  projected pending zone (grouped by drain tier — how many more new cards
  must land deck-wide before that tier's occurrences drain together — not
  by batches of 5, since that isn't how they resolve). The real zone
  (shipped+staged+open) is laid out in explicit rows with a visible rule
  between every batch of 5. Every cell shows the real card ID, side letter,
  and source note text on hover.
- Add an explanatory note near the pending zone describing the actual drain
  mechanic — every pending row decrements by however many brand-new cards
  land in that deck in a run, and whichever rows cross zero drain together
  in that same run, not one at a time on a fixed schedule — so the UI
  doesn't imply a strict linear queue between "open" and "pending".

## Capabilities

### New Capabilities
- `card-flow-view`: the per-deck ship-order visualization (shipped / staged
  / open / pending zones, hover detail, absolute totals) described above.
  Covers both the data this view needs to be exposed from the builder
  server and the view's own display/terminology requirements.

### Modified Capabilities
- `builder-pipeline`: the existing forecast UI's "queue depth" concept is
  split into the two distinct terms above; the forecast rail gains absolute
  totals alongside its existing run-scoped deltas.

## Impact

- `builder/src/server.js` — forecast/dashboard HTML rendering and the
  `/builder/api/forecast` response shape gain the new per-deck totals,
  terminology, and ship-order data.
- `builder/src/stagedOccurrences.js`, `builder/src/pendingOccurrences.js` —
  read paths need extending (e.g. real per-tier `remaining` groupings,
  per-deck staged/shipped/eventual totals) beyond what `peekStaged` /
  `pendingQueueDepths` currently return; no change to the write/flush logic
  itself (`occurrence-shipment-windowing` is unaffected).
- `builder/src/batchHistory.js` — may be reused or extended to resolve real
  `Cards[]` order and source note text per card for the ship-order strip's
  hover detail.
- No change to the mobile app bundle, the mint/stage/flush/publish logic, or
  any patch/smali artifact — this is purely an operator-facing visibility
  change on top of existing, correctly-behaving mechanisms.
