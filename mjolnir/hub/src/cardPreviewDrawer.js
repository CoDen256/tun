// card-preview-popup task group 4 ("Tools drawer") — pure logic.
//
// Mirrors the split cardPreviewEngine.js (task 3) and cardRenderer.js
// (task 2) already established: everything in this file is a plain
// function of data, free of any DOM/BOM reference and of any import, so
// Node (this package's tests) and the browser (as a `<script
// type="module">` served verbatim at the read-only static route
// `/mjolnir/cards/drawer-engine.js`, mirroring render-engine.js/
// popup-engine.js) run the EXACT SAME code. `hub/src/cardPreviewPopup.js`
// imports it with a normal ESM `import` and wires it to the DOM; it does
// not re-implement any of this a second time.
//
// Covers: drawer resize clamping (4.1), the HTML editors' snippet-wrap/
// reset/edited-state/copy logic (4.2), a small regex-based HTML syntax
// highlighter for those editors (4.2, tier-2 — see this file's own note
// below), the Classes & tags catalogue's row-building (4.3), the Symbols
// table's row-building (4.4), and the shared click/Enter-to-copy string
// formatting (4.5).

// --------------------------------------------------------------------------
// 4.1 Drawer resize clamping
// --------------------------------------------------------------------------
// design.md §4 / acceptance C23: desktop width 320px…75% of the dialog;
// bottom-sheet height 160px…85% of the dialog/body.

export const DRAWER_WIDTH_MIN = 320;
export const DRAWER_WIDTH_MAX_FRACTION = 0.75;
export const DRAWER_HEIGHT_MIN = 160;
export const DRAWER_HEIGHT_MAX_FRACTION = 0.85;

export function clampDrawerWidth(width, dialogWidth) {
  const max = Math.max(DRAWER_WIDTH_MIN, dialogWidth * DRAWER_WIDTH_MAX_FRACTION);
  return Math.round(Math.min(max, Math.max(DRAWER_WIDTH_MIN, width)));
}

export function clampDrawerHeight(height, bodyHeight) {
  const max = Math.max(DRAWER_HEIGHT_MIN, bodyHeight * DRAWER_HEIGHT_MAX_FRACTION);
  return Math.round(Math.min(max, Math.max(DRAWER_HEIGHT_MIN, height)));
}

// The breakpoint the drawer switches from a right-side panel (desktop) to
// a bottom sheet (design.md §4 "below ~760px window width").
export const DRAWER_SHEET_BREAKPOINT = 760;

export function isSheetLayout(windowWidth) {
  return windowWidth < DRAWER_SHEET_BREAKPOINT;
}

// Arrow-key step size for the resize handle when focused (design.md §4
// "arrow keys too"). A plain constant, not a magic number repeated at each
// call site.
export const DRAWER_ARROW_STEP = 24;

// Default drawer state task group 6 (operator settings) will eventually
// read/write server-side; this task group only needs one place both this
// file's tests and cardPreviewPopup.js's client script agree on for "what
// does the drawer look like before any operator has ever touched it or
// before settings load" (design.md §4 "closed by default").
export function defaultDrawerState() {
  return { open: false, width: 520, height: 0, tab: "edit" };
}

// --------------------------------------------------------------------------
// 4.2 Snippet palette: wrap the selection, or insert at the cursor
// --------------------------------------------------------------------------
// acceptance C25: "Selecting `regner` and clicking `.teal` produces
// `<span class="teal">regner</span>`." Pure string/offset math so both a
// real `<textarea>`/contenteditable selection and a Node test can drive it
// without any DOM.

export function wrapSelectionOrInsert(value, selectionStart, selectionEnd, open, close) {
  const start = Math.max(0, Math.min(selectionStart, value.length));
  const end = Math.max(start, Math.min(selectionEnd, value.length));
  const selected = value.slice(start, end);
  const before = value.slice(0, start);
  const after = value.slice(end);
  if (selected.length) {
    const next = before + open + selected + close + after;
    return { value: next, selectionStart: start, selectionEnd: start + open.length + selected.length + close.length };
  }
  const next = before + open + close + after;
  const cursor = start + open.length;
  return { value: next, selectionStart: cursor, selectionEnd: cursor };
}

