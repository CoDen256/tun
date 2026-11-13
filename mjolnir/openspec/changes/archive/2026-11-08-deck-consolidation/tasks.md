## 0. Before you write any code

**Confirm `deck-rollover` and `deck-descriptions` are both fully
implemented and tested first** — this change depends on both (D-DC1 needs
`resolveActiveDeckCode`; the two new decks need real descriptions from
day one, not blank ones). Read `design.md` in full, especially D-DC1 (the
exact per-card migration sequencing — insert-new-before-repoint-before-
delete-old, never the reverse) and the Migration Plan's dry-run
requirement. Read `hub/migrations/001_init.sql`/`003_pending_occurrences.
sql`/`004_occurrence_shipments.sql`/`011_card_content.sql`/
`016_staged_occurrences.sql` in full to confirm the exact FK shape design.md
describes before writing any migration code against it.

## 1. Family definitions

- [x] 1.1 `builder/src/deckFamilies.js`'s `DECK_FAMILIES` (from
      `deck-rollover`): define `lexic` (title "Lexic", starting code C30)
      and `practice` (title "Practice", starting code C20), each with a
      real sequence of overflow codes. Done: 10 codes each (C30-C39,
      C20-C29), matching deck-rollover's own "C20-C29 is enough for now"
      precedent.
- [x] 1.2 `builder/src/deckAssignment.js`'s `assignDeck`: collapse
      `WORD_POS_DECK`/`TYPE_DECK` into the 2-family mapping (any `type=word`
      PoS → `lexic`; `type=expression` → `lexic`; `type=grammar`/
      `listening`/`pronunciation` → `practice`). Update its existing tests
      for the new return shape (a family key, not a literal deck code).
- [x] 1.3 `hub/src/decks.js`'s `DECK_ALLOCATION`: becomes the 2 starting
      codes (C20 "Practice", C30 "Lexic") with real descriptions (per
      `deck-descriptions`). Collateral fix: `hub/test/hub.test.js`'s
      deck-descriptions test referenced the now-gone "C29" — repointed at
      "C30".

## 2. Migration script — dry-run mode

- [x] 2.1 New script (e.g. `hub/scripts/migrate-deck-consolidation.js`,
      operator-triggered, NOT part of `hub/src/migrate.js`'s auto-run
      migrations) that, given the current `card_slots` table, computes the
      full old-id → new-id mapping per D-DC1 (grouped by old deck_code,
      ordered by old card_no, assigned sequentially into each card's new
      family via `resolveActiveDeckCode`) — read-only, writes nothing.
      Placement: `hub/bin/migrate-deck-consolidation.js` (matching this
      repo's existing `hub/bin/migrate.js`/`seed.js` convention, not a new
      `scripts/` directory); core logic lives in the importable/testable
      `hub/src/deckConsolidationMigration.js`, with `bin/` as a thin CLI
      wrapper (`--apply` flag, defaults to dry-run). A pure `planMigration`
      function is the single source of truth both dry-run and apply call
      against the same `card_slots` snapshot — guarantees apply always
      produces exactly what the dry-run predicted (3.4), rather than
      duplicating the allocation logic once for the read-only report and
      once again for the real writes. Scoped to only the 10 original
      pre-consolidation codes (`OLD_DECK_TO_FAMILY`'s keys) — any other
      deck code already in `card_slots` (a hand-created custom deck, or —
      on a second accidental run — this migration's own new codes) is
      simply not read, not a reason to throw.
- [x] 2.2 Dry-run output: a clear, complete report — every old id → new id
      pair, a per-table row-count summary of what WOULD change
      (`card_slots`, `card_content`, `pending_occurrences`,
      `staged_occurrences`, `occurrence_shipments`, `minted_notes`), and
      whether `lexic`'s migration would trigger an immediate rollover
      (more than 999 cards migrating into it).
- [x] 2.3 Tests: dry-run against a synthetic fixture mirroring real
      table shapes (not the real DB) produces the correct mapping and
      counts, confirmed against hand-computed expected output; dry-run
      writes nothing (every table's row count is unchanged after running
      it).

## 3. Migration script — apply mode

- [x] 3.1 The same mapping computed in 2.1, applied for real: one
      transaction, in the exact per-card order from D-DC1 (insert new
      `card_slots` + `card_content` rows, repoint every referencing table,
      delete old `card_content` + `card_slots` rows).
- [x] 3.2 A full-migration failure (any error mid-transaction) rolls back
      completely — no partial state.
- [x] 3.3 After migration: delete the `decks` table row for any code with
      zero remaining `card_slots` references (D-DC5), via the new
      `deck-removal` capability (section 4). Refinement: a family's own
      STARTING code (C20/C30) is explicitly exempt from this deletion even
      if it ends up with zero cards — C20 is REUSED (practice's new
      starting point), not retired, and its `decks` row is permanent,
      pre-seeded infrastructure (`DECK_ALLOCATION`), not something this
      one-time migration should ever delete. (This deletion operates on
      hub's `decks` TABLE row, via plain SQL — not a call into
      `removeDeck`, which operates on the in-memory bundle `decks` ARRAY
      that this migration script, working only against Postgres, never
      touches; see 5.1's note on where `removeDeck` actually gets wired
      in.)
- [x] 3.4 Tests: applying the migration against a synthetic fixture
      produces exactly the mapping the dry-run reported; every table ends
      up internally consistent (no `pending_occurrences`/
      `staged_occurrences` row referencing a nonexistent `card_slots.id`,
      no `card_content` row with a stale id); a forced failure partway
      through leaves zero rows changed (full rollback verified by
      comparing full-table contents before/after the forced-failure
      attempt).

## 4. Deck removal

- [x] 4.1 `src/injectDeck.js`: `removeDeck(decks, name)` — removes the
      named deck's entry; refuses (throws) if hub reports any `card_slots`
      row still referencing it. Signature: `removeDeck(decks, name,
      {cardCount})` — the module stays pure/synchronous like everything
      else in `injectDeck.js` (no DB connection of its own), so the caller
      (the migration script / pipeline.js, both of which hold the live
      connection) supplies the reference count rather than this function
      querying it itself.
- [x] 4.2 Tests: removing a deck with zero remaining references succeeds
      and the remaining "C"-prefixed decks still form one contiguous block
      (test this directly — build a decks array matching the real pre-
      migration shape, remove the 8 retired codes, assert the array's
      "C"-prefixed entries are contiguous by index); removing a deck that
      still has a referencing card_slots row throws and changes nothing.

## 5. End-to-end verification

- [x] 5.1 A full pipeline test: migrate a synthetic pre-consolidation
      fixture (card_slots/card_content/occurrence_shipments/
      pending_occurrences/staged_occurrences populated across the old 10
      deck codes, including one deck with 999 cards to confirm rollover
      triggers for `lexic`), then run a real publish — confirm the
      resulting bundle has exactly the expected "C"-prefixed decks (2, or
      3+ if rollover triggered), each with the expected `Cards.length` and
      card content, and the 8 retired codes are absent from `model.decks`.
      `builder/test/deckConsolidationPipeline.test.js`. This surfaced three
      real gaps beyond what design.md anticipated (all fixed, see 6.1):
      the active bundle's own stale baked-in decks/cards (from before
      migration) are never otherwise removed/reset; `decks.title` for a
      REUSED code never updates on its own; and a scratch bundle's
      `.exploded` sidecar directory wasn't cleaned up, which could corrupt
      a later run reusing the same buildId after an earlier failed one.
- [x] 5.2 Confirm a NEW note arriving after migration mints correctly into
      the right family's currently-active code (not accidentally reusing a
      retired code). Covered in the same test: a post-migration `lexic`
      note lands in the already-rolled-over C31 (not the full C30), and a
      post-migration `practice` note lands in the reused C20 (not a
      retired code).

