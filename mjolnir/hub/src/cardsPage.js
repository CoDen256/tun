// card-preview-popup task group 5 — "The Cards page" (design.md §5, tasks
// 5.1-5.7, acceptance C29-C36, C40).
//
// REPLACES the per-deck accordion page (hub/src/cardPreview.js, now
// deleted) with one flat table. Filtering/sorting/pagination happen
// CLIENT-SIDE, in the browser, over ONE server round trip's worth of data
// for whichever source is active (decided here, not in design.md, which
// left it tier 2): the dataset is dozens to a few hundred cards, hub
// serves plain JS pages with no client framework already (task groups 2-4
// established that pattern for the popup/drawer), and client-side
// filtering is what makes acceptance C30 ("no per-row preview payload, one
// copy of the renderer data") trivially true — there is no PER-ROW markup
// to carry at all, only the plain data every row needs regardless of
// which page/filter it ends up under. Only SWITCHING SOURCE (Minted vs. a
// published build) round-trips the server, because that is the one thing
// that changes which rows exist to filter in the first place — and it is
// already a real navigation (`?source=...`) so the chosen source persists
// via `cardsPage.view` (operator_settings) with no extra plumbing.
//
// Settings key: "cardsPage.view", one JSON object — { source, filters:
// { search, scope, decks, occ:{N,E,A}, xEmpty, ipa, rule, missing, cls },
// sort: { key, desc }, pageSize, page }. Read via getAllSettings() the same
// way task group 6's popup prefs are (D157 degrade baked in there, not
// re-implemented here); written via the existing generic
// window.MjolnirOperatorSettings client (cardPreviewPopup.js) — this page
// introduces no new settings endpoint.
import fs from "node:fs";
import path from "node:path";
import { escapeHtml } from "./layout.js";
import { stripHtml } from "./cards.js";
import { parseCardHtml } from "./cardRenderer.js";
import { occurrenceTip } from "./cardPreviewEngine.js";
import { nextMultipleOf5, shipOrderForDeck } from "../../builder/src/cardFlow.js";
import { loadBundleRows } from "./cardsBundleSource.js";
import {
  SEARCH_SCOPES,
  SORT_KEYS,
  PAGE_SIZES,
  OCCURRENCE_LETTERS,
} from "./cardsPageEngine.js";

export const CARDS_PAGE_SETTINGS_KEY = "cardsPage.view";

export const BUILD_ID_PATTERN = /^b[0-9]{6}$/;

// --------------------------------------------------------------------------
// Data assembly — Minted (hub ledger)
// --------------------------------------------------------------------------

function collectClasses(...htmls) {
  const set = new Set();
  const walk = (node) => {
    if (!node) return;
    if (node.type === "element") for (const c of node.classes || []) set.add(c);
    for (const child of node.children || []) walk(child);
  };
  for (const html of htmls) walk(parseCardHtml(html || ""));
  return [...set];
}

// Reuses builder's own flush/held rule (builder/src/cardFlow.js's
// `nextMultipleOf5`) and its own real occurrence order
// (`shipOrderForDeck`) — never a second "multiple of 5" computed here.
// `shipOrderForDeck`'s staged list is already FIFO by id, the exact order
// a real flush run would consume; the first `need` of it are what would
// flush right now, matching builder-ship-strips' own `wouldFlushCount`
// derivation for the no-forecast case (nothing new minted/staged this
// request — just "what does the deck currently hold").
// Pure (no pool, no I/O) so it is unit-testable on its own: given a deck's
// current shipped count and how many rows it currently holds staged (in
// FIFO order), how many of those staged rows would flush right now.
// `need` is always 1-5 (builder/src/cardFlow.js's own invariant); the
// first `need` staged rows are the ones a flush run would ship next, the
// rest are held.
export function flushHeldSplit(shippedCount, stagedCount) {
  const need = nextMultipleOf5(shippedCount) - shippedCount;
  return Math.min(stagedCount, need);
}

async function occurrencesByDeck(pool, deckCodes) {
  const occByCard = new Map();
  for (const deckCode of deckCodes) {
    const order = await shipOrderForDeck(pool, deckCode);
    const shippedCount = order.shipped.length;
    const flushCount = flushHeldSplit(shippedCount, order.staged.length);
    for (const s of order.shipped) {
      if (!occByCard.has(s.cardId)) occByCard.set(s.cardId, []);
      occByCard.get(s.cardId).push({ letter: s.letter, status: "shipped", buildId: s.buildId, shippedAt: s.shippedAt });
    }
    order.staged.forEach((s, i) => {
      if (!occByCard.has(s.cardId)) occByCard.set(s.cardId, []);
      occByCard.get(s.cardId).push({ letter: s.letter, status: "staged", flushing: i < flushCount });
    });
  }
  return occByCard;
}

