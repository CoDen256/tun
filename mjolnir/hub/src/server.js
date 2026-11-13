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
} from "./ota.js";
import { findBakedBaseVersion, findBakedPatchRev } from "../../tool/src/otaPublish.js";
import { list as listLogicBundles } from "./logicBundles.js";
import { cardsList, stripHtml, getCardSlot } from "./cards.js";
import { DECK_ALLOCATION, listDecks, updateDeckDescription } from "./decks.js";
import { renderShell, escapeHtml } from "./layout.js";
import { requireAuth, renderLoginPage, handleLoginPost } from "./auth.js";
import { slugify } from "./slug.js";
import {
  getOrCreate,
  merge,
  replace,
  remove,
  listAccounts,
  perCardProgress,
  historyDeltas,
  userdataDoc,
  historyDoc,
  distinctDeckTitles,
  STATE_LABELS,
  PAGE_SIZES,
} from "./userdata.js";
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
import { recentBatches, occurrencesForBuild } from "../../builder/src/batchHistory.js";
import { getActiveMeta } from "../../builder/src/logicBundle.js";
import { buildForecastBody, buildScheduleBody, buildLogsBody, loadDeckMeta, loadShipOrders } from "../../builder/src/server.js";
import { buildInsights } from "./insights.js";
import { renderInsightsPage } from "./insightsPage.js";

const WORKBENCH_MOUNT = "/mjolnir/workbench";

const MAX_BODY_BYTES = 67108864; // D48 — same ceiling the publish guards enforce anyway

// progress-sync-shim's shim/restore-companion fetch against
// `${SYNC_BASE_URL}/<id>` directly (confirmed: `patches/js/
// 2080-progress-sync-shim.edited.js` and `progress-sync-restore-
// companion.js` both do `fetch(SYNC_BASE_URL + '/' + encodeURIComponent(id), ...)`)
// — the default needs the full `/mjolnir/userdata` path, not just the host
// `publicBase` already names.
function defaultSyncBaseUrl(publicBase) {
  if (!publicBase) return undefined;
  return `${publicBase.replace(/\/+$/, "")}/mjolnir/userdata`;
}

