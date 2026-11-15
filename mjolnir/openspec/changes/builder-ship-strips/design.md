# Design — builder-ship-strips

Settled with the operator in the `full-sweep` design session (2026-11-15).
Supersedes the retracted `builder-ship-console` design, which the operator
reopened; where a decision below matches that one it is because it was
re-confirmed, not inherited.

## D-SS1: The strip page REPLACES the forecast page

Reversal, recorded deliberately. The backlog item says "in addition to
forecast and publish"; the operator reversed that in this session — one
page, not two, so nothing has to be kept in sync. `/builder` serves the new
page, re-rendered inside hub via the same exported-body mechanism as today
(D109): one body function, two shells.

**Carried over**: the active-logic-bundle banner, the degraded-stabbur
banner (P57 — it must stay visibly distinguishable from a healthy idle
pipeline), the five global totals, Publish now.

**Removed from this page**: the 5-stage pipeline rail (it restates
numerically what the strip shows spatially) and the past-batches section
(operator: "it's covered in job run logs"). Removing the section does not
retire the `batch-history` capability — its requirements are about
reconstructing a batch's contents at occurrence granularity, which the run
log and hub's publish history still satisfy, and whose forecast half is now
satisfied by the strip's own flush/held/queued distinctions.

## D-SS2: Three orthogonal axes, and no text inside the strip

The strip must distinguish eight states. Eight fills would be unreadable, so
meaning is factored:

| axis | encodes | values |
|---|---|---|
| fill | lifecycle | shipped · staged-flushing · staged-held · open · pending · gap |
| ring | new this run | applied identically to a newly-staged and a newly-queued cell |
| corner dot | content rewritten by this publish | shipped cells only |
| glyph | occurrence letter | `A` / `E` / `N`; `?` for open and gap |

`staged-flushing` vs `staged-held` are two treatments of one hue (solid vs
hollow), because flushing *is* a lifecycle distinction — those occurrences
change state in this run — and the other two axes were already spent. The
ring composes over either, since a cell can be both newly staged and held.

**No text is rendered inside the strip** — operator decision, after seeing
an earlier iteration with an inline "publish line" label and per-tier
labels: they broke the 40-cell grid alignment, which is the strip's entire
value. Rows wrap at 40 cells with a divider every 5 and the row-number
label outside the grid.

Everything the removed labels said is said by cells instead:

- **The publish boundary needs no marker.** The batch-of-5 divider at the
  deck's next multiple of 5 already is that boundary; staged cells that
  flush sit before it, held ones after it, and the two now differ by fill.
- **A pending tier's distance is its filler cells.** One `gap` cell per unit
  of `remaining`, immediately after that tier's own cells — the existing
  behaviour, now unlabelled. The operator's framing: "fake cards that are
  there to show how much before the next batch can be shipped."

The one fact those labels carried that cells cannot is preserved as a `?`
popover on the legend's pending swatch: the countdown decrements by the
number of brand-new **cards** minted into that deck, so several tiers can
drain in the same publish.

**Correction worth carrying into the UI copy.** D91's prose says the `E`
waits for "11 other occurrences"; `drainPendingOccurrences` decrements
`remaining` by `newACount`, the count of brand-new cards. The implemented
rule is 11 new **cards**, not occurrences and not batches. Every label this
page writes says "cards". D91 is not being reversed — its mechanism is
unchanged — only described accurately.

## D-SS3: One stat order, everywhere

minted ◆ → occurrences eventual Σ → shipped ● → staged ◐ → pending ○.
Identical sequence, glyphs and labels in the global totals and in every deck
rail header, each with this run's `+N` delta (nothing rendered at zero, so
"nothing moved" reads as silence and the five slots stay aligned across
rails). The rail header is deck code · title · that readout · on-grid chip,
and nothing else — the sentence-form flush note and the per-deck banner
paragraph are both removed as duplication of the readout.

Per-deck pending delta is rendered as the net of queued minus drained
(one number per slot); the global totals keep the fuller `+queued / −drained`
because they have room. Both derive from the same two fields so they cannot
disagree.