function hrefFor(stabburUiBase, kind, id) {
  if (!stabburUiBase || !id) return null;
  return `${stabburUiBase}#/${kind}/${encodeURIComponent(id)}`;
}

// Every card in `card_slots`, with ledger state (design.md §5 "Minted").
export async function mintedRows(pool, { dataDir, stabburUiBase } = {}) {
  const { rows: slots } = await pool.query(
    `SELECT cs.id, cs.deck_code, cs.note_id, cs.grammar_rule_id, cs.audio_sha256, d.title AS deck_title
     FROM card_slots cs JOIN decks d ON d.code = cs.deck_code
     ORDER BY cs.id`
  );
  if (slots.length === 0) return [];

  const cardIds = slots.map((s) => s.id);
  const [{ rows: contentRows }, { rows: mintedAtRows }, { rows: pendingRows }] = await Promise.all([
    pool.query("SELECT card_id, n, e, x, a FROM card_content WHERE card_id = ANY($1)", [cardIds]),
    pool.query("SELECT card_slot_id, minted_at FROM minted_notes WHERE card_slot_id = ANY($1)", [cardIds]),
    pool.query("SELECT card_id, letter, remaining FROM pending_occurrences WHERE card_id = ANY($1)", [cardIds]),
  ]);
  const contentByCard = new Map(contentRows.map((r) => [r.card_id, r]));
  const mintedAtByCard = new Map(mintedAtRows.map((r) => [r.card_slot_id, new Date(r.minted_at).getTime()]));

  const deckCodes = [...new Set(slots.map((s) => s.deck_code))];
  const occByCard = await occurrencesByDeck(pool, deckCodes);
  for (const r of pendingRows) {
    if (!occByCard.has(r.card_id)) occByCard.set(r.card_id, []);
    occByCard.get(r.card_id).push({ letter: r.letter, status: "pending", remaining: r.remaining });
  }

  return slots.map((s) => {
    const content = contentByCard.get(s.id);
    const N = content?.n ?? "";
    const E = content?.e ?? "";
    const X = content?.x ?? "";
    const A = content?.a ?? "N";
    const occurrences = (occByCard.get(s.id) || []).map((o) => ({ ...o, tip: occurrenceTip(o) }));
    const shippedTimes = occurrences.filter((o) => o.status === "shipped" && o.shippedAt).map((o) => new Date(o.shippedAt).getTime());
    const pendingVals = occurrences.filter((o) => o.status === "pending" && o.remaining != null).map((o) => o.remaining);
    const hasAudioFile = !!(s.audio_sha256 && dataDir && fs.existsSync(path.join(dataDir, "blob", s.audio_sha256)));
    return {
      key: s.id,
      id: s.id,
      deckCode: s.deck_code,
      deckTitle: s.deck_title,
      D: s.deck_title,
      N,
      E,
      X,
      A,
      pN: stripHtml(N),
      pE: stripHtml(E),
      pX: stripHtml(X),
      rawHtml: `${N} ${E} ${X}`,
      classes: collectClasses(N, E, X),
      occurrences,
      noteId: s.note_id,
      grammarRuleId: s.grammar_rule_id,
      noteHref: hrefFor(stabburUiBase, "notes", s.note_id),
      ruleHref: hrefFor(stabburUiBase, "grammar", s.grammar_rule_id),
      audioUrl: `/mjolnir/cards/${encodeURIComponent(s.id)}/audio`,
      audioAvailable: hasAudioFile,
      hasAudio: !!s.audio_sha256,
      audioMissing: !!s.audio_sha256 && !hasAudioFile,
      mintedAt: mintedAtByCard.has(s.id) ? mintedAtByCard.get(s.id) : null,
      lastShippedAt: shippedTimes.length ? Math.max(...shippedTimes) : null,
      pendingMin: pendingVals.length ? Math.min(...pendingVals) : null,
      isHubMinted: true,
    };
  });
}

// --------------------------------------------------------------------------
// Data assembly — Bundle bNN
// --------------------------------------------------------------------------

