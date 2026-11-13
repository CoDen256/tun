import http from "node:http";
import { runForecast, runPublish } from "./pipeline.js";
import { recentBuildJobs, getBuildJob } from "./buildJobs.js";
import { buildGrammarRuleLookup } from "./stabburClient.js";
import { getSchedule, setSchedule } from "./schedulerConfig.js";
import { jobLogLines, makeDbLogger } from "./jobLogs.js";
import { recentBatches, occurrencesForBuild } from "./batchHistory.js";
import { getActiveMeta } from "./logicBundle.js";
import { renderShell, escapeHtml } from "./layout.js";
import { requireAuth, renderLoginPage, handleLoginPost } from "./auth.js";
import { shipOrderForDeck } from "./cardFlow.js";
import { occurrencesPerCardForDeck } from "./deckFamilies.js";

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

function timeAgo(date) {
  const ms = Date.now() - new Date(date).getTime();
  const mins = Math.floor(ms / 60000);
  if (mins < 60) return `${mins}m ago`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h ago`;
  return `${Math.floor(hours / 24)}d ago`;
}

// ---- Forecast & publish (occurrence-level, D-H2) ----

function occurrenceRow(o, { withReason = false } = {}) {
  const sideLetter = o.letter === "E" ? `<span class="pill pill-warn">${o.letter}</span>` : `<span class="pill pill-ok">${o.letter}</span>`;
  return `<tr>
    <td class="mono">${escapeHtml(o.cardId)}</td>
    <td>${sideLetter}</td>
    <td class="mono">${escapeHtml(o.deckCode)}</td>
    <td class="wrap">${o.noteText ? escapeHtml(o.noteText) : ""}</td>
    ${withReason ? `<td>${escapeHtml(o.reason || "")}</td>` : ""}
  </tr>`;
}

// D-L4: shows what `builder`'s next publish would actually build onto —
// the single most important fact this page was missing once `BUNDLE_PATH`
// stopped being a fixed, always-visible config value. `null` means no
// `logic_bundles` row has ever been activated: a real publish attempt would
// fail loudly (`logicBundle.js`'s `loadActive`), so this renders as an
// explicit warning rather than silently omitting the banner.
function renderActiveLogicBundleBanner(activeLogicBundle) {
  if (!activeLogicBundle) {
    return `<div class="panel panel-pad" style="border-color: var(--err); margin-bottom:16px;">
      <strong style="color: var(--err);">⚠ No active logic bundle.</strong>
      Publishing will fail until one is submitted and activated via <a href="/mjolnir/ota">hub's OTA console</a>.
    </div>`;
  }
  return `<div class="panel panel-pad" style="margin-bottom:16px; display:flex; align-items:center; gap:14px;">
    <span class="pill pill-ok">● publishing onto</span>
    <span class="mono">base ${escapeHtml(activeLogicBundle.baseVersion)}</span>
    <span class="mono">logic ${activeLogicBundle.patchRev}</span>
    ${activeLogicBundle.label ? `<span>${escapeHtml(activeLogicBundle.label)}</span>` : ""}
    <span class="mono" style="color: var(--text-faint);">sha256 ${escapeHtml(activeLogicBundle.bundleSha.slice(0, 8))}…</span>
    <a href="/mjolnir/ota" class="btn-ghost" style="margin-left:auto;">change →</a>
  </div>`;
}

// ---- Card-flow view (builder-card-flow-ui) ----
// Everything below renders the new global totals strip, 5-stage pipeline
// rail, and per-deck summary/detail cards that replace the old stat-row and
// "would publish this run — by deck" table. Read-only — all data comes from
// `runForecast`'s extended `byDeck` entries (cardFlow.js/pendingOccurrences.js)
// plus a per-deck `shipOrderForDeck` call for the expandable detail strip.

function fmtDeckBreakdown(byDeck, pick) {
  const parts = byDeck
    .map((d) => [d.deckCode, pick(d)])
    .filter(([, v]) => v > 0)
    .sort((a, b) => a[0].localeCompare(b[0]));
  if (parts.length === 0) return "—";
  return parts.map(([code, v]) => `${escapeHtml(code)} ${v}`).join(" · ");
}

function deltaLine(delta, { neutralLabel = "nothing this run" } = {}) {
  if (delta > 0) return `<div class="delta"><span class="plus">+${delta}</span> this run</div>`;
  return `<div class="delta neutral">${escapeHtml(neutralLabel)}</div>`;
}

function buildGlobalTotals(forecast) {
  const sum = (pick) => forecast.byDeck.reduce((n, d) => n + (pick(d) || 0), 0);
  const mintedTotal = sum((d) => d.mintedCount);
  const eventualTotal = sum((d) => d.occurrencesEventual);
  const shippedTotal = sum((d) => d.shippedTotal);
  const stagedTotal = sum((d) => d.stagedTotal);
  const pendingTotal = sum((d) => d.pendingTotal);

  // This-run deltas — forward-looking, same "if published right now" basis
  // the pipeline rail's own deltas already use, not yet-committed actuals.
  // Occurrences-eventual's delta mirrors Cards-minted's: each newly-
  // eligible card contributes its family's full occurrence shape, derived
  // the same way `deckTotals` derives the absolute total (no second source
  // of truth).
  const mintedDelta = sum((d) => d.newlyEligibleCount);
  const eventualDelta = sum((d) => d.newlyEligibleCount * (occurrencesPerCardForDeck(d.deckCode) ?? 0));
  const shippedDelta = sum((d) => d.wouldFlushCount);

  return `
<div class="flow-totals">
  <div class="flow-cell-stat">
    <div class="label">Cards minted</div>
    <div class="value">${mintedTotal}</div>
    ${deltaLine(mintedDelta, { neutralLabel: "nothing newly eligible" })}
    <div class="sub">${fmtDeckBreakdown(forecast.byDeck, (d) => d.mintedCount)}</div>
  </div>
  <div class="flow-cell-stat">
    <div class="label">Occurrences, eventual</div>
    <div class="value">${eventualTotal}</div>
    ${deltaLine(eventualDelta, { neutralLabel: "nothing newly eligible" })}
    <div class="sub">every side every minted card will ever contribute</div>
  </div>
  <div class="flow-cell-stat">
    <div class="label">Shipped (in bundle)</div>
    <div class="value">${shippedTotal}</div>
    ${deltaLine(shippedDelta, { neutralLabel: "nothing would flush" })}
    <div class="sub">${fmtDeckBreakdown(forecast.byDeck, (d) => d.shippedTotal)}</div>
  </div>
  <div class="flow-cell-stat">
    <div class="label">Staged — short of next 5</div>
    <div class="value">${stagedTotal}</div>
    <div class="sub">${fmtDeckBreakdown(forecast.byDeck, (d) => d.stagedTotal)}</div>
  </div>
  <div class="flow-cell-stat">
    <div class="label">Pending — 11-batch spacing</div>
    <div class="value">${pendingTotal}</div>
    <div class="sub">${fmtDeckBreakdown(forecast.byDeck, (d) => d.pendingTotal)}</div>
  </div>
</div>`;
}

function stageHtml({ name, total, unit, delta, deltaNeutral, hint, active }) {
  return `<div class="flow-stage${active ? " active" : ""}">
    <div class="node">${total}</div>
    <div class="name">${escapeHtml(name)}</div>
    <div class="total mono">${total}${unit ? `<span class="unit">${escapeHtml(unit)}</span>` : ""}</div>
    <div class="delta${deltaNeutral ? " neutral" : ""}">${delta}</div>
    <div class="hint">${hint || "&nbsp;"}</div>
  </div>`;
}

// Task 4.1/4.2: the 5-stage pipeline rail. Pulled/Minted/Staged/Flushed show
// absolute running totals (current DB state) alongside what *this* forecast
// says would happen on the next "Publish now" — Pulled gets a neutral note
// instead of a delta (every run re-pulls the full eligible set, D-P5).
// Published isn't a forecast at all — it reports the last ACTUAL publish
// (same fact the old stat-row's "Last publish" cell showed).
function buildPipelineRail(forecast, lastJob, totalPulled, totalAlreadyMinted) {
  const totalNewlyEligible = forecast.byDeck.reduce((n, d) => n + d.newlyEligibleCount, 0);
  const mintedTotal = forecast.byDeck.reduce((n, d) => n + d.mintedCount, 0);
  const stagedTotal = forecast.byDeck.reduce((n, d) => n + d.stagedTotal, 0);
  const shippedTotal = forecast.byDeck.reduce((n, d) => n + d.shippedTotal, 0);
  const wouldFlushTotal = forecast.byDeck.reduce((n, d) => n + d.wouldFlushCount, 0);

  const mintingDecks = forecast.byDeck.filter((d) => d.newlyEligibleCount > 0);
  const flushingDecks = forecast.byDeck.filter((d) => d.wouldFlushCount > 0);
  const heldDecks = forecast.byDeck.filter((d) => d.wouldFlushCount === 0 && d.stagedTotal > 0);
  const stagedDecks = forecast.byDeck.filter((d) => d.stagedTotal > 0);

  const stages = [
    stageHtml({
      name: "Pulled",
      total: totalPulled,
      unit: "eligible",
      delta: "full re-pull, every run",
      deltaNeutral: true,
      hint: `${totalAlreadyMinted} already minted · ${totalNewlyEligible} newly ready`,
    }),
    stageHtml({
      name: "Minted",
      total: mintedTotal,
      unit: "cards, ever",
      delta: totalNewlyEligible > 0 ? `+${totalNewlyEligible} this run` : "nothing to mint",
      deltaNeutral: totalNewlyEligible === 0,
      hint: mintingDecks.map((d) => `${escapeHtml(d.deckCode)}×${d.newlyEligibleCount}`).join(" · ") || "&nbsp;",
    }),
    stageHtml({
      name: "Staged",
      total: stagedTotal,
      unit: "outstanding",
      delta: stagedDecks.map((d) => `${escapeHtml(d.deckCode)} ${d.stagedTotal}`).join(" · ") || "none outstanding",
      deltaNeutral: true,
      hint: "short of their deck's next multiple of 5",
      active: true,
    }),
    stageHtml({
      name: "Flushed",
      total: shippedTotal,
      unit: "shipped, ever",
      delta: wouldFlushTotal > 0 ? `+${wouldFlushTotal} if published now` : "nothing would flush",
      deltaNeutral: wouldFlushTotal === 0,
      hint:
        flushingDecks.length > 0
          ? `${flushingDecks.map((d) => escapeHtml(d.deckCode)).join(", ")} would flush${heldDecks.length ? ` — ${heldDecks.map((d) => escapeHtml(d.deckCode)).join(", ")} held` : ""}`
          : "&nbsp;",
    }),
    stageHtml({
      name: "Published",
      total: lastJob ? escapeHtml(lastJob.build_id) : "—",
      delta: lastJob ? timeAgo(lastJob.finished_at) : "never published",
      deltaNeutral: true,
      hint: "&nbsp;",
    }),
  ].join("\n");

  return `
<div class="flow-rail">
  <div class="flow-rail-head">
    <h3>This run, end to end</h3>
    <span class="note">${lastJob ? `${escapeHtml(lastJob.build_id)} · ${timeAgo(lastJob.finished_at)}` : "no publish yet"}</span>
  </div>
  <div class="flow-stages">${stages}</div>
</div>`;
}

const OCCURRENCE_LETTER_LABEL = { A: "A", E: "E", N: "N" };
const SHIP_ORDER_ROW_SIZE = 40;

function unitSpan(cls, letter, title) {
  return `<span class="flow-u ${cls}" title="${escapeHtml(title)}">${escapeHtml(OCCURRENCE_LETTER_LABEL[letter] || letter || "?")}</span>`;
}

// Task 5.2/5.3, merged into one continuous strip: the projected pending
// zone naturally extends the real zone (shipped -> staged -> open) in the
// SAME grid — rows of 40 cells, a `.flow-batch-div` between every batch of
// 5 throughout (real AND projected alike), row numbering carrying over
// rather than restarting.
function renderShipOrderStrip(units) {
  if (units.length === 0) return "";
  const rowParts = [];
  let rowStart = 0;
  let rowCells = [];
  // Tracked separately from `rowCells.length` — that array also holds
  // divider HTML fragments, which must never count toward the row's own
  // cell-number range.
  let rowUnitCount = 0;

  const flushRow = () => {
    if (rowUnitCount === 0) return;
    const start = rowStart + 1;
    const end = rowStart + rowUnitCount;
    rowParts.push(`<div class="flow-shape-row"><span class="flow-row-no">${start}–${end}</span>${rowCells.join("")}</div>`);
    rowCells = [];
    rowUnitCount = 0;
  };

  for (let i = 0; i < units.length; i++) {
    const isRowStart = i % SHIP_ORDER_ROW_SIZE === 0;
    const isGroupStart = i % 5 === 0;
    if (isRowStart) {
      flushRow();
      rowStart = i;
    } else if (isGroupStart) {
      rowCells.push(`<span class="flow-batch-div"></span>`);
    }
    const u = units[i];
    rowCells.push(unitSpan(u.cls, u.letter, u.title));
    rowUnitCount += 1;
  }
  flushRow();
  return rowParts.join("\n");
}

function buildDeckFlowDetail(d, deckMeta, shipOrder) {
  const occPerCard = occurrencesPerCardForDeck(d.deckCode);
  const shapeDescription =
    occPerCard === 2
      ? "A+E pair — this family ships both sides"
      : "single-occurrence family — no A+E pair, so no pending-lag queue either";

  const realUnits = [
    ...shipOrder.shipped.map((o) => ({
      cls: "shipped",
      letter: o.letter,
      title: `${o.cardId} · ${o.letter}${o.noteText ? ` · ${o.noteText}` : ""}`,
    })),
    ...shipOrder.staged.map((o) => ({
      cls: "staged",
      letter: o.letter,
      title: `${o.cardId} · ${o.letter}${o.noteText ? ` · ${o.noteText}` : ""} — staged, holding for the next flush`,
    })),
    ...Array.from({ length: shipOrder.open }, () => ({
      cls: "open",
      letter: "?",
      title: "open — not yet minted, counts toward the next flush",
    })),
  ];

  // Task 5.3 (reworked): instead of a text "+N" label marking how far a
  // tier is, that distance is rendered AS N actual filler cells (`.flow-u
  // .gap`, "?" like `open`, but visually distinct — these represent future
  // arrivals, not unminted slots) — inserted right after that tier's own
  // cards, in the same continuous strip `open` already flows into.
  //
  // `showPending` gates this ENTIRELY on the deck's own family shape, not
  // on whether `d.pendingByTier` happens to be empty — a single-occurrence
  // deck (occPerCard !== 2) must never show a pending zone at all, even if
  // it has stray rows (e.g. a card reassigned here from a dual-occurrence
  // family mid-queue, practice-deck-remint) whose pending letter was
  // queued under its ORIGINAL family's rules, not this deck's.
  const showPending = occPerCard === 2;
  const hasRealPendingCards = d.pendingByTier.length > 0;
  const pendingUnits = [];
  if (showPending) {
    for (const tier of d.pendingByTier) {
      for (const c of tier.cards) {
        pendingUnits.push({
          cls: "pending",
          letter: c.letter,
          title: `${c.cardId} · ${c.letter}${c.noteText ? ` · ${c.noteText}` : ""} — +${tier.remaining} away`,
        });
      }
      for (let i = 0; i < tier.remaining; i++) {
        pendingUnits.push({
          cls: "gap",
          letter: "?",
          title: `${tier.remaining} more new card${tier.remaining === 1 ? "" : "s"} must land in ${d.deckCode} before this tier drains`,
        });
      }
    }
    // The projected zone is also always a clean multiple of 5, same rhythm
    // as the real zone's own batch-of-5 grouping — pad the tail with
    // generic "not yet landed" fillers (not tied to any specific tier), or
    // render exactly one whole filler batch when there's nothing pending
    // at all, rather than showing no projected zone whatsoever.
    const remainder = pendingUnits.length % 5;
    const padCount = pendingUnits.length === 0 ? 5 : remainder === 0 ? 0 : 5 - remainder;
    for (let i = 0; i < padCount; i++) {
      pendingUnits.push({ cls: "gap", letter: "?", title: "not yet landed — nothing projected into this slot yet" });
    }
  }
  const combinedUnits = [...realUnits, ...pendingUnits];

  const legend = `<div class="flow-legend">
    <span class="sw">${unitSpan("shipped", "·", "shipped")}shipped</span>
    <span class="sw">${unitSpan("staged", "·", "staged")}staged — short of next 5</span>
    <span class="sw">${unitSpan("open", "?", "open")}open — not yet minted</span>
    ${showPending ? `<span class="sw">${unitSpan("pending", "E", "pending")}pending — 11-batch spacing lag</span>` : ""}
    ${showPending ? `<span class="sw">${unitSpan("gap", "?", "not yet landed")}not yet landed</span>` : ""}
  </div>`;

  const bannerClass = d.gridStatus.onGrid ? "" : " crit";
  const banner = `<div class="flow-banner${bannerClass}">
    <b>${d.mintedCount} card${d.mintedCount === 1 ? "" : "s"} minted, ${d.occurrencesEventual} occurrence${d.occurrencesEventual === 1 ? "" : "s"} total</b>
    (${shapeDescription}). ${d.shippedTotal} shipped, ${d.stagedTotal} staged${occPerCard === 2 ? `, ${d.pendingTotal} pending in the 11-batch spacing lag` : ""}.
    This run: ${d.newlyEligibleCount} new card${d.newlyEligibleCount === 1 ? "" : "s"} minted,
    ${d.wouldFlushCount > 0 ? `the next multiple of 5 would be reached and flushed (+${d.wouldFlushCount})` : d.stagedTotal > 0 ? "held — still short of the next multiple of 5" : "nothing outstanding"}.
  </div>`;

  return `<div class="flow-detail">
    ${banner}
    <div class="flow-shape-wrap">
      <h4>Full ship order — shipped → staged → open → pending, one continuous strip</h4>
      ${legend}
      <div class="flow-shape-box">
        <div class="flow-shape-rows">${renderShipOrderStrip(combinedUnits) || `<div class="flow-pending-empty">nothing minted into this deck yet</div>`}</div>
        ${
          !showPending && combinedUnits.length > 0
            ? `<p class="flow-pending-empty">No pending zone for this deck — single-occurrence type, nothing ever waits out an 11-batch spacing gap.</p>`
            : ""
        }
      </div>
      ${
        hasRealPendingCards
          ? `<div class="flow-shape-note"><b>How "open" and "pending" actually relate:</b> they're not strictly sequential. Every pending occurrence counts down by however many brand-new cards land in ${escapeHtml(d.deckCode)} each run — whichever rows reach zero drain together in that same run, not one at a time on a fixed schedule. The "?" filler cells after each tier represent that same distance visually, not a literal queue of specific future cards. A single new card can fill the open slot above <i>and</i> drain a near-zero pending tier in the same run.</div>`
          : ""
      }
    </div>
  </div>`;
}

// Task 5.1: the compact per-deck summary row — code/title, the 5-cell
// in-progress-batch block, the grid-status chip, and absolute totals + this
// run's delta. The 5-cell BLOCK (colored cells) shows the CURRENT,
// not-yet-flushed batch only — `shippedCount % 5` cells are already-shipped
// within it (a fully-shipped batch has already flushed and is never
// "current"), then staged, then open. The READOUT TEXT's "shipped" number
// is deliberately NOT that same in-batch count (which is always 0 for an
// on-grid deck — a completed batch is by definition never "current",
// so that figure would be vacuous) — it's the deck's absolute lifetime
// shipped total, same number the global totals strip and the detail
// banner both already use.

function buildDeckFlowCard(d, deckMeta, shipOrder, thisRunOccDelta) {
  const meta = deckMeta.get(d.deckCode) || { title: d.deckCode, description: "" };
  const shippedInBatch = d.shippedTotal % 5;
  const stagedShown = Math.min(d.stagedTotal, 5 - shippedInBatch);
  const openShown = 5 - shippedInBatch - stagedShown;
  const target = shippedInBatch === 0 && d.stagedTotal === 0 ? d.shippedTotal : d.shippedTotal - shippedInBatch + 5;

  const cells = [
    ...Array.from({ length: shippedInBatch }, () => `<div class="flow-cell shipped" title="shipped"></div>`),
    ...Array.from(
      { length: stagedShown },
      () => `<div class="flow-cell staged" title="staged, counting toward ${target}"></div>`
    ),
    ...Array.from(
      { length: openShown },
      () => `<div class="flow-cell open" title="not yet minted — still needed to flush this batch"></div>`
    ),
  ].join("");

  const statusChip = d.gridStatus.onGrid
    ? `<span class="flow-status-chip ok"><span class="sdot"></span>On grid</span>`
    : `<span class="flow-status-chip stalled"><span class="sdot"></span>Stalled${d.gridStatus.stalledDays !== null ? ` — ${d.gridStatus.stalledDays} d` : ""}</span>`;

  return `<details class="flow-deck${d.gridStatus.onGrid ? "" : " stalled"}">
    <summary class="flow-deck-row">
      <div class="flow-deck-id">
        <svg class="flow-chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M9 6l6 6-6 6"/></svg>
        <div>
          <div class="flow-deck-code mono">${escapeHtml(d.deckCode)}</div>
          <div class="flow-deck-title">${escapeHtml(meta.title)}${meta.description ? ` — ${escapeHtml(meta.description)}` : ""}</div>
        </div>
      </div>

      <div class="flow-grid-track">
        <div class="flow-blocks">${cells}</div>
        <div class="flow-grid-readout"><span class="mono">${d.shippedTotal}</span> shipped · <span class="mono">${stagedShown}</span> staged · <span class="mono">${openShown}</span> open</div>
      </div>

      ${statusChip}

      <div class="flow-deck-meta">
        <div class="totals-line">${d.mintedCount} card${d.mintedCount === 1 ? "" : "s"} · ${d.occurrencesEventual} occ. total</div>
        <div class="delta-line">${d.newlyEligibleCount > 0 ? `<span class="plus">+${d.newlyEligibleCount} card${d.newlyEligibleCount === 1 ? "" : "s"}</span> / +${thisRunOccDelta} occ. this run` : "no activity this run"}</div>
      </div>
    </summary>
    ${buildDeckFlowDetail(d, deckMeta, shipOrder)}
  </details>`;
}

function buildCardFlowSection(forecast, jobs, deckMeta, shipOrders, totalPulled, totalAlreadyMinted) {
  const lastJob = jobs.find((j) => j.status === "succeeded" && j.build_id);
  const sortedDecks = [...forecast.byDeck].sort((a, b) => a.deckCode.localeCompare(b.deckCode));
  // "This run" occurrence delta per deck: exactly the newly-eligible
  // occurrences this run would create (new cards' immediate letters, plus
  // any queue rows that would cross zero and newly-queued rows) — `wouldShip`
  // only ever carries THESE, never pre-existing staged rows (those are
  // simulated against, but never pushed to `wouldShip` themselves), so this
  // is not the same number as `wouldFlushCount + wouldHoldCount`, which
  // mixes in staged occurrences from before this run.
  const occDeltaByDeck = new Map(
    forecast.byDeck.map((d) => [
      d.deckCode,
      forecast.wouldShip.filter((o) => o.deckCode === d.deckCode).length +
        forecast.wouldQueue.filter((o) => o.deckCode === d.deckCode).length,
    ])
  );
  const deckCards = sortedDecks
    .map((d) =>
      buildDeckFlowCard(
        d,
        deckMeta,
        shipOrders.get(d.deckCode) || { shipped: [], staged: [], open: 0 },
        occDeltaByDeck.get(d.deckCode) || 0
      )
    )
    .join("\n");

  return `
