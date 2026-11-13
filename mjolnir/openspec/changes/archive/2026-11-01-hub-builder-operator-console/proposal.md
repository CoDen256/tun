## Why

`hub` and `builder` exist as working code (`p4-builder`, archived
2026-10-25) but have no deployable image, no reachable UI, and — found while
designing this change's UI — no way to answer "which build shipped this
card's second side" after the fact, because the only record of a drained
occurrence is deleted the instant it ships. The operator cannot currently
publish, inspect, or trust this pipeline without reading database rows by
hand. This change is the operator console: deploy `hub`+`builder` for real,
and give them the UI `tun/docs/13-operator-console-ux.md` specifies (mockup:
the artifact linked from that doc).

## What Changes

- **New `occurrence_shipments(card_id, letter, build_id, shipped_at)`
  table** (D93) — written once per occurrence at the moment it actually
  ships: at mint time for an immediate letter, at drain time for a queued
  one. This is a correctness fix as much as a UI enabler: today a drained
  `pending_occurrences` row is hard-deleted with no trace, so "which build
  shipped this side" is unanswerable for *any* card, not just a missing
  feature.
- **`builder`'s forecast becomes occurrence-level, not deck-level.**
  Supersedes `builder-pipeline`'s existing forecast requirement: instead of
  per-deck counts, it shows the actual `(card, side, note)` rows that would
  ship this run, split into "shipping this batch" and "newly queued, ships
  later" — because a card's two sides routinely belong to different
  batches, and a count can't represent that.
- **New `Cards` page** (in `hub`) — the full published-card browser,
  stabbur's Notes list's counterpart: searchable, filterable by deck/type,
  groupable by deck, each row showing content, **per-side occurrence status**
  (shipped + which build, or queued + how far out), and a link to the
  source note (and grammar rule, if applicable) in stabbur's UI.
- **New `Batches` view** (under `builder`'s Forecast page) — past batches,
  expandable to the exact `(card, side)` pairs each one shipped.
- **Configurable schedule** — a `builder_config` table (schedule kind +
  value), an API to change it, a UI form. `clock.js` reads it dynamically
  instead of a hardcoded interval.
- **Run log** — a `job_logs` table keyed by `build_job_id`, written during a
  run, rendered under each job in a new log view.
- **OTA folded into `hub`'s UI** — drag-drop bundle submit (prefilled,
  editable label), verification run in place on drop (reusing
  `ota-publish-module`'s existing guards — now called from an HTTP handler,
  not only the CLI and `builder`'s in-process call), a build-history table
  (set-current, delete, edit label), and a link into `bundle-tool ui`
  (bundle-workbench, which already does bundle inspection — not rebuilt).
- **Deployable for real**: `Dockerfile`s for `hub` and `builder`, both added
  to `compose.yaml`, both Caddy routes uncommented. A bare shared-token auth
  check added to both operator UIs at the same time (D90's "not exposed yet"
  precondition stops being true the moment this ships).
- **BREAKING**: none to the device or the installed app — this is
  operator-side only.

## Capabilities

### New Capabilities
- `occurrence-shipment-log`: the per-occurrence shipment record and its
  write-path integration into mint and drain.
- `cards-browser`: the published-card entity list, per-side status, linking
  to source notes/grammar rules.
- `batch-history`: occurrence-level forecast preview + past-batches view.
- `scheduler-config`: persisted, UI-editable publish schedule.
- `builder-run-log`: per-job log capture and display.
- `ota-console`: drag-drop submit, in-place verification, build history
  management, bundle inspection link — all inside `hub`'s UI.

### Modified Capabilities
- `builder-pipeline`: the forecast requirement changes from per-deck counts
  to occurrence-level batch content; the mint and drain steps gain
  shipment-log writes.
- `ota-publish-module`: gains a third caller (an HTTP handler inside `hub`,
  for the new OTA console) alongside the existing CLI and `builder`
  in-process callers — same shared guards, no new implementation.

## Impact

- **New code**: `hub/Dockerfile`, `builder/Dockerfile`; `hub/migrations/`
  additions (`occurrence_shipments`, `builder_config`, `job_logs` — the
  latter two technically belong to `builder`'s concerns but, per the
  existing split, `hub` owns all schema and `builder` is the only other
  writer); `hub/src/server.js` gains the Cards and OTA console pages;
  `builder/src/server.js` gains the Schedule, Run log, and the rebuilt
  Forecast/Batches pages.
- **Depends on** `small-fixes-audio-trim-drain-order` only loosely — both
  touch `builder`'s audio/pipeline code but are otherwise independent;
  implement in either order, rebase if they land close together.
- **Depends on `tun`'s deployment-unification proposal** for the actual
  `docker compose up` path this ships through, but can be built and tested
  against `mjolnir`'s own standalone `compose.yaml` first.
- **No native/APK change.**
