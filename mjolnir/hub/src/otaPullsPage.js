import { escapeHtml } from "./layout.js";
import { WINDOWS } from "./otaPulls.js";

// The Device -> Pulls page, built to `openspec/changes/ota-pull-tracking/
// mockups/device-pulls.html`, surface 1. Only the two surfaces that belong to
// this change were taken from that file (Pulls and Publish history); its
// third surface is `userdata-git-history`'s.
//
// SERVER-RENDERED, like every other hub page. Filters, sorting and paging are
// query parameters, so a filtered view is a URL the operator can keep — which
// is also what makes Publish history's "click a count to see that build's
// pulls" a plain link rather than a client-side handshake. The only client
// script is the one that expands a collapsed run of polls, and the rows it
// reveals are already in the DOM, so the page is complete without it.

// Classes the mockup adds beyond libs/jsservice/layout.js's shared STYLE —
// same pattern as server.js's DEVICE_PAGE_STYLE and insightsPage.js's
// INSIGHTS_PAGE_STYLE. NO NEW PALETTE: every colour below is one of the
// shared variables, so both themes follow the shell with no second set of
// values to keep in step.
export const PULLS_PAGE_STYLE = `
/* Bundle rows dominate, poll rows recede — the point is that the two kinds
   are distinguishable without reading the kind column (C24). */
tr.ev-bundle td { font-weight: 600; }
tr.ev-bundle td.ev-when { color: var(--text); }
tr.ev-poll td { color: var(--text-faint); font-weight: 400; }
tr.ev-poll { background: color-mix(in srgb, var(--bg-sunken) 55%, transparent); }
tr.ev-run { cursor: pointer; }
tr.ev-run td { color: var(--text-faint); background: color-mix(in srgb, var(--bg-sunken) 55%, transparent); }
tr.ev-run:hover td { color: var(--text-dim); }
tr.ev-run .run-caret { display: inline-block; width: 10px; color: var(--text-faint); transition: transform .12s ease; }
tr.ev-run.open .run-caret { transform: rotate(90deg); }
tr.ev-child td:first-child { padding-left: 34px; }
tr.ev-child[hidden] { display: none; }
.kind-tag { display: inline-flex; align-items: center; gap: 5px; font-size: 11px; font-weight: 700; letter-spacing: .03em; text-transform: uppercase; padding: 1px 7px 2px; border-radius: 4px; }
.kind-tag.bundle { background: var(--accent-soft); color: var(--accent-text); }
.kind-tag.poll { background: transparent; color: var(--text-faint); border: 1px solid var(--border-soft); font-weight: 600; }
.st-ok { color: var(--ok); }
.st-bad { color: var(--err); }
.st-dim { color: var(--text-faint); }
th.sortable a { color: inherit; text-decoration: none; display: inline-block; }
th.sortable:hover { color: var(--text-dim); }
th.sortable .arrow { opacity: 0; margin-left: 3px; }
th.sortable.sorted .arrow { opacity: 1; color: var(--accent-text); }

/* The activity strip. Inline SVG, no chart library: it is 30 bars and a
   handful of dots, and uPlot is already loaded on exactly one page for a
   reason. */
.actstrip { padding: 14px 18px 10px; }
.actstrip svg { display: block; width: 100%; height: auto; }
.act-legend { display: flex; gap: 16px; flex-wrap: wrap; font-size: 11.5px; color: var(--text-dim); margin-top: 8px; }
.act-legend .sw { display: inline-flex; align-items: center; gap: 6px; }
.act-legend i { width: 12px; height: 12px; border-radius: 3px; display: inline-block; }

.flow-banner { font-size: 12.5px; color: var(--text-dim); background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; padding: 11px 14px; margin: 14px 0; line-height: 1.6; }
.flow-banner b { color: var(--text); }
.pager { display: flex; gap: 6px; align-items: center; flex-wrap: wrap; margin-top: 12px; }
.pager-readout { font-size: 12px; color: var(--text-faint); margin-right: auto; }
.pager a.btn-ghost[aria-disabled="true"] { opacity: .4; pointer-events: none; }
.pager .pager-current { background: var(--bg-elevated); color: var(--text); font-weight: 600; }

/* Publish history's two new columns (surface 2). */
tr.never-pulled-live { background: var(--warn-soft); }
td.pullcount a { text-decoration: none; font-weight: 650; }
.never-tag { font-size: 11.5px; font-weight: 650; color: var(--warn); }
.never-tag.quiet { color: var(--text-faint); font-weight: 500; }
.col-pulls { color: var(--accent-text); }
`;

