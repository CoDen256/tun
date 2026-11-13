## 0. Before you write any code

Read `design.md` in full — especially D-UP2 (card text comes from the
*published* bundle via `loadDeckCardModel`, never module 2113 by number) and
D-UP5 (why "parked early" must not be called "manually archived").

Read `docs/findings.md`'s **R-section (2026-11-07)** before touching any field
semantics. R1–R3 overturn the body's reading of `Time`, `CF` and `Stage`, and
this change depends on all three being right:

- `Time` is the **next-due** timestamp (R1), not last-touched.
- `CF` is the **interval in days** (R2), not an ease-factor percentage.
- `Stage` has exactly four values and is a retirement tier (R3).
- `Graduated` is `true` on every row and carries no information — do not
  branch on it (R3).
- `Park` is exactly `Stage ≠ 3` — do not treat them as independent (R3).

Then read `hub/src/userdata.js`'s `perCardProgress`, `hub/src/server.js`'s
`renderDevicePage`/`historyRowHtml`/`cardStatusPill`, and
`src/deckData.js`'s `loadDeckCardModel`/`locateDeckCardModules`.

Confirm the defect before fixing it, so the fix is aimed at the real cause:
against a restored copy of the snapshot, check that `perCardProgress` returns
4,510 rows with `content === null` and `deckCode === null` on every one.

## 1. Card text from the published bundle

- [x] 1.1 New `hub/src/cardText.js`: `cardIndex()` resolving the current
      `build_id`, loading `{ decks, cards }` via `loadDeckCardModel` on that
      build's bundle path, and returning `{ cardById, deckByCode }`.
- [x] 1.2 Cache the parsed index in memory keyed on `build_id`; invalidate
      when `current.json` moves. One parse per published build, not per
      request.
- [x] 1.3 Fallback per D-UP2: a missing or unparseable bundle yields an empty
      index and a reason string, never a throw that reaches the route.
- [x] 1.4 `card_content` takes precedence over the bundle for ids present in
      both.
- [x] 1.5 Tests: index built from a fixture bundle; `card_content` wins on
      overlap; missing bundle returns an empty index plus a reason.

## 2. The paged query

- [x] 2.1 Rewrite `perCardProgress(uid, opts)` as the
      `jsonb_array_elements(... ) WITH ORDINALITY` lateral join of D-UP1,
      accepting `{ page, size, sort, dir, deck, side, state, flag, q }` and
      returning `{ rows, total }`.
- [x] 2.2 Default sort is the array's own ordinality — the device's
      presentation order. Every other sort appends ordinality as a tiebreaker
      so paging is stable (D-UP1).
- [x] 2.3 Filters as a closed enumeration of bound predicates (D-UP6);
      unrecognised values are ignored, not errors.
- [x] 2.4 `q` resolves to a card-id list from the cached bundle index first,
      then passes that list into the same query, so the count stays honest
      (D-UP6).
- [x] 2.5 Return the fields the record already carries and the table currently
      discards: interval (`CF`), next due (`Time`), reschedule count, `Tag`,
      `Panic`, `AutoParkHit`, raw `Stage`.
- [x] 2.6 Tests: page boundaries (first, last, past-the-end); `total` tracks
      filters; stable order across pages when sorting a column with many ties;
      an account with an empty `totalCards`; an account with no row at all.

## 3. Documents behind a fetch

- [x] 3.1 New read-only `GET /mjolnir/device/doc?uid=` (current document) and
      `?historyId=` (one history row's document), returning JSON. Restrict
      `uid` to one `listAccounts` returned, matching the existing route's
      posture; `historyId` must belong to that uid.
- [x] 3.2 Remove the inlined `JSON.stringify(doc, null, 2)` from the snapshot
      panel and from `historyRowHtml`; load on first expand instead.
- [x] 3.3 Leave `historyDeltas` and its `limit + 1` diff logic alone — only
      the full documents move.
- [x] 3.4 Test: the rendered page for a large-document account contains no
      copy of the document, and its size does not grow with the history limit.

## 4. The table itself

- [x] 4.1 Toolbar: search box, deck / side / state / flag selects, sort
      control, page-size select, clear. Reuse `layout.js`'s existing
      `.toolbar`, `select` and `.btn-ghost` styles — no new design system.
- [x] 4.2 Pager: prev/next, first/last, elided page numbers, and an
      "showing N–M of T" readout. Match the mockup's pager markup.
- [x] 4.3 `cardStatusPill` → the four R3/R4 labels of D-UP5. Delete the dead
      `type === "brand"` branch.
- [x] 4.4 Deck column from the record's `D` field, titled from the bundle's
      deck catalogue (D-UP3) — not from the `decks` table.
- [x] 4.5 Keep the Side column labeled "Side" and the Content column `N`-only
      (both existing spec requirements).
- [x] 4.6 Keep the existing explanatory `inline-note` under the table, and add
      one naming the content source when it came from the bundle.

## 5. Verify against the real snapshot

- [x] 5.1 Restore `tun/tun-backup/mjolnir.sql` into a scratch database and
      open the page for `3wEnqPaPO2cSg2WOqNt6FXuZZvC3`.
- [x] 5.2 Confirm Content and Deck are populated on every row — this is the
      defect that made the columns blank in production.
- [x] 5.3 Confirm the unfiltered total reads **4,510**, and that filtering to
      state "in rotation" reads **913**. These are the snapshot's true counts
      and are a cheap check that the lateral join neither drops nor duplicates
      rows.
- [x] 5.4 Confirm the response size is a few hundred KB rather than tens of MB.
- [x] 5.5 Run `npm test` in `hub/`.