// The snippet palette itself (tags, classes, colour swatches) — design.md
// §4 "a snippet palette (tags, classes, colour swatches)". `swatch` is the
// fixed hex for a colour class (design.md §2's frozen list), present only
// where the palette shows a colour chip.
export const SNIPPET_PALETTE = [
  { label: "<b>", open: '<b class="bold">', close: "</b>" },
  { label: "<br>", open: "<br>", close: "" },
  { label: "<p>", open: "<p>", close: "</p>" },
  { label: "div.center", open: '<div class="center">', close: "</div>" },
  { label: "div.left", open: '<div class="left">', close: "</div>" },
  { label: ".italic", open: '<span class="italic">', close: "</span>" },
  { label: ".boldItalic", open: '<b class="boldItalic">', close: "</b>" },
  { label: ".underline", open: '<span class="underline">', close: "</span>" },
  { label: ".lg", open: '<span class="lg">', close: "</span>" },
  { label: ".arialFont", open: '<span class="arialFont">', close: "</span>" },
  { label: ".arialFontNormal", open: '<span class="arialFontNormal">', close: "</span>" },
  { label: "supWrap", open: '<div class="arialFont supWrap">', close: '<div class="sup">j</div></div>' },
  { label: ".green", open: '<span class="green">', close: "</span>", swatch: "#5DD8D0" },
  { label: ".red", open: '<span class="red">', close: "</span>", swatch: "#FF0000" },
  { label: ".teal", open: '<span class="teal">', close: "</span>", swatch: "#00A4BF" },
  { label: ".dodgerBlue", open: '<span class="dodgerBlue">', close: "</span>", swatch: "#0080ff" },
  { label: ".royalRed", open: '<span class="royalRed">', close: "</span>", swatch: "#cc0066" },
  { label: ".blueViolet", open: '<span class="blueViolet">', close: "</span>", swatch: "#8030cf" },
  { label: ".burntOrange", open: '<span class="burntOrange">', close: "</span>", swatch: "#ff7733" },
];

// --------------------------------------------------------------------------
// 4.2 Edited / reset state
// --------------------------------------------------------------------------
// `original` is the minted/stored { N, E, X }; `edits` is whatever subset
// of N/E/X the operator has typed into an editor this session (or
// undefined/empty — never persisted, acceptance C26). The `edited
// (throwaway)` chip (design.md §4) lights up the instant any face's
// current text differs from its original, and goes dark again the instant
// Reset restores it.

export function isEdited(original, edits) {
  if (!edits) return false;
  const faces = ["N", "E", "X"];
  return faces.some((f) => edits[f] != null && edits[f] !== (original ? original[f] || "" : ""));
}

// What an editor should currently show for one face: the edit if present,
// else the original/minted content (never null/undefined, an editor
// always has *some* string to show).
export function currentFaceHtml(original, edits, face) {
  if (edits && edits[face] != null) return edits[face];
  return (original && original[face]) || "";
}

// --------------------------------------------------------------------------
// 4.2 Copy HTML / Copy all
// --------------------------------------------------------------------------

export function copyAllFacesText(faces) {
  // design.md §4 "Copy all"; acceptance C25 "Copy all puts all three [on
  // the clipboard]" — labelled per face so pasting the result elsewhere is
  // still legible about which block is which.
  return ["N", "E", "X"]
    .map((f) => `<!-- ${f} -->\n${faces && faces[f] != null ? faces[f] : ""}`)
    .join("\n\n");
}

// --------------------------------------------------------------------------
// 4.2 Editor slot labelling — "labelled by the slot it CURRENTLY occupies
// given the active direction, not fixed N/E/X labels" (design.md §4).
// Reuses task 3's directionSlots() shape ({top,mid,bottom}); this just
// turns that into a face -> human slot label map for the editor headers.
// --------------------------------------------------------------------------

const SLOT_LABEL = { top: "top face", mid: "middle face", bottom: "bottom face" };