export const PAGE_SIZES = [25, 50, 100];
// A run of consecutive successful polls collapses from this length up (tier
// 2). Two is the mockup's own threshold: a single poll between two bundle
// rows reads better as itself than as "a run of 1".
const COLLAPSE_FROM = 2;

const PULLS_PATH = "/mjolnir/device/pulls";

export function readPullFilters(url) {
  const q = url.searchParams;
  const windowKey = WINDOWS[q.get("window")] ? q.get("window") : "30d";
  const kind = ["bundle", "poll"].includes(q.get("kind")) ? q.get("kind") : "all";
  const sort = ["ts", "kind", "build", "status", "bytes", "source"].includes(q.get("sort")) ? q.get("sort") : "ts";
  const dirParam = q.get("dir") === "asc" ? "asc" : "desc";
  const size = PAGE_SIZES.includes(Number(q.get("size"))) ? Number(q.get("size")) : PAGE_SIZES[0];
  const page = Math.max(1, Number(q.get("page")) || 1);
  return {
    window: windowKey,
    kind,
    build: (q.get("build") || "").trim().slice(0, 64),
    source: (q.get("source") || "").trim().slice(0, 64),
    sort,
    dir: dirParam,
    size,
    page,
    // Collapsing is only meaningful while the table is in time order — a run
    // of "consecutive" polls means nothing once the rows are sorted by bytes.
    collapse: q.get("collapse") !== "0",
  };
}

export function pullsUrl(filters, overrides = {}) {
  const f = { ...filters, ...overrides };
  const q = new URLSearchParams();
  if (f.window !== "30d") q.set("window", f.window);
  if (f.kind !== "all") q.set("kind", f.kind);
  if (f.build) q.set("build", f.build);
  if (f.source) q.set("source", f.source);
  if (f.sort !== "ts") q.set("sort", f.sort);
  if (f.dir !== "desc") q.set("dir", f.dir);
  if (f.size !== PAGE_SIZES[0]) q.set("size", String(f.size));
  if (f.page && f.page > 1) q.set("page", String(f.page));
  if (!f.collapse) q.set("collapse", "0");
  const s = q.toString();
  return s ? `${PULLS_PATH}?${s}` : PULLS_PATH;
}

function fmtBytes(n) {
  if (n === null || n === undefined) return "—";
  const v = Number(n);
  if (v < 1024) return `${v} B`;
  if (v < 1024 * 1024) return `${(v / 1024).toFixed(1)} KiB`;
  return `${(v / 1048576).toFixed(2)} MiB`;
}

