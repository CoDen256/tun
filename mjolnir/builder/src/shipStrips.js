// builder-ship-strips: the ship-strips console — builder's primary page.
//
// REPLACES the forecast page (D-SS1): one page, not two, so nothing has to
// be kept in sync. Rendered here as a `renderShell`-free body so hub can
// re-render the identical markup inside its own shell (D109 — one body
// function, two shells).
//
// The page is three orthogonal axes (D-SS2), and NO TEXT INSIDE THE CELL
// GRID: fill = lifecycle, ring = new this run, corner dot = content
// rewritten by this publish, glyph = the occurrence letter. Row labels sit
// outside the grid; a pending tier's distance is rendered as that many
// filler cells rather than as a caption, because inline text consumes grid
// columns and breaks the 40-cell alignment the strip is read by.
//
// Everything the page shows is DERIVED — from `runForecast`, from
// `shipOrderForDeck`, and from `build_jobs`/`job_logs` via `runStatus.js`.
// Nothing is remembered client-side, which is what makes the run result
// survive a reload and report a scheduled run nobody watched (D-SS6).

import { escapeHtml } from "./layout.js";
import { nextMultipleOf5 } from "./cardFlow.js";
import { occurrencesPerCardForDeck } from "./deckFamilies.js";

export const ROW_SIZE = 40;

// D-SS3: ONE order, ONE icon set, ONE label set, reused verbatim by the
// global totals and by every deck rail header. Two surfaces reading from
// two lists is how they come to disagree.
export const STAT_ORDER = ["minted", "edited", "eventual", "shipped", "staged", "pending"];
const STAT_ICON = { minted: "◆", edited: "✎", eventual: "Σ", shipped: "●", staged: "◐", pending: "○" };
const STAT_LABEL = {
  minted: "Cards minted",
  edited: "Cards edited",
  eventual: "Occurrences, eventual",
  shipped: "Shipped",
  staged: "Staged — short of next 5",
  // 3.14: the countdown is in CARDS everywhere on this page. D91's prose
  // says "11 other occurrences"; `drainPendingOccurrences` decrements by
  // `newACount`, the count of brand-new cards. The mechanism is unchanged —
  // only described accurately.
  pending: "Pending — 11-card spacing",
};

function deckTitleOf(deckMeta, deckCode) {
  const meta = deckMeta.get(deckCode);
  return meta && meta.title ? meta.title : deckCode;
}

// The model the page renders from, and the same object the client script
// reads for hover/drawer detail. Built once, server-side: the strip, the
// readouts and the drawer can therefore never describe different numbers.
export function buildStripModel({ forecast, shipOrders, deckMeta = new Map() }) {
  const changedByCard = new Map();
  for (const u of forecast.wouldUpdate || []) changedByCard.set(u.cardId, u.changedFaces || []);

  const decks = [];
  for (const d of [...forecast.byDeck].sort((a, b) => a.deckCode.localeCompare(b.deckCode))) {
    const order = shipOrders.get(d.deckCode) || { shipped: [], staged: [], open: 0 };
    const occPerCard = occurrencesPerCardForDeck(d.deckCode);
    const newlyStaged = (forecast.wouldShip || []).filter((o) => o.deckCode === d.deckCode);
    const newlyQueued = (forecast.wouldQueue || []).filter((o) => o.deckCode === d.deckCode);
    // Every occurrence that drains out of the queue this run leaves the
    // pending zone and appears in the staged zone instead — marked new, the
    // same ring a newly-minted occurrence carries (D-SS2).
    const drainedKeys = new Set(
      newlyStaged.filter((o) => o.reason === "queue drained").map((o) => o.cardId + "/" + o.letter)
    );

    const units = [];
    let idx = 0;
    const push = (u) => {
      idx += 1;
      units.push({ idx, ...u });
    };

    for (const o of order.shipped) {
      const faces = changedByCard.get(o.cardId) || null;
      push({
        cls: "shipped",
        letter: o.letter,
        cardId: o.cardId,
        note: o.noteText || "",
        buildId: o.buildId || null,
        shippedAt: o.shippedAt ? new Date(o.shippedAt).toISOString() : null,
        changed: !!faces,
        faces,
      });
    }

    // Staged order mirrors the real pipeline's: existing staged rows ship
    // FIFO first, then whatever this run newly stages (`runForecast`'s own
    // simulation order). The first `wouldFlushCount` of that sequence are
    // the ones that reach the deck's next multiple of 5 and flush; the rest
    // are held — the lifecycle split the fill carries.
    const stagedSeq = [
      ...order.staged.map((o) => ({ ...o, isNew: false, newKind: null })),
      ...newlyStaged.map((o) => ({
        cardId: o.cardId,
        letter: o.letter,
        noteText: o.noteText || "",
        isNew: true,
        newKind: o.reason === "queue drained" ? "drained" : "minted",
      })),
    ];
    stagedSeq.forEach((o, i) => {
      const faces = changedByCard.get(o.cardId) || null;
      push({
        cls: "staged",
        letter: o.letter,
        cardId: o.cardId,
        note: o.noteText || "",
        flushing: i < d.wouldFlushCount,
        isNew: o.isNew,
        newKind: o.newKind,
        changed: !!faces,
        faces,
      });
    });

    // D-SS5: measured from shipped + staged, never from shipped alone —
    // always 1..5, so a deck carried past its multiple by staged rows still
    // reports the slots it genuinely awaits.
    const shippedCount = order.shipped.length;
    const stagedCount = stagedSeq.length;
    const realTotal = shippedCount + stagedCount;
    const openTarget = nextMultipleOf5(realTotal);
    const open = openTarget - realTotal;
    for (let i = 0; i < open; i++) push({ cls: "open", letter: "?", cardId: null, openTarget });

    // D-SS2: no pending zone AT ALL for a single-occurrence family, gated
    // on the family shape rather than on whether stray rows happen to
    // exist for the deck.
    const showPending = occPerCard === 2;
    let pendingCount = 0;
    if (showPending) {
      const tiers = (d.pendingByTier || [])
        .map((t) => ({
          remaining: t.remaining,
          cards: t.cards.filter((c) => !drainedKeys.has(c.cardId + "/" + c.letter)).map((c) => ({ ...c, isNew: false })),
        }))
        .filter((t) => t.cards.length > 0);
      if (newlyQueued.length > 0) {
        const at = newlyQueued[0].remaining;
        const existing = tiers.find((t) => t.remaining === at);
        const fresh = newlyQueued.map((o) => ({ cardId: o.cardId, letter: o.letter, noteText: o.noteText || "", isNew: true }));
        if (existing) existing.cards.push(...fresh);
        else tiers.push({ remaining: at, cards: fresh });
      }
      tiers.sort((a, b) => a.remaining - b.remaining);
      for (const t of tiers) {
        for (const c of t.cards) {
          pendingCount += 1;
          push({
            cls: "pending",
            letter: c.letter,
            cardId: c.cardId,
            note: c.noteText || "",
            remaining: t.remaining,
            tierSize: t.cards.length,
            isNew: !!c.isNew,
            newKind: c.isNew ? "queued" : null,
            changed: !!changedByCard.get(c.cardId),
            faces: changedByCard.get(c.cardId) || null,
          });
        }
        // The tier's distance IS these cells — one per new card still to
        // land in the deck. No caption states the number (D-SS2).
        for (let i = 0; i < t.remaining; i++) {
          push({ cls: "gap", letter: "?", cardId: null, remaining: t.remaining, tierSize: t.cards.length });
        }
      }
    }

    const edited = (forecast.wouldUpdate || []).filter((u) => u.deckCode === d.deckCode).length;
    const held = stagedCount - d.wouldFlushCount;
    const drainedCount = newlyStaged.filter((o) => o.reason === "queue drained").length;

    decks.push({
      code: d.deckCode,
      title: deckTitleOf(deckMeta, d.deckCode),
      occPerCard,
      showPending,
      // The readout's six figures. Every one is the state a publish right
      // now would leave behind, which is also exactly what the strip draws
      // — one basis, so a figure and a cell count cannot disagree.
      minted: d.mintedCount + d.newlyEligibleCount,
      edited,
      eventual: (d.occurrencesEventual || 0) + d.newlyEligibleCount * (occPerCard || 0),
      shipped: shippedCount,
      staged: stagedCount,
      pending: pendingCount,
      deltas: {
        minted: d.newlyEligibleCount,
        eventual: d.newlyEligibleCount * (occPerCard || 0),
        shipped: d.wouldFlushCount,
        staged: newlyStaged.length,
        pendingQueued: newlyQueued.length,
        pendingDrained: drainedCount,
      },
      // D-SS11: on-grid is a canary — silent when correct, loud when
      // faulted. `shipped` is the deck's real shipped count.
      onGrid: shippedCount % 5 === 0,
      open,
      openTarget,
      flushTarget: shippedCount + d.wouldFlushCount,
      held,
      heldText:
        held > 0
          ? "held — " +
            held +
            " staged sit past " +
            (shippedCount + d.wouldFlushCount) +
            ", waiting on " +
            openTarget +
            " (" +
            open +
            " more occurrence" +
            (open === 1 ? "" : "s") +
            ")"
          : null,
      units,
    });
  }

  const sum = (pick) => decks.reduce((n, d) => n + (pick(d) || 0), 0);
  const totals = {
    figures: {
      minted: sum((d) => d.minted),
      edited: sum((d) => d.edited),
      eventual: sum((d) => d.eventual),
      shipped: sum((d) => d.shipped),
      staged: sum((d) => d.staged),
      pending: sum((d) => d.pending),
    },
    deltas: {
      minted: sum((d) => d.deltas.minted),
      eventual: sum((d) => d.deltas.eventual),
      shipped: sum((d) => d.deltas.shipped),
      staged: sum((d) => d.deltas.staged),
      pendingQueued: sum((d) => d.deltas.pendingQueued),
      pendingDrained: sum((d) => d.deltas.pendingDrained),
    },
  };

  return { decks, totals, rowSize: ROW_SIZE };
}

