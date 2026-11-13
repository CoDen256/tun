# uPlot (vendored)

Version: **1.6.32**
Source: https://unpkg.com/uplot/dist/uPlot.iife.min.js and
https://unpkg.com/uplot/dist/uPlot.min.css

## Why vendored, not a dependency

`hub`'s only runtime dependency is `pg` (D-P3), and that restraint is worth
keeping. One panel on the Insights page — the 239-day reviews-per-day
timeseries — genuinely needs drag-zoom, pan, range presets and a live
crosshair legend, which is real interaction code, not a few lines of SVG
(see `openspec/changes/device-insights-page/design.md` D-IN2 for the
alternatives considered and rejected).

uPlot is 51 KB minified (IIFE build, no bundler needed) plus 1.8 KB of CSS,
has zero dependencies of its own, and is inlined directly into the page
response (`hub/src/insightsPage.js`) — no CDN, no external request at
render time (a spec requirement, not a preference).

## Updating

Download a newer `uPlot.iife.min.js` / `uPlot.min.css` pair from the same
unpkg URLs (swap the version) and replace these two files. Re-check the
Insights page in both themes afterward — `hub/src/insightsPage.js`'s own
`INSIGHTS_PAGE_STYLE` themes uPlot's default look via CSS variables, which a
new major version could change the class names for.
