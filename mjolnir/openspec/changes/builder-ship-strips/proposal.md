## Why

`/builder`'s "Forecast & publish" page answers "what would happen if I
published now?" with five prose-heavy sections — a pipeline rail, a stat
strip, collapsed per-deck rows, a batch history, and a wall of explanatory
paragraphs. The operator's actual question is spatial: *where* in each deck's
ship order does every occurrence sit, and *which cells does this publish
change*. The strip that answers it is buried two clicks down inside a
`<details>`, and the states it needs to distinguish (newly staged vs
previously staged, newly queued vs already queued, staged-that-flushes vs
staged-that-holds, already-shipped-whose-content-changes) are either absent
or indistinguishable.

Three correctness defects were found while designing against the real data,
and all three make the page assert things that are not true. They are fixed
here because the redesign has no value if the cells lie:

- `shipOrderForDeck`'s open-slot count is computed against the next multiple
  of 5 above *shipped*, which is already behind once staged overshoots it. A
  deck at 245 shipped with 9 staged computes `250 − 254 = −4`, clamps to 0,
  and logs `"open-slot count computed negative — data-integrity signal, not a
  crash"`. The data is fine; the arithmetic is wrong, and the diagnostic
  blames the data. `card-flow-view`'s own spec contains a scenario that is
  wrong in the same direction.
- `syncDeckDescription` runs at the top of `flushDeck`, before the
  `addOccurrence` loop. Any count formatted there is stale by exactly this
  run's flush.
- `LABEL` and `DATA_VERSION` are baked at assemble time and never restamped;
  only `BUILD_ID` is. Every publish after the first off a given logic bundle
  ships a device-visible data version that is wrong — the operator's report
  that it is "either not being updated or just not that relevant".

The device also has no way to say *when* it was built, and the deck list
gives no sense of how much content a deck holds.

## What Changes

- **BREAKING (operator-facing)**: `/builder`'s forecast page is **replaced**
  by a ship-strips console. The 5-stage pipeline rail and the past-batches
  section are removed from it — the run log already owns past runs, and the
  strip shows spatially what the rail stated numerically. The
  active-logic-bundle banner, the degraded-stabbur banner, the five global
  totals and Publish now are carried over.
- One full-width always-expanded strip per deck. Cell meaning is carried on
  three orthogonal axes — fill = lifecycle, ring = new this run, corner dot =
  content rewritten this publish — with no text inside the strip at all, so
  the 40-cell grid stays aligned. The distance to a pending tier's drain is
  rendered as that many filler cells, never as a label.
- Hover reports **what changes about a card**, per face, plus kin-highlight
  of the same card's other occurrence. Click opens a drawer with full state
  and a `card-preview`-rendered card.
- Live publish progress while a run is in flight, and the run's result
  pinned at the top of the page afterwards — including for a scheduled run
  the operator was not watching.
- Fix the open-slot computation; always 1–5, measured from shipped + staged.
- Move the deck-description sync after the flush, and format live
  `<N> cards · <M> occ` counts into the on-device deck description.
- Restamp `BUILD_ID`, `DATA_VERSION` and a new `BUILT_AT` at publish time;
  collapse the device's three version rows into one that includes build time.
- Widen the forecast's content-change signal from a boolean to the set of
  changed faces.
- Out of scope: `flush-record-atomicity` (its own change, the write path);
  the `card-preview` extractor itself (owned by `assembly-tab-usability`).

## Capabilities

### New Capabilities
- `ship-strips-console`: the per-deck ship-strip page that replaces the
  forecast page — cell vocabulary, zone order, hover/click behaviour, the
  carried-over header and totals.
- `publish-progress`: in-flight publish progress and the durable
  last-run result surfaced at the top of the page.

### Modified Capabilities
- `card-flow-view`: the open-slot count is computed from shipped + staged and
  is always 1–5 (superseding the scenario that reports 0); the content-change
  signal reports which faces change, not merely that something did.
- `builder-pipeline`: publish-time restamping of `BUILD_ID`/`DATA_VERSION`/
  `BUILT_AT`; the deck-description sync moves after the flush and carries
  live card/occurrence counts.
- `account-build-info`: the account screen shows one App version row
  including build time; the separate Label row is removed from the device;
  publish-time facts are no longer described as baked at assemble time.
- `ota-js-companion`: the companion bakes and exposes `BUILT_AT`.

## Impact

- `mjolnir/builder/src/server.js` — the forecast page's renderers replaced;
  new progress/result endpoints.
- `mjolnir/builder/src/cardFlow.js` — open-slot expression.
- `mjolnir/builder/src/pipeline.js` — description sync position, counts,
  restamp call site, per-face change detection.
- `mjolnir/tool/src/otaPublish.js` — `restampCompanionBuildId` generalizes.
- `mjolnir/patches/js/boot-ok-companion.js` — `BUILT_AT` constant.
- `mjolnir/patches/js/2176-my-account-build-id.edited.js` — one version row.
- `mjolnir/hub/src/layout.js` — the Builder nav entry's label.
- Consumes `assembly-tab-usability`'s extracted style map (data, not code),
  which makes that change a build-order predecessor.
- No device-plane change: nothing under `mjolnir/sync/`, no `/ota/*` or
  `/blob/*` mechanics, no `current.json` field the native loader reads.
