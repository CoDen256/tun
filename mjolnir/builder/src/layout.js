// Shared page chrome for builder's operator UI — same design system as
// hub/src/layout.js (lifted from the mockup linked in
// tun/docs/13-operator-console-ux.md), duplicated rather than shared across
// packages since hub and builder are separate processes (D80).
const STYLE = `
:root {
  --bg: #14171c; --bg-elevated: #1b1f26; --bg-sunken: #0f1216;
  --border: #2a3039; --border-soft: #232832;
  --text: #e8e6e1; --text-dim: #8b94a3; --text-faint: #566073;
  --accent: #c6703f; --accent-soft: #c6703f26; --accent-text: #f2b688;
  --ok: #5bab7e; --ok-soft: #5bab7e1f;
  --warn: #d4a73d; --warn-soft: #d4a73d1f;
  --err: #d1453f; --err-soft: #d1453f1f;
  --radius: 6px;
  --sans: ui-sans-serif, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  --mono: ui-monospace, "SF Mono", "Cascadia Code", "Roboto Mono", Consolas, monospace;
}
@media (prefers-color-scheme: light) {
  :root {
    --bg: #f5f3ef; --bg-elevated: #ffffff; --bg-sunken: #ebe7e0;
    --border: #e2ddd3; --border-soft: #ece8e0;
    --text: #221f1a; --text-dim: #6b6660; --text-faint: #9a948a;
    --accent: #b35a2d; --accent-soft: #b35a2d14; --accent-text: #8a431c;
    --ok: #2f8a5c; --ok-soft: #2f8a5c14;
    --warn: #a87c1f; --warn-soft: #a87c1f14;
    --err: #b23a34; --err-soft: #b23a3414;
  }
}
* { box-sizing: border-box; }
html, body { margin: 0; padding: 0; }
body { background: var(--bg); color: var(--text); font-family: var(--sans); font-size: 14px; line-height: 1.5; -webkit-font-smoothing: antialiased; }
h1, h2, h3 { text-wrap: balance; font-weight: 650; margin: 0; }
code, .mono { font-family: var(--mono); font-variant-numeric: tabular-nums; }
a { color: var(--accent-text); }
:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }

.top-bar { display: flex; align-items: center; gap: 14px; padding: 10px 20px; background: var(--bg-sunken); border-bottom: 1px solid var(--border); font-size: 13px; }
.top-bar strong { font-weight: 700; }
.top-bar nav { margin-left: auto; display: flex; gap: 14px; }
.top-bar nav a { color: var(--text-dim); text-decoration: none; }
.top-bar nav a:hover { color: var(--text); }

.shell { display: flex; min-height: calc(100vh - 41px); }
.rail { width: 192px; flex: none; border-right: 1px solid var(--border); padding: 16px 10px; display: flex; flex-direction: column; gap: 2px; }
.rail-group-label { font-size: 10.5px; text-transform: uppercase; letter-spacing: .07em; color: var(--text-faint); padding: 12px 10px 6px; }
.rail-group-label:first-child { padding-top: 2px; }
.rail a { padding: 7px 10px; border-radius: var(--radius); font-size: 13px; color: var(--text-dim); text-decoration: none; display: block; }
.rail a:hover { background: var(--bg-elevated); color: var(--text); }
.rail a.active { background: var(--accent-soft); color: var(--accent-text); font-weight: 600; }

.content { flex: 1; min-width: 0; padding: 24px 28px 48px; }
.page-head { display: flex; align-items: flex-start; justify-content: space-between; gap: 16px; margin-bottom: 20px; }
.page-head h2 { font-size: 18px; }
.page-sub { color: var(--text-dim); font-size: 13px; margin-top: 3px; }

button, .btn { font: inherit; font-weight: 600; font-size: 13px; padding: 7px 14px; border-radius: var(--radius); border: 1px solid var(--border); background: var(--bg-elevated); color: var(--text); cursor: pointer; display: inline-flex; align-items: center; gap: 6px; }
button:hover { border-color: var(--text-faint); }
.btn-primary { background: var(--accent); border-color: var(--accent); color: #1a0d05; }
.btn-primary:hover { filter: brightness(1.08); border-color: var(--accent); }
.btn-ghost { background: transparent; border-color: transparent; color: var(--text-dim); padding: 7px 9px; }
.btn-ghost:hover { background: var(--bg-elevated); color: var(--text); border-color: transparent; }

.panel { background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 10px; }
.panel + .panel { margin-top: 16px; }
.panel-pad { padding: 18px 20px; }
.panel-head { display: flex; align-items: center; justify-content: space-between; padding: 14px 18px; border-bottom: 1px solid var(--border-soft); }
.panel-head h3 { font-size: 13.5px; }

.table-wrap { overflow-x: auto; }
table { width: 100%; border-collapse: collapse; }
th, td { text-align: left; padding: 9px 14px; white-space: nowrap; }
thead th { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); font-weight: 600; border-bottom: 1px solid var(--border); }
tbody tr { border-bottom: 1px solid var(--border-soft); }
tbody tr:last-child { border-bottom: none; }
td.wrap { white-space: normal; }
td.num { text-align: right; font-family: var(--mono); font-variant-numeric: tabular-nums; }

.pill { display: inline-flex; align-items: center; gap: 5px; font-size: 11.5px; font-weight: 600; padding: 2px 9px 3px; border-radius: 99px; }
.pill::before { content: ""; width: 6px; height: 6px; border-radius: 50%; background: currentColor; }
.pill-ok { background: var(--ok-soft); color: var(--ok); }
.pill-warn { background: var(--warn-soft); color: var(--warn); }
.pill-err { background: var(--err-soft); color: var(--err); }
.pill-neutral { background: var(--border-soft); color: var(--text-dim); }

.inline-note { font-size: 12.5px; color: var(--text-faint); margin-top: 6px; }

.stat-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(140px, 1fr)); gap: 12px; margin-bottom: 16px; }
.stat { background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 10px; padding: 14px 16px; }
.stat .label { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); font-weight: 600; }
.stat .value { font-size: 24px; font-weight: 700; margin-top: 4px; font-family: var(--mono); }
.stat .sub { font-size: 12px; color: var(--text-dim); margin-top: 2px; }

.schedule-options { display: flex; flex-direction: column; gap: 10px; max-width: 420px; }
.radio-row { display: flex; align-items: center; gap: 10px; padding: 10px 12px; border: 1px solid var(--border); border-radius: var(--radius); }
.radio-row input[type="radio"] { accent-color: var(--accent); }
.radio-row.active { border-color: var(--accent); background: var(--accent-soft); }
.radio-row input[type="text"] { width: 70px; margin: 0 4px; }

.timeline { display: flex; flex-direction: column; }
.tl-row { display: grid; grid-template-columns: 90px 20px 1fr; gap: 10px; padding: 8px 0; }
.tl-time { font-family: var(--mono); font-size: 12px; color: var(--text-faint); padding-top: 2px; }
.tl-rail { display: flex; justify-content: center; }
.tl-dot { width: 8px; height: 8px; border-radius: 50%; background: var(--text-faint); margin-top: 5px; }
.tl-dot.ok { background: var(--ok); }
.tl-dot.err { background: var(--err); }
.tl-title { font-weight: 600; font-size: 13px; display: flex; align-items: center; gap: 8px; }
.tl-detail { font-size: 12.5px; color: var(--text-dim); margin-top: 2px; }
.log-line { font-family: var(--mono); font-size: 12px; padding: 3px 0; color: var(--text-dim); }
.log-line .lvl-ok { color: var(--ok); }

details.json-toggle summary { cursor: pointer; font-size: 13px; padding: 4px 0; }

/* ---------- Card-flow view (builder-card-flow-ui) ---------- */
.flow-totals {
  display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1px;
  background: var(--border); border: 1px solid var(--border); border-radius: 10px;
  overflow: hidden; margin-bottom: 16px;
}
.flow-cell-stat { background: var(--bg-elevated); padding: 14px 18px; }
.flow-cell-stat .label { font-size: 11px; color: var(--text-faint); text-transform: uppercase; letter-spacing: .05em; font-weight: 600; margin-bottom: 6px; }
.flow-cell-stat .value { font-size: 22px; font-weight: 700; font-family: var(--mono); font-variant-numeric: tabular-nums; }
.flow-cell-stat .sub { font-size: 11.5px; color: var(--text-faint); margin-top: 3px; }
.flow-cell-stat .delta { font-size: 11.5px; font-weight: 650; color: var(--text-dim); margin-top: 3px; }
.flow-cell-stat .delta .plus { color: var(--ok); font-weight: 700; }
.flow-cell-stat .delta.neutral { color: var(--text-faint); font-weight: 500; }

.flow-rail { background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 10px; padding: 18px 20px 16px; margin-bottom: 16px; }
.flow-rail-head { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 16px; }
.flow-rail-head h3 { margin: 0; font-size: 13.5px; }
.flow-rail-head .note { color: var(--text-faint); font-size: 12px; font-family: var(--mono); }
.flow-stages { display: grid; grid-template-columns: repeat(5, 1fr); gap: 0; position: relative; }
.flow-stages::before { content: ""; position: absolute; left: 7%; right: 7%; top: 19px; height: 2px; background: var(--border); z-index: 0; }
.flow-stage { position: relative; z-index: 1; text-align: center; padding: 0 8px; }
.flow-stage .node {
  width: 38px; height: 38px; border-radius: 50%; margin: 0 auto 10px;
  display: flex; align-items: center; justify-content: center;
  background: var(--bg-sunken); border: 1.5px solid var(--border); font-weight: 700; font-size: 13px;
}
.flow-stage.active .node { background: var(--accent-soft); border-color: var(--accent); color: var(--accent-text); }
.flow-stage .name { font-size: 12.5px; font-weight: 600; margin-bottom: 4px; }
.flow-stage .total { font-size: 18px; font-weight: 700; display: block; font-family: var(--mono); font-variant-numeric: tabular-nums; }
.flow-stage .total .unit { font-size: 10.5px; font-weight: 500; color: var(--text-faint); margin-left: 2px; font-family: var(--sans); }
.flow-stage .delta { font-size: 11px; color: var(--ok); font-weight: 650; margin-top: 1px; }
.flow-stage .delta.neutral { color: var(--text-faint); font-weight: 500; }
.flow-stage .hint { font-size: 10.5px; color: var(--text-faint); margin-top: 3px; line-height: 1.4; min-height: 26px; }

.section-head { display: flex; align-items: baseline; justify-content: space-between; margin: 24px 0 12px; }
.section-head h3 { margin: 0; font-size: 14px; }

.flow-deck { background: var(--bg-elevated); border: 1px solid var(--border); border-radius: 10px; margin-bottom: 12px; overflow: hidden; }
.flow-deck.stalled { border-color: var(--err); }
.flow-deck-row {
  display: grid; grid-template-columns: 1.3fr 1.6fr auto auto; gap: 16px; align-items: center;
  padding: 14px 18px; cursor: pointer; list-style: none;
}
.flow-deck-row::-webkit-details-marker { display: none; }
.flow-deck-row:hover { background: var(--bg-sunken); }
.flow-deck-id { display: flex; align-items: center; gap: 10px; }
.flow-deck-code { font-weight: 700; font-size: 15px; }
.flow-deck-title { color: var(--text-dim); font-size: 12px; margin-top: 1px; }
.flow-chevron { color: var(--text-faint); transition: transform .15s ease; flex: none; }
.flow-deck[open] .flow-chevron { transform: rotate(90deg); }

.flow-grid-track { display: flex; align-items: center; gap: 10px; }
.flow-blocks { display: flex; gap: 4px; }
.flow-cell { width: 14px; height: 19px; border-radius: 3px; background: var(--bg-sunken); border: 1px solid var(--border-soft); }
.flow-cell.shipped { background: var(--ok); border-color: var(--ok); }
.flow-cell.staged { background: var(--warn-soft); border: 1.5px dashed var(--warn); }
.flow-cell.open { background: transparent; border: 1.5px dashed var(--text-faint); opacity: .55; }
.flow-grid-readout { font-size: 11.5px; color: var(--text-dim); line-height: 1.4; white-space: nowrap; }
.flow-grid-readout .mono { color: var(--text); font-weight: 650; }

.flow-status-chip {
  display: inline-flex; align-items: center; gap: 6px; font-size: 11.5px; font-weight: 650;
  padding: 4px 9px; border-radius: 999px; white-space: nowrap;
}
.flow-status-chip.ok { background: var(--ok-soft); color: var(--ok); }
.flow-status-chip.stalled { background: var(--err-soft); color: var(--err); }
.flow-status-chip .sdot { width: 6px; height: 6px; border-radius: 50%; background: currentColor; }

.flow-deck-meta { text-align: right; font-size: 12px; color: var(--text-faint); white-space: nowrap; }
.flow-deck-meta .totals-line { font-size: 13px; color: var(--text); font-weight: 650; }
.flow-deck-meta .delta-line { font-size: 11.5px; color: var(--text-faint); margin-top: 2px; }
.flow-deck-meta .delta-line .plus { color: var(--ok); font-weight: 650; }

.flow-detail { border-top: 1px solid var(--border); padding: 4px 18px 18px; }
.flow-banner { font-size: 12.5px; color: var(--text-dim); background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; padding: 11px 14px; margin: 14px 0; line-height: 1.6; }
.flow-banner.crit { background: var(--err-soft); border-color: var(--err); color: var(--text); }
.flow-banner b { color: var(--text); }

.flow-shape-wrap { margin: 16px 0 4px; }
.flow-shape-wrap > h4 { margin: 0 0 8px; font-size: 11.5px; font-weight: 650; color: var(--text-dim); text-transform: uppercase; letter-spacing: .04em; }
.flow-legend { display: flex; gap: 14px; flex-wrap: wrap; font-size: 11px; color: var(--text-dim); margin-bottom: 9px; }
.flow-legend .sw { display: inline-flex; align-items: center; gap: 5px; }
.flow-legend .flow-u { width: 16px; height: 16px; margin: 0; }

.flow-shape-box { padding: 12px; background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; }
.flow-shape-rows { display: flex; flex-direction: column; gap: 7px; }
.flow-shape-row { display: flex; align-items: center; gap: 3px; flex-wrap: wrap; row-gap: 5px; }
.flow-row-no { width: 30px; flex: none; font-size: 9.5px; color: var(--text-faint); font-family: var(--mono); text-align: right; margin-right: 6px; }

.flow-u {
  width: 16px; height: 21px; display: inline-flex; align-items: center; justify-content: center;
  font-size: 10px; font-weight: 700; border-radius: 3px; font-family: var(--mono); cursor: default; flex: none;
}
.flow-u.shipped { background: var(--ok-soft); color: var(--text); border: 1px solid transparent; }
.flow-u.staged { background: var(--warn-soft); border: 1.5px dashed var(--warn); color: var(--text); }
.flow-u.open { background: transparent; border: 1.5px dashed var(--text-faint); opacity: .7; color: var(--text-faint); }
.flow-u.pending { background: transparent; border: 1px dotted var(--text-faint); opacity: .6; color: var(--text-dim); }
/* card-flow projected-tier fillers: same "?" as .open, visually distinct
   (dotted vs. dashed, no opacity dip) since these mean something different
   — a future arrival still to land, not an unminted slot in the current
   batch. */
.flow-u.gap { background: transparent; border: 1.5px dotted var(--accent); opacity: .55; color: var(--accent-text); }

.flow-batch-div { width: 1px; height: 21px; background: var(--border); margin: 0 6px; flex: none; }

.flow-shape-note { font-size: 11.5px; color: var(--text-faint); margin: 10px 0 2px; line-height: 1.65; }
.flow-shape-note b { color: var(--text-dim); }
.flow-pending-empty { font-size: 11.5px; color: var(--text-faint); margin-top: 8px; }
`;

function escapeHtml(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}

const NAV = [
  {
    group: "Builder",
    items: [
      { href: "/builder", label: "Forecast & publish" },
      { href: "/builder/schedule", label: "Schedule" },
      { href: "/builder/logs", label: "Run log" },
    ],
  },
];

function renderRail(activeHref) {
  return NAV.map(
    ({ group, items }) => `<div class="rail-group-label">${escapeHtml(group)}</div>
${items.map((i) => `<a href="${i.href}" class="${i.href === activeHref ? "active" : ""}">${escapeHtml(i.label)}</a>`).join("\n")}`
  ).join("\n");
}

export function renderShell({ title, activeHref, body }) {
  return `<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${escapeHtml(title)}</title>
<style>${STYLE}</style>
</head>
<body>
<div class="top-bar">
  <strong>mjølnir · builder</strong>
  <nav>
    <a href="/mjolnir/ui">hub's Cards &amp; publish history →</a>
    <a href="/stabbur/ui">stabbur: notes &amp; grammar →</a>
  </nav>
</div>
<div class="shell">
  <div class="rail">${renderRail(activeHref)}</div>
  <div class="content">${body}</div>
</div>
</body>
</html>`;
}

export { escapeHtml };
