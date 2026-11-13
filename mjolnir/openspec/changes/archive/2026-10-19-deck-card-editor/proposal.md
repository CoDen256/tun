## Why

Decks and cards live as two large, coupled array literals inside the bundle (module `2111`: 37 decks, module `2113`: 2790 cards, 4895 cross-references between them, confirmed zero orphans today). Both are classified `data` by `module-explode` and are explicitly skipped by the entire `module-deobfuscate`/`refactor-safety-check`/`logic-patch-back` pipeline, which only handles logic modules. Today the only way to add or edit a deck or card is hand-editing a pretty-printed multi-thousand-entry array literal and manually keeping two files' cross-references consistent — error-prone and, for module `2113` at 1MB, impractical. This is "Phase 2" of the original round-trip roadmap, which was deferred when `module-explode` shipped; it's now needed concretely.

## What Changes

- Add a `ui <bundle>` command that starts a local HTTP server (plain Node `http`, no new frontend framework dependency) serving a browser-based editor for decks and cards.
- The editor reads module `2111` (deck catalog) and module `2113` (card content) directly from the bundle — located by structural shape (an array whose elements have a `Cards` field = deck catalog; an array whose elements have a `DECK_ID` field = card content) among `data`-classified modules, not by hardcoded module id, so this survives a differently-numbered future export of the same app.
- Browse decks grouped by category (a deck's category is the first character of its `Name` field, e.g. `Z`/`A`/`B`/`C`), see each deck's cards, add/edit/remove cards and decks.
- A card editor exposes its HTML-bearing fields (`N`, `E`, `X`) as text areas with a live rendered HTML preview alongside each.
- A new card starts from a prefilled HTML skeleton (a fixed structural template matching the common `<div class="center">...</div>` / `<b class="bold">`/`<b class="bold green">` shape observed across existing cards) rather than an empty field.
- Creating a card generates its `ID` (`<deckName><next free 3-digit sequence>`) and appends both the card's content entry to `2113` and a single `{ Card: "<ID>N", P: "N" }` reference to the owning deck's `Cards[]` in `2111` (new cards always get the `N`-direction reference only, per explicit decision — existing dual-direction decks are not retrofitted automatically).
- Every save regenerates both modules' array literals and writes a new bundle via the existing byte-exact `reassembleBundle` primitive (every other module copied verbatim).
- Add a referential-integrity check (every `2111[].Cards[].Card` base id has a matching `2113[].ID`; every `2113[].DECK_ID` matches some `2111[].Name`) that runs before any save is accepted.

## Capabilities

### New Capabilities
- `deck-card-data-model`: locating, parsing, and validating the deck-catalog/card-content module pair's structure and cross-references.
- `deck-card-editor-ui`: the local web server and browser UI for browsing and editing decks and cards, including HTML preview and templated new-card creation.
- `deck-card-save`: generating new ids/references, regenerating the two modules' array literals, and reassembling a bundle with the edits applied.

### Modified Capabilities
(none — `module-explode`'s classification and `reassemble.js`'s byte-copy-and-splice primitive are reused as-is)

## Impact

- New files: `src/commands/ui.js` (server bootstrap + API routes), `src/deckData.js` (locate/parse/validate the deck-catalog/card-content pair, id generation), a static frontend (plain HTML/CSS/JS, no build step) under e.g. `src/ui-assets/`.
- Reused, unmodified: `src/parseBundle.js` (`loadIndex`, `readModuleSource`), `src/reassemble.js` (`reassembleBundle`), `module-explode`'s manifest/classification.
- No new runtime dependency beyond Node's built-in `http` module for the server; no frontend framework.
- Out of scope: editing logic modules from this UI (that's the existing `module-deobfuscate`/`logic-patch-back` pipeline), multi-user/concurrent editing, undo/version history beyond whatever the user's own file backups provide.
