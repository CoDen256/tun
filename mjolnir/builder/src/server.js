import http from "node:http";
import { runForecast, runPublish } from "./pipeline.js";
import { checkOccurrenceIntegrity } from "./integrity.js";
import { recentBuildJobs, getBuildJob } from "./buildJobs.js";
import { buildGrammarRuleLookup } from "./stabburClient.js";
import { getSchedule, setSchedule } from "./schedulerConfig.js";
import { jobLogLines, makeDbLogger } from "./jobLogs.js";
import { getActiveMeta } from "./logicBundle.js";
import { renderShell, escapeHtml } from "./layout.js";
import { iconLink } from "../../../libs/jsservice/icons.js";
import { requireAuth } from "../../../libs/jsservice/auth.js";
import { shipOrderForDeck } from "./cardFlow.js";
import { getAll as getAllCardContent } from "./cardContent.js";
import { describeLastRun } from "./runStatus.js";
import { buildStripModel, renderShipStripsBody } from "./shipStrips.js";
// builder-ship-strips 3.11: the drawer renders a real card through the
// SHARED card-preview capability, from the style map the extractor pulls
// out of the stock bundle — never a second, hand-typed approximation.
// Builder is its own process but the same monorepo and the same Postgres
// (D-P3); cross-importing hub's module is the established pattern here
// (pipeline.js already imports ../../src/injectDeck.js).
import {
  cardPreviewStyleBlock,
  cardPreviewClientScript,
  cardPreviewInlineHtml,
} from "../../hub/src/cardPreview.js";
import { getCardPreviewData } from "../../hub/src/cardPreviewStyle.js";

function sendJson(res, status, body) {
  const data = JSON.stringify(body);
  res.writeHead(status, { "Content-Type": "application/json; charset=utf-8", "Content-Length": Buffer.byteLength(data) });
  res.end(data);
}

async function readJson(req) {
  const chunks = [];
  for await (const chunk of req) chunks.push(chunk);
  const body = Buffer.concat(chunks);
  return body.length ? JSON.parse(body.toString("utf8")) : {};
}

// ---- Forecast & publish (occurrence-level, D-H2) ----

// D109: factored out from `renderForecastPage` so hub can reuse this exact
// markup directly (importing it, not duplicating it) when rendering
// builder's pages inside hub's own shell — see hub/src/layout.js's "Builder"
// nav group comment. Replaces the earlier iframe-based "unified console"
// (D-C9), reverted: it doubled chrome and the workbench's own light theme
// read worse than the operator wanted.
// A DEGRADED PANEL HAS TO BE VISIBLE, OR IT IS NOT A SIGNAL (2026-11-14, P57).
//
// The forecast already degraded to an EMPTY shape with `degraded: true` and a
// `reason` when stabbur was unreachable — and then rendered that empty shape
// as a perfectly ordinary page: "nothing would ship right now", which is also
// exactly what a healthy, idle pipeline looks like. The two states were
// indistinguishable to the operator, so the dependency fault read as good
// news. Same family as P45/P47: quietly wrong beats loudly broken only until
// someone acts on it.
//
// Rendered here rather than in either server, so hub's copy of this page
// (which reuses this exact function) cannot drift from builder's.
function renderForecastDegradedBanner(forecast) {
  if (!forecast || !forecast.degraded) return "";
  const why = String(forecast.reason || "stabbur unavailable");
  return `<div class="panel" style="border-color:#8a4b2a">
  <div class="panel-head"><h3>Forecast unavailable — stabbur is not answering</h3></div>
  <div class="inline-note" style="margin:0 18px 14px;">
    Every panel below that comes from the pull is <strong>empty because the pull
    failed</strong>, not because nothing is eligible. Recent jobs, recent
    batches and the active logic bundle come from this service's own database
    and are accurate. Devices are unaffected — updates are served off disk.
    <div class="mono" style="opacity:.7;margin-top:8px">${escapeHtml(why)}</div>
  </div>
</div>`;
}

