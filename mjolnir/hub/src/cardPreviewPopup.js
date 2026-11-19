// card-preview-popup task group 3 ("The card and the popup").
//
// ONE shared modal (design.md §4 / task 3.3) — rendered ONCE per Cards
// page, not once per row. It draws the study card alone (task 3.1/3.2, on
// top of task group 2's `renderCardFace`/`normalize` engine) inside a
// dialog whose bar carries stepping, the N|E direction switch, the device/
// theme/font controls and a "Tools" toggle for task group 4's drawer.
//
// Mockup fidelity (openspec/changes/card-preview-popup/mockups/
// card-preview-popup.html, version 6, operator-locked): the bar's control
// order, the card-alone-on-the-screen-background treatment, the face
// clip/scroll/centre behaviour and the direction-switch semantics are
// copied from that mockup's own `renderCard`/`updateInfo`/`fitCard`/
// `defaultDir`/`slots`/`step` functions — see the research notes left
// alongside the ones in this file for where a line maps back to it.
// Tools-drawer CONTENTS (3.4 editors/classes&tags/symbols tabs) are task
// group 4's build; this file only gives it a slot to open into (`#cpp-
// drawer`, toggled by `#cpp-tools`), per the task list's explicit scope cut.
//
// Direction/stepping/occurrence-summary/audio-outcome logic is NOT
// duplicated here — it lives in the isomorphic, import-free
// `hub/src/cardPreviewEngine.js`, loaded server-side the normal way and
// client-side via the read-only static route `/mjolnir/cards/popup-
// engine.js` (same pattern as task 2's `render-engine.js`). This file's
// client script only wires DOM events to those functions.
//
// Public API this module exports for a page to mount the popup:
//   cardPreviewPopupStyleBlock()               -> <style> text (no <style> tags)
//   cardPreviewPopupMarkupHtml()                -> the dialog's HTML, render once
//   cardPreviewPopupClientScript()             -> the wiring JS, render once
//   cardPreviewPopupRowOpenAttrs(index)         -> attrs a row/button needs to open at `index`
//
// Contract for whoever opens the popup (the existing Cards accordion now,
// task group 5's flat table later):
//   window.MjolnirCardPreviewPopup.open(cards, index, options)
//     cards   — the FULL filtered+sorted list (every page, not just the
//               current one — task 3.5 steps across page boundaries by
//               indexing into this array, it does not re-fetch a page).
//               Each entry:
//               { key, id, D, N, E, X, A, occurrences: [...], audioUrl,
//                 audioAvailable, hasAudio }
//               (`occurrences` — see cardPreviewEngine.js's header for the
//               shape and ordering contract; `audioUrl`/`audioAvailable`/
//               `hasAudio` — task 3.6's passed-in flags, real blob-cache
//               wiring is task group 5's job.)
//     index   — which entry in `cards` to open on.
//     options — { defaultDirection: 'auto'|'N'|'E' } (task group 6 persists
//               the operator's real pick; a literal value is fine for now).
//   window.MjolnirCardPreviewPopup.close()      -> closes if open (no-op otherwise)
//   On close, this module does BOTH of:
//     1. calls `options.onClose(card, index)` if one was passed to `.open`
//     2. dispatches `document.dispatchEvent(new CustomEvent('cardpreviewpopup:close', { detail: { card, index } }))`
//   so a later task group can pick either integration style — "report back
//   which card was last shown" (task 3.5) without this file needing to know
//   anything about pages, tables or row highlighting.

import { cardRendererResetCss } from "./cardRenderer.js";
import {
  defaultDirectionFor,
  directionSlots,
  stepIndex,
  occurrenceSummaryText,
  hasAOccurrence,
  resolveTapOutcome,
} from "./cardPreviewEngine.js";

const SCOPE = "cpp-root";

// Exposed so a Node test can assert the pure functions imported above are
// the ones this module actually wires up (no second copy pasted inline).
export const _engine = { defaultDirectionFor, directionSlots, stepIndex, occurrenceSummaryText, hasAOccurrence, resolveTapOutcome };

