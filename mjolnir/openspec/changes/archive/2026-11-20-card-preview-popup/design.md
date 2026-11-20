# Design — card-preview-popup

Settled with the operator in the `/tun-design` session for batch
`full-sweep` (package **Card preview redo**), 2026-11-16 → 2026-11-17, over
six mockup iterations. **The accepted mockup is
`mockups/card-preview-popup.html` and the operator's instruction is that it
be implemented exactly as shown.** Where this document and the mockup
disagree, the mockup wins on look and interaction; this document wins on
data and on what is real vs sample.

The ground truth for every rendering rule is `research/render-research.md`
— an independent read of the stock bundle with byte offsets and module
numbers (renderer wrapper module 1441, study card module 2131; neither is
touched by any patch, so the patched APK renders cards exactly as stock).

## 1. What the mockup invents (do NOT implement as data)

The mockup's rows are sample data: the hub decks `L01`/`P01`, the 9xx
hub-minted ids, builds `b40`–`b43` and their dates, every occurrence state,
build id, countdown, note id and rule name. The card **HTML** in it is real
stock content. The build reads every one of these from hub's real tables
and real published bundle files.

Also mock-only assumptions, to be replaced by the builder's own choice
(tier 2, recorded in `DECISIONS-MADE.md`): the per-device pixel densities,
the status-bar inset (24) and bottom inset (0) used in the card-height
formula.

## 2. The renderer — the device's rules, not the browser's

The renderer is react-native-render-html v6 (≥ 6.3, inferred from an
export). It is called with `contentWidth`, `tagsStyles`, `classesStyles`,
`systemFonts`, `enableExperimentalMarginCollapsing: true`,
`defaultTextProps: { allowFontScaling: false }` — and no `baseStyle`,
`renderers` or `ignoredTags`; BR collapsing is off.

The browser emulation must reproduce, element by element:

| rule | device behaviour |
|---|---|
| cascade | built-in → `tagsStyles[tag]` → each class **in attribute order** → inline style |
| `<div>` | re-applies its tag style on every div: Poppins-Regular, `normalize(fontSize)`, `cardText`. An ancestor's class does NOT reach a nested div |
| alignment | left by default; `.center` → `textAlign:center` only; `.left` resets |
| font weight | each TTF is its own face: `b` → `Poppins-Bold` file, `.italic` → `Poppins-Italic`, `.boldItalic` → `Poppins-BoldItalic`. **No synthetic bold/italic** in the browser |
| dropped fonts | a `fontFamily` not in `systemFonts` is discarded by the renderer: `.center`'s and `.tipOfTheDay`'s SemiBold vanish. Derive the dropped set from the extracted `systemFonts`, never hard-code it |
| undefined classes | `.bold` (1,459 stock uses) and any class absent from `classesStyles` have no effect; unquoted attributes (`class=royalRed`) parse |
| `<br>` | every one is a line break, a trailing one adds an empty line |
| wrapping | text wraps within the face's content width; long words break; nothing overflows the face horizontally |
| `p` | margin-top 0, margin-bottom `normalize(6)` |
| `supWrap` / `flex` | flex rows (`supWrap`: align flex-start, justify center, margin-x `normalize(4)`; `flex`: align center) — never `<sup>` or `vertical-align` |
| line height | ≈1.4 em Poppins, ≈1.12 em Arial — **inferred**, labelled as such |

`normalize(x) = round-to-device-pixel(x × shortSide / 375 × (tablet ? 0.7 : 1))`.
Base font size defaults to 15 and is adjustable 10–22 (the app's own
in-session range).

Colours: light `cardText #16215B`, `headingAccent #246BFD`, screen
`#FFFFFF`, border `#DADFF2`; dark `cardText #FFF`, `headingAccent #3F8CFF`,
screen `#1B1D21`, border `#7C8296`. Fixed: `.green #5DD8D0`, `.red #FF0000`,
`.teal #00A4BF`, `.dodgerBlue #0080ff`, `.royalRed #cc0066`, `.blueViolet
#8030cf`, `.burntOrange #ff7733`. `.blue`/`.darkBlue` are frozen at module
load (theme at app start) — surfaced as a note in the catalogue.

**Every value above comes from the extractor's output at runtime.** The
hand-typed class CSS in today's `hub/src/cardPreview.js` is deleted, not
corrected — a corrected hand copy is the same defect waiting for the next
APK rebase. The extractor is widened to emit what the renderer needs: the
full tag and class maps (class list discovered, not a hard-coded list), both
themes by token, `systemFonts`, the base-size default and range, the card
geometry constants. It still fails loudly on a missing anchor.