## 6. Sign-off

- [x] 6.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`. Four refinements beyond design.md, found
      while building task 5.1's thorough end-to-end test (all implemented
      and covered by tests):
      1. **Reused-code title never updates on its own.** `seedDecks`' `ON
         CONFLICT DO NOTHING` never touches a pre-existing `decks.title`
         row, so C20's title would stay "Substantiv" forever after
         migration. `applyMigration` now explicitly retitles a family's
         starting code when it's also one of the old retired codes
         (`retitledDeckCodes` in its return value).
      2. **`Title` was never synced to an existing bundle deck at all** —
         `ensureDeck`'s idempotent-return-untouched contract (by design,
         for `PullCounter`/etc) also silently protected `Title`, which
         `deck-descriptions` never needed to touch. Added `syncDeckTitle`
         (`src/injectDeck.js`), mirroring `syncDeckDescription` exactly,
         wired into the same 3 `pipeline.js` call sites.
      3. **A reused deck's stale baked-in Cards[]/cards/PullCounter.**
         `replay` only ever ADDS cards/decks — nothing previously stripped
         a deck's PRE-migration content when its code gets reused by a
         different family, which both risks a literal id collision (a
         freshly-assigned id in the reused code textually matching an old,
         still-present stale card) and leaves a stale study position
         against entirely different content. `pipeline.js`'s new
         `resetReusedDecks` (keyed off a deck's baked-in `Title` no longer
         matching hub's current title for that code — the only way they
         ever diverge in this codebase) clears the stale Cards[]/cards and
         resets `PullCounter` before `replay` rebuilds the deck fresh.
         `pruneRetiredDecks` (deck-rollover's own removeDeck wiring) was
         similarly missing a step — it removed a retired deck's entry but
         not its stale baked-in cards, which failed `saveDeckCardModel`'s
         referential-integrity check; fixed in the same function.
      4. **`runPublish`'s scratch-file cleanup leaked a sidecar
         directory.** Unrelated to deck semantics, but found via the same
         thorough testing: `finally` deleted the scratch bundle file but
         not its `.exploded` manifest sidecar; since `nextBuildId` only
         advances once a run actually publishes, a run that fails before
         publishing leaves the NEXT run computing the identical buildId —
         reusing the identical scratchPath — where it hit a stale,
         mismatched manifest and threw "could not locate the deck-catalog/
         card-content module pair." Fixed by also removing
         `${scratchPath}.exploded` in `finally`.
      Also: per `builder-pipeline` test rewrites for the 2-family scheme,
      two independently pre-existing (pre-dating this change, confirmed
      via `git stash` against the baseline) broken tests in
      `builder/test/pipeline.test.js` ("D86" and "D-H4") used an id-
      collision mechanism that can never actually trigger (`mintCardSlots`
      always computes a fresh id past whatever's already in `card_slots`,
      so a row planted at the "colliding" id just shifts the computed next
      id past it) — rewritten using mechanisms that actually exercise the
      same properties (self-heal via a genuinely-crashed-prior-run
      simulation; a real failure via an unregistered audio blob).
- [x] 6.2 **(Operator, outside this change — follow design.md's Migration
      Plan exactly)**: run the dry-run against the REAL database, review
      the full mapping report by hand; take a `pg_dump` backup; run the
      real migration; trigger one real publish; confirm on-device the app
      shows exactly the new 2(+rollover) decks, study works normally, and
      the 8 retired decks are gone from the deck-selection screen.
