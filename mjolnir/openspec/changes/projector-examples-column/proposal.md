# Proposal — projector-examples-column

The mjolnir half of batch `stabbur-redesign`, package "Stabbur editor
redesign". It is paired with `stabbur/openspec/changes/stabbur-editor-redesign`.

## Why

stabbur replaces a note's newline-joined `context_text` with `examples`, a
list of separate sentences, and its read API now returns `examples: string[]`.
The builder's projector reads `context_text` to build the X face of word and
expression cards. Without this change it would read a field that no longer
exists and silently drop every card's examples.

The operator's instruction for this: *"real examples column, builder will join values of column, no trying to guess and replace"*.

## What Changes

- The projector builds the word and expression X face from `note.examples`,
  joined with `<br>` inside the same `<div class="left">` wrapper.
- An empty or absent list produces an empty X, as an empty context does
  today.
- `context_text` is no longer read anywhere in the builder, and nothing falls
  back to it. **BREAKING** against a stabbur that has not migrated, which is
  why the two changes deploy together, stabbur first.
- Test fixtures move from `context_text` to `examples`.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `builder-pipeline`: adds a requirement defining how a note's examples
  project onto the X face.

## Impact

- `mjolnir/builder/src/projector.js`
- the builder test fixtures and tests that name `context_text`:
  - `builder/test/fixtures/stabburNotes.js`
  - `pipeline*.test.js`
  - `deckConsolidationPipeline.test.js`
  - `pipelineAtomicity.test.js`
  - `liveStabbur.test.js`
- Not touched: the device plane, hub, the OTA contract, and the card face
  markup apart from the X face's contents.
