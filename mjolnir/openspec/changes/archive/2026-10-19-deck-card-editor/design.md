## Context

Confirmed by directly parsing the real bundle's two data modules:

```
module 2111 (deck catalog, deps: [])              module 2113 (card content, deps: [])
[{ ID, Name: "A01", Code, Enabled,                 [{ DECK_ID: "A01", ID: "A01003",
   Title, Description,                                N: "<html question>",
   Counter1, Counter2,                                 E: "<html answer>",
   MaxInterval, AutoTickStreak,                         D: "<deck title, redundant>",
   AutoHammerCount,                                     X: "<html extra/example>",
   Cards: [ {Card:"A01003N", P:"N"},                    A: "X" }, ...2790 cards]
            {Card:"A01003Y", P:"Y"}, ... ] },
 ...37 decks]

category = Name[0]  →  { Z, A, B, C }  (4 categories today)
referential rule: every Cards[].Card (minus trailing P letter) must match some 2113[].ID
                  every 2113[].DECK_ID must match some 2111[].Name
today: 4895 deck→card references, 2790 unique cards, 0 orphans
```

Decks are not uniform: some (`A01`, 120 cards, all `P: "N"`) list every card once; others (`B01`, 120 refs over presumably 60 unique cards, 60/60 split) list each card twice, once per `P` direction (`N`/`Y`) — almost certainly a "front→back" vs "back→front" quiz-direction duplication. New cards created by this UI always get only the `N`-direction reference, by explicit decision — existing dual-direction decks are not automatically retrofitted when a card is added to them.

Both modules are `data`-classified by `module-explode` and are explicitly out of scope for `module-deobfuscate`/`refactor-safety-check`/`logic-patch-back`, which only ever touch `logic` modules. This change is a parallel, independent read/write path for exactly these two modules — it does not extend or modify the logic-module pipeline.

## Goals / Non-Goals

**Goals:**
- Make browsing and editing decks/cards tractable without hand-editing a 1MB generated file.
- Keep `2111`/`2113` referentially consistent on every save (no orphaned references, no dangling `DECK_ID`s) — validated before writing, not just hoped for.
- Give immediate visual feedback on a card's HTML fields, since they're meant to render as formatted quiz content, not be read as raw markup.
- Reuse the existing byte-exact reassembly primitive (`reassembleBundle`) rather than inventing a second bundle-writing mechanism.

**Non-Goals:**
- No general data-module editor — this is specifically the deck/card pair, located by structural shape, not a generic "edit any data module" tool.
- No retrofitting of existing dual-direction decks when a new card is added — new cards are always single-direction (`P: "N"`) per explicit decision; an existing deck's `N`/`Y` split is read-only for now.
- No concurrent/multi-user editing support — one local server, one browser tab, one bundle file at a time.
- No undo/version history inside the tool — the user's own backup/git discipline covers that; this change does not add one.
- No editing of logic modules from this UI.

## Decisions

**Locate the deck/card module pair by structural shape, not hardcoded module id.** Scan `data`-classified modules from the explode manifest; the deck catalog is the one whose array elements each have a `Cards` property, the card content is the one whose array elements each have a `DECK_ID` property. This is specific domain knowledge about this app's two data modules, but tying it to shape rather than a literal `2111`/`2113` id survives a future re-export of the same app renumbering modules.
- Alternative considered: hardcode module ids `2111`/`2113` as CLI defaults with an override flag. Rejected as needlessly fragile for near-zero extra cost — the shape check is cheap and unambiguous given only two data-classified modules in the bundle have `Cards`/`DECK_ID` fields respectively.

**Delivery: a local Node `http` server + static vanilla HTML/JS frontend, no framework.** Matches the project's existing zero-frontend-dependency posture (five total runtime dependencies today) and is the natural fit for live HTML preview — a card's `N`/`E`/`X` field renders directly into a sandboxed `<iframe srcdoc="...">` or an isolated container element, no templating engine needed since the content is already HTML strings.
- Alternative considered: a terminal UI. Rejected per explicit decision — rendering live HTML preview in a TUI is impractical; a browser is the only reasonable surface for "see the formatted card as it will appear."