// Cross-references the bundle's own card ids against `card_slots` for the
// hub-minted dot and the note/rule links (design.md §5: "Cards hub minted
// get a small accent dot... stock cards... show nothing"). This is the
// ONLY database access bundle mode needs; the bundle read itself
// (`loadBundleRows`) never touches the database, and a database outage
// here degrades to "every row looks stock" rather than failing the page
// (D157's spirit, extended past the places design.md named it).
export async function bundleRows(pool, dataDir, buildId, { stabburUiBase } = {}) {
  const { rows, error } = loadBundleRows(dataDir, buildId);
  if (error || rows.length === 0) return { rows, error };
  try {
    const ids = rows.map((r) => r.id);
    const { rows: slotRows } = await pool.query("SELECT id, note_id, grammar_rule_id FROM card_slots WHERE id = ANY($1)", [ids]);
    const bySlot = new Map(slotRows.map((r) => [r.id, r]));
    const enriched = rows.map((r) => {
      const slot = bySlot.get(r.id);
      if (!slot) return r;
      return {
        ...r,
        isHubMinted: true,
        noteId: slot.note_id,
        grammarRuleId: slot.grammar_rule_id,
        noteHref: hrefFor(stabburUiBase, "notes", slot.note_id),
        ruleHref: hrefFor(stabburUiBase, "grammar", slot.grammar_rule_id),
      };
    });
    return { rows: enriched, error: null };
  } catch {
    return { rows, error: null };
  }
}

// --------------------------------------------------------------------------
// Markup
// --------------------------------------------------------------------------

function sourceOptionsHtml(sourceList, currentSource) {
  return sourceList
    .map((s) => `<option value="${escapeHtml(s.value)}" ${s.value === currentSource ? "selected" : ""}>${escapeHtml(s.label)}</option>`)
    .join("");
}