// flush-record-atomicity (D-FA4): the occurrence-ledger integrity banner.
//
// Renders ONLY when `checkOccurrenceIntegrity` (builder/src/integrity.js)
// finds something — zero anomalies is zero UI, deliberately: a permanent
// green "all good" panel is read once and never again, and this has to be
// noticeable on the one morning it is not green. On 2026-11-10 the opposite
// was true: 13 lost `E` occurrences were found by accident, days later,
// because nothing on any page could have shown them.
//
// Exported on its own (not only via `buildForecastBody`) because the
// `builder-ship-strips` change renders the same banner on its new page. One
// check, one renderer, two call sites — never a second implementation.
export function renderIntegrityBanner(integrity) {
  if (!integrity || integrity.anomalies.length === 0) return "";
  const byKind = new Map();
  for (const a of integrity.anomalies) {
    if (!byKind.has(a.kind)) byKind.set(a.kind, []);
    byKind.get(a.kind).push(a);
  }
  const LABEL = {
    missing: "owed occurrences that exist nowhere — shipped, staged or queued",
    duplicate: "occurrences that exist in more than one place",
    orderBreak: "cards whose E shipped while their own A never did (D91)",
  };
  const sections = [...byKind.entries()]
    .map(([kind, items]) => {
      const ids = items.map((a) => `<span class="mono">${escapeHtml(a.cardId)}</span>`).join(", ");
      return `<div style="margin-top:8px"><strong>${items.length}</strong> ${escapeHtml(LABEL[kind] || kind)}:
        <div style="margin-top:4px">${ids}</div>
        <div class="mono" style="opacity:.7;margin-top:4px">${escapeHtml(items[0].detail)}</div>
      </div>`;
    })
    .join("");
  return `<div class="panel panel-pad" style="border-color: var(--err); margin-bottom:16px;">
    <strong style="color: var(--err);">⚠ Occurrence-ledger integrity: ${integrity.anomalies.length} anomal${integrity.anomalies.length === 1 ? "y" : "ies"}.</strong>
    Every minted card must have each occurrence it owes in exactly one of
    shipped / staged / pending, exactly once, with its A shipped before its E.
    ${sections}
    ${integrity.truncated ? `<div style="margin-top:8px;opacity:.7">(list truncated — more anomalies exist than are shown)</div>` : ""}
  </div>`;
}

// card-flow-view: deck title/description for the summary row's subtitle —
// one query for every deck the forecast actually reports on, not one per
// deck (same batching discipline as `batchDetails` below). Exported so hub
// can reuse it directly (D109's "importing it, not duplicating it"), same
// as `buildForecastBody` itself — `/mjolnir/builder/forecast` needs this
// data too, not just builder's own `/builder` route.
export async function loadDeckMeta(pool, deckCodes) {
  if (deckCodes.length === 0) return new Map();
  const { rows } = await pool.query("SELECT code, title, description FROM decks WHERE code = ANY($1)", [deckCodes]);
  return new Map(rows.map((r) => [r.code, { title: r.title, description: r.description || "" }]));
}

// card-flow-view (design.md's Risk 1 mitigation): only decks with actual
// `card_slots` rows get a full ship-order reconstruction — a deck surfaced
// purely because it has newly-eligible notes this run but hasn't minted
// anything yet has nothing to reconstruct (shipOrderForDeck would just
// return empty arrays, so skipping it here is a pure optimization, not a
// correctness difference). Exported for the same reason as `loadDeckMeta`.
export async function loadShipOrders(pool, forecast) {
  const shipOrders = new Map();
  for (const d of forecast.byDeck) {
    if (d.mintedCount === 0) {
      shipOrders.set(d.deckCode, { shipped: [], staged: [], open: 0 });
      continue;
    }
    shipOrders.set(d.deckCode, await shipOrderForDeck(pool, d.deckCode));
  }
  return shipOrders;
}