// ---- rendering ----

function deltaHtml(kind, deltas) {
  if (kind === "edited") return ""; // a this-run figure by nature; never a delta
  if (kind === "pending") {
    // LOCKED by the operator: queued and drained as two separate signed
    // values, in BOTH surfaces, derived from the same two fields. A net
    // hides the split, and two forms for one fact read as two facts.
    const q = deltas.pendingQueued > 0 ? `<span class="plus">+${deltas.pendingQueued}</span>` : "";
    const dr = deltas.pendingDrained > 0 ? `<span class="minus">−${deltas.pendingDrained}</span>` : "";
    return q + dr;
  }
  return deltas[kind] > 0 ? `<span class="plus">+${deltas[kind]}</span>` : "";
}

function renderTotals(totals) {
  return `<div class="flow-totals">${STAT_ORDER.map((k) => {
    const d = deltaHtml(k, totals.deltas);
    return `<div class="flow-cell-stat" data-stat="${k}">
    <div class="label"><span class="i">${STAT_ICON[k]}</span>${escapeHtml(STAT_LABEL[k])}</div>
    <div class="value">${totals.figures[k]}${d ? `<span class="d">${d}</span>` : ""}</div>
  </div>`;
  }).join("")}</div>`;
}

function renderReadout(deck) {
  return `<span class="stat-readout">${STAT_ORDER.map(
    (k) =>
      `<span class="f" title="${escapeHtml(STAT_LABEL[k])}"><span class="i">${STAT_ICON[k]}</span><b>${deck[k]}</b>${deltaHtml(k, deck.deltas)}</span>`
  ).join("")}</span>`;
}

function cellHtml(deckCode, u) {
  const cls = [
    "flow-u",
    u.cls,
    u.cls === "staged" ? (u.flushing ? "flush" : "held") : "",
    u.isNew ? "is-new" : "",
    // The corner dot stays shipped-only: "already on the device and about
    // to be rewritten" is the alarming case (D-SS4). Hover and the drawer
    // still report change status on every cell.
    u.changed && u.cls === "shipped" ? "is-changed" : "",
  ]
    .filter(Boolean)
    .join(" ");
  return `<button type="button" class="${cls}" data-key="${deckCode}#${u.idx}">${escapeHtml(u.letter)}</button>`;
}

