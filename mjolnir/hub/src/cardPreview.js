import { escapeHtml } from "./layout.js";
import { cardPreviewFontFaceCss } from "./cardPreviewStyle.js";
import { renderCardFace, cardRendererResetCss } from "./cardRenderer.js";

// assembly-tab-usability item 3 / card-preview-popup task group 2: "one
// card, three thirds — not three boxes." Every class/tag's color, size and
// font now comes from `renderCardFace()` (hub/src/cardRenderer.js), which
// in turn reads nothing but `getCardPreviewData()`'s extractor output — NO
// hand-typed CSS rule for a card class exists in this file any more (task
// 2.1). The CSS below is layout/chrome only (face geometry, scroll, the
// editor/catalogue UI) — never a color or font a `.center`/`.royalRed`/`.b`
// etc. resolves to; those are written inline, per element, by the renderer
// itself (see cardRenderer.js's "style isolation" section for why).
//
// Rendered inline under a card's own row in the Cards table, same
// expand/collapse-one-at-a-time shell as before (D109) — this file only
// replaces what goes *inside* that row. (A later task group replaces this
// whole row-accordion with the card-preview-popup's modal and a flat
// table — see design.md §5 — but that hasn't landed yet, so this keeps
// working, correctly, in the meantime.)

const MCR_SCOPE = "mcr-row";

