## 0. Before you write any code

Read `design.md` in full, especially D-W1 (new table, separate from D91's
queue), D-W2 (flush floors to the largest multiple of 5, every run,
uniformly), and D-W4's sequencing note (verify the builder-side guarantee
actually holds before deleting the app-side patch — don't do both in one
uncheckable step). Read `builder/src/pipeline.js`'s
`appendImmediateOccurrences`/`drainThenQueue` and
`builder/src/pendingOccurrences.js` in full before touching either — the
new staging mechanism sits structurally parallel to the existing D91
queue, not inside it.

## 1. Staging storage

- [x] 1.1 New hub migration: `staged_occurrences(id SERIAL PK, deck_code
      TEXT, card_id TEXT, letter TEXT, staged_at TIMESTAMPTZ DEFAULT
      now())`.
- [x] 1.2 New module (e.g. `builder/src/stagedOccurrences.js`):
      `stageOccurrence(pool, {deckCode, cardId, letter})`,
      `stagedCount(pool, deckCode)`, `flushShippable(pool, deckCode)` —
      returns the oldest `floor(count/5)*5` rows (by `id` ASC, same
      FIFO-ordering reasoning as D-F2) and deletes them, or returns an
      empty array (and the caller logs) if `count < 5`.
- [x] 1.3 Tests: staging then flushing with 11 staged ships exactly 10
      (the 10 oldest), leaves 1; staging with 9 ships 5, leaves 4; staging
      with 4 ships 0, leaves all 4; FIFO order is respected across
      multiple staging calls spanning simulated "runs".

## 2. Pipeline integration

- [x] 2.1 `appendImmediateOccurrences`: replace its `addOccurrence` call
      with `stageOccurrence`.
- [x] 2.2 `drainThenQueue`: replace its `addOccurrence` call (for drained
      rows) with `stageOccurrence`.
- [x] 2.3 Add the flush step: once per deck per run, after that deck's
      minting/draining/staging is done, call `flushShippable`; for each
      returned `{cardId, letter}`, call `addOccurrence(deck, cardId,
      letter)` and push onto `shipments` (so `occurrence_shipments`
      records it against this run's build — confirm this still only
      happens for a run that actually publishes successfully, per
      `occurrence-shipment-log`'s existing "never record for a failed
      run" guarantee, now applying to the flush step instead of the old
      direct-append call sites).
- [x] 2.4 If nothing was flushed for a deck that has staged occurrences,
      log it (deck code, staged count, that it's short of the next
      multiple of 5) — no other action.
- [x] 2.5 Tests: a full pipeline run (mint → stage → flush) produces the
      correct final `Cards.length` (always a multiple of 5) across
      several simulated runs with varying numbers of newly-eligible notes
      per run; minting itself is confirmed unaffected (card_slots/content
      rows appear immediately regardless of staging/flush outcome).

## 3. Forecast (if touched)

- [x] 3.1 Check whether `runForecast` (the dry-run preview) needs updating
      to reflect "would stage" vs. "would ship" as two different outcomes,
      now that eligibility no longer means immediate shipping. Update if
      its existing output would otherwise mislead an operator into
      thinking something ships that's actually just staged.

## 4. Revert the app-side display fix

- [x] 4.1 **Do this only after tasks 1-3 are done, tested, and (ideally)
      confirmed against at least one real publish** — per D-W4's
      sequencing note. Delete
      `patches/js/2119-deck-completion-display.baseline.js`,
      `patches/js/2119-deck-completion-display.edited.js`,
      `test/unit/deckCompletionDisplay.test.js`.
- [x] 4.2 Delete the `openspec/changes/deck-completion-display-fix/`
      folder outright (never archived — same precedent as
      `audio-link-playback-minimal`/`progress-sync-shim`).
- [x] 4.3 Record an ADR amendment in `tun/docs/07-decisions.md`
      explaining the fix moved to its root cause (this change) rather
      than staying as an app-side symptom patch — reference both this
      change and the superseded one.
- [x] 4.4 Re-run the full test suite after the deletion — confirm nothing
      else referenced the deleted patch/test files.

## 5. Sign-off

- [x] 5.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`.
- [x] 5.2 **(Operator, outside this change)** Run a real (or close-to-real)
      builder publish cycle across several runs with small numbers of
      newly-eligible notes per run; confirm every affected deck's
      `Cards.length` lands on a multiple of 5 after each flush, and that a
      deck with a sub-5 remainder logs correctly without shipping
      anything. Only after this is confirmed should task 4's revert be
      considered safe to have landed.