export function editorSlotLabel(directionSlots, face) {
  for (const key of ["top", "mid", "bottom"]) {
    if (directionSlots[key] === face) return SLOT_LABEL[key];
  }
  return "";
}

// --------------------------------------------------------------------------
// 4.2 Syntax highlighting — tier-2 decision.
// --------------------------------------------------------------------------
// No editor-highlighting library exists anywhere in this monorepo
// (checked: no `codemirror`/`prismjs`/`highlight.js`/`ace-builds` in any
// package.json, and hub/src ships plain JS files directly with no bundler
// — CLAUDE.md's "don't introduce a bundler/build step"). The locked
// mockup uses CodeMirror 5 from a CDN, which this repo cannot do (no
// internet dependency at runtime, no vendoring step). Design.md explicitly
// defers "the editor library, provided highlighting, wrapping and
// auto-grow behave as in the mockup" as tier 2, so: a plain
// `contenteditable` div IS the editor (gets real line-wrapping and
// auto-grow for free, no textarea-resize math needed), and highlighting is
// a small regex tokenizer run over its text on every input, re-rendering
// the DOM as spans coloured per token kind (tag/attribute/string) — the
// classic "poor man's CodeMirror" technique, with no new dependency and no
// build step. This function is the pure half of that: text in, a token
// list out; cardPreviewPopup.js's client script turns tokens into spans
// and manages the contenteditable + cursor restore.

const HTML_TOKEN_RE = /(<\/?[a-zA-Z][\w-]*)|(\s[a-zA-Z-]+(?==))|("[^"]*"|'[^']*')|(>)|(<br\s*\/?>)/g;

export function highlightHtmlTokens(html) {
  const text = String(html == null ? "" : html);
  const tokens = [];
  let lastIndex = 0;
  const re = new RegExp(HTML_TOKEN_RE);
  let m;
  while ((m = re.exec(text))) {
    if (m.index > lastIndex) tokens.push({ kind: "text", text: text.slice(lastIndex, m.index) });
    if (m[1]) tokens.push({ kind: "tag", text: m[1] });
    else if (m[2]) tokens.push({ kind: "attr", text: m[2] });
    else if (m[3]) tokens.push({ kind: "string", text: m[3] });
    else if (m[4]) tokens.push({ kind: "bracket", text: m[4] });
    lastIndex = re.lastIndex;
  }
  if (lastIndex < text.length) tokens.push({ kind: "text", text: text.slice(lastIndex) });
  return tokens;
}

// --------------------------------------------------------------------------
// 4.3 / 4.4 / 4.5 Click/Enter-to-copy string formatting
// --------------------------------------------------------------------------
// design.md §4 / acceptance C28 originally specified class -> `class="name"`;
// live operator feedback after archive changed this to the bare class name
// (pasting straight into an existing `class="..."` attribute was the actual
// use case, and the wrapper just had to be retyped around it every time).
// tag -> `<x></x>` (`<br>` is the one exception — never `<br></br>`), class
// -> `name` (no `class="..."` wrapper), a symbol's entity -> the entity text
// itself, a literal character -> the literal character. Metric rows are
// never copyable (callers simply never attach copy text to one — see
// buildClassesAndTagsRows below, which omits `copyText` entirely for those
// rows).

export function tagCopyText(tagName) {
  if (tagName === "br") return "<br>";
  return `<${tagName}></${tagName}>`;
}

export function classCopyText(className) {
  return className;
}

export function symbolCopyText(row) {
  // `row.group === 'norwegian'|'ipa'` rows from extractCardSymbols.js are
  // always numeric-entity rows in THIS catalogue's data (the extractor
  // counts literal characters too, but the Symbols tab always shows the
  // `&#NNN;` entity form for them per the mockup/design — literal-character
  // copy only applies to the handful of UI rows that explicitly mark
  // themselves literal, e.g. å/ø/æ in the mockup's own "Literal characters"
  // group). Callers pass `literal: true` for those.
  if (row && row.literal) return String.fromCodePoint(row.codepoint);
  return `&#${row.codepoint};`;
}

