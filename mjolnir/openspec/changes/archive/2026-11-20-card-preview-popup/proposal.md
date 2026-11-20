# card-preview-popup

Batch `full-sweep`, package **Card preview redo** (D161 workflow,
`docs/15-agentic-workflow.md`). A redo of item 3 of the archived
`2026-11-15-assembly-tab-usability`, which shipped, passed its own 40
criteria, and was rejected live by the operator.

## Why

1. **The preview is wrong about the phone, not merely imprecise.** An
   independent read of the stock bundle (`research/render-research.md`, with
   byte offsets) found the archived change's foundations false:
   - `.center` was rendered semibold. On the device it asks for
     `Poppins-SemiBold`, which is not in the renderer's `systemFonts`, so
     react-native-render-html drops the property — `.center` only centres.
     This is the operator's "the words are bold, but they shouldn't be".
   - Text was centred by default. The device left-aligns; only `.center`
     centres.
   - The card was given a background (`#FAFAFA` / `#1B1D21`). The study card
     has none — the screen shows through.
   - Faces were `0.28 / 0.28 / 0.44`; the device uses `0.29 / 0.29 / 0.40`.
     Base font was 16; the device defaults to 15 and lets the user change it
     (10–22) per session.
   - Every class's CSS was typed by hand in `hub/src/cardPreview.js` despite
     the spec saying "extracted", and the class catalogue's samples rendered
     in black/white/grey — the operator saw no colours at all.
   - Nested `<div>`s inherited from their parent. On the device every `<div>`
     re-applies the `div` tag style, so an ancestor's class does not carry
     into a nested div. Every `<br>` (a trailing one included) is a line
     break. Long content wraps within the face.
2. **The Cards page row is too wide.** Front/Back wrap to several lines,
   the source-note link repeats the whole front text, and every row carries
   a hidden, fully-rendered inline preview plus its own copy of the style
   data — whether opened or not.
3. **The preview cannot be reached the way the operator works.** It expands
   inline under a row; the operator wants a popup over a dimmed page that
   can be stepped through.
4. **The list can only show minted cards.** The operator wants to see any
   published bundle's full card set (stock + hub), with the minted ledger's
   shipping state kept as its own view.

## What changes

- **Cards page**: one flat, paged table (Card · Deck · Front · Back ·
  Occurrences · ↗), one-line truncation, a **source picker** (Minted ledger
  or any published build), a structured filter bar with removable filter
  labels, sort, page size, two saved-view presets. Occurrences drawn in the
  `builder-ship-strips` cell vocabulary as three fixed N·E·A slots.
- **Popup preview**: clicking a row opens one shared modal over a dimmed
  page showing **only the card** (deck name, three faces, dividers, audio
  icon) on the theme's screen background, scaled to fit, with an N|E
  direction switch, device / theme / font-size controls, and ←/→ stepping
  through the filtered list across pages.
- **Renderer redone from the bundle's real rules** — tag styles, class
  styles in attribute order, the font-file-per-weight model with dropped
  fonts derived from `systemFonts`, the div re-application cascade, `<br>`
  semantics, wrapping, the real geometry.
- **Tools drawer** (closed by default, resizable): Edit HTML (highlighted,
  auto-growing editors, live render, Reset, Copy per face / all, snippet
  palette that wraps the selection), Classes & tags (coloured samples, click
  to copy), Symbols (click to copy).
- **Operator settings store** in hub's database: the list's filters, sort,
  page size, source and the popup's preferences persist server-side.

## Non-goals

- Anything on the device plane (`docs/11-ota-contract.md`). Published bundle
  files are **read**, never written; no route under `/ota/*`, `/blob/*`,
  `/audio-manifest/*` or `/mjolnir/userdata/*` changes.
- Persisting HTML edits. The editor stays throwaway.
- Unpublished/assembled logic bundles and the raw stock `base/` bundle as
  list sources — the operator chose published builds only.
- Emulating the study screen's chrome (header, counters, answer buttons).
  The operator removed it from the design.
- Changing what occurrence states *mean*. They are read from hub's existing
  ledger tables (`occurrence_shipments`, `pending_occurrences`,
  `staged_occurrences`).

## Impact

- `hub/` Cards route, its page renderer, the preview module and the style
  data it consumes; one new hub migration (operator settings).
- `tool/src/extractCardStyle.js` (and the symbol extractor): their output is
  corrected and widened. **`builder-ship-strips` consumes this output** for
  its detail-view card render (its task 3.11), so this change builds first.
- Supersedes the archived change's design table and several `card-preview`
  requirements; the archived `design.md` is annotated in place.
