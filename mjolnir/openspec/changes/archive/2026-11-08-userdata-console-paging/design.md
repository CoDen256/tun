## Context

`hub/src/userdata.js`'s `perCardProgress(uid)` reads the whole `totalCards`
array into Node, collects every card id, issues one `WHERE cs.id = ANY($1)`
join, builds a `Map`, and maps the array. `hub/src/server.js`'s
`renderDevicePage` then renders every returned row.

On the real account that is 4,510 rows. But the rows are not the main cost:
`renderDevicePage` inlines the full stored document as pretty-printed JSON in
the snapshot panel, and `historyRowHtml` inlines it again per history entry at
`limit: 20`. Twenty-one copies of a ~1.2 MB document is tens of megabytes of
HTML before the table starts.

Separately, the join returns nothing. `card_slots` holds 44 rows (C30, C20 —
the two decks left after `deck-consolidation`), and this account's 2,575 card
ids are all stock (Z01–C17). `info` is `null` for every row, so Content and
Deck render as empty strings — the spec's "the operator can tell what the card
is about without navigating elsewhere" requirement is currently unmet in
production despite the code being correct as written.

`docs/findings.md`'s R-section (2026-11-07) also establishes that three fields
the table either ignores or mislabels are more useful than what it shows:
`CF` is the interval in days (R2), `Time` is the next-due date (R1), and
`Stage` is a four-valued retirement tier rather than a progress number (R3).

## Goals / Non-Goals

**Goals:**
- The page is usable at 4,510 occurrences, and would be usable at 45,000.
- Content and Deck are populated for stock cards.
- One query shape serves the table, its count, and (later) the aggregates
  `device-insights-page` needs.
- Every new column is a field the record already carries — no derivation that
  could drift from the app.

**Non-Goals:**
- Not changing what `userdata`/`userdata_history` store. D-S5's append-only
  record is untouched.
- Not making the page writable.
- Not building the analytical view. That is `device-insights-page`.
- Not reading card text from `base/`'s checked-in bundle. The *published*
  bundle is the only copy guaranteed to match what the device has.

## Decisions

### D-UP1 — Page in SQL over the JSONB array, not in JS

`totalCards` is a JSONB array in one row, so `jsonb_array_elements` +
`WITH ORDINALITY` turns it into a relation that Postgres can filter, sort and
page:

```sql
FROM userdata u,
     jsonb_array_elements(u.doc->'totalCards') WITH ORDINALITY AS t(card, idx)
WHERE u.device_id = $1
  AND (...filters...)
ORDER BY ... LIMIT $n OFFSET $m
```

Alternatives considered and rejected:

- **Slice in JS before joining.** Simplest, but sorting by anything other than
  the array's own order then requires reading the whole array anyway, and every
  aggregate for the insights page would be a second full read.
- **Materialise `totalCards` into a real table on write.** Fastest to query,
  but it duplicates the authoritative document and introduces a consistency
  problem on every PATCH for no benefit the lateral join does not already give.
  D-S5's "the document is the record" stays true.

`WITH ORDINALITY` matters: the array's own order is the device's presentation
order and must remain the default sort, so there has to be a stable tiebreaker
when sorting on a non-unique column.

### D-UP2 — Card text comes from the published bundle, cached by `build_id`

Stock card content exists in exactly one place hub can reach: the published
bundle. `src/deckData.js` already exports `loadDeckCardModel(bundlePath)`,
which loads the manifest and locates the deck-catalogue/card-content module
pair **by shape** (`Cards` key → decks, `DECK_ID` key → cards) rather than by
module number. Hub imports it directly, the same way it already imports
builder's page bodies (D-P3).

- Keyed on the current `build_id`; the parsed `{ decks, cards }` is cached in
  memory and invalidated when `current.json` points somewhere else.
- **Never module 2113 by number.** C-section notes record that id drifting
  between builds (`2111`/`2113` "in the build we've been editing"), and
  `locateDeckCardModules` exists precisely so nothing has to hard-code it.
- If the bundle is missing or unparseable, Content falls back to empty and the
  page still renders, with an `inline-note` saying why. A broken bundle must
  degrade one column, never the page.
- `card_content` still wins for hub-minted cards, since those are authoritative
  in the database and may be newer than the last publish.

### D-UP3 — Deck label from the record's `D` field, never from `decks`

Each progress record carries `D`, the denormalised deck title (R7). The `decks`
table holds only the two hub-managed decks after `deck-consolidation`, so it
cannot label a stock deck at all. Using `D` means the Deck column needs no join
and cannot go blank. The bundle's deck catalogue (same `loadDeckCardModel`
call) supplies the canonical title where it differs — `D` is upper-cased on
device, the catalogue's `Title` is sentence case.

### D-UP4 — Raw documents behind a fetch, not inlined

A new `GET /mjolnir/device/doc?uid=<uid>` returns the current document and
`?historyId=<id>` returns one history row's document, both as JSON. The
`<details>` elements keep their shape but load on first expand.

This also removes the only place the page's cost scaled with *both* the card
count and the history limit at once. It keeps `historyDeltas`' existing
`limit + 1` diff logic untouched — the deltas are small and still computed
server-side; only the full documents move.

### D-UP5 — State labels follow R3/R4, and the raw `Stage` stays visible

R3 establishes `Stage` is a four-valued tier, and R4 proves the auto-park rule
behind it. So `cardStatusPill` becomes:

| condition | label |
|---|---|
| `Stage 3` | **in rotation** |
| `Stage 200` | **retired at ceiling** |
| `Stage 150` | **parked early** |
| `Stage 100` | **parked early, dormant** |

Two deliberate restraints:

- The existing `type === "brand"` → "brand new" branch is **dropped**: `Type`
  holds only `prev` and `same` on real data, never `brand`, so that branch is
  dead and its pill is misleading if it ever did fire.
- "Parked early" is **not** called "manually archived". R9 is explicit that
  `AutoParkHit = 0` cannot distinguish a hand-park from mod 2133's `FreshPark`.
  The label stays descriptive.

The raw `Stage` number stays available in a column so the mapping is always
checkable against the stored value.

### D-UP6 — Filters are a fixed enumeration, not free SQL

`deck`, `side`, `state` and `flag` map to a closed set of predicates chosen
server-side; `q` is a parameterised `ILIKE` over card id and the bundle-derived
text. No filter value reaches SQL as anything but a bound parameter, and an
unrecognised value is ignored rather than erroring — the same posture as the
existing `uid` handling, which already restricts to a uid `listAccounts`
returned rather than trusting the query string.

Text search has a wrinkle: the searchable text comes from the bundle, not the
database, so it cannot be an SQL predicate. Searching therefore filters the
page's returned rows *after* the id-level query, and the `q` filter narrows to
matching card ids resolved from the cached bundle index first, then passes them
as an id list into the same query. That keeps one query shape and keeps the
count honest.

## Risks / Trade-offs

- **The bundle parse is the one new failure mode.** Mitigated by D-UP2's
  fallback and by caching, so a parse happens once per published build rather
  than once per request.
- **`q` costs a full id resolution** against the cached card index. At ~2,800
  stock cards that is trivial, and it avoids pushing bundle-derived text into
  Postgres.
- **Offset paging degrades at deep pages.** At 4,510 rows it is irrelevant;
  noted so nobody is surprised if this is ever pointed at a much larger array.

## Migration Plan

No schema change and no data migration — every field used is already stored.
The route keeps working with no query parameters (page 1, array order, no
filters), so an operator's existing bookmark behaves as before.
