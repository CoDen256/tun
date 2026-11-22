import http from "node:http";
import path from "node:path";
import fs from "node:fs";
import { listPublications, updateLabel, deleteBuild, readCurrent } from "./publications.js";
import {
  verifyBundle,
  verifyLogicBundleBytes,
  submitBundle,
  activateLogicBundle,
  forcePublish,
  setCurrent,
  assembleDefaults,
  assembleAndSubmit,
  defaultSyncBaseUrl,
  defaultAudioBaseUrl,
} from "./ota.js";
import { findBakedBaseVersion, findBakedPatchRev } from "../../tool/src/otaPublish.js";
import { list as listLogicBundles } from "./logicBundles.js";
import { stripHtml, getCardSlot } from "./cards.js";
import { getCardPreviewData, CARD_PREVIEW_FONTS, cardPreviewFontFaceCss } from "./cardPreviewStyle.js";
import {
  cardPreviewPopupStyleBlock,
  cardPreviewPopupMarkupHtml,
  cardPreviewPopupClientScript,
  CARD_PREVIEW_POPUP_SETTINGS_KEY,
} from "./cardPreviewPopup.js";
import {
  CARDS_PAGE_SETTINGS_KEY,
  BUILD_ID_PATTERN,
  mintedRows,
  bundleRows,
  cardsPageStyleBlock,
  cardsPageMarkup,
  cardsPageClientScript,
} from "./cardsPage.js";
import { listDecks, updateDeckDescription } from "./decks.js";
import { renderShell, escapeHtml } from "./layout.js";
import { requireAuth } from "../../../libs/jsservice/auth.js";
import { slugify } from "./slug.js";
import {
  getOrCreate,
  merge,
  replace,
  remove,
  listAccounts,
  perCardProgress,
  historyDeltas,
  latestHistoryAt,
  HISTORY_RETENTION_HOURS,
  userdataDoc,
  historyDoc,
  distinctDeckTitles,
  STATE_LABELS,
  PAGE_SIZES,
} from "./userdata.js";
import { archiveHistory, archiveVersion } from "./archive.js";
import { renderSyncHistoryPanel, SYNC_TIMELINE_STYLE } from "./syncTimeline.js";
import { cardIndex } from "./cardText.js";
import { createRequestHandler as createWorkbenchHandler } from "../../src/commands/ui.js";
// D109: builder's own pages are rendered here directly, in-process — same
// monorepo, same shared Postgres (D-P3) — instead of the earlier iframe-
// based "unified console" (D-C9, reverted: doubled chrome, and the
// workbench's own light theme read worse embedded than linked to directly).
// hub imports builder's pure body-builder functions and data-reading
// functions and wraps them in its own shell, so the design is genuinely
// "hub's own," not a second stylesheet pasted alongside it.
import { runForecast } from "../../builder/src/pipeline.js";
import { recentBuildJobs, getBuildJob } from "../../builder/src/buildJobs.js";
import { getSchedule } from "../../builder/src/schedulerConfig.js";
import { jobLogLines } from "../../builder/src/jobLogs.js";
import { describeLastRun } from "../../builder/src/runStatus.js";
import { getActiveMeta } from "../../builder/src/logicBundle.js";
import {
  buildShipStripsBody,
  shipStripsPageExtras,
  emptyForecast,
  buildScheduleBody,
  buildLogsBody,
  loadDeckMeta,
  loadShipOrders,
} from "../../builder/src/server.js";
import { checkOccurrenceIntegrity } from "../../builder/src/integrity.js";
import { buildInsights } from "./insights.js";
import { renderInsightsPage } from "./insightsPage.js";
import {
  maybeIngest,
  pullStats,
  listPullEvents,
  countPullEvents,
  activityByDay,
  pulledBuildIds,
  pullSummaryByBuild,
} from "./otaPulls.js";
import {
  readPullFilters,
  renderPullsBody,
  pullState,
  pullCells,
  neverPulledBanner,
  PULLS_PAGE_STYLE,
} from "./otaPullsPage.js";
import { getAllSettings, setSetting, isValidSettingKey } from "./operatorSettings.js";

const WORKBENCH_MOUNT = "/mjolnir/workbench";

const MAX_BODY_BYTES = 67108864; // D48 — same ceiling the publish guards enforce anyway

// defaultSyncBaseUrl/defaultAudioBaseUrl now live in ./ota.js (imported
// above) — assembly-tab-usability item 1 needed `assembleDefaults` to
// compute the same resolved URLs it reports to the Assemble tab, so they
// moved to where both callers can reach them without a circular import.

// ---- readiness helpers (zone-isolation 1.5) -------------------------------
// Which routes genuinely need the database. Deliberately an explicit list and
// not a heuristic: guessing by prefix would catch /mjolnir/workbench and
// /mjolnir/ota, which are FILE-backed and must keep working during an outage.
const DB_BACKED = [
  "/mjolnir",
  "/mjolnir/",
  "/mjolnir/ui",
  "/mjolnir/api/publications",
  "/mjolnir/builder/forecast",
  "/mjolnir/builder/schedule",
  "/mjolnir/builder/logs",
  "/mjolnir/decks",
  "/mjolnir/decks/api/description",
  "/mjolnir/catalogue",
  "/mjolnir/catalogue.json",
  "/mjolnir/device",
  "/mjolnir/device/doc",
  "/mjolnir/device/insights",
  "/mjolnir/device/insights.json",
  // ota-pull-tracking: the Pulls page reads `ota_pulls`, so it degrades with
  // the rest rather than throwing a driver error. The INGEST is a different
  // matter and is never on this list: it runs behind the page, and with the
  // database down it simply does not advance — the gateway keeps writing the
  // log and nothing is lost, because the dedup key is content-derived and the
  // file is re-read.
  "/mjolnir/device/pulls",
];

function isDatabaseBacked(pathname) {
  if (DB_BACKED.includes(pathname)) return true;
  // assembly-tab-usability item 3: the preview's font files are FILE-backed
  // (served straight out of base/'s own assets/fonts/, like
  // /mjolnir/workbench and /mjolnir/ota above) — carved out of the
  // /mjolnir/cards/ prefix rule below before it can mis-gate them during a
  // database outage.
  if (pathname.startsWith("/mjolnir/cards/fonts/")) return false;
  // card-preview-popup task 2: the render engine itself is a static,
  // read-only JS file (hub/src/cardRenderer.js, served verbatim) — same
  // carve-out reasoning as the fonts route just above.
  if (pathname === "/mjolnir/cards/render-engine.js") return false;
  // card-preview-popup task 3: the direction/stepping/occurrence-summary/
  // audio-outcome logic (hub/src/cardPreviewEngine.js) is the same kind of
  // static, read-only, import-free JS file — same carve-out reasoning.
  if (pathname === "/mjolnir/cards/popup-engine.js") return false;
  // card-preview-popup task 4: the tools-drawer pure logic
  // (hub/src/cardPreviewDrawer.js) — same carve-out reasoning again.
  if (pathname === "/mjolnir/cards/drawer-engine.js") return false;
  // card-preview-popup task group 5: the Cards page's own filter/sort/
  // paginate/occurrence-cell engine (hub/src/cardsPageEngine.js) — same
  // carve-out reasoning again. Note "/mjolnir/cards" itself (no trailing
  // slash, the page route) is DELIBERATELY NOT in DB_BACKED above any
  // more (acceptance C39): it reaches its own handler unconditionally and
  // degrades itself, the same way /mjolnir/api/settings does, below.
  if (pathname === "/mjolnir/cards/cards-engine.js") return false;
  // /mjolnir/cards/<id>/audio reads card_content.
  if (pathname.startsWith("/mjolnir/cards/")) return true;
  // card-preview-popup task 6: /mjolnir/api/settings is DELIBERATELY not
  // gated here. design.md §6 / acceptance C39 want a database outage to
  // degrade this route to defaults, not 503 it — the opposite of every
  // route above. operatorSettings.js does that degrade itself (catches its
  // own query error and answers with the caller's default), so this route
  // reaches its own handler unconditionally and is never in DB_BACKED.
  return false;
}

function wantsJson(pathname) {
  // Same signal hub's auth uses, for the same reason: `Accept` is often absent
  // on a plain fetch(), while the path shape is reliable.
  return pathname.includes("/api/") || pathname.endsWith(".json");
}

function sendJson(res, status, body) {
  const data = JSON.stringify(body);
  res.writeHead(status, { "Content-Type": "application/json; charset=utf-8", "Content-Length": Buffer.byteLength(data) });
  res.end(data);
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    let total = 0;
    req.on("data", (chunk) => {
      total += chunk.length;
      if (total > MAX_BODY_BYTES) {
        reject(new Error("request body exceeds 64 MiB"));
        req.destroy();
        return;
      }
      chunks.push(chunk);
    });
    req.on("end", () => resolve(Buffer.concat(chunks)));
    req.on("error", reject);
  });
}

async function readJson(req) {
  const body = await readBody(req);
  return body.length ? JSON.parse(body.toString("utf8")) : {};
}


// ---- Publish history ----