export function cardPreviewPopupStyleBlock() {
  return `
${cardRendererResetCss(SCOPE)}
/* design.md §8 / acceptance C41: the popup's OWN chrome is scoped under
   .${SCOPE} with its own prefixed classes (cpp-*) that no page-level rule
   (a filter bar's .active, the "no cards match" empty state's .empty,
   a stray [hidden] override) has any reason to target — none of those
   names are used anywhere inside this subtree. */
.${SCOPE}.cpp-modal { position: fixed; inset: 0; z-index: 2000; background: rgba(0,0,0,.6); display: flex; padding: 3vh 3vw; }
.${SCOPE}.cpp-modal[hidden] { display: none; }
.${SCOPE} .cpp-dialog { position: relative; margin: auto; width: 100%; max-width: 1320px; height: 100%; background: var(--bg-elevated); border-radius: 12px; display: flex; flex-direction: column; overflow: hidden; box-shadow: 0 20px 60px rgba(0,0,0,.45); border: 1px solid var(--border); }
.${SCOPE} .cpp-bar { display: flex; flex-wrap: wrap; align-items: center; gap: 8px 14px; padding: 10px 12px; border-bottom: 1px solid var(--border); }
.${SCOPE} .cpp-grp { display: flex; align-items: center; gap: 6px; }
.${SCOPE} .cpp-lbl { font-size: 11px; text-transform: uppercase; letter-spacing: .06em; color: var(--text-faint); }
.${SCOPE} select, .${SCOPE} .cpp-btn, .${SCOPE} .cpp-seg button, .${SCOPE} .cpp-step button {
  font: inherit; font-size: 13px; color: var(--text); background: var(--bg-elevated);
  border: 1px solid var(--border); border-radius: 7px; padding: 4px 9px; cursor: pointer;
}
.${SCOPE} .cpp-btn:hover, .${SCOPE} .cpp-seg button:hover, .${SCOPE} .cpp-step button:hover { border-color: var(--accent); }
.${SCOPE} .cpp-btn:disabled { opacity: .4; cursor: default; }
.${SCOPE} .cpp-seg { display: inline-flex; }
.${SCOPE} .cpp-seg button { border-radius: 0; }
.${SCOPE} .cpp-seg button:first-child { border-radius: 7px 0 0 7px; }
.${SCOPE} .cpp-seg button:last-child { border-radius: 0 7px 7px 0; margin-left: -1px; }
.${SCOPE} .cpp-seg button.on { background: var(--accent-soft); border-color: var(--accent); color: var(--accent-text); }
.${SCOPE} .cpp-step { display: inline-flex; align-items: center; }
.${SCOPE} .cpp-step button { width: 28px; padding: 4px 0; }
.${SCOPE} .cpp-step output { min-width: 28px; text-align: center; font-variant-numeric: tabular-nums; font-weight: 600; }
.${SCOPE} .cpp-nav-id { font-family: var(--mono); font-size: 13px; }
.${SCOPE} .cpp-nav-pos { color: var(--text-faint); font-variant-numeric: tabular-nums; font-size: 12.5px; }
.${SCOPE} .cpp-spacer { flex: 1; }
.${SCOPE} .cpp-primary.on { background: var(--accent); border-color: var(--accent); color: var(--bg-elevated); }
.${SCOPE} .cpp-edited { font-size: 11px; font-weight: 600; padding: 2px 8px; border-radius: 999px; background: var(--err-soft); color: var(--err); }
.${SCOPE} .cpp-anote { font-family: var(--mono); font-size: 12px; color: var(--accent-text); background: var(--accent-soft); border-radius: 5px; padding: 1px 6px; }
.${SCOPE} .cpp-occsum { font-size: 12px; color: var(--text-dim); font-family: var(--mono); }
.${SCOPE} .cpp-close { font-size: 18px; line-height: 1; padding: 3px 9px; }
.${SCOPE} .cpp-body { position: relative; flex: 1; min-height: 0; display: flex; }
.${SCOPE} .cpp-stage { flex: 1; min-width: 0; position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 14px; transition: margin-right .25s ease; }
.${SCOPE} .cpp-info { font-size: 11.5px; color: var(--text-dim); text-align: center; margin-top: 8px; font-variant-numeric: tabular-nums; display: flex; gap: 4px 12px; flex-wrap: wrap; justify-content: center; }
.${SCOPE} .cpp-info .cpp-warnchip { color: var(--warn); background: var(--warn-soft); padding: 0 6px; border-radius: 4px; font-weight: 600; }
.${SCOPE} .cpp-phone-slot { position: relative; flex: 0 0 auto; }
.${SCOPE} .cpp-scaler { position: absolute; left: 0; top: 0; transform-origin: 0 0; }
.${SCOPE} .cpp-cardbg { position: relative; overflow: hidden; border-radius: 22px; font-family: 'Poppins-Regular', sans-serif; font-synthesis: none; -webkit-font-smoothing: antialiased; }

/* task 4 fills this; task 3 only opens/closes an empty slot (design §4 /
   task 3.3's explicit scope cut: "for now it can toggle an empty/
   placeholder drawer region"). */
.${SCOPE} .cpp-drawer { position: absolute; top: 0; right: 0; bottom: 0; width: 360px; background: var(--bg-elevated); border-left: 1px solid var(--border); display: flex; flex-direction: column; min-width: 0; }
.${SCOPE} .cpp-drawer[hidden] { display: none; }
.${SCOPE} .cpp-dialog.cpp-tools .cpp-stage { margin-right: 360px; }
.${SCOPE} .cpp-drawer-placeholder { padding: 16px; color: var(--text-faint); font-size: 12.5px; line-height: 1.6; }

/* the card alone, on a rectangle of the theme's screen background */
.${SCOPE} .cpp-card { position: relative; flex: 0 0 auto; align-self: center; display: flex; flex-direction: column; align-items: center; overflow: hidden; border-style: solid; }
.${SCOPE} .cpp-topic { text-align: center; text-transform: uppercase; width: 100%; font-weight: 400; }
.${SCOPE} .cpp-face { width: 100%; position: relative; z-index: 9; cursor: pointer; }
.${SCOPE} .cpp-face.cpp-face-top { display: flex; flex-direction: column; overflow: hidden; }
.${SCOPE} .cpp-face.cpp-face-top > .cpp-fc { margin-block: auto; }
.${SCOPE} .cpp-face .cpp-scroll { height: 100%; overflow-y: auto; overflow-x: hidden; display: flex; flex-direction: column; scrollbar-width: thin; }
.${SCOPE} .cpp-face .cpp-inner { flex: 1 0 auto; display: flex; flex-direction: column; justify-content: center; }
.${SCOPE} .cpp-divider { flex: 0 0 auto; width: 60%; }
.${SCOPE} .cpp-audio { position: absolute; z-index: 10; display: grid; place-items: center; border-radius: 50%; }
.${SCOPE} .cpp-toast { position: absolute; left: 50%; bottom: 22%; transform: translate(-50%, 8px); background: rgba(20,22,26,.9); color: #fff; font: 13px/1.3 sans-serif; padding: 8px 14px; border-radius: 18px; opacity: 0; transition: opacity .2s, transform .2s; pointer-events: none; white-space: nowrap; z-index: 20; }
.${SCOPE} .cpp-toast.cpp-on { opacity: 1; transform: translate(-50%, 0); }

@media (max-width: 760px) {
  .${SCOPE} .cpp-dialog { border-radius: 0; }
  .${SCOPE} .cpp-body { flex-direction: column; }
  .${SCOPE} .cpp-drawer { top: auto; left: 0; right: 0; width: 100%; height: 55%; border-left: 0; border-top: 1px solid var(--border); }
  .${SCOPE} .cpp-dialog.cpp-tools .cpp-stage { margin-right: 0; flex: 0 0 auto; height: 45%; }
}
`;
}

