## Why

The Device sync page is unusable on the one account that matters. It renders
**4,510 per-card rows in a single response** with no paging, sorting or
filtering, and the real account has exactly that many occurrences.

Three separate defects, measured on the restored snapshot in
`tun/tun-backup/mjolnir.sql`:

1. **The page weight is dominated by raw documents, not by the table.**
   `renderDevicePage` inlines `JSON.stringify(doc, null, 2)` once for the
   progress snapshot and once per history entry (`historyRowHtml`, limit 20) —
   **21 pretty-printed copies of a ~1.2 MB document**, before a single `<tr>`
   is written. Paging the table alone would not fix the page.

2. **The Content and Deck columns are empty for every row.**
   `perCardProgress` joins `totalCards` against `card_slots`/`decks`/
   `card_content`. Those tables hold **44 hub-minted cards** (C30 and C20
   only) and **not one** of this account's 2,575 card ids is among them, so
   `info` is `null` on all 4,510 rows: Content renders empty, Deck renders
   empty. Stock card text does not live in the database at all — it lives in
   the published bundle's card-content module. Meanwhile the record itself
   already carries its deck title in its `D` field, unused.

3. **The whole array is read into Node on every request** to be sliced,
   mapped and counted in JS, when it is a single JSONB column Postgres can
   filter, sort, page and aggregate directly.

This change fixes the existing page. The new analytical view is a separate
change (`device-insights-page`), which depends on the query shape and the
content join introduced here.

## What Changes

- **`perCardProgress` becomes a paged, sorted, filtered query** built on
  `jsonb_array_elements(doc->'totalCards') WITH ORDINALITY` + a lateral join,
  accepting `{ page, size, sort, dir, deck, side, state, flag, q }` and
  returning `{ rows, total }`. The same query shape, minus `LIMIT`, is the
  `COUNT(*)`; the same shape with `GROUP BY` is what `device-insights-page`
  will use for its aggregates. One join to maintain, not several.
- **Card text comes from the published bundle**, via the existing
  `loadDeckCardModel(bundlePath)` in `src/deckData.js` against the current
  build, cached per `build_id`. This is reuse, not new machinery: that
  function already locates the deck/card module pair *by shape* rather than by
  a hard-coded module id, which is what the Catalogue and workbench use.
  `card_content` remains the source for hub-minted cards.
- **Deck label comes from the record's own `D` field** (R7), with the
  bundle's deck catalogue as the display-name source — not from the `decks`
  table, which only ever holds the two hub-managed decks.
- **Raw documents are no longer inlined.** The progress snapshot and each
  history entry fetch their document on demand from a new
  `GET /mjolnir/device/doc?uid=&historyId=` endpoint. This alone removes
  ~95% of the page's bytes.
- **New columns the records already carry**, all free and all currently
  discarded: interval (`CF`, in days — R2), next due (`Time` — R1), reschedule
  count, and the `Tag`/`Panic` flags (R5, R6). State labels follow R3/R4
  rather than printing a raw `Stage` number.
- **The direction column stays labeled "Side"** and content stays `N`-only —
  both existing spec requirements, unchanged.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `userdata-console`: the per-card progress table gains paging, sorting and
  filtering; its content join moves to the published bundle; raw documents
  move behind a fetch.

## Impact

- `hub/src/userdata.js`: `perCardProgress` rewritten as the lateral-join
  query; new `userdataDoc(uid)` / `historyDoc(id)` readers.
- `hub/src/cardText.js` (new): bundle-backed card/deck text lookup, cached by
  `build_id`, wrapping `loadDeckCardModel`.
- `hub/src/server.js`: `/mjolnir/device` reads query params and renders the
  toolbar + pager; new `/mjolnir/device/doc` route; `historyRowHtml` and the
  snapshot panel stop inlining documents.
- `hub/test/`: new coverage for paging/sorting/filtering boundaries and for a
  bundle-missing fallback.
- No device-side or builder change. No schema migration — the data is all
  already stored.

## Non-Goals

- Not deriving a `review_events` table from `userdata_history` (worth doing,
  separate change — see `device-insights-page`'s design.md).
- Not editing progress. The page stays read-only, per the existing
  `userdata-console` requirement.
