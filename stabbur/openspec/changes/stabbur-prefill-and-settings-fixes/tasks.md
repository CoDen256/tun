# Tasks — stabbur-prefill-and-settings-fixes

Acceptance criteria are in `acceptance.md`. Each group names the criteria it
must turn green. The design decisions are in `design.md`.

## 1. Settings page (item 1 — S01–S05, design D4)

- [ ] 1.1 Confirm in a browser why drag fails today and record it in one line
  in `DECISIONS-MADE.md`.
- [ ] 1.2 `ui/ui.js`: make settings changes optimistic. A save response
  never overwrites a value changed after that request was sent, and a
  response never re-renders a list mid-drag. Show inline per-section and
  per-list Saving… / ✓ Saved / error status, as in the mockup.
- [ ] 1.3 `routes/settings.py`: reuse the smia catalogue for up to 60 s and
  never cache a failed fetch. Update the operator-settings reconciliation
  wording as in the spec delta.
- [ ] 1.4 Tests: two settings reads within 60 s make one catalogue call; a
  failed catalogue fetch is retried on the next read.

## 3. Sheet sentence count (item 3 — E01–E04, design D5)

- [ ] 3.1 Migration plus model: a nullable sheet-count column with a 1–10
  check constraint. `settings_store` default `max(5, examples_count)`. Accept
  it in `PATCH` and validate M ≤ K (400 with a readable message). Tests.
- [ ] 3.2 `ui/ui.js`: examples lookups send `limit = K`. Prefill slices the
  first M per provider. Settings shows the third stepper, the disabled-button
  rule with its note, the renamed section and the summary line, all as in
  the mockup.

## 4. Per-provider count + On note (item 4 — E05–E08, design D6)

- [ ] 4.1 The Examples sheet's per-provider row: count stepper, pill `· n`,
  rerun/Enter re-asks only that provider with that row's query and count,
  and Reset clears both. The state is per note and is never sent to
  settings.
- [ ] 4.2 Show **On note** (disabled) for candidates the note already holds,
  using the loose comparison, and update it live on Use and on delete.

## 2. Progressive prefill (item 2 — P01–P06, design D1–D2)

- [ ] 2.1 Reproduce or trace the intermittent 500 (D2) *before* changing the
  walk. Record the cause and the fix in one line in
  `batches/stabbur-fixes/DECISIONS-MADE.md`.
- [ ] 2.2 `ui/ui.js`: each prefill step resolves as soon as the provider it
  will use has answered (strict operator order, D1). It no longer waits on
  `ensureKind` for every enabled provider. Lookups are still fired in
  parallel up front.
- [ ] 2.3 Run the steps concurrently. Gate only inflections, translations
  and audio on part of speech having settled.
- [ ] 2.4 Keep the Prefill spinner and the final toast, both tied to the last
  step settling. Keep the session cache behaviour and Force prefill's cache
  bypass unchanged.
- [ ] 2.5 Fix or contain whatever 2.1 found, so that one failing lookup costs
  only its own field.

## 5. Examples append (item 5 — X01–X04, design D3)

- [ ] 5.1 `PREFILL_STEPS.examples`: without `force`, do not skip a non-empty
  field. Append the N × M grid's sentences that the note does not already
  hold, using the loose comparison in D3.
- [ ] 5.2 Count the field as filled, and set its provenance, only when at
  least one row was added. With `force`, replace as today.
- [ ] 5.3 Unit-test the loose comparison helper if the UI has a test seam for
  it; otherwise cover it through the acceptance criteria.