${buildGlobalTotals(forecast)}
${buildPipelineRail(forecast, lastJob, totalPulled, totalAlreadyMinted)}

<div class="section-head"><h3>Decks</h3></div>
${deckCards || `<div class="panel panel-pad">no decks with activity or history yet</div>`}
`;
}

// D109: factored out from `renderForecastPage` so hub can reuse this exact
// markup directly (importing it, not duplicating it) when rendering
// builder's pages inside hub's own shell — see hub/src/layout.js's "Builder"
// nav group comment. Replaces the earlier iframe-based "unified console"
// (D-C9), reverted: it doubled chrome and the workbench's own light theme
// read worse than the operator wanted.
export function buildForecastBody(forecast, jobs, batches, batchDetails, activeLogicBundle, deckMeta = new Map(), shipOrders = new Map()) {
  // builder-sliding-window-shipping (task 3.1): eligible ≠ ships today —
  // split into what the flush step would actually append to Cards[] this
  // run vs. what gets (re)staged and held short of the next multiple of 5.
  const shipRows = forecast.wouldShip
    .filter((o) => o.willShipThisRun)
    .map((o) => occurrenceRow(o, { withReason: true }))
    .join("\n");
  const heldRows = forecast.wouldShip
    .filter((o) => !o.willShipThisRun)
    .map((o) => occurrenceRow(o, { withReason: true }))
    .join("\n");
  const queueRows = forecast.wouldQueue
    .map(
      (o) => `<tr>
        <td class="mono">${escapeHtml(o.cardId)}</td>
        <td><span class="pill pill-neutral">${escapeHtml(o.letter)}</span></td>
        <td class="mono">${escapeHtml(o.deckCode)}</td>
        <td class="wrap">${escapeHtml(o.noteText || "")}</td>
        <td class="num">${o.remaining}</td>
      </tr>`
    )
    .join("\n");

  const updateRows = (forecast.wouldUpdate || [])
    .map(
      (u) => `<tr>
        <td class="mono">${escapeHtml(u.cardId)}</td>
        <td class="mono">${escapeHtml(u.deckCode)}</td>
        <td class="wrap">${escapeHtml(u.noteText || "")}</td>
      </tr>`
    )
    .join("\n");

  const batchPanels = batches
    .map((b) => {
      const contents = batchDetails.get(b.buildId) || [];
      const rows = contents.map((o) => occurrenceRow(o)).join("\n");
      return `<details class="json-toggle">
        <summary><span class="mono">${escapeHtml(b.buildId)}</span> — ${b.nonECount} new, ${b.eCount} drained · ${escapeHtml(new Date(b.createdAt).toISOString())} <span class="pill pill-ok" style="margin-left:8px;">published</span></summary>
        <div class="table-wrap" style="margin-top:6px;">
          <table>
            <thead><tr><th>Card</th><th>Side</th><th>Deck</th><th>Note</th></tr></thead>
            <tbody>${rows || `<tr><td colspan="4">no occurrences recorded</td></tr>`}</tbody>
          </table>
        </div>
      </details>`;
    })
    .join("\n");

  return `