## D-SS4: Hover is about change; click is about state

Hover (must stay instant — text only, no card rendering): index · card id ·
letter, then what this publish does to the card's content — the **set of
changed faces** ("E and X change this publish"), or "unchanged", or "new
card — every face written this publish", or "no card in this slot" for an
open/gap cell. Simultaneously kin-highlights the same card's other
occurrence wherever it sits in the strip, which is how the operator sees how
far apart a card's `A` and `E` landed.

Click opens a drawer (pushing, not overlaying — the strip stays visible)
carrying everything hover dropped: build id and shipped timestamp, flush-vs-
held, tier countdown, the kin occurrence's position, and a card rendered via
the `card-preview` capability.

Change status is reported on **every** cell regardless of lifecycle state —
`wouldUpdate` derives from already-minted notes, so a staged or pending
occurrence's card can carry a content change too. The corner dot stays
shipped-only, because "already on the device and about to be rewritten" is
the alarming case.

When a cell's card is being rewritten, the drawer's preview is labelled as
showing the **new** content, not what is currently on the device:
`card_content` holds the current projection, so there is no stored "what
shipped" to render instead. Labelling it is the honest option; reconstructing
historical content is out of scope.

## D-SS5: The open-slot count is wrong in the code AND in the spec

`shipOrderForDeck` computes
`open = nextMultipleOf5(shipped) − (shipped + staged)`. With 245 shipped and
9 staged that is `250 − 254 = −4`, clamped to 0, with a `console.error`
calling it a *data-integrity signal*. The data is correct; the expression
measures against a target the deck has already passed. After that publish the
deck is at 250 shipped with 4 staged, so the real target is 255 and exactly
**1** slot is open.

Corrected: `open = nextMultipleOf5(shipped + staged) − (shipped + staged)`,
which is always 1–5, making the negative branch and its misleading
diagnostic unreachable — both are removed.

`card-flow-view`'s spec scenario "staged count is zero and shipped is already
a multiple of 5 → the open count is 0" is wrong in the same direction and is
**superseded** by this change. A deck on the grid with nothing staged still
needs 5 more cards before anything ships; reporting 0 made the strip claim
nothing was awaited. Recording this explicitly matters: left alone, the spec
would justify reverting the fix.

This is the same failure shape as P45/P47 — a confident diagnostic pointing
at the data while the logic is at fault.

## D-SS6: Publish progress polls the log; the result is derived, not remembered

Everything needed exists: `build_jobs` carries status / started_at /
finished_at / error / build_id, and `job_logs` carries the run's own
narration lines per job. No new table.

- `POST /builder/api/publish` **stays synchronous** and its response remains
  the authoritative outcome. This is deliberate: `runPublish` owns the job
  lifecycle internally and **writes no `build_jobs` row at all for a no-op
  run** (nothing newly eligible), so a design where the page waits for a job
  row to appear would spin forever on exactly the most common manual click.
- While that request is in flight the page polls a progress endpoint purely
  to tail the running job's log lines. Progress is narration, not truth.
- The result banner is derived from the most recent `build_jobs` row, not
  from client state, so it survives a reload and reports a **scheduled**
  publish the operator never watched. Success shows build id, what shipped,
  and a link to the full run log; failure shows `build_jobs.error` and the
  same link.
- A `running` job that stops producing log lines must be presented as stalled
  rather than spinning indefinitely — a killed process leaves the row
  `running` forever, and an eternal spinner is a success-shaped display of a
  dead run.

## D-SS7: Publish-time facts are stamped at publish

- **Assemble-time, unchanged**: `BASE_VERSION`, `PATCH_REV` — they come from
  the logic bundle and cannot change mid-run (D-L4).
- **Publish-time**: `BUILD_ID`, `DATA_VERSION`, and new `BUILT_AT`.
  `restampCompanionBuildId` generalizes to restamp all three in the scratch
  bundle **before** `bundleSha` is computed and `publish()` runs. The restamp
  keys on the constant *names* in the companion, not on the previously baked
  literal, so it works regardless of what assemble baked.