// Rendered ONCE per Cards page (task 3.3 "one shared modal, not one per
// row"). `hidden` by default — `window.MjolnirCardPreviewPopup.open()`
// clears it.
export function cardPreviewPopupMarkupHtml() {
  return `
<div class="${SCOPE} cpp-modal" id="cpp-modal" hidden>
  <div class="cpp-dialog" id="cpp-dialog" role="dialog" aria-modal="true" aria-labelledby="cpp-title">
    <div class="cpp-bar">
      <div class="cpp-grp">
        <button class="cpp-btn" id="cpp-prev" type="button" aria-label="Previous card">←</button>
        <span class="cpp-nav-id" id="cpp-title"></span>
        <span class="cpp-nav-pos" id="cpp-pos"></span>
        <button class="cpp-btn" id="cpp-next" type="button" aria-label="Next card">→</button>
        <span class="cpp-edited" id="cpp-edited" hidden>edited (throwaway)</span>
      </div>
      <div class="cpp-grp"><span class="cpp-lbl">Direction</span>
        <div class="cpp-seg" id="cpp-dir"><button type="button" data-d="N">N</button><button type="button" data-d="E">E</button></div>
        <span class="cpp-anote" id="cpp-anote" hidden></span>
        <span class="cpp-occsum" id="cpp-occsum"></span>
        <select id="cpp-dirpref" aria-label="Default direction when a card opens" title="Default direction when a card opens">
          <option value="auto">default: first occurrence</option>
          <option value="N">default: N</option>
          <option value="E">default: E</option>
        </select>
      </div>
      <div class="cpp-grp"><span class="cpp-lbl">Device</span>
        <select id="cpp-device" aria-label="Simulated device">
          <option value="360x800">360 × 800</option>
          <option value="375x812" selected>375 × 812 (ref)</option>
          <option value="412x915">412 × 915</option>
          <option value="768x1024">768 × 1024 tablet</option>
        </select>
      </div>
      <div class="cpp-grp"><span class="cpp-lbl">Theme</span>
        <div class="cpp-seg" id="cpp-theme"><button type="button" data-t="light">Light</button><button type="button" data-t="dark" class="on">Dark</button></div>
      </div>
      <div class="cpp-grp"><span class="cpp-lbl">Font</span>
        <div class="cpp-step"><button type="button" id="cpp-fs-dec" aria-label="Smaller">−</button><output id="cpp-fs">15</output><button type="button" id="cpp-fs-inc" aria-label="Larger">+</button></div>
      </div>
      <span class="cpp-spacer"></span>
      <button class="cpp-btn cpp-primary" id="cpp-tools" type="button" aria-expanded="false">Tools</button>
      <button class="cpp-btn cpp-close" id="cpp-close" type="button" aria-label="Close preview">×</button>
    </div>
    <div class="cpp-body" id="cpp-dbody">
      <div class="cpp-stage" id="cpp-stage">
        <div class="cpp-phone-slot" id="cpp-slot"><div class="cpp-scaler" id="cpp-scaler"><div class="cpp-cardbg" id="cpp-screen"></div></div></div>
        <div class="cpp-info" id="cpp-info"></div>
      </div>
      <aside class="cpp-drawer" id="cpp-drawer" aria-label="Tools" hidden>
        <div class="cpp-drawer-placeholder">Tools drawer — built in task group 4 (Edit HTML, Classes &amp; tags, Symbols).</div>
      </aside>
    </div>
  </div>
</div>`;
}

