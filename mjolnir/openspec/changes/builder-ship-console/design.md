# Design — builder-ship-console

Settled with the operator in the `full-sweep` design session (2026-11-15).

## D-SC1: Ship strips is a new page; Forecast & publish stays

The backlog item is explicit ("in addition to"). The new page is served by
builder at its own route and re-rendered inside hub via the same
exported-body mechanism as the existing three pages (D109) — one body
function, two shells, the degraded-stabbur banner rendered inside the shared
body so the copies cannot drift.

## D-SC2: The strip is the page's backbone — state and forecast in one picture

No separate would-ship/would-hold/would-queue tables. The deck's ship-order
strip (shipped → staged → open → pending/gap, blocks of 5, the exact
semantics of `shipOrderForDeck`) carries everything:

- this run's newly-eligible occurrences render as visually distinct cells
  appended in their would-flush position (ship vs hold distinguishable);
- clicking any cell opens an occurrence/card inspector: card id, letter,
  note text, state, shipping build + timestamp (or staged/pending detail);
- per-deck live counts and grid status sit in the rail/lane header;
- global totals, the active-logic-bundle chip and the Publish now button
  (with a one-line forecast summary) sit in a slim pinned header.

One data divergence must be fixed on the way: the forecast computes
`alreadyShipped` from a `COUNT(*)` on `occurrence_shipments` while the real
flush uses the in-memory `deck.Cards.length` — the new page must use one
source. Same for `byDeck`'s local-vs-returned `stagedTotal` naming
collision.

### Layout — PENDING operator click-through (two competing mockups)

The organizing backbone is genuinely open; two clickable mockups were
produced for the operator to choose between (to be copied into `mockups/`
once accepted):

- **Deck rails**: one full-width continuous rail per deck; everything
  anchors to the rails; inspector on cell click.
- **Build timeline**: strips cut by publication on a shared build axis,
  lanes per deck; build-column headers open a build card.

This subsection is finalized (choice + any cross-pollinated elements) when
the operator accepts a mockup. **An item without a locked layout cannot be
built** — the build phase must not start on this capability until this
section names the chosen mockup.

## D-SC3: On-device deck descriptions carry live counts (publish-time)

`Description` shown on the device becomes
`<operator prose> · <N> cards · <M> occurrences`, regenerated at every
publish. Counts are computed from the in-memory model **after** `flushDeck`
(the existing `flushDeck`-time sync happens before the flush appends, so a
naive reuse would be stale by one flush — the sync call moves/repeats after
flush). Operator prose stays `decks.description`, edited exactly as today;
the counts never enter the database, they are formatted into the bundle's
deck entry only. Counts reflect the bundle being shipped: cards =
`deck.Cards` distinct card ids, occurrences = `deck.Cards.length`.

## D-SC4: Publish-time restamp — publish facts are stamped at publish

Today only `BUILD_ID` is restamped at publish (`restampCompanionBuildId`);
`LABEL`/`DATA_VERSION` freeze at assemble and go stale on every later
publish off the same logic bundle. Settled:

- **Assemble-time facts** (unchanged): `BASE_VERSION`, `PATCH_REV` — they
  come from the logic bundle and cannot change mid-run (D-L4).
- **Publish-time facts**: `BUILD_ID`, `LABEL`, `DATA_VERSION`, and new
  `BUILT_AT` (ISO-8601 UTC of the publish). `restampCompanionBuildId`
  generalizes to restamp all four in the scratch bundle **before**
  `bundleSha` is computed and `publish()` runs. The restamp is keyed on the
  constant names in the companion (regex on `var NAME = '...'`), not on the
  previously baked literal, so it works regardless of what assemble baked.
- `boot-ok-companion.js` gains `BUILT_AT = '__MJOLNIR_BUILT_AT__'` exposed
  as `globalThis.MJOLNIR_BUILT_AT`, substituted at assemble by the generic
  mechanism (D-G1) and corrected at publish like the others. Values stay
  synchronous plain constants — no network read; `account-build-info`'s
  no-fetch requirement is preserved, only its "baked at assemble" wording is
  superseded for publish-time facts.
- `publications.created_at` and `BUILT_AT` are the same instant: the
  pipeline passes one timestamp to both (the restamp and the INSERT), so the
  device display and the console history can never disagree.

## D-SC5: One full App version row on the device

`2176-my-account-build-id` renders a single row:

```
App version
b000042 · base 1.5.12 · logic 3 · data 247 · built 2026-11-15 03:12
```

(wrapping is fine; the row's value is one string built from the five
globals). The separate Label and Data version rows are removed. The
no-companion fallback (tier-4 embedded asset) shows `embedded` — fixing the
`&&`/`+` precedence bug that yields `"undefined base:undefined"` today.
Timestamp displayed as `YYYY-MM-DD HH:mm` UTC, derived from the ISO
constant.

## Device-plane check

Nothing here touches `/ota/*` mechanics, `current.json`'s native-read fields
(`buildId`/`url`/`sha256`/`size`), blob serving, or `/mjolnir/userdata/*`.
All changes ride inside bundle JS (redeployable, D04) and the operator
console. `MAGIC_PREFIX` (`__BUNDLE_START_TIME__`) is a runtime marker, not a
build timestamp — not repurposed.

## Alternatives considered

- Having the app read `current.json`'s `label` at runtime — rejected:
  contradicts `account-build-info`'s synchronous-no-fetch requirement and
  adds a network dependency to a screen that must work offline.
- Baking `BUILT_AT` at assemble only — rejected: records assemble time,
  arbitrarily far from publish, same staleness class being removed.
- Counts stored into `decks.description` — rejected: would overwrite
  operator prose and duplicate derivable data into config/state (D151
  spirit); formatting at publish keeps one source for each half.
