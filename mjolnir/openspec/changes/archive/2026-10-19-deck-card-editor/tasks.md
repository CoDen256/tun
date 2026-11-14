## 1. Data model

- [x] 1.1 Implement `src/deckData.js`: given a bundle's explode manifest, locate the deck-catalog module (data-classified, elements have `Cards`) and card-content module (data-classified, elements have `DECK_ID`) by scanning their parsed array literals' element shape.
- [x] 1.2 Parse both modules' array literals into plain JS objects (decks, cards), and implement category derivation (`deck.Name[0]`).
- [x] 1.3 Implement referential-integrity validation: every `deck.Cards[].Card` (minus trailing direction letter) resolves to a `card.ID`; every `card.DECK_ID` resolves to a `deck.Name`.
- [x] 1.4 Implement new-card id generation: `<deckName>` + next unused zero-padded 3-digit sequence among that deck's existing card ids.
- [x] 1.5 Unit tests: locate the pair correctly against the demo bundle extended with a small deck/card fixture (or a dedicated fixture); validation catches an injected orphan reference in each direction; id generation picks the correct next sequence number, including when sequence numbers aren't contiguous.

## 2. Save path

- [x] 2.1 Implement regeneration of both array literals from the in-memory model back to AST (via `@babel/types` builders) and splicing each into its module's factory body (the single `module.exports = [...]`-shaped statement), reusing the byte-offset approach from `logic-patch-back`.
- [x] 2.2 Implement the automatic backup-before-save: copy the current on-disk bundle to `<bundle>.bak` before writing, overwriting any prior backup.
- [x] 2.3 Call `reassembleBundle` with both regenerated modules as patches; write the result over the original bundle path.
- [x] 2.4 Wire validation (1.3) to run before any save and reject with a clear error on failure, writing nothing.
- [x] 2.5 Tests: saving with no edits is byte-identical to the original bundle for every module except possibly whitespace/formatting differences in the two regenerated data modules (document if exact byte-identity isn't expected here, since the output is `@babel/generator` formatted, not copied verbatim, even with zero logical changes); saving with one new card leaves every other module byte-identical; a save that would break referential integrity is rejected and the bundle file is left untouched.

## 3. HTTP API

- [x] 3.1 Implement `src/commands/ui.js`: a Node `http` server bound to `127.0.0.1` exposing endpoints to list decks/cards (grouped by category), fetch a single deck or card, create/edit/delete a card, create/edit a deck.
- [x] 3.2 Wire `ui <bundle>` into `bin/bundle-tool.js`, printing the local URL on startup.
- [x] 3.3 Tests: API-level tests (no browser) exercising create/edit/delete for a card and confirming the resulting saved bundle reflects the change when re-parsed.

## 4. Frontend

- [x] 4.1 Build the static HTML/CSS/vanilla-JS frontend (no build step, no framework): category list → deck list → card list → card editor panel.
- [x] 4.2 Card editor: text areas for `N`/`E`/`D`/`X`/`A` fields, with a live-updating rendered HTML preview alongside `N`/`E`/`X`.
- [x] 4.3 New-card flow: prefill `N`/`E`/`X` with the structural HTML skeleton; new-deck flow: form for deck metadata fields.
- [x] 4.4 Save button triggers the save API call and surfaces validation errors (e.g. orphan reference) inline rather than silently failing.

## 5. Manual verification walkthrough

- [x] 5.1 Run `bundle-tool ui index.android.bundle`, open the printed URL, confirm all 4 categories and 37 decks appear with the correct card counts.
- [x] 5.2 Open an existing card, confirm its `N`/`E`/`X` fields show both the raw HTML and a correctly rendered preview matching what the HTML describes.
- [x] 5.3 Create a new card in an existing deck, confirm its id follows the `<deckName><next sequence>` pattern and its `N`/`E`/`X` fields start with the prefilled skeleton.
- [x] 5.4 Save, and confirm: a `.bak` file was created with the pre-save bundle's contents; the new card appears in `2113` when re-parsed; the owning deck's `Cards[]` in `2111` gained exactly one `N`-direction reference for it; every other module is byte-identical to the backup.
- [x] 5.5 Attempt an edit that would orphan a reference (e.g. via direct API manipulation bypassing the UI's own safeguards) and confirm the save is rejected with a clear error and the bundle file is unchanged.
- [x] 5.6 Add a card to a dual-direction deck (e.g. `B01`) and confirm only an `N`-direction reference is added, not both `N` and `Y`.
