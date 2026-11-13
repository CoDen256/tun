## 1. Data layer — absolute totals

- [x] 1.1 Add a deck-totals query: cards minted (`COUNT(*)` on `card_slots`
      grouped by `deck_code`), occurrences shipped (`occurrence_shipments`),
      occurrences staged (`staged_occurrences`) — per deck.
- [x] 1.2 Derive "occurrences eventual" per deck from its family's
      occurrence shape (reuse `splitOccurrences`'s notion of
      immediate/queued letters rather than hardcoding a second
      single-vs-two-occurrence table).
- [x] 1.3 Extend `pendingQueueDepths` (or add a sibling function) to return
      the full per-deck breakdown grouped by `remaining`, each group's count
      and card list, not just depth + oldest `remaining`.
- [x] 1.4 Unit tests: deck-totals query against a seeded deck with known
      shipped/staged/pending counts; pending-by-tier grouping with multiple
      `remaining` values including ties.

## 2. Data layer — real ship order

- [x] 2.1 Add a function resolving a deck's real ship order: shipped
      occurrences (`occurrence_shipments` ordered by id, joined to
      `card_content`/note text) concatenated with staged occurrences
      (`staged_occurrences` ordered by id, same join).
- [x] 2.2 Compute "open" count as
      `nextMultipleOf5(shipped) - (shipped + staged)`, clamped at 0; log
      (not throw) if the raw computation would be negative.
- [x] 2.3 Reuse/extend `batchHistory.js`'s `stripHtml`/note-join pattern so
      missing note text degrades to card id + side only, never errors.
- [x] 2.4 Unit tests: ship order reconstruction for a healthy on-grid deck,
      a deck with a partial staged batch, and a deck with unresolvable note
      text on at least one card.

## 3. Forecast API — absolute totals + terminology

- [x] 3.1 Extend `runForecast`'s per-deck `byDeck` entries with the new
      absolute totals (1.1–1.3) and pending-by-tier breakdown, additive to
      existing fields.
- [x] 3.2 Audit `server.js`/`layout.js` for every existing "queue depth" (or
      similar ambiguous) label and replace with "Staged" / "Pending" per the
      spec's terminology requirement.
- [x] 3.3 Update `builder/test/pipeline.test.js` and `server.test.js`
      fixtures/assertions for the extended forecast shape.

## 4. UI — pipeline rail

- [x] 4.1 Rework the existing forecast rail into the 5-stage layout (Pulled
      → Minted → Staged → Flushed → Published), each showing an absolute
      total; Pulled shows a neutral note instead of a run delta.
- [x] 4.2 Wire each stage's delta from the existing forecast/build-job data
      (minted this run, newly staged this run, flushed this run).

## 5. UI — per-deck summary + detail

- [x] 5.1 Build the compact per-deck summary row: code/title, 5-cell
      in-progress-batch block (shipped/staged/open), grid status chip (On
      grid / Stalled — N d), absolute totals + this-run delta.
- [x] 5.2 Build the expandable detail view's continuous ship-order strip:
      shipped + staged + open in explicit rows of ~20 cells (4 batches of 5)
      with a visible divider rule between every batch of 5.
- [x] 5.3 Add the "now" divider and the projected pending zone, grouped by
      drain tier (not batches of 5), with the explanatory copy on how
      tiers actually drain (confirmed mechanic from design.md).
- [x] 5.4 Add hover tooltips on every cell: card id, side letter, note text
      (or card id + side only when note text is unresolvable).
- [x] 5.5 Wire the global totals strip (cards minted / occurrences eventual
      / shipped / staged / pending) from the extended forecast data.

## 6. Verification

- [x] 6.1 Run the full `builder` test suite; confirm no regression in
      existing forecast/server tests.
- [x] 6.2 Manually exercise the dashboard against a real (or seeded) DB with
      at least one on-grid deck and one off-grid/stalled deck; confirm grid
      status, ship-order strip, and pending tiers render correctly for both.
- [x] 6.3 Confirm no mint/stage/drain/flush/publish write path changed
      behavior — this change is read/render only.