// Rows of a fixed cell count, a divider every 5 throughout both the real
// and the projected zones, row-number labels OUTSIDE the grid — removing
// them would not move a single cell.
function renderStrip(deck) {
  const rows = [];
  let cells = [];
  let rowStart = 0;
  let count = 0;
  let placed = 0;
  const flush = () => {
    if (count === 0) return;
    rows.push(
      `<div class="flow-shape-row"><span class="flow-row-no">${rowStart + 1}–${rowStart + count}</span>${cells.join("")}</div>`
    );
    cells = [];
    count = 0;
  };
  for (const u of deck.units) {
    if (placed % ROW_SIZE === 0) {
      flush();
      rowStart = placed;
    } else if (placed % 5 === 0) {
      cells.push(`<span class="flow-batch-div"></span>`);
    }
    cells.push(cellHtml(deck.code, u));
    count += 1;
    placed += 1;
  }
  flush();
  return rows.join("");
}

function renderDeck(deck) {
  return `<section class="flow-deck${deck.onGrid ? "" : " off"}">
  <div class="deck-head">
    <span class="flow-deck-code">${escapeHtml(deck.code)}</span>
    <span class="flow-deck-title">${escapeHtml(deck.title)}</span>
    ${renderReadout(deck)}
    ${
      deck.onGrid
        ? ""
        : `<span class="flow-status-chip offgrid"><span class="sdot"></span>Off the 5-grid — ${deck.shipped} shipped is not a multiple of 5</span>`
    }
  </div>
  <div class="deck-body">
    <div class="flow-shape-box"><div class="flow-shape-rows">${
      renderStrip(deck) || `<div class="flow-pending-empty">nothing minted into this deck yet</div>`
    }</div></div>
    ${deck.showPending ? "" : `<p class="flow-pending-empty">No pending zone — single-occurrence deck.</p>`}
  </div>
</section>`;
}

// ONE legend, at the BOTTOM of the page, below the last rail — plus the one
// fact the strip itself cannot say, on the pending swatch's `?`.
function renderLegend() {
  return `<div class="legend-bar">
  <span class="grp">
    <span class="axis">fill</span>
    <span class="sw"><span class="flow-u shipped">A</span>shipped</span>
    <span class="sw"><span class="flow-u staged flush">A</span>staged, flushes</span>
    <span class="sw"><span class="flow-u staged held">A</span>staged, held</span>
    <span class="sw"><span class="flow-u open">?</span>open</span>
    <span class="sw"><span class="flow-u pending">E</span>pending</span>
    <span class="info" id="pending-info">
      <button type="button" aria-label="How the pending countdown moves" aria-expanded="false">?</button>
      <span class="pop">A pending occurrence counts down by the number of
        <b>brand-new cards minted into that deck</b> in a run — not occurrences, not publishes.
        Mint 4 cards and every tier drops by 4, so <b>several tiers can drain in the same
        publish</b>. The <span class="flow-u gap" style="cursor:default">?</span> cells after a
        tier are that distance, one cell per card still to arrive.</span>
    </span>
    <span class="sw"><span class="flow-u gap">?</span>to come</span>
  </span>
  <span class="vsep"></span>
  <span class="grp">
    <span class="axis">ring</span>
    <span class="sw"><span class="flow-u staged flush is-new">A</span><span class="flow-u staged held is-new">A</span><span class="flow-u pending is-new">E</span>new this run</span>
  </span>
  <span class="vsep"></span>
  <span class="grp">
    <span class="axis">dot</span>
    <span class="sw"><span class="flow-u shipped is-changed">A</span>content rewritten</span>
  </span>
</div>`;
}

function renderBundleChip(activeLogicBundle) {
  // D-L4: what the next publish would actually build onto. `null` means no
  // `logic_bundles` row has ever been activated — a real publish would fail
  // loudly, so that renders as an explicit warning, not an omitted chip.
  if (!activeLogicBundle) {
    return `<span class="bundle-chip err"><span class="dot"></span><b>No active logic bundle</b> — publishing will fail
      (<a href="/mjolnir/ota">activate one</a>)</span>`;
  }
  return `<span class="bundle-chip"><span class="dot"></span><b>${escapeHtml(activeLogicBundle.label || "logic bundle")}</b>
    · base ${escapeHtml(activeLogicBundle.baseVersion)} · logic ${activeLogicBundle.patchRev}
    · sha ${escapeHtml(String(activeLogicBundle.bundleSha).slice(0, 8))}
    <a href="/mjolnir/ota">change →</a></span>`;
}

export function renderShipStripsBody({
  model,
  activeLogicBundle,
  banners = "",
  runState = { kind: "none" },
  logsBase = "/builder/logs",
}) {
  const json = (v) => JSON.stringify(v).replace(/</g, "\\u003c");
  return `<div class="ship-page" id="ship-page">
<style>${SHIP_STRIPS_STYLE}</style>
<header class="ship-head">
  <div class="ship-head-main">
    <span class="brand">mjølnir · builder</span>
    <span class="sep"></span>
    <h1>Ship strips</h1>
    ${renderBundleChip(activeLogicBundle)}
    <div class="head-right"><button class="btn-primary" id="publish-btn" type="button">Publish now</button></div>
  </div>
</header>
<div class="run-slot" id="run-slot"></div>
<div class="ship-content">
  ${banners}
  ${renderTotals(model.totals)}
  <div id="decks">${model.decks.map(renderDeck).join("\n") || `<div class="panel panel-pad">no decks with activity or history yet</div>`}</div>
  ${renderLegend()}
</div>
</div>
<div class="tip" id="tip"></div>
<aside class="drawer" id="drawer" aria-label="Occurrence detail">
  <div class="drawer-head">
    <div><h3 id="dw-title">—</h3><div class="sub" id="dw-sub">—</div></div>
    <button class="btn-ghost" id="dw-close" style="margin-left:auto" aria-label="Close">✕</button>
  </div>
  <div class="drawer-body" id="dw-body"></div>
</aside>
<script type="application/json" id="strip-model">${json(model)}</script>
<script type="application/json" id="run-state">${json(runState)}</script>
<script type="application/json" id="strip-config">${json({ logsBase })}</script>
<script>${SHIP_STRIPS_CLIENT}</script>`;
}