// builder-ship-strips (D-SS1): THE primary page. One body function, two
// shells (D109) — builder serves it at `/builder`, hub re-renders the
// identical markup at `/mjolnir/builder/forecast` inside its own chrome.
//
// Carried over from the forecast page it replaces: the active-logic-bundle
// banner (now the header's chip), the degraded-dependency banner (P57), the
// occurrence-ledger integrity banner, the global totals and Publish now.
// REMOVED from this page: the 5-stage pipeline rail (it restated
// numerically what the strip shows spatially) and the past-batches section
// (covered by the run log and hub's publish history).
export function buildShipStripsBody({
  forecast,
  deckMeta = new Map(),
  shipOrders = new Map(),
  activeLogicBundle = null,
  integrity = null,
  runState = { kind: "none" },
  logsBase = "/builder/logs",
}) {
  return renderShipStripsBody({
    model: buildStripModel({ forecast, shipOrders, deckMeta }),
    activeLogicBundle,
    banners: renderIntegrityBanner(integrity) + renderForecastDegradedBanner(forecast),
    runState,
    logsBase,
  });
}

// The card-preview stylesheet and client script are page-level (one copy
// per page, not per card) — the drawer fetches only a card's own markup.
const CARD_PREVIEW_PAGE_ASSETS = `<style>${cardPreviewStyleBlock()}</style>\n<script>${cardPreviewClientScript()}</script>`;

export function shipStripsPageExtras() {
  return CARD_PREVIEW_PAGE_ASSETS;
}

function renderShipStripsPage(args) {
  return renderShell({
    title: "mjolnir / builder — ship strips",
    activeHref: "/builder",
    body: buildShipStripsBody(args) + CARD_PREVIEW_PAGE_ASSETS,
  });
}

// The empty forecast shape, shared by both servers' degraded paths — it has
// to match `runForecast`'s real one exactly or the renderers throw and the
// page is lost by a different route than the one being guarded against.
export function emptyForecast(reason) {
  return {
    wouldShip: [],
    wouldQueue: [],
    byDeck: [],
    wouldUpdate: [],
    totalPulled: 0,
    totalAlreadyMinted: 0,
    degraded: true,
    reason: reason || "stabbur unavailable",
  };
}

// ---- Schedule ----

export function buildScheduleBody(schedule) {
  const row = (kind, checked, inner) =>
    `<label class="radio-row ${checked ? "active" : ""}"><input type="radio" name="sched" value="${kind}" ${checked ? "checked" : ""}> ${inner}</label>`;

  return `
<div class="page-head"><div><h2>Schedule</h2><div class="page-sub">Automatic publishing, independent of the button on the forecast page.</div></div></div>
<div class="panel panel-pad">
  <div class="schedule-options">
    ${row("daily", schedule.kind === "daily", `Every night at <input type="text" id="daily-at" value="${escapeHtml(schedule.kind === "daily" ? schedule.at : "02:00")}">`)}
    ${row("interval", schedule.kind === "interval", `Every <input type="text" id="interval-hours" value="${schedule.kind === "interval" ? schedule.hours : 6}"> hours`)}
    ${row("manual", schedule.kind === "manual", "Manual only — never run automatically")}
  </div>
  <div style="margin-top:16px;"><button class="btn-primary" id="save-btn">Save schedule</button></div>
  <div id="result" class="inline-note"></div>
</div>
<script>
document.querySelectorAll('input[name="sched"]').forEach((r) => r.addEventListener('change', () => {
  document.querySelectorAll('.radio-row').forEach((row) => row.classList.remove('active'));
  r.closest('.radio-row').classList.add('active');
}));
document.getElementById('save-btn').addEventListener('click', async () => {
  const kind = document.querySelector('input[name="sched"]:checked').value;
  let schedule;
  if (kind === 'daily') schedule = { kind: 'daily', at: document.getElementById('daily-at').value };
  else if (kind === 'interval') schedule = { kind: 'interval', hours: Number(document.getElementById('interval-hours').value) };
  else schedule = { kind: 'manual' };
  const res = await fetch('/builder/api/schedule', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(schedule) });
  document.getElementById('result').textContent = res.ok ? 'saved — takes effect on the next scheduling check, no restart needed' : 'error saving schedule';
});
</script>`;
}