export function cardPreviewStyleBlock(style) {
  return `
${style ? cardPreviewFontFaceCss(style) : ""}
${cardRendererResetCss(MCR_SCOPE)}
.cp-controls { display:flex; gap:18px; align-items:flex-end; flex-wrap:wrap; padding:10px 12px; border:1px solid var(--border); background:var(--bg-elevated); border-radius:8px; margin-bottom:14px; }
.cp-ctl { display:flex; flex-direction:column; gap:4px; }
.cp-ctl>span { font-size:10.5px; text-transform:uppercase; letter-spacing:.06em; color:var(--text-faint); font-weight:700; }
.cp-ctl select, .cp-ctl button { font-family:inherit; font-size:13px; padding:5px 9px; border-radius:4px; border:1px solid var(--border); background:var(--bg); color:var(--text); cursor:pointer; }
.cp-ctl button.on { background:var(--accent-soft); color:var(--accent-text); font-weight:600; }
.cp-scale { font-size:11.5px; color:var(--text-faint); font-family:var(--mono); }

.cp-root { padding:14px 4px 18px; }
.cp-stage { display:flex; gap:20px; align-items:flex-start; flex-wrap:wrap; }
.cp-device { flex: none; }

/* ${MCR_SCOPE}: the renderer's own scope class (card-preview-popup task
   2.6). Every typographic/color property a card's HTML resolves to is
   written inline by cardRenderer.js — this block only lays the three
   faces out and gives the card its border/background, none of which any
   page-level rule (an .active, an .empty, a [hidden] override) has a
   reason to target, since none of those class/attribute names are used
   anywhere under this scope. */
.cp-root .study-card {
  display:flex; flex-direction:column; align-items:center;
  overflow:hidden; position:relative; border-style:solid;
  border-color:var(--cp-borderColor);
}
.cp-root .third { width:100%; display:flex; position:relative; cursor:pointer; -webkit-tap-highlight-color:transparent; }
.cp-root .third.t-n { align-items:center; overflow:hidden; }
/* E/X start flex-start (top-aligned) so an overflowing face never gets
   its top pushed out of the scroll range before JS has measured it; once
   updateFaceAlignment() runs it switches this to 'center' whenever the
   face's content actually fits (acceptance #23), and leaves it
   'flex-start' when it overflows (acceptance #21/#22) -- see the client
   script below. The .touch child is never stretched to the third's full
   height (that is what makes align-items:center on the THIRD actually
   centre a short face instead of a no-op). */
.cp-root .third.t-e, .cp-root .third.t-x { overflow-y:auto; overflow-x:hidden; align-items:flex-start; }
.cp-root .third-divider { width:60%; align-self:center; flex:none; background:var(--cp-borderColor); }
.cp-root .touch { width:100%; display:flex; flex-direction:column; justify-content:center; }
.cp-root .third:hover .touch { background: rgba(127,127,127,.08); }
.cp-root .third.flash .touch { background: rgba(127,127,127,.22); transition: background .05s; }
.cp-root .play-pop { position:absolute; inset:0; display:flex; align-items:center; justify-content:center; pointer-events:none; opacity:0; }
.cp-root .play-pop.go { animation: cp-playpop .7s ease-out; }
@keyframes cp-playpop { 0%{opacity:0;transform:scale(.6)} 18%{opacity:1;transform:scale(1.05)} 65%{opacity:1;transform:scale(1)} 100%{opacity:0;transform:scale(1.5)} }
.cp-root .play-tri { width:40px; height:40px; border-radius:50%; background:rgba(127,127,127,.22); border:2px solid currentColor; display:flex; align-items:center; justify-content:center; }
.cp-root .play-tri::after { content:""; width:0; height:0; margin-left:3px; border-left:12px solid currentColor; border-top:8px solid transparent; border-bottom:8px solid transparent; }
.cp-root .toast { position:absolute; left:50%; bottom:8px; transform:translateX(-50%); background:rgba(0,0,0,.78); color:#fff; font-size:11px; padding:4px 10px; border-radius:11px; pointer-events:none; opacity:0; white-space:nowrap; font-family:system-ui,sans-serif; }
.cp-root .toast.go { animation: cp-toastfade 1.4s ease-out; }
@keyframes cp-toastfade { 0%{opacity:0} 12%{opacity:1} 72%{opacity:1} 100%{opacity:0} }

/* .face-body carries no color/font/size rule of its own any more (task
   2.1) — every element the renderer emits inside it already carries its
   own resolved style inline. The only exception is the empty-state
   placeholder, which is chrome, not card content. */
.cp-root .face-body:empty::after { content:"(empty)"; opacity:.5; font-style:italic; color:var(--cp-cardText); }

.cp-gutter { display:flex; flex-direction:column; font-size:10px; text-transform:uppercase; letter-spacing:.04em; color:var(--text-faint); width:78px; flex:none; }
.cp-gutter>div { flex:none; display:flex; align-items:flex-start; justify-content:flex-end; gap:4px; text-align:right; border-right:1px dashed var(--border); padding-right:7px; }

.cp-editor { flex:1; min-width:300px; border:1px solid var(--border); border-radius:8px; background:var(--bg-elevated); padding:12px; }
.cp-ed-banner { background:#3a2f14; border:1px solid #7d6327; color:#f0cf92; border-radius:5px; padding:7px 9px; font-size:11.5px; line-height:1.5; margin-bottom:10px; }
.cp-palette { display:flex; flex-wrap:wrap; gap:4px; margin-bottom:6px; }
.cp-palette button { font-size:11px; padding:2px 7px; border-radius:3px; border:1px solid var(--border); background:var(--bg); color:var(--text); cursor:pointer; font-family:var(--mono); }
.cp-palette button:hover { background:var(--accent-soft); }
.cp-palette-target { font-size:10.5px; color:var(--text-faint); margin-bottom:6px; }
.cp-ed-field { display:flex; flex-direction:column; gap:3px; margin-bottom:8px; }
.cp-ed-field>span { font-size:10.5px; text-transform:uppercase; letter-spacing:.06em; color:var(--text-faint); font-weight:700; }
.cp-ed-field textarea { font-family:var(--mono); font-size:11.5px; line-height:1.45; padding:6px; border:1px solid var(--border); border-radius:4px; background:var(--bg); color:var(--text); min-height:64px; resize:vertical; width:100%; }

.cp-cat-tabs { display:flex; gap:4px; margin:14px 0 8px; }
.cp-cat-tabs button { font-size:12px; padding:4px 10px; border-radius:4px; border:1px solid var(--border); background:var(--bg); color:var(--text); cursor:pointer; }
.cp-cat-tabs button.on { background:var(--accent-soft); color:var(--accent-text); font-weight:600; }
.cp-table-rail { overflow-x:auto; max-width: 760px; }
table.cp-smap { border-collapse:collapse; font-size:12px; width:100%; min-width:600px; }
table.cp-smap th, table.cp-smap td { text-align:left; padding:4px 9px; border-bottom:1px solid var(--border); white-space:nowrap; }
table.cp-smap th { font-size:10.5px; text-transform:uppercase; letter-spacing:.05em; color:var(--text-faint); }
table.cp-smap td.k { font-family:var(--mono); font-weight:600; }
table.cp-smap td.v { font-family:var(--mono); color:var(--text-faint); }
.cp-glyph { font-size:18px; }
.cp-g-pop { font-family:'Poppins-Regular', ui-sans-serif, system-ui, sans-serif; }
.cp-g-arial { font-family:'arial', Arial, Helvetica, sans-serif; }
.cp-generated-note { font-size:11px; color:var(--text-faint); margin:6px 0 2px; max-width:72ch; }
`;
}