// Only what the shared stylesheet does not already carry: the shared
// `.flow-*` rules (libs/jsservice/layout.js) came from the same card-flow
// view this page descends from, so this block is the delta — the three
// axes, the sticky rail header, the run slot, the tooltip and the drawer.
export const SHIP_STRIPS_STYLE = `
.ship-page { --new: #7aa2f7; --header-h: 56px; min-width: 0; transition: padding-right .18s ease; }
.ship-page.drawer-open { padding-right: 452px; }
.ship-head { position: sticky; top: 0; z-index: 40; background: var(--bg-sunken); border-bottom: 1px solid var(--border); margin: -24px -28px 0; }
.ship-head-main { display: flex; align-items: center; gap: 14px; padding: 10px 24px 9px; flex-wrap: wrap; }
.ship-head-main h1 { font-size: 16px; font-weight: 700; letter-spacing: -.01em; }
.ship-head-main .brand { font-size: 12px; color: var(--text-faint); font-weight: 650; letter-spacing: .06em; text-transform: uppercase; }
.ship-head-main .sep { width: 1px; align-self: stretch; background: var(--border); }
.bundle-chip { display: inline-flex; align-items: center; gap: 8px; font-size: 11.5px; font-family: var(--mono); color: var(--text-dim); background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 999px; padding: 3px 11px; }
.bundle-chip b { color: var(--text); font-weight: 650; }
.bundle-chip .dot { width: 6px; height: 6px; border-radius: 50%; background: var(--ok); }
.bundle-chip.err { border-color: var(--err); color: var(--err); }
.bundle-chip.err .dot { background: var(--err); }
.head-right { margin-left: auto; display: flex; align-items: center; gap: 12px; }
.ship-content { padding: 18px 0 0; }

.flow-totals { margin-bottom: 18px; }
.flow-cell-stat { padding: 11px 18px 12px; }
.flow-cell-stat .label .i { font-family: var(--mono); color: var(--text-faint); margin-right: 6px; }
.flow-cell-stat .label { margin-bottom: 3px; }
.flow-cell-stat .value { display: flex; align-items: baseline; gap: 8px; }
.flow-cell-stat .value .d { font-size: 11.5px; font-weight: 700; }
.flow-cell-stat .value .plus { color: var(--ok); }
.flow-cell-stat .value .minus { color: var(--text-faint); }

.ship-page .flow-deck { margin-bottom: 18px; overflow: visible; }
.deck-head { position: sticky; top: var(--header-h); z-index: 20; display: flex; align-items: center; gap: 14px; flex-wrap: wrap; padding: 13px 18px; background: var(--bg-elevated); border-bottom: 1px solid var(--border-soft); border-radius: 10px 10px 0 0; }
.ship-page .flow-deck-code { font-size: 16px; font-family: var(--mono); letter-spacing: .02em; }
.ship-page .flow-deck-title { font-size: 12.5px; margin-top: 0; }
.stat-readout { display: inline-flex; align-items: center; gap: 13px; white-space: nowrap; font-family: var(--mono); font-size: 12px; color: var(--text-dim); background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 999px; padding: 4px 14px; }
.stat-readout .f { display: inline-flex; align-items: baseline; gap: 5px; }
.stat-readout .i { color: var(--text-faint); font-size: 11px; }
.stat-readout b { color: var(--text); font-weight: 700; }
.stat-readout .plus { color: var(--ok); font-weight: 700; font-size: 11px; }
.stat-readout .minus { color: var(--text-faint); font-weight: 700; font-size: 11px; }
.flow-status-chip.offgrid { background: var(--err-soft); color: var(--err); border: 1px solid var(--err); font-weight: 700; }
.flow-deck.off { border-color: var(--err); }
.flow-deck.off .deck-head { background: #241413; }
.deck-body { padding: 14px 18px 18px; }
.ship-page .flow-shape-box { padding: 12px 10px 12px 12px; overflow-x: auto; }
.ship-page .flow-shape-rows { min-width: min-content; }
.ship-page .flow-shape-row { gap: 4px; }
.ship-page .flow-row-no { width: 46px; margin-right: 8px; }

.ship-page .flow-u { padding: 0; margin: 0; position: relative; cursor: pointer; appearance: none; border: 1px solid transparent; }
.ship-page .flow-u.staged { background: var(--warn-soft); border: 1.5px solid var(--warn); color: var(--text); }
.ship-page .flow-u.staged.flush { background: var(--warn); border-color: var(--warn); color: #1a1205; }
.ship-page .flow-u.staged.held { background: transparent; border-style: dashed; color: var(--warn); }
.ship-page .flow-u:hover { border-color: var(--text); opacity: 1; z-index: 2; }
.ship-page .flow-u.is-new { box-shadow: 0 0 0 1.5px var(--new); opacity: 1; }
.ship-page .flow-u.is-changed::after { content: ""; position: absolute; top: -3px; right: -3px; width: 6px; height: 6px; border-radius: 50%; background: var(--accent-text); border: 1px solid var(--bg-sunken); }
.ship-page .flow-u.kin { outline: 2px dashed var(--text); outline-offset: 2px; opacity: 1; z-index: 3; }
.ship-page .flow-u.sel { outline: 2px solid var(--accent-text); outline-offset: 2px; opacity: 1; z-index: 4; }
.ship-page .flow-u:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; z-index: 5; }
.ship-page .flow-batch-div { margin: 0 5px; }

.legend-bar { display: flex; align-items: center; gap: 16px; flex-wrap: wrap; padding: 10px 16px 11px; margin-top: 4px; border: 1px solid var(--border); border-radius: 10px; font-size: 11px; color: var(--text-dim); background: var(--bg-elevated); }
.legend-bar .grp { display: inline-flex; align-items: center; gap: 9px; }
.legend-bar .sw { display: inline-flex; align-items: center; gap: 5px; }
.legend-bar .axis { font-size: 10px; text-transform: uppercase; letter-spacing: .06em; color: var(--text-faint); font-weight: 650; }
.legend-bar .vsep { width: 1px; height: 18px; background: var(--border); }
.legend-bar .flow-u { cursor: default; }
.legend-bar .info { position: relative; display: inline-flex; }
.legend-bar .info > button { border: 1px solid var(--border); background: var(--bg-elevated); color: var(--text-dim); width: 15px; height: 15px; min-width: 15px; padding: 0; border-radius: 50%; font-size: 10px; font-weight: 700; display: inline-flex; align-items: center; justify-content: center; line-height: 1; cursor: pointer; }
.legend-bar .info.open > button { border-color: var(--accent); color: var(--accent-text); }
.legend-bar .info .pop { display: none; position: absolute; bottom: 24px; left: -10px; z-index: 50; width: 340px; white-space: normal; background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 8px; padding: 10px 13px 11px; font-size: 11.5px; line-height: 1.65; color: var(--text-dim); box-shadow: 0 10px 30px #000a; }
.legend-bar .info.open .pop { display: block; }
.legend-bar .info .pop b { color: var(--text); }

.tip { position: fixed; z-index: 90; pointer-events: none; display: none; background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 6px; padding: 5px 10px 6px; font-size: 11.5px; font-family: var(--mono); color: var(--text); box-shadow: 0 8px 26px #000a; max-width: 460px; }
.tip .kin { display: block; color: var(--text-dim); font-size: 11px; margin-top: 3px; }

.drawer { position: fixed; top: 0; right: 0; bottom: 0; width: 452px; max-width: 100vw; background: var(--bg-elevated); border-left: 1px solid var(--border); overflow-y: auto; z-index: 70; transform: translateX(100%); transition: transform .18s ease; }
.drawer.open { transform: none; }
.drawer-head { position: sticky; top: 0; background: var(--bg-elevated); z-index: 2; display: flex; align-items: flex-start; gap: 10px; padding: 14px 18px 12px; border-bottom: 1px solid var(--border-soft); }
.drawer-head h3 { font-size: 14px; font-family: var(--mono); }
.drawer-head .sub { font-size: 11.5px; color: var(--text-dim); margin-top: 2px; }
.drawer-body { padding: 14px 18px 40px; }
.facts { display: grid; grid-template-columns: 94px 1fr; gap: 6px 12px; font-size: 12.5px; margin-bottom: 14px; }
.facts dt { color: var(--text-faint); font-size: 11px; text-transform: uppercase; letter-spacing: .05em; font-weight: 650; padding-top: 2px; }
.facts dd { margin: 0; font-family: var(--mono); font-size: 12px; color: var(--text); word-break: break-word; }
.facts dd.sans { font-family: var(--sans); font-size: 12.5px; }
.state-ship { color: var(--ok); font-weight: 700; }
.state-hold { color: var(--warn); font-weight: 700; }
.state-pend { color: var(--text-dim); }
.kin-row { display: flex; align-items: center; gap: 8px; width: 100%; text-align: left; background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; padding: 9px 12px; font-size: 12px; color: var(--text-dim); margin-bottom: 14px; font-family: var(--mono); cursor: pointer; }
.kin-row:hover { border-color: var(--accent); color: var(--text); }
.kin-row .lbl { color: var(--text-faint); font-size: 10.5px; text-transform: uppercase; letter-spacing: .05em; font-weight: 650; }
.kin-row .arrow { margin-left: auto; color: var(--accent-text); }
.kin-row.dead { cursor: default; opacity: .75; }
.changed-note { background: var(--accent-soft); border: 1px solid var(--accent); border-radius: 8px; padding: 10px 12px; font-size: 12px; line-height: 1.55; color: var(--text); margin-bottom: 14px; }
.changed-note b { color: var(--accent-text); }
.drawer .cp-root { padding: 0; }
/* The drawer wants the CARD, not the Cards page's scratch editor and
   class/symbol catalogues that ride along in the same component. */
.drawer .cp-editor, .drawer [data-cp-edit-toggle], .drawer .cp-cat-tabs,
.drawer [data-cat-panel], .drawer .cp-gutter { display: none !important; }

.run-slot { position: relative; z-index: 35; margin: 0 -28px; }
.progress-strip { background: var(--bg-sunken); border-bottom: 1px solid var(--border); padding: 10px 24px 11px; }
.progress-head { display: flex; align-items: center; gap: 10px; font-size: 12px; color: var(--text-dim); margin-bottom: 7px; }
.progress-head b { color: var(--text); font-family: var(--mono); }
.progress-head .el { margin-left: auto; font-family: var(--mono); font-size: 11.5px; color: var(--text-faint); }
.spin { width: 12px; height: 12px; flex: none; border-radius: 50%; border: 2px solid var(--border); border-top-color: var(--accent); animation: ship-spin .8s linear infinite; }
@keyframes ship-spin { to { transform: rotate(360deg); } }
.tail { max-height: 128px; overflow-y: auto; font-family: var(--mono); font-size: 11.5px; line-height: 1.8; color: var(--text-dim); }
.tail .ln { white-space: pre-wrap; }
.tail .more { color: var(--text-faint); letter-spacing: .25em; animation: ship-blink 1.4s ease-in-out infinite; }
@keyframes ship-blink { 0%, 100% { opacity: .35; } 50% { opacity: 1; } }
.run-banner { display: flex; align-items: center; gap: 12px; flex-wrap: wrap; padding: 10px 24px 11px; font-size: 12.5px; color: var(--text-dim); background: var(--bg-sunken); border-bottom: 1px solid var(--border); border-left: 3px solid var(--border); }
.run-banner b { color: var(--text); }
.run-banner .tag { font-size: 10px; text-transform: uppercase; letter-spacing: .07em; font-weight: 700; padding: 2px 9px 3px; border-radius: 999px; font-family: var(--mono); white-space: nowrap; }
.run-banner .sp { margin-left: auto; display: flex; align-items: center; gap: 10px; }
.run-banner.ok { border-left-color: var(--ok); }
.run-banner.ok .tag { background: var(--ok-soft); color: var(--ok); }
.run-banner.err { border-left-color: var(--err); background: #241413; }
.run-banner.err .tag { background: var(--err-soft); color: var(--err); }
.run-banner.err .msg { color: var(--text); font-family: var(--mono); }
.run-banner.warn { border-left-color: var(--warn); background: #211d10; }
.run-banner.warn .tag { background: var(--warn-soft); color: var(--warn); }
.run-banner.neutral .tag { background: var(--border-soft); color: var(--text-dim); }
.btn-primary[disabled] { cursor: default; filter: none; opacity: .8; }
.btn-primary .spin { border-color: #1a0d0533; border-top-color: #1a0d05; }

@media (prefers-reduced-motion: reduce) {
  .ship-page *, .drawer, .tip { transition: none !important; animation: none !important; }
  .spin { display: none; }
  .tail .more { opacity: 1; }
}
`;