<div class="page-head">
  <div><h2>Forecast &amp; publish</h2><div class="page-sub">What would ship if you published right now — no floor, every eligible note mints.</div></div>
  <button class="btn-primary" id="publish-now">Publish now</button>
</div>

${renderActiveLogicBundleBanner(activeLogicBundle)}

${buildCardFlowSection(forecast, jobs, deckMeta, shipOrders, forecast.totalPulled || 0, forecast.totalAlreadyMinted || 0)}

<div class="panel">
  <div class="panel-head"><h3>Occurrences shipping in this batch</h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Card</th><th>Side</th><th>Deck</th><th>Note</th><th>Reason</th></tr></thead>
      <tbody>${shipRows || `<tr><td colspan="5">nothing would ship right now</td></tr>`}</tbody>
    </table>
  </div>
  <div class="inline-note" style="margin:0 18px 14px;">A new card's <strong>A</strong> becomes eligible the run it's minted. Its <strong>E</strong> doesn't — it becomes eligible whenever the D91 queue drains, which can be many batches later. Either way, it only actually ships once its deck's staged count reaches a multiple of 5 — see "staged, held" below for what's eligible but not shipping yet.</div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Newly staged, held this batch <span class="pill pill-neutral" style="margin-left:8px;">short of a multiple of 5</span></h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Card</th><th>Side</th><th>Deck</th><th>Note</th><th>Reason</th></tr></thead>
      <tbody>${heldRows || `<tr><td colspan="5">nothing newly staged would be held</td></tr>`}</tbody>
    </table>
  </div>
  <div class="inline-note" style="margin:0 18px 14px;">Eligible this run, but this deck's total staged count (existing + new) doesn't reach the next multiple of 5 — stays staged until a future run's eligible notes push it over.</div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Existing cards whose content would change <span class="pill pill-neutral" style="margin-left:8px;">not new cards</span></h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Card</th><th>Deck</th><th>Note</th></tr></thead>
      <tbody>${updateRows || `<tr><td colspan="3">no already-minted card's content would change</td></tr>`}</tbody>
    </table>
  </div>
  <div class="inline-note" style="margin:0 18px 14px;">A card lands here when its source note was edited, or when the rendering template itself changed — either way, the next publish would regenerate this card's content differently from what's currently stored.</div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Newly queued from this batch <span class="pill pill-neutral" style="margin-left:8px;">ships later</span></h3></div>
  <div class="table-wrap">
    <table>
      <thead><tr><th>Card</th><th>Side</th><th>Deck</th><th>Note</th><th>Remaining</th></tr></thead>
      <tbody>${queueRows || `<tr><td colspan="5">nothing would be newly queued</td></tr>`}</tbody>
    </table>
  </div>