// A row/button can use this to open the popup declaratively:
//   <button type="button" ${cardPreviewPopupRowOpenAttrs(i)}>preview</button>
// paired with the click delegation `cardPreviewPopupClientScript()` installs
// on `[data-cpp-open]`. Kept as a tiny helper (not required — a caller can
// just call `window.MjolnirCardPreviewPopup.open(...)` directly) so the
// provisional Cards-page wiring and task group 5's real one can share one
// attribute name instead of inventing their own.
export function cardPreviewPopupRowOpenAttrs(index) {
  return `data-cpp-open="${index}"`;
}

// The wiring JS — dynamically imports the two isomorphic engines (task 2's
// render-engine.js, this task's popup-engine.js) exactly once, then reads
// whatever `window.MjolnirCardPreviewPopupData` the page set (the full
// card list + extractor style map) to drive the dialog. Nothing in this
// script re-implements normalize()/the cascade/the direction or stepping
// rules a second time — see this file's own header.
export function cardPreviewPopupClientScript() {
  return `
(function () {
'use strict';
var DEVICES = {
  '360x800': { w: 360, h: 800, tablet: false },
  '375x812': { w: 375, h: 812, tablet: false },
  '412x915': { w: 412, h: 915, tablet: false },
  '768x1024': { w: 768, h: 1024, tablet: true },
};

var renderEnginePromise = import('/mjolnir/cards/render-engine.js');
var popupEnginePromise = import('/mjolnir/cards/popup-engine.js');

var S = {
  cards: [], index: 0, dir: 'N', open: false,
  device: '375x812', theme: 'dark', fontSize: null, dirPref: 'auto',
  onClose: null, lastFocus: null,
};
var style = null; // extractor output, set once by setStyle()
var toastTimer = null;

function $(id) { return document.getElementById(id); }
function esc(s) { return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) { return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]; }); }
function dev() { return DEVICES[S.device] || DEVICES['375x812']; }
function card() { return S.cards[S.index] || null; }

function setStyle(s) { style = s; if (S.fontSize == null && s) S.fontSize = s.fontSizeControl.default; }

function renderInfoAndCard(engine, popupEngine) {
  var c = card();
  if (!c || !style) return;
  var d = dev();
  var factor = engine.normalizeFactor(d.w, d.h, d.tablet);
  var n = function (v) { return engine.normalize(v, d.w, d.h, d.tablet); };
  var slots = popupEngine.directionSlots(S.dir);
  var minHeight = n(style.card.minHeight);
  var subtract = d.h - n(style.card.insetSubtrahend);
  var Xe = Math.max(minHeight, subtract);
  var cardW = n(style.card.width);
  var contentW = cardW - 2 * n(style.card.borderWidth) - 2 * n(style.padding.textHorizontal);
  var pad = 16;
  var theme = style.themes[S.theme];
  var aSlotLetter = [slots.top, slots.mid, slots.bottom].indexOf(c.A);

  var screen = $('cpp-screen');
  screen.style.cssText = 'width:' + (cardW + 2 * pad) + 'px;height:' + (Xe + 2 * pad) + 'px;padding:' + pad + 'px;background:' + theme.background;

  var faceLetters = [slots.top, slots.mid, slots.bottom];
  var faceFracs = faceLetters.map(function (l) { return style.faces[l]; });
  var faceHeights = faceFracs.map(function (f) { return f * Xe; });
  var audioTop = [0, faceHeights[0], faceHeights[0] + faceHeights[1]][aSlotLetter];

  screen.innerHTML =
    '<div class="cpp-card" id="cpp-pcard" style="width:' + cardW + 'px;height:' + Xe + 'px;border-radius:' + n(style.card.borderRadius) + 'px;border-width:' + n(style.card.borderWidth) + 'px;border-color:' + theme.borderColor + '">' +
      '<div class="cpp-topic" style="font-size:' + n(10.5) + 'px;line-height:' + n(16) + 'px;color:' + theme.studyCardHeading + '">' + esc(c.D || '') + '</div>' +
      '<div class="cpp-face cpp-face-top" data-f="' + slots.top + '" style="height:' + faceHeights[0] + 'px;padding:' + n(style.padding.faceVertical) + 'px ' + n(style.padding.textHorizontal) + 'px ' + n(style.padding.textBottom) + 'px"><div class="cpp-fc"></div></div>' +
      '<div class="cpp-divider" style="height:' + n(style.divider.height) + 'px;background:' + theme.borderColor + '"></div>' +
      '<div class="cpp-face cpp-face-mid" data-f="' + slots.mid + '" style="height:' + faceHeights[1] + 'px;padding:' + n(style.padding.faceVertical) + 'px 0">' +
        '<div class="cpp-scroll"><div class="cpp-inner" style="min-height:' + (faceHeights[1] - n(style.padding.textHorizontal)) + 'px;padding:0 ' + n(style.padding.textHorizontal) + 'px ' + n(style.padding.textBottom) + 'px"><div class="cpp-fc"></div></div></div></div>' +
      '<div class="cpp-divider" style="height:' + n(style.divider.height) + 'px;background:' + theme.borderColor + '"></div>' +
      '<div class="cpp-face cpp-face-x" data-f="X" style="height:' + faceHeights[2] + 'px;margin:' + n(style.padding.faceVertical) + 'px 0">' +
        '<div class="cpp-scroll" style="padding:' + n(style.padding.faceVertical) + 'px 0"><div class="cpp-inner" style="padding:0 ' + n(style.padding.textHorizontal) + 'px ' + n(style.padding.textBottom) + 'px"><div class="cpp-fc"></div></div></div></div>' +
      (aSlotLetter >= 0 ? '<div class="cpp-audio" id="cpp-audio-icon" style="width:' + n(36) + 'px;height:' + n(36) + 'px;right:' + n(16) + 'px;top:' + (n(16) + audioTop) + 'px;color:' + theme.headingAccent + '">\u{1F50A}</div>' : '') +
    '</div><div class="cpp-toast" id="cpp-toast"></div>';

  var faceEls = screen.querySelectorAll('.cpp-face');
  faceEls.forEach(function (el) {
    var letter = el.dataset.f;
    var html = letter === 'N' ? c.N : letter === 'E' ? c.E : c.X;
    var rendered = engine.renderCardFace(html || '', style, { fontSize: S.fontSize, width: d.w, height: d.h, tablet: d.tablet, theme: S.theme });
    el.querySelector('.cpp-fc').innerHTML = rendered.html;
    el.addEventListener('click', function () { tapFace(letter); });
  });

  var topFace = screen.querySelector('.cpp-face-top');
  var clipped = topFace && topFace.scrollHeight > topFace.clientHeight + 1;
  $('cpp-info').innerHTML =
    '<span>' + d.w + ' × ' + d.h + (d.tablet ? ' tablet' : '') + ' · normalize ×' + factor.toFixed(3) + '</span>' +
    '<span>card ' + cardW + ' × ' + Math.round(Xe) + ' dp</span>' +
    '<span>face text width ' + Math.round(contentW) + ' dp</span>' +
    '<span>font ' + S.fontSize + ' → ' + n(S.fontSize) + ' dp</span>' +
    '<span>audio on ' + (c.A || '—') + '</span>' +
    '<span id="cpp-scale-lbl"></span>' +
    (clipped ? '<span class="cpp-warnchip">top face overflows: it does not scroll, the device clips it</span>' : '');

  fitStage();
}

function fitStage() {
  var stage = $('cpp-stage');
  var slot = $('cpp-slot');
  var scaler = $('cpp-scaler');
  var screen = $('cpp-screen');
  if (!stage || !screen || !screen.style.width) return;
  var w = parseFloat(screen.style.width);
  var h = parseFloat(screen.style.height);
  var info = $('cpp-info');
  var aw = stage.clientWidth - 28;
  var ah = stage.clientHeight - 28 - (info ? info.offsetHeight : 0) - 8;
  var k = Math.max(0.15, Math.min(4, aw / w, ah / h));
  scaler.style.transform = 'scale(' + k + ')';
  slot.style.width = (w * k) + 'px';
  slot.style.height = (h * k) + 'px';
  var lbl = $('cpp-scale-lbl');
  if (lbl) lbl.textContent = 'shown at ' + Math.round(k * 100) + '%';
}

function tapFace(face) {
  Promise.all([renderEnginePromise, popupEnginePromise]).then(function (mods) {
    var popupEngine = mods[1];
    var c = card();
    var result = popupEngine.resolveTapOutcome(c, face, { audioAvailable: c.audioAvailable, hasAudio: c.hasAudio });
    if (result.outcome === 'play') {
      var audio = new Audio(c.audioUrl || ('/mjolnir/cards/' + encodeURIComponent(c.id) + '/audio'));
      audio.play().catch(function () {});
      return;
    }
    var toast = $('cpp-toast');
    if (!toast) return;
    toast.textContent = result.message || '';
    toast.classList.add('cpp-on');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(function () { toast.classList.remove('cpp-on'); }, 1300);
  });
}

function syncDir() {
  $('cpp-dir').querySelectorAll('button').forEach(function (b) { b.classList.toggle('on', b.dataset.d === S.dir); });
}

function refresh() {
  Promise.all([renderEnginePromise, popupEnginePromise]).then(function (mods) {
    var engine = mods[0], popupEngine = mods[1];
    var c = card();
    if (!c) return;
    $('cpp-title').textContent = c.id;
    $('cpp-pos').textContent = (S.index + 1) + ' / ' + S.cards.length;
    $('cpp-prev').disabled = popupEngine.stepIndex(S.index, -1, S.cards.length) === null;
    $('cpp-next').disabled = popupEngine.stepIndex(S.index, 1, S.cards.length) === null;
    var an = $('cpp-anote');
    var hasA = popupEngine.hasAOccurrence(c.occurrences);
    an.hidden = !hasA;
    if (hasA) { an.textContent = 'A → ' + c.A; an.title = "This card's A occurrence is its " + c.A + " side (card field A = " + c.A + ")"; }
    $('cpp-occsum').textContent = popupEngine.occurrenceSummaryText(c.occurrences);
    syncDir();
    renderInfoAndCard(engine, popupEngine);
  });
}

function setDirection(dir) {
  S.dir = dir;
  syncDir();
  Promise.all([renderEnginePromise, popupEnginePromise]).then(function (mods) { renderInfoAndCard(mods[0], mods[1]); });
}

function step(delta) {
  popupEnginePromise.then(function (popupEngine) {
    var j = popupEngine.stepIndex(S.index, delta, S.cards.length);
    if (j === null) return;
    S.index = j;
    refresh();
  });
}

function openModal(cards, index, options) {
  if (!style && window.MjolnirCardPreviewPopupData && window.MjolnirCardPreviewPopupData.style) {
    setStyle(window.MjolnirCardPreviewPopupData.style);
  }
  var opts = options || {};
  S.cards = cards || [];
  S.index = Math.max(0, Math.min(index || 0, S.cards.length - 1));
  S.dirPref = opts.defaultDirection || 'auto';
  S.onClose = typeof opts.onClose === 'function' ? opts.onClose : null;
  S.open = true;
  S.lastFocus = document.activeElement;
  $('cpp-dirpref').value = S.dirPref;
  popupEnginePromise.then(function (popupEngine) {
    S.dir = popupEngine.defaultDirectionFor(card(), S.dirPref);
    $('cpp-modal').hidden = false;
    document.body.style.overflow = 'hidden';
    refresh();
    $('cpp-close').focus();
  });
}

function closeModal() {
  if (!S.open) return;
  S.open = false;
  $('cpp-modal').hidden = true;
  document.body.style.overflow = '';
  var c = card();
  var index = S.index;
  if (S.onClose) S.onClose(c, index);
  document.dispatchEvent(new CustomEvent('cardpreviewpopup:close', { detail: { card: c, index: index } }));
  if (S.lastFocus && typeof S.lastFocus.focus === 'function') S.lastFocus.focus();
}

document.addEventListener('DOMContentLoaded', function () {
  if (!$('cpp-modal')) return;

  Promise.all([renderEnginePromise, popupEnginePromise]).then(function (mods) {
    document.getElementById('cpp-device').addEventListener('change', function (e) {
      S.device = e.target.value;
      renderInfoAndCard(mods[0], mods[1]);
    });
    document.getElementById('cpp-theme').addEventListener('click', function (e) {
      var b = e.target.closest('button');
      if (!b) return;
      S.theme = b.dataset.t;
      document.getElementById('cpp-theme').querySelectorAll('button').forEach(function (x) { x.classList.toggle('on', x === b); });
      renderInfoAndCard(mods[0], mods[1]);
    });
    document.getElementById('cpp-fs-dec').addEventListener('click', function () { setFontSize(S.fontSize - 1, mods); });
    document.getElementById('cpp-fs-inc').addEventListener('click', function () { setFontSize(S.fontSize + 1, mods); });
  });

  function setFontSize(v, mods) {
    if (!style) return;
    S.fontSize = Math.max(style.fontSizeControl.min, Math.min(style.fontSizeControl.max, v));
    document.getElementById('cpp-fs').textContent = S.fontSize;
    document.getElementById('cpp-fs-dec').disabled = S.fontSize <= style.fontSizeControl.min;
    document.getElementById('cpp-fs-inc').disabled = S.fontSize >= style.fontSizeControl.max;
    renderInfoAndCard(mods[0], mods[1]);
  }

  $('cpp-prev').addEventListener('click', function () { step(-1); });
  $('cpp-next').addEventListener('click', function () { step(1); });
  $('cpp-close').addEventListener('click', closeModal);
  $('cpp-modal').addEventListener('click', function (ev) { if (ev.target === $('cpp-modal')) closeModal(); });
  $('cpp-dir').addEventListener('click', function (e) {
    var b = e.target.closest('button');
    if (!b) return;
    setDirection(b.dataset.d);
  });
  $('cpp-dirpref').addEventListener('change', function (e) {
    S.dirPref = e.target.value;
    popupEnginePromise.then(function (popupEngine) {
      S.dir = popupEngine.defaultDirectionFor(card(), S.dirPref);
      refresh();
    });
  });
  $('cpp-tools').addEventListener('click', function () {
    var drawer = $('cpp-drawer');
    var dialog = $('cpp-dialog');
    var opening = drawer.hidden;
    drawer.hidden = !opening;
    dialog.classList.toggle('cpp-tools', opening);
    $('cpp-tools').setAttribute('aria-expanded', opening ? 'true' : 'false');
    $('cpp-tools').classList.toggle('on', opening);
    fitStage();
  });

  document.addEventListener('keydown', function (ev) {
    if (!S.open) return;
    if (ev.key === 'Escape') { ev.preventDefault(); closeModal(); return; }
    popupEnginePromise.then(function (popupEngine) {
      if (popupEngine.isTypingTarget(ev.target)) return;
      if (ev.key === 'ArrowLeft') { ev.preventDefault(); step(-1); }
      if (ev.key === 'ArrowRight') { ev.preventDefault(); step(1); }
    });
  });

  document.addEventListener('click', function (ev) {
    var opener = ev.target.closest && ev.target.closest('[data-cpp-open]');
    if (!opener) return;
    var index = Number(opener.getAttribute('data-cpp-open'));
    var data = window.MjolnirCardPreviewPopupData || {};
    openModal(data.cards || [], index, { defaultDirection: data.defaultDirection });
  });

  if (window.MjolnirCardPreviewPopupData && window.MjolnirCardPreviewPopupData.style) {
    setStyle(window.MjolnirCardPreviewPopupData.style);
  }
});

window.MjolnirCardPreviewPopup = {
  open: function (cards, index, options) { openModal(cards, index, options); },
  close: closeModal,
};
})();
`;
}