function renderHistoryPage(publications, current, config, { pullSummary = new Map(), ingest = null } = {}) {
  // ota-pull-tracking 5.1-5.4: two columns ADDED, nothing removed or
  // reordered. `pullSummary` is a Map keyed on build_id; a build with no
  // entry is treated exactly like one with zero pulls, which is what makes
  // the columns render correctly before a single event has been ingested.
  const now = new Date();
  let banner = "";
  let neverCount = 0;
  const rows = publications
    .map((p) => {
      const isCurrent = current && current.buildId === p.build_id;
      const state = pullState(p, pullSummary.get(p.build_id), { isCurrent });
      const cells = pullCells(p, state, { now });
      if (state.kind !== "pulled") neverCount += 1;
      if (state.kind === "current-never") banner = neverPulledBanner(p, state, { now });
      const bundlePath = path.join(config.dataDir, "ota", "bundle", `${p.build_id}.js`);
      const inspectHref = `${WORKBENCH_MOUNT}/?open=${encodeURIComponent(bundlePath)}`;
      return `<tr${cells.rowClass}>
        <td>${isCurrent ? '<span class="pill pill-ok">● current</span> ' : ""}<span class="mono">${escapeHtml(p.build_id)}</span></td>
        <td class="wrap">${escapeHtml(p.label || "")}</td>
        <td class="mono">${escapeHtml(p.base_version)}</td>
        <td class="num">${p.patch_rev}</td>
        <td class="num">${p.data_rev}</td>
        <td class="num">${p.card_count}</td>
        <td class="mono">${escapeHtml(p.bundle_sha.slice(0, 4))}…${escapeHtml(p.bundle_sha.slice(-4))}</td>
        <td class="mono">${escapeHtml(new Date(p.created_at).toISOString())}</td>
        <td class="pullcount num">${cells.pulls}</td>
        <td>${cells.last}</td>
        <td>
          <a class="btn-ghost" href="/mjolnir/ota/download/${encodeURIComponent(p.build_id)}">download</a>
          <a class="btn-ghost" href="${inspectHref}" onclick="return openInWorkbench(this.href)">inspect →</a>
          <button class="btn-ghost set-current-btn" data-build-id="${escapeHtml(p.build_id)}" ${isCurrent ? "disabled" : ""}>set current</button>
          <button class="btn-ghost edit-label-btn" data-build-id="${escapeHtml(p.build_id)}">edit label</button>
          <button class="btn-ghost btn-danger delete-build-btn" data-build-id="${escapeHtml(p.build_id)}">delete</button>
        </td>
      </tr>`;
    })
    .join("\n");

  return renderShell({
    title: "mjolnir / hub — publish history",
    activeHref: "/mjolnir",
    body: `<style>${PULLS_PAGE_STYLE}</style>
<div class="page-head"><div><h2>Publish history</h2>
  <div class="page-sub">${publications.length} build(s)${
      neverCount ? ` · ${neverCount} never pulled` : ""
    }</div></div></div>
${banner}
<div class="panel">
  <div class="table-wrap">
    <table>
      <thead><tr><th>Build</th><th>Label</th><th>Base</th><th>Logic</th><th>Data</th><th>Cards</th><th>sha256</th><th>Published</th><th class="col-pulls" style="text-align:right">Pulls</th><th class="col-pulls">Last pulled</th><th></th></tr></thead>
      <tbody>${rows || `<tr><td colspan="11">no publications yet</td></tr>`}</tbody>
    </table>
  </div>
</div>
<div class="inline-note">"Pulls" counts <code>200</code> responses on <code>/ota/bundle/&lt;buildId&gt;.js</code> in the gateway's own access log; a <code>206</code> resume folds into the same pull and a <code>404</code> counts as none. Click a count to open that build's pull log. A pull is bytes served — never proof that the phone ended up using that build, since the native boot watchdog can quarantine a bundle that was fetched perfectly (D08).</div>
<div class="inline-note">A build that is <strong>current</strong> and has never been pulled is highlighted: that is the "published and the phone never took it" case. A build superseded before anything checked in shows its zero quietly — nothing was ever in a position to take it, so the zero means nothing.</div>
<div class="inline-note">"download" streams that build's exact published bytes, named from its label. "inspect" opens it in the bundle workbench — repeated inspects reuse the same workbench window/tab rather than piling up new ones. "set current" repoints <code>current.json</code> at that build (no shell command). "delete" is blocked while a build shipped any occurrence (D93) or is the live current build.</div>
<div class="inline-note">Logic bundles (<code>/mjolnir/ota</code>) deliberately gets no pull columns: a pull is recorded against a published <code>buildId</code>, and a logic bundle is an input to a build the device never fetches, so a blank cell there would read as "never pulled" for something that is not pullable.</div>
<script>
// D-C6: a named window is reused/focused/navigated by every subsequent
// "open in workbench" link, instead of each click opening yet another tab.
function openInWorkbench(href) {
  window.open(href, 'mjolnir-workbench');
  return false;
}
document.querySelectorAll('.set-current-btn').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const buildId = btn.dataset.buildId;
    const res = await fetch('/mjolnir/ota/api/set-current', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ buildId }) });
    if (res.ok) location.reload(); else alert('error: ' + (await res.json()).error);
  });
});
document.querySelectorAll('.edit-label-btn').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const buildId = btn.dataset.buildId;
    const label = prompt('New label for ' + buildId + ':');
    if (label === null) return;
    const res = await fetch('/mjolnir/ota/api/label', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ buildId, label }) });
    if (res.ok) location.reload(); else alert('error: ' + (await res.json()).error);
  });
});
document.querySelectorAll('.delete-build-btn').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const buildId = btn.dataset.buildId;
    if (!confirm('Delete ' + buildId + ' from history? This does not affect the device unless it is the current build (blocked if so).')) return;
    const res = await fetch('/mjolnir/ota/api/delete', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ buildId }) });
    if (res.ok) location.reload(); else alert('error: ' + (await res.json()).error);
  });
});
</script>`,
  });
}

// ---- Decks ----

// deck-descriptions (task 1.3): the operator's own edit affordance for the
// on-device deck `Description` field builder now bakes in — same
// edit-label pattern the publish history page already uses.
function renderDecksPage(decks) {
  const rows = decks
    .map(
      (d) => `<tr>
        <td class="mono">${escapeHtml(d.code)}</td>
        <td>${escapeHtml(d.title)}</td>
        <td class="wrap">${escapeHtml(d.description || "")}</td>
        <td><button class="btn-ghost edit-description-btn" data-code="${escapeHtml(d.code)}">edit description</button></td>
      </tr>`
    )
    .join("\n");

  return renderShell({
    title: "mjolnir / hub — decks",
    activeHref: "/mjolnir/decks",
    body: `
<div class="page-head"><div><h2>Decks</h2><div class="page-sub">Every deck's title/description baked into the published bundle's on-device deck list.</div></div></div>
<div class="panel">
  <div class="table-wrap">
    <table>
      <thead><tr><th>Code</th><th>Title</th><th>Description</th><th></th></tr></thead>
      <tbody>${rows || `<tr><td colspan="4">no decks seeded yet</td></tr>`}</tbody>
    </table>
  </div>
</div>
<div class="inline-note">A description change takes effect on that deck's next publish — the same regenerate-on-every-publish step that already refreshes card content.</div>
<script>
document.querySelectorAll('.edit-description-btn').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const code = btn.dataset.code;
    const description = prompt('New description for ' + code + ':');
    if (description === null) return;
    const res = await fetch('/mjolnir/decks/api/description', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ code, description }) });
    if (res.ok) location.reload(); else alert('error: ' + (await res.json()).error);
  });
});
</script>`,
  });
}

// ---- Catalogue ----

// D-C5: a single browsable list of everything there is to inspect — every
// OTA build ever published, every logic bundle ever submitted — each one
// click away from opening in the workbench. The workbench itself has no
// database access (by design), so this is hub-rendered, not fetched by the
// workbench; it's the same `?open=<path>` link every other inspect action
// already uses, just gathered in one place instead of scattered per page.
function renderCataloguePage(publications, logicBundles, config) {
  const activeLogicBundleId = logicBundles.find((b) => b.active)?.id;

  const buildRows = publications
    .map((p) => {
      const bundlePath = path.join(config.dataDir, "ota", "bundle", `${p.build_id}.js`);
      const href = `${WORKBENCH_MOUNT}/?open=${encodeURIComponent(bundlePath)}`;
      return `<tr>
        <td class="mono">${escapeHtml(p.build_id)}</td>
        <td class="wrap">${escapeHtml(p.label || "")}</td>
        <td class="mono">${escapeHtml(new Date(p.created_at).toISOString())}</td>
        <td><a class="btn-ghost" href="${href}" onclick="return openInWorkbench(this.href)">inspect →</a></td>
      </tr>`;
    })
    .join("\n");

  const logicRows = logicBundles
    .map((b) => {
      const href = `${WORKBENCH_MOUNT}/?open=${encodeURIComponent(b.file_path)}`;
      return `<tr>
        <td>${b.id === activeLogicBundleId ? '<span class="pill pill-ok">● active</span>' : ""}</td>
        <td class="mono">#${b.id}</td>
        <td class="mono">${escapeHtml(b.base_version)}</td>
        <td class="wrap">${escapeHtml(b.label || "")}</td>
        <td><a class="btn-ghost" href="${href}" onclick="return openInWorkbench(this.href)">inspect →</a></td>
      </tr>`;
    })
    .join("\n");

  return renderShell({
    title: "mjolnir / hub — catalogue",
    activeHref: "/mjolnir/catalogue",
    body: `
<div class="page-head"><div><h2>Catalogue</h2><div class="page-sub">Every OTA build and every logic bundle, one click away from the workbench.</div></div></div>

<div class="panel">
  <div class="panel-head"><h3>OTA builds</h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Build</th><th>Label</th><th>Published</th><th></th></tr></thead>
      <tbody>${buildRows || `<tr><td colspan="4">no publications yet</td></tr>`}</tbody>
    </table>
  </div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Logic bundles</h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th></th><th>ID</th><th>Base</th><th>Label</th><th></th></tr></thead>
      <tbody>${logicRows || `<tr><td colspan="5">no logic bundles yet</td></tr>`}</tbody>
    </table>
  </div>
</div>
<script>
function openInWorkbench(href) {
  window.open(href, 'mjolnir-workbench');
  return false;
}
</script>`,
  });
}

// ---- Cards ----

// card-preview-popup task group 5 ("The Cards page", design.md §5): ONE
// flat table, no per-deck panels and no per-row accordion — REPLACES the
// row-expand preview `hub/src/cardPreview.js` used to render (that file is
// now deleted; see git history for the pre-task-5 version). Filtering,
// sorting and pagination are client-side (see hub/src/cardsPage.js's own
// header for why); this function's only jobs are (1) assemble the current
// source's row data once, (2) render the static shell (controls, table
// head, legend, pager skeleton — all populated/filled by the client
// script), and (3) bake that one source's data plus the renderer/style/
// symbols/usage data the popup needs, exactly once (acceptance C30).
async function renderCardsPage(pool, { source, dataDir, baseFolderDir, stabburUiBase, settings = {}, sourceNotice = null }) {
  let previewData;
  try {
    previewData = getCardPreviewData(baseFolderDir);
  } catch (err) {
    previewData = { error: err };
  }

  let rows = [];
  let errorMessage = sourceNotice || null;
  // D157, extended past the places design.md named it (C39): a database
  // outage degrades the Minted source to an empty table with an inline
  // explanation instead of failing the whole page — the gate that used to
  // 503 this route unconditionally is gone (see isDatabaseBacked() above).
  if (source === "minted") {
    try {
      rows = await mintedRows(pool, { dataDir, stabburUiBase });
    } catch (err) {
      errorMessage = `Minted source unavailable: ${err.message}`;
    }
  } else {
    const result = await bundleRows(pool, dataDir, source, { stabburUiBase });
    rows = result.rows;
    if (result.error) errorMessage = `Bundle "${source}" could not be read: ${result.error}`;
  }

  let publications = [];
  try {
    publications = await listPublications();
  } catch {
    // Degrades to "Minted only" in the source picker — the picker itself
    // still renders, just without the build list (C39).
  }
  const current = readCurrent(dataDir);
  const sourceList = [
    { value: "minted", label: "Minted (hub ledger)" },
    ...publications.map((p) => ({
      value: p.build_id,
      label: `Bundle ${p.build_id}${current && current.buildId === p.build_id ? " · current" : ""} · ${new Date(p.created_at).toISOString().slice(0, 10)}`,
    })),
  ];

  const popupPrefs = settings[CARD_PREVIEW_POPUP_SETTINGS_KEY] || null;
  const savedView = settings[CARDS_PAGE_SETTINGS_KEY] || null;

  return renderShell({
    title: "mjolnir / hub — cards",
    activeHref: "/mjolnir/cards",
    body: `
<style>${previewData.style ? cardPreviewFontFaceCss(previewData.style) : ""}</style>
<style>${cardsPageStyleBlock()}</style>
<style>${cardPreviewPopupStyleBlock()}</style>
${cardsPageMarkup({ source, sourceList, errorMessage: errorMessage || (previewData.error ? `Card renderer data unavailable: ${previewData.error.message}` : "") })}
${cardPreviewPopupMarkupHtml()}
<script type="application/json" id="cards-page-data">${JSON.stringify({
  rows,
  source,
  viewPrefs: savedView,
  defaultDirection: (popupPrefs && popupPrefs.defaultDirection) || "auto",
})}</script>
<script>window.MjolnirCardsPageData = JSON.parse(document.getElementById('cards-page-data').textContent);</script>
<script type="application/json" id="cpp-data">${JSON.stringify({
  cards: [],
  style: previewData.style || null,
  // task group 4 (Tools drawer): the Symbols tab and the Classes & tags
  // tab's usage counts, from the same cached extraction as `style` — null
  // together with it on a failed extraction, never a partial catalogue.
  symbols: previewData.symbols || null,
  usage: previewData.usage || null,
  // task group 6 (operator settings, design.md §6): task 3.4's "operator's
  // saved default" is no longer the literal 'auto' stand-in it was before
  // this task group — `settings[CARD_PREVIEW_POPUP_SETTINGS_KEY]` is the
  // real row from `operator_settings` (or `{}` on a database outage,
  // getAllSettings()'s own degrade), and cardPreviewPopupClientScript()'s
  // init code reads `popupPrefs` below for device/theme/font size/drawer
  // too, rather than this script block hand-picking one field out of it.
  defaultDirection: (settings[CARD_PREVIEW_POPUP_SETTINGS_KEY] && settings[CARD_PREVIEW_POPUP_SETTINGS_KEY].defaultDirection) || "auto",
  popupPrefs: settings[CARD_PREVIEW_POPUP_SETTINGS_KEY] || null,
})}</script>
<script>window.MjolnirCardPreviewPopupData = JSON.parse(document.getElementById('cpp-data').textContent);</script>
<script>${cardPreviewPopupClientScript()}</script>
<script>${cardsPageClientScript()}</script>`,
  });
}