function timeAgo(date, now = new Date()) {
  if (!date) return "never";
  const mins = Math.floor((now - new Date(date)) / 60000);
  if (mins < 1) return "just now";
  if (mins < 60) return `${mins}m ago`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h ago`;
  const days = Math.floor(hours / 24);
  if (days === 1) return "yesterday";
  if (days < 7) return `${days}d ago`;
  return `${Math.floor(days / 7)}w ago`;
}

function clock(date) {
  return `${new Date(date).toISOString().slice(0, 16).replace("T", " ")}Z`;
}

function statusCell(status) {
  const cls = status === 200 || status === 206 ? "st-ok" : status >= 400 ? "st-bad" : "st-dim";
  return `<span class="mono ${cls}">${status}</span>`;
}

// Consecutive SUCCESSFUL polls become one run. A non-200 of either kind, and
// every bundle row, breaks the run and is always rendered on its own: a 401
// scan or a 404 for a deleted build is exactly what must never be folded away
// (C26), and a run is only ever built from status-200 polls.
export function groupEvents(events, { collapse, sort }) {
  if (!collapse || sort !== "ts") return events.map((e) => ({ type: "event", event: e }));
  const out = [];
  let run = null;
  for (const e of events) {
    if (e.kind === "poll" && e.status === 200) {
      if (!run) {
        run = { type: "run", items: [], key: `r${e.id}` };
        out.push(run);
      }
      run.items.push(e);
    } else {
      run = null;
      out.push({ type: "event", event: e });
    }
  }
  return out.map((r) => (r.type === "run" && r.items.length < COLLAPSE_FROM ? { type: "event", event: r.items[0] } : r));
}

function eventRow(e, { filters, child = false, now }) {
  const cls = `${e.kind === "bundle" ? "ev-bundle" : "ev-poll"}${child ? " ev-child" : ""}`;
  const buildCell = e.build_id
    ? `<a class="mono" href="${pullsUrl(filters, { build: e.build_id, page: 1 })}">${escapeHtml(e.build_id)}</a>`
    : `<span class="st-dim">—</span>`;
  return `<tr class="${cls}"${child ? ' hidden data-child-of="RUNKEY"' : ""}>
      <td class="ev-when"><span class="mono">${clock(e.event_at)}</span>${
        child ? "" : ` <span class="st-dim" style="font-size:11.5px">· ${timeAgo(e.event_at, now)}</span>`
      }</td>
      <td>${
        e.kind === "bundle"
          ? '<span class="kind-tag bundle">bundle</span>'
          : '<span class="kind-tag poll">poll</span>'
      }</td>
      <td>${buildCell}</td>
      <td><span class="mono st-dim" style="font-size:12px">${escapeHtml(e.method)} ${escapeHtml(e.uri)}</span></td>
      <td>${statusCell(e.status)}</td>
      <td class="num">${fmtBytes(e.bytes)}</td>
      <td class="mono" style="font-size:12px">${escapeHtml(e.source_addr)}</td>
    </tr>`;
}

function runRow(r, { filters, now }) {
  const first = r.items[r.items.length - 1];
  const last = r.items[0];
  const sameDay = String(first.event_at).slice(0, 10) === String(last.event_at).slice(0, 10);
  const a = clock(first.event_at);
  const b = clock(last.event_at);
  const span = sameDay ? `${a} → ${b.slice(11)}` : `${a} → ${b}`;
  const addrs = [...new Set(r.items.map((i) => i.source_addr))];
  const total = r.items.reduce((s, i) => s + Number(i.bytes || 0), 0);
  const head = `<tr class="ev-run" data-run="${r.key}" tabindex="0" role="button" aria-expanded="false">
      <td><span class="run-caret">▸</span> <span class="mono">${span}</span></td>
      <td><span class="kind-tag poll">${r.items.length} polls</span></td>
      <td><span class="st-dim">—</span></td>
      <td><span class="mono" style="font-size:12px">GET /ota/current.json</span></td>
      <td><span class="mono st-ok">200</span></td>
      <td class="num">${fmtBytes(total)}</td>
      <td class="mono" style="font-size:12px">${
        addrs.length === 1 ? escapeHtml(addrs[0]) : `${addrs.length} addresses`
      }</td>
    </tr>`;
  const children = r.items
    .map((e) => eventRow(e, { filters, child: true, now }).replace("RUNKEY", r.key))
    .join("");
  return head + children;
}

function sortableTh(key, label, filters, { numeric = false } = {}) {
  const on = filters.sort === key;
  const nextDir = on && filters.dir === "desc" ? "asc" : "desc";
  const href = pullsUrl(filters, { sort: key, dir: nextDir, page: 1 });
  return `<th class="sortable${on ? " sorted" : ""}"${numeric ? ' style="text-align:right"' : ""}>
      <a href="${href}">${label}<span class="arrow">${on && filters.dir === "asc" ? "↑" : "↓"}</span></a></th>`;
}

// ---- the activity strip --------------------------------------------------
//
// BINNING IS PER DAY OVER A FIXED 30-DAY SPAN, regardless of the window the
// table is filtered to (tier 2). The strip's job is C27 — make an extended
// silence apparent instead of leaving it to be inferred from absent rows —
// and a strip that shrank with the filter would hide exactly the silence the
// operator is looking for: "last 24h" over a dead fortnight would draw one
// empty day.
export function activityStrip(days) {
  const W = 940;
  const H = 118;
  const L = 34;
  const R = 8;
  const T = 10;
  const B = 26;
  const inner = W - L - R;
  const bw = days.length ? inner / days.length : inner;
  const maxPolls = Math.max(1, ...days.map((d) => d.polls));
  let bars = "";
  let marks = "";
  let labels = "";

  days.forEach((d, i) => {
    const x = L + i * bw;
    const h = d.polls === 0 ? 0 : Math.max(2, (d.polls / maxPolls) * (H - T - B - 22));
    const y = H - B - h;
    if (d.polls > 0) {
      bars += `<rect x="${(x + 1.5).toFixed(1)}" y="${y.toFixed(1)}" width="${Math.max(1, bw - 3).toFixed(
        1
      )}" height="${h.toFixed(1)}" rx="1.5" fill="var(--text-faint)" opacity="0.45"><title>${d.day} — ${
        d.polls
      } poll(s)</title></rect>`;
    }
    if (d.pulls > 0) {
      const cx = x + bw / 2;
      const cy = T + 8;
      marks += `<line x1="${cx.toFixed(1)}" y1="${cy + 4}" x2="${cx.toFixed(1)}" y2="${
        H - B
      }" stroke="var(--accent)" stroke-width="1" opacity="0.5"/>`;
      marks += `<circle cx="${cx.toFixed(1)}" cy="${cy}" r="5" fill="var(--accent)"><title>${d.day} — ${
        d.pulls
      } bundle pull(s)</title></circle>`;
      if (d.pulls > 1) {
        marks += `<text x="${cx.toFixed(1)}" y="${
          cy + 3.2
        }" text-anchor="middle" font-size="8" font-weight="700" fill="var(--bg-sunken)">${d.pulls}</text>`;
      }
    }
    if (i % 4 === 0 || i === days.length - 1) {
      labels += `<text x="${(x + bw / 2).toFixed(1)}" y="${
        H - 9
      }" text-anchor="middle" font-size="9.5" fill="var(--text-faint)">${d.day.slice(5)}</text>`;
    }
  });

  // The longest silent stretch, shaded and named. Three days is the shortest
  // gap worth calling out on a device that is launched most days.
  let gap = "";
  let best = { start: -1, len: 0 };
  let cur = { start: -1, len: 0 };
  days.forEach((d, i) => {
    const silent = d.polls === 0 && d.pulls === 0 && d.faults === 0;
    if (silent) {
      if (cur.start === -1) cur = { start: i, len: 0 };
      cur.len += 1;
      if (cur.len > best.len) best = { ...cur };
    } else {
      cur = { start: -1, len: 0 };
    }
  });
  if (best.len >= 3) {
    const gx = L + best.start * bw;
    const gw = best.len * bw;
    gap =
      `<rect x="${gx.toFixed(1)}" y="${T}" width="${gw.toFixed(1)}" height="${
        H - T - B
      }" fill="var(--err)" opacity="0.07"/>` +
      `<text x="${(gx + gw / 2).toFixed(1)}" y="${
        T + 46
      }" text-anchor="middle" font-size="10" fill="var(--text-faint)">${best.len} days silent</text>`;
  }

  const axis =
    `<text x="${L - 6}" y="${H - B}" text-anchor="end" font-size="9.5" fill="var(--text-faint)">0</text>` +
    `<text x="${L - 6}" y="${T + 30}" text-anchor="end" font-size="9.5" fill="var(--text-faint)">${maxPolls}</text>` +
    `<line x1="${L}" y1="${H - B}" x2="${W - R}" y2="${H - B}" stroke="var(--border)" stroke-width="1"/>`;

  const span = days.length ? `${days[0].day} → ${days[days.length - 1].day}` : "no data";
  return `<div class="panel">
  <div class="panel-head">
    <div><h3>Activity · last ${days.length} days</h3>
      <div class="page-sub">Bars are <code>current.json</code> polls per day (liveness). Dots are bundle pulls.</div></div>
    <span class="mono st-dim" style="font-size:12px">${span}</span>
  </div>
  <div class="actstrip">
    <svg viewBox="0 0 ${W} ${H}" role="img" aria-label="pull and poll activity by day">
      ${gap}${axis}${bars}${marks}${labels}
    </svg>
    <div class="act-legend">
      <span class="sw"><i style="background:var(--accent)"></i> bundle pull (<code>/ota/bundle/*</code>)</span>
      <span class="sw"><i style="background:var(--text-faint);opacity:.45"></i> <code>current.json</code> polls per day</span>
      <span class="sw"><i style="background:var(--err);opacity:.18"></i> no requests at all</span>
    </div>
  </div>
</div>`;
}