// `extractCardStyle`'s output is a plain, JSON-serializable object — the
// one blob embedded once per preview row so the shared client script
// (below) can run the SAME renderer (dynamically imported from
// `/mjolnir/cards/render-engine.js`, the live engine, not a reimplemented
// copy) at whatever device width/theme/font size the operator currently
// has selected, without a server round trip per change (acceptance #20:
// switching the simulated device must visibly rescale immediately). `rawContent`
// carries each face's UNRENDERED HTML — the editor always edits and the
// renderer always starts from this, never from a previously-rendered DOM
// subtree (which would double-apply styles / re-escape text).
export function cardPreviewDataScript(style, symbols, rawContent) {
  return `<script type="application/json" class="cp-style-data">${JSON.stringify({ style, symbols, rawContent })}</script>`;
}

export function cardPreviewControlsHtml() {
  return `
<div class="cp-controls">
  <label class="cp-ctl"><span>Simulated device</span>
    <select id="cp-device-select">
      <option value="360x800">360 × 800 — compact phone</option>
      <option value="375x812" selected>375 × 812 — reference (×1.00)</option>
      <option value="412x915">412 × 915 — large phone</option>
      <option value="768x1024">768 × 1024 — tablet (×0.70 factor)</option>
    </select>
  </label>
  <div class="cp-ctl"><span>App theme</span>
    <div class="seg" id="cp-theme-select">
      <button type="button" data-t="dark" class="on">Dark</button>
      <button type="button" data-t="light">Light</button>
    </div>
  </div>
  <div class="cp-scale" id="cp-scale-readout"></div>
</div>`;
}

const TAG_ROWS = ["div", "b", "i", "p", "a"];
const CLASS_ROWS = [
  "lg",
  "arialFont",
  "arialFontNormal",
  "italic",
  "boldItalic",
  "underline",
  "green",
  "blue",
  "darkBlue",
  "red",
  "teal",
  "dodgerBlue",
  "royalRed",
  "blueViolet",
  "burntOrange",
  "center",
  "left",
  "sup",
  "supWrap",
  "tipOfTheDay",
];

function classSampleHtml(sel) {
  if (sel === "supWrap") return `k<div class="sup">j</div>(:)`;
  if (sel === "sup") return `j`;
  if (sel === "arialFont" || sel === "arialFontNormal") return `&#649;`;
  return "Aa";
}

// Samples are run through the SAME cascade the faces use (task 2's whole
// point: no second, hand-typed idea of what a class looks like) — a tag
// row's sample is `<tag>Aa</tag>`, a class row's is `<div class="sel">Aa</div>`
// (classes with no visible effect of their own, e.g. a bare `.underline`,
// still show the tag defaults so the row isn't blank).
function classCatalogueRowsHtml(style) {
  const rows = [];
  for (const tag of TAG_ROWS) {
    const html = tag === "br" ? "" : `<${tag}>Aa</${tag}>`;
    const rendered = renderCardFace(html, style, {}).html;
    rows.push(
      `<tr data-kind="tag" data-sel="${tag}"><td class="k">&lt;${tag}&gt;</td><td>tag</td><td class="v cp-resolve" data-resolve-sel="${tag}" data-resolve-kind="tag">—</td><td><span class="cp-sample" data-sel="${tag}" data-kind="tag">${rendered}</span></td></tr>`
    );
  }
  for (const sel of CLASS_ROWS) {
    const html = `<div class="${sel}">${classSampleHtml(sel)}</div>`;
    const rendered = renderCardFace(html, style, {}).html;
    rows.push(
      `<tr data-kind="class" data-sel="${sel}"><td class="k">.${sel}</td><td>class</td><td class="v cp-resolve" data-resolve-sel="${sel}" data-resolve-kind="class">—</td><td><span class="cp-sample" data-sel="${sel}" data-kind="class">${rendered}</span></td></tr>`
    );
  }
  return rows.join("\n");
}

