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
import {
  clampDrawerWidth,
  clampDrawerHeight,
  isSheetLayout,
  wrapSelectionOrInsert,
  isEdited,
  currentFaceHtml,
  copyAllFacesText,
  editorSlotLabel,
  highlightHtmlTokens,
  buildClassesAndTagsRows,
  buildSymbolsRows,
} from "./cardPreviewDrawer.js";

const SCOPE = "cpp-root";

// card-preview-popup task group 6 (design.md §6) — the `operator_settings`
// key this file's popup preferences (device, theme, font size, default
// direction, drawer width/height/active tab/open) are stored under as ONE
// JSON object, read once at Cards-page render (server.js's "/mjolnir/cards"
// route) and written back debounced from the client. Exported so server.js
// reads the SAME key name it writes with no second literal to drift out of
// sync. Task group 5's Cards-view key (source/filters/sort/page
// size/page) is a SEPARATE key, left to that task group to name — see
// `getSetting`/`setSetting` in this file's client script.
export const CARD_PREVIEW_POPUP_SETTINGS_KEY = "cardPreviewPopup.prefs";

// Exposed so a Node test can assert the pure functions imported above are
// the ones this module actually wires up (no second copy pasted inline).
export const _engine = { defaultDirectionFor, directionSlots, stepIndex, occurrenceSummaryText, hasAOccurrence, resolveTapOutcome };
export const _drawerEngine = {
  clampDrawerWidth,
  clampDrawerHeight,
  isSheetLayout,
  wrapSelectionOrInsert,
  isEdited,
  currentFaceHtml,
  copyAllFacesText,
  editorSlotLabel,
  highlightHtmlTokens,
  buildClassesAndTagsRows,
  buildSymbolsRows,
};

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

/* task group 4 ("Tools drawer") — design.md §4 / acceptance C23-C28,
   mockup fidelity for .drawer/.resize/.tabs/.pane/.ed*/.palette/.cat/
   .sym*/.sizetag/.dtoast (mockups/card-preview-popup.html). Resizable by a
   handle (desktop width, bottom sheet height below ~760px) — the actual
   width/height are set inline via --cpp-dw/--cpp-dh (task 4.1's
   getDrawerState()/setDrawerState() contract, so task group 6 has a
   number to read/write, not a CSS rule to parse). */