function pagerHtml(filters, rowCount, pages, counts) {
  const link = (page, label, disabled, extra = "") =>
    `<a class="btn-ghost ${extra}" href="${pullsUrl(filters, { page })}"${
      disabled ? ' aria-disabled="true"' : ""
    }>${label}</a>`;
  return `<div class="pager">
    <span class="pager-readout">${rowCount} row(s) · ${counts.total} raw event(s) in window (${counts.pulls} bundle pull(s), ${counts.polls} poll(s)) · page ${filters.page} of ${pages}</span>
    ${link(1, "« first", filters.page === 1)}
    ${link(Math.max(1, filters.page - 1), "‹ prev", filters.page === 1)}
    <span class="btn-ghost pager-current">${filters.page}</span>
    ${link(Math.min(pages, filters.page + 1), "next ›", filters.page >= pages)}
    ${link(pages, "last »", filters.page >= pages)}
  </div>`;
}

export function renderPullsBody({ stats, events, activity, builds, filters, counts, publishedCount, ingest, now = new Date() }) {
  const grouped = groupEvents(events, filters);
  const pages = Math.max(1, Math.ceil(grouped.length / filters.size));
  const page = Math.min(filters.page, pages);
  const slice = grouped.slice((page - 1) * filters.size, page * filters.size);
  const rows =
    slice
      .map((r) => (r.type === "run" ? runRow(r, { filters, now }) : eventRow(r.event, { filters, now })))
      .join("") || `<tr><td colspan="7">no events match this filter</td></tr>`;

  const windowOptions = Object.entries(WINDOWS)
    .map(([k, v]) => `<option value="${k}"${filters.window === k ? " selected" : ""}>Window: ${v.label}</option>`)
    .join("");
  const buildOptions = builds
    .map((b) => `<option value="${escapeHtml(b)}"${filters.build === b ? " selected" : ""}>${escapeHtml(b)}</option>`)
    .join("");

  const ingestNote = ingest && ingest.error
    ? `<div class="inline-note">The gateway's pull log could not be read just now (<code>${escapeHtml(
        String(ingest.error)
      )}</code>), so this page may be missing the most recent events. Everything already recorded is shown — the table is the record, the log file is only how it gets here. Devices are unaffected: <code>/ota/*</code> is served off disk whether this file is readable or not.</div>`
    : "";

  return `<style>${PULLS_PAGE_STYLE}</style>
<div class="page-head">
  <div>
    <h2>OTA pulls</h2>
    <div class="page-sub">What was actually fetched from the gateway, read from its own access log — <code>/ota/*</code> is served off disk by <code>caddy</code> with no process and no database in the path, so the log is the only record there is. Nothing device-facing changed to produce it.</div>
  </div>
  <a class="btn btn-ghost" href="${pullsUrl(filters)}">↻ Refresh</a>
</div>

<div class="stat-row">
  <div class="stat">
    <div class="label">Bundle pulls</div>
    <div class="value">${stats.bundlePulls}</div>
    <div class="sub">in ${WINDOWS[filters.window].label}</div>
  </div>
  <div class="stat">
    <div class="label">Distinct builds pulled</div>
    <div class="value">${stats.distinctBuilds}</div>
    <div class="sub">of ${publishedCount} published</div>
  </div>
  <div class="stat">
    <div class="label">Last pull</div>
    <div class="value" style="font-size:19px">${timeAgo(stats.lastPullAt, now)}</div>
    <div class="sub mono">${
      stats.lastPullAt ? `${clock(stats.lastPullAt)}${stats.lastPullBuild ? ` · ${escapeHtml(stats.lastPullBuild)}` : ""}` : "no bundle has been fetched yet"
    }</div>
  </div>
  <div class="stat">
    <div class="label">Last seen checking</div>
    <div class="value" style="font-size:19px">${timeAgo(stats.lastPollAt, now)}</div>
    <div class="sub">${stats.pollsToday} poll(s) today · liveness only</div>
  </div>
</div>

<div class="flow-banner" style="margin-top:0">
  <b>Two event kinds, two meanings.</b> A <b>bundle</b> row is a download of one immutable build — low volume, high meaning.
  A <b>poll</b> row is <code>GET /ota/current.json</code> at launch (<code>Cache-Control: no-store</code>) — high volume, and the only
  liveness signal there is since <code>device_state</code> was dropped as permanently empty (D126). A poll is not a pull, and the log
  records no response body, so <b>a poll carries no build id</b>.
  <br><b>What these rows cannot tell you.</b> A pull means the gateway served those bytes — never that the phone ended up using that
  build: the native boot watchdog can quarantine a bundle that was fetched perfectly (D08). And the source column is a
  <b>network address</b>, not a device, account or handset: the OTA token is shared, one home connection looks like one address,
  and that address changes.
</div>

${activityStrip(activity)}

<div class="panel">
  <div class="panel-head">
    <div><h3>Event log</h3><div class="page-sub">Ingested from the gateway access log into <code>ota_pulls</code> · ${stats.totalRows} event(s) recorded in total.</div></div>
    <a class="btn-ghost" href="${pullsUrl(filters, { collapse: !filters.collapse, page: 1 })}">${
      filters.collapse ? "☑" : "☐"
    } collapse poll runs</a>
  </div>
  <div class="panel-pad" style="padding-bottom:0">
    <form class="toolbar" method="get" action="${PULLS_PATH}" id="pf">
      <select name="kind">
        <option value="all"${filters.kind === "all" ? " selected" : ""}>Kind: all</option>
        <option value="bundle"${filters.kind === "bundle" ? " selected" : ""}>bundle pulls only</option>
        <option value="poll"${filters.kind === "poll" ? " selected" : ""}>polls only</option>
      </select>
      <select name="build">
        <option value="">Build: all</option>
        ${buildOptions}
      </select>
      <select name="window">${windowOptions}</select>
      <input class="search-input" type="search" name="source" value="${escapeHtml(filters.source)}" placeholder="Source address contains…">
      <select name="size">${PAGE_SIZES.map(
        (n) => `<option value="${n}"${filters.size === n ? " selected" : ""}>${n} / page</option>`
      ).join("")}</select>
      ${filters.sort !== "ts" ? `<input type="hidden" name="sort" value="${escapeHtml(filters.sort)}">` : ""}
      ${filters.dir !== "desc" ? `<input type="hidden" name="dir" value="${escapeHtml(filters.dir)}">` : ""}
      ${filters.collapse ? "" : `<input type="hidden" name="collapse" value="0">`}
      <button class="btn" type="submit">Apply</button>
      <a class="btn-ghost" href="${PULLS_PATH}">Clear</a>
    </form>
  </div>
  <div class="table-wrap">
    <table>
      <thead><tr>
        ${sortableTh("ts", "When", filters)}
        ${sortableTh("kind", "Kind", filters)}
        ${sortableTh("build", "Build", filters)}
        <th>Request</th>
        ${sortableTh("status", "Status", filters)}
        ${sortableTh("bytes", "Bytes", filters, { numeric: true })}
        ${sortableTh("source", "Source address", filters)}
      </tr></thead>
      <tbody>${rows}</tbody>
    </table>
  </div>
  <div class="panel-pad" style="padding-top:12px">
    ${pagerHtml({ ...filters, page }, grouped.length, pages, counts)}
    <div class="inline-note">A collapsed row is a run of consecutive <code>200</code> polls — click it to expand. A non-200 is never collapsed: a <code>401</code> is an unauthenticated scan rather than the device, and a <code>404</code> is a request for a build that is no longer on disk.${
      filters.sort === "ts" ? "" : " Collapsing is off while the table is sorted by something other than time, because &ldquo;consecutive&rdquo; stops meaning anything."
    }</div>
    <div class="inline-note">Bytes are the gateway's own <code>size</code> field. A <code>206</code> is a resumed transfer and counts as the same pull, not a second one; a <code>404</code> or <code>401</code> counts as no pull anywhere on this page.</div>
    ${ingestNote}
  </div>
</div>
<script>
// The only client script on the page: expand a collapsed run. The child rows
// are already in the DOM (rendered \`hidden\`), so with no JS the run row is
// simply a summary rather than a broken control.
document.querySelectorAll('tr.ev-run').forEach((row) => {
  const toggle = () => {
    const key = row.dataset.run;
    const open = row.classList.toggle('open');
    row.setAttribute('aria-expanded', open ? 'true' : 'false');
    document.querySelectorAll('tr[data-child-of="' + key + '"]').forEach((child) => {
      if (open) child.removeAttribute('hidden'); else child.setAttribute('hidden', '');
    });
  };
  row.addEventListener('click', toggle);
  row.addEventListener('keydown', (e) => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); toggle(); } });
});
</script>`;
}