function symbolRowHtml(row) {
  return `<tr><td class="k">${escapeHtml(row.entity)}</td><td class="cp-glyph cp-g-pop">${escapeHtml(row.glyph)}</td><td>${escapeHtml(row.name)}</td><td class="cp-glyph cp-g-pop">${escapeHtml(row.glyph)}</td><td class="cp-glyph cp-g-arial">${escapeHtml(row.glyph)}</td><td>${row.occurrences}</td></tr>`;
}

function symbolCatalogueHtml(symbols) {
  const norwegianRows = symbols.norwegian.map(symbolRowHtml).join("\n");
  const ipaRows = symbols.ipa.map(symbolRowHtml).join("\n");
  return `
<div class="cp-table-rail">
  <table class="cp-smap">
    <thead><tr><th>Entity</th><th>Glyph</th><th>Unicode name</th><th>Poppins</th><th>Arial</th><th>Occurrences</th></tr></thead>
    <tbody>
      <tr><td colspan="6" style="font-size:10.5px;text-transform:uppercase;letter-spacing:.06em;color:var(--text-faint);">Norwegian letters</td></tr>
      ${norwegianRows}
      <tr><td colspan="6" style="font-size:10.5px;text-transform:uppercase;letter-spacing:.06em;color:var(--text-faint);">IPA (sorted by occurrences in the stock bundle)</td></tr>
      ${ipaRows}
    </tbody>
  </table>
</div>
<p class="cp-generated-note">Generated from the stock bundle's own card content — not a hand-maintained guess at what might occur. Compare the Poppins and Arial columns: wherever Poppins falls back or boxes, the content needs <code>arialFont</code>/<code>arialFontNormal</code> around it.</p>`;
}

function editorPaletteHtml() {
  const items = [...TAG_ROWS.map((t) => ({ open: `<${t}>`, close: `</${t}>` })), ...CLASS_ROWS.map((c) => ({ open: `<div class="${c}">`, close: `</div>` }))];
  return items
    .map(
      (it) =>
        `<button type="button" class="cp-pal-btn" data-open="${escapeHtml(it.open)}" data-close="${escapeHtml(it.close)}">${escapeHtml(it.open)}</button>`
    )
    .join("");
}