// ---- Device sync (userdata-console) ----

// Built exactly to the approved mockup
// (https://claude.ai/code/artifact/12b08e2e-0eba-4990-8125-584a71c7046a) —
// classes not already in layout.js's shared STYLE, lifted verbatim from
// that mockup's own <style> block.
const DEVICE_PAGE_STYLE = `
.identity-bar { display: flex; gap: 20px; flex-wrap: wrap; align-items: flex-end; padding: 14px 16px; background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 10px; margin-bottom: 16px; }
.identity-bar .field select { font-family: var(--mono); min-width: 230px; }
.identity-bar .hint { align-self: center; font-size: 12px; color: var(--text-faint); margin-left: auto; max-width: 260px; }
.field { display: flex; flex-direction: column; gap: 5px; }
.field label { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; font-weight: 600; color: var(--text-faint); }
.stat .value .unit { font-size: 13px; font-weight: 600; color: var(--text-dim); font-family: var(--sans); }
.snap-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(190px, 1fr)); gap: 16px 24px; }
.snap-item .label { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); font-weight: 600; }
.snap-item .value { font-size: 16px; font-weight: 650; margin-top: 4px; font-family: var(--mono); }
.snap-item .value.prose { font-family: var(--sans); font-weight: 600; font-size: 14px; }
.chip { display: inline-flex; align-items: center; font-size: 11px; font-weight: 600; font-family: var(--mono); padding: 1px 6px; border-radius: 4px; background: var(--border-soft); color: var(--text-dim); }
.pill-accent { background: var(--accent-soft); color: var(--accent-text); }
details.json-toggle summary { cursor: pointer; font-size: 12.5px; color: var(--text-dim); padding: 4px 0; list-style: none; }
details.json-toggle summary::-webkit-details-marker { display: none; }
details.json-toggle summary::before { content: "▸"; display: inline-block; margin-right: 6px; transition: transform .15s ease; color: var(--text-faint); }
details.json-toggle[open] summary::before { transform: rotate(90deg); }
details.json-toggle pre { margin: 8px 0 0; padding: 12px 14px; background: var(--bg-sunken); border: 1px solid var(--border-soft); border-radius: var(--radius); font-size: 12px; overflow-x: auto; color: var(--text-dim); }
.tl-delta { font-family: var(--mono); }
.tl-delta.up { color: var(--ok); }
.tl-delta.flat { color: var(--text-faint); }
.pager { display: flex; gap: 6px; align-items: center; flex-wrap: wrap; margin-top: 12px; }
.pager-readout { font-size: 12px; color: var(--text-faint); margin-right: auto; }
.pager a.btn-ghost[aria-disabled="true"] { opacity: .4; pointer-events: none; }
.pager a.pager-current { background: var(--bg-elevated); color: var(--text); font-weight: 600; }
${SYNC_TIMELINE_STYLE}`;