// ---- Publish history's two new columns (surface 2) -----------------------
//
// TWO NEVER-PULLED STATES, AND THEY MEAN OPPOSITE THINGS (design.md §8).
// Collapsing them into one "never pulled" would train the operator to ignore
// the one that matters.
//
//   current & never pulled      -> A FAULT. He published and the phone has
//                                  not taken it. Row highlighted, banner at
//                                  the top of the page.
//   superseded before any
//   device checked in           -> EXPECTED, and rendered quietly: nothing
//                                  could have fetched it.
//   superseded, but the device
//   did check in while it was
//   current                     -> in between, and worth a word: it had the
//                                  chance and did not take it. Not the
//                                  prominent treatment, because the build is
//                                  no longer the one that matters.
//
// The middle case is distinguished with `polls_while_current` rather than a
// "superseded within N minutes" threshold, because the question the operator
// actually has is whether anything was in a position to fetch it, and that is
// a fact in the data rather than a number someone picked.
export function pullState(publication, summary, { isCurrent }) {
  const s = summary || { pulls: 0, lastPullAt: null, supersededAt: null, pollsWhileCurrent: 0 };
  if (s.pulls > 0) return { kind: "pulled", pulls: s.pulls, lastPullAt: s.lastPullAt };
  if (isCurrent) return { kind: "current-never", pollsWhileCurrent: s.pollsWhileCurrent };
  if (s.pollsWhileCurrent === 0) return { kind: "superseded-never", supersededAt: s.supersededAt };
  return { kind: "missed", pollsWhileCurrent: s.pollsWhileCurrent, supersededAt: s.supersededAt };
}