- `publications.created_at` and `BUILT_AT` are the same instant — one
  timestamp passed to both the restamp and the INSERT — so the device and the
  console can never disagree.
- `BUILT_AT` is baked as **ISO-8601 UTC** and formatted to the device's local
  time for display. One canonical value in the bundle, local rendering on
  screen.

**Build time means publish time, not assemble time.** One logic bundle is
published many times; stamping assemble time would recreate exactly the
staleness being removed.

`LABEL` keeps being baked (it is how a submitted bundle self-describes at
ingest) and `logic_bundles.label` stays the bundle's name in hub's OTA
console — only the device's *display* of it goes. `assembly-tab-usability` is
concurrently restructuring the `LABEL`/`PATCH_REV`/`DATA_VERSION` form fields;
neither change may delete the other's half.

## D-SS8: One App version row on the device

```
App version
b000042 · base 1.5.12 · logic 3 · data 247 · built 2026-11-15 03:12
```

One string from the five globals; wrapping is fine. The separate Label and
Data version rows are removed. The no-companion (tier-4 embedded) fallback
shows `embedded`, fixing the `&&`/`+` precedence bug that currently renders
`"undefined base:undefined"`.

## D-SS9: Deck descriptions carry live shipped counts

The on-device deck description becomes
`<operator prose> · <N> cards · <M> occ`, regenerated at every publish.

- The counts are what is **actually in the bundle**, not eventual totals:
  cards = distinct card ids in `deck.Cards`, occurrences = `deck.Cards.length`.
  Operator decision — the description should describe the deck on the device.
- They are computed from the in-memory model **after** the flush.
  `syncDeckDescription` currently runs at the top of `flushDeck`, before the
  `addOccurrence` loop, so a naive reuse ships counts stale by exactly this
  run's flush. The sync call moves after the flush.
- Operator prose stays `decks.description`, edited exactly as today. The
  counts never enter the database — they are formatted into the bundle's deck
  entry only, so one source stays authoritative for each half.

## D-SS10: Dependency on the extracted style map

The drawer's card preview renders through the `card-preview` capability,
whose faithful style values come from `assembly-tab-usability`'s extractor.
The operator chose the **data** dependency over a shared renderer module:
this page reads the extractor's emitted style map and draws its own card.
Two packages sharing one renderer file would break the batch's
build-parallel isolation rule and force amending a change that is already
building.

Consequence recorded in the batch manifest: **`assembly-tab-usability`
builds before this package**, and its extractor output must live somewhere
this page can read.

## Device-plane check

Nothing here touches `/ota/*` mechanics, `current.json`'s native-read fields
(`buildId`/`url`/`sha256`/`size`), blob serving, or `/mjolnir/userdata/*`.
All device-visible changes ride inside bundle JS (redeployable, D04) plus the
operator console. `MAGIC_PREFIX` (`__BUNDLE_START_TIME__`) is a runtime
marker, not a build timestamp — not repurposed.

## Alternatives considered

- **Keeping the forecast page alongside the new one** — the backlog's own
  wording; reversed by the operator in session. Two pages asserting
  overlapping facts is the drift this console has already suffered once.
- **An inline publish-line marker and per-tier labels** — built and clicked
  through, then rejected: inline text consumes grid columns and breaks the
  40-cell alignment the strip is read by.
- **Having the device read `current.json`'s `label` at runtime** — rejected:
  contradicts `account-build-info`'s synchronous-no-fetch requirement and
  adds a network dependency to a screen that must work offline.
- **Baking `BUILT_AT` at assemble only** — rejected: records a time
  arbitrarily far from the publish, the same staleness class being removed.
- **Counts stored into `decks.description`** — rejected: would overwrite
  operator prose and duplicate derivable data into state (D151 spirit).
- **Returning the job id from a detached publish POST** — rejected: a no-op
  run writes no job row, so the page would wait on a row that never appears.