// --------------------------------------------------------------------------
// 4.3 Classes & tags catalogue
// --------------------------------------------------------------------------
// Builds the EXACT rows the mockup's table shows (Selector / Resolves to /
// Sample — no Kind column, grouped tags / line metrics / classes) but
// driven entirely from the real extractor output (`style` —
// extractCardStyle.js's return shape) and the real usage counts
// (`usage` — extractCardUsageCounts.js's return shape), never a
// hand-typed duplicate of either. `state` is the popup's current
// {width,height,tablet,theme,fontSize} (task 3's own state shape) so
// "Resolves to" always reflects what's on screen right now (acceptance
// C27 "changing font size or device updates the Resolves to sizes").
//
// Each row is { group, selector, kind: 'tag'|'metric'|'class', resolvesTo
// (plain text description), flags: ['undefined'|'font dropped'|'inferred'],
// usage (number|null), sampleHtml (a small HTML snippet to render through
// the real renderer), copyText (string|null — null for a row that is never
// copyable, i.e. every metric row) }.

// Deliberately NOT a static `import` of cardRenderer.js: this file is
// served verbatim to the browser at /mjolnir/cards/drawer-engine.js
// (mirroring render-engine.js/popup-engine.js), and a static ESM import
// resolves relative to THAT url, not this file's path on disk — it would
// 404 looking for /mjolnir/cards/cardRenderer.js, a route that doesn't
// exist (cardRenderer.js is served under the different URL
// /mjolnir/cards/render-engine.js). Every function below that needs
// normalize() takes it as a parameter instead, supplied by whichever
// caller already has it (cardPreviewPopup.js's client script, which loads
// render-engine.js itself via a dynamic `import()` of its OWN absolute
// URL — the same reason task 3's popup-engine.js never imports
// render-engine.js either).

function fmtPx(value, state, normalizeFn) {
  return `${normalizeFn(value, state.width, state.height, state.tablet)}px (normalize(${value}))`;
}

function fmtColor(styleEntry, theme) {
  if (!styleEntry) return null;
  // Fixed colour classes have a plain `color`; theme-dependent ones carry
  // `colorToken`/`colorByTheme` (extractCardStyle.js's finalizeStyle shape).
  if (styleEntry.color !== undefined) return { text: styleEntry.color, themeDependent: false };
  if (styleEntry.colorToken) {
    const by = styleEntry.colorByTheme || {};
    return {
      text: `${by.light ?? "?"} → ${by.dark ?? "?"}`,
      themeDependent: true,
      current: theme === "light" ? by.light : by.dark,
    };
  }
  return null;
}

function styleFontPart(styleEntry) {
  if (!styleEntry) return null;
  if (styleEntry.fontFamily) return `${styleEntry.fontFamily}.ttf`;
  if (styleEntry.fontDropped) return `${styleEntry.droppedFontFamily || "font"} dropped`;
  return null;
}

// Describes one tag's or class's resolved style as the "Resolves to"
// column's plain text (generic over whatever properties
// extractCardStyle.js resolved — never a hard-coded per-name switch, same
// spirit as cardRenderer.js's styleObjToCss).
function describeStyleEntry(styleEntry, state, normalizeFn) {
  if (!styleEntry) return { text: "", flags: [] };
  const parts = [];
  const flags = [];
  const font = styleFontPart(styleEntry);
  if (font) parts.push(font);
  if (styleEntry.fontDropped) flags.push("font dropped");
  if (typeof styleEntry.fontSize === "number") parts.push(fmtPx(styleEntry.fontSize, state, normalizeFn));
  const color = fmtColor(styleEntry, state.theme);
  if (color) parts.push(color.text);
  if (styleEntry.textAlign) parts.push(`textAlign ${styleEntry.textAlign}`);
  if (styleEntry["flex-direction"] || styleEntry.flexDirection) parts.push("flex row");
  if (styleEntry.alignItems) parts.push(`alignItems ${styleEntry.alignItems}`);
  if (styleEntry.justifyContent) parts.push(`justifyContent ${styleEntry.justifyContent}`);
  if (typeof styleEntry.marginHorizontal === "number") parts.push(`marginH ${fmtPx(styleEntry.marginHorizontal, state, normalizeFn)}`);
  if (typeof styleEntry.marginTop === "number") parts.push(`marginTop ${fmtPx(styleEntry.marginTop, state, normalizeFn)}`);
  if (typeof styleEntry.marginBottom === "number") parts.push(`marginBottom ${fmtPx(styleEntry.marginBottom, state, normalizeFn)}`);
  if (typeof styleEntry.width === "number") parts.push(`width ${fmtPx(styleEntry.width, state, normalizeFn)}`);
  if (styleEntry.textDecorationLine) parts.push(`textDecorationLine ${styleEntry.textDecorationLine}`);
  return { text: parts.join(" · "), flags };
}

