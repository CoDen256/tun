// The /backup/ page's own style block and client script.
//
// THE PALETTE IS NOT REDEFINED. Everything structural — the shell, the rail,
// the top bar and the zone switcher, `.panel`, `.pill`, tables, buttons, the
// type scale and every colour variable — comes from
// libs/jsservice/layout.js's STYLE, which this page renders inside. What is
// here is only what that file has no reason to carry: the health banner, the
// phase rail, the log box, the expandable rows, the settings grid and the
// restore blocks. The same arrangement mjolnir's insights page uses
// (INSIGHTS_PAGE_STYLE), for the same reason.
//
// The two `:root[data-theme=…]` blocks repeat BOTH variable sets so the
// toggle wins in either direction: the shared stylesheet switches on
// `prefers-color-scheme` alone, which a toggle cannot override without
// restating the variables under an attribute selector that beats a media
// query. Values are copied from the shared file, not invented.
export const PAGE_STYLE = `
:root[data-theme="light"] {
  --bg: #f5f3ef; --bg-elevated: #ffffff; --bg-sunken: #ebe7e0;
  --border: #e2ddd3; --border-soft: #ece8e0;
  --text: #221f1a; --text-dim: #6b6660; --text-faint: #9a948a;
  --accent: #b35a2d; --accent-soft: #b35a2d14; --accent-text: #8a431c;
  --ok: #2f8a5c; --ok-soft: #2f8a5c14;
  --warn: #a87c1f; --warn-soft: #a87c1f14;
  --err: #b23a34; --err-soft: #b23a3414;
}
:root[data-theme="dark"] {
  --bg: #14171c; --bg-elevated: #1b1f26; --bg-sunken: #0f1216;
  --border: #2a3039; --border-soft: #232832;
  --text: #e8e6e1; --text-dim: #8b94a3; --text-faint: #566073;
  --accent: #c6703f; --accent-soft: #c6703f26; --accent-text: #f2b688;
  --ok: #5bab7e; --ok-soft: #5bab7e1f;
  --warn: #d4a73d; --warn-soft: #d4a73d1f;
  --err: #d1453f; --err-soft: #d1453f1f;
}

/* The body must never scroll horizontally; wide content scrolls inside its
   own container (.table-wrap, .logbox, .cmd pre, .hb-quote). */
html, body { max-width: 100%; overflow-x: hidden; }
h4 { text-wrap: balance; font-weight: 650; margin: 0; }
button[disabled] { cursor: default; opacity: .62; }
button[disabled]:hover { border-color: var(--border); }
.btn-sm { font-size: 11.5px; padding: 4px 9px; }
.panel-head .note { font-size: 11.5px; color: var(--text-faint); }
.section-head .note { font-size: 12px; color: var(--text-faint); }

.theme-toggle { display: inline-flex; border: 1px solid var(--border); border-radius: 999px; overflow: hidden; }
.theme-toggle button { border: 0; border-radius: 0; background: transparent; color: var(--text-dim); font-size: 11px; padding: 4px 11px; font-weight: 650; }
.theme-toggle button[aria-pressed="true"] { background: var(--accent-soft); color: var(--accent-text); }

/* THE HEALTH BANNER. Three states, and the two bad ones are deliberately
   louder than anything else on the page: this service once logged
   "committed and pushed" with an empty /data for seven hours. Each state is
   distinguishable without reading a word — border weight, border colour, a
   tinted header and a filled icon, not text alone. */
.hb { border-radius: 10px; border: 1px solid var(--border); background: var(--bg-elevated); overflow: hidden; margin-bottom: 16px; }
.hb-top { display: flex; align-items: center; gap: 14px; padding: 15px 18px; flex-wrap: wrap; }
.hb-ico { width: 34px; height: 34px; flex: none; border-radius: 9px; display: flex; align-items: center; justify-content: center; font-size: 17px; font-weight: 700; background: var(--ok-soft); color: var(--ok); }
.hb-txt { min-width: 0; }
.hb-txt .h { font-size: 15px; font-weight: 700; }
.hb-txt .s { font-size: 12.5px; color: var(--text-dim); margin-top: 2px; }
.hb-txt .s code { font-size: 11.5px; }
.hb-act { margin-left: auto; display: flex; gap: 8px; align-items: center; flex-wrap: wrap; }
.hb-strip { display: grid; grid-template-columns: repeat(auto-fit, minmax(176px, 1fr)); gap: 1px; background: var(--border); border-top: 1px solid var(--border); }
.hb-cell { background: var(--bg-elevated); padding: 11px 18px 12px; }
.hb-cell .k { font-size: 10.5px; text-transform: uppercase; letter-spacing: .06em; color: var(--text-faint); font-weight: 650; }
.hb-cell .v { font-size: 15px; font-weight: 700; font-family: var(--mono); font-variant-numeric: tabular-nums; margin-top: 3px; }
.hb-cell .x { font-size: 11.5px; color: var(--text-faint); margin-top: 2px; }
.hb-cell .v.bad { color: var(--err); }
.hb-cell .v.warny { color: var(--warn); }
.hb-cell .v.good { color: var(--ok); }
.hb.state-ok { border-color: var(--ok); }
.hb.state-fail, .hb.state-stale, .hb.state-never { border-width: 2px; }
/* "never completed" is DASHED where a failed run is solid: nothing has ever
   happened, as against a definite failure event with an older good backup
   behind it. Criterion 12 wants the two distinguishable without reading. */
.hb.state-never { border-color: var(--err); border-style: dashed; }
.hb.state-never .hb-top { background: var(--err-soft); }
.hb.state-never .hb-ico { background: transparent; color: var(--err); border: 2px dashed var(--err); }
.hb.state-fail { border-color: var(--err); }
.hb.state-fail .hb-top { background: var(--err-soft); }
.hb.state-fail .hb-ico { background: var(--err); color: #fff; }
.hb.state-stale { border-color: var(--warn); }
.hb.state-stale .hb-top { background: var(--warn-soft); }
.hb.state-stale .hb-ico { background: var(--warn); color: #1a0d05; }

/* the run's phase rail, read off the run's own log */
.phases { display: flex; gap: 0; align-items: stretch; margin: 2px 0 12px; flex-wrap: wrap; }
.ph { display: flex; align-items: center; gap: 7px; padding: 6px 12px 6px 10px; font-size: 12px; color: var(--text-faint); border: 1px solid var(--border); border-right: 0; background: var(--bg-sunken); }
.ph:first-child { border-radius: var(--radius) 0 0 var(--radius); }
.ph:last-child { border-right: 1px solid var(--border); border-radius: 0 var(--radius) var(--radius) 0; }
.ph .n { width: 15px; height: 15px; border-radius: 50%; border: 1.5px solid var(--border); flex: none; display: flex; align-items: center; justify-content: center; font-size: 9px; font-weight: 700; }
.ph.done { color: var(--text-dim); }
.ph.done .n { background: var(--ok); border-color: var(--ok); color: #06130c; }
.ph.now { color: var(--accent-text); background: var(--accent-soft); border-color: var(--accent); font-weight: 650; }
.ph.now .n { border-color: var(--accent); color: var(--accent-text); animation: spin 1.1s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }

.logbox { font-family: var(--mono); font-size: 11.5px; line-height: 1.65; background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; padding: 11px 13px; max-height: 260px; overflow: auto; white-space: pre; }
.logbox .ok { color: var(--ok); }
.logbox .warn { color: var(--warn); }
.logbox .err { color: var(--err); font-weight: 650; }
.logbox .dim { color: var(--text-faint); }
.run-collapsed { display: flex; align-items: center; gap: 12px; flex-wrap: wrap; font-size: 12.5px; color: var(--text-dim); }
.run-collapsed .big { font-size: 13px; color: var(--text); font-weight: 650; }

/* expanders (run history / commits) */
details.row-x { border-bottom: 1px solid var(--border-soft); }
details.row-x:last-of-type { border-bottom: none; }
details.row-x > summary { list-style: none; cursor: pointer; display: grid; gap: 14px; align-items: center; padding: 11px 18px; }
details.row-x > summary::-webkit-details-marker { display: none; }
details.row-x > summary:hover { background: var(--bg-sunken); }
details.row-x[open] > summary { background: var(--bg-sunken); }
.chev { color: var(--text-faint); transition: transform .14s ease; flex: none; width: 12px; }
details.row-x[open] .chev { transform: rotate(90deg); }
.run-sum { grid-template-columns: 12px 190px 78px 120px minmax(0, 1fr); }
.cm-sum { grid-template-columns: 12px 172px 76px minmax(0, 1fr) 100px; }
@media (max-width: 1080px) {
  .run-sum, .cm-sum { grid-template-columns: 12px minmax(0, 1fr); }
  .run-sum > :nth-child(n+3), .cm-sum > :nth-child(n+3) { grid-column: 2; }
}
.row-x .when { font-family: var(--mono); font-size: 12px; }
.row-x .dur { font-family: var(--mono); font-size: 12px; color: var(--text-dim); }
.row-x .what { font-size: 12.5px; color: var(--text-dim); min-width: 0; overflow: hidden; text-overflow: ellipsis; }
.row-x .what b { color: var(--text); font-weight: 650; }
.row-body { padding: 2px 18px 16px; }
.row-body .meta { display: flex; gap: 20px; flex-wrap: wrap; font-size: 11.5px; color: var(--text-faint); margin: 6px 0 9px; }
.row-body .meta b { color: var(--text-dim); font-family: var(--mono); font-weight: 650; }
details.row-x.failed > summary { border-left: 3px solid var(--err); padding-left: 15px; }

.fileline { display: grid; grid-template-columns: minmax(0, 1fr) 92px 86px; gap: 10px; font-family: var(--mono); font-size: 11.5px; padding: 4px 0; border-bottom: 1px solid var(--border-soft); }
.fileline:last-child { border-bottom: none; }
.fileline .p { overflow: hidden; text-overflow: ellipsis; }
.fileline .a { color: var(--ok); text-align: right; }
.fileline .d { color: var(--err); text-align: right; }
.fh { color: var(--text-faint); font-family: var(--sans); font-size: 10.5px; text-transform: uppercase; letter-spacing: .05em; font-weight: 650; }

/* sources */
tr.src-alarm { background: var(--err-soft); }
tr.src-alarm td { border-bottom-color: var(--err); }
tr.src-alarm .why { color: var(--err); font-weight: 650; white-space: normal; }
.delta-good { color: var(--ok); font-weight: 650; }
.delta-flat { color: var(--text-faint); }
.ro-tag { font-size: 10.5px; text-transform: uppercase; letter-spacing: .05em; color: var(--text-faint); font-weight: 650; border: 1px solid var(--border); border-radius: 99px; padding: 1px 8px 2px; }

/* settings */
.set-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1px; background: var(--border); border: 1px solid var(--border); border-radius: 10px; overflow: hidden; }
.set-cell { background: var(--bg-elevated); padding: 14px 16px 15px; }
.set-cell .k { font-size: 12px; font-weight: 650; }
.set-cell .cur { font-size: 11.5px; color: var(--text-faint); margin: 3px 0 8px; font-family: var(--mono); }
.set-cell .ctl { display: flex; align-items: center; gap: 7px; flex-wrap: wrap; }
.set-cell .ctl input { width: 96px; }
.set-cell .unit { font-size: 12px; color: var(--text-dim); }
.set-cell .src { font-size: 11px; color: var(--text-faint); margin-top: 7px; line-height: 1.5; }
.set-cell.dirty { box-shadow: inset 3px 0 0 var(--accent); }
.save-bar { display: flex; align-items: center; gap: 12px; margin-top: 12px; flex-wrap: wrap; }
.save-msg { font-size: 12.5px; font-weight: 650; color: var(--text-faint); }
.save-msg.ok { color: var(--ok); }
.save-msg.err { color: var(--err); }
.ro-facts { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 10px; margin-top: 14px; }
.ro-fact { border: 1px dashed var(--border); border-radius: 8px; padding: 10px 12px; font-size: 11.5px; }
.ro-fact .k { color: var(--text-faint); text-transform: uppercase; letter-spacing: .05em; font-weight: 650; font-size: 10.5px; }
.ro-fact .v { font-family: var(--mono); margin-top: 3px; overflow-x: auto; white-space: pre; }

/* restore */
.rs { display: flex; flex-direction: column; }
details.rs { display: block; }
details.rs > summary { cursor: pointer; padding: 12px 18px; font-size: 12.5px; color: var(--text-dim); font-weight: 650; }
details.rs[open] > summary { border-bottom: 1px solid var(--border-soft); }
.rs-step { border-top: 1px solid var(--border-soft); padding: 14px 18px; }
.rs-step:first-child { border-top: 0; }
.rs-step h4 { font-size: 12.5px; display: flex; align-items: center; gap: 9px; }
.rs-step h4 .n { font-family: var(--mono); font-size: 11px; color: var(--text-faint); border: 1px solid var(--border); border-radius: 99px; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; flex: none; }
.rs-step .why { font-size: 12px; color: var(--text-dim); margin: 5px 0 9px; }
.cmd { position: relative; background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; }
.cmd pre { margin: 0; padding: 11px 13px 11px 13px; font-family: var(--mono); font-size: 11.5px; line-height: 1.7; overflow-x: auto; white-space: pre; }
.cmd .cp { position: absolute; top: 6px; right: 6px; background: var(--bg-elevated); }
.cmd pre .c { color: var(--text-faint); }
.warnline { font-size: 12px; color: var(--warn); font-weight: 650; margin-top: 8px; }
`;