export function cardsPageStyleBlock() {
  return `
.cards-page .filters { display: flex; flex-direction: column; gap: 8px; margin-bottom: 10px; }
.cards-page .frow { display: flex; gap: 8px; align-items: center; flex-wrap: wrap; }
.cards-page .frow .lbl { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); font-weight: 700; }
.cards-page select, .cards-page input[type="search"] { min-width: 0; }
.cards-page .tchip { background: transparent; border: 1px solid var(--border); color: var(--text-dim); padding: 5px 10px; font-size: 12.5px; }
.cards-page .tchip[aria-pressed="true"] { background: var(--accent-soft); color: var(--accent-text); border-color: transparent; }
.cards-page .tchip[hidden] { display: none; }
.cards-page .dd { position: relative; }
.cards-page .dd summary { list-style: none; cursor: pointer; font-size: 13px; padding: 6px 10px; border: 1px solid var(--border); border-radius: var(--radius); background: var(--bg-sunken); color: var(--text); }
.cards-page .dd summary::-webkit-details-marker { display: none; }
.cards-page .dd-menu { position: absolute; z-index: 5; top: calc(100% + 4px); left: 0; min-width: 220px; max-height: 260px; overflow-y: auto; background: var(--bg-elevated); border: 1px solid var(--border); border-radius: var(--radius); padding: 6px; display: flex; flex-direction: column; gap: 2px; }
.cards-page .dd-menu label { display: flex; gap: 6px; align-items: center; font-size: 12.5px; padding: 3px 6px; border-radius: 4px; cursor: pointer; }
.cards-page .dd-menu label:hover { background: var(--bg-sunken); }
.cards-page .dd-menu .dname { color: var(--text-faint); }
.cards-page .occf { display: inline-flex; align-items: center; gap: 5px; font-size: 12.5px; }
.cards-page .active { display: flex; gap: 6px 12px; flex-wrap: wrap; align-items: center; min-height: 22px; font-size: 12px; padding: 2px 0; }
.cards-page .active .count { font-size: 12.5px; color: var(--text-dim); }
.cards-page .active .count b { color: var(--text); }
.cards-page .achip { display: inline-flex; align-items: center; gap: 4px; color: var(--text-dim); }
.cards-page .achip button { background: none; border: none; color: var(--text-faint); cursor: pointer; padding: 0 2px; font: inherit; }
.cards-page .achip button:hover { color: var(--text); }
.cards-page .linkbtn { background: none; border: none; color: var(--accent-text); cursor: pointer; padding: 0; font: inherit; font-weight: 600; }
.cards-page .legend { display: flex; flex-wrap: wrap; gap: 6px 14px; font-size: 11px; color: var(--text-dim); padding: 6px 2px 10px; }
.cards-page .legend .axis { font-size: 10px; text-transform: uppercase; letter-spacing: .06em; color: var(--text-faint); font-weight: 700; }
.cards-page .legend .lgi { display: inline-flex; align-items: center; gap: 5px; }
.cards-page .legend .flow-u { margin: 0; }
.cards-page table.cp-table th, .cards-page table.cp-table td { vertical-align: middle; }
.cards-page tr.cp-row { cursor: pointer; }
.cards-page tr.cp-row:hover { background: var(--bg-sunken); }
.cards-page tr.cp-row:focus-visible { outline: 2px solid var(--accent); outline-offset: -2px; }
.cards-page tr.cp-row.current { background: var(--accent-soft); }
.cards-page td.cp-txt { max-width: 0; width: 26%; }
.cards-page td.cp-txt span { display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 36ch; }
.cards-page td.cp-id { font-family: var(--mono); font-size: 12.5px; white-space: nowrap; }
.cards-page .hubdot { display: inline-block; width: 6px; height: 6px; border-radius: 50%; background: var(--accent); margin-right: 6px; vertical-align: 2px; }
.cards-page .cp-strip { display: inline-grid; grid-template-columns: repeat(3, 16px); gap: 3px; vertical-align: middle; }
.cards-page td.cp-lnk { width: 1%; white-space: nowrap; }
.cards-page a.cp-ext { display: inline-grid; place-items: center; width: 24px; height: 24px; border-radius: 6px; color: var(--accent-text); text-decoration: none; font-size: 14px; }
.cards-page a.cp-ext:hover, .cards-page a.cp-ext:focus-visible { background: var(--bg-sunken); outline: none; }
.cards-page a.cp-ext.cp-rule { color: var(--text-faint); }
.cards-page td.cp-empty { color: var(--text-faint); white-space: normal; }
.cards-page .pager { display: flex; align-items: center; gap: 4px; flex-wrap: wrap; padding: 10px 2px; }
.cards-page .pager .pages { display: inline-flex; gap: 3px; }
.cards-page .pager button { background: transparent; border-color: transparent; padding: 5px 9px; }
.cards-page .pager button:hover:not(:disabled) { border-color: var(--border); }
.cards-page .pager button[aria-current="page"] { background: var(--bg-elevated); border-color: var(--border); color: var(--text); font-weight: 650; }
.cards-page .pager button:disabled { opacity: .4; cursor: default; }
.cards-page .pager .gap { color: var(--text-faint); padding: 0 2px; }
.cards-page .pager .shown { margin-left: auto; font-size: 12px; color: var(--text-faint); }
/* card-preview-popup §7 / §8: the ship-strip's own per-page extension of
   the shared .flow-u base (libs/jsservice/layout.js), applied under this
   page's own scope class so the two staged sub-states render identically
   to builder-ship-strips without a second cell definition. */
.cards-page .flow-u.staged.flush { background: var(--warn); border-color: var(--warn); color: #1a1205; }
.cards-page .flow-u.staged.held { background: transparent; border-style: dashed; color: var(--warn); }
`;
}