// Sample markup for each row — illustrative demo content (the same role
// the locked mockup's own `catRows()` third element plays), always run
// through the REAL renderer by the caller, never a hand-drawn swatch
// (design.md §4 "samples drawn by the same renderer... so colours, fonts
// and sizes are visibly real"). Kept here, next to the row list, so the
// Selector/Sample pairing can't drift apart.
const TAG_SAMPLES = {
  div: "<div>Plain div text Øå</div>",
  b: '<div>a <b>bold</b> b</div>',
  i: "<div><i>italic</i></div>",
  p: "<div><p>Paragraph one</p>then text</div>",
  a: "<div><a>link</a></div>",
  span: "<div><span>span</span></div>",
  br: "<div>line<br></div>",
};

const CLASS_SAMPLES = {
  center: '<div class="center">Centred, regular</div>',
  left: '<div class="center"><div class="left">Left inside center</div></div>',
  lg: '<div><span class="lg">skrive</span></div>',
  arialFont: '<div><span class="arialFont">&#642;&#231;</span></div>',
  arialFontNormal: '<div><span class="arialFontNormal"> k </span></div>',
  italic: '<div><span class="italic">mostly</span></div>',
  boldItalic: '<div><b class="boldItalic">en mann</b></div>',
  underline: '<div><span class="underline">under</span></div>',
  green: '<div><b class="bold green">short</b> <span class="green">green</span></div>',
  blue: '<div><span class="blue">blue</span></div>',
  darkBlue: '<div><span class="darkBlue">darkBlue</span></div>',
  red: '<div><span class="red">Det</span> regner</div>',
  teal: '<div><span class="teal">regner</span></div>',
  dodgerBlue: '<div><span class="dodgerBlue">tone 1</span></div>',
  royalRed: '<div><span class="royalRed">tone 2</span></div>',
  blueViolet: '<div><span class="blueViolet">ikke</span></div>',
  burntOrange: '<div><span class="burntOrange">den</span></div>',
  supWrap: '<div class="center"><div class="arialFont supWrap">k<div class="sup">j</div>(:)</div></div>',
  sup: '<div class="arialFont supWrap">k<div class="sup">j</div></div>',
  flex: '<div class="center flex"><div class="left">Row child that is long enough to wrap</div></div>',
  width: '<div><div class="width">100 normalized</div></div>',
  tipOfTheDay: '<div class="tipOfTheDay">tip</div>',
  bold: "<div><span class=\"bold\">span.bold</span> vs <b>b</b></div>",
};

const TAG_ORDER = ["div", "b", "i", "p", "a", "br"];