function timeAgo(date) {
  if (!date) return "never";
  const ms = Date.now() - new Date(date).getTime();
  const mins = Math.floor(ms / 60000);
  if (mins < 1) return "just now";
  if (mins < 60) return `${mins}m ago`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h ago`;
  const days = Math.floor(hours / 24);
  if (days === 1) return "yesterday";
  if (days < 7) return `${days}d ago`;
  return `${Math.floor(days / 7)}w ago`;
}

// D-UP5: the four R3/R4 states, not a climbing ladder. The "brand new"
// branch from the old derived-status logic is dropped — `Type` only ever
// holds `prev`/`same` on real data, never `brand` (findings.md R3), so
// that branch was dead and its pill would have been misleading had it
// ever fired. "Parked early" is deliberately not "manually archived" — R9
// shows the stored record cannot distinguish a hand-park from mod 2133's
// `FreshPark`.
function cardStatusPill(row) {
  const label = STATE_LABELS[row.state];
  if (!label) return `<span class="pill pill-neutral">—</span>`;
  if (row.state === "inRotation") return `<span class="pill pill-ok">${label}</span>`;
  if (row.state === "retiredCeiling") return `<span class="pill pill-neutral">${label}</span>`;
  return `<span class="pill pill-warn">${label}</span>`; // parkedEarly / parkedDormant
}

function flagsHtml(row) {
  const chips = [];
  if (row.tag) chips.push(`<span class="chip">tagged</span>`);
  if (row.panic) chips.push(`<span class="chip">panic</span>`);
  return chips.join(" ");
}

function perCardRowHtml(row) {
  return `<tr>
    <td class="mono">${escapeHtml(row.id)}</td>
    <td class="wrap">${row.content ? escapeHtml(stripHtml(row.content)) : ""}</td>
    <td><span class="chip">${escapeHtml(row.side ?? "")}</span></td>
    <td>${escapeHtml(row.deckTitle || "")}</td>
    <td class="num">${row.stage ?? ""}</td>
    <td>${cardStatusPill(row)}</td>
    <td class="num">${row.interval ?? ""}</td>
    <td class="dim">${row.nextDueAt ? escapeHtml(new Date(row.nextDueAt).toISOString().slice(0, 10)) : "—"}</td>
    <td class="num">${row.reschedules ?? ""}</td>
    <td>${flagsHtml(row)}</td>
  </tr>`;
}

// `historyRowHtml` USED TO LIVE HERE. Its job — one per-PATCH timeline row,
// with the raw document fetched on first expand via `data-doc-url` (D-UP4) —
// moved into `syncTimeline.js`, which renders it as one of TWO tiers rather
// than as the whole panel. Nothing about it was deleted in spirit: the
// vocabulary, the on-demand document fetch and the dot styling are all
// carried forward there, alongside the archived tier that now shares the
// timeline with it.

// `filters` carries every GET param the toolbar/pager round-trips, always
// with `uid` merged in — one helper so the toolbar, pager and "Clear"
// link can never disagree about what the current query actually is.
function deviceQueryUrl(selectedUid, filters, overrides = {}) {
  const merged = { uid: selectedUid, ...filters, ...overrides };
  const params = new URLSearchParams();
  for (const [key, value] of Object.entries(merged)) {
    if (value === "" || value === null || value === undefined) continue;
    params.set(key, String(value));
  }
  return `/mjolnir/device?${params.toString()}`;
}

function pagerHtml(selectedUid, filters, total) {
  const totalPages = Math.max(1, Math.ceil(total / filters.size));
  const page = Math.min(Math.max(1, filters.page), totalPages);
  const from = total === 0 ? 0 : (page - 1) * filters.size + 1;
  const to = Math.min(total, page * filters.size);

  const windowStart = Math.max(1, page - 2);
  const windowEnd = Math.min(totalPages, page + 2);
  const numbered = [];
  for (let p = windowStart; p <= windowEnd; p++) {
    numbered.push(
      `<a class="btn-ghost${p === page ? " pager-current" : ""}" href="${escapeHtml(deviceQueryUrl(selectedUid, filters, { page: p }))}">${p}</a>`
    );
  }

  const navLink = (label, targetPage, disabled) =>
    `<a class="btn-ghost" href="${escapeHtml(deviceQueryUrl(selectedUid, filters, { page: targetPage }))}" ${disabled ? 'aria-disabled="true"' : ""}>${label}</a>`;

  return `<div class="pager">
    <span class="pager-readout">showing ${from}–${to} of ${total}</span>
    ${navLink("« first", 1, page <= 1)}
    ${navLink("‹ prev", Math.max(1, page - 1), page <= 1)}
    ${numbered.join("")}
    ${navLink("next ›", Math.min(totalPages, page + 1), page >= totalPages)}
    ${navLink("last »", totalPages, page >= totalPages)}
  </div>`;
}

function renderDevicePage({ accounts, selectedUid, doc, perCard, total, history, latestHistory, archive, filters, deckTitles, cardIndexInfo }) {
  if (accounts.length === 0) {
    return renderShell({
      title: "mjolnir / hub — device sync",
      activeHref: "/mjolnir/device",
      body: `<style>${DEVICE_PAGE_STYLE}</style>
<div class="page-head"><div><h2>Device sync</h2><div class="page-sub">Progress reported by the signed-in account, kept as a mirror — this view is read-only.</div></div></div>
<div class="panel panel-pad">No accounts have synced yet.</div>`,
    });
  }

  const accountOptions = accounts
    .map((uid) => `<option value="${escapeHtml(uid)}" ${uid === selectedUid ? "selected" : ""}>${escapeHtml(uid)}${accounts.length === 1 ? " — only account on record" : ""}</option>`)
    .join("");

  const snapGrid = doc
    ? `<div class="snap-grid">
        <div class="snap-item"><div class="label">Completed sessions</div><div class="value">${doc.completedSessions ?? 0}</div></div>
        <div class="snap-item"><div class="label">Consistency rate</div><div class="value">${doc.consistencyRate ?? "—"}</div></div>
        <div class="snap-item"><div class="label">Cards in progress</div><div class="value">${doc.inProgressCards ?? 0}</div></div>
        <div class="snap-item"><div class="label">Cards archived</div><div class="value">${doc.archivedCards ?? 0}</div></div>
        <div class="snap-item"><div class="label">Account since</div><div class="value">${doc.accountCreationDate ? escapeHtml(String(doc.accountCreationDate).slice(0, 10)) : "—"}</div></div>
        <div class="snap-item"><div class="label">Last completed session</div><div class="value prose">${doc.lastCompletedSession ? timeAgo(doc.lastCompletedSession) : "—"}</div></div>
      </div>`
    : `<div class="inline-note">No userdata document for this account yet.</div>`;

  const perCardRows = perCard.map(perCardRowHtml).join("\n");
  // The two-tier timeline. `historyRowHtml` is kept below as the per-PATCH
  // row's ancestor and its vocabulary lives on in syncTimeline.js.
  const historyPanel = renderSyncHistoryPanel({
    uid: selectedUid,
    recent: history,
    latestAt: latestHistory,
    archive,
    retentionHours: HISTORY_RETENTION_HOURS,
  });

  const deckOptions = deckTitles
    .map((d) => `<option value="${escapeHtml(d)}" ${d === filters.deck ? "selected" : ""}>${escapeHtml(d)}</option>`)
    .join("");
  const stateOptions = Object.entries(STATE_LABELS)
    .map(([key, label]) => `<option value="${key}" ${filters.state === key ? "selected" : ""}>${escapeHtml(label)}</option>`)
    .join("");
  const sideOption = (letter) => `<option value="${letter}" ${filters.side === letter ? "selected" : ""}>${letter}</option>`;
  const sortOption = (key, label) => `<option value="${key}" ${filters.sort === key ? "selected" : ""}>${escapeHtml(label)}</option>`;
  const sizeOptions = PAGE_SIZES.map((n) => `<option value="${n}" ${filters.size === n ? "selected" : ""}>${n} / page</option>`).join("");

  const snapshotDocUrl = `/mjolnir/device/doc?uid=${encodeURIComponent(selectedUid)}`;

  const bundleNote = cardIndexInfo.reason
    ? `<div class="inline-note">Content for stock cards is unavailable: ${escapeHtml(cardIndexInfo.reason)}. Every other column is unaffected.</div>`
    : perCard.some((r) => r.contentSource === "bundle")
      ? `<div class="inline-note" title="Content for stock cards is read from the currently published bundle.">stock card content · build <code>${escapeHtml(cardIndexInfo.buildId || "")}</code></div>`
      : "";

  return renderShell({
    title: "mjolnir / hub — device sync",
    activeHref: "/mjolnir/device",
    body: `<style>${DEVICE_PAGE_STYLE}</style>
<div class="page-head">
  <div>
    <h2>Device sync</h2>
    <div class="page-sub" title="Progress reported by the signed-in account, kept as a mirror.">Read-only mirror of the account's progress.</div>
  </div>
  <a class="btn btn-ghost" href="${escapeHtml(deviceQueryUrl(selectedUid, filters))}">↻ Refresh</a>
</div>

<form method="GET" action="/mjolnir/device">
  <div class="identity-bar">
    <div class="field">
      <label>Account (uid)</label>
      <select name="uid" onchange="this.form.submit()">${accountOptions}</select>
    </div>
  </div>
</form>

<div class="panel">
  <div class="panel-head">
    <div><h3>Progress snapshot</h3></div>
  </div>
  <div class="panel-pad">
    ${snapGrid}
    ${doc ? `<details class="json-toggle" style="margin-top:16px;" data-doc-url="${escapeHtml(snapshotDocUrl)}"><summary>raw doc</summary><pre>loading…</pre></details>` : ""}
  </div>
</div>

<div class="panel">
  <div class="panel-head">
    <div><h3>Per-card progress</h3><div class="page-sub" title="Every occurrence with SRS state, joined against card content.">${total} matching</div></div>
  </div>
  <div class="panel-pad" style="padding-bottom:0;">
    <form class="toolbar" method="GET" action="/mjolnir/device">
      <input type="hidden" name="uid" value="${escapeHtml(selectedUid)}">
      <input class="search-input" type="search" name="q" value="${escapeHtml(filters.q)}" placeholder="Search card id or content…">
      <select name="deck"><option value="">Deck: all</option>${deckOptions}</select>
      <select name="side"><option value="">Side: all</option>${sideOption("N")}${sideOption("E")}${sideOption("A")}</select>
      <select name="state"><option value="">State: all</option>${stateOptions}</select>
      <select name="flag">
        <option value="">Flag: all</option>
        <option value="tag" ${filters.flag === "tag" ? "selected" : ""}>tagged</option>
        <option value="panic" ${filters.flag === "panic" ? "selected" : ""}>panic</option>
      </select>
      <select name="sort">
        <option value="">Sort: device order</option>
        ${sortOption("id", "Card id")}${sortOption("side", "Side")}${sortOption("deck", "Deck")}${sortOption("stage", "Stage")}${sortOption("interval", "Interval")}${sortOption("nextDue", "Next due")}${sortOption("reschedules", "Reschedules")}
      </select>
      <select name="dir">
        <option value="asc" ${filters.dir === "asc" ? "selected" : ""}>asc</option>
        <option value="desc" ${filters.dir === "desc" ? "selected" : ""}>desc</option>
      </select>
      <select name="size">${sizeOptions}</select>
      <button type="submit">Filter</button>
      <a class="btn-ghost" href="/mjolnir/device?uid=${encodeURIComponent(selectedUid)}">Clear</a>
    </form>
  </div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Card</th><th title="always the card's N field, stripped of HTML — the same for every row regardless of which side was reviewed. N identifies the card; E is only ever the answer.">Content</th><th title="the stored direction letter (N/E/A), never an actual language">Side</th><th>Deck</th><th class="num">Stage</th><th>Status</th><th class="num">Interval</th><th>Next due</th><th class="num">Reschedules</th><th>Flags</th></tr></thead>
      <tbody>${perCardRows || `<tr><td colspan="10">no per-card progress matches this filter</td></tr>`}</tbody>
    </table>
  </div>
  <div class="panel-pad" style="padding-top:12px; padding-bottom:14px;">
    ${pagerHtml(selectedUid, filters, total)}

    ${bundleNote}
  </div>
</div>

<div class="panel" id="sync-history">
  <div class="panel-head">
    <div style="min-width:0"><h3>Sync history</h3><div class="page-sub">per-PATCH for ${HISTORY_RETENTION_HOURS} h, one entry per backup run before that</div></div>
  </div>
  <div class="panel-pad">
    ${historyPanel}
  </div>
</div>
<script>
// D-UP4 / 6.5: nothing above is a full document until it is asked for. Two
// kinds of expander share one handler — a JSON document (a history row's, or
// an archived version's) and a unified diff — because the only difference is
// how the response is rendered, and a second copy of the fetch logic is a
// second place for the error handling to go wrong.
document.querySelectorAll('details.json-toggle[data-doc-url], details.json-toggle[data-diff-url]').forEach((details) => {
  details.addEventListener('toggle', async () => {
    if (!details.open || details.dataset.loaded) return;
    details.dataset.loaded = '1';
    const pre = details.querySelector('pre');
    const diffUrl = details.dataset.diffUrl;
    try {
      const res = await fetch(diffUrl || details.dataset.docUrl);
      const body = await res.json().catch(() => null);
      if (!res.ok) throw new Error((body && body.error) || ('HTTP ' + res.status));
      if (diffUrl) {
        if (body.firstVersion) {
          pre.textContent = 'This is the first committed version of this file — there is no preceding commit to diff against.';
        } else if (body.error) {
          pre.textContent = 'the diff could not be produced: ' + body.error;
        } else {
          // Colour the three line kinds, nothing more: the diff itself is
          // text the backup repository produced and is inserted as text.
          pre.textContent = '';
          for (const line of String(body.diff || '').split('\n')) {
            const span = document.createElement('span');
            span.className = line.startsWith('+') ? 'd-add' : line.startsWith('-') ? 'd-del' : 'd-hdr';
            span.textContent = line + '\n';
            pre.appendChild(span);
          }
          details.closest('.tl-actions')?.parentElement?.classList?.add('has-diff');
          pre.parentElement.classList.add('diffbox');
        }
      } else {
        pre.textContent = JSON.stringify(body.doc, null, 2);
      }
    } catch (err) {
      pre.textContent = 'failed to load: ' + err.message;
      details.dataset.loaded = '';
    }
  });
});
</script>`,
  });
}

// ---- OTA console ----

function logicBundleRow(b, isActive) {
  const inspectHref = `${WORKBENCH_MOUNT}/?open=${encodeURIComponent(b.file_path)}`;
  return `<tr>
    <td>${isActive ? '<span class="pill pill-ok">● active</span>' : ""}</td>
    <td class="mono">#${b.id}</td>
    <td class="mono">${escapeHtml(b.base_version)}</td>
    <td class="num">${b.patch_rev}</td>
    <td class="wrap">${escapeHtml(b.label || "")}</td>
    <td class="mono">${escapeHtml(b.bundle_sha.slice(0, 4))}…${escapeHtml(b.bundle_sha.slice(-4))}</td>
    <td class="mono">${escapeHtml(new Date(b.created_at).toISOString())}</td>
    <td>
      <a class="btn-ghost" href="${inspectHref}" onclick="return openInWorkbench(this.href)">inspect →</a>
      <button class="btn-ghost activate-logic-bundle-btn" data-id="${b.id}" ${isActive ? "disabled" : ""}>activate</button>
    </td>
  </tr>`;
}

function renderOtaPage(logicBundles) {
  const activeId = logicBundles.find((b) => b.active)?.id;
  const rows = logicBundles.map((b) => logicBundleRow(b, b.id === activeId)).join("\n");

  return renderShell({
    title: "mjolnir / hub — submit bundle",
    activeHref: "/mjolnir/ota",
    body: `
<div class="page-head"><div><h2>Submit bundle</h2><div class="page-sub">Submitting creates a <code>logic_bundles</code> entry — it does not touch <code>current.json</code> or run <code>builder</code> by itself. Activate the one you want <code>builder</code>'s next publish to build onto.</div></div></div>

<div class="panel panel-pad">
  <div id="dropzone" class="dropzone"><div class="icon">📦</div>Drop an assembled <strong>base+patch</strong> bundle here, or <input type="file" id="file-input" style="display:none">click to choose a file</div>

  <div class="panel" style="margin-top:16px; background:var(--bg-sunken);">
    <div class="panel-pad">
      <div style="display:flex; justify-content:space-between; align-items:center;">
        <div style="font-size:13px; font-weight:600;">Verification</div>
        <span class="pill pill-neutral" id="verify-pill">no file yet</span>
      </div>
      <div class="inline-note" id="verify-note" style="margin-top:4px;">Drop a file to verify — size and magic-prefix.</div>
    </div>
  </div>

  <div class="field-row" style="margin-top:16px;" id="version-fields" hidden>
    <div class="field"><label>Base version</label><input type="text" id="base-version" placeholder="1.5.12"></div>
    <div class="field"><label>Patch rev</label><input type="number" id="patch-rev" placeholder="3"></div>
  </div>
  <div class="inline-note" id="baked-note"></div>

  <div class="field" style="margin-top:16px;"><label>Label (optional)</label><input type="text" id="label" placeholder="e.g. adds verb-conjugation patch"></div>

  <div style="display:flex; gap:8px; margin-top:16px;">
    <button class="btn-primary" id="submit-btn" disabled>Create logic bundle</button>
  </div>
  <div id="submit-result" class="inline-note"></div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Logic bundles</h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th></th><th>ID</th><th>Base</th><th>Patch</th><th>Label</th><th>sha256</th><th>Submitted</th><th></th></tr></thead>
      <tbody>${rows || `<tr><td colspan="8">no logic bundles submitted yet — drop one above to get started</td></tr>`}</tbody>
    </table>
  </div>
</div>
<div class="inline-note">"activate" is what <code>builder</code>'s <em>next</em> run will build onto — it does not publish anything by itself.</div>

<div class="panel" style="margin-top:28px; border-color: var(--err);">
  <div class="panel-head"><h3 style="color: var(--err);">⚠ Force publish to current.json now</h3></div>
  <div class="panel-pad">
    <div class="inline-note" style="margin-bottom:12px;">Emergency/manual override only. Publishes a raw bundle straight to <code>current.json</code> under a <code>buildId</code> you choose — bypasses <code>logic_bundles</code> activation and never triggers <code>builder</code>. A record is still kept in the history above (inactive), for provenance.</div>
    <div id="force-dropzone" class="dropzone"><div class="icon">⚠</div>Drop a bundle to force-publish, or <input type="file" id="force-file-input" style="display:none">click to choose a file</div>
    <div class="field-row" style="margin-top:16px;">
      <div class="field"><label>Build id</label><input type="text" id="force-build-id" placeholder="b000013"></div>
      <div class="field"><label>Label</label><input type="text" id="force-label" placeholder="emergency hotfix"></div>
    </div>
    <div class="panel" style="margin-top:16px; background:var(--bg-sunken);">
      <div class="panel-pad" style="display:flex; justify-content:space-between; align-items:center;">
        <div>
          <div style="font-size:13px; font-weight:600;">Verification</div>
          <div class="inline-note" id="force-verify-note" style="margin-top:4px;">Drop a file to verify — size, sha256, magic-prefix, buildId reuse, companion match.</div>
        </div>
        <span class="pill pill-neutral" id="force-verify-pill">no file yet</span>
      </div>
    </div>
    <div style="display:flex; gap:8px; margin-top:16px;">
      <button class="btn-primary btn-danger" style="background: var(--err); border-color: var(--err); color: #fff;" id="force-publish-btn" disabled>Force publish now</button>
    </div>
    <div id="force-result" class="inline-note"></div>
  </div>
</div>

<script>
function openInWorkbench(href) {
  window.open(href, 'mjolnir-workbench');
  return false;
}
document.querySelectorAll('.activate-logic-bundle-btn').forEach((btn) => {
  btn.addEventListener('click', async () => {
    const id = btn.dataset.id;
    const res = await fetch('/mjolnir/ota/logic-bundles/activate', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ id }) });
    if (res.ok) location.reload(); else alert('error: ' + (await res.json()).error);
  });
});

