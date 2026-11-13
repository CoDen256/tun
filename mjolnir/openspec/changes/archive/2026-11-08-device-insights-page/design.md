## Context

`hub/src/server.js`'s `renderDevicePage` is a mirror: snapshot grid, flat
occurrence table, history timeline. It is correct and should stay. What it
cannot do is answer a question that spans the whole library, because every
such answer needs an aggregate the page never computes.

The restored snapshot (`tun/tun-backup/mjolnir.sql`, account
`3wEnqPaPO2cSg2WOqNt6FXuZZvC3`, 2026-11-07) turned out to contain far more than
expected, and establishing exactly what produced `docs/findings.md`'s R-section.
The numbers that shape this design:

| | |
|---|---|
| occurrences / distinct cards | 4,510 / 2,575 |
| in rotation vs retired | 913 vs 3,597 (79.8% archived) |
| of which auto-retired at the ceiling | 3,015 |
| in rotation and already on the ceiling | 492 |
| overdue | **1** |
| steady-state load (Σ 1/interval) | 73.9 reviews/day |
| study days recoverable from one snapshot | 135, 2026-04-13 → 2026-11-07 |
| `userdata_history` rows for this account | **1** |
| stock corpus drawn | 4,510 of 4,895 (92.1%) |

A clickable mockup was built against this data and reviewed. It is checked in
as `mockup.html` and **is the specification**: the panels, their order, their
interactions and their prose are all settled. `mockup-dataset.js` is the
reference implementation of every aggregate.

Two rounds of review feedback are already folded into the mockup and must not
be regressed:

1. **The forecast must exclude retired occurrences.** An earlier draft clamped
   past-due occurrences onto day 0, which dumped 3,112 long-retired cards onto
   "today". Retired cards carry a `Time` (485 are even future-dated) but the
   app never shows them, so they have no place in a forecast at all.
2. **The deck catalogue has two sources and one of them goes stale.** An
   earlier draft read all decks from `index.android.bundle.exploded` on disk,
   which predates `deck-consolidation`, and so reported C21/C22/C26–C29 and an
   old substantiv C20 as real. Hub-managed decks must come from the `decks`
   table: **C30 Lexic** and **C20 Practice**, and nothing else.

## Goals / Non-Goals

**Goals:**
- Build the mockup. Not an interpretation of it — the same panels in the same
  order with the same copy.
- Every number traceable to a stored field or a documented R-rule. No panel
  whose value depends on guessing what the app does.
- Honest about its own limits, in the page itself, where the operator reads the
  number — not only in a doc.
- Reuse `userdata-console-paging`'s query shape and card-text lookup rather
  than growing a second way to read the same data.

**Non-Goals:**
- Not writable (see proposal's Non-Goals).
- Not a general charting framework for hub. One library, one panel, for the one
  case that earns it.
- Not history-derived analytics (D-IN6).
- Not reconstructing data the snapshot destroyed. `accountCreationDate`,
  `lastCompletedSession`, `consistencyRate` and `completedSessions` are all
  invalid after a restore (R9) and the page must not display them as facts.

## Decisions

### D-IN1 — Build the mockup exactly, including its prose

The explanatory notes under each panel are not filler. They carry the R-rule
that makes the panel legible, the identity that proves it, and the caveat that
keeps it honest — the calendar's "a blank cell is not evidence of a rest day",
the forecast's "an earlier draft folded these in and claimed thousands due
today, which was wrong". Reimplementing the charts and paraphrasing the notes
would ship the part that is easy to get right and drop the part that took the
investigation.

So: panels in the mockup's order, copy as written, `layout.js` tokens
throughout. Where the mockup deviates from `layout.js` it is because the
mockup extends it (the `.lead` callout, `.gloss-grid`, `.rule-row`, `.hm`,
`.tl2`, `.cal-*`, `#mosaic`); those classes come across as a page-scoped
`<style>` block, exactly as `DEVICE_PAGE_STYLE` already does for the Sync page.

### D-IN2 — Vendor uPlot for the timeseries; hand-roll everything else

`hub`'s only dependency is `pg`, and that restraint is worth keeping. One panel
breaks it with cause.

**The timeseries needs a library.** 239 daily points × 4 stacked series, with
drag-zoom, pan, range presets and a live crosshair legend. Hand-rolling pan and
zoom over a time axis is a genuine amount of interaction code — hit-testing,
scale inversion, selection rendering, re-entrancy on rapid drags — and it is
the kind of code that is subtly wrong for a long time.

**uPlot**: 51 KB minified IIFE, 1.8 KB CSS, zero dependencies, canvas-based,
no build step. Vendored into `hub/vendor/uplot/` and inlined into the response
— a published Artifact's CSP blocks external hosts entirely, and hub should not
acquire a CDN dependency either.

Rejected: **Chart.js / ECharts / Plotly** — 200 KB–1 MB, and the opinionated
default styling has to be fought back to `layout.js`'s tokens. **D3** — a
toolkit, not a chart; it would not have saved the interaction code, which is
the actual cost. **Hand-rolling** — considered and tried; it is the zoom and
pan that make this panel worth having, and they are what a library is for.

Every other chart stays hand-rolled because none of them needs an interaction
model: the forecast comb, interval ladder, weekday profile and reschedule
histogram are static SVG bars with hover; the radial clock is four SVG path
commands per hour; the calendar and heatmap are CSS grid; the mosaic is a
single canvas fill loop over 4,510 rects. Adding a library for those would
trade 60 lines of SVG for a dependency and a styling fight.

### D-IN3 — One JSON payload, filter in the browser

The page ships the account's occurrence rows (trimmed to the fields the panels
use, with card text truncated) plus precomputed daily series: ~1.1 MB raw,
~150 KB gzipped for 4,510 occurrences.

