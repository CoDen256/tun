## 0. Before you write any code

Read `design.md` in full, especially D-DR1 (static family table, not
computed arithmetic), D-DR2 (resolve-once-per-family-per-run, not per
note), and D-DR4 (rollover deck auto-creation, title derivation). Read
`builder/src/deckAssignment.js`'s `assignDeck` and `builder/src/mint.js`'s
`mintCardSlots`/`deckTitle` in full before touching either — this sits in
front of both, not inside them.

## 1. Family table and resolution

- [x] 1.1 New `builder/src/deckFamilies.js`: `DECK_FAMILIES` static table
      per D-DR1 (initially a stub/placeholder family set — `deck-
      consolidation` is the change that fills in the real `lexic`/
      `practice` families and codes; this change just builds the
      mechanism).
- [x] 1.2 `resolveActiveDeckCode(pool, familyKey)` per D-DR2 — returns the
      first code in the family's sequence with fewer than 999 minted
      cards; throws a clearly-named error if every code is full.
- [x] 1.3 Tests: a family's starting code with room resolves to itself; a
      full starting code resolves to the next configured code; every code
      full throws; the error names the exhausted family.

## 2. Rollover deck auto-creation

- [x] 2.1 A new function (`hub/src/decks.js` or `builder/src/deckFamilies.js`
      — decide at implementation time which module owns it) that creates a
      `decks` row for a family's Nth code on first use, titled `"<family
      title> <roman numeral N>"`, description `""`. Decision: lives in
      `builder/src/deckFamilies.js` (`ensureRolloverDeck`), colocated with
      `resolveActiveDeckCode` since builder talks to hub's `decks` table
      via its own raw `pool`, not hub's `query()` wrapper.
- [x] 2.2 Wire this into `resolveActiveDeckCode` (or its caller) so rolling
      over to a new code auto-creates its `decks` row exactly once, not on
      every subsequent run that mints into an already-rolled-over code.
- [x] 2.3 Tests: first rollover creates the row with the correct derived
      title; a second run minting into the same already-rolled-over code
      does not attempt to re-create or duplicate the row.

## 3. Pipeline integration

- [x] 3.1 `builder/src/deckAssignment.js`'s `assignDeck` returns a family
      key (not a literal code); update its own tests for the new return
      shape.
- [x] 3.2 `builder/src/pipeline.js`: wherever a family key reaches
      `mintCardSlots`, resolve it to an actual code via
      `resolveActiveDeckCode` first — once per family per run, not once
      per note (cached the same way `deckTitleCache` already is). Done in
      `pullAndAssign` itself (resolved once per family group, before
      `newlyEligibleByDeck` is returned), so every downstream caller
      (forecast and publish) already deals in literal codes unchanged.
- [x] 3.3 Tests: an end-to-end mint run correctly resolves a family to its
      active code and mints there; a full pipeline test confirms a
      simulated rollover (seed `card_slots` with 999 rows for a family's
      starting code, then mint one more note assigned to that family —
      confirm it lands in the next code, not a 1000th row in the first).

## 4. Sign-off

- [x] 4.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`. Nothing contradicted it — implementation
      matched D-DR1 through D-DR4 as written, including the 2.1 module
      placement decision design.md left open (see task 2.1's note).
- [x] 4.2 Re-run the full builder test suite — confirm no existing test
      assumed `assignDeck` returns a literal deck code. Ran against a
      throwaway, isolated postgres container (never the shared dev/prod
      one `compose.yaml` points at — that DB is live and these tests
      TRUNCATE their tables). 76/83 pass; the 5 failing tests fail
      identically on the pre-deck-rollover baseline (confirmed via `git
      stash`) — pre-existing, unrelated to this change.
