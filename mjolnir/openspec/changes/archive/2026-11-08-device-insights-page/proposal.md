## Why

The Device sync page is a faithful mirror and nothing more: it shows the stored
document and a flat list of occurrences. On the real account that is 4,510 rows
and six summary numbers, which answers none of the questions the data can
actually answer.

Working through the restored snapshot in `tun/tun-backup/mjolnir.sql` to design
such a view produced `docs/findings.md`'s **R-section** — three corrections to
previously-documented field semantics (R1–R3) and the two automatic rules §6
had left untraced (R4–R5). Those findings are what make the view possible:

- `Time` is the **next-due** timestamp (R1), so a review forecast is *stored*,
  not modeled.
- `CF` is the **interval in days** (R2), so `Time − CF` recovers each
  occurrence's last review — **135 study days back to 2026-04-13** out of a
  document that keeps no history.
- `AutoParkHit` + `AutoHammerCount` explain the archive (R4): 3,015 of the
  3,597 retired occurrences were retired automatically, and the two knobs that
  set the pace are `decks.max_interval` and `decks.auto_hammer_count` — columns
  this hub already owns and publishes.

**A clickable mockup built on the real snapshot already exists and is the
specification for this change**, down to the wording of its explanatory notes:

- live: https://claude.ai/code/artifact/2231f4d7-b116-4f53-b772-3676048f5215
- checked in: `mockup.html` in this change directory (the same page, with its
  embedded dataset and vendored chart library stripped out)
- the dataset builder that fed it: `mockup-dataset.js`, which is the reference
  for every aggregate's definition

Sync stays exactly as it is. This is an additional tab, not a replacement.

## What Changes

- **A new operator page at `/mjolnir/device/insights`**, in the rail under
  *Device* beside *Sync*, built to `mockup.html` exactly — same panels, same
  order, same copy, same design tokens from `hub/src/layout.js`.
- **One JSON endpoint** ships the account's occurrences plus precomputed
  series; the page cross-filters client-side. Every panel re-reads one shared
  filter, so clicking a deck row, an interval column, a heatmap cell or a
  mosaic cell narrows the whole page.
- **uPlot is vendored** for the one panel that needs real charting: a
  239-day zoomable timeseries spanning seven months of reconstructed history
  and one month of stored schedule. 51 KB minified, no network, no build step.
  Every other chart stays hand-rolled SVG or canvas — see design.md for where
  the line is drawn and why.
- **A glossary panel states the app's own mechanics** — the auto-park rule,
  the auto-tag rule, and what `Tag`/`Panic`/"parked early" mean, each with the
  identity that proves it. This is load-bearing, not decoration: the terms are
  otherwise unguessable, and one of them (R9) is deliberately left unresolved.
- **A provenance panel** lists every correction, every undocumented field, and
  every thing the snapshot cannot say — including that no retention curve is
  possible yet, because this account has one `userdata_history` row.

## Capabilities

### New Capabilities
- `device-insights`: an analytical, read-only operator view over one account's
  progress snapshot.

### Modified Capabilities
(none — `userdata-console` keeps its existing requirements unchanged; the
paging and content-join work it needs is `userdata-console-paging`.)

## Impact

- `hub/src/insights.js` (new): the aggregate queries and series builders, one
  per panel, mirroring `mockup-dataset.js`.
- `hub/src/insightsPage.js` (new): page body, styles and client script.
- `hub/src/layout.js`: one rail entry under *Device*.
- `hub/src/server.js`: `GET /mjolnir/device/insights` and
  `GET /mjolnir/device/insights.json`.
- `hub/vendor/uplot/` (new): vendored `uPlot.iife.min.js` + `uPlot.min.css`,
  inlined into the page response.
- `hub/test/insights.test.js` (new).
- No schema migration, no device-side change, no builder change.

## Dependencies

- **`userdata-console-paging`** must land first. This change reuses its
  `jsonb_array_elements` query shape for every aggregate and its
  bundle-backed card-text lookup for the content columns, and both exist to be
  shared.

## Non-Goals

- Not replacing or restyling the Sync tab.
- Not writable. No un-parking a card, no editing an interval, no deck-config
  changes — even though the page names `max_interval` and
  `auto_hammer_count` as the levers, acting on them stays in builder.
- **Not deriving `review_events` from `userdata_history`.** Everything needing
  two snapshots — a true forgetting curve, grade inference from interval
  ratios, a real day-by-day log, validating the scheduler against actual
  recall — is impossible on one history row and is deliberately absent from
  the mockup. See design.md D-IN6 for the shape it should take when proposed.
- Not multi-account comparison. The selector picks one account, as today.