// The one-card, three-thirds, tap-to-play, editable preview for a single
// card row — geometry/classes set by the shared client script (below)
// reading this row's `.cp-style-data` JSON, so every open preview reflects
// whatever device/theme/font size the operator currently has selected
// without a server round trip. Server-side, each face is pre-rendered
// through the exact same `renderCardFace()` (at the default device/theme/
// font size) so the row looks correct even before the client script runs.
export function cardPreviewInlineHtml(cardId, content, hasAudioFile, style, symbols) {
  const rawContent = { N: content.N || "", E: content.E || "", X: content.X || "" };
  const faceHtml = (letter) => {
    const rendered = style ? renderCardFace(rawContent[letter], style, {}).html : escapeHtml(rawContent[letter]);
    return `
    <div class="third t-${letter.toLowerCase()}" data-face="${letter}">
      <div class="touch"><div class="face-body" data-face-body="${letter}">${rendered}</div></div>
      <div class="play-pop"><div class="play-tri"></div></div>
      <div class="toast"></div>
    </div>`;
  };

  return `<div class="cp-root ${MCR_SCOPE}" data-card="${escapeHtml(cardId)}" data-a="${escapeHtml(content.A || "N")}" data-has-audio="${hasAudioFile ? "1" : "0"}">
  ${cardPreviewDataScript(style, symbols, rawContent)}
  <div class="cp-stage">
    <div class="cp-device">
      <div class="cp-stage" style="gap:10px;align-items:flex-start;">
        <div class="cp-gutter">
          <div><span>Front (N)</span></div>
          <div><span>Back (E)</span>${content.A === "E" ? " 🔊" : ""}</div>
          <div><span>Extra (X)</span>${content.A === "X" ? " 🔊" : ""}</div>
        </div>
        <div class="study-card" data-study-card>
          ${faceHtml("N")}
          <div class="third-divider" data-divider></div>
          ${faceHtml("E")}
          <div class="third-divider" data-divider></div>
          ${faceHtml("X")}
        </div>
      </div>
    </div>
    <div class="cp-editor" data-editor style="display:none">
      <div class="cp-ed-banner"><b>Throwaway scratch editor.</b> Edits are not saved anywhere, are never sent to the builder, and vanish on reload or reset.</div>
      <div class="cp-palette">${editorPaletteHtml()}</div>
      <div class="cp-palette-target">inserting into <b data-pal-target>N</b> — click a textarea to retarget</div>
      <label class="cp-ed-field"><span>Front (N)</span><textarea data-ed="N" spellcheck="false">${escapeHtml(rawContent.N)}</textarea></label>
      <label class="cp-ed-field"><span>Back (E)</span><textarea data-ed="E" spellcheck="false">${escapeHtml(rawContent.E)}</textarea></label>
      <label class="cp-ed-field"><span>Extra (X)</span><textarea data-ed="X" spellcheck="false">${escapeHtml(rawContent.X)}</textarea></label>
      <button type="button" data-ed-reset class="btn-ghost">Reset to minted card</button>
    </div>
  </div>
  <button type="button" class="btn-ghost" data-cp-edit-toggle style="margin-top:10px;">Edit HTML (throwaway)</button>

  <div class="cp-cat-tabs" data-cat-tabs>
    <button type="button" class="on" data-cat="classes">Class &amp; tag map</button>
    <button type="button" data-cat="symbols">Symbol catalogue</button>
  </div>
  <div data-cat-panel="classes">
    <div class="cp-table-rail">
      <table class="cp-smap">
        <thead><tr><th>Selector</th><th>Kind</th><th>Resolves to</th><th>Sample</th></tr></thead>
        <tbody>${style ? classCatalogueRowsHtml(style) : ""}</tbody>
      </table>
    </div>
    <p class="cp-generated-note">Generated from the bundle's own theme and class-style maps, rendered through the same cascade as the card faces above (<code>hub/src/cardRenderer.js</code>) — not a second, hand-typed idea of what a class looks like. Values follow the simulated device width's own <code>normalize()</code>.</p>
    <p class="cp-generated-note"><b>Dark card background is a mapping, not an extraction:</b> the dark theme has no <code>cardBackground</code> key — <code>#1B1D21</code> shown here comes from <code>archivedBackground</code> (equal to <code>navigationRoot</code>), not from a theme key named for cards.</p>
  </div>
  <div data-cat-panel="symbols" style="display:none">${symbolCatalogueHtml(symbols)}</div>
</div>`;
}