**Save path: regenerate both array literals, always run referential-integrity validation first, write via `reassembleBundle`.** A save: (1) applies the pending edit to an in-memory model of both arrays, (2) validates every `Cards[].Card` base id resolves to a `2113[].ID` and every `2113[].DECK_ID` resolves to a `2111[].Name` — aborting the save with a clear error if not, (3) regenerates each array literal's AST and splices it into that module's factory body (same approach `logic-patch-back` uses for a single statement, applied here to the one `module.exports = [...]`-shaped statement each data module has), (4) calls `reassembleBundle` with both modules as patches, (5) writes the result. Both modules are always re-written together on any save that touches either, even if only one was logically edited, to keep the write path simple (no partial-pair writes to reason about).
- Alternative considered: track a diff and only rewrite the touched module. Rejected for this change — data modules are cheap to fully regenerate (no re-minification needed, see below), and always-rewrite-both avoids an entire class of "is the pair still consistent" bugs for comparatively little cost.

**No re-minification of data-module output.** Unlike logic modules (which get minified in `logic-patch-back` to stay close to original size/style), the regenerated `2111`/`2113` array literals are written as plain `@babel/generator` output (or even `JSON.stringify`-shaped object literals) — these are already large due to content volume, not minification, and there is no behavior to preserve stylistically; correctness and readability matter more than byte size here.

**New-card id generation: `<deckName><next free 3-digit sequence>`.** Scan existing `2113[].ID`s with the target deck's prefix, take the highest numeric suffix, increment, zero-pad to 3 digits (matching the `A01003`-style ids observed). Collision-checked against both `2113[].ID` and any in-flight unsaved edit in the same session.

**New-card HTML prefill: a fixed structural skeleton.** `<div class="center">...</div>` for the question/answer wrapper, with the `<b class="bold">`/`<b class="bold green">` highlight pattern available as a toolbar/snippet insert in the editor, rather than attempting to infer a per-deck template from existing content (decks vary enough — see `A01` vs `B01`'s different Counter2/field usage patterns — that a single inferred template per deck would need per-deck logic this change doesn't need to build).

## Risks / Trade-offs

- [Risk] Regenerating all 2790 card entries and 37 decks on every save could be slow enough to feel laggy in an interactive editor. → Mitigation: these are plain data literals (no scope analysis, no canonicalization, no minification) — expect this to be fast (sub-second) based on `module-explode`'s already-measured ~1s full-bundle explode time; revisit only if real usage shows otherwise.
- [Risk] A card referenced by multiple decks (if that ever occurs) could have ambiguous "owning deck" semantics when deleted. → Mitigation: not observed in the real data today (every card's `DECK_ID` uniquely identifies one owning deck); out of scope until it's an actual case.
- [Risk] Running an HTTP server, even locally, exposes an edit surface over `localhost` for as long as it's running. → Mitigation: bind to `127.0.0.1` only (never `0.0.0.0`), no auth needed for a single-user local tool; document that the server should not be exposed beyond localhost.
- [Risk] This duplicates some AST-splicing logic conceptually similar to `logic-patch-back`'s but for a different (whole-array-literal, not diffed-statement) shape. → Mitigation: accepted — the two have different enough correctness requirements (keyed/referential vs. structural-diff) that sharing code would likely mean a worse abstraction for both; `reassembleBundle` (the one genuinely shared primitive) is reused as-is.

## Migration Plan

N/A — purely additive new command (`ui`) and new modules; no changes to existing commands or their output.

**Save target: in-place with a one-deep automatic backup.** Saving overwrites the bundle the UI was opened against, matching "saved automatically in the correct place." Before the first write in a session (and before each subsequent save overwrites the previous backup), the server copies the current on-disk bundle to `<bundle>.bak`. This is the first command in the tool that can destructively overwrite a bundle file, so an automatic backup is required rather than relying solely on the user's own git/backup discipline — one level deep (not a history) is enough to recover from a bad edit without building a version-history feature this change doesn't need.

## Open Questions

(none outstanding)