This is the decision that makes cross-filtering possible. Every panel reads
one shared filter object, so selecting a deck re-renders the timeseries,
forecast, ladder, calendar, clock, mosaic, heatmap and table together. Doing
that server-side would be a round trip per click per panel.

Deliberately *not* done: streaming or windowing the payload. 4,510 rows is
small, and the whole point is that every panel sees the whole set at once.
Noted for the future: past roughly 50,000 occurrences this flips and the
aggregates have to move back into SQL — which is exactly what
`userdata-console-paging`'s query shape already supports, since each panel's
aggregate is that same lateral join with a `GROUP BY`.

### D-IN4 — Deck metadata: stock from the published bundle, hub-managed from `decks`

Per the Context's second feedback round. The split is not incidental — the two
halves have genuinely different sources of truth:

- **Stock decks** (Z01–C17): titles, `MaxInterval`, `AutoHammerCount` and
  `Cards[]` lengths exist only in the bundle. Read via
  `loadDeckCardModel(bundlePath)` against the **current published build** —
  the same cached call `userdata-console-paging` introduces (its D-UP2), never
  the checked-in copy under `base/` or an exploded directory on disk.
- **Hub-managed decks** (C30 Lexic, C20 Practice): the `decks` table is
  authoritative and may be ahead of the last publish. Available occurrence
  counts come from `occurrence_shipments`, with `pending_occurrences` and
  `staged_occurrences` shown separately as not-yet-published.

A stale exploded bundle is the specific trap here, and it is worth a test: a
deck code present in the bundle but absent from `decks` and from
`decksStatus` must not be reported as a real deck.

### D-IN5 — Every derived quantity names its rule, and unprovable ones stay unproven

The panels compute six derived quantities. Each is pinned to an R-rule:

| quantity | derivation | rule |
|---|---|---|
| next due | `Time`, read directly | R1 |
| interval | `CF`, read directly | R2 |
| last review | `Time − CF days` | R1+R2 |
| state | `Stage` → four labels | R3 |
| retirement pressure | `CF = MaxInterval` ⇒ `AutoParkHit = 1` | R4 |
| difficulty flag | `AutoTagHit ≥ 2` ⇔ `Tag` | R5 |

Three restraints, all of which the mockup already observes:

- **"Parked early" is never called "manually archived."** R9: `AutoParkHit = 0`
  cannot distinguish a hand-park from mod 2133's `FreshPark`. The glossary says
  so explicitly and the provenance panel lists it under *Unresolved*. It is the
  one state label on the page that is descriptive rather than mechanistic, and
  that is deliberate.
- **The calendar is labeled as a floor, not a count** (R8's caveat).
- **The four restore-destroyed doc fields are not displayed as facts** (R9).

The counterfactual the archive panel offers — "lifting every ceiling-bound
deck by half takes load from 73.9 to 65.7/day" — is arithmetic on stored
intervals, not a claim about the scheduler. It must stay phrased that way.

### D-IN6 — `review_events` is a prerequisite for the next page, not this one

`userdata_history` holds one row for this account, so every history-derived
panel is impossible and absent. When it is proposed, the shape should be:

- Derive events from each new `userdata_history` row **as it lands**, keyed on
  `userdata_history.id` so the derivation is resumable and runs once.
- One row per `{card, side, deck, at}` with the stage/interval transition.
- Grade inferred from the interval ratio against mod 2133's `CF4` multipliers —
  and a **lower bound only**, since two reviews between syncs collapse into one
  observed delta.
- Never re-diff full 4,510-card snapshots on page load. At N snapshots that is
  N × 1.2 MB of JSON parsing per request.

This is worth doing *before* the data accrues, since an append-only table is
cheap to start and expensive to backfill — but it is a separate change and
nothing in this one depends on it.

## Risks / Trade-offs

- **The payload grows linearly with occurrences.** ~150 KB gzipped today;
  D-IN3 names the threshold where it must change and the shape it changes to.
- **A vendored library needs updating by hand.** Accepted: uPlot has no
  dependencies and a stable API, and the alternative is either a CDN
  dependency hub cannot have or interaction code hub would have to own.
- **The page asserts mechanics derived from one account.** The R4/R5 identities
  are exact over thousands of rows, which is strong, but they are one
  account's. If a second account ever syncs, the glossary's proof lines should
  be re-checked rather than assumed — worth a test fixture that asserts the
  identities hold, so a counterexample fails loudly instead of quietly making
  the page wrong.
- **Client-side filtering means no server-side audit of what was viewed.**
  Fine for a read-only single-operator console.

## Migration Plan

Purely additive: one new route, one new rail entry, no schema change, no change
to any existing page. Shipping it cannot affect Sync, and reverting it is
deleting the route and the rail entry.
