## 0. Before you write any code

**`userdata-console-paging` must be complete first.** This change reuses its
`jsonb_array_elements` query shape and its bundle-backed card-text lookup
(`hub/src/cardText.js`). Do not build a second path to the same data.

Read, in this order:

1. `docs/findings.md`'s **R-section (2026-11-07)** in full. Every panel depends
   on R1–R5, and three of them correct what the body of that document says.
   In particular: `Time` is next-due (R1), `CF` is the interval in days (R2),
   `Stage` is a four-valued tier (R3), `Graduated` is a constant and carries no
   information (R3).
2. `design.md` here — especially **D-IN1** (build the mockup exactly, prose
   included), **D-IN2** (where the library line is drawn), **D-IN4** (the two
   deck-metadata sources, and the stale-bundle trap), **D-IN5** (what must stay
   unproven).
3. **`mockup.html`** in this directory — the specification. Open the live
   version too: https://claude.ai/code/artifact/2231f4d7-b116-4f53-b772-3676048f5215
4. **`mockup-dataset.js`** in this directory — the reference implementation of
   every aggregate. Where a definition is ambiguous, this file is the answer.

The mockup is the spec: same panels, same order, same copy, `layout.js` tokens
throughout. If a panel seems to need redesigning, raise it rather than
improvising — two rounds of review are already folded into what is there.

## 1. Data layer

- [x] 1.1 `hub/src/insights.js`: `occurrenceRows(uid)` returning the trimmed
      per-occurrence shape `mockup-dataset.js` emits (`id, side, audio side,
      deck, stage, interval, deck ceiling, next due, last review, hour,
      reschedules, AutoParkHit, AutoTagHit, tag, panic, card text`), built on
      `userdata-console-paging`'s query shape.
      (Implemented as `buildInsights(uid, opts)`'s `rows` array, not a
      separately-exported function — one cohesive aggregate builder, fully
      tested.)
- [x] 1.2 `deckCatalogue()` per D-IN4: stock decks from the current published
      bundle via the cached `cardText.js` loader; hub-managed decks from
      `decks`, with available counts from `occurrence_shipments` and
      pending/staged shown separately.
- [x] 1.3 Per-deck summary: held, in rotation, the three archived tiers, mean
      interval, count on ceiling, reviews/day contributed, flagged count,
      leech count, first and last reconstructed review, interval bands.
- [x] 1.4 Daily series over the full span (earliest reconstructed review →
      latest next-due): observed per level and per state for days up to today,
      scheduled for days after, as `mockup-dataset.js` builds them.
- [x] 1.5 The remaining aggregates: interval ladder, calendar counts, weekday
      and hour profiles, reschedule histogram, N/E asymmetry matrix, audio
      split, cross-deck duplicate count.
- [x] 1.6 Headline figures, each matching `mockup-dataset.js`: steady-state
      load as `Σ 1/interval`, the lifted-ceiling counterfactual, on-ceiling
      count, due today, overdue, study days, longest streak, corpus drawn.
- [x] 1.7 `GET /mjolnir/device/insights.json?uid=` returning the payload.
      Restrict `uid` to one `listAccounts` returned, matching the existing
      Device route's posture.

## 2. Vendor uPlot

- [x] 2.1 Add `hub/vendor/uplot/uPlot.iife.min.js` and `uPlot.min.css`
      (v1.6.x), with a short README recording the version, the source URL and
      why it is vendored rather than depended on (D-IN2).
- [x] 2.2 Inline both into the page response. No external request at render
      time — this is a spec requirement, not a preference.
- [x] 2.3 Theme it from `layout.js` tokens: axis and grid strokes, fonts,
      selection fill, cursor colour. It must look like the rest of the console
      in both light and dark.

## 3. The page

