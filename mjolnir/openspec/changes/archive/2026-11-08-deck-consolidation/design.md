## Context

A card's id IS `<deckCode><3-digit card_no>` (exactly 6 characters,
`card_slots.id`'s primary key, `tun/docs/03-data-model.md`). Moving a card
from one deck family to another is therefore **not** a `deck_code` column
update — it requires minting that card under a brand-new id, because the
old id's first 3 characters are the old deck code. Every table that
references a card does so by this same string id:

```
card_slots.id (PK)
  ├── minted_notes.card_slot_id        (FK, NOT NULL)
  ├── card_content.card_id             (PK, FK)
  ├── pending_occurrences.card_id      (FK, NOT NULL)
  ├── staged_occurrences.card_id       (FK, NOT NULL)
  └── occurrence_shipments.card_id     (plain TEXT, no FK — app convention only)
```

None of these FKs have `ON UPDATE CASCADE`. Renaming a card's id therefore
means: create the new row(s) first, repoint every referencing row at the
new id, then delete the old row(s) — never update a `card_slots.id` in
place while a FK still points at the old value.

## Goals / Non-Goals

**Goals:**
- Every existing card ends up under a new id consistent with its new
  family's code (and `deck-rollover`'s capacity rules — a family absorbing
  6 old decks' worth of content may need to roll over immediately).
- Every table that references a card by id stays consistent — no orphaned
  `pending_occurrences`/`staged_occurrences`/`occurrence_shipments` row
  pointing at an id that no longer exists in `card_slots`.
- The migration is a single, operator-triggered, one-time script — not a
  regular auto-run hub migration (`hub/bin/server.js`'s existing
  distinction between "fixed catalog data, safe to re-run" and "manual,
  deliberate" scripts; this is squarely the latter, given it's irreversible
  and transforms real data rather than seeding fixed rows).
- A dry-run/preview mode exists before the real, committing run — this
  touches primary keys across 5 tables at once; seeing exactly what will
  happen before it happens is not optional for something this invasive.

**Non-Goals:**
- Not preserving per-deck study progress (`PullCounter`) across the merge
  — operator's explicit, informed decision (see proposal.md).
- Not migrating anything on the device directly — `replay.js` rebuilds
  `Cards[]`/`decks` from hub's DB on every publish; the NEXT publish after
  migration does this automatically.
- Not supporting a partial/incremental migration — this runs once, for
  every existing card at once, not decks-at-a-time.

## Decisions

### D-DC1 — Migration order per card: new id's whole family of rows, THEN repoint, THEN delete old

For each card being migrated (processed in a stable, deterministic order —
grouped by OLD deck code, then by OLD `card_no` ascending, which is the
closest available proxy for "introduction order" given `PullCounter`-based
progress is intentionally not being preserved):

1. Resolve the card's new id via `deck-rollover`'s `resolveActiveDeckCode`
   for its new family, advancing that family's next `card_no` as each card
   is assigned (same `mintCardSlots`-style sequential allocation, just
   applied to existing cards instead of newly-minted ones).
2. INSERT a new `card_slots` row (new id, new deck_code, new card_no, same
   `note_id`/`audio_sha256`/`grammar_rule_id` as the old row).
3. INSERT a new `card_content` row (new id as PK, same N/E/X/A as the old
   row) — a new row, not an UPDATE, since `card_id` is that table's own
   primary key and the new id differs from the old.
4. UPDATE `minted_notes.card_slot_id`, `pending_occurrences.card_id` (+
   `deck_code`), `staged_occurrences.card_id` (+ `deck_code`),
   `occurrence_shipments.card_id` — every row currently pointing at the
   OLD id now points at the NEW id (safe: the new `card_slots`/
   `card_content` rows already exist from steps 2-3, so no FK violation).
5. DELETE the old `card_content` row, then the old `card_slots` row.

All of this runs inside ONE transaction for the whole migration — either
every card moves, or none do.

### D-DC2 — `occurrence_shipments`'s `build_id` stays untouched

Only `card_id` changes; `build_id`/`shipped_at`/`letter` are left exactly
as they were. This deliberately leaves shipment HISTORY pointing at a card
id that no longer corresponds to the card's CURRENT deck (a build shipped
under the old id's deck will forever say so) — accepted, since
`occurrence-shipment-log`'s own existing contract ("which build shipped
this side") is about build provenance, not current deck membership, and
rewriting history to pretend the card was always in its new deck would be
actively misleading.

