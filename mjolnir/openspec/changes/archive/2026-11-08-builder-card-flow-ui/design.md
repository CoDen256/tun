## Context

The builder forecast page (`buildForecastBody` in `builder/src/server.js`)
already reports per-deck forecast data (`newlyEligibleCount`,
`wouldFlushCount`, `wouldHoldCount`, `pendingQueueDepth`,
`pendingOldestRemaining`) via `runForecast` in `pipeline.js`, and past
batches via `batchHistory.js`'s `occurrencesForBuild`/`recentBatches`. None
of this exposes a deck's **absolute** lifetime totals (cards minted,
occurrences shipped/staged/pending) or the deck's real `Cards[]` order —
only this-run deltas and forecast deltas. A working HTML mockup ("Builder —
Card Flow", published at
https://claude.ai/code/artifact/211cc01b-af35-4070-8cc3-4b8d114d44b2) was
iterated with the operator across several rounds and is the visual/
interaction reference for this design — the global totals strip, the
5-stage pipeline rail, the per-deck status chip and 5-cell progress block,
and the continuous shipped→staged→open→now→pending ship-order strip (with
real card id/side/note-text hover tooltips and batch-of-5 divider rules) all
match that mockup's final iteration. It was built against a point-in-time
dump of `tun-backup/mjolnir.sql` + `stabbur.sql` + `build/b000027.js`, not
live endpoints.

During that review, two decks were inspected end-to-end: `C30` (healthy,
on-grid) and `C20` (stuck at 3/4 occurrences, off-grid since before
`occurrence-shipment-windowing` existed). The flush mechanism itself was
confirmed correct — `C20`'s stall is a content-volume problem (one
qualifying note roughly every 9 days), not a bug — and the accepted
trade-off that a thin deck's tail may sit staged indefinitely is already
documented in `occurrence-shipment-windowing`'s spec. This change does not
revisit that trade-off; it makes the resulting state (and the distinction
between "open"/unminted and "pending"/counting-down) legible to the
operator.

## Goals / Non-Goals

**Goals:**
- Expose, per deck: cards minted (absolute), occurrences eventual (absolute,
  derived from each note type's occurrence shape), shipped (absolute),
  staged (absolute, currently outstanding — not a this-run delta), and
  pending grouped by drain tier (real `remaining` values from
  `pending_occurrences`, not estimates).
- Expose a deck's real `Cards[]` order (card id, side letter, source note
  text) so the UI can render the actual ship-order strip, not a
  reconstruction.
- Replace "queue depth" everywhere in the builder UI with the two
  consistently-applied terms `Staged` and `Pending`.
- Keep this entirely additive to `runForecast`/the forecast page — no change
  to mint/stage/drain/flush/publish logic.

**Non-Goals:**
- No change to the 5-multiple flush mechanism, the 11-batch spacing lag
  countdown, or any write path in `pipeline.js`, `stagedOccurrences.js`, or
  `pendingOccurrences.js`.
- No escape hatch / manual override for a stalled deck (e.g. force-ship
  short of 5) — that is a product decision explicitly left open, not part of
  this change.
- No fix for the two cards currently misrouted into `C30` that belong in
  `C20` — that is `practice-deck-remint`, a separate change.
- No live/real-time updates (polling, websockets) — the existing
  request-on-load forecast page pattern is kept.

## Decisions

**Compute absolute totals from existing tables, not a new materialized
summary.** `card_slots` (count per deck = cards minted), `occurrence_shipments`
(count per deck = shipped), `staged_occurrences` (count per deck = staged),
`pending_occurrences` (count + `remaining` distribution per deck = pending).
"Occurrences eventual" per deck is derived, not stored: single-occurrence
decks (practice family: grammar/listening/pronunciation) contribute 1 per
card; two-occurrence decks (lexic family: word/expression) contribute 2 per
card. This mirrors `splitOccurrences`' existing `immediate`/`queued` split in
`pipeline.js` rather than introducing a second source of truth for "how many
sides does this family have."
- *Alternative considered*: store a running total per deck in a new
  `deck_totals` table, updated on every write. Rejected — every input table
  already supports a cheap `COUNT(*)` per deck, and a derived-summary table
  is one more place the three could drift out of sync during a crashed run.

