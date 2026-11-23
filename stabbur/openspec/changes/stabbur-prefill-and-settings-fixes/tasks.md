# Tasks — stabbur-prefill-and-settings-fixes

Acceptance criteria are in `acceptance.md`. Each group names the criteria it
must turn green. The design decisions are in `design.md`.

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