// ---- Submit (default) flow ----
let fileBytes = null;
let bakedBaseVersion = null;
let bakedPatchRev = null;
const dz = document.getElementById('dropzone');
const fileInput = document.getElementById('file-input');
const verifyPill = document.getElementById('verify-pill');
const verifyNote = document.getElementById('verify-note');
const versionFields = document.getElementById('version-fields');
const bakedNote = document.getElementById('baked-note');
const submitBtn = document.getElementById('submit-btn');
const submitResult = document.getElementById('submit-result');

dz.addEventListener('click', () => fileInput.click());
dz.addEventListener('dragover', (e) => { e.preventDefault(); dz.classList.add('dragover'); });
dz.addEventListener('dragleave', () => dz.classList.remove('dragover'));
dz.addEventListener('drop', (e) => {
  e.preventDefault();
  dz.classList.remove('dragover');
  if (e.dataTransfer.files[0]) handleFile(e.dataTransfer.files[0]);
});
fileInput.addEventListener('change', () => { if (fileInput.files[0]) handleFile(fileInput.files[0]); });

async function handleFile(file) {
  fileBytes = await file.arrayBuffer();
  verifyPill.textContent = 'verifying…';
  verifyPill.className = 'pill pill-neutral';
  const res = await fetch('/mjolnir/ota/verify-logic', { method: 'POST', headers: { 'Content-Type': 'application/octet-stream' }, body: fileBytes });
  const body = await res.json();
  if (body.ok) {
    verifyPill.textContent = '✓ ' + body.checks.length + ' checks passed';
    verifyPill.className = 'pill pill-ok';
  } else {
    verifyPill.textContent = '✗ failed';
    verifyPill.className = 'pill pill-err';
    verifyNote.textContent = body.checks.filter((c) => !c.ok).map((c) => c.check + ': ' + c.detail).join('; ');
    submitBtn.disabled = true;
    return;
  }

  bakedBaseVersion = body.baseVersion;
  bakedPatchRev = body.patchRev;
  if (bakedBaseVersion && bakedPatchRev !== null) {
    versionFields.hidden = true;
    bakedNote.textContent = 'baked base_version ' + bakedBaseVersion + ' · patch_rev ' + bakedPatchRev + ' — read automatically, nothing to type.';
  } else {
    versionFields.hidden = false;
    bakedNote.textContent = 'no baked version constants found in this bundle — enter base_version/patch_rev manually below.';
  }
  submitBtn.disabled = false;
}

submitBtn.addEventListener('click', async () => {
  submitBtn.disabled = true;
  submitResult.textContent = 'creating logic bundle…';
  try {
    const res = await fetch('/mjolnir/ota/submit', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/octet-stream',
        'X-Label': document.getElementById('label').value,
        'X-Base-Version': document.getElementById('base-version').value,
        'X-Patch-Rev': document.getElementById('patch-rev').value,
      },
      body: fileBytes,
    });
    const body = await res.json();
    if (res.ok) {
      submitResult.textContent = 'created logic bundle #' + body.id + ' (base ' + body.base_version + ' · patch ' + body.patch_rev + ') — activate it above when ready.';
      setTimeout(() => location.reload(), 1200);
    } else {
      submitResult.textContent = 'error: ' + body.error;
    }
  } catch (err) {
    submitResult.textContent = 'error: ' + err.message;
  } finally {
    submitBtn.disabled = false;
  }
});

// ---- Force-publish flow ----
let forceFileBytes = null;
const forceDz = document.getElementById('force-dropzone');
const forceFileInput = document.getElementById('force-file-input');
const forceBuildIdInput = document.getElementById('force-build-id');
const forceVerifyPill = document.getElementById('force-verify-pill');
const forceVerifyNote = document.getElementById('force-verify-note');
const forcePublishBtn = document.getElementById('force-publish-btn');
const forceResult = document.getElementById('force-result');

forceDz.addEventListener('click', () => forceFileInput.click());
forceDz.addEventListener('dragover', (e) => { e.preventDefault(); forceDz.classList.add('dragover'); });
forceDz.addEventListener('dragleave', () => forceDz.classList.remove('dragover'));
forceDz.addEventListener('drop', (e) => {
  e.preventDefault();
  forceDz.classList.remove('dragover');
  if (e.dataTransfer.files[0]) handleForceFile(e.dataTransfer.files[0]);
});
forceFileInput.addEventListener('change', () => { if (forceFileInput.files[0]) handleForceFile(forceFileInput.files[0]); });

async function handleForceFile(file) {
  forceFileBytes = await file.arrayBuffer();
  if (!forceBuildIdInput.value) forceBuildIdInput.value = file.name.replace(/[^A-Za-z0-9._-]/g, '').slice(0, 20) || 'b' + Date.now();
  await runForceVerify();
}

async function runForceVerify() {
  if (!forceFileBytes) return;
  forceVerifyPill.textContent = 'verifying…';
  forceVerifyPill.className = 'pill pill-neutral';
  const res = await fetch('/mjolnir/ota/verify', {
    method: 'POST',
    headers: { 'Content-Type': 'application/octet-stream', 'X-Build-Id': forceBuildIdInput.value },
    body: forceFileBytes,
  });
  const body = await res.json();
  if (body.ok) {
    forceVerifyPill.textContent = '✓ ' + body.checks.length + ' checks passed';
    forceVerifyPill.className = 'pill pill-ok';
    forcePublishBtn.disabled = false;
  } else {
    const failed = body.checks.filter((c) => !c.ok).map((c) => c.check + ': ' + c.detail).join('; ');
    forceVerifyPill.textContent = '✗ failed';
    forceVerifyPill.className = 'pill pill-err';
    forceVerifyNote.textContent = failed;
    forcePublishBtn.disabled = true;
  }
}
forceBuildIdInput.addEventListener('change', runForceVerify);

