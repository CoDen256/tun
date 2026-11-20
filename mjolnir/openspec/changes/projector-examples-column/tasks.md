# Tasks — projector-examples-column

## 1. Projector (C01–C04)

- [ ] 1.1 `builder/src/projector.js`: build word and expression X from `note.examples` per design D1, with no `context_text` read and no fallback (D2). Verify: new unit tests for the four `builder-pipeline` scenarios pass.
- [ ] 1.2 Move every builder fixture and test from `context_text` to `examples`. Verify: `grep -rn context_text mjolnir/builder` returns nothing, and the full builder test suite passes.

## 2. Integration (C05)

- [ ] 2.1 Against dev compose with stabbur's `stabbur-editor-redesign` migrated, run a forecast. For a note with two examples, the card's X shows both, separated by a line break, in the hub's card preview. Verify C05.

## Workflow follow-up

- Deploy in the same rollout as stabbur's `stabbur-editor-redesign`, with stabbur first (that change's design D6).