**Resolve real `Cards[]` order from `occurrence_shipments` (shipped) +
`staged_occurrences` (staged), not by re-reading the published bundle file.**
Both tables already carry enough to reconstruct order: `occurrence_shipments`
ordered by `id ASC` is shipped order (same guarantee `occurrencesForBuild`
already relies on); `staged_occurrences` ordered by `id ASC` is FIFO staged
order (same guarantee `flushShippable`/`peekStaged` already rely on).
Concatenating the two gives the exact sequence that will land in `Cards[]`
once the open slot(s) fill. The published bundle file is never the source of
truth for this UI — it's a point-in-time snapshot and may not exist locally
in every deployment.
- *Alternative considered*: parse the active bundle file directly (as this
  review did manually against `build/b000027.js`). Rejected for the real
  implementation — ties the UI to bundle file availability/format, and the
  DB tables already guarantee the same ordering invariants the bundle was
  built from.

**Pending's "drain tier" grouping is a live `GROUP BY remaining`, not a
fixed schedule.** `pendingQueueDepths` already returns per-deck depth +
oldest `remaining`; this change extends that to the full per-remaining-value
breakdown (count + card list) so the UI can render "+N away" tiers exactly as
designed, and the accompanying explanatory copy (confirmed against
`drainPendingOccurrences`'s actual behavior) stays accurate: all pending rows
in a deck decrement by that run's `newACount` together, and whichever cross
zero drain together in the same run — not one row at a time on a schedule.
- *Alternative considered*: show pending cards as a flat FIFO list ordered by
  `remaining` only, no tier grouping. Rejected — this is exactly the
  framing that led the operator to assume a strict one-at-a-time queue,
  which the mockup iteration found actively confusing.

**Render the ship-order strip server-side as part of the existing HTML
dashboard, not as a new client-side app.** The forecast/dashboard page is
currently server-rendered HTML (`renderForecastPage`,
`buildForecastBody`) with vanilla JS for the publish button; this change
follows the same pattern — a new `buildCardFlowSection` (or equivalent)
rendered into the same page, using the new per-deck data. No new frontend
framework/build step.
- *Alternative considered*: a separate SPA served at a new route. Rejected —
  disproportionate for one additional section of an existing operator
  console, and breaks the "one page, no build step" pattern every other
  builder page already follows.

**Terminology is enforced as a naming rule, not just a UI copy choice.**
Any new field/variable introduced by this change that represents "short of
next multiple of 5" is named with `staged`; anything representing "11-batch
spacing lag" is named with `pending`. `pendingQueueDepth` (forecast's
existing field) keeps its name since it already says `pending`; no renaming
of existing API fields is required, only addition of new ones following the
same convention.

## Risks / Trade-offs

**[Risk] Reconstructing full ship order from `occurrence_shipments` +
`staged_occurrences` could be a large per-deck row scan for an old, large
deck (e.g. a stock deck with thousands of occurrences).** → Mitigation:
scope the full-strip render to decks that actually went through this
builder (i.e. have `card_slots` rows), which in practice is the handful of
family-managed decks (`lexic`/`practice` and their rollover codes), not the
stock `A`/`B`/`Z` decks baked into the original app — those never appear in
`card_slots` and are out of scope for this view entirely.

**[Risk] The "open" slot count can be ambiguous when a deck is already past
its most recent multiple of 5 by more than 5 (shouldn't happen under correct
flush logic, but would misrender if it did).** → Mitigation: compute "open"
as `nextMultipleOf5(shipped) - (shipped + staged)` and clamp at 0 in the
render layer; treat a negative value as a data-integrity signal worth
logging, not a crash.

**[Risk] Tooltip note text requires a join through `card_content`/`notes`
that may be missing for some older or hand-edited cards (e.g. a custom
deck's manually-created card with no backing note).** → Mitigation: fall
back to showing card id + side only when note text isn't resolvable, same
pattern `batchHistory.js`'s `stripHtml` already tolerates for empty content.

## Migration Plan

Purely additive — no schema change, no data migration, no deploy
coordination with the mobile app or the hub service. Ship as a single PR to
`builder/src/`. Rollback is a plain revert; nothing durable is written by
this change.

## Open Questions

- Should a stalled deck (`Stalled — N d`) eventually surface a notification
  or just stay a pull-to-check indicator on this page? Left open — product
  decision, not blocking this change.
- Should the "open" slot concept extend to showing *which* kind of future
  content would fill it (a brand-new mint vs. the nearest pending tier
  draining), or is the current "either, see note" framing sufficient? The
  mockup took the latter approach; revisit if operators find it unclear in
  practice.