.${SCOPE} .cpp-drawer { position: absolute; top: 0; right: 0; bottom: 0; width: var(--cpp-dw, 520px); background: var(--bg-elevated); border-left: 1px solid var(--border); display: flex; flex-direction: column; min-width: 0; }
.${SCOPE} .cpp-drawer[hidden] { display: none; }
.${SCOPE} .cpp-dialog.cpp-tools .cpp-stage { margin-right: var(--cpp-dw, 520px); }
.${SCOPE} .cpp-resize { position: absolute; z-index: 3; left: -5px; top: 0; bottom: 0; width: 10px; cursor: ew-resize; touch-action: none; }
.${SCOPE} .cpp-resize::after { content: ""; position: absolute; left: 4px; top: 50%; width: 3px; height: 44px; margin-top: -22px; border-radius: 3px; background: var(--border); }
.${SCOPE} .cpp-resize:hover::after, .${SCOPE} .cpp-resize:focus-visible::after, .${SCOPE} .cpp-dialog.cpp-dragging .cpp-resize::after { background: var(--accent); }
.${SCOPE} .cpp-resize:focus-visible { outline: none; }
.${SCOPE} .cpp-sizetag { position: absolute; z-index: 4; left: 12px; top: 50%; transform: translateY(-50%); font-size: 11.5px; background: var(--text); color: var(--bg-elevated); border-radius: 6px; padding: 3px 8px; white-space: nowrap; pointer-events: none; opacity: 0; transition: opacity .2s; }
.${SCOPE} .cpp-sizetag.cpp-on { opacity: 1; }
.${SCOPE} .cpp-dialog.cpp-dragging .cpp-drawer, .${SCOPE} .cpp-dialog.cpp-dragging .cpp-stage { transition: none; }
.${SCOPE} .cpp-dialog.cpp-dragging { user-select: none; }
.${SCOPE} .cpp-tabs { display: flex; gap: 2px; padding: 8px 10px 0; border-bottom: 1px solid var(--border); }
.${SCOPE} .cpp-tabs button { font: inherit; font-size: 13px; background: none; border: 0; border-bottom: 2px solid transparent; padding: 7px 10px; color: var(--text-faint); cursor: pointer; }
.${SCOPE} .cpp-tabs button.cpp-on { color: var(--text); border-bottom-color: var(--accent); font-weight: 600; }
.${SCOPE} .cpp-tabs button:focus-visible { outline: 2px solid var(--accent); }
.${SCOPE} .cpp-pane { flex: 1; overflow: auto; padding: 12px 14px 24px; min-width: 0; }
.${SCOPE} .cpp-pane[hidden] { display: none; }
.${SCOPE} .cpp-ctx { font-size: 12px; color: var(--text-dim); margin: 0 0 10px; }
.${SCOPE} .cpp-row-btns { display: flex; flex-wrap: wrap; gap: 6px; margin-bottom: 10px; }
.${SCOPE} .cpp-palette { display: flex; flex-wrap: wrap; gap: 5px; margin-bottom: 4px; }
.${SCOPE} .cpp-palette button { font: 12px var(--mono); padding: 3px 7px; border-radius: 6px; border: 1px solid var(--border); background: var(--bg); color: var(--text); cursor: pointer; }
.${SCOPE} .cpp-palette button:hover { border-color: var(--accent); }
.${SCOPE} .cpp-palette button i { font-style: normal; display: inline-block; width: 9px; height: 9px; border-radius: 2px; margin-right: 5px; vertical-align: 0; }
.${SCOPE} .cpp-hint { font-size: 12px; color: var(--text-dim); margin: 0 0 12px; }
.${SCOPE} .cpp-ed { margin-bottom: 14px; }
.${SCOPE} .cpp-ed-head { display: flex; align-items: center; gap: 8px; margin-bottom: 4px; font-size: 12.5px; flex-wrap: wrap; }
.${SCOPE} .cpp-ed-head b { font-family: var(--mono); }
.${SCOPE} .cpp-ed-head .cpp-sub { color: var(--text-dim); }
.${SCOPE} .cpp-ed-head .cpp-btn { margin-left: auto; font-size: 12px; padding: 2px 8px; }
.${SCOPE} .cpp-ed.cpp-active .cpp-edhost { border-color: var(--accent); }
.${SCOPE} .cpp-edhost { width: 100%; min-height: 64px; font: 12.5px/1.5 var(--mono); color: var(--text); background: var(--code-bg, var(--bg)); border: 1px solid var(--border); border-radius: 7px; padding: 6px 8px; white-space: pre-wrap; overflow-wrap: anywhere; outline: none; }
.${SCOPE} .cpp-tok-tag { color: var(--cpp-cm-tag, #1f5fbf); }
.${SCOPE} .cpp-tok-attr { color: var(--cpp-cm-attr, #8a4b00); }
.${SCOPE} .cpp-tok-string { color: var(--cpp-cm-str, #1d7f4e); }
.${SCOPE} .cpp-tok-bracket { color: var(--cpp-cm-br, #7a7f88); }
@media (prefers-color-scheme: dark) { .${SCOPE} { --cpp-cm-tag: #7aa2ff; --cpp-cm-attr: #f0b456; --cpp-cm-str: #5fcf95; --cpp-cm-br: #8a919b; } }
.${SCOPE} table.cpp-cat { border-collapse: collapse; width: 100%; font-size: 12.5px; }
.${SCOPE} table.cpp-cat th { text-align: left; font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-dim); font-weight: 600; padding: 6px 8px; border-bottom: 1px solid var(--border); white-space: nowrap; }
.${SCOPE} table.cpp-cat td { padding: 7px 8px; border-bottom: 1px solid var(--border); vertical-align: top; }
.${SCOPE} table.cpp-cat td.cpp-sel { font-family: var(--mono); white-space: nowrap; }
.${SCOPE} table.cpp-cat td.cpp-sel small { display: block; color: var(--text-faint); font-family: inherit; font-size: 11px; }
.${SCOPE} table.cpp-cat tr.cpp-grp td { background: var(--bg); font-weight: 600; font-size: 11.5px; color: var(--text-dim); text-transform: uppercase; letter-spacing: .05em; }
.${SCOPE} .cpp-tag-inf { display: inline-block; font-size: 10px; font-weight: 700; letter-spacing: .04em; text-transform: uppercase; padding: 0 5px; border-radius: 4px; background: var(--warn-soft); color: var(--warn); margin-left: 4px; vertical-align: 1px; }
.${SCOPE} .cpp-tag-bad { background: var(--err-soft); color: var(--err); }
.${SCOPE} .cpp-sample { border-radius: 6px; border: 1px solid var(--border); padding: 6px 8px; min-width: 96px; max-width: 220px; overflow: hidden; }
.${SCOPE} .cpp-glyph { font-size: 20px; text-align: center; }
.${SCOPE} .cpp-g-pop { font-family: 'Poppins-Regular', sans-serif; font-size: 20px; text-align: center; }
.${SCOPE} .cpp-g-ari { font-family: Arial, Arimo, 'Liberation Sans', sans-serif; font-size: 20px; text-align: center; }
.${SCOPE} .cpp-num { font-variant-numeric: tabular-nums; text-align: right; }
.${SCOPE} .cpp-note { font-size: 12px; color: var(--text-dim); margin: 10px 0 0; }
.${SCOPE} table.cpp-cat tr.cpp-copy { cursor: pointer; }
.${SCOPE} table.cpp-cat tr.cpp-copy:hover td, .${SCOPE} table.cpp-cat tr.cpp-copy:focus-visible td { background: var(--accent-soft); }
.${SCOPE} table.cpp-cat tr.cpp-copy:focus-visible { outline: 2px solid var(--accent); outline-offset: -2px; }
.${SCOPE} .cpp-dtoast { position: absolute; z-index: 5; left: 50%; bottom: 16px; transform: translate(-50%, 6px); background: var(--text); color: var(--bg-elevated); font-size: 12.5px; padding: 6px 12px; border-radius: 8px; opacity: 0; transition: opacity .2s, transform .2s; pointer-events: none; white-space: nowrap; max-width: 90%; overflow: hidden; text-overflow: ellipsis; }
.${SCOPE} .cpp-dtoast.cpp-on { opacity: 1; transform: translate(-50%, 0); }
@media (max-width: 760px) {
  .${SCOPE} .cpp-resize { left: 0; right: 0; top: -6px; bottom: auto; width: auto; height: 16px; cursor: ns-resize; }
  .${SCOPE} .cpp-resize::after { left: 50%; top: 6px; width: 44px; height: 3px; margin: 0 0 0 -22px; }
  .${SCOPE} .cpp-sizetag { left: 50%; top: 18px; transform: translateX(-50%); }
}

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
  .${SCOPE} .cpp-drawer { top: auto; left: 0; right: 0; width: 100%; height: var(--cpp-dh, 55%); border-left: 0; border-top: 1px solid var(--border); }
  .${SCOPE} .cpp-dialog.cpp-tools .cpp-stage { margin-right: 0; flex: 0 0 auto; height: auto; }
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
        <div class="cpp-resize" id="cpp-resize" role="separator" tabindex="0" aria-label="Resize tools panel (arrow keys)"></div>
        <span class="cpp-sizetag" id="cpp-sizetag"></span>
        <div class="cpp-dtoast" id="cpp-dtoast" role="status"></div>
        <div class="cpp-tabs" role="tablist">
          <button type="button" role="tab" class="cpp-on" data-tab="edit">Edit HTML</button>
          <button type="button" role="tab" data-tab="classes">Classes &amp; tags</button>
          <button type="button" role="tab" data-tab="symbols">Symbols</button>
        </div>
        <div class="cpp-pane" id="cpp-pane-edit">
          <div class="cpp-row-btns">
            <button class="cpp-btn" type="button" id="cpp-reset">Reset to minted card</button>
            <button class="cpp-btn" type="button" id="cpp-copy-all">Copy all (N, E, X)</button>
          </div>
          <div class="cpp-palette" id="cpp-palette"></div>
          <p class="cpp-hint">Snippets wrap the selection in the last editor you touched, or insert at the cursor.</p>
          <div id="cpp-editors"></div>
        </div>
        <div class="cpp-pane" id="cpp-pane-classes" hidden>
          <p class="cpp-ctx" id="cpp-cls-ctx"></p>
          <div style="overflow-x:auto"><table class="cpp-cat"><thead><tr><th>Selector</th><th>Resolves to</th><th>Sample</th></tr></thead><tbody id="cpp-cls-body"></tbody></table></div>
          <p class="cpp-note">Samples go through the same renderer as the card, on the theme's screen background. <span class="cpp-tag-inf">inferred</span> marks a value this research derived from RN/Android behaviour rather than read directly from the bundle.</p>
        </div>
        <div class="cpp-pane" id="cpp-pane-symbols" hidden>
          <p class="cpp-ctx">Counted across every N/E/X face of the stock cards. A dropped Poppins glyph shows as the browser's own fallback — the reason <code>arialFont</code>/<code>arialFontNormal</code> exist.</p>
          <div style="overflow-x:auto"><table class="cpp-cat"><thead><tr><th>Entity</th><th>Glyph</th><th>Name</th><th>Poppins</th><th>Arial</th><th>Uses</th></tr></thead><tbody id="cpp-sym-body"></tbody></table></div>
        </div>
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
// task group 4 (Tools drawer): resize-clamp/snippet-wrap/highlight/
// catalogue-row-building logic, the same isomorphic-engine pattern as the
// two imports above — see hub/src/cardPreviewDrawer.js's own header.
var drawerEnginePromise = import('/mjolnir/cards/drawer-engine.js');
var enginesPromise = Promise.all([renderEnginePromise, popupEnginePromise, drawerEnginePromise]);
var ENGINE = null, POPUP_ENGINE = null, DRAWER_ENGINE = null;
enginesPromise.then(function (mods) { ENGINE = mods[0]; POPUP_ENGINE = mods[1]; DRAWER_ENGINE = mods[2]; });

// --------------------------------------------------------------------
// Task group 6: operator settings (design.md §6, acceptance C37-C39)
// --------------------------------------------------------------------
//
// task 4.1/4.2's own note on this file said: "task 6 should replace
// sessionStorage calls with real server reads/writes and can listen for
// cardpreviewpopup:drawerchange instead of polling". This is that swap.
// getDrawerState()/setDrawerState() keep the exact same shape task group 4
// built them with — only what backs them changes.
//
// One settings row (CARD_PREVIEW_POPUP_SETTINGS_KEY, exported above so
// server.js reads/writes the identical key name) holds every popup
// preference as one JSON object: { device, theme, fontSize,
// defaultDirection, drawer: { open, width, height, tab } }. The INITIAL
// value is read synchronously off \`window.MjolnirCardPreviewPopupData.
// popupPrefs\` — server.js's "/mjolnir/cards" route already read it from
// \`operator_settings\` (via the same getAllSettings() the degrade-to-
// defaults logic in hub/src/operatorSettings.js backs) and baked it into
// the page, so there is no extra round trip before the popup can restore
// itself, and a database outage at PAGE LOAD already degraded to \`{}\`
// server-side (C39) — this file never has to special-case that itself.
// WRITES go over the wire, debounced, through the generic settings client
// below.
var POPUP_PREFS_KEY = '${CARD_PREVIEW_POPUP_SETTINGS_KEY}';
var bakedPopupPrefs = (window.MjolnirCardPreviewPopupData && window.MjolnirCardPreviewPopupData.popupPrefs) || {};

// ---- generic settings client -------------------------------------------
// Exposed on window.MjolnirOperatorSettings so task group 5 (the Cards-
// page view state: source/filters/sort/page size/page) or any later
// caller can persist its OWN keys without reinventing this file's fetch/
// debounce/degrade plumbing. This file's own popup-prefs code below is
// just one caller of it, for its own key (POPUP_PREFS_KEY) — it has no
// special access the generic pair doesn't.
//
//   window.MjolnirOperatorSettings.getSetting(key, defaultValue) -> Promise<value>
//     Resolves with the stored value, or defaultValue if the key was never
//     written OR the read degraded (network/server/database failure —
//     D157, this never rejects).
//   window.MjolnirOperatorSettings.setSetting(key, value)
//     Debounced (400ms): fire-and-forget, coalesces rapid changes (typing,
//     dragging) into one write. A failed write just doesn't stick — never
//     thrown, never retried into a storm.
var SETTINGS_ENDPOINT = '/mjolnir/api/settings';
var SETTINGS_DEBOUNCE_MS = 400;
var settingsCache = null;        // null until the first successful/failed load
var settingsCachePromise = null;
var settingsWriteTimers = {};    // key -> timeout id

function loadSettingsCache() {
  if (settingsCachePromise) return settingsCachePromise;
  settingsCachePromise = fetch(SETTINGS_ENDPOINT, { credentials: 'same-origin' })
    .then(function (r) { return r.ok ? r.json() : { settings: {} }; })
    .then(function (body) { settingsCache = (body && body.settings) || {}; return settingsCache; })
    .catch(function () { settingsCache = {}; return settingsCache; });
  return settingsCachePromise;
}

function getSetting(key, defaultValue) {
  return loadSettingsCache().then(function (cache) {
    return (cache && Object.prototype.hasOwnProperty.call(cache, key)) ? cache[key] : defaultValue;
  });
}

function setSetting(key, value) {
  // Optimistic local update so a getSetting() called right after this
  // resolves with the value just set, even before the debounced write
  // (or the initial load, if it hasn't resolved yet) completes.
  if (settingsCache) settingsCache[key] = value;
  else loadSettingsCache().then(function (cache) { cache[key] = value; });
  clearTimeout(settingsWriteTimers[key]);
  settingsWriteTimers[key] = setTimeout(function () {
    delete settingsWriteTimers[key];
    fetch(SETTINGS_ENDPOINT, {
      method: 'POST',
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ key: key, value: value }),
    }).catch(function () { /* D157: didn't stick this time; next change retries it */ });
  }, SETTINGS_DEBOUNCE_MS);
}

window.MjolnirOperatorSettings = { getSetting: getSetting, setSetting: setSetting };

// Seed the generic cache with what the page already baked in, so an
// early getSetting(POPUP_PREFS_KEY, ...) call (there isn't one today, but
// a future caller may want to read the SAME key this file writes) does
// not have to wait on a redundant fetch for a value already on the page.
settingsCachePromise = Promise.resolve(bakedPopupPrefs && Object.keys(bakedPopupPrefs).length
  ? (function () { var seed = {}; seed[POPUP_PREFS_KEY] = bakedPopupPrefs; settingsCache = seed; return seed; })()
  : (settingsCache = {}));

var S = {
  cards: [], index: 0, dir: 'N', open: false,
  device: (DEVICES.hasOwnProperty(bakedPopupPrefs.device) ? bakedPopupPrefs.device : '375x812'),
  theme: (bakedPopupPrefs.theme === 'light' || bakedPopupPrefs.theme === 'dark') ? bakedPopupPrefs.theme : 'dark',
  fontSize: typeof bakedPopupPrefs.fontSize === 'number' ? bakedPopupPrefs.fontSize : null,
  dirPref: ['auto', 'N', 'E'].indexOf(bakedPopupPrefs.defaultDirection) !== -1 ? bakedPopupPrefs.defaultDirection : 'auto',
  onClose: null, lastFocus: null,
  // task 4.1/4.2: edits are keyed by card.key, never persisted/sent
  // anywhere (acceptance C26) — purely client-side, gone on reload/Reset.
  edits: {},
  drawer: loadDrawerState(),
  activeEditorFace: 'N',
};
var style = null; // extractor output, set once by setStyle()
var symbolsData = null;
var usageData = null;
var toastTimer = null;
var dtoastTimer = null;
var editTimer = null;

function loadDrawerState() {
  var def = { open: false, width: 520, height: 0, tab: 'edit' };
  var saved = bakedPopupPrefs.drawer;
  if (!saved || typeof saved !== 'object') return def;
  return {
    open: !!saved.open,
    width: typeof saved.width === 'number' ? saved.width : def.width,
    height: typeof saved.height === 'number' ? saved.height : def.height,
    tab: ['edit', 'classes', 'symbols'].indexOf(saved.tab) !== -1 ? saved.tab : def.tab,
  };
}

// Gathers every popup preference this task group owns into the one
// object stored under POPUP_PREFS_KEY, and debounce-writes it. Called on
// every control change (device/theme/font/default-direction) AND on
// every drawer change, so one key always reflects the operator's current
// picks rather than the drawer alone.
function savePopupPrefs() {
  setSetting(POPUP_PREFS_KEY, {
    device: S.device,
    theme: S.theme,
    fontSize: S.fontSize,
    defaultDirection: S.dirPref,
    drawer: { open: S.drawer.open, width: S.drawer.width, height: S.drawer.height, tab: S.drawer.tab },
  });
}

// task 4.1's explicit contract, unchanged by this task group: "expose/
// accept its current size". Width/height here are whatever the operator
// last dragged them to, independent of desktop vs. sheet layout (only one
// of the two is visually in effect at a time, per the ~760px breakpoint,
// but both are remembered).
function getDrawerState() {
  return { open: S.drawer.open, width: S.drawer.width, height: S.drawer.height, tab: S.drawer.tab };
}

function setDrawerState(patch) {
  Object.assign(S.drawer, patch || {});
  enginesPromise.then(function (mods) { applyDrawerSize(mods[2]); });
  if (patch && patch.open !== undefined) applyDrawerOpen(S.drawer.open);
  if (patch && patch.tab !== undefined) setDrawerTab(S.drawer.tab);
  savePopupPrefs();
}

function $(id) { return document.getElementById(id); }
function esc(s) { return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) { return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]; }); }
function dev() { return DEVICES[S.device] || DEVICES['375x812']; }
function card() { return S.cards[S.index] || null; }

function setStyle(s) { style = s; if (S.fontSize == null && s) S.fontSize = s.fontSizeControl.default; }

function applyPreviewData(data) {
  if (!data) return;
  if (data.style) setStyle(data.style);
  if (data.symbols) symbolsData = data.symbols;
  if (data.usage) usageData = data.usage;
}

function renderInfoAndCard(engine, popupEngine, drawerEngine) {
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
  // Fix 3 (card-preview-popup): the margin AROUND the card (the stage, not
  // just the small screen box sized to the card) must show the theme's
  // screen colour too, not .cpp-dialog's console-panel background — set on
  // every theme/device change, same point #cpp-screen's background is set.
  var stageEl = $('cpp-stage');
  if (stageEl) stageEl.style.background = theme.background;

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
    var html = drawerEngine ? drawerEngine.currentFaceHtml(c, S.edits[c.key], letter) : (letter === 'N' ? c.N : letter === 'E' ? c.E : c.X);
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
  enginesPromise.then(function (mods) {
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
  enginesPromise.then(function (mods) {
    var engine = mods[0], popupEngine = mods[1], drawerEngine = mods[2];
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
    renderInfoAndCard(engine, popupEngine, drawerEngine);
    loadEditors(drawerEngine);
    markEdited(drawerEngine);
  });
}

function setDirection(dir) {
  S.dir = dir;
  syncDir();
  enginesPromise.then(function (mods) { renderInfoAndCard(mods[0], mods[1], mods[2]); loadEditors(mods[2]); });
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
  if (!style) applyPreviewData(window.MjolnirCardPreviewPopupData);
  var opts = options || {};
  S.cards = cards || [];
  S.index = Math.max(0, Math.min(index || 0, S.cards.length - 1));
  // Fix 4 (card-preview-popup): only override the live in-session
  // preference when a caller explicitly passes one — otherwise leave
  // S.dirPref as the operator's current pick (initialized from the baked
  // server-side preference, or changed live via the #cpp-dirpref select)
  // so a popup close/reopen doesn't clobber it back to 'auto'.
  if (opts.defaultDirection) S.dirPref = opts.defaultDirection;
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

// --------------------------------------------------------------------
// Task group 4: Tools drawer
// --------------------------------------------------------------------

// 4.1 open/close + resize ----------------------------------------------

function applyDrawerOpen(open) {
  var drawer = $('cpp-drawer');
  var dialog = $('cpp-dialog');
  drawer.hidden = !open;
  dialog.classList.toggle('cpp-tools', open);
  $('cpp-tools').setAttribute('aria-expanded', open ? 'true' : 'false');
  $('cpp-tools').classList.toggle('on', open);
  applyDrawerSize(DRAWER_ENGINE);
  fitStage();
  if (open) { if (DRAWER_ENGINE) { loadEditors(DRAWER_ENGINE); renderClasses(DRAWER_ENGINE); renderSymbols(DRAWER_ENGINE); } }
}

function applyDrawerSize(drawerEngine) {
  if (!drawerEngine) return;
  var dialog = $('cpp-dialog');
  var dbody = $('cpp-dbody');
  var sheet = drawerEngine.isSheetLayout(window.innerWidth);
  S.drawer.width = drawerEngine.clampDrawerWidth(S.drawer.width, dialog.clientWidth || 1000);
  S.drawer.height = drawerEngine.clampDrawerHeight(S.drawer.height || (dbody.clientHeight || 600) * 0.55, dbody.clientHeight || 600);
  dialog.style.setProperty('--cpp-dw', S.drawer.width + 'px');
  dialog.style.setProperty('--cpp-dh', S.drawer.height + 'px');
}

function showSizeTag(remembered) {
  var t = $('cpp-sizetag');
  var sheet = DRAWER_ENGINE && DRAWER_ENGINE.isSheetLayout(window.innerWidth);
  t.textContent = (sheet ? S.drawer.height + ' px tall' : S.drawer.width + ' px wide') + (remembered ? ' · remembered' : '');
  t.classList.add('cpp-on');
  clearTimeout(S._sizeTagTimer);
  if (remembered) S._sizeTagTimer = setTimeout(function () { t.classList.remove('cpp-on'); }, 1600);
}

function wireResize() {
  var handle = $('cpp-resize');
  var dragging = false;
  handle.addEventListener('pointerdown', function (e) {
    dragging = true;
    handle.setPointerCapture(e.pointerId);
    $('cpp-dialog').classList.add('cpp-dragging');
    e.preventDefault();
  });
  handle.addEventListener('pointermove', function (e) {
    if (!dragging || !DRAWER_ENGINE) return;
    var sheet = DRAWER_ENGINE.isSheetLayout(window.innerWidth);
    if (sheet) S.drawer.height = $('cpp-dbody').getBoundingClientRect().bottom - e.clientY;
    else S.drawer.width = $('cpp-dialog').getBoundingClientRect().right - e.clientX;
    applyDrawerSize(DRAWER_ENGINE);
    fitStage(); // 4.1: the card stage refits LIVE while dragging
    showSizeTag(false);
  });
  function endDrag() {
    if (!dragging) return;
    dragging = false;
    $('cpp-dialog').classList.remove('cpp-dragging');
    savePopupPrefs();
    showSizeTag(true);
  }
  handle.addEventListener('pointerup', endDrag);
  handle.addEventListener('pointercancel', endDrag);
  handle.addEventListener('keydown', function (e) {
    if (!DRAWER_ENGINE) return;
    var sheet = DRAWER_ENGINE.isSheetLayout(window.innerWidth);
    var step = DRAWER_ENGINE.DRAWER_ARROW_STEP;
    var grow = sheet ? { ArrowUp: step, ArrowDown: -step } : { ArrowLeft: step, ArrowRight: -step };
    if (!(e.key in grow)) return;
    e.preventDefault();
    if (sheet) S.drawer.height += grow[e.key]; else S.drawer.width += grow[e.key];
    applyDrawerSize(DRAWER_ENGINE);
    fitStage();
    savePopupPrefs();
    showSizeTag(true);
  });
  window.addEventListener('resize', function () { if (S.open) applyDrawerSize(DRAWER_ENGINE); });
}

// 4.1 tabs ---------------------------------------------------------------

function setDrawerTab(tab) {
  S.drawer.tab = tab;
  document.querySelectorAll('.cpp-tabs button').forEach(function (b) { b.classList.toggle('cpp-on', b.dataset.tab === tab); });
  ['edit', 'classes', 'symbols'].forEach(function (t) { $('cpp-pane-' + t).hidden = t !== tab; });
  if (tab === 'classes' && DRAWER_ENGINE) renderClasses(DRAWER_ENGINE);
  if (tab === 'symbols' && DRAWER_ENGINE) renderSymbols(DRAWER_ENGINE);
}

function wireTabs() {
  document.querySelectorAll('.cpp-tabs button').forEach(function (b) {
    b.addEventListener('click', function () { setDrawerTab(b.dataset.tab); savePopupPrefs(); });
  });
}

// 4.2 editors --------------------------------------------------------

var editors = []; // [{ face, el, head }]

function caretOffset(el) {
  var sel = window.getSelection();
  if (!sel.rangeCount || !el.contains(sel.anchorNode)) return null;
  var range = sel.getRangeAt(0).cloneRange();
  range.selectNodeContents(el);
  range.setEnd(sel.anchorNode, sel.anchorOffset);
  return range.toString().length;
}

function setCaretOffset(el, offset) {
  var remaining = offset;
  var node = null, nodeOffset = 0;
  (function walk(n) {
    if (remaining < 0) return;
    if (n.nodeType === 3) {
      if (n.textContent.length >= remaining) { node = n; nodeOffset = remaining; remaining = -1; return; }
      remaining -= n.textContent.length;
    } else {
      for (var i = 0; i < n.childNodes.length && remaining >= 0; i++) walk(n.childNodes[i]);
    }
  })(el);
  if (!node) { node = el; nodeOffset = el.childNodes.length; }
  var range = document.createRange();
  range.setStart(node, nodeOffset);
  range.collapse(true);
  var sel = window.getSelection();
  sel.removeAllRanges();
  sel.addRange(range);
}

function paintEditor(ed, drawerEngine) {
  var text = ed.el.textContent;
  var tokens = drawerEngine.highlightHtmlTokens(text);
  var caret = document.activeElement === ed.el ? caretOffset(ed.el) : null;
  ed.el.innerHTML = tokens.map(function (t) {
    if (t.kind === 'text') return esc(t.text);
    var cls = t.kind === 'tag' ? 'cpp-tok-tag' : t.kind === 'attr' ? 'cpp-tok-attr' : t.kind === 'string' ? 'cpp-tok-string' : 'cpp-tok-bracket';
    return '<span class="' + cls + '">' + esc(t.text) + '</span>';
  }).join('') || '​';
  if (caret != null) setCaretOffset(ed.el, caret);
}

function buildEditors(drawerEngine) {
  var host = $('cpp-editors');
  host.innerHTML = '';
  editors = [];
  ['N', 'E', 'X'].forEach(function (face) {
    var box = document.createElement('div');
    box.className = 'cpp-ed';
    box.innerHTML =
      '<div class="cpp-ed-head"><b>' + face + '</b><span class="cpp-sub" data-slot></span><span class="cpp-sub" data-aud></span>' +
      '<button class="cpp-btn" type="button" data-copyface>Copy HTML</button></div>' +
      '<div class="cpp-edhost" contenteditable="true" spellcheck="false" data-face="' + face + '"></div>';
    host.appendChild(box);
    var el = box.querySelector('.cpp-edhost');
    var ed = { face: face, el: el, box: box };
    el.addEventListener('focus', function () { setActiveEditor(face); });
    el.addEventListener('input', function () { onEdit(ed); });
    box.querySelector('[data-copyface]').addEventListener('click', function (ev) { copyText(el.textContent, ev.currentTarget); });
    editors.push(ed);
  });
  setActiveEditor('N');
}

function setActiveEditor(face) {
  S.activeEditorFace = face;
  editors.forEach(function (ed) { ed.box.classList.toggle('cpp-active', ed.face === face); });
}

function loadEditors(drawerEngine) {
  var c = card();
  if (!c) return;
  var slots = POPUP_ENGINE.directionSlots(S.dir);
  editors.forEach(function (ed) {
    var current = drawerEngine.currentFaceHtml(c, S.edits[c.key], ed.face);
    if (ed.el.textContent !== current) { ed.el.textContent = current; paintEditor(ed, drawerEngine); }
    ed.box.querySelector('[data-slot]').textContent = drawerEngine.editorSlotLabel(slots, ed.face);
    ed.box.querySelector('[data-aud]').textContent = c.A === ed.face ? '· carries audio (A)' : '';
  });
}

function onEdit(ed) {
  if (!DRAWER_ENGINE) return;
  var c = card();
  if (!c) return;
  (S.edits[c.key] = S.edits[c.key] || {})[ed.face] = ed.el.textContent;
  markEdited(DRAWER_ENGINE);
  paintEditor(ed, DRAWER_ENGINE);
  clearTimeout(editTimer);
  // design §4 "live re-render"; acceptance C25 "within a second" — a
  // light debounce so fast typing doesn't re-render on every keystroke.
  editTimer = setTimeout(function () { if (ENGINE && POPUP_ENGINE) renderInfoAndCard(ENGINE, POPUP_ENGINE, DRAWER_ENGINE); }, 200);
}

function markEdited(drawerEngine) {
  var c = card();
  var edited = c && drawerEngine.isEdited(c, S.edits[c.key]);
  $('cpp-edited').hidden = !edited;
}

function resetCard() {
  var c = card();
  if (!c || !DRAWER_ENGINE) return;
  delete S.edits[c.key];
  loadEditors(DRAWER_ENGINE);
  renderInfoAndCard(ENGINE, POPUP_ENGINE, DRAWER_ENGINE);
  markEdited(DRAWER_ENGINE);
}

function copyText(text, btn) {
  var done = function () {
    var original = btn.textContent;
    btn.textContent = 'Copied';
    setTimeout(function () { btn.textContent = original; }, 1100);
  };
  var fallback = function () {
    var ta = document.createElement('textarea');
    ta.value = text;
    ta.style.cssText = 'position:fixed;left:-9999px';
    document.body.appendChild(ta);
    ta.select();
    try { document.execCommand('copy'); done(); } catch (e) { btn.textContent = 'Select and copy manually'; }
    ta.remove();
  };
  try { navigator.clipboard.writeText(text).then(done, fallback); } catch (e) { fallback(); }
}

function buildPalette(drawerEngine) {
  var pal = $('cpp-palette');
  pal.innerHTML = '';
  drawerEngine.SNIPPET_PALETTE.forEach(function (snippet) {
    var b = document.createElement('button');
    b.type = 'button';
    b.innerHTML = (snippet.swatch ? '<i style="background:' + snippet.swatch + '"></i>' : '') + esc(snippet.label);
    b.title = snippet.open + '…' + snippet.close;
    b.addEventListener('mousedown', function (e) { e.preventDefault(); }); // keep the editor's selection
    b.addEventListener('click', function () {
      var ed = editors[editors.findIndex(function (e) { return e.face === S.activeEditorFace; })] || editors[0];
      if (!ed) return;
      var offset = document.activeElement === ed.el ? caretOffset(ed.el) : null;
      var start = offset != null ? offset : ed.el.textContent.length;
      var end = start;
      var sel = window.getSelection();
      if (document.activeElement === ed.el && sel.rangeCount && !sel.getRangeAt(0).collapsed) {
        end = start + sel.toString().length;
      }
      var result = drawerEngine.wrapSelectionOrInsert(ed.el.textContent, start, end, snippet.open, snippet.close);
      ed.el.textContent = result.value;
      paintEditor(ed, DRAWER_ENGINE);
      setCaretOffset(ed.el, result.selectionStart);
      ed.el.focus();
      onEdit(ed);
    });
    pal.appendChild(b);
  });
}

// 4.3 Classes & tags ---------------------------------------------------

function renderClasses(drawerEngine) {
  if (!style || !ENGINE) return;
  var d = dev();
  var state = { width: d.w, height: d.h, tablet: d.tablet, theme: S.theme, fontSize: S.fontSize };
  var normalizeFn = function (v, w, h, t) { return ENGINE.normalize(v, w, h, t); };
  $('cpp-cls-ctx').textContent =
    'Resolved at ' + d.w + ' × ' + d.h + (d.tablet ? ' tablet' : '') + ', font ' + S.fontSize + ', ' + S.theme +
    ' theme (normalize ×' + ENGINE.normalizeFactor(d.w, d.h, d.tablet).toFixed(3) + '). Change the controls above to recompute.';
  var rows = drawerEngine.buildClassesAndTagsRows(style, usageData, state, normalizeFn);
  var body = $('cpp-cls-body');
  body.innerHTML = '';
  rows.forEach(function (r) {
    var tr = document.createElement('tr');
    if (r.group) { tr.className = 'cpp-grp'; tr.innerHTML = '<td colspan="3">' + esc(r.group) + '</td>'; body.appendChild(tr); return; }
    var flagsHtml = (r.flags || []).map(function (f) { return '<span class="cpp-tag-inf' + (f === 'inferred' ? '' : ' cpp-tag-bad') + '">' + esc(f) + '</span>'; }).join(' ');
    var useLbl = r.usage != null ? '<small>' + r.usage.toLocaleString('en') + '× in stock</small>' : '';
    if (r.copyText) { tr.className = 'cpp-copy'; tr.tabIndex = 0; tr.dataset.copy = r.copyText; tr.title = 'Click to copy ' + r.copyText; }
    tr.innerHTML = '<td class="cpp-sel">' + esc(r.selector) + useLbl + '</td><td>' + esc(r.resolvesTo) + ' ' + flagsHtml + '</td><td></td>';
    if (r.sampleHtml) {
      var box = document.createElement('div');
      box.className = 'cpp-sample';
      box.style.background = style.themes[S.theme].background;
      var rendered = ENGINE.renderCardFace(r.sampleHtml, style, { fontSize: S.fontSize, width: d.w, height: d.h, tablet: d.tablet, theme: S.theme });
      box.innerHTML = rendered.html;
      tr.lastChild.appendChild(box);
    }
    body.appendChild(tr);
  });
}

// 4.4 Symbols -----------------------------------------------------------

function renderSymbols(drawerEngine) {
  if (!symbolsData) return;
  var rows = drawerEngine.buildSymbolsRows(symbolsData);
  $('cpp-sym-body').innerHTML = rows.map(function (r) {
    if (r.group) return '<tr class="cpp-grp"><td colspan="6">' + esc(r.group) + '</td></tr>';
    return '<tr class="cpp-copy" tabindex="0" title="Click to copy" data-copy="' + esc(r.copyText) + '">' +
      '<td class="cpp-sel">' + esc(r.entity) + '</td>' +
      '<td class="cpp-glyph">' + esc(r.glyph) + '</td>' +
      '<td>' + esc(r.name) + '</td>' +
      '<td class="cpp-g-pop">' + esc(r.glyph) + '</td>' +
      '<td class="cpp-g-ari">' + esc(r.glyph) + '</td>' +
      '<td class="cpp-num">' + r.uses.toLocaleString('en') + '</td></tr>';
  }).join('');
}

// 4.5 click/Enter-to-copy on the two catalogue tables --------------------

function showCopyToast(text) {
  var t = $('cpp-dtoast');
  t.innerHTML = 'Copied <code>' + esc(text) + '</code>';
  t.classList.add('cpp-on');
  clearTimeout(dtoastTimer);
  dtoastTimer = setTimeout(function () { t.classList.remove('cpp-on'); }, 1400);
}

function rowCopy(ev) {
  var tr = ev.target.closest && ev.target.closest('tr.cpp-copy');
  if (!tr) return;
  if (ev.type === 'keydown') { if (ev.key !== 'Enter') return; ev.preventDefault(); }
  var text = tr.dataset.copy;
  var ok = function () { tr.classList.remove('cpp-copied'); void tr.offsetWidth; tr.classList.add('cpp-copied'); showCopyToast(text); };
  var fallback = function () {
    var ta = document.createElement('textarea');
    ta.value = text;
    ta.style.cssText = 'position:fixed;left:-9999px';
    document.body.appendChild(ta);
    ta.select();
    try { document.execCommand('copy'); ok(); } catch (e) { showCopyToast('failed — select it manually: ' + text); }
    ta.remove();
  };
  try { navigator.clipboard.writeText(text).then(ok, fallback); } catch (e) { fallback(); }
}

function wireDrawer(mods) {
  var drawerEngine = mods[2];
  buildEditors(drawerEngine);
  buildPalette(drawerEngine);
  wireTabs();
  wireResize();
  $('cpp-reset').addEventListener('click', resetCard);
  $('cpp-copy-all').addEventListener('click', function (ev) {
    var c = card();
    var faces = { N: drawerEngine.currentFaceHtml(c, S.edits[c.key], 'N'), E: drawerEngine.currentFaceHtml(c, S.edits[c.key], 'E'), X: drawerEngine.currentFaceHtml(c, S.edits[c.key], 'X') };
    copyText(drawerEngine.copyAllFacesText(faces), ev.currentTarget);
  });
  $('cpp-cls-body').addEventListener('click', rowCopy);
  $('cpp-cls-body').addEventListener('keydown', rowCopy);
  $('cpp-sym-body').addEventListener('click', rowCopy);
  $('cpp-sym-body').addEventListener('keydown', rowCopy);
  setDrawerTab(S.drawer.tab);
  applyDrawerOpen(S.drawer.open);
}

document.addEventListener('DOMContentLoaded', function () {
  if (!$('cpp-modal')) return;

  enginesPromise.then(function (mods) {
    document.getElementById('cpp-device').addEventListener('change', function (e) {
      S.device = e.target.value;
      renderInfoAndCard(mods[0], mods[1], mods[2]);
      renderClasses(mods[2]);
      savePopupPrefs();
    });
    document.getElementById('cpp-theme').addEventListener('click', function (e) {
      var b = e.target.closest('button');
      if (!b) return;
      S.theme = b.dataset.t;
      document.getElementById('cpp-theme').querySelectorAll('button').forEach(function (x) { x.classList.toggle('on', x === b); });
      renderInfoAndCard(mods[0], mods[1], mods[2]);
      renderClasses(mods[2]);
      savePopupPrefs();
    });
    document.getElementById('cpp-fs-dec').addEventListener('click', function () { setFontSize(S.fontSize - 1, mods); });
    document.getElementById('cpp-fs-inc').addEventListener('click', function () { setFontSize(S.fontSize + 1, mods); });
    // task group 6: the device select, theme buttons and font stepper are
    // all inside this popup's markup, which exists in the DOM regardless
    // of whether the modal has ever been opened — so the restored device/
    // theme/font-size picked up from the baked-in settings (S's initial
    // values, set above before this closure ran) are reflected in the
    // controls themselves as soon as the engines (and so the style data,
    // via applyPreviewData below) are ready, not only once the operator
    // opens a card.
    applyInitialPrefsToControls();
    wireDrawer(mods);
  });

  function applyInitialPrefsToControls() {
    var deviceSelect = document.getElementById('cpp-device');
    if (deviceSelect && DEVICES.hasOwnProperty(S.device)) deviceSelect.value = S.device;
    document.getElementById('cpp-theme').querySelectorAll('button').forEach(function (b) {
      b.classList.toggle('on', b.dataset.t === S.theme);
    });
    // The default-direction picker is normally set per-open in openModal()
    // from the server-baked defaultDirection field (already the persisted
    // value — see server.js's cpp-data block). Reflecting it here too
    // means the control shows the restored pick even before any card is
    // opened, for consistency with the device/theme/font controls above.
    var dirPrefSelect = $('cpp-dirpref');
    if (dirPrefSelect && bakedPopupPrefs.defaultDirection) dirPrefSelect.value = bakedPopupPrefs.defaultDirection;
    if (style) {
      if (S.fontSize == null) S.fontSize = style.fontSizeControl.default;
      S.fontSize = Math.max(style.fontSizeControl.min, Math.min(style.fontSizeControl.max, S.fontSize));
      document.getElementById('cpp-fs').textContent = S.fontSize;
      document.getElementById('cpp-fs-dec').disabled = S.fontSize <= style.fontSizeControl.min;
      document.getElementById('cpp-fs-inc').disabled = S.fontSize >= style.fontSizeControl.max;
    }
  }

  function setFontSize(v, mods) {
    if (!style) return;
    S.fontSize = Math.max(style.fontSizeControl.min, Math.min(style.fontSizeControl.max, v));
    document.getElementById('cpp-fs').textContent = S.fontSize;
    document.getElementById('cpp-fs-dec').disabled = S.fontSize <= style.fontSizeControl.min;
    document.getElementById('cpp-fs-inc').disabled = S.fontSize >= style.fontSizeControl.max;
    renderInfoAndCard(mods[0], mods[1], mods[2]);
    renderClasses(mods[2]);
    savePopupPrefs();
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
    savePopupPrefs();
  });
  $('cpp-tools').addEventListener('click', function () {
    setDrawerState({ open: $('cpp-drawer').hidden });
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
    // Fix 4 (card-preview-popup): do NOT pass the page-load-time snapshot's
    // defaultDirection here — it goes stale the moment the operator changes
    // the picker in-session. Leaving the key out lets openModal() fall
    // through to the current S.dirPref.
    openModal(data.cards || [], index, {});
  });

  if (!style) applyPreviewData(window.MjolnirCardPreviewPopupData);
});

window.MjolnirCardPreviewPopup = {
  open: function (cards, index, options) { openModal(cards, index, options); },
  close: closeModal,
};
})();
`;
}