### D-DC3 — The new deck's `Cards[]` order is migration order, not re-derived

Per D-DC1's processing order, a migrated card's occurrences land in the new
deck in old-deck-code-then-old-card-no order — not re-sorted by original
mint date across decks, not shuffled. This is an arbitrary but stable and
simple choice, consistent with the operator's acceptance of a progress
reset: since nothing about "already studied" is being preserved anyway,
there's no reason to prefer one deterministic order over another beyond
simplicity.

### D-DC4 — Deck removal preserves category contiguity by removing from the END of the shared array position

Mod 2119 requires every "C"-prefixed deck to occupy one contiguous block
in `model.decks` (confirmed reading its category switch — `findIndex` of
the first/last "C" deck, not a filtered list). The new `removeDeck(decks,
name)` function (a plain array splice) preserves this automatically AS
LONG AS it's only ever used to remove decks that are STILL part of the
same contiguous "C" block being spliced from — true here, since every
retired code (C21-C26, C27-C29) is already "C"-prefixed and adjacent to
the kept codes (C20, C30) within that same block. No reordering of the
surviving "C" decks is needed; removing an entry from the middle of an
array and leaving the rest in their relative order preserves contiguity
of whatever subset remains, as long as the REMAINING decks are still
exactly the "C" decks (true — C20 and C30 are both "C"-prefixed, nothing
about removal changes that).

### D-DC5 — Retired `decks` table rows are deleted, not flagged

Once migration confirms zero `card_slots` rows reference a retired code,
its `decks` row is deleted outright (matching `deleteBuild`'s own
precedent in `hub/src/publications.js` — delete when provably safe, don't
carry a `retired` flag forward for something that will never be queried
again).

## Risks / Trade-offs

- **The single biggest risk: a bug in the migration script corrupts real
  production data irreversibly.** Mitigated by: a mandatory dry-run mode
  that reports the full old-id → new-id mapping and every table's planned
  row count change WITHOUT writing anything; running the real migration
  inside one transaction (all-or-nothing); taking a full `pg_dump` of the
  real database immediately before running it for real (operator action,
  outside this change's automated scope, but a hard prerequisite).
- **Study progress resets on every migrated deck** — explicitly accepted
  by the operator; worth restating here since it's the single most
  user-visible consequence of this change.
- **`occurrence_shipments` history becomes slightly confusing to read**
  (D-DC2) — a card's shipment history may show an id prefix that doesn't
  match where the card lives today. Acceptable: this is a debugging/audit
  table, not anything the device or the operator console's main workflows
  depend on matching current deck membership.
- **Lexic absorbing 6 decks' worth of content at once may immediately need
  `deck-rollover`'s overflow** — not a risk so much as a certainty worth
  flagging: `deck-rollover` must land and be tested FIRST, since Lexic's
  very first migration run could plausibly exceed 999 cards.

## Migration Plan

1. Land `deck-rollover` and `deck-descriptions` first (this change depends
   on both: rollover for Lexic's likely-immediate overflow, descriptions so
   the two new decks don't ship with blank descriptions).
2. Implement the migration script with its dry-run mode; test it
   exhaustively against a copy of real data structure (synthetic fixtures
   mirroring the real row counts/shapes, not literally the production DB,
   per this project's existing test conventions).
3. Operator runs the dry-run against the REAL database, reviews the full
   mapping report.
4. Operator takes a `pg_dump` backup.
5. Operator runs the real migration.
6. Operator triggers one real publish, confirms the resulting bundle has
   exactly 2 (or more, if rollover already triggered) "C"-prefixed decks
   with the expected content, and that the old 8 deck codes are gone from
   the decks array.
7. Operator confirms on-device: the app shows the new deck list correctly,
   study works normally (even though starting from zero progress on the
   consolidated decks).

**Rollback**: restore the `pg_dump` taken in step 4. No partial-rollback
path is provided — the migration is all-or-nothing by design (D-DC1), and
a transaction failure mid-run rolls back automatically; the backup exists
for the case where the migration completes but something about its
OUTCOME is wrong in a way the dry-run didn't catch.