function renderSchedulePage(schedule) {
  return renderShell({
    title: "mjolnir / builder — schedule",
    activeHref: "/builder/schedule",
    body: buildScheduleBody(schedule),
  });
}

// ---- Run log ----

// `basePath` lets a caller mounting this elsewhere (hub's own
// `/mjolnir/builder/logs`) keep the job-detail links pointed at itself
// instead of hardcoding builder's own standalone `/builder/logs` path.
export function buildLogsBody(jobs, selectedJob, logLines, basePath = "/builder/logs") {
  const rows = jobs
    .map((j) => {
      const dotClass = j.status === "succeeded" ? "ok" : j.status === "failed" ? "err" : "";
      const pillClass = j.status === "succeeded" ? "pill-ok" : j.status === "failed" ? "pill-err" : "pill-neutral";
      const title = j.status === "succeeded" ? `Published ${escapeHtml(j.build_id || "?")}` : j.status === "failed" ? "Failed" : "Running";
      return `<div class="tl-row">
        <div class="tl-time">${escapeHtml(new Date(j.requested_at).toISOString())}</div>
        <div class="tl-rail"><div class="tl-dot ${dotClass}"></div></div>
        <div class="tl-body">
          <div class="tl-title"><a href="${basePath}?job=${j.id}">${title}</a> <span class="pill ${pillClass}">${escapeHtml(j.status)}</span></div>
          <div class="tl-detail">${j.error ? escapeHtml(j.error) : `job #${j.id}`}</div>
        </div>
      </div>`;
    })
    .join("\n");

  const logOutput = selectedJob
    ? `<div class="panel-head" style="border-top:1px solid var(--border-soft);"><h3>job #${selectedJob.id}${selectedJob.build_id ? ` — ${escapeHtml(selectedJob.build_id)}` : ""} — full output</h3></div>
    <div class="panel-pad">
      ${logLines.map((l) => `<div class="log-line">${escapeHtml(new Date(l.at).toISOString())} ${escapeHtml(l.line)}</div>`).join("\n") || "no log lines recorded for this job"}
    </div>`
    : "";

  return `
<div class="page-head"><div><h2>Run log</h2></div></div>
<div class="panel">
  <div class="panel-head"><h3>Recent runs</h3></div>
  <div class="panel-pad"><div class="timeline">${rows || "no runs yet"}</div></div>
  ${logOutput}
</div>`;
}

function renderLogsPage(jobs, selectedJob, logLines) {
  return renderShell({
    title: "mjolnir / builder — run log",
    activeHref: "/builder/logs",
    body: buildLogsBody(jobs, selectedJob, logLines),
  });
}

export function createServer(pool, config, boot) {
  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://localhost");

      // unified-auth 4.1/4.2. /builder/login and its cookie are GONE — the
      // gateway is the gate (`basic_auth`, then `X-Tun-Operator`). This check
      // rejects anything that reached the container without going through it,
      // and is UNCONDITIONAL: the old gate disabled itself when
      // OPERATOR_AUTH_TOKEN was unset, so a missing value meant an open
      // console. The marker needs no configured value, so nothing can be
      // forgotten into openness.
      // `prefix` is what exempts this service's container probe, and the
      // exemption itself lives in libs/jsservice/auth.js (2026-11-14, P54).
      // The health branch used to sit ABOVE this call, outside the try, in
      // its own bare block — one of three hand-written exemptions at three
      // different paths across the three Node services.
      if (!requireAuth(req, res, config.internalToken, { prefix: "/builder" })) return;

      // Liveness AND readiness for the container probe — the one
      // unauthenticated path, exempted by the shared check above. 503 when
      // degraded, because a 200 whose body says "degraded" is not a signal
      // anything reads (P45).
      if (url.pathname === "/builder/_health") {
        const ready = boot ? boot.dbReady() : true;
        const payload = JSON.stringify({ service: "mjolnir-builder", status: boot ? boot.status() : "ready", db: ready });
        res.writeHead(ready ? 200 : 503, { "Content-Type": "application/json; charset=utf-8", "Content-Length": Buffer.byteLength(payload) });
        return res.end(payload);
      }

      if (req.method === "GET" && url.pathname === "/builder/api/forecast") {
        return sendJson(res, 200, await runForecast(pool, config));
      }
      // /builder/ui is an alias for the bare path, kept for existing links
      // and bookmarks. It is no longer "the convention": unified-auth 5.1
      // moved stabbur's and smia's UIs to their prefix roots and 5.5
      // superseded D46's /ui mount point, so `/builder` is the entry point
      // and `/builder/ui` is simply the same page.
      // READINESS GATE. The forecast panel already degrades when stabbur is
      // unreachable, but the other three queries on this page read builder's
      // OWN database — so with postgres down the page still 500'd, just by a
      // different route. Degrade to an honest 503 rather than a driver error.
      if (boot && !boot.dbReady() && url.pathname.startsWith("/builder")
          && url.pathname !== "/builder/_health" && url.pathname !== "/builder/login") {
        // Not `boot.lastError().message` - that is the raw driver text and
        // names internal hostnames ("getaddrinfo ENOTFOUND postgres"). It
        // stays in the log, which already records it on every attempt.
        const why = "the database is not reachable";
        if (url.pathname.includes("/api/")) {
          const payload = JSON.stringify({ error: "database unavailable", detail: why });
          res.writeHead(503, { "Content-Type": "application/json; charset=utf-8", "Content-Length": Buffer.byteLength(payload) });
          return res.end(payload);
        }
        const html = `<!doctype html><meta charset="utf-8"><title>builder — database unavailable</title>${iconLink("mjolnir-builder")}
          <body style="font-family:system-ui;background:#14171c;color:#e8e6e1;padding:3rem">
          <h2>Database unavailable</h2>
          <p>The builder console needs the database, which is not reachable right
          now. Scheduled builds retry on their own and devices are unaffected —
          updates are served off disk.</p>
          <p style="opacity:.6"><code>${String(why).replace(/[<&]/g, "")}</code></p>
          <p><a style="color:#c6703f" href="/mjolnir">← workbench</a></p></body>`;
        res.writeHead(503, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(html);
      }

      if (
        req.method === "GET" &&
        (url.pathname === "/builder" || url.pathname === "/builder/" || url.pathname === "/builder/ui")
      ) {
        // DEGRADE TO A LOST FEATURE, NOT A LOST PAGE.
        //
        // `runForecast` pulls notes from stabbur over HTTP. It used to sit in
        // this Promise.all unguarded, so with stabbur unavailable the whole
        // console answered
        //   500 {"error":"stabbur pull failed: 503 SERVICE UNAVAILABLE"}
        // — the exact cascade zone-isolation exists to remove, and a direct
        // contradiction of its own spec. Found by independent review, which
        // stopped stabbur and looked, rather than by reading the dependency
        // table that claimed builder tolerates it.
        //
        // The forecast is ONE panel. Everything else on this page — the run
        // slot, the integrity banner, the active logic bundle — comes from
        // builder's own database and is unaffected by stabbur being down.
        let forecastError = null;
        const forecastOrNull = runForecast(pool, config).catch((err) => {
          forecastError = err;
          console.error(`[mjolnir-builder] forecast unavailable: ${err.message}`);
          return null;
        });
        const [forecastRaw, jobs, activeLogicBundle] = await Promise.all([
          forecastOrNull,
          recentBuildJobs(pool),
          getActiveMeta(pool),
        ]);
        const forecast = forecastRaw || emptyForecast(forecastError?.message);
        const [deckMeta, shipOrders, integrity, runState] = await Promise.all([
          loadDeckMeta(pool, forecast.byDeck.map((d) => d.deckCode)),
          loadShipOrders(pool, forecast),
          // D-FA4: read-only, builder's own database — it must still render
          // when the stabbur pull above has already failed, so it is NOT
          // behind the forecast's degraded fallback.
          checkOccurrenceIntegrity(pool),
          // D-SS6: the run slot is derived from `build_jobs`/`job_logs`, so
          // a plain load reports a scheduled run nobody watched, and a run
          // already executing puts the page in progress with no POST (4.7).
          describeLastRun(pool, { jobs }),
        ]);
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(
          renderShipStripsPage({ forecast, deckMeta, shipOrders, activeLogicBundle, integrity, runState })
        );
      }

      // D-SS6 (4.1): the run slot's own endpoint — the most recent run's
      // derived state plus the running job's narration tail. Polled only
      // while a run is live; it is narration, not truth, and the result it
      // reports comes from the stored row either way.
      if (req.method === "GET" && url.pathname === "/builder/api/run-status") {
        return sendJson(res, 200, await describeLastRun(pool));
      }

      // 3.11: one card's preview markup, rendered by the shared capability
      // from the extractor's style map. `getCardPreviewData` RETHROWS on a
      // failed extraction and that loudness is preserved here — a preview
      // built on invented values is worse than no preview.
      if (req.method === "GET" && url.pathname === "/builder/api/card-preview") {
        const cardId = url.searchParams.get("card");
        if (!cardId) return sendJson(res, 400, { error: "card is required" });
        const content = (await getAllCardContent(pool)).get(cardId);
        if (!content) return sendJson(res, 404, { error: "no stored content for this card", detail: cardId });
        let previewData;
        try {
          previewData = getCardPreviewData(config.baseFolderDir);
        } catch (err) {
          return sendJson(res, 503, {
            error: "the bundle style extractor failed",
            detail: `${err.message} — fix tool/src/extractCardStyle.js; refusing to render a guessed-at card`,
          });
        }
        // `hasAudioFile` only drives the preview's gutter speaker marker,
        // and the drawer hides the gutter — passed false rather than
        // guessed at from a blob path builder does not index.
        return sendJson(res, 200, {
          html: cardPreviewInlineHtml(cardId, content, false, previewData.style, previewData.symbols),
        });
      }
      // Task 4.15: triggers 4.2-4.12 immediately, independent of the
      // schedule — a no-op if nothing is newly eligible (runPublish handles it).
      if (req.method === "POST" && url.pathname === "/builder/api/publish") {
        const grammarRuleLookup = await buildGrammarRuleLookup({ baseUrl: config.stabburBaseUrl, authToken: config.internalToken });
        const result = await runPublish(pool, { ...config, grammarRuleLookup, log: makeDbLogger(pool) });
        return sendJson(res, 200, result);
      }

      if (req.method === "GET" && url.pathname === "/builder/schedule") {
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderSchedulePage(await getSchedule(pool)));
      }
      if (req.method === "POST" && url.pathname === "/builder/api/schedule") {
        const schedule = await readJson(req);
        await setSchedule(pool, schedule);
        return sendJson(res, 200, { ok: true });
      }

      if (req.method === "GET" && url.pathname === "/builder/logs") {
        const jobId = url.searchParams.get("job");
        const [jobs, selectedJob] = await Promise.all([recentBuildJobs(pool), jobId ? getBuildJob(pool, Number(jobId)) : null]);
        const logLines = selectedJob ? await jobLogLines(pool, selectedJob.id) : [];
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderLogsPage(jobs, selectedJob, logLines));
      }

      res.writeHead(404, { "Content-Type": "text/plain" });
      res.end("not found");
    } catch (err) {
      console.error(err);
      sendJson(res, 500, { error: err.message });
    }
  });
}
