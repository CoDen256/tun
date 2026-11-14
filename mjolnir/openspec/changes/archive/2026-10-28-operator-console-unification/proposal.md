## Why

Three weeks of real operator use of the hub/builder/workbench console (shipped across `hub-builder-operator-console` and `builder-logic-bundle-store`) surfaced two genuine bugs — pending occurrences silently disappearing from the forecast, and the embedded workbench reading its patches from the wrong directory — plus a cluster of missing visibility/ergonomics the operator now wants: seeing which *existing* cards a publish would actually change (not just new ones), a real catalogue of bundles to inspect, drag/drop uploads, sane download filenames, and a single-page shell instead of three separately-styled, separately-authenticated endpoints.

## What Changes

- **Fix: forecast silently drops pending-occurrence queue depth for any deck with zero newly-eligible notes today.** `runForecast`'s `byDeck` array is only ever populated inside the loop over `newlyEligibleByDeck` — a deck with a real, nonzero `pending_occurrences` depth but nothing new to mint today never gets an entry at all, even though `pendingQueueDepths` already queried its correct depth. No data is lost (confirmed: `pending_occurrences` rows are untouched); this is purely a rendering/aggregation bug in `builder/src/pipeline.js`.
- **Fix: the embedded workbench's `patchesDir` resolves against the wrong directory.** `hub/src/server.js` passes `config.workbenchPatchesDir`, a field `hub/src/config.js` never actually reads from the environment — so it always falls back to the literal string `"patches"`, resolved against hub's own process `cwd` at runtime, not the repo's actual `patches/` directory. Patches saved by one path (CLI, or a previous local run) are invisible to hub's embedded copy.
- **New: forecast and publish history show which already-minted cards' content would/did actually change**, not just newly-minted ones — a real content diff (old `card_content` row vs. freshly-projected `{N,E,X,A}`), surfaced both predictively (forecast, before publishing) and historically (this run's job log).
- **Workbench: drag-and-drop / file-picker upload**, not only a server-side filesystem path — raw bytes POSTed to a new upload endpoint, staged to a temp file, opened as a session exactly like `openByPath` already does.
- **Workbench: a real catalogue of every OTA build and every logic bundle**, one click to open each as a session — reusing `listPublications`/`listLogicBundles`, which already have everything needed; only the UI wiring was missing (the logic-bundles table at `/mjolnir/ota` had no "inspect" link at all, unlike publish history).
- **Fix: "inspect" always opens a brand-new tab**, so a bundle opened while a workbench tab is already up doesn't appear there — switch to a named window (`window.open(url, 'mjolnir-workbench')`) so repeated inspects reuse/refresh the same tab instead of accumulating new ones.
- **Fix: download proposes `<buildId>.js` always**, ignoring the publication's own label — filename now incorporates the label when present.
- **New capability `card-preview`**: a real per-card visual preview (N/E/X faces, audio-face flagged) styled from the **actual stock app's own CSS/theme values**, extracted directly from the real bundle (Poppins font family; `cardText #16215B` / `headingAccent #246BFD` light-theme colors; `teal #00A4BF`, `red`, `green #5DD8D0` emphasis classes) — not approximated.
- **New capability `operator-console-shell`**: one page presenting hub, builder, and the workbench as sections ("Cards", "Builder", "OTA", "Tools") of a single UI, via a shared shell embedding each existing service's page in an iframe (each service's `renderShell` gains an `embed=1` bypass to skip its own top-bar/rail when framed) — **not** a merge of the two backend processes, which stay independently deployed exactly as today (confirmed: separate Caddy `handle` blocks, separate containers, D80).

## Capabilities

### New Capabilities
- `card-preview`: a visual, stock-app-styled preview of a card's rendered N/E/X content plus which face carries its audio, reachable per-card from the Cards page.
- `operator-console-shell`: one page, one visual shell, with Cards/Builder/OTA/Tools sections — each section is an existing service's page framed in, not reimplemented.

### Modified Capabilities
- `builder-pipeline`: forecast's per-deck pending-queue reporting no longer silently omits decks with zero newly-eligible notes; forecast and publish history additionally report which already-minted cards' content would/did change, not only new cards.
- `bundle-session-management`: patches directory resolution is fixed/absolute regardless of process `cwd`; sessions can be opened from an uploaded file (drag-drop or file picker), not only a server-side path; a provided catalogue of every OTA build and logic bundle is openable in one click; repeated "open" actions reuse one workbench tab/window instead of multiplying tabs.
- `ota-console`: the logic-bundles table gains the same "inspect" affordance publish history already has; publish history's download gains a label-derived filename instead of always `<buildId>.js`.

## Impact

- `builder/src/pipeline.js`, `builder/src/server.js` — forecast `byDeck` construction, new "would-update" computation, job-log line for actually-changed cards.
- `builder/src/cardContent.js` (or a shared read helper) — content-diff comparison.
- `hub/src/config.js` — real `WORKBENCH_PATCHES_DIR` env var, resolved to an absolute, cwd-independent default.
- `src/commands/ui.js`, `src/ui-assets/{app.js,index.html,styles.css}` — upload route + drag-drop UI, catalogue view, named-window open/inspect links.
- `hub/src/server.js` — logic-bundles table inspect link, download filename fix, catalogue data wiring, `embed=1` support in the history/cards/ota pages.
- `hub/src/layout.js`, `builder/src/layout.js` — `embed` bypass in `renderShell`.
- New: a small shell page (serving the unified Cards/Builder/OTA/Tools tab layout) — lives in hub, since Caddy already puts both services under one origin.
- New: `card-preview` page/route in hub, backed by `card_content`'s already-stored full `{N,E,X,A}` (today only `n`/`e` are even selected) and `card_slots.audio_sha256` for an optional real `<audio>` player via the existing blob cache.
- No stabbur/smia/phonexa changes. No schema changes required for the two bug fixes or the catalogue/upload work; `card-preview`'s audio playback reuses the existing blob cache, no new table.
