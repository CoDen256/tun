## 1. Hub schema

- [x] 1.1 Add migration: `decks.managed_by_hub boolean NOT NULL DEFAULT false`
- [x] 1.2 Add backfill migration (or combine with 1.1): set
      `managed_by_hub = true` for every currently-existing `decks` row
      (today: `C20`, `C30`)
- [x] 1.3 Set `managed_by_hub = true` at the INSERT in `deckFamilies.js`
      wherever a new hub-managed deck code is first created

## 2. Builder pipeline fix

- [x] 2.1 Update `pruneRetiredDecks` (`builder/src/pipeline.js:192-209`) to
      look up `managed_by_hub` for each candidate deck and skip pruning
      unless it is `true`
- [x] 2.2 Keep the existing `card_slots` zero-count check as an AND
      condition (both must hold), not a replacement
- [x] 2.3 Update the function's header comment to state the corrected
      invariant (no longer "only the migration's own retired codes can
      ever reach zero" — now "only codes hub has a positive managed
      record for")

## 3. Spec sync

- [x] 3.1 Confirm this change's `deck-removal` delta spec reconciles
      cleanly whenever `deck-consolidation`'s own pending `deck-removal`
      delta is synced/archived (same capability, two changes touching it)

## 4. Tests

- [x] 4.1 Unit test: `pruneRetiredDecks` does NOT remove a deck with zero
      `card_slots` rows when it has no `decks` row at all (simulates a
      stock deck)
- [x] 4.2 Unit test: `pruneRetiredDecks` does NOT remove a deck with zero
      `card_slots` rows when its `decks` row has `managed_by_hub = false`
- [x] 4.3 Unit test: `pruneRetiredDecks` DOES remove a deck with zero
      `card_slots` rows when `managed_by_hub = true` (existing retirement
      behavior still works)
- [x] 4.4 Regression test covering the exact reported scenario: a model
      containing stock `C01`/`C03`/`C10`-`C17` plus hub-managed `C20`/`C30`
      survives a full pipeline run with all stock decks intact

## 5. Operator follow-up (outside automated scope)

- [x] 5.1 Operator checks whether the currently-live published bundle is
      missing stock decks `C01`/`C03`/`C10`-`C17`, and if so, decides how
      to restore them (separate from this change) — resolved: operator
      will publish a new live bundle with this fix in place, which stops
      pruning them going forward; no separate recovery step needed