## 3. The card — and only the card

The popup draws the study card alone: no status bar, header, counters or
answer buttons (operator removed them). On the theme's screen background,
with a small margin of it visible around the card:

- width `normalize(342)`, radius `normalize(20)`, border `normalize(1)`
  `borderColor`, **no background of its own**, `overflow: hidden`
- deck name on top, uppercase, `normalize(10.5)`/`normalize(16)`,
  `studyCardHeading`
- faces `0.29 Xe` (top, does **not** scroll, clips) · divider · `0.29 Xe`
  (middle, scrolls when long, centres when short) · divider · `0.40 Xe`
  (bottom = X, scrolls / centres); dividers 60% wide, `normalize(1)`,
  `borderColor`; text padding `normalize(16)` horizontally
- `Xe = max(normalize(260), screenH − insets − normalize(185))`
- centring never clips the top of overflowing content
- audio icon top-right of whichever face currently shows the card's `A` side
- the card scales up to fill the stage; an info line states device,
  normalize factor, card dp size, text width, resolved font size, the face
  carrying audio, and the display scale; a warning chip appears when the
  top face overflows ("the device clips it")

**Direction (N | E).** Occurrence letters are N, E and A. The device shows N
on top for direction N and E on top for direction E; the middle face gets
the other; X is always the bottom face. `A` is not a third layout — it is an
audio occurrence of whichever side the card's `A` field names. So the switch
offers N and E only; a card with an A occurrence shows a small `A → E` (or
`A → N`) note; the popup opens on the side of the card's first occurrence (A
resolved through the `A` field), or on the operator's saved default
(`first occurrence` / `N` / `E`).

Tapping the face that shows the `A` side plays the clip (minted cards with
the clip in the blob cache); any other face gives a brief "no audio on this
face"; a missing clip says so. No `<audio>` control is rendered.

## 4. The popup and its tools

One shared modal, not one per row. Backdrop dims the page; Esc, × and a
backdrop click close it. The bar carries: ← / card id / `3 / 137` / →, an
`edited (throwaway)` chip when edited, the occurrence summary
(`N · shipped in b42 | E · pending · 7 to go`), the direction switch and
`A →` note and default-direction picker, device (360×800, 375×812 ref,
412×915, 768×1024 tablet), Light/Dark, font stepper, Tools, ×.

←/→ (buttons and keys; ignored while typing in an editor or field) walk the
**filtered and sorted** list across page boundaries. On close, the table
moves to the page of the card last shown and highlights its row.

**Tools drawer** — closed by default, right side on wide screens, bottom
sheet below ~760 px, **resizable** by a handle (desktop 320 px … 75% of the
dialog; sheet 160 px … 85%; arrow keys too). The card refits live while
dragging; the size is remembered.

- **Edit HTML**: three syntax-highlighted editors (N, E, X) with line
  wrapping and auto-grow, each labelled with the slot it currently occupies
  and whether it carries audio; live re-render; Reset to minted card; Copy
  HTML per face; Copy all; a snippet palette (tags, classes, colour swatches)
  that **wraps the selection** or inserts at the cursor. Edits are throwaway
  — never persisted, never sent anywhere, gone on reload or Reset. **No
  warning banner** (operator removed it); the `edited (throwaway)` chip is
  the only indication.
- **Classes & tags**: Selector · Resolves to · Sample — **no Kind column**
  (section headers say tags / line metrics / classes). Values resolved at
  the current device, font size and theme; samples drawn by the same
  renderer on the theme's screen background so colours, fonts and sizes are
  visibly real; stock usage counts; `.bold` flagged undefined, `.center` /
  `.tipOfTheDay` flagged "font dropped", theme tokens shown light → dark,
  inferred values tagged "inferred". **Click (or Enter on) a row copies**:
  tag → `<b></b>` (`<br>` for br), class → `class="teal"`; metric rows copy
  nothing. A brief "Copied …" confirmation appears.
- **Symbols**: Entity · Glyph · Name · Poppins · Arial · Uses, counted from
  card content. Click copies the entity (`&#649;`, `&emsp;`) or, for
  literal characters, the character.

## 5. The Cards page

One flat table — no per-deck panels — with exactly these columns:

**Card · Deck · Front (N) · Back (E) · Occurrences · ↗**