// audio-cache-prefetch: the prefetcher companion and the rewritten mod 1440
// patch both build their own `/audio-manifest/...` and `/blob/...` paths
// off this one base (confirmed: `audio-prefetch-companion.js` does
// `fetch(AUDIO_BASE_URL + '/audio-manifest/' + buildId + '.json')` and
// `AUDIO_BASE_URL + '/blob/' + sha256`) — a single fixed sub-path default
// no longer makes sense now that the device resolves cardId → sha256
// itself (D-P6 retires `/audio-by-card/*`), so this defaults to the bare
// public base, not a sub-path.
function defaultAudioBaseUrl(publicBase) {
  if (!publicBase) return undefined;
  return publicBase.replace(/\/+$/, "");
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

function renderHistoryPage(publications, current, config) {
  const rows = publications
    .map((p) => {
      const isCurrent = current && current.buildId === p.build_id;
      const bundlePath = path.join(config.dataDir, "ota", "bundle", `${p.build_id}.js`);
      const inspectHref = `${WORKBENCH_MOUNT}/?open=${encodeURIComponent(bundlePath)}`;
      return `<tr>
        <td>${isCurrent ? '<span class="pill pill-ok">● current</span> ' : ""}<span class="mono">${escapeHtml(p.build_id)}</span></td>
        <td class="wrap">${escapeHtml(p.label || "")}</td>
        <td class="mono">${escapeHtml(p.base_version)}</td>
        <td class="num">${p.patch_rev}</td>
        <td class="num">${p.data_rev}</td>
        <td class="num">${p.card_count}</td>
        <td class="mono">${escapeHtml(p.bundle_sha.slice(0, 4))}…${escapeHtml(p.bundle_sha.slice(-4))}</td>
        <td class="mono">${escapeHtml(new Date(p.created_at).toISOString())}</td>
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
    body: `
<div class="page-head"><div><h2>Publish history</h2></div></div>
<div class="panel">
  <div class="table-wrap">
    <table>
      <thead><tr><th>Build</th><th>Label</th><th>Base</th><th>Logic</th><th>Data</th><th>Cards</th><th>sha256</th><th>Published</th><th></th></tr></thead>
      <tbody>${rows || `<tr><td colspan="9">no publications yet</td></tr>`}</tbody>
    </table>
  </div>
</div>
<div class="inline-note">"download" streams that build's exact published bytes, named from its label. "inspect" opens it in the bundle workbench — repeated inspects reuse the same workbench window/tab rather than piling up new ones. "set current" repoints <code>current.json</code> at that build (no shell command). "delete" is blocked while a build shipped any occurrence (D93) or is the live current build.</div>
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

function occurrenceBadge(side) {
  if (side.status === "shipped") return `<span class="pill pill-ok">${escapeHtml(side.letter)} · ${escapeHtml(side.buildId)}</span>`;
  return `<span class="pill pill-warn">${escapeHtml(side.letter)} · ${side.remaining} to go</span>`;
}

// card-preview: a visual preview of a card's N/E/X faces, styled from the
// real stock app's own extracted DARK-theme colors/fonts (not the light
// theme — the operator specifically wants the device's actual dark look,
// `base/smali.mjolnir.merged/assets/index.android.bundle`'s own theme/
// class-style map, dark variant). Rendered inline under the card's own row
// in the Cards table (expand/collapse, one open at a time, D109) rather
// than a separate page — Poppins falls back to the browser's default
// sans-serif when unavailable; close enough for "does this look right,"
// not pixel-perfect (an explicit non-goal).
const CARD_PREVIEW_STYLE = `
.card-preview-inline { padding: 14px 4px 18px; }
.card-preview-faces { display: flex; flex-direction: column; gap: 12px; max-width: 380px; }
.card-preview-face-label { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); margin-bottom: 6px; }
.card-preview-face {
  font-family: 'Poppins', ui-sans-serif, system-ui, sans-serif;
  color: #fff;
  background: #1B1D21;
  text-align: center;
  border: 2px solid #fff;
  border-radius: 14px;
  padding: 18px 16px;
  min-height: 70px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 8px;
}
.card-preview-face b { font-family: 'Poppins', ui-sans-serif, system-ui, sans-serif; font-weight: 700; color: #3F8CFF; }
.card-preview-face .teal { color: #00A4BF; }
.card-preview-face .red { color: red; }
.card-preview-face .green { color: #5DD8D0; }
.card-preview-face .left { text-align: left; }
.card-preview-face i, .card-preview-face .italic { font-style: italic; }
.card-preview-face:empty::after { content: "(empty)"; color: #666; font-style: italic; }
.card-preview-audio-badge { margin-top: 2px; font-size: 18px; opacity: .55; }
.card-preview-face-wrap audio { width: 100%; margin-top: 6px; }
`;

function cardPreviewFaceHtml(letter, html, audioLetter, hasAudioFile, cardId) {
  const isAudioFace = letter === audioLetter;
  const audioHtml = !isAudioFace
    ? ""
    : hasAudioFile
      ? `<audio controls src="/mjolnir/cards/${encodeURIComponent(cardId)}/audio"></audio>`
      : `<div class="card-preview-audio-badge" title="this face carries the card's audio, but no clip is on disk">🔊</div>`;
  return `<div class="card-preview-face-wrap">
    <div class="card-preview-face-label">${letter === "N" ? "Front (N)" : letter === "E" ? "Back (E)" : "Extra (X)"}${isAudioFace ? " · 🔊" : ""}</div>
    <div class="card-preview-face">${html || ""}</div>
    ${audioHtml}
  </div>`;
}

function cardPreviewInlineHtml(cardId, content, hasAudioFile) {
  const faces = ["N", "E", "X"].map((letter) => cardPreviewFaceHtml(letter, content[letter], content.A, hasAudioFile, cardId)).join("\n");
  return `<div class="card-preview-inline"><div class="card-preview-faces">${faces}</div></div>`;
}

function renderCardsPage(cards, { search, deckCode, statusFilter }, stabburUiBase, dataDir) {
  const byDeck = new Map();
  for (const card of cards) {
    if (!byDeck.has(card.deckCode)) byDeck.set(card.deckCode, []);
    byDeck.get(card.deckCode).push(card);
  }

  const panels = [...byDeck.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([deckCode, deckCards]) => {
      const hasGrammar = deckCards.some((c) => c.grammarRuleId);
      const rows = deckCards
        .map((c) => {
          const noteLink = stabburUiBase
            ? `<a href="${escapeHtml(stabburUiBase)}#/notes/${escapeHtml(c.noteId)}" target="_blank" rel="noopener">${escapeHtml(stripHtml(c.N) || c.id)} ↗</a>`
            : escapeHtml(stripHtml(c.N) || c.id);
          const ruleLink =
            hasGrammar && c.grammarRuleId
              ? `<td>${stabburUiBase ? `<a href="${escapeHtml(stabburUiBase)}#/grammar/${escapeHtml(c.grammarRuleId)}" target="_blank" rel="noopener">rule ↗</a>` : escapeHtml(c.grammarRuleId)}</td>`
              : hasGrammar
                ? "<td></td>"
                : "";
          const hasAudioFile = !!(c.audioSha256 && fs.existsSync(path.join(dataDir, "blob", c.audioSha256)));
          const previewHtml = cardPreviewInlineHtml(c.id, { N: c.N, E: c.E, X: c.X, A: c.A }, hasAudioFile);
          return `<tr>
            <td class="mono">${escapeHtml(c.id)}</td>
            <td class="wrap">${escapeHtml(stripHtml(c.N))}</td>
            <td class="wrap">${escapeHtml(stripHtml(c.E))}</td>
            <td>${c.sides.map(occurrenceBadge).join(" ")}</td>
            <td>${noteLink}</td>
            ${ruleLink}
            <td><button type="button" class="btn-ghost card-preview-toggle" data-card="${escapeHtml(c.id)}">👁 preview</button></td>
          </tr>
          <tr class="card-preview-row" data-card="${escapeHtml(c.id)}" style="display:none;">
            <td colspan="20">${previewHtml}</td>
          </tr>`;
        })
        .join("\n");
      return `<div class="panel">
        <div class="panel-head"><h3>${escapeHtml(deckCode)} — ${escapeHtml(deckCards[0].deckTitle)} <span class="pill pill-neutral" style="margin-left:8px;">${deckCards.length} cards</span></h3></div>
        <div class="table-wrap">
          <table>
            <thead><tr><th>Card</th><th>Front (N)</th><th>Back (E)</th><th>Occurrences</th><th>Source note</th>${hasGrammar ? "<th>Grammar rule</th>" : ""}<th></th></tr></thead>
            <tbody>${rows}</tbody>
          </table>
        </div>
      </div>`;
    })
    .join("\n");

  const deckOptions = DECK_ALLOCATION.map(
    (d) => `<option value="${escapeHtml(d.code)}" ${d.code === deckCode ? "selected" : ""}>${escapeHtml(d.code)}</option>`
  ).join("");

  return renderShell({
    title: "mjolnir / hub — cards",
    activeHref: "/mjolnir/cards",
    body: `
<style>${CARD_PREVIEW_STYLE}</style>
<div class="page-head"><div><h2>Cards</h2><div class="page-sub">Every card ever minted — the device-side counterpart to stabbur's Notes list.</div></div></div>
<form class="toolbar" method="GET" action="/mjolnir/cards">
  <input class="search-input" type="search" name="q" value="${escapeHtml(search)}" placeholder="Search card content…">
  <select name="deck"><option value="">Deck: all</option>${deckOptions}</select>
  <select name="status">
    <option value="">Occurrence status: all</option>
    <option value="shipped" ${statusFilter === "shipped" ? "selected" : ""}>fully shipped</option>
    <option value="pending" ${statusFilter === "pending" ? "selected" : ""}>a side pending</option>
  </select>
  <button type="submit">Filter</button>
</form>
${panels || `<div class="panel panel-pad">no cards match this filter</div>`}
${!stabburUiBase ? `<div class="inline-note">STABBUR_UI_BASE is not configured — note/grammar-rule links are disabled, but the list above is unaffected.</div>` : ""}
<script>
// D109: at most one preview open at a time — opening another closes
// whichever one was already showing, same "exclusive accordion" behavior
// across every deck panel on the page.
document.querySelectorAll('.card-preview-toggle').forEach((btn) => {
  btn.addEventListener('click', () => {
    const card = btn.dataset.card;
    const row = document.querySelector('.card-preview-row[data-card="' + CSS.escape(card) + '"]');
    const isOpen = row.style.display !== 'none';
    document.querySelectorAll('.card-preview-row').forEach((r) => { r.style.display = 'none'; });
    row.style.display = isOpen ? 'none' : 'table-row';
  });
});
</script>`,
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
`;

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

// D-UP4: the raw document is fetched on first expand, via `data-doc-url`
// (wired up by the `<script>` at the bottom of `renderDevicePage`) —
// never inlined here, which is the whole point of this change.
function historyRowHtml(entry, selectedUid) {
  const dot = entry.title === "Account deleted" ? "warn" : entry.title === "Synced" ? "" : "ok";
  const details = entry.detail
    .map((d) =>
      d.up === null
        ? `<span>${escapeHtml(d.label)} <span class="tl-delta flat">${escapeHtml(d.text)}</span></span>`
        : `<span>${escapeHtml(d.label)} <span class="tl-delta ${d.up ? "up" : "flat"}">${escapeHtml(d.text)}</span></span>`
    )
    .join("\n");
  const docUrl = `/mjolnir/device/doc?uid=${encodeURIComponent(selectedUid)}&historyId=${encodeURIComponent(entry.id)}`;
  return `<div class="tl-row">
    <div class="tl-time">${timeAgo(entry.at)}</div>
    <div class="tl-rail"><div class="tl-dot ${dot}"></div></div>
    <div>
      <div class="tl-title">${escapeHtml(entry.title)}</div>
      ${details ? `<div class="tl-detail">${details}</div>` : ""}
      <details class="json-toggle" style="margin-top:4px;" data-doc-url="${escapeHtml(docUrl)}">
        <summary>raw doc</summary>
        <pre>loading…</pre>
      </details>
    </div>
  </div>`;
}

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

function renderDevicePage({ accounts, selectedUid, doc, perCard, total, history, filters, deckTitles, cardIndexInfo }) {
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
  const historyRows = history.map((entry) => historyRowHtml(entry, selectedUid)).join("\n");

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
      ? `<div class="inline-note">Content for stock cards is read from the currently published bundle (build <code>${escapeHtml(cardIndexInfo.buildId || "")}</code>).</div>`
      : "";

  return renderShell({
    title: "mjolnir / hub — device sync",
    activeHref: "/mjolnir/device",
    body: `<style>${DEVICE_PAGE_STYLE}</style>
<div class="page-head">
  <div>
    <h2>Device sync</h2>
    <div class="page-sub">Progress reported by the signed-in account, kept as a mirror — this view is read-only.</div>
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
    <div><h3>Progress snapshot</h3><div class="page-sub">From the device's current <code>userdata</code> document.</div></div>
  </div>
  <div class="panel-pad">
    ${snapGrid}
    ${doc ? `<details class="json-toggle" style="margin-top:16px;" data-doc-url="${escapeHtml(snapshotDocUrl)}"><summary>raw doc</summary><pre>loading…</pre></details>` : ""}
  </div>
</div>

<div class="panel">
  <div class="panel-head">
    <div><h3>Per-card progress</h3><div class="page-sub">Every occurrence with SRS state, joined against card content — ${total} matching.</div></div>
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
      <thead><tr><th>Card</th><th>Content</th><th>Side</th><th>Deck</th><th class="num">Stage</th><th>Status</th><th class="num">Interval</th><th>Next due</th><th class="num">Reschedules</th><th>Flags</th></tr></thead>
      <tbody>${perCardRows || `<tr><td colspan="10">no per-card progress matches this filter</td></tr>`}</tbody>
    </table>
  </div>
  <div class="panel-pad" style="padding-top:12px; padding-bottom:14px;">
    ${pagerHtml(selectedUid, filters, total)}
    <div class="inline-note">"Content" is always the card's <strong>N</strong> field (stripped of HTML), the same for every row regardless of which side was reviewed — N identifies the card, E is only ever the answer. "Side" is the stored direction letter (N/E/A), never an actual language.</div>
    ${bundleNote}
  </div>
</div>

<div class="panel">
  <div class="panel-head">
    <div><h3>Sync history</h3><div class="page-sub">Every write, append-only — a last-write-wins row alone would not be a backup.</div></div>
  </div>
  <div class="panel-pad">
    <div class="timeline">${historyRows || `<div class="inline-note">no sync history recorded yet</div>`}</div>
  </div>
</div>
<script>
document.querySelectorAll('details.json-toggle[data-doc-url]').forEach((details) => {
  details.addEventListener('toggle', async () => {
    if (!details.open || details.dataset.loaded) return;
    details.dataset.loaded = '1';
    const pre = details.querySelector('pre');
    try {
      const res = await fetch(details.dataset.docUrl);
      if (!res.ok) throw new Error('HTTP ' + res.status);
      const body = await res.json();
      pre.textContent = JSON.stringify(body.doc, null, 2);
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

export function createServer(pool, config) {
  // bundle-session-management: reachable embedded here, with no local
  // `bundle-tool ui`/npx invocation required for a deployed instance.
  // Instantiated once (not per-request) — its session store is an
  // in-memory Map that must survive across requests. `patchesDir` is the
  // same `patches/` directory the standalone CLI and `bundle-tool assemble`
  // already read/write, so a logic bundle assembled here is immediately
  // visible to the CLI and vice versa.
  const workbenchHandler = createWorkbenchHandler({ patchesDir: config.workbenchPatchesDir || "patches" });

  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://localhost");

      // Mounted before the operator-auth gate below would otherwise apply
      // per-route — checked explicitly here instead, since the workbench's
      // own routes/static assets live under one prefix rather than hub's
      // per-page route list. Every path here is already gated the exact
      // same way every other operator page is: skipped entirely when
      // `OPERATOR_AUTH_TOKEN` is unset (local/dev), required otherwise.
      if (url.pathname === WORKBENCH_MOUNT) {
        // Relative asset/API paths (`app.js`, `api/...`) only resolve
        // correctly against a trailing-slash URL — redirect once, like any
        // static-site mount point would.
        res.writeHead(302, { Location: `${WORKBENCH_MOUNT}/` });
        return res.end();
      }
      if (url.pathname === WORKBENCH_MOUNT + "/" || url.pathname.startsWith(WORKBENCH_MOUNT + "/")) {
        if (config.operatorAuthToken) {
          if (!requireAuth(req, res, config.operatorAuthToken, { loginPath: "/mjolnir/login" })) return;
        }
        // Strip the mount prefix so the embedded handler sees exactly the
        // same paths it would standalone (`/`, `/app.js`, `/api/...`).
        req.url = url.pathname.slice(WORKBENCH_MOUNT.length) + url.search;
        return workbenchHandler(req, res);
      }

      // D-H6: checked before every route except /mjolnir/login itself.
      // Namespaced under /mjolnir (not a bare /login) because Caddy only
      // routes /mjolnir/* to this service (task 7.4) — a path outside that
      // prefix would never be reachable through the real deploy at all.
      // Disabled entirely if OPERATOR_AUTH_TOKEN is unset (local/dev) — see
      // config.js and task 7.4 on why that's safe only before the Caddy
      // routes are uncommented.
      const LOGIN_PATH = "/mjolnir/login";
      if (config.operatorAuthToken) {
        if (req.method === "GET" && url.pathname === LOGIN_PATH) {
          const next = url.searchParams.get("next") || "/mjolnir";
          res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
          return res.end(renderLoginPage({ next, loginPath: LOGIN_PATH }));
        }
        if (req.method === "POST" && url.pathname === LOGIN_PATH) {
          return handleLoginPost(req, res, config.operatorAuthToken, { loginPath: LOGIN_PATH });
        }
        if (!requireAuth(req, res, config.operatorAuthToken, { loginPath: LOGIN_PATH })) return;
      }

      if (req.method === "GET" && url.pathname === "/mjolnir/api/publications") {
        return sendJson(res, 200, await listPublications());
      }

      // D109: hub's own "Builder" nav pages — see the top-of-file import
      // comment. All three reuse builder's exact body-builder functions and
      // pure read-functions; only the schedule/publish POST actions stay on
      // builder's own `/builder/api/*` routes (the pages' inline scripts
      // already reference those as root-absolute paths, which Caddy already
      // routes to builder's container regardless of which service rendered
      // the surrounding page — no proxying needed for those).
      if (req.method === "GET" && url.pathname === "/mjolnir/builder/forecast") {
        if (!config.stabburBaseUrl || !config.stabburAuthToken) {
          res.writeHead(500, { "Content-Type": "text/plain" });
          return res.end("STABBUR_BASE_URL/STABBUR_AUTH_TOKEN are not set for hub — add them to .env to enable this page.");
        }
        const [forecast, jobs, batches, activeLogicBundle] = await Promise.all([
          runForecast(pool, {
            stabburBaseUrl: config.stabburBaseUrl,
            stabburAuthToken: config.stabburAuthToken,
            sourceLang: config.sourceLang,
          }),
          recentBuildJobs(pool),
          recentBatches(pool, 5),
          getActiveMeta(pool),
        ]);
        const batchDetails = new Map();
        for (const b of batches) batchDetails.set(b.buildId, await occurrencesForBuild(pool, b.buildId));
        const [deckMeta, shipOrders] = await Promise.all([
          loadDeckMeta(pool, forecast.byDeck.map((d) => d.deckCode)),
          loadShipOrders(pool, forecast),
        ]);
        const body = buildForecastBody(forecast, jobs, batches, batchDetails, activeLogicBundle, deckMeta, shipOrders);
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderShell({ title: "mjolnir / hub — forecast & publish", activeHref: "/mjolnir/builder/forecast", body }));
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

      // /mjolnir/ui is the canonical entry point, matching stabbur's own
      // /stabbur/ui and builder's /builder/ui (D46: one convention across
      // services). The bare path is kept working too — existing bookmarks,
      // the Caddyfile's own bare-path handling, and every internal link
      // built before this alias existed all still resolve.
      if (
        req.method === "GET" &&
        (url.pathname === "/mjolnir" || url.pathname === "/mjolnir/" || url.pathname === "/mjolnir/ui")
      ) {
        const [publications, current] = [await listPublications(), readCurrent(config.dataDir)];
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderHistoryPage(publications, current, config));
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
        const search = url.searchParams.get("q") || "";
        const deckCode = url.searchParams.get("deck") || "";
        const statusFilter = url.searchParams.get("status") || "";
        const cards = await cardsList(pool, { search, deckCode, statusFilter });
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderCardsPage(cards, { search, deckCode, statusFilter }, config.stabburUiBase, config.dataDir));
      }

      // card-preview's audio stream — the inline preview's <audio> element
      // src, unchanged by the move from a standalone page to an inline panel.
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
        const [doc, progress, history, deckTitles] =
          accounts.length && selectedUid
            ? await Promise.all([
                userdataDoc(selectedUid),
                perCardProgress(selectedUid, { ...filters, cardIndex: index }),
                historyDeltas(selectedUid, { limit: 20 }),
                distinctDeckTitles(selectedUid),
              ])
            : [null, { rows: [], total: 0 }, [], []];

        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          renderDevicePage({
            accounts,
            selectedUid,
            doc: doc || null,
            perCard: progress.rows,
            total: progress.total,
            history: history || [],
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

      // device-insights-page: a separate, additional tab, not a
      // replacement for Sync (D126/proposal's own Non-Goals). Same
      // uid-restricted posture as every other account-scoped route here.
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

      // progress-sync-shim: the device-facing contract mod 2080's shim
      // (patches/js/2080-progress-sync-shim.js) talks to — gated by the
      // same shared operator-auth check above (task 4.2's decision), not a
      // separate device token. D-S2: GET never reports "not found", it
      // auto-creates factory defaults on first touch.
      const USERDATA_PREFIX = "/mjolnir/userdata/";
      if (url.pathname.startsWith(USERDATA_PREFIX) && url.pathname.length > USERDATA_PREFIX.length) {
        // userdata-console (D-C1): this path segment is the real Firebase
        // uid (D-S1) — `userdata`/`userdata_history` stay keyed by it
        // unchanged. `device_state` is keyed by a *different*, locally-
        // generated `deviceId` carried in the PATCH body, never by this uid.
        const uid = decodeURIComponent(url.pathname.slice(USERDATA_PREFIX.length));
        if (req.method === "GET") {
          const { doc, created } = await getOrCreate(uid);
          // D-S4: the startup restore module (patches/js/progress-sync-
          // restore-companion.js) needs to tell "a real existing document"
          // apart from "this GET call's own auto-creation" (D-S2) — mod
          // 2080's own shim ignores this extra field entirely (it only ever
          // reads the named fields it already knows about).
          return sendJson(res, 200, created ? { ...doc, _justCreated: true } : doc);
        }
        if (req.method === "PATCH") {
          // `deviceId` (D-C1/D-C2's now-removed device_state mechanism) and
          // the device-status fields it used to ride alongside
          // (activeBuildId/pendingBuildId/audioCached/audioTotal/
          // lastFetchError) are stripped rather than merged into the synced
          // doc — an older installed build may still send them, and they
          // must never pollute the userdata document itself.
          const STATUS_FIELDS = ["deviceId", "activeBuildId", "pendingBuildId", "audioCached", "audioTotal", "lastFetchError"];
          const body = await readJson(req);
          const patch = {};
          for (const [key, value] of Object.entries(body)) {
            if (!STATUS_FIELDS.includes(key)) patch[key] = value;
          }
          const doc = await merge(uid, patch);
          return sendJson(res, 200, doc);
        }
        if (req.method === "POST") {
          const doc = await readJson(req);
          const written = await replace(uid, doc);
          return sendJson(res, 200, written);
        }
        if (req.method === "DELETE") {
          await remove(uid);
          return sendJson(res, 200, { ok: true });
        }
        res.writeHead(405, { "Content-Type": "text/plain" });
        return res.end("method not allowed");
      }

      res.writeHead(404, { "Content-Type": "text/plain" });
      res.end("not found");
    } catch (err) {
      console.error(err);
      sendJson(res, 500, { error: err.message });
    }
  });
}