// The client script. Deliberately small, and it owns only what a server
// cannot: the theme choice, which rows are open, and the fetches.
//
// POLLING AND WHY IT IS CONDITIONAL. A queued or running backup is the one
// state where the page goes out of date on its own, so it polls every 2s;
// otherwise it refreshes every 20s, and there is an explicit Refresh button
// either way. The poll re-renders the whole content area from the SERVER's
// renderer — there is no second copy of the page's logic here to drift — and
// re-opens the rows that were open, keyed by their stable ids.
export const PAGE_SCRIPT = `
const API = "/backup/api";
// THE SWAP TARGET IS #view, NOT .content, AND THAT IS THE WHOLE BUG FIX.
// renderShell nests the page body inside div.content, and this page's own
// style block sits in that body. Refreshing by assigning content.innerHTML
// from /api/view -- which returns the content ALONE -- therefore DELETED THE
// PAGE'S STYLESHEET on the first tick: the shared shell CSS in <head>
// survived, so the console degraded to unstyled text and bare forms a few
// seconds after loading, and only a reload restored it. Reported from live
// use, 2026-11-26.
//
// #view wraps only the refreshable content; the style and the script sit
// outside it, where no swap can reach them. NOTE: this whole script is a
// template literal in chrome.js, so never use a backtick in these comments.
const content = document.getElementById("view") || document.querySelector(".content");

function applyStoredTheme() {
  const t = localStorage.getItem("tun.theme");
  if (t === "light" || t === "dark") document.documentElement.setAttribute("data-theme", t);
  markThemeButtons();
}
function markThemeButtons() {
  const t = document.documentElement.getAttribute("data-theme");
  for (const b of document.querySelectorAll(".theme-toggle button")) {
    b.setAttribute("aria-pressed", String(b.dataset.theme === t));
  }
}
applyStoredTheme();

let busy = false;
let timer = null;

function openRowIds() {
  return [...document.querySelectorAll("details.row-x[open], details.keepopen[open]")].map((d) => d.id);
}

function editingSettings() {
  const el = document.activeElement;
  return !!(el && el.closest && el.closest(".set-grid"));
}

async function refresh() {
  if (busy) return;
  // Never clobber what the operator is typing into a settings field.
  if (editingSettings() || document.querySelector(".set-cell.dirty")) {
    schedule();
    return;
  }
  busy = true;
  try {
    const res = await fetch(API + "/view", { headers: { "Accept": "text/html" } });
    if (res.ok) {
      const open = new Set(openRowIds());
      content.innerHTML = await res.text();
      for (const id of open) {
        const el = document.getElementById(id);
        if (el) el.open = true;
      }
      markThemeButtons();
      dirtyCheck();
    }
  } catch (err) {
    const asOf = document.getElementById("as-of");
    if (asOf) asOf.textContent = "could not reach this console: " + err.message;
  } finally {
    busy = false;
    schedule();
  }
}

function schedule() {
  if (timer) clearTimeout(timer);
  const live = !!document.querySelector("#runnow .pill-warn, #runnow .ph.now");
  timer = setTimeout(refresh, live ? 2000 : 20000);
}
schedule();

// A rail link to a section whose body is collapsed must open it, or the
// anchor lands on a heading with nothing under it.
function openHashTarget() {
  const id = location.hash.slice(1);
  if (!id) return;
  const d = document.getElementById(id + "-steps") || document.getElementById(id);
  if (d && d.tagName === "DETAILS") d.open = true;
}
openHashTarget();
window.addEventListener("hashchange", openHashTarget);

document.addEventListener("click", async (e) => {
  const theme = e.target.closest(".theme-toggle button");
  if (theme) {
    document.documentElement.setAttribute("data-theme", theme.dataset.theme);
    localStorage.setItem("tun.theme", theme.dataset.theme);
    markThemeButtons();
    return;
  }

  if (e.target.closest("#refresh")) { refresh(); return; }

  const openRun = e.target.closest("[data-open-run]");
  if (openRun) {
    const el = document.getElementById("run-" + openRun.dataset.openRun);
    if (el) { el.open = true; el.scrollIntoView({ block: "center", behavior: "smooth" }); }
    return;
  }

  const copy = e.target.closest(".cmd .cp");
  if (copy) {
    const text = copy.parentElement.querySelector("pre").innerText;
    try { await navigator.clipboard.writeText(text); } catch (err) { /* no clipboard permission */ }
    copy.textContent = "Copied";
    setTimeout(() => { copy.textContent = "Copy"; }, 1200);
    return;
  }

  const more = e.target.closest("#more-runs, #more-commits");
  if (more) {
    const url = new URL(location.href);
    const key = more.id === "more-runs" ? "runs" : "commits";
    url.searchParams.set(key, String(Number(url.searchParams.get(key) || 6) + 20));
    location.href = url.toString() + "#" + (key === "runs" ? "runs" : "commits");
    return;
  }

  const run = e.target.closest("#run-btn");
  if (run) {
    run.disabled = true;
    const hint = document.getElementById("run-hint");
    try {
      const res = await fetch(API + "/run", { method: "POST" });
      const body = await res.json().catch(() => ({}));
      if (hint) hint.textContent = body.message || (res.ok ? "requested" : "could not request a run");
    } catch (err) {
      if (hint) hint.textContent = "could not request a run: " + err.message;
    }
    refresh();
    return;
  }

  if (e.target.closest("#set-revert")) {
    for (const input of document.querySelectorAll(".set-cell input")) input.value = input.defaultValue;
    dirtyCheck();
    return;
  }

  const save = e.target.closest("#set-save");
  if (save) {
    const msg = document.getElementById("set-msg");
    const payload = {};
    for (const input of document.querySelectorAll(".set-cell input")) payload[input.name] = Number(input.value);
    save.disabled = true;
    save.textContent = "Saving…";
    try {
      const res = await fetch(API + "/settings", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      const body = await res.json().catch(() => ({}));
      msg.className = "save-msg " + (res.ok ? "ok" : "err");
      msg.textContent = (res.ok ? "✓ " : "✕ ") + (body.message || (res.ok ? "saved" : "could not save"));
    } catch (err) {
      msg.className = "save-msg err";
      msg.textContent = "✕ could not save: " + err.message;
    }
    save.textContent = "Save settings";
    refresh();
    return;
  }
});

function human(seconds) {
  const s = Math.max(0, Math.round(seconds));
  if (s < 60) return s + "s";
  const m = Math.floor(s / 60);
  if (m < 60) return m + "m " + (s % 60) + "s";
  const h = Math.floor(m / 60);
  if (h < 24) return h + "h " + (m % 60) + "m";
  return Math.floor(h / 24) + "d " + (h % 24) + "h";
}

function dirtyCheck() {
  let dirty = false;
  for (const input of document.querySelectorAll(".set-cell input")) {
    const changed = input.value !== input.defaultValue;
    input.closest(".set-cell").classList.toggle("dirty", changed);
    if (changed) dirty = true;
    const label = document.querySelector('[data-human-for="' + input.name + '"]');
    if (label) label.textContent = input.name === "run_retention" ? "" : "= " + human(Number(input.value));
  }
  const save = document.getElementById("set-save");
  const revert = document.getElementById("set-revert");
  if (save) save.disabled = !dirty;
  if (revert) revert.disabled = !dirty;
}
document.addEventListener("input", (e) => {
  if (e.target.closest(".set-cell")) dirtyCheck();
});
dirtyCheck();
`;