- Front/Back: HTML stripped, one line, ellipsis, full text on hover.
- Deck: code only, full title on hover.
- ↗: the source-note link and, when the card has a grammar rule, a second
  muted ↗ for the rule; both open a new tab and never open the popup. Rows
  with neither are blank.
- Row click (or Enter) opens the popup.
- No per-row preview markup and no per-row style payload: the page carries
  the renderer data once.

**Source picker** (first control): `Minted (hub ledger)` · `Bundle b43 ·
current · <date>` · each other published build from `publications`, newest
first.

- *Minted*: every card in `card_slots`, with ledger state.
- *Bundle bNN*: exactly the cards that build's bundle contains, read from
  `data/ota/bundle/<buildId>.js` via the existing `loadDeckCardModel`
  reader (which locates the modules by shape). Its occurrence cells show
  which letters that bundle actually contains. Cards hub minted get a small
  accent dot before the id. A bundle file that cannot be read degrades the
  list with an explanation; it never throws out of the route.

**Occurrence cell** — the `builder-ship-strips` cell vocabulary, three fixed
16×21 slots in the order N · E · A so every row aligns:

| state | look |
|---|---|
| shipped | soft green fill |
| staged, flushes next run | solid warn fill |
| staged, held | dashed warn outline |
| pending | dotted faint outline |
| absent | faint box with a small dimmed `✕` |

Hover gives the detail (`E · pending · 7 to go`, `N · shipped in b42`,
`A · staged · held`, `E · no occurrence`). A one-line legend sits above the
table in Minted mode only. In Bundle mode every present cell is "shipped".
"Flushes vs held" is derived the way the builder decides it (its
multiple-of-5 flush rule over the deck's staged rows), not stored.

**Filters** (structured, no query language): search box with scope (all
text · N · E · X · card id · note id · raw HTML) · deck multi-select · per
letter N / E / A a state select (Minted: any · none · shipped · staged ·
pending · not shipped; Bundle: any · present · absent) · toggles *X empty*,
*has IPA*, *has grammar rule* (Minted), *audio clip missing* (Minted) · a
*uses class…* select listing the classes that occur. Minted-only controls
are hidden or disabled in Bundle mode, never shown broken; the note-id scope
and the minted / last shipped / pending sorts likewise.

Active filters show as plain `label ×` text after a `37 of 120 cards` count,
with *Clear all*.

**Sort**: card id · deck · minted · last shipped · pending remaining · front
text A–Z, with an asc/desc toggle; empty values always last.
**Pagination**: 25 / 50 / 100 per page, ‹ › and numbered pages with
ellipsis, `Showing 26–50 of 137`. **Saved views**: two presets, *Pending E
sides* and *Uses IPA*.

## 6. Operator settings — server-side

The operator chose server-side persistence over browser storage: one new
hub table of `key → JSON value` with an updated-at timestamp. One operator,
so no user column. It holds the Cards view (source, filters, sort, page
size, page) and the popup preferences (device, theme, font size, default
direction, drawer width/height, active tab, tools open). Loading the Cards
page restores them; changing any of them saves them. It lives in hub's own
database (mjolnir's), operator plane only; no device-plane path reads it.
A database outage degrades to defaults (D157), it does not break the page.

## 7. Consistency with `builder-ship-strips`

The occurrence cell must look the same here and on the ship strips: the
same state renders with the same fill, border and letter treatment on both
pages. How that is shared is the builder's call (tier 2), provided it is
one definition, not two copies that can drift.

This change corrects the extractor's output that `builder-ship-strips`
reads to render a card in its detail view (that change's task 3.11 names
"the extracted style map produced by `assembly-tab-usability`" — it is now
this change's corrected map). **This change builds first.**

## 8. Style isolation

The mockup hit three clashes between page CSS and the preview (a global
`.active` turning the active editor into a flex row, a global `.empty`
inflating the absent cell, a `display` rule overriding `[hidden]`). The
build must scope the card renderer, the editor and the occurrence cells so
page styles cannot reach them; acceptance criteria check the observable
results.

## Risks

- The extractor parses a minified bundle. Missing anchors must fail loudly;
  a silently-shrunk class map is the failure this package exists to undo.
- Line metrics and `.flex` overflow are inferred. The operator will verify
  against a phone screenshot after the build; a mismatch is a new backlog
  item, not a reason to block.
- Published bundles are files under the device plane's directory. They are
  only read. No byte of any device-facing response changes.