// Shared client script — included ONCE per Cards page (not per row). Reads
// each open row's own `.cp-style-data` JSON (the extractor output plus
// each face's raw HTML, embedded server-side) and re-renders everything
// live through the SAME engine Node used for the initial paint — dynamically
// imported once from `/mjolnir/cards/render-engine.js` (task 2's single
// source of cascade logic; see that file's own header). Nothing here
// reimplements normalize()/the cascade a second time: switching the
// simulated device, theme or font size is a pure client-side re-render
// through the one real renderer (acceptance #20).
export function cardPreviewClientScript() {
  return `
(function () {
  var cpState = { width: 375, height: 812, theme: 'dark', fontSize: null };
  var enginePromise = import('/mjolnir/cards/render-engine.js');

  function applyRoot(root) {
    enginePromise.then(function (engine) { applyRootWithEngine(root, engine); });
  }

  function applyRootWithEngine(root, engine) {
    var dataEl = root.querySelector('.cp-style-data');
    if (!dataEl) return;
    var data = JSON.parse(dataEl.textContent);
    var style = data.style;
    var rawContent = data.rawContent;
    var width = cpState.width, height = cpState.height;
    var isTablet = width >= 600;
    var fontSize = cpState.fontSize == null ? style.fontSizeControl.default : cpState.fontSize;
    var theme = style.themes[cpState.theme];
    var renderState = { width: width, height: height, tablet: isTablet, theme: cpState.theme, fontSize: fontSize };
    var n = function (t) { return engine.normalize(t, width, height, isTablet); };

    ['N', 'E', 'X'].forEach(function (letter) {
      var body = root.querySelector('[data-face-body="' + letter + '"]');
      if (!body) return;
      var ta = root.querySelector('[data-ed="' + letter + '"]');
      var source = ta ? ta.value : rawContent[letter];
      body.innerHTML = engine.renderCardFace(source, style, renderState).html;
    });

    var card = root.querySelector('[data-study-card]');
    var C = height - n(style.card.insetSubtrahend);
    card.style.width = n(style.card.width) + 'px';
    card.style.borderRadius = n(style.card.borderRadius) + 'px';
    card.style.borderWidth = n(style.card.borderWidth) + 'px';
    card.style.setProperty('--cp-borderColor', theme.borderColor);
    card.style.setProperty('--cp-cardText', theme.cardText);

    var fracs = style.faces;
    root.querySelectorAll('.third').forEach(function (el) {
      var face = el.dataset.face;
      // Centring-not-clipping (design.md): the FACE gets the fixed
      // height; its .touch child never stretches to fill it (CSS
      // align-items:flex-start/center above only affects the THIRD, not
      // whether .touch is sized to its own content), so a short face can
      // be centred as a whole and a long one top-aligned instead of
      // having its start pushed out of the scroll range.
      el.style.height = Math.round(fracs[face] * C) + 'px';
    });
    root.querySelectorAll('[data-divider]').forEach(function (d) {
      d.style.height = n(style.divider.height) + 'px';
    });
    updateFaceAlignment(root);

    root.querySelectorAll('tr[data-sel] .cp-resolve').forEach(function (cell) {
      var sel = cell.dataset.resolveSel, kind = cell.dataset.resolveKind;
      var text = '';
      if (kind === 'tag') {
        var t = style.tags[sel];
        if (sel === 'div') text = fontSize === n(fontSize) ? n(fontSize) + 'px, ' + style.tags.div.fontFamily + ', ' + theme.cardText : n(fontSize) + 'px';
        else if (sel === 'p') text = 'marginBottom ' + n(t.marginBottom) + 'px';
        else if (t && t.fontDropped) text = '(font dropped) ' + (theme[t.colorToken] || '');
        else if (t) text = (t.fontFamily ? t.fontFamily + ', ' : '') + (theme[t.colorToken] || '');
        else text = '(no tagsStyle)';
      } else {
        var c = style.classes[sel] || {};
        var parts = [];
        if (c.fontSize !== undefined) parts.push(n(c.fontSize) + 'px');
        if (c.marginHorizontal !== undefined) parts.push('±' + n(c.marginHorizontal) + 'px margin, top-aligned row');
        if (c.color) parts.push(c.color);
        if (c.colorToken) parts.push(theme[c.colorToken]);
        if (c.fontDropped) parts.push('font dropped (' + c.droppedFontFamily + ')');
        if (sel === 'bold') parts.push('undefined — no effect');
        text = parts.length ? parts.join(', ') : '(no size/color change)';
      }
      cell.textContent = text;
    });

    var readout = document.getElementById('cp-scale-readout');
    if (readout) readout.textContent = width + '×' + height + (isTablet ? ' (×' + engine.normalizeFactor(width, height, isTablet).toFixed(3) + ' tablet factor)' : '') + ' · theme: ' + cpState.theme + ' · font ' + fontSize + 'px';
  }

  // Acceptance #21/#22/#23: E/X are scrollable faces whose content must
  // centre when it fits and top-align (never clip above) when it
  // overflows. Which of those applies depends on the actual rendered
  // content height, which is unknowable from CSS alone (font metrics,
  // the card's own HTML, the simulated device width all affect it) — so
  // this measures scrollHeight against the fixed face height set in
  // applyRoot and flips a single flex property per face. Re-run after
  // layout-affecting changes: device/theme switches (applyRoot, above)
  // and throwaway-editor edits (setupEditor, below).
  function updateFaceAlignment(root) {
    root.querySelectorAll('.third.t-e, .third.t-x').forEach(function (third) {
      var touch = third.querySelector('.touch');
      if (!touch) return;
      var fits = touch.scrollHeight <= third.clientHeight;
      third.style.alignItems = fits ? 'center' : 'flex-start';
    });
  }

  function flashEl(el, msg) {
    if (msg !== undefined) el.textContent = msg;
    el.classList.remove('go');
    void el.offsetWidth;
    el.classList.add('go');
  }

  function onThirdClick(third) {
    var root = third.closest('.cp-root');
    var face = third.dataset.face;
    var a = root.dataset.a;
    var hasAudio = root.dataset.hasAudio === '1';
    var cardId = root.dataset.card;
    var toast = third.querySelector('.toast');
    if (face !== a) {
      flashEl(toast, 'no audio on this face');
      return;
    }
    if (!hasAudio) {
      flashEl(toast, 'clip unavailable');
      return;
    }
    flashEl(third.querySelector('.play-pop'));
    var audio = new Audio('/mjolnir/cards/' + encodeURIComponent(cardId) + '/audio');
    audio.play().catch(function () {});
  }

  function setupEditor(root) {
    var editor = root.querySelector('[data-editor]');
    var toggleBtn = root.querySelector('[data-cp-edit-toggle]');
    var original = {};
    ['N', 'E', 'X'].forEach(function (letter) {
      var ta = root.querySelector('[data-ed="' + letter + '"]');
      original[letter] = ta.value;
    });
    var activeTa = 'N';
    toggleBtn.addEventListener('click', function () {
      var showing = editor.style.display !== 'none';
      editor.style.display = showing ? 'none' : 'block';
    });
    ['N', 'E', 'X'].forEach(function (letter) {
      var ta = root.querySelector('[data-ed="' + letter + '"]');
      ta.addEventListener('focus', function () {
        activeTa = letter;
        root.querySelector('[data-pal-target]').textContent = letter;
      });
      ta.addEventListener('input', function () {
        applyRoot(root);
      });
    });
    root.querySelectorAll('.cp-pal-btn').forEach(function (btn) {
      btn.addEventListener('click', function () {
        var ta = root.querySelector('[data-ed="' + activeTa + '"]');
        var start = ta.selectionStart != null ? ta.selectionStart : ta.value.length;
        var end = ta.selectionEnd != null ? ta.selectionEnd : ta.value.length;
        var insert = btn.dataset.open + btn.dataset.close;
        ta.value = ta.value.slice(0, start) + insert + ta.value.slice(end);
        ta.selectionStart = ta.selectionEnd = start + btn.dataset.open.length;
        ta.dispatchEvent(new Event('input'));
        ta.focus();
      });
    });
    root.querySelector('[data-ed-reset]').addEventListener('click', function () {
      ['N', 'E', 'X'].forEach(function (letter) {
        root.querySelector('[data-ed="' + letter + '"]').value = original[letter];
      });
      applyRoot(root);
    });
  }

  function setupCatTabs(root) {
    root.querySelectorAll('[data-cat-tabs] button').forEach(function (btn) {
      btn.addEventListener('click', function () {
        root.querySelectorAll('[data-cat-tabs] button').forEach(function (b) {
          b.classList.remove('on');
        });
        btn.classList.add('on');
        root.querySelectorAll('[data-cat-panel]').forEach(function (p) {
          p.style.display = 'none';
        });
        root.querySelector('[data-cat-panel="' + btn.dataset.cat + '"]').style.display = 'block';
      });
    });
  }

  function currentVisibleRoot() {
    var rows = document.querySelectorAll('.card-preview-row');
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].style.display !== 'none') return rows[i].querySelector('.cp-root');
    }
    return null;
  }

  document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.cp-root').forEach(function (root) {
      setupEditor(root);
      setupCatTabs(root);
      root.querySelectorAll('.third').forEach(function (third) {
        third.addEventListener('click', function () {
          onThirdClick(third);
        });
      });
    });

    var deviceSel = document.getElementById('cp-device-select');
    if (deviceSel) {
      deviceSel.addEventListener('change', function () {
        var parts = deviceSel.value.split('x');
        cpState.width = Number(parts[0]);
        cpState.height = Number(parts[1]);
        var root = currentVisibleRoot();
        if (root) applyRoot(root);
      });
    }
    document.querySelectorAll('#cp-theme-select button').forEach(function (btn) {
      btn.addEventListener('click', function () {
        document.querySelectorAll('#cp-theme-select button').forEach(function (b) {
          b.classList.remove('on');
        });
        btn.classList.add('on');
        cpState.theme = btn.dataset.t;
        var root = currentVisibleRoot();
        if (root) applyRoot(root);
      });
    });
  });

  window.cpApplyRoot = applyRoot;
})();
`;
}