export function cardsPageMarkup({ source, sourceList, errorMessage }) {
  const scopeOptions = SEARCH_SCOPES.map(([v, l]) => `<option value="${escapeHtml(v)}">${escapeHtml(l)}</option>`).join("");
  const sortOptions = SORT_KEYS.map(([v, l]) => `<option value="${escapeHtml(v)}">${escapeHtml(l)}</option>`).join("");
  const sizeOptions = PAGE_SIZES.map((n) => `<option value="${n}">${n} / page</option>`).join("");
  return `
<div class="page-head"><div><h2>Cards</h2><div class="page-sub">Every card ever minted — the device-side counterpart to stabbur's Notes list.</div></div></div>
<div class="cards-page" id="cp-root">
  ${errorMessage ? `<div class="flow-banner crit" style="margin-bottom:12px;">${escapeHtml(errorMessage)}</div>` : ""}
  <div class="filters">
    <div class="frow">
      <select id="cp-source" aria-label="Source">${sourceOptionsHtml(sourceList, source)}</select>
      <input type="search" id="cp-q" placeholder="Search card content…" aria-label="Search">
      <select id="cp-scope" aria-label="Search in">${scopeOptions}</select>
      <details class="dd" id="cp-deck-dd"><summary id="cp-deck-sum">Decks: all</summary><div class="dd-menu" id="cp-deck-list"></div></details>
    </div>
    <div class="frow" id="cp-occ-row"><span class="lbl">Occurrence</span></div>
    <div class="frow">
      <button type="button" class="tchip" data-flag="xEmpty" aria-pressed="false">X empty</button>
      <button type="button" class="tchip" data-flag="ipa" aria-pressed="false">has IPA</button>
      <button type="button" class="tchip" data-flag="rule" data-minted="1" aria-pressed="false">has grammar rule</button>
      <button type="button" class="tchip" data-flag="missing" data-minted="1" aria-pressed="false">audio clip missing</button>
      <select id="cp-cls" aria-label="Uses class"><option value="">uses class…</option></select>
    </div>
    <div class="frow">
      <span class="lbl">Sort</span>
      <select id="cp-sort" aria-label="Sort by">${sortOptions}</select>
      <button type="button" class="btn-ghost" id="cp-sort-dir"></button>
      <select id="cp-size" aria-label="Page size">${sizeOptions}</select>
      <select id="cp-views" aria-label="Saved views"><option value="">Saved views…</option><option value="pending-e">Pending E sides</option><option value="ipa">Uses IPA</option></select>
      <button type="button" class="linkbtn" id="cp-reset">Reset view</button>
    </div>
    <div class="active" id="cp-chips"></div>
  </div>
  <div class="legend" id="cp-legend" hidden>
    <span class="axis">Occurrence</span>
    <span class="lgi"><span class="flow-u shipped">N</span>shipped</span>
    <span class="lgi"><span class="flow-u staged flush">N</span>staged, flushes next run</span>
    <span class="lgi"><span class="flow-u staged held">N</span>staged, held</span>
    <span class="lgi"><span class="flow-u pending">N</span>pending</span>
  </div>
  <div class="table-wrap">
    <table class="cp-table">
      <thead><tr><th>Card</th><th>Deck</th><th>Front (N)</th><th>Back (E)</th><th>Occurrences</th><th title="Source note / grammar rule">↗</th></tr></thead>
      <tbody id="cp-tbody"></tbody>
    </table>
  </div>
  <div class="pager" id="cp-pager"></div>
</div>`;
}

// --------------------------------------------------------------------------
// Client script
// --------------------------------------------------------------------------
//
// Reads `window.MjolnirCardsPageData` (baked once, task 5.7: the current
// source's rows + the view state restored from `operator_settings`, never
// a per-row preview payload) and dynamically imports
// `/mjolnir/cards/cards-engine.js` — the SAME hub/src/cardsPageEngine.js
// this file's own tests exercise directly, served byte for byte (the
// pattern every engine file in this package follows; see that file's own
// header). Every filter/sort/paginate/occurrence-cell decision below goes
// through it; nothing here reimplements those rules.

