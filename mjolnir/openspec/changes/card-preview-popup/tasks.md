## 1. Extractor — the device's real rules, as data

- [ ] 1.1 Widen `tool/src/extractCardStyle.js` to emit the full tag map and the full class map as discovered in the bundle (no hard-coded class list), both themes by token, the renderer's `systemFonts`, the base font-size default (15) and range (10–22), and the card geometry constants (`0.29/0.29/0.40`, `342`, `20`, `185`, `260`, divider 60%, paddings) — each anchored on stable literals and failing loudly when missing
- [ ] 1.2 Emit, per class, whether its `fontFamily` survives `systemFonts` (so `.center`/`.tipOfTheDay` are marked "font dropped" from data, not by name)
- [ ] 1.3 Update the symbol extractor to count entities and literal characters across card content (the Symbols tab's Uses column)
- [ ] 1.4 Keep the output in a location another service in the monorepo can read (`builder-ship-strips` consumes it); a missing or unreadable output fails loudly, never falls back to invented values
- [ ] 1.5 Tests: extractor output contains `supWrap`, `sup`, `arialFont`, `arialFontNormal`, `flex`, every colour class; `.center` has no surviving font; `.bold` is absent; removing an anchor from a fixture throws

## 2. The renderer emulation

- [ ] 2.1 Delete the hand-typed class CSS in `hub/src/cardPreview.js`; drive every style from the extractor output
- [ ] 2.2 Implement the cascade per design §2: tag → classes in attribute order → inline; every `<div>` re-applies the div tag style; undefined classes inert; unquoted class attributes
- [ ] 2.3 Serve each Poppins TTF and `arial.ttf` as its own face with synthetic bold/italic disabled; map `b`/`.italic`/`.boldItalic` to their files; discard dropped families
- [ ] 2.4 `<br>` semantics (every one a line break, trailing included), wrapping within the face width, `p` margins, `supWrap`/`flex` as flex rows, inferred line heights
- [ ] 2.5 `normalize()` with the tablet factor and device-pixel rounding; base font 15, adjustable 10–22
- [ ] 2.6 Scope the renderer's output so page CSS cannot reach it (design §8)

## 3. The card and the popup

- [ ] 3.1 Draw only the card (no phone chrome) on the theme's screen background, geometry per design §3, no card background, deck name header, audio icon on the face showing the `A` side, scaled to fit, info line with the clip warning
- [ ] 3.2 Top face clips; middle and bottom scroll when long and centre when short without clipping the top
- [ ] 3.3 One shared modal: dimmed backdrop, Esc / × / backdrop close, bar controls per design §4
- [ ] 3.4 N | E direction switch, default from the first occurrence (A via the card's `A` field) or the saved default, `A → N|E` note, editors relabelled by slot
- [ ] 3.5 ←/→ stepping over the filtered + sorted list across pages (ignored while typing); on close jump to the card's page and highlight its row
- [ ] 3.6 Tap-to-play on the audio face (minted cards with the clip present), "no audio on this face" elsewhere, "unavailable" when the clip is missing; no `<audio>` control
- [ ] 3.7 Card content for a bundle source comes from that bundle; for Minted from `card_content`

## 4. Tools drawer

- [ ] 4.1 Drawer closed by default, right side / bottom sheet below ~760 px, resize handle (pointer + arrow keys) with the clamps from design §4, live card refit, size persisted
- [ ] 4.2 Edit HTML: three highlighted, wrapping, auto-growing editors; live render; Reset; Copy per face; Copy all; snippet palette wrapping the selection; `edited (throwaway)` chip; no banner; nothing persisted
- [ ] 4.3 Classes & tags: Selector · Resolves to · Sample (no Kind), grouped tags / line metrics / classes; values at current device/font/theme; samples through the renderer on the screen background; usage counts; undefined / font-dropped / inferred tags; light → dark token mapping
- [ ] 4.4 Symbols: Entity · Glyph · Name · Poppins · Arial · Uses
- [ ] 4.5 Click / Enter copies a row (tag `<x></x>`, `<br>`, `class="name"`, entity or literal character) with a brief confirmation; metric rows not copyable

## 5. The Cards page

- [ ] 5.1 Replace the per-deck panels and inline preview rows with one flat table: Card · Deck · Front · Back · Occurrences · ↗; one-line ellipsis with hover text; deck code with title on hover
- [ ] 5.2 Source picker: Minted, then every build in `publications` newest first, current marked; bundle source reads `data/ota/bundle/<buildId>.js` through `loadDeckCardModel` (read-only, cached per build), marks hub-minted ids; an unreadable bundle degrades the list with an explanation
- [ ] 5.3 Occurrence slots N·E·A in the ship-strip vocabulary incl. the absent ✕ box; flush-vs-held derived by the builder's multiple-of-5 rule; hover text; Minted-only legend; one shared definition with `builder-ship-strips` (design §7)
- [ ] 5.4 ↗ column: note link + muted rule link, new tab, never opens the popup
- [ ] 5.5 Filter bar per design §5, source-dependent controls hidden/disabled, removable filter labels, count, Clear all
- [ ] 5.6 Sort (six keys, asc/desc, empty last), pagination 25/50/100 with numbered pages, saved views *Pending E sides* and *Uses IPA*, Reset view
- [ ] 5.7 The page carries the renderer data once and no per-row preview markup

## 6. Operator settings

- [x] 6.1 Hub migration: a settings table (key, JSON value, updated-at), no user column
- [x] 6.2 Read on Cards page load, write on change (debounced), defaults on database outage (D157), stale values fall back to defaults
- [x] 6.3 Operator-plane only; confirm no device-plane route reads or writes it

## 7. Records

- [x] 7.1 Annotate the archived `2026-11-15-assembly-tab-usability/design.md` table in place with the corrections (faces, base size, card background, alignment, `.center`), pointing here
- [ ] 7.2 Tests for the cascade on the stock samples in `research/render-research.md` (`B01028`, `Z01001`, `B12007`, `C01004`, `C01001`, `B01047`)