export function pullCells(publication, state, { now = new Date() } = {}) {
  const buildHref = `${PULLS_PATH}?kind=bundle&build=${encodeURIComponent(publication.build_id)}&window=all`;
  if (state.kind === "pulled") {
    return {
      rowClass: "",
      pulls: `<a href="${buildHref}">${state.pulls}</a>`,
      last: `<span class="mono">${clock(state.lastPullAt)}</span> <span class="never-tag quiet">· ${timeAgo(
        state.lastPullAt,
        now
      )}</span>`,
    };
  }
  if (state.kind === "current-never") {
    return {
      rowClass: " class=\"never-pulled-live\"",
      pulls: `<span class="never-tag">never pulled</span>`,
      last: `<span class="never-tag">current since ${timeAgo(publication.created_at, now)}, not fetched${
        state.pollsWhileCurrent ? ` after ${state.pollsWhileCurrent} poll(s)` : ""
      }</span>`,
    };
  }
  if (state.kind === "superseded-never") {
    return {
      rowClass: "",
      pulls: `<span class="never-tag quiet">never pulled</span>`,
      last: `<span class="never-tag quiet">superseded ${
        state.supersededAt ? timeAgoBetween(publication.created_at, state.supersededAt) : ""
      } after publish, before anything checked in</span>`,
    };
  }
  return {
    rowClass: "",
    pulls: `<span class="never-tag">never pulled</span>`,
    last: `<span class="never-tag">${state.pollsWhileCurrent} poll(s) while it was current, never fetched</span>`,
  };
}