forcePublishBtn.addEventListener('click', async () => {
  if (!confirm('Force-publish straight to current.json now? This bypasses logic_bundles activation and builder entirely.')) return;
  forcePublishBtn.disabled = true;
  forceResult.textContent = 'publishing…';
  try {
    const res = await fetch('/mjolnir/ota/force-publish', {
      method: 'POST',
      headers: { 'Content-Type': 'application/octet-stream', 'X-Build-Id': forceBuildIdInput.value, 'X-Label': document.getElementById('force-label').value },
      body: forceFileBytes,
    });
    const body = await res.json();
    forceResult.textContent = res.ok ? ('published ' + body.buildId + ' — sha256 ' + body.sha256) : ('error: ' + body.error);
  } catch (err) {
    forceResult.textContent = 'error: ' + err.message;
  } finally {
    forcePublishBtn.disabled = false;
  }
});
</script>`,
  });
}

export function createServer(pool, config, boot) {
  // bundle-session-management: reachable embedded here, with no local
  // `bundle-tool ui`/npx invocation required for a deployed instance.
  // Instantiated once (not per-request) — its session store is an
  // in-memory Map that must survive across requests. `patchesDir` is the
  // same `patches/` directory the standalone CLI and `bundle-tool assemble`
  // already read/write, so a logic bundle assembled here is immediately
  // visible to the CLI and vice versa.
  const workbenchHandler = createWorkbenchHandler({ patchesDir: config.workbenchPatchesDir || "patches" });

  return http.createServer(async (req, res) => {
    // Declared OUTSIDE the try so the catch below can use it — the error
    // path needs to know whether the caller wanted JSON or HTML.
    const url = new URL(req.url, "http://localhost");
    try {

      // unified-auth 4.1/4.2. D-H6's cookie, its /mjolnir/login page and its
      // POST handler are GONE. The gateway is the gate: `basic_auth` on all
      // seven operator zones, and `X-Tun-Operator` set only on a request
      // that passed it. This check is what makes the workbench reject
      // anything that reached the container WITHOUT going through the
      // gateway — and in production nothing can, because no service
      // publishes a port outside the loopback interface (4.7).
      //
      // UNCONDITIONAL, unlike D-H6's version. The old gate disabled itself
      // when OPERATOR_AUTH_TOKEN was unset, which made a missing value a
      // silently open console. The marker needs no configured value at all,
      // so there is nothing left that can be forgotten into openness.
      //
      // ONE CHECK, PLACED ABOVE EVERYTHING INCLUDING THE EMBEDDED WORKBENCH.
      // D-H6 needed a second copy inside the /mjolnir/workbench branch,
      // because that branch returns before the per-route gate below it; the
      // first draft of this change deleted that copy and left the workbench
      // and its /api/patches open, which hub's own test caught. A single
      // check above every branch is the version that cannot be half-removed.
      //
      // NOTHING IS ABOVE IT ANY MORE (2026-11-14, P54). `/mjolnir/_health`
      // used to be — a hand-written branch returning before the gate, which
      // is P50's shape again, three times over across the three Node services
      // and at three different paths. The exemption belongs to
      // libs/jsservice/auth.js now: `prefix` names this service's probe URL,
      // `requireAuth` lets exactly that one path through, and the handler
      // below runs unchanged.
      if (!requireAuth(req, res, config.internalToken, { prefix: "/mjolnir" })) return;

      // Liveness AND readiness, for the container health check only — the one
      // unauthenticated path, exempted by the shared check above.
      //
      // Added after independent review found every Node probe was
      // liveness-only — `node -e "...then(() => process.exit(0))"` exits 0 for
      // ANY HTTP status, so with the database down /_health said degraded
      // while `docker inspect` said healthy. That is verbatim the P45 symptom
      // ("its health check also still said healthy") reproduced in a new
      // place. The status code here is what the probe keys on: 200 ready,
      // 503 degraded.
      if (url.pathname === "/mjolnir/_health") {
        const ready = boot ? boot.dbReady() : true;
        return sendJson(res, ready ? 200 : 503, {
          service: "mjolnir-workbench",
          status: boot ? boot.status() : "ready",
          db: ready,
        });
      }

      // The embedded workbench's routes and static assets live under one
      // prefix rather than in hub's per-page route list, so they are handled
      // here, above that list. The credential check is the one above.
      if (url.pathname === WORKBENCH_MOUNT) {
        // Relative asset/API paths (`app.js`, `api/...`) only resolve
        // correctly against a trailing-slash URL — redirect once, like any
        // static-site mount point would.
        res.writeHead(302, { Location: `${WORKBENCH_MOUNT}/` });
        return res.end();
      }
      if (url.pathname === WORKBENCH_MOUNT + "/" || url.pathname.startsWith(WORKBENCH_MOUNT + "/")) {
        // Strip the mount prefix so the embedded handler sees exactly the
        // same paths it would standalone (`/`, `/app.js`, `/api/...`).
        req.url = url.pathname.slice(WORKBENCH_MOUNT.length) + url.search;
        return workbenchHandler(req, res);
      }


      // ---- READINESS GATE (zone-isolation 1.5) ---------------------------
      // The console now SERVES before it migrates, which means `boot.dbReady()`
      // is a real state rather than an invariant. Every database-backed route
      // is listed here and answered with a degraded response instead of being
      // allowed to throw a driver error at the user.
      //
      // One gate rather than a check inside each of the twelve handlers: the
      // list is then visible in one place and cannot silently fall out of step
      // with itself, and a new database-backed page that forgets to degrade is
      // a one-line fix here.
      //
      // Everything NOT listed keeps working with no database at all — the
      // workbench and its bundle editing, the Assemble tab, the OTA verify
      // tool, and the login page. That is the whole point: a database outage
      // costs you the catalogue, not the console.
      if (boot && !boot.dbReady() && isDatabaseBacked(url.pathname)) {
        // The raw driver message names internal hostnames and driver
        // internals ("getaddrinfo ENOTFOUND postgres"). That is log material,
        // not operator-facing copy - the Python half already learned this
        // (P59's sibling fix). The detail stays in the log, where
        // `boot.lastError()` is already recorded on every attempt.
        const why = "the database is not reachable";
        if (wantsJson(url.pathname)) {
          return sendJson(res, 503, { error: "database unavailable", detail: why });
        }
        res.writeHead(503, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({
          title: "mjolnir — database unavailable",
          activeHref: url.pathname,
          body: `<div class="page-head"><div><h2>Database unavailable</h2>
            <div class="page-sub">This view needs the database, which is not
            reachable right now. The console itself, the workbench and the OTA
            tools keep working — and devices are unaffected, because updates
            are served off disk.</div></div></div>
            <div class="inline-note">Retrying automatically. Reason:
            <code>${escapeHtml(why)}</code></div>`,
        }));
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/api/publications") {
        return sendJson(res, 200, await listPublications());
      }

      // card-preview-popup task 6 (design.md §6, acceptance C37-C39):
      // operator-plane settings storage. Reachable only because it is
      // behind the SAME unconditional `requireAuth` check above everything
      // else in this handler — there is no second auth mechanism here, and
      // no device-plane route (/ota/*, /blob/*, /audio-manifest/*,
      // /mjolnir/userdata/* — the latter served by mjolnir-sync, a
      // different process entirely, D158) reads or writes this table: this
      // route lives only in hub, under /mjolnir/api/, never under any
      // device-plane prefix.
      //
      // GET returns every stored key at once — the Cards page load reads a
      // handful of keys (the view state, the popup preferences) in one
      // round trip rather than one request per key. A database outage
      // degrades to `{ settings: {}, degraded: true }` with a 200, not a
      // 503 — see the isDatabaseBacked() carve-out note above for why this
      // path is deliberately excluded from that gate.
      if (req.method === "GET" && url.pathname === "/mjolnir/api/settings") {
        const { values, degraded } = await getAllSettings(pool);
        return sendJson(res, 200, { settings: values, degraded });
      }

      // POST { key, value } upserts one key. Never 500s on a database
      // failure for the same reason the GET above never 503s: the
      // client-side debounced autosave (cardPreviewPopup.js) treats
      // `{ ok: false, degraded: true }` as "didn't stick this time", not as
      // a reason to retry-storm or surface an error to the operator.
      if (req.method === "POST" && url.pathname === "/mjolnir/api/settings") {
        const body = await readJson(req);
        if (!isValidSettingKey(body.key)) {
          return sendJson(res, 400, { error: "invalid or missing settings key" });
        }
        const result = await setSetting(pool, body.key, body.value);
        return sendJson(res, 200, result);
      }

      // D109: hub's own "Builder" nav pages — see the top-of-file import
      // comment. All three reuse builder's exact body-builder functions and
      // pure read-functions; only the schedule/publish POST actions stay on
      // builder's own `/builder/api/*` routes (the pages' inline scripts
      // already reference those as root-absolute paths, which Caddy already
      // routes to builder's container regardless of which service rendered
      // the surrounding page — no proxying needed for those).
      if (req.method === "GET" && url.pathname === "/mjolnir/builder/forecast") {
        if (!config.stabburBaseUrl || !config.internalToken) {
          res.writeHead(500, { "Content-Type": "text/plain" });
          return res.end("STABBUR_BASE_URL/INTERNAL_TOKEN are not set for hub — add them to .env to enable this page.");
        }
        // DEGRADE TO A LOST PANEL, NOT A LOST PAGE — the same guard
        // builder/src/server.js already has on its own copy of this page.
        // This copy was left unguarded, so hub's Builder nav page answered
        // 500 for a stabbur fault while builder's identical page degraded
        // cleanly. One dependency, two answers, decided by which service
        // rendered it. Now bounded (stabburClient.js) as well as caught, so a
        // HUNG stabbur lands here too instead of hanging the request.
        let forecastError = null;
        const forecastOrNull = runForecast(pool, {
          stabburBaseUrl: config.stabburBaseUrl,
          internalToken: config.internalToken,
          sourceLang: config.sourceLang,
        }).catch((err) => {
          forecastError = err;
          console.error(`[mjolnir-workbench] forecast unavailable: ${err.message}`);
          return null;
        });
        const [forecastRaw, jobs, activeLogicBundle] = await Promise.all([
          forecastOrNull,
          recentBuildJobs(pool),
          getActiveMeta(pool),
        ]);
        // The empty shape comes from builder's own module (one definition,
        // two servers) — hub's private copy of it was a second place for
        // `runForecast`'s shape to be got wrong.
        const forecast = forecastRaw || emptyForecast(forecastError?.message);
        const [deckMeta, shipOrders, integrity, runState] = await Promise.all([
          loadDeckMeta(pool, forecast.byDeck.map((d) => d.deckCode)),
          loadShipOrders(pool, forecast),
          // D-FA4: the same check builder's own page renders — one
          // implementation, imported, never a second copy (D109).
          checkOccurrenceIntegrity(pool),
          describeLastRun(pool, { jobs }),
        ]);
        // D109: builder's own body function, hub's own shell — identical
        // markup at both routes. The job-detail links point at hub's copy
        // of the run log; the POST actions stay on `/builder/api/*`, which
        // the gateway routes to builder's container whichever service
        // rendered the page.
        const body =
          buildShipStripsBody({
            forecast,
            deckMeta,
            shipOrders,
            activeLogicBundle,
            integrity,
            runState,
            logsBase: "/mjolnir/builder/logs",
          }) + shipStripsPageExtras();
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({ title: "mjolnir / hub — ship strips", activeHref: "/mjolnir/builder/forecast", body }));
      }
      if (req.method === "GET" && url.pathname === "/mjolnir/builder/schedule") {
        const body = buildScheduleBody(await getSchedule(pool));
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({ title: "mjolnir / hub — schedule", activeHref: "/mjolnir/builder/schedule", body }));
      }
      if (req.method === "GET" && url.pathname === "/mjolnir/builder/logs") {
        const jobId = url.searchParams.get("job");
        const [jobs, selectedJob] = await Promise.all([recentBuildJobs(pool), jobId ? getBuildJob(pool, Number(jobId)) : null]);
        const logLines = selectedJob ? await jobLogLines(pool, selectedJob.id) : [];
        const body = buildLogsBody(jobs, selectedJob, logLines, "/mjolnir/builder/logs");
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({ title: "mjolnir / hub — run log", activeHref: "/mjolnir/builder/logs", body }));
      }
      if (req.method === "GET" && url.pathname === "/mjolnir/decks") {
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderDecksPage(await listDecks()));
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/decks/api/description") {
        const { code, description } = await readJson(req);
        await updateDeckDescription(code, description);
        return sendJson(res, 200, { ok: true });
      }

      // /mjolnir/ui is an alias for the bare path, kept for existing links
      // and bookmarks. unified-auth 5.5 superseded D46's /ui convention —
      // stabbur and smia serve at their prefix roots now — so `/mjolnir` is
      // the entry point and `/mjolnir/ui` is simply the same page. The bare path is kept working too — existing bookmarks,
      // the Caddyfile's own bare-path handling, and every internal link
      // built before this alias existed all still resolve.
      if (
        req.method === "GET" &&
        (url.pathname === "/mjolnir" || url.pathname === "/mjolnir/" || url.pathname === "/mjolnir/ui")
      ) {
        // ota-pull-tracking 5.1: the pull columns need the same ingest the
        // Pulls page triggers, so a build downloaded a minute ago is already
        // counted here. Same contract: this never rejects and never blocks
        // the page — a pull summary that could not be read renders as the
        // columns' empty state, not as an error.
        const ingest = await maybeIngest();
        const [publications, current] = [await listPublications(), readCurrent(config.dataDir)];
        let pullSummary = new Map();
        try {
          // `current.json` is the authority on which build is live, not the
          // publication order — a rollback (D26) repoints it at an older
          // build — so the summary is told which one that is.
          pullSummary = await pullSummaryByBuild({ currentBuildId: current ? current.buildId : null });
        } catch (err) {
          console.error(`[ota-pulls] pull summary unavailable: ${err.message}`);
        }
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderHistoryPage(publications, current, config, { pullSummary, ingest }));
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/catalogue") {
        const [publications, logicBundles] = [await listPublications(), await listLogicBundles()];
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderCataloguePage(publications, logicBundles, config));
      }
      // Lightweight JSON twin of the human-facing catalogue page above —
      // fetched by the workbench's own "Catalogue" tab (src/ui-assets/) when
      // it's running embedded inside hub, so an operator can open any past
      // OTA build or logic bundle without leaving the workbench tool to
      // visit a separate hub page first. 404s harmlessly when the workbench
      // runs standalone (its own tiny CLI server has no such route), which
      // the tab's own fetch handles as "catalogue unavailable here."
      if (req.method === "GET" && url.pathname === "/mjolnir/catalogue.json") {
        const [publications, logicBundles] = [await listPublications(), await listLogicBundles()];
        const activeLogicBundleId = logicBundles.find((b) => b.active)?.id;
        return sendJson(res, 200, {
          builds: publications.map((p) => ({
            buildId: p.build_id,
            label: p.label,
            path: path.join(config.dataDir, "ota", "bundle", `${p.build_id}.js`),
          })),
          logicBundles: logicBundles.map((b) => ({
            id: b.id,
            baseVersion: b.base_version,
            label: b.label,
            path: b.file_path,
            active: b.id === activeLogicBundleId,
          })),
        });
      }
      // Streams a historical build's exact published bytes — the operator
      // asked to be able to inspect/download a publish, not just see its
      // metadata row. Same file `setCurrent`/`forcePublish` already treat as
      // the on-disk source of truth; this route only ever reads it.
      if (req.method === "GET" && url.pathname.startsWith("/mjolnir/ota/download/")) {
        const buildId = decodeURIComponent(url.pathname.slice("/mjolnir/ota/download/".length));
        const bundlePath = path.join(config.dataDir, "ota", "bundle", `${buildId}.js`);
        let bytes;
        try {
          bytes = fs.readFileSync(bundlePath);
        } catch {
          res.writeHead(404, { "Content-Type": "text/plain" });
          return res.end(`no bundle on disk for "${buildId}"`);
        }
        // D-C7: the build id alone was never a meaningful filename — fold
        // the publication's own label in when it has one.
        const publication = (await listPublications()).find((p) => p.build_id === buildId);
        const filename = `${buildId}${publication && publication.label ? `-${slugify(publication.label)}` : ""}.js`;
        res.writeHead(200, {
          "Content-Type": "application/javascript; charset=utf-8",
          "Content-Disposition": `attachment; filename="${filename}"`,
          "Content-Length": bytes.length,
        });
        return res.end(bytes);
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/cards") {
        // card-preview-popup task group 5 / task group 6: the popup
        // preferences AND the Cards-page view state (source/filters/sort/
        // page size/page, `cardsPage.view`) are read once here, the same
        // getAllSettings() the /mjolnir/api/settings GET route uses — it
        // degrades to `{}` on its own on a database hiccup (D157), which
        // is exactly why "/mjolnir/cards" is NOT in DB_BACKED any more
        // (acceptance C39): this route must reach its own handler even
        // while postgres is down, not 503 before it gets the chance to
        // degrade.
        const { values: settings } = await getAllSettings(pool);
        const queryParam = url.searchParams.get("source");
        const savedSource = settings[CARDS_PAGE_SETTINGS_KEY] && settings[CARDS_PAGE_SETTINGS_KEY].source;
        let source = queryParam || savedSource || "minted";
        // C38 "stale settings degrade": a saved source naming a build id
        // that no longer has a `publications` row falls back to Minted
        // with no error. The regex check alone only catches a malformed id
        // — it does NOT catch a well-formed id whose row was deleted (the
        // bundle FILE can still be on disk and readable, so bundleRows()
        // below would happily serve the orphaned build instead of
        // degrading). So: fetch `publications` first, then reset to
        // "minted" on EITHER a bad-shaped id OR one absent from the
        // current list — not against the bundle FILE, which is a
        // separate, file-missing-but-row-present case bundleRows()'s own
        // error path reports inline instead of here.
        let publicationsForSourceCheck = [];
        try {
          publicationsForSourceCheck = await listPublications();
        } catch {
          // Degrades the same way the later listPublications() call for the
          // picker does (C39) — an unreachable `publications` list cannot
          // validate a build id, so fall through to Minted below.
          publicationsForSourceCheck = null;
        }
        let rejectedSourceMessage = null;
        if (source !== "minted") {
          const malformed = !BUILD_ID_PATTERN.test(source);
          const missingRow =
            !malformed &&
            publicationsForSourceCheck !== null &&
            !publicationsForSourceCheck.some((p) => p.build_id === source);
          // Only the malformed case gets a visible explanation — C38
          // requires the deleted-publications-row case to degrade to
          // Minted with NO error (its bundle file is still legitimately
          // unreachable through this picker, not a mistake worth
          // surfacing), so `missingRow` resets `source` silently.
          if (malformed) rejectedSourceMessage = `Source "${source}" is not a recognised build id — showing Minted instead.`;
          if (malformed || missingRow) source = "minted";
        }
        if (queryParam && source !== savedSource) {
          const priorView = settings[CARDS_PAGE_SETTINGS_KEY] || {};
          await setSetting(pool, CARDS_PAGE_SETTINGS_KEY, { ...priorView, source });
        }
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          await renderCardsPage(pool, {
            source,
            dataDir: config.dataDir,
            baseFolderDir: config.baseFolderDir,
            stabburUiBase: config.stabburUiBase,
            settings,
            sourceNotice: rejectedSourceMessage,
          })
        );
      }

      // card-preview's audio stream. assembly-tab-usability item 3: no
      // longer a static <audio> element's src — the preview now taps a
      // face, which constructs `new Audio(...)` in JS and calls `.play()`
      // on it (never inserted into the DOM), so this route's response is
      // identical but nothing here renders an <audio> tag any more.
      if (req.method === "GET" && url.pathname.startsWith("/mjolnir/cards/") && url.pathname.endsWith("/audio")) {
        const cardId = decodeURIComponent(url.pathname.slice("/mjolnir/cards/".length, -"/audio".length));
        const slot = await getCardSlot(pool, cardId);
        const blobPath = slot && slot.audio_sha256 ? path.join(config.dataDir, "blob", slot.audio_sha256) : null;
        if (!blobPath || !fs.existsSync(blobPath)) {
          res.writeHead(404, { "Content-Type": "text/plain" });
          return res.end(`no audio on disk for "${cardId}"`);
        }
        const bytes = fs.readFileSync(blobPath);
        res.writeHead(200, { "Content-Type": "audio/mpeg", "Content-Length": bytes.length });
        return res.end(bytes);
      }

      // assembly-tab-usability item 3 (task 3.3): the preview's real fonts
      // — Poppins (several weights) and `arial.ttf`, the same files the
      // stock app bundles (`base/.../assets/fonts/`) — served here rather
      // than falling back to a browser's system sans, since the whole
      // point of `arialFont`/`arialFontNormal` is that Poppins lacks IPA
      // glyphs. An explicit allowlist (`CARD_PREVIEW_FONTS`), not a path
      // param, so this route can never be made to read anything else out
      // of `base/` (D04 — read-only input, reading is fine, an open path
      // is not).
      if (req.method === "GET" && url.pathname.startsWith("/mjolnir/cards/fonts/")) {
        const requested = decodeURIComponent(url.pathname.slice("/mjolnir/cards/fonts/".length));
        const font = CARD_PREVIEW_FONTS.find((f) => f.file === requested);
        if (!font) {
          res.writeHead(404, { "Content-Type": "text/plain" });
          return res.end("unknown font");
        }
        const fontPath = path.join(config.baseFolderDir, "assets", "fonts", font.file);
        if (!fs.existsSync(fontPath)) {
          res.writeHead(404, { "Content-Type": "text/plain" });
          return res.end(`font not found in base folder: ${font.file}`);
        }
        const bytes = fs.readFileSync(fontPath);
        res.writeHead(200, {
          "Content-Type": "font/ttf",
          "Content-Length": bytes.length,
          "Cache-Control": "public, max-age=86400",
        });
        return res.end(bytes);
      }

      // card-preview-popup task 2: the cascade engine itself (hub/src/cardRenderer.js)
      // served VERBATIM so the browser runs the exact same cascade/normalize
      // logic Node uses server-side and in this package's tests — one
      // source of truth, not a hand-kept-in-sync client copy (the defect
      // class this whole change exists to remove). Read-only, fixed path,
      // no query/param-driven file selection.
      if (req.method === "GET" && url.pathname === "/mjolnir/cards/render-engine.js") {
        const enginePath = path.join(path.dirname(new URL(import.meta.url).pathname), "cardRenderer.js");
        const bytes = fs.readFileSync(enginePath);
        res.writeHead(200, {
          "Content-Type": "application/javascript; charset=utf-8",
          "Content-Length": bytes.length,
          "Cache-Control": "no-cache",
        });
        return res.end(bytes);
      }

      // card-preview-popup task 3: the popup's own pure-logic engine
      // (hub/src/cardPreviewEngine.js), served verbatim for the same
      // reason as render-engine.js just above — one source of the
      // direction/stepping/occurrence-summary rules, not a server copy and
      // a hand-kept-in-sync client copy.
      if (req.method === "GET" && url.pathname === "/mjolnir/cards/popup-engine.js") {
        const enginePath = path.join(path.dirname(new URL(import.meta.url).pathname), "cardPreviewEngine.js");
        const bytes = fs.readFileSync(enginePath);
        res.writeHead(200, {
          "Content-Type": "application/javascript; charset=utf-8",
          "Content-Length": bytes.length,
          "Cache-Control": "no-cache",
        });
        return res.end(bytes);
      }

      // card-preview-popup task group 4: the tools drawer's own pure-logic
      // engine (hub/src/cardPreviewDrawer.js), served verbatim for the same
      // reason as render-engine.js/popup-engine.js above — one source of
      // the resize-clamp/snippet-wrap/catalogue-row-building rules.
      if (req.method === "GET" && url.pathname === "/mjolnir/cards/drawer-engine.js") {
        const enginePath = path.join(path.dirname(new URL(import.meta.url).pathname), "cardPreviewDrawer.js");
        const bytes = fs.readFileSync(enginePath);
        res.writeHead(200, {
          "Content-Type": "application/javascript; charset=utf-8",
          "Content-Length": bytes.length,
          "Cache-Control": "no-cache",
        });
        return res.end(bytes);
      }

      // card-preview-popup task group 5: the Cards page's own pure-logic
      // engine (hub/src/cardsPageEngine.js), served verbatim for the same
      // reason as the three engines above — one source of the filter/
      // sort/paginate/occurrence-cell rules.
      if (req.method === "GET" && url.pathname === "/mjolnir/cards/cards-engine.js") {
        const enginePath = path.join(path.dirname(new URL(import.meta.url).pathname), "cardsPageEngine.js");
        const bytes = fs.readFileSync(enginePath);
        res.writeHead(200, {
          "Content-Type": "application/javascript; charset=utf-8",
          "Content-Length": bytes.length,
          "Cache-Control": "no-cache",
        });
        return res.end(bytes);
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/device") {
        const accounts = await listAccounts();
        // Read-only (spec requirement): restricted to a uid `listAccounts`
        // actually returned, never an arbitrary query param — the doc read
        // below is a plain read (`userdataDoc`), never `getOrCreate`, so
        // merely viewing this page can never side-effect a new row.
        const requestedUid = url.searchParams.get("uid") || "";
        const selectedUid = accounts.includes(requestedUid) ? requestedUid : accounts[0] || "";

        const sizeParam = Number(url.searchParams.get("size"));
        const filters = {
          page: Math.max(1, Math.trunc(Number(url.searchParams.get("page"))) || 1),
          size: PAGE_SIZES.includes(sizeParam) ? sizeParam : 50,
          sort: url.searchParams.get("sort") || "",
          dir: url.searchParams.get("dir") === "desc" ? "desc" : "asc",
          deck: url.searchParams.get("deck") || "",
          side: url.searchParams.get("side") || "",
          state: url.searchParams.get("state") || "",
          flag: url.searchParams.get("flag") || "",
          q: url.searchParams.get("q") || "",
        };

        const index = cardIndex(config.dataDir);
        // THE TWO TIERS ARE FETCHED SIDE BY SIDE AND NEITHER CAN FAIL THE
        // OTHER. `archiveHistory` never throws — it returns `{ok:false,
        // reason}` on a timeout, a refusal or an unconfigured URL — so a
        // stopped `backup-console` degrades exactly one region of one panel
        // and this Promise.all still resolves (criteria 39-40).
        const [doc, progress, history, latestHistory, deckTitles, archive] =
          accounts.length && selectedUid
            ? await Promise.all([
                userdataDoc(selectedUid),
                perCardProgress(selectedUid, { ...filters, cardIndex: index }),
                historyDeltas(selectedUid, { limit: 50, sinceHours: HISTORY_RETENTION_HOURS }),
                latestHistoryAt(selectedUid),
                distinctDeckTitles(selectedUid),
                archiveHistory(config, selectedUid, { limit: 60 }),
              ])
            : [null, { rows: [], total: 0 }, [], null, [], { ok: false, reason: "no account selected" }];

        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          renderDevicePage({
            accounts,
            selectedUid,
            doc: doc || null,
            perCard: progress.rows,
            total: progress.total,
            history: history || [],
            latestHistory,
            archive,
            filters,
            deckTitles,
            cardIndexInfo: { reason: index.reason, buildId: index.buildId },
          })
        );
      }

      // D-UP4: the per-card table's raw docs load on demand from here —
      // same uid-restricted posture as the page itself, never an arbitrary
      // query param. `historyId` must belong to `uid`.
      if (req.method === "GET" && url.pathname === "/mjolnir/device/doc") {
        const accounts = await listAccounts();
        const uid = url.searchParams.get("uid") || "";
        if (!accounts.includes(uid)) return sendJson(res, 404, { error: "no such account" });

        const historyIdParam = url.searchParams.get("historyId");
        if (historyIdParam) {
          const doc = await historyDoc(uid, Number(historyIdParam));
          if (doc === undefined) return sendJson(res, 404, { error: "no such history entry" });
          return sendJson(res, 200, { doc });
        }
        return sendJson(res, 200, { doc: await userdataDoc(uid) });
      }

      // userdata-git-history 6.5: ONE archived version's document, and its
      // diff against the preceding commit, fetched only when the operator
      // opens that entry. Same uid-restricted posture as every other
      // account-scoped route here — the uid must be one `listAccounts`
      // returned, never an arbitrary query param.
      //
      // DEGRADES, NEVER 500s. backup-console being down is the normal
      // condition this whole panel is designed around, so it comes back as a
      // readable reason with a 503, which the page prints in the expander
      // rather than replacing the page with an error.
      if (req.method === "GET" && url.pathname === "/mjolnir/device/archive") {
        const accounts = await listAccounts();
        const uid = url.searchParams.get("uid") || "";
        if (!accounts.includes(uid)) return sendJson(res, 404, { error: "no such account" });
        const sha = url.searchParams.get("sha") || "";
        const wantDiff = url.searchParams.get("diff") === "1";
        const result = await archiveVersion(config, uid, sha, { diff: wantDiff });
        if (!result.ok) return sendJson(res, 503, { error: result.reason || "the archive could not be read" });
        if (wantDiff) {
          return sendJson(res, 200, {
            diff: result.diff,
            parent: result.parent || null,
            firstVersion: !!result.firstVersion,
            error: result.diffError || null,
          });
        }
        // Parsed here so the page's existing `raw doc` expander renders an
        // archived version exactly as it renders a history row's document —
        // one shape, one client-side branch.
        let parsed = null;
        try {
          parsed = JSON.parse(result.text);
        } catch (err) {
          return sendJson(res, 502, { error: `the archived version is not valid JSON: ${err.message}` });
        }
        return sendJson(res, 200, { doc: parsed });
      }

      // device-insights-page: a separate, additional tab, not a
      // replacement for Sync (D126/proposal's own Non-Goals). Same
      // uid-restricted posture as every other account-scoped route here.
      // ota-pull-tracking 4.1. Ingest runs HERE, before the read, so opening
      // the page is what makes it current — plus a background loop in
      // bin/server.js for the long stretches when nobody has it open. It is
      // awaited but cannot fail the render: `maybeIngest` resolves to a
      // report with an `error` field and never rejects, and the page says so
      // in a note instead of 500ing because a log directory is missing.
      if (req.method === "GET" && url.pathname === "/mjolnir/device/pulls") {
        const ingest = await maybeIngest();
        const filters = readPullFilters(url);
        const [stats, events, activity, builds, counts, publications] = await Promise.all([
          pullStats({ window: filters.window }),
          listPullEvents(filters),
          activityByDay({ days: 30 }),
          pulledBuildIds(),
          countPullEvents(filters),
          listPublications(),
        ]);
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          renderShell({
            title: "mjølnir · hub — OTA pulls",
            activeHref: "/mjolnir/device/pulls",
            body: renderPullsBody({
              stats,
              events,
              activity,
              builds,
              filters,
              counts,
              publishedCount: publications.length,
              ingest,
            }),
          })
        );
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/device/insights") {
        const accounts = await listAccounts();
        const requestedUid = url.searchParams.get("uid") || "";
        const selectedUid = accounts.includes(requestedUid) ? requestedUid : accounts[0] || "";
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          renderShell({
            title: "mjølnir · hub — Insights",
            activeHref: "/mjolnir/device/insights",
            body: renderInsightsPage({ accounts, selectedUid }),
          })
        );
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/device/insights.json") {
        const accounts = await listAccounts();
        const uid = url.searchParams.get("uid") || "";
        if (!accounts.includes(uid)) return sendJson(res, 404, { error: "no such account" });
        const insights = await buildInsights(uid, { dataDir: config.dataDir });
        return sendJson(res, 200, insights);
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/ota") {
        const logicBundles = await listLogicBundles();
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderOtaPage(logicBundles));
      }
      // D-L1/task 4.1: the default submit flow's own, narrower verification
      // — no buildId exists yet for a freshly-dropped logic bundle. Also
      // surfaces the baked base_version/patch_rev (or nulls, prompting the
      // UI's manual-entry fields) so the operator sees what will actually be
      // recorded before confirming.
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/verify-logic") {
        const bytes = await readBody(req);
        const verify = verifyLogicBundleBytes(bytes);
        return sendJson(res, 200, {
          ...verify,
          baseVersion: findBakedBaseVersion(bytes),
          patchRev: findBakedPatchRev(bytes),
        });
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/submit") {
        const bytes = await readBody(req);
        const label = req.headers["x-label"] || null;
        const baseVersion = req.headers["x-base-version"] || undefined;
        const patchRevHeader = req.headers["x-patch-rev"];
        const patchRev = patchRevHeader ? Number(patchRevHeader) : undefined;
        const row = await submitBundle(bytes, {
          label,
          baseVersion,
          patchRev,
          dataDir: config.dataDir,
          logicBundleDir: config.logicBundleDir,
        });
        return sendJson(res, 200, row);
      }
      // D112: the embedded Assemble tab's one-step flow — assembles
      // against this repo's own one base folder (`config.baseFolderDir`,
      // never client-supplied) and submits the result as a new
      // `logic_bundles` row directly. `GET .../assemble-defaults` is what
      // the Assemble tab probes on load both to detect "running embedded in
      // hub" (vs. standalone bundle-tool, which has no such route) and to
      // show the operator what an empty Label/Patch rev field will resolve
      // to before they hit "Assemble".
      if (req.method === "GET" && url.pathname === "/mjolnir/ota/assemble-defaults") {
        const defaults = await assembleDefaults({
          baseFolderDir: config.baseFolderDir,
          publicBase: config.publicBase,
          operatorAuthToken: config.operatorAuthToken,
        });
        return sendJson(res, 200, defaults);
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/assemble-submit") {
        const body = await readJson(req);
        const placeholders = body.placeholders || {};
        const row = await assembleAndSubmit({
          baseFolderDir: config.baseFolderDir,
          patchNames: body.patchNames || [],
          patchesDir: config.workbenchPatchesDir,
          patchbackPairNames: body.patchbackPairNames || [],
          companionFiles: body.companionFiles || [],
          label: body.label || undefined,
          patchRev: body.patchRev === undefined || body.patchRev === null || body.patchRev === "" ? undefined : Number(body.patchRev),
          dataDir: config.dataDir,
          logicBundleDir: config.logicBundleDir,
          // generic-placeholder-substitution: SYNC_BASE_URL/SYNC_TOKEN/
          // AUDIO_BASE_URL default to this deployment's own
          // TUN_PUBLIC_BASE/OPERATOR_AUTH_TOKEN — the same values already
          // gating the device-facing /mjolnir/userdata/* routes below
          // (task 4.2's decision) — so assembling via the embedded
          // workbench doesn't require retyping values hub already has
          // configured; an explicit request value (even falsy/empty) still
          // falls back to the default, matching this route's prior
          // behavior exactly.
          placeholders: {
            ...placeholders,
            SYNC_BASE_URL: placeholders.SYNC_BASE_URL || defaultSyncBaseUrl(config.publicBase),
            SYNC_TOKEN: placeholders.SYNC_TOKEN || config.operatorAuthToken || undefined,
            // D120: same reasoning as SYNC_BASE_URL above — defaults to
            // this deployment's own public base, no token involved (the
            // route is plain static/unauthenticated by design).
            AUDIO_BASE_URL: placeholders.AUDIO_BASE_URL || defaultAudioBaseUrl(config.publicBase),
          },
        });
        return sendJson(res, 200, row);
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/logic-bundles/activate") {
        const { id } = await readJson(req);
        await activateLogicBundle(id);
        return sendJson(res, 200, { ok: true });
      }
      // The force-publish path keeps the original buildId-centric guards
      // (companion match, reuse-by-buildId) — it still publishes an
      // identity-addressed bundle straight to current.json, unlike the
      // default submit flow above.
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/verify") {
        const bytes = await readBody(req);
        const buildId = req.headers["x-build-id"] || "";
        return sendJson(res, 200, verifyBundle(bytes, buildId, { dataDir: config.dataDir }));
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/force-publish") {
        const bytes = await readBody(req);
        const buildId = req.headers["x-build-id"] || "";
        const label = req.headers["x-label"] || buildId;
        const result = await forcePublish(bytes, buildId, label, {
          dataDir: config.dataDir,
          logicBundleDir: config.logicBundleDir,
          publicBase: config.publicBase,
        });
        return sendJson(res, 200, result);
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/api/set-current") {
        const { buildId } = await readJson(req);
        await setCurrent(buildId, { dataDir: config.dataDir, publicBase: config.publicBase });
        return sendJson(res, 200, { ok: true });
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/api/label") {
        const { buildId, label } = await readJson(req);
        await updateLabel(buildId, label);
        return sendJson(res, 200, { ok: true });
      }
      if (req.method === "POST" && url.pathname === "/mjolnir/ota/api/delete") {
        const { buildId } = await readJson(req);
        await deleteBuild(buildId, { dataDir: config.dataDir });
        return sendJson(res, 200, { ok: true });
      }

      // Device progress sync (/mjolnir/userdata/*) MOVED to `mjolnir-sync`
      // (zone-isolation). It is the device plane; this is the operator plane.
      // The gateway routes /mjolnir/userdata/* to that service BEFORE this
      // one, so a request never reaches here. If you are looking for the
      // handler, it is mjolnir/sync/src/server.js — copied byte for byte,
      // because the device cannot be rolled back.

      res.writeHead(404, { "Content-Type": "text/plain" });
      res.end("not found");
    } catch (err) {
      // See mjolnir/sync/src/server.js: readiness is a current state, so a
      // connection-level error degrades the service instead of leaking a
      // driver error as a 500 on every subsequent request.
      if (boot) boot.noteError(err);
      if (boot && boot.isConnectionError(err)) {
        if (wantsJson(url.pathname)) {
          return sendJson(res, 503, { error: "database unavailable" });
        }
        res.writeHead(503, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({
          title: "mjolnir — database unavailable",
          activeHref: url.pathname,
          body: `<div class="page-head"><div><h2>Database unavailable</h2>
            <div class="page-sub">The database became unreachable while this
            page was loading. Retrying automatically; devices are
            unaffected.</div></div></div>`,
        }));
      }
      console.error(err);
      sendJson(res, 500, { error: err.message });
    }
  });
}