export function buildClassesAndTagsRows(style, usage, state, normalizeFn) {
  const rows = [];
  const usageTags = (usage && usage.tags) || {};
  const usageClasses = (usage && usage.classes) || {};

  rows.push({ group: "Tags (tagsStyles, Android)" });
  for (const tag of TAG_ORDER) {
    if (tag === "br") {
      rows.push({
        group: null,
        selector: "br",
        kind: "tag",
        resolvesTo: 'every <br> is a line break ("\\n"), a trailing one adds an empty line',
        flags: [],
        usage: usageTags.br ?? 0,
        sampleHtml: TAG_SAMPLES.br,
        copyText: tagCopyText("br"),
      });
      continue;
    }
    const entry = style.tags[tag];
    if (!entry) continue;
    const described = describeStyleEntry(entry, state, normalizeFn);
    rows.push({
      group: null,
      selector: tag,
      kind: "tag",
      resolvesTo: described.text,
      flags: described.flags,
      usage: usageTags[tag] ?? 0,
      sampleHtml: TAG_SAMPLES[tag] || `<div><${tag}>${tag}</${tag}></div>`,
      copyText: tagCopyText(tag),
    });
  }

  rows.push({ group: "Line metrics" });
  rows.push({
    group: null,
    selector: "Poppins line",
    kind: "metric",
    resolvesTo: "≈ 1.4 em per line",
    flags: ["inferred"],
    usage: null,
    sampleHtml: null,
    copyText: null,
  });
  rows.push({
    group: null,
    selector: "Arial line",
    kind: "metric",
    resolvesTo: "≈ 1.12 em per line",
    flags: ["inferred"],
    usage: null,
    sampleHtml: null,
    copyText: null,
  });

  rows.push({ group: "Classes (classesStyles)" });
  const classNames = Object.keys(style.classes).sort((a, b) => a.localeCompare(b));
  for (const name of classNames) {
    const entry = style.classes[name];
    const described = describeStyleEntry(entry, state, normalizeFn);
    rows.push({
      group: null,
      selector: "." + name,
      kind: "class",
      resolvesTo: described.text,
      flags: described.flags,
      usage: usageClasses[name] ?? 0,
      sampleHtml: CLASS_SAMPLES[name] || `<div><span class="${name}">${name}</span></div>`,
      copyText: classCopyText(name),
    });
  }
  // `.bold` deliberately has no classesStyles entry — design.md §4 /
  // acceptance C27 "`.bold` is flagged undefined" — it still belongs in
  // the catalogue because stock cards use it 1,459× (real usage count),
  // just with no resolved style and the `undefined` flag instead of a
  // `fontDropped`/`inferred` one.
  if (!("bold" in style.classes)) {
    rows.push({
      group: null,
      selector: ".bold",
      kind: "class",
      resolvesTo: 'no effect — styled purely by the <b> tag',
      flags: ["undefined"],
      usage: usageClasses.bold ?? 0,
      sampleHtml: CLASS_SAMPLES.bold,
      copyText: classCopyText("bold"),
    });
  }

  return rows;
}

// --------------------------------------------------------------------------
// 4.4 Symbols table
// --------------------------------------------------------------------------
// Columns Entity · Glyph · Name · Poppins · Arial · Uses (design.md §4).
// `symbols` is extractCardSymbols.js's `{ norwegian, ipa }` return shape.
// The Poppins/Arial columns are not computed here — they render the same
// glyph in each font-family and let the browser's own font fallback make
// a dropped glyph visible (a tofu box or a visibly different shape),
// exactly like the locked mockup's g-pop/g-ari cells; this function only
// supplies the row data (entity text, glyph, name, counts, copy text).

export function buildSymbolsRows(symbols) {
  const rows = [];
  const norwegian = (symbols && symbols.norwegian) || [];
  const ipa = (symbols && symbols.ipa) || [];

  if (norwegian.length) {
    rows.push({ group: "Norwegian letters" });
    for (const s of norwegian) {
      rows.push({
        group: null,
        entity: s.entity,
        glyph: s.glyph,
        name: s.name,
        uses: s.occurrences,
        // The mockup's own convention this catalogue matches: Norwegian
        // letters are shown — and copied — as the literal character, not
        // the numeric entity, since that is how an operator would type
        // one into the editor.
        copyText: symbolCopyText({ codepoint: s.codepoint, literal: true }),
      });
    }
  }

  if (ipa.length) {
    rows.push({ group: "IPA, written as numeric entities" });
    for (const s of ipa) {
      rows.push({
        group: null,
        entity: s.entity,
        glyph: s.glyph,
        name: s.name,
        uses: s.occurrences,
        copyText: symbolCopyText({ codepoint: s.codepoint, literal: false }),
      });
    }
  }

  return rows;
}