function timeAgoBetween(from, to) {
  const mins = Math.max(0, Math.round((new Date(to) - new Date(from)) / 60000));
  if (mins < 60) return `${mins}m`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h`;
  return `${Math.floor(hours / 24)}d`;
}

// The banner for the one state that is a fault. Rendered only when it is
// true, like builder's integrity banner: a panel that is always there is a
// panel nobody reads.
export function neverPulledBanner(publication, state, { now = new Date() } = {}) {
  if (!publication || state.kind !== "current-never") return "";
  const href = `${PULLS_PATH}?window=all&build=${encodeURIComponent(publication.build_id)}`;
  return `<div class="panel" style="border-color:var(--warn); margin-bottom:16px;">
  <div class="panel-pad" style="display:flex;gap:12px;align-items:flex-start;">
    <span style="color:var(--warn);font-size:16px;line-height:1.2">⚠</span>
    <div style="font-size:12.5px;line-height:1.6">
      <b style="color:var(--text)">The current build has never been pulled.</b>
      <code>${escapeHtml(publication.build_id)}</code> has been the build in <code>current.json</code> since ${timeAgo(
    publication.created_at,
    now
  )}${
    state.pollsWhileCurrent ? ` and something has polled <code>current.json</code> ${state.pollsWhileCurrent} time(s) since` : ""
  } — but <code>/ota/bundle/${escapeHtml(publication.build_id)}.js</code> has never been fetched.
      <a href="${href}">Open its pull log →</a>
    </div>
  </div>
</div>`;
}
