import { escapeHtml } from "./layout.js";
import { cardPreviewFontFaceCss } from "./cardPreviewStyle.js";

// assembly-tab-usability item 3: "one card, three thirds — not three
// boxes." Every geometry/color/class value this file's CSS and JS use
// comes from `getCardPreviewData()` (task 3.1's extractor) — nothing here
// is a hand-typed guess at what the app looks like. Rendered inline under
// a card's own row in the Cards table, same expand/collapse-one-at-a-time
// shell as before (D109) — this file only replaces what goes *inside* that
// row.

export function cardPreviewStyleBlock() {
  return `
${cardPreviewFontFaceCss()}
.cp-controls { display:flex; gap:18px; align-items:flex-end; flex-wrap:wrap; padding:10px 12px; border:1px solid var(--border); background:var(--bg-elevated); border-radius:8px; margin-bottom:14px; }
.cp-ctl { display:flex; flex-direction:column; gap:4px; }
.cp-ctl>span { font-size:10.5px; text-transform:uppercase; letter-spacing:.06em; color:var(--text-faint); font-weight:700; }
.cp-ctl select, .cp-ctl button { font-family:inherit; font-size:13px; padding:5px 9px; border-radius:4px; border:1px solid var(--border); background:var(--bg); color:var(--text); cursor:pointer; }
.cp-ctl button.on { background:var(--accent-soft); color:var(--accent-text); font-weight:600; }
.cp-scale { font-size:11.5px; color:var(--text-faint); font-family:var(--mono); }

.cp-root { padding:14px 4px 18px; }
.cp-stage { display:flex; gap:20px; align-items:flex-start; flex-wrap:wrap; }
.cp-device { flex: none; }

.cp-root .study-card {
  font-family:'Poppins', ui-sans-serif, system-ui, sans-serif;
  display:flex; flex-direction:column; align-items:center;
  overflow:hidden; position:relative; border-style:solid;
  background:var(--cp-cardBackground); border-color:var(--cp-borderColor);
  color:var(--cp-cardText);
}
.cp-root .third { width:100%; display:flex; position:relative; cursor:pointer; -webkit-tap-highlight-color:transparent; }
.cp-root .third.t-n { align-items:center; overflow:hidden; }
/* align-items:flex-start is load-bearing here, same reasoning as the
   mockup: under default 'stretch' the .touch child is forced to the
   third's full height, so centring pushes an overflowing face's content
   out of reach at BOTH ends. Letting .touch size to its own content keeps
   centring when a face fits and top-aligns it when it does not. */
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

.cp-root .face-body { text-align:center; width:100%; color:var(--cp-cardText); font-size:var(--cp-fsBase); font-family:'Poppins', ui-sans-serif, system-ui, sans-serif; }
.cp-root .face-body:empty::after { content:"(empty)"; opacity:.5; font-style:italic; }
.cp-root .face-body div { font-weight:400; }
.cp-root .face-body b { font-weight:700; color:var(--cp-headingAccent); }
.cp-root .face-body i { font-style:italic; text-decoration:underline; }
.cp-root .face-body p { margin-top:0; margin-bottom:var(--cp-fsP); }
.cp-root .face-body a { color:var(--cp-headingAccent); }
.cp-root .face-body .lg { font-size:var(--cp-fsLg); }
.cp-root .face-body .arialFont { font-family:'CardArial', Arial, Helvetica, sans-serif; font-size:var(--cp-fsArialBig); }
.cp-root .face-body .arialFontNormal { font-family:'CardArial', Arial, Helvetica, sans-serif; font-size:var(--cp-fsArialNormal); }
.cp-root .face-body .italic { font-style:italic; font-weight:400; }
.cp-root .face-body .boldItalic { font-style:italic; font-weight:700; }
.cp-root .face-body .underline { text-decoration:underline; }
.cp-root .face-body .green { color:var(--cp-green); }
.cp-root .face-body .blue { color:var(--cp-headingAccent); }
.cp-root .face-body .darkBlue { color:var(--cp-headingGray); }
.cp-root .face-body .red { color:red; }
.cp-root .face-body .teal { color:#00A4BF; }
.cp-root .face-body .dodgerBlue { color:#0080ff; }
.cp-root .face-body .royalRed { color:#cc0066; }
.cp-root .face-body .blueViolet { color:#8030cf; }
.cp-root .face-body .burntOrange { color:#ff7733; }
.cp-root .face-body .center { text-align:center; font-weight:600; }
.cp-root .face-body .left { text-align:left; }
.cp-root .face-body .sup { font-size:var(--cp-fsSup); line-height:1; }
.cp-root .face-body .tipOfTheDay { font-weight:600; color:#fff; font-size:var(--cp-fsTip); }
/* supWrap: a real flex ROW with items aligned to the top — that top
   alignment is what raises the superscript; no <sup>, no vertical-align. */
.cp-root .face-body .supWrap { display:inline-flex; flex-direction:row; align-items:flex-start; justify-content:center; margin-left:var(--cp-supWrapMx); margin-right:var(--cp-supWrapMx); }
.cp-root .face-body .supWrap .sup { font-size:var(--cp-fsSup); line-height:1; }

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
.cp-g-pop { font-family:'Poppins', ui-sans-serif, system-ui, sans-serif; }
.cp-g-arial { font-family:'CardArial', Arial, Helvetica, sans-serif; }
.cp-generated-note { font-size:11px; color:var(--text-faint); margin:6px 0 2px; max-width:72ch; }
`;
}