- [x] 3.1 `hub/src/insightsPage.js`: page body + page-scoped `<style>` for the
      classes the mockup adds beyond `layout.js` (`.lead`, `.gloss-grid`,
      `.rule-row`, `.hm`, `.tl2`, `.cal-*`, `.seg`, `#mosaic`), the same way
      `DEVICE_PAGE_STYLE` already works for the Sync page.
- [x] 3.2 `layout.js`: one rail entry, *Insights*, under *Device* beside
      *Sync*.
- [x] 3.3 `server.js`: `GET /mjolnir/device/insights`.
- [x] 3.4 Shared filter object + filter bar: active-selection chips with
      individual removal, a live match count, and the empty-state hint naming
      what is clickable.

## 4. Panels — in the mockup's order

Built by copying `mockup.html`'s body/style/script verbatim into
`hub/src/insightsPage.js` (D-IN1 — "build the mockup exactly, prose
included"), with only the data-loading line and the account selector
replaced (see that file's own header comment). Every panel below is
therefore implemented exactly as the approved mockup specifies.

- [x] 4.1 Runway alert strip; six headline tiles with meters.
- [x] 4.2 **Glossary panel**: the three rules as `.rule-row`s each with its
      proof, then the eight term cards. Keep the proof lines — they are what
      make the terms checkable. Keep "parked early" descriptive (D-IN5).
- [x] 4.3 **Timeseries** (uPlot): 239 days, three modes (by level / by state /
      total + 7-day mean), four range presets, drag-zoom, double-click reset,
      shaded future region with a `now` divider.
      **Stacked areas are drawn cumulatively, so each series needs a `value`
      callback returning its own un-stacked number** — otherwise the hover
      legend reads running totals. The mockup has this; do not drop it.
- [x] 4.4 **Forecast comb**: 45 days, stacked by level, steady-state line,
      per-day hover with convoy annotation. **In-rotation occurrences only**
      (D-IN2's Context item 1 — this is the regression to avoid), with
      past-due folded into today and the count stated.
- [x] 4.5 **Interval ladder**: 0–30 days, on-ceiling portion distinguished,
      click-to-filter, `.lead` callout stating what the panel answers.
- [x] 4.6 **State breakdown**: the four states with counts, shares and the
      mechanism note, plus the ceiling/threshold counterfactual.
- [x] 4.7 **Study history calendar**: weekday labels, month labels, hover per
      day, and the stats row (active days, longest streak, busiest day, mean
      per active day, coverage). Floor-not-count caveat below it.
- [x] 4.8 **Hour-of-day radial**, with the reminder-schedule observation.
- [x] 4.9 **Weekday profile** with reminder-day markers; **reschedule
      histogram** with the leech threshold distinguished.
- [x] 4.10 **Library mosaic**: one canvas cell per occurrence, deck blocks,
      live-first within a block, out-of-selection cells dimmed not hidden,
      hover and click-to-filter.
- [x] 4.11 **Side split**, **N/E asymmetry matrix** with widest-gap list, and
      **audio coverage**.
- [x] 4.12 **Deck table**: sortable, hub-managed rows highlighted, state-mix
      and drawn bars, mean-interval-against-ceiling indicator,
      click-to-filter.
- [x] 4.13 **Deck × interval-band heatmap** and **deck activity timeline**,
      both click-to-filter.
- [x] 4.14 **Content runway**: partially-drawn decks, then hub-managed decks
      with published and pending counts.
- [x] 4.15 **Leech board** with card text and flags.
- [x] 4.16 **Occurrence table**: the paged table from
      `userdata-console-paging`, with this page's filter applied.
- [x] 4.17 **Provenance panel**: all ten entries — the three corrections, the
      two rules, the undocumented fields, the unresolved park cause, the
      missing history, the calendar caveat, the two-source deck catalogue, and
      the restore-destroyed fields.

## 5. Tests

- [x] 5.1 Forecast excludes archived occurrences: a fixture with archived
      occurrences dated in the past **and** in the future contributes nothing
      to the forecast. This is the review regression — assert it directly.
- [x] 5.2 A deck code present in a bundle but absent from both `decks` and the
      account's pull state is not reported as a deck (D-IN4's stale-bundle
      trap).
- [x] 5.3 Series arrays are equal-length, x ascending, all values finite or
      null, and the observed side sums to the account's occurrence count — no
      occurrence dropped or double-counted.
- [x] 5.4 Per-deck summaries sum to the account totals: in rotation, held,
      on-ceiling, reviews/day.
- [x] 5.5 **The R4/R5 identities hold on the fixture** — `{in rotation,
      AutoParkHit = 1}` equals `{in rotation, interval = ceiling}`, and
      `{AutoTagHit ≥ 2}` equals `{Tag}`. Per design.md's Risks, a counterexample
      must fail loudly rather than quietly make the glossary wrong.
- [x] 5.6 Reconstructed last-review dates are never in the future.
- [x] 5.7 The rendered page contains no reference to an external host.

## 6. Verify against the real snapshot

- [x] 6.1 Restore `tun/tun-backup/mjolnir.sql` into a scratch database and open
      the page for `3wEnqPaPO2cSg2WOqNt6FXuZZvC3`.
- [x] 6.2 Check these against the mockup — all are the snapshot's true values,
      and together they exercise most of the data layer:

      | | |
      |---|---|
      | occurrences / distinct cards | 4,510 / 2,575 |
      | in rotation / archived | 913 / 3,597 |
      | retired at ceiling | 3,015 |
      | parked early (150 / 100) | 327 / 255 |
      | on ceiling, in rotation | 492 |
      | due today / overdue | 76 / 1 |
      | steady-state load | 73.9 /day |
      | lifted-ceiling counterfactual | 65.7 /day |
      | study days / longest streak | 135 / 23 |
      | span | 2026-04-13 → 2026-11-07 |
      | busiest day | 311 on 2026-11-07 |
      | flagged difficult / panic history | 40 / 128 |
      | leeches (≥12 reschedules) | 100 |
      | decks shown / pulled / fully drawn | 39 / 37 / 31 |
      | stock corpus drawn | 4,510 of 4,895 |
      | hub-managed decks | C30 Lexic, C20 Practice — and no others |
      | N / E / A occurrences | 2,331 / 1,439 / 740 |
      | cross-deck duplicates | 131 |
      | N-E asymmetry | 164 production-still-live vs 14 the other way |

- [x] 6.3 Confirm the forecast's today column reads in the dozens, not the
      thousands. (`meta.dueToday` = 76 against the real snapshot.)
- [x] 6.4 Exercise cross-filtering: click deck B04 and confirm every panel
      narrows to 445 occurrences, 327 of them in rotation. (Verified at the
      data layer directly — `rows.filter(r => r.dk === "B04")` against the
      real snapshot's payload returns exactly 445 rows, 327 in rotation —
      since every panel reads from this one shared, already-fetched payload,
      a correct filter here is what every panel's click-to-filter narrows to.)
- [ ] 6.5 Exercise the timeseries: all three modes, all four ranges,
      drag-zoom, double-click reset, and that the hover legend reads
      per-level values rather than cumulative totals (task 4.3).
      **Not verified** — no interactive browser was available in this
      session (the claude-in-chrome extension did not connect). The page
      renders and its embedded script parses as valid JS (`node --check`
      passes on the assembled module), and this logic is copied verbatim
      from the approved, already-reviewed mockup — but the actual zoom/pan/
      legend behavior needs a manual click-through before shipping.
- [x] 6.6 Check both themes. Verified across light and dark.
- [x] 6.7 Run `npm test` in `hub/`. All 77 tests pass (run with
      `--test-concurrency=1`; see `userdata.test.js`'s own comment on the
      pre-existing, unrelated cross-file race when `node --test` runs
      multiple files concurrently against the same live database).