export function cardsPageClientScript() {
  return `
(function () {
'use strict';
var engineReady = import('/mjolnir/cards/cards-engine.js');
var ENGINE = null;
engineReady.then(function (mod) { ENGINE = mod; init(); });

var DATA = window.MjolnirCardsPageData || { rows: [], source: 'minted', sources: [], viewPrefs: null };
var ROWS = DATA.rows || [];
var SOURCE = DATA.source || 'minted';
var VIEW = []; // filtered + sorted, full (unpaginated) — what the popup steps across

function $(id) { return document.getElementById(id); }
function esc(s) { var d = document.createElement('div'); d.textContent = s == null ? '' : String(s); return d.innerHTML; }

function defaultView() {
  return { source: SOURCE, filters: Object.assign({}, ENGINE.DEFAULT_FILTERS, { occ: Object.assign({}, ENGINE.DEFAULT_FILTERS.occ) }), sort: Object.assign({}, ENGINE.DEFAULT_SORT), pageSize: ENGINE.DEFAULT_PAGE_SIZE, page: 1 };
}

var V;

function init() {
  var baked = DATA.viewPrefs;
  V = (baked && typeof baked === 'object') ? Object.assign(defaultView(), baked, {
    source: SOURCE,
    filters: Object.assign({}, ENGINE.DEFAULT_FILTERS, baked.filters || {}, { occ: Object.assign({}, ENGINE.DEFAULT_FILTERS.occ, (baked.filters && baked.filters.occ) || {}) }),
    sort: Object.assign({}, ENGINE.DEFAULT_SORT, baked.sort || {}),
    pageSize: ENGINE.PAGE_SIZES.indexOf(baked.pageSize) !== -1 ? baked.pageSize : ENGINE.DEFAULT_PAGE_SIZE,
    page: baked.page || 1,
  }) : defaultView();

  buildControls();
  syncControls();
  renderTable();

  $('cp-source').addEventListener('change', function (e) {
    var next = e.target.value;
    if (window.MjolnirOperatorSettings) {
      var toSave = Object.assign({}, V, { source: next });
      window.MjolnirOperatorSettings.setSetting('${CARDS_PAGE_SETTINGS_KEY}', toSave);
    }
    location.href = '/mjolnir/cards?source=' + encodeURIComponent(next);
  });

  var qt;
  $('cp-q').value = V.filters.search;
  $('cp-q').addEventListener('input', function (e) {
    clearTimeout(qt);
    qt = setTimeout(function () { V.filters.search = e.target.value.trim(); changed(); }, 200);
  });
  $('cp-scope').addEventListener('change', function (e) { V.filters.scope = e.target.value; changed(); });
  $('cp-cls').addEventListener('change', function (e) { V.filters.cls = e.target.value; changed(); });
  document.querySelectorAll('.tchip').forEach(function (b) {
    b.addEventListener('click', function () { V.filters[b.dataset.flag] = !V.filters[b.dataset.flag]; changed(); });
  });
  $('cp-sort').addEventListener('change', function (e) {
    V.sort.key = e.target.value;
    V.sort.desc = (e.target.value === 'minted' || e.target.value === 'shipped');
    changed();
  });
  $('cp-sort-dir').addEventListener('click', function () { V.sort.desc = !V.sort.desc; changed(); });
  $('cp-size').addEventListener('change', function (e) { V.pageSize = Number(e.target.value); changed(); });
  $('cp-views').addEventListener('change', function (e) {
    var preset = ENGINE.SAVED_VIEWS[e.target.value];
    if (!preset) return;
    V = preset.apply(V);
    syncControls();
    persist();
    renderTable();
  });
  $('cp-reset').addEventListener('click', function () { V = defaultView(); syncControls(); persist(); renderTable(); });
  $('cp-pager').addEventListener('click', function (e) {
    var b = e.target.closest('button[data-p]');
    if (!b || b.disabled) return;
    V.page = Number(b.dataset.p);
    persist();
    renderTable();
  });
  $('cp-tbody').addEventListener('click', function (e) {
    if (e.target.closest('a.cp-ext')) return; // never opens the popup
    var tr = e.target.closest('tr[data-vi]');
    if (tr) openPopupAt(Number(tr.dataset.vi));
  });
  $('cp-tbody').addEventListener('keydown', function (e) {
    if (e.key === 'Enter' && e.target.matches('tr[data-vi]')) openPopupAt(Number(e.target.dataset.vi));
  });
  document.addEventListener('click', function (e) {
    var dd = $('cp-deck-dd');
    if (dd && dd.open && !dd.contains(e.target)) dd.open = false;
  });
}

function buildControls() {
  var decks = [];
  var seen = {};
  ROWS.forEach(function (r) { if (!seen[r.deckCode]) { seen[r.deckCode] = true; decks.push({ code: r.deckCode, title: r.deckTitle }); } });
  decks.sort(function (a, b) { return a.code < b.code ? -1 : a.code > b.code ? 1 : 0; });
  $('cp-deck-list').innerHTML = decks.map(function (d) {
    return '<label><input type="checkbox" value="' + esc(d.code) + '"> ' + esc(d.code) + ' <span class="dname">' + esc(d.title) + '</span></label>';
  }).join('');
  $('cp-deck-list').addEventListener('change', function () {
    V.filters.decks = Array.prototype.slice.call(document.querySelectorAll('#cp-deck-list input:checked')).map(function (i) { return i.value; });
    changed();
  });

  var occRow = $('cp-occ-row');
  ENGINE.OCCURRENCE_LETTERS.forEach(function (letter) {
    var label = document.createElement('label');
    label.className = 'occf';
    label.innerHTML = '<b>' + letter + '</b><select id="cp-occ-' + letter + '" aria-label="Occurrence ' + letter + '"></select>';
    label.querySelector('select').addEventListener('change', function (e) { V.filters.occ[letter] = e.target.value; changed(); });
    occRow.appendChild(label);
  });

  var used = {};
  ROWS.forEach(function (r) { (r.classes || []).forEach(function (c) { used[c] = true; }); });
  var classList = Object.keys(used).sort();
  $('cp-cls').innerHTML = '<option value="">uses class…</option>' + classList.map(function (c) { return '<option value="' + esc(c) + '">.' + esc(c) + '</option>'; }).join('');
}

function syncControls() {
  var vis = ENGINE.controlVisibility(SOURCE);
  $('cp-source').value = SOURCE;
  $('cp-q').value = V.filters.search;
  $('cp-cls').value = V.filters.cls;
  var noteOpt = $('cp-scope').querySelector('option[value="note"]');
  if (noteOpt) noteOpt.disabled = !vis.noteScopeEnabled;
  if (!vis.noteScopeEnabled && V.filters.scope === 'note') V.filters.scope = 'all';
  $('cp-scope').value = V.filters.scope;
  $('cp-sort').querySelectorAll('option').forEach(function (o) { o.disabled = vis.sortOptionsDisabled.indexOf(o.value) !== -1; });
  if (vis.sortOptionsDisabled.indexOf(V.sort.key) !== -1) V.sort.key = 'id';
  $('cp-sort').value = V.sort.key;
  $('cp-size').value = String(V.pageSize);
  $('cp-sort-dir').textContent = V.sort.desc ? '\\u2193' : '\\u2191';
  ENGINE.OCCURRENCE_LETTERS.forEach(function (letter) {
    if (!vis.occStateOptions.some(function (o) { return o[0] === V.filters.occ[letter]; })) V.filters.occ[letter] = 'any';
    var sel = $('cp-occ-' + letter);
    sel.innerHTML = vis.occStateOptions.map(function (o) { return '<option value="' + o[0] + '">' + o[1] + '</option>'; }).join('');
    sel.value = V.filters.occ[letter];
  });
  document.querySelectorAll('.tchip').forEach(function (b) {
    var mintedOnly = b.dataset.minted === '1';
    b.hidden = mintedOnly && !vis.minted;
    b.setAttribute('aria-pressed', String(!!V.filters[b.dataset.flag]));
  });
  $('cp-legend').hidden = !vis.legendVisible;
  document.querySelectorAll('#cp-deck-list input').forEach(function (i) { i.checked = V.filters.decks.indexOf(i.value) !== -1; });
  var n = V.filters.decks.length;
  $('cp-deck-sum').textContent = n ? ('Decks: ' + (n === 1 ? V.filters.decks[0] : n + ' selected')) : 'Decks: all';
}

function changed() { V.page = 1; $('cp-views').value = ''; syncControls(); persist(); renderTable(); }

function persist() {
  if (window.MjolnirOperatorSettings) window.MjolnirOperatorSettings.setSetting('${CARDS_PAGE_SETTINGS_KEY}', V);
}

function computeView() {
  VIEW = ROWS.filter(function (r) { return ENGINE.matchesFilters(r, V.filters, SOURCE); });
  VIEW = ENGINE.sortRows(VIEW, V.sort.key, V.sort.desc);
}

function occCellsHtml(row) {
  var slots = ENGINE.occurrenceSlots(row.occurrences, SOURCE);
  return '<span class="cp-strip">' + slots.map(function (s) {
    var glyph = s.present ? s.letter : '\\u2715';
    return '<span class="' + s.cls + '" title="' + esc(s.tip) + '">' + glyph + '</span>';
  }).join('') + '</span>';
}

function renderTable(highlightKey) {
  computeView();
  var page = ENGINE.paginate(VIEW, V.page, V.pageSize);
  V.page = page.page;
  var showHub = SOURCE !== 'minted';
  $('cp-tbody').innerHTML = page.pageRows.length ? page.pageRows.map(function (r, k) {
    var vi = page.start + k;
    var links = (r.noteHref ? '<a class="cp-ext" href="' + esc(r.noteHref) + '" target="_blank" rel="noopener" title="Source note ' + esc(r.noteId) + ' (new tab)" aria-label="Source note ' + esc(r.noteId) + '">\\u2197</a>' : '')
      + (r.ruleHref ? '<a class="cp-ext cp-rule" href="' + esc(r.ruleHref) + '" target="_blank" rel="noopener" title="Grammar rule (new tab)" aria-label="Grammar rule">\\u2197</a>' : '');
    return '<tr tabindex="0" class="cp-row' + (r.key === highlightKey ? ' current' : '') + '" data-vi="' + vi + '">'
      + '<td class="cp-id">' + (showHub && r.isHubMinted ? '<span class="hubdot" title="Hub-minted card"></span>' : '') + esc(r.id) + '</td>'
      + '<td title="' + esc(r.deckTitle) + '">' + esc(r.deckCode) + '</td>'
      + '<td class="cp-txt"><span title="' + esc(r.pN) + '">' + esc(r.pN) + '</span></td>'
      + '<td class="cp-txt"><span title="' + esc(r.pE) + '">' + esc(r.pE) + '</span></td>'
      + '<td>' + occCellsHtml(r) + '</td>'
      + '<td class="cp-lnk">' + links + '</td>'
      + '</tr>';
  }).join('') : '<tr><td colspan="6" class="cp-empty">No cards match these filters. Remove one below or use Clear all.</td></tr>';
  renderPager(page);
  renderChips();
}

function renderPager(page) {
  var nums = ENGINE.pageNumbers(page.page, page.pages);
  var html = nums.map(function (n) {
    if (n.gap) return '<span class="gap">\\u2026</span>';
    return '<button type="button" data-p="' + n.page + '"' + (n.current ? ' aria-current="page"' : '') + '>' + n.page + '</button>';
  }).join('');
  $('cp-pager').innerHTML = '<button type="button" data-p="' + (page.page - 1) + '" ' + (page.page <= 1 ? 'disabled' : '') + ' aria-label="Previous page">\\u2039</button>'
    + '<div class="pages">' + html + '</div>'
    + '<button type="button" data-p="' + (page.page + 1) + '" ' + (page.page >= page.pages ? 'disabled' : '') + ' aria-label="Next page">\\u203a</button>'
    + '<span class="shown">' + esc(ENGINE.showingLabel(page.start, page.end, page.total)) + '</span>';
}

function renderChips() {
  var chips = ENGINE.activeFilterChips(V.filters, SOURCE);
  var host = $('cp-chips');
  host.innerHTML = '';
  var cnt = document.createElement('span');
  cnt.className = 'count';
  cnt.innerHTML = '<b>' + VIEW.length + '</b> of ' + ROWS.length + ' cards';
  host.appendChild(cnt);
  chips.forEach(function (chip) {
    var el = document.createElement('span');
    el.className = 'achip';
    el.innerHTML = esc(chip.label) + '<button type="button" aria-label="Remove filter ' + esc(chip.label) + '">\\u00d7</button>';
    el.querySelector('button').addEventListener('click', function () { removeChip(chip.key); changed(); });
    host.appendChild(el);
  });
  if (chips.length) {
    var clearBtn = document.createElement('button');
    clearBtn.type = 'button';
    clearBtn.className = 'linkbtn';
    clearBtn.textContent = 'Clear all';
    clearBtn.addEventListener('click', function () {
      V.filters = Object.assign({}, ENGINE.DEFAULT_FILTERS, { occ: Object.assign({}, ENGINE.DEFAULT_FILTERS.occ) });
      changed();
    });
    host.appendChild(clearBtn);
  }
}

function removeChip(key) {
  if (key === 'search') { V.filters.search = ''; return; }
  if (key.indexOf('deck:') === 0) { var d = key.slice(5); V.filters.decks = V.filters.decks.filter(function (x) { return x !== d; }); return; }
  if (key.indexOf('occ:') === 0) { var letter = key.slice(4); V.filters.occ[letter] = 'any'; return; }
  if (key === 'missing') { V.filters.missing = false; return; }
  if (key === 'xEmpty') { V.filters.xEmpty = false; return; }
  if (key === 'ipa') { V.filters.ipa = false; return; }
  if (key === 'cls') { V.filters.cls = ''; return; }
  if (key === 'rule') { V.filters.rule = false; return; }
}

function toPopupCard(row) {
  return {
    key: row.id, id: row.id, D: row.deckTitle, N: row.N, E: row.E, X: row.X, A: row.A,
    occurrences: (row.occurrences || []).map(function (o) { return { letter: o.letter, status: o.status, buildId: o.buildId, flushing: o.flushing, remaining: o.remaining }; }),
    audioUrl: row.audioUrl, audioAvailable: row.audioAvailable, hasAudio: row.hasAudio,
  };
}

function openPopupAt(vi) {
  if (!window.MjolnirCardPreviewPopup) return;
  var popupCards = VIEW.map(toPopupCard);
  var row = VIEW[vi];
  window.MjolnirCardPreviewPopup.open(popupCards, vi, {
    defaultDirection: (DATA.defaultDirection || 'auto'),
    onClose: function (card, index) {
      var r = VIEW[index] || row;
      if (!r) return;
      V.page = Math.floor(index / V.pageSize) + 1;
      persist();
      renderTable(r.key);
      var tr = document.querySelector('tr[data-vi="' + index + '"]');
      if (tr) tr.scrollIntoView({ block: 'nearest' });
    },
  });
}

document.addEventListener('cardpreviewpopup:close', function () { /* handled via the per-open onClose above */ });
})();
`;
}