</div>

<div class="panel">
  <div class="panel-head"><h3>Past batches</h3></div>
  <div class="panel-pad">${batchPanels || "no publications yet"}</div>
</div>

<div id="result" class="inline-note"></div>
<script>
document.getElementById('publish-now').addEventListener('click', async () => {
  const btn = document.getElementById('publish-now');
  const result = document.getElementById('result');
  btn.disabled = true;
  result.textContent = 'publishing…';
  try {
    const res = await fetch('/builder/api/publish', { method: 'POST' });
    const body = await res.json();
    result.textContent = res.ok ? JSON.stringify(body) : ('error: ' + (body.error || res.status));
    if (res.ok) setTimeout(() => location.reload(), 800);
  } catch (err) {
    result.textContent = 'error: ' + err.message;
  } finally {
    btn.disabled = false;
  }
});
</script>`;
}

function renderForecastPage(forecast, jobs, batches, batchDetails, activeLogicBundle, deckMeta, shipOrders) {
  return renderShell({
    title: "mjolnir / builder — forecast",
    activeHref: "/builder",
    body: buildForecastBody(forecast, jobs, batches, batchDetails, activeLogicBundle, deckMeta, shipOrders),
  });
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

export function createServer(pool, config) {
  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://localhost");

      // D-H6: checked before every route except /builder/login itself.
      // Namespaced under /builder (not a bare /login) because Caddy only
      // routes /builder/* to this service (task 7.4) — a path outside that
      // prefix would never be reachable through the real deploy at all.
      // Disabled entirely if OPERATOR_AUTH_TOKEN is unset (local/dev) — see
      // config.js and task 7.4 on why that's safe only before the Caddy
      // routes are uncommented.
      const LOGIN_PATH = "/builder/login";
      if (config.operatorAuthToken) {
        if (req.method === "GET" && url.pathname === LOGIN_PATH) {
          const next = url.searchParams.get("next") || "/builder";
          res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
          return res.end(renderLoginPage({ next, loginPath: LOGIN_PATH }));
        }
        if (req.method === "POST" && url.pathname === LOGIN_PATH) {
          return handleLoginPost(req, res, config.operatorAuthToken, { loginPath: LOGIN_PATH });
        }
        if (!requireAuth(req, res, config.operatorAuthToken, { loginPath: LOGIN_PATH })) return;
      }

      if (req.method === "GET" && url.pathname === "/builder/api/forecast") {
        return sendJson(res, 200, await runForecast(pool, config));
      }
      // /builder/ui is the canonical entry point, matching stabbur's own
      // /stabbur/ui and hub's /mjolnir/ui (D46: one convention across
      // services). The bare path keeps working too.
      if (
        req.method === "GET" &&
        (url.pathname === "/builder" || url.pathname === "/builder/" || url.pathname === "/builder/ui")
      ) {
        const [forecast, jobs, batches, activeLogicBundle] = await Promise.all([
          runForecast(pool, config),
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
        res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        return res.end(renderForecastPage(forecast, jobs, batches, batchDetails, activeLogicBundle, deckMeta, shipOrders));
      }
      // Task 4.15: triggers 4.2-4.12 immediately, independent of the
      // schedule — a no-op if nothing is newly eligible (runPublish handles it).
      if (req.method === "POST" && url.pathname === "/builder/api/publish") {
        const grammarRuleLookup = await buildGrammarRuleLookup({ baseUrl: config.stabburBaseUrl, authToken: config.stabburAuthToken });
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