// The client script. Deliberately written without template literals so the
// whole thing can live inside one, and without any framework: every fact it
// shows comes out of the embedded model the server already computed.
export const SHIP_STRIPS_CLIENT = `
(function () {
  var MODEL = JSON.parse(document.getElementById('strip-model').textContent);
  var CONFIG = JSON.parse(document.getElementById('strip-config').textContent);
  var page = document.getElementById('ship-page');
  var tip = document.getElementById('tip');
  var drawer = document.getElementById('drawer');

  var CELLS = new Map();
  var BY_CARD = new Map();
  var DECK = new Map();
  MODEL.decks.forEach(function (d) {
    DECK.set(d.code, d);
    d.units.forEach(function (u) {
      var key = d.code + '#' + u.idx;
      u.deck = d.code;
      CELLS.set(key, { u: u, el: null });
      if (u.cardId) {
        if (!BY_CARD.has(u.cardId)) BY_CARD.set(u.cardId, []);
        BY_CARD.get(u.cardId).push(key);
      }
    });
  });
  document.querySelectorAll('.flow-u[data-key]').forEach(function (el) {
    var rec = CELLS.get(el.dataset.key);
    if (rec) rec.el = el;
  });

  function esc(s) {
    return String(s == null ? '' : s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  }
  function faceList(f) {
    if (f.length === 1) return f[0];
    return f.slice(0, -1).join(', ') + ' and ' + f[f.length - 1];
  }
  // What this publish does to this card's CONTENT — the tooltip's whole job.
  function changeText(u) {
    if (u.changed && u.faces && u.faces.length) {
      return faceList(u.faces) + (u.faces.length === 1 ? ' changes' : ' change') + ' this publish';
    }
    if (u.isNew && u.newKind === 'minted') return 'new card — every face written this publish';
    if (!u.cardId) return 'no card in this slot';
    return 'unchanged';
  }
  function stateText(u) {
    var d = DECK.get(u.deck);
    if (u.cls === 'shipped') {
      return 'shipped in ' + (u.buildId || 'an unrecorded build') + (u.shippedAt ? ', ' + u.shippedAt.slice(0, 10) : '');
    }
    if (u.cls === 'staged') return u.flushing ? 'would flush this run' : (d.heldText || 'staged, held');
    if (u.cls === 'open') return 'open slot — not yet minted, counts toward ' + d.openTarget;
    if (u.cls === 'pending') return 'pending — drains after ' + u.remaining + ' more new cards into ' + u.deck;
    return 'filler — ' + u.remaining + ' more new cards must land in ' + u.deck + ' before this tier drains';
  }
  function kinKey(u) {
    if (!u.cardId) return null;
    var keys = BY_CARD.get(u.cardId) || [];
    var self = u.deck + '#' + u.idx;
    for (var i = 0; i < keys.length; i++) if (keys[i] !== self) return keys[i];
    return null;
  }
  function kinText(u) {
    if (!u.cardId) return null;
    var k = kinKey(u);
    var d = DECK.get(u.deck);
    if (!k) {
      if (d.occPerCard === 1) return 'no partner — ' + u.deck + ' cards have one occurrence only';
      return 'partner not placed in this strip';
    }
    var p = CELLS.get(k).u;
    var where = p.cls === 'shipped' ? ('shipped in ' + (p.buildId || '?'))
      : p.cls === 'staged' ? (p.flushing ? 'staged, flushes this run' : 'staged, held')
      : p.cls === 'pending' ? ('still pending — ' + p.remaining + ' more cards away') : p.cls;
    return 'partner: ' + p.letter + ', #' + p.idx + ', ' + where + ' — ' + Math.abs(p.idx - u.idx) + ' cells apart';
  }

  /* hover / focus: instant text, plus the kin highlight */
  var litKin = null;
  function clearKin() { if (litKin) { litKin.classList.remove('kin'); litKin = null; } }
  function showFor(el) {
    var rec = CELLS.get(el.dataset.key);
    if (!rec) return;
    var u = rec.u;
    tip.innerHTML = '#' + u.idx + ' · ' + esc(u.cardId || '—') + ' · ' + esc(u.letter) +
      '<span class="kin">' + esc(changeText(u)) + '</span>';
    tip.style.display = 'block';
    clearKin();
    var k = kinKey(u);
    if (k) {
      var kr = CELLS.get(k);
      if (kr && kr.el) { kr.el.classList.add('kin'); litKin = kr.el; }
    }
  }
  function placeTip(x, y) {
    var r = tip.getBoundingClientRect();
    var left = x + 14, top = y + 16;
    if (left + r.width > window.innerWidth - 8) left = window.innerWidth - r.width - 8;
    if (top + r.height > window.innerHeight - 8) top = y - r.height - 12;
    tip.style.left = left + 'px';
    tip.style.top = top + 'px';
  }
  document.addEventListener('mouseover', function (e) {
    var el = e.target.closest ? e.target.closest('.flow-u[data-key]') : null;
    if (!el) return;
    showFor(el);
    placeTip(e.clientX, e.clientY);
  });
  document.addEventListener('mousemove', function (e) {
    if (tip.style.display === 'block') placeTip(e.clientX, e.clientY);
  });
  document.addEventListener('mouseout', function (e) {
    var el = e.target.closest ? e.target.closest('.flow-u[data-key]') : null;
    if (!el) return;
    tip.style.display = 'none';
    clearKin();
  });
  document.addEventListener('focusin', function (e) {
    var el = e.target.closest ? e.target.closest('.flow-u[data-key]') : null;
    if (!el) return;
    showFor(el);
    var r = el.getBoundingClientRect();
    placeTip(r.left, r.bottom);
  });
  document.addEventListener('focusout', function (e) {
    if (e.target.closest && e.target.closest('.flow-u[data-key]')) { tip.style.display = 'none'; clearKin(); }
  });

  /* click: the pushing drawer — the strip stays visible */
  var selected = null;
  var dwTitle = document.getElementById('dw-title');
  var dwSub = document.getElementById('dw-sub');
  var dwBody = document.getElementById('dw-body');
  var previewSeq = 0;

  function openDrawer(key) {
    var rec = CELLS.get(key);
    if (!rec) return;
    var u = rec.u;
    var d = DECK.get(u.deck);
    if (selected) selected.classList.remove('sel');
    selected = rec.el;
    if (selected) selected.classList.add('sel');

    dwTitle.textContent = '#' + u.idx + ' · ' + (u.cardId || 'no card') + ' · ' + u.letter;
    dwSub.textContent = u.deck + ' ' + d.title + ' · ' + u.cls;

    var stateCls = u.cls === 'shipped' ? '' : (u.cls === 'staged' && u.flushing) ? 'state-ship'
      : u.cls === 'staged' ? 'state-hold' : 'state-pend';

    var rows = '';
    rows += '<dt>Index</dt><dd>#' + u.idx + '</dd>';
    rows += '<dt>Card</dt><dd>' + esc(u.cardId || '—') + '</dd>';
    rows += '<dt>Deck</dt><dd>' + esc(u.deck + ' · ' + d.title) + '</dd>';
    rows += '<dt>Letter</dt><dd>' + esc(u.letter) + '</dd>';
    rows += '<dt>Note</dt><dd class="sans">' + esc(u.note || '—') + '</dd>';
    rows += '<dt>State</dt><dd class="' + stateCls + '">' + esc(stateText(u)) + '</dd>';
    rows += '<dt>Changes</dt><dd class="sans"' + (u.changed ? ' style="color:var(--accent-text)"' : '') + '>' + esc(changeText(u)) + '</dd>';
    if (u.cls === 'shipped') {
      rows += '<dt>Build</dt><dd>' + esc(u.buildId || 'not recorded') + (u.shippedAt ? ' · ' + esc(u.shippedAt.replace('T', ' ').slice(0, 16)) : '') + '</dd>';
    }
    if (u.cls === 'pending' || u.cls === 'gap') {
      rows += '<dt>Countdown</dt><dd>' + u.remaining + ' more new cards into ' + esc(u.deck) + ' (tier of ' + u.tierSize + ')</dd>';
    }
    if (u.isNew) {
      var what = u.newKind === 'minted' ? 'card minted this run'
        : u.newKind === 'drained' ? 'countdown hit zero, drained into staged'
        : 'queued this run';
      rows += '<dt>This run</dt><dd style="color:var(--new)">new — ' + what + '</dd>';
    }
    var facts = '<dl class="facts">' + rows + '</dl>';

    var k = kinKey(u);
    var kinRow = u.cardId
      ? '<button class="kin-row' + (k ? '' : ' dead') + '" ' + (k ? 'data-go="' + k + '"' : 'disabled') + ' type="button">' +
        '<span class="lbl">kin</span><span>' + esc(kinText(u)) + '</span>' + (k ? '<span class="arrow">→</span>' : '') + '</button>'
      : '<div class="kin-row dead"><span class="lbl">kin</span><span>no card in this slot — nothing to pair with</span></div>';

    var changed = u.changed && u.faces && u.faces.length
      ? '<div class="changed-note"><b>' + esc(faceList(u.faces)) + ' rewritten.</b> The preview below shows the ' +
        '<b>NEW content this publish will write</b>, not what is currently on the device.</div>'
      : '';

    dwBody.innerHTML = facts + kinRow + changed +
      (u.cardId ? '<div id="dw-preview" class="inline-note">loading card preview…</div>'
                : '<div class="inline-note">Filler slot — there is no card to preview. This cell measures distance, not content.</div>');
    drawer.classList.add('open');
    page.classList.add('drawer-open');

    if (u.cardId) loadPreview(u.cardId, ++previewSeq);
  }

  // 3.11: the card is rendered by the shared card-preview capability, from
  // the style map the extractor pulls out of the stock bundle. A failed
  // extraction is reported, never papered over with invented values.
  function loadPreview(cardId, seq) {
    fetch('/builder/api/card-preview?card=' + encodeURIComponent(cardId))
      .then(function (r) { return r.json().then(function (b) { return { ok: r.ok, body: b }; }); })
      .then(function (res) {
        if (seq !== previewSeq) return;
        var host = document.getElementById('dw-preview');
        if (!host) return;
        if (!res.ok || res.body.error) {
          host.innerHTML = '<div class="changed-note" style="border-color:var(--err);background:var(--err-soft)">' +
            '<b>Card preview unavailable.</b> ' + esc((res.body && (res.body.detail || res.body.error)) || 'unknown error') + '</div>';
          return;
        }
        host.classList.remove('inline-note');
        host.innerHTML = '<div class="preview-head" style="margin:4px 0 10px"><h4 style="font-size:11.5px;text-transform:uppercase;letter-spacing:.04em;color:var(--text-dim)">Card preview</h4></div>' + res.body.html;
        if (window.cpApplyRoot) {
          var root = host.querySelector('.cp-root');
          if (root) window.cpApplyRoot(root);
        }
      })
      .catch(function (err) {
        if (seq !== previewSeq) return;
        var host = document.getElementById('dw-preview');
        if (host) host.textContent = 'card preview failed: ' + err.message;
      });
  }

  function closeDrawer() {
    drawer.classList.remove('open');
    page.classList.remove('drawer-open');
    if (selected) { selected.classList.remove('sel'); selected = null; }
  }

  var info = document.getElementById('pending-info');
  document.addEventListener('click', function (e) {
    var cell = e.target.closest ? e.target.closest('.flow-u[data-key]') : null;
    if (cell) { openDrawer(cell.dataset.key); return; }
    var go = e.target.closest ? e.target.closest('[data-go]') : null;
    if (go) {
      var rec = CELLS.get(go.dataset.go);
      openDrawer(go.dataset.go);
      if (rec && rec.el) rec.el.scrollIntoView({ block: 'center', behavior: 'smooth' });
      return;
    }
    if (e.target.closest && e.target.closest('#dw-close')) { closeDrawer(); return; }
    var ib = e.target.closest ? e.target.closest('#pending-info > button') : null;
    if (ib) {
      var open = info.classList.toggle('open');
      ib.setAttribute('aria-expanded', String(open));
      return;
    }
    if (info && !(e.target.closest && e.target.closest('#pending-info'))) {
      info.classList.remove('open');
      info.querySelector('button').setAttribute('aria-expanded', 'false');
    }
  });
  if (info) {
    info.addEventListener('mouseenter', function () { info.classList.add('open'); });
    info.addEventListener('mouseleave', function () {
      if (info.querySelector('button').getAttribute('aria-expanded') !== 'true') info.classList.remove('open');
    });
  }
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      closeDrawer();
      if (info) {
        info.classList.remove('open');
        info.querySelector('button').setAttribute('aria-expanded', 'false');
      }
    }
  });

  /* ── the run slot (D-SS6) ─────────────────────────────────────────────
     Derived, never remembered: the banner is rendered from the most recent
     build_jobs row, so it survives a reload and reports a scheduled run
     nobody watched. A 'running' row that stopped narrating is STALLED, not
     a spinner — an eternal spinner is a success-shaped display of a dead
     run. */
  var slot = document.getElementById('run-slot');
  var publishBtn = document.getElementById('publish-btn');
  var pollTimer = null;
  var POLL_MS = 2000;

  function fmt(ts) { return ts ? String(ts).replace('T', ' ').slice(0, 16) : '—'; }
  function secs(ms) { return ms == null ? '—' : Math.round(ms / 1000) + ' s'; }
  function mins(ms) { return ms == null ? '—' : Math.max(1, Math.round(ms / 60000)) + ' min'; }
  function logLink(state) {
    return '<a href="' + CONFIG.logsBase + (state.logHref || '') + '">full log →</a>';
  }
  function shippedText(state) {
    if (!state.shipped) return '';
    var by = state.shipped.byDeck.map(function (x) { return x.deckCode + ' ' + x.count; }).join(' · ');
    return ' · shipped <b>' + state.shipped.total + '</b> occurrences' + (by ? ' — ' + by : '');
  }

  function renderRun(state) {
    if (!state || state.kind === 'none') { slot.innerHTML = ''; return; }
    if (state.kind === 'running') {
      var lines = (state.lines || []).map(function (l) {
        return '<div class="ln">' + esc(l.line) + '</div>';
      }).join('');
      slot.innerHTML = '<div class="progress-strip">' +
        '<div class="progress-head"><span class="spin" aria-hidden="true"></span>' +
        '<span>Publishing — <b>job #' + state.job.id + '</b> running</span>' +
        '<span class="el">started ' + fmt(state.job.startedAt) + '</span></div>' +
        '<div class="tail" id="tail">' + lines + '<div class="ln more">• • •</div></div></div>';
      var tail = document.getElementById('tail');
      if (tail) tail.scrollTop = tail.scrollHeight;
      return;
    }
    if (state.kind === 'stalled') {
      slot.innerHTML = '<div class="run-banner warn"><span class="tag">last run — stalled</span>' +
        '<span><b class="mono">job #' + state.job.id + '</b> is still recorded as <b>running</b>, but has written no new ' +
        'output for <b class="mono">' + mins(state.silentMs) + '</b> (last line ' + esc(fmt(state.lastLineAt)) + '). ' +
        'No process appears to be writing to it.</span>' +
        '<span class="sp">' + logLink(state) + '</span></div>';
      return;
    }
    if (state.kind === 'failed') {
      slot.innerHTML = '<div class="run-banner err"><span class="tag">last run — failed</span>' +
        '<span><b class="mono">' + esc(state.job.buildId || 'job #' + state.job.id) + '</b> failed ' +
        '<span class="mono">' + esc(fmt(state.job.finishedAt)) + '</span> after <span class="mono">' + secs(state.job.durationMs) + '</span>' +
        '<span class="msg"> — ' + esc(state.job.error || 'no error recorded') + '</span></span>' +
        '<span class="sp">' + logLink(state) + '</span></div>';
      return;
    }
    if (state.kind === 'noop') {
      slot.innerHTML = '<div class="run-banner neutral"><span class="tag">nothing to publish</span>' +
        '<span>Nothing was newly eligible, so nothing needed publishing — no run was recorded.</span></div>';
      return;
    }
    slot.innerHTML = '<div class="run-banner ok"><span class="tag">last run</span>' +
      '<span><b class="mono">' + esc(state.job.buildId || 'job #' + state.job.id) + '</b> succeeded ' +
      '<span class="mono">' + esc(fmt(state.job.finishedAt)) + '</span>' + shippedText(state) +
      ' · took <span class="mono">' + secs(state.job.durationMs) + '</span></span>' +
      '<span class="sp">' + logLink(state) + '</span></div>';
  }

  function setBusy(busy) {
    publishBtn.disabled = busy;
    publishBtn.innerHTML = busy ? '<span class="spin" aria-hidden="true"></span>Publishing…' : 'Publish now';
  }

  function stopPolling() { if (pollTimer) { clearTimeout(pollTimer); pollTimer = null; } }

  function poll(opts) {
    stopPolling();
    return fetch('/builder/api/run-status')
      .then(function (r) { return r.json(); })
      .then(function (state) {
        renderRun(state);
        var live = state.kind === 'running';
        if (!(opts && opts.keepBusy)) setBusy(live);
        if (live) pollTimer = setTimeout(function () { poll(opts); }, POLL_MS);
        return state;
      })
      .catch(function () { /* a failed poll is not a page failure; the next click re-reads */ });
  }

  var initial = JSON.parse(document.getElementById('run-state').textContent);
  renderRun(initial);
  // 4.7: a run already executing on plain load puts the page in progress
  // with no POST of its own.
  if (initial && initial.kind === 'running') { setBusy(true); poll(); }

  publishBtn.addEventListener('click', function () {
    setBusy(true);
    slot.innerHTML = '<div class="progress-strip"><div class="progress-head">' +
      '<span class="spin" aria-hidden="true"></span><span>Publishing — starting…</span></div>' +
      '<div class="tail"><div class="ln more">• • •</div></div></div>';
    // The POST stays synchronous and is the authoritative outcome; the poll
    // beside it only tails the running job's narration (D-SS6).
    pollTimer = setTimeout(function () { poll({ keepBusy: true }); }, POLL_MS);
    fetch('/builder/api/publish', { method: 'POST' })
      .then(function (r) { return r.json().then(function (b) { return { ok: r.ok, body: b }; }); })
      .then(function (res) {
        stopPolling();
        setBusy(false);
        // runPublish writes NO build_jobs row for a no-op run, so the no-op
        // is reported from this response — waiting for a row would spin
        // forever on the most common manual click (4.3).
        if (res.ok && res.body && res.body.published === false) { renderRun({ kind: 'noop' }); return; }
        poll().then(function () { setTimeout(function () { location.reload(); }, 900); });
      })
      .catch(function (err) {
        stopPolling();
        setBusy(false);
        poll();
        slot.insertAdjacentHTML('beforeend', '<div class="run-banner err"><span class="tag">publish request failed</span><span>' + esc(err.message) + '</span></div>');
      });
  });
})();
`;