// `extractCardStyle`'s output is a plain, JSON-serializable object — the
// one blob embedded once per preview row so the shared client script
// (below) can compute `normalize()` itself, at whatever device
// width/theme the operator currently has selected, without a server round
// trip per change (acceptance #20: switching the simulated device must
// visibly rescale immediately).
export function cardPreviewDataScript(style, symbols) {
  return `<script type="application/json" class="cp-style-data">${JSON.stringify({ style, symbols })}</script>`;
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

const TAG_ROWS = [
  { kind: "tag", sel: "div", desc: "cardText, Poppins-Regular" },
  { kind: "tag", sel: "b", desc: "Poppins-Bold, headingAccent" },
  { kind: "tag", sel: "i", desc: "Poppins-Regular italic, underlined" },
  { kind: "tag", sel: "p", desc: "block, marginBottom" },
  { kind: "tag", sel: "a", desc: "headingAccent" },
];
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
  if (sel === "supWrap") return `k<span class="supWrap">j</span>(:)`;
  if (sel === "sup") return `j`;
  if (sel === "arialFont" || sel === "arialFontNormal") return `&#649;`;
  return "Aa";
}

function classCatalogueRowsHtml(style) {
  const rows = [];
  for (const r of TAG_ROWS) {
    rows.push(
      `<tr data-kind="tag" data-sel="${r.sel}"><td class="k">&lt;${r.sel}&gt;</td><td>tag</td><td class="v cp-resolve">—</td><td><span class="cp-sample" data-sel="${r.sel}" data-kind="tag">${escapeHtml(classSampleHtml(r.sel))}</span></td></tr>`
    );
  }
  for (const sel of CLASS_ROWS) {
    rows.push(
      `<tr data-kind="class" data-sel="${sel}"><td class="k">.${sel}</td><td>class</td><td class="v cp-resolve">—</td><td><span class="cp-sample" data-sel="${sel}" data-kind="class">${classSampleHtml(sel)}</span></td></tr>`
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
  const items = [...TAG_ROWS.map((r) => ({ open: `<${r.sel}>`, close: `</${r.sel}>` })), ...CLASS_ROWS.map((c) => ({ open: `<div class="${c}">`, close: `</div>` }))];
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
// whatever device/theme the operator currently has selected without a
// server round trip.
export function cardPreviewInlineHtml(cardId, content, hasAudioFile, style, symbols) {
  const faceHtml = (letter) => `
    <div class="third t-${letter.toLowerCase()}" data-face="${letter}">
      <div class="touch"><div class="face-body" data-face-body="${letter}">${content[letter] || ""}</div></div>
      <div class="play-pop"><div class="play-tri"></div></div>
      <div class="toast"></div>
    </div>`;

  return `<div class="cp-root" data-card="${escapeHtml(cardId)}" data-a="${escapeHtml(content.A || "N")}" data-has-audio="${hasAudioFile ? "1" : "0"}">
  ${cardPreviewDataScript(style, symbols)}
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
      <label class="cp-ed-field"><span>Front (N)</span><textarea data-ed="N" spellcheck="false"></textarea></label>
      <label class="cp-ed-field"><span>Back (E)</span><textarea data-ed="E" spellcheck="false"></textarea></label>
      <label class="cp-ed-field"><span>Extra (X)</span><textarea data-ed="X" spellcheck="false"></textarea></label>
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
        <tbody>${classCatalogueRowsHtml(style)}</tbody>
      </table>
    </div>
    <p class="cp-generated-note">Generated from the bundle's own theme and class-style maps — <code>supWrap</code>, <code>arialFont</code> and <code>arialFontNormal</code> are the three the preview was missing before this change. Values follow the simulated device width's own <code>normalize()</code>.</p>
    <p class="cp-generated-note"><b>Dark card background is a mapping, not an extraction:</b> the dark theme has no <code>cardBackground</code> key — <code>#1B1D21</code> shown here comes from <code>archivedBackground</code> (equal to <code>navigationRoot</code>), not from a theme key named for cards.</p>
  </div>
  <div data-cat-panel="symbols" style="display:none">${symbolCatalogueHtml(symbols)}</div>
</div>`;
}

// Shared client script — included ONCE per Cards page (not per row). Reads
// each open row's own `.cp-style-data` JSON (task 3.1's extractor output,
// embedded server-side) and computes everything live: `normalize()`,
// theme colors, face heights, catalogue "resolves to" values. Nothing here
// is server-recomputed per request — switching the simulated device or
// theme is a pure client-side re-render (acceptance #20).
export function cardPreviewClientScript() {
  return `
(function () {
  var cpState = { width: 375, height: 812, theme: 'dark' };

  function normalize(t, width, isTablet) {
    return Math.round(t * width / 375 * (isTablet ? 0.7 : 1));
  }

  function applyRoot(root) {
    var dataEl = root.querySelector('.cp-style-data');
    if (!dataEl) return;
    var data = JSON.parse(dataEl.textContent);
    var style = data.style;
    var width = cpState.width, height = cpState.height;
    var isTablet = width >= 600;
    var theme = style.themes[cpState.theme];
    var n = function (t) { return normalize(t, width, isTablet); };

    var card = root.querySelector('[data-study-card]');
    var C = height - n(style.card.heightInsetBase);
    card.style.width = n(style.card.width) + 'px';
    card.style.borderRadius = n(style.card.borderRadius) + 'px';
    card.style.borderWidth = n(style.card.borderWidth) + 'px';
    card.style.setProperty('--cp-cardBackground', theme.cardBackground);
    card.style.setProperty('--cp-borderColor', theme.borderColor);
    card.style.setProperty('--cp-cardText', theme.cardText);
    card.style.setProperty('--cp-headingAccent', theme.headingAccent);
    card.style.setProperty('--cp-headingGray', theme.headingGray);
    card.style.setProperty('--cp-green', theme.green);
    card.style.setProperty('--cp-fsBase', n(style.tags.div.fontSize) + 'px');
    card.style.setProperty('--cp-fsP', n(style.tags.p.marginBottom) + 'px');
    card.style.setProperty('--cp-fsLg', n(style.classes.lg.fontSize) + 'px');
    card.style.setProperty('--cp-fsArialBig', n(style.classes.arialFont.fontSize) + 'px');
    card.style.setProperty('--cp-fsArialNormal', n(style.classes.arialFontNormal.fontSize) + 'px');
    card.style.setProperty('--cp-fsSup', n(style.classes.sup.fontSize) + 'px');
    card.style.setProperty('--cp-supWrapMx', n(style.classes.supWrap.marginHorizontal) + 'px');
    card.style.setProperty('--cp-fsTip', n(style.classes.tipOfTheDay.fontSize) + 'px');

    var fracs = style.faces;
    root.querySelectorAll('.third').forEach(function (el) {
      var face = el.dataset.face;
      // Centring-not-clipping (design.md): the FACE gets the fixed
      // height; its .touch child sizes to its own content (CSS
      // align-items:flex-start above), so a short face still centres
      // (justify-content:center on .touch) and a long one top-aligns
      // instead of having its start pushed out of the scroll range.
      el.style.height = Math.round(fracs[face] * C) + 'px';
    });
    root.querySelectorAll('[data-divider]').forEach(function (d) {
      d.style.height = n(style.divider.height) + 'px';
    });

    root.querySelectorAll('tr[data-sel] .cp-resolve').forEach(function (cell) {
      var row = cell.closest('tr');
      var sel = row.dataset.sel, kind = row.dataset.kind;
      var text = '';
      if (kind === 'tag') {
        if (sel === 'div') text = n(style.tags.div.fontSize) + 'px, Poppins-Regular, ' + theme.cardText;
        else if (sel === 'p') text = 'marginBottom ' + n(style.tags.p.marginBottom) + 'px';
        else if (sel === 'b') text = 'Poppins-Bold, ' + theme.headingAccent;
        else if (sel === 'a') text = theme.headingAccent;
        else text = 'Poppins-Regular italic, underline';
      } else {
        var c = style.classes[sel] || {};
        var parts = [];
        if (c.fontSize !== undefined) parts.push(n(c.fontSize) + 'px');
        if (c.marginHorizontal !== undefined) parts.push('±' + n(c.marginHorizontal) + 'px margin, top-aligned row');
        if (c.color) parts.push(c.color);
        if (sel === 'blue' || sel === 'arialFont' || sel === 'arialFontNormal') { if (sel === 'blue') parts.push(theme.headingAccent); }
        if (sel === 'darkBlue') parts.push(theme.headingGray);
        if (sel === 'green') parts.push(theme.green);
        text = parts.length ? parts.join(', ') : '(no size/color change)';
      }
      cell.textContent = text;
    });
    root.querySelectorAll('.cp-sample[data-sel]').forEach(function (s) {
      var sel = s.dataset.sel;
      var c = style.classes[sel];
      if (c && c.fontSize !== undefined) s.style.fontSize = n(c.fontSize) + 'px';
      if (sel === 'arialFont' || sel === 'arialFontNormal') s.style.fontFamily = "'CardArial', Arial, Helvetica, sans-serif";
    });

    var readout = document.getElementById('cp-scale-readout');
    if (readout) readout.textContent = width + '×' + height + (isTablet ? ' (×0.70 tablet factor)' : '') + ' · theme: ' + cpState.theme;
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
      original[letter] = root.querySelector('[data-face-body="' + letter + '"]').innerHTML;
    });
    var activeTa = 'N';
    toggleBtn.addEventListener('click', function () {
      var showing = editor.style.display !== 'none';
      editor.style.display = showing ? 'none' : 'block';
      if (!showing) {
        ['N', 'E', 'X'].forEach(function (letter) {
          root.querySelector('[data-ed="' + letter + '"]').value = original[letter];
        });
      }
    });
    ['N', 'E', 'X'].forEach(function (letter) {
      var ta = root.querySelector('[data-ed="' + letter + '"]');
      ta.addEventListener('focus', function () {
        activeTa = letter;
        root.querySelector('[data-pal-target]').textContent = letter;
      });
      ta.addEventListener('input', function () {
        root.querySelector('[data-face-body="' + letter + '"]').innerHTML = ta.value;
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
        root.querySelector('[data-face-body="' + letter + '"]').innerHTML = original[letter];
      });
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
    var row = document.querySelector('.card-preview-row');
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
