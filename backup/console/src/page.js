// The /backup/ page. Built to mockups/backup-console.html, which the operator
// accepted on the first pass — health banner above the run control, the phase
// indication during a run, run history and commit history as expandable rows,
// sources read-only, settings as three fields, restore commands last.
//
// ONE RENDERER, SERVER SIDE. The page is re-rendered by this same function for
// every poll (`GET /backup/api/view` returns the content area's markup, which
// the client swaps in), so there is no second client-side copy of any of this
// to drift from it. What the client script owns is only what a server cannot:
// which rows are expanded, the theme choice, and the fetches.
//
// WHAT IS DELIBERATELY NOT HERE. The mockup also shows a "Userdata exports"
// panel and a restore step for importing per-account JSON, both marked `new`.
// Those belong to `userdata-git-history`, which ships next and is the
// authority on them; building them here would mean inventing a committed
// export that does not exist yet and showing the operator an empty panel for
// a feature nothing produces. The sources table derives its rows from what is
// really in the repository, so `userdata/` appears on its own the moment that
// change lands.
import { escapeHtml, renderRail } from "../../../libs/jsservice/layout.js";

export const PREFIX = "/backup";

export const RAIL = [
  {
    group: "Backup",
    items: [
      { href: "#health", label: "Overview" },
      { href: "#runs", label: "Run history" },
    ],
  },
  {
    group: "Data",
    items: [
      { href: "#sources", label: "Sources" },
      { href: "#exports", label: "Account documents" },
      { href: "#commits", label: "Commit history" },
    ],
  },
  {
    group: "Operate",
    items: [
      { href: "#settings", label: "Settings" },
      { href: "#restore", label: "Restore" },
    ],
  },
];

export function rail(activeHref) {
  return renderRail(RAIL, activeHref);
}

// ---- formatting ----------------------------------------------------------
// Every one of these returns an explicit "never" / "unknown" rather than a
// zero or a dash when the underlying fact is absent. A zero age reads as a
// backup that just succeeded.

function bytes(n) {
  if (n === null || n === undefined || Number.isNaN(Number(n))) return "—";
  const v = Number(n);
  if (v < 1024) return `${v} B`;
  if (v < 1024 * 1024) return `${(v / 1024).toFixed(1)} KB`;
  if (v < 1024 * 1024 * 1024) return `${(v / 1024 / 1024).toFixed(1)} MB`;
  return `${(v / 1024 / 1024 / 1024).toFixed(2)} GB`;
}

function signedBytes(n) {
  if (n === null || n === undefined) return null;
  if (n === 0) return "no change";
  return `${n > 0 ? "+" : "−"}${bytes(Math.abs(n))}`;
}

function count(n) {
  return n === null || n === undefined ? "—" : Number(n).toLocaleString("en-US");
}

function duration(seconds) {
  if (seconds === null || seconds === undefined) return "—";
  const s = Math.max(0, Math.round(seconds));
  if (s < 60) return `${s}s`;
  const m = Math.floor(s / 60);
  if (m < 60) return `${m}m ${String(s % 60).padStart(2, "0")}s`;
  const h = Math.floor(m / 60);
  if (h < 24) return `${h}h ${String(m % 60).padStart(2, "0")}m`;
  return `${Math.floor(h / 24)}d ${h % 24}h`;
}

function stamp(epoch) {
  if (!epoch) return "—";
  return new Date(epoch * 1000).toISOString().replace("T", " ").replace(/\.\d+Z$/, "Z");
}

function isoShort(iso) {
  if (!iso) return "—";
  return String(iso).replace("T", " ").replace(/\.\d+Z$/, "Z");
}

const OUTCOME_PILL = {
  committed: ["success", "pill-ok"],
  "no-changes": ["no changes", "pill-neutral"],
  "push-recovered": ["recovered", "pill-warn"],
  failed: ["failed", "pill-err"],
  unknown: ["unclear", "pill-warn"],
};

// ---- the live phase rail --------------------------------------------------
// Derived from the run's own captured log, not from a progress channel the
// backup service does not have. Five phases, matching the five things
// run_backup logs. The export phase was the mockup's fifth cell, left unbuilt
// by `backup-console` because nothing produced an export yet;
// `userdata-git-history` is what fills it in.
const PHASES = [
  { label: "dumping databases", test: (t) => /entrypoint: dumping /.test(t) },
  { label: "mirroring blobs · audio", test: (t) => /entrypoint: syncing /.test(t) },
  { label: "exporting accounts", test: (t) => /entrypoint: exporting account documents/.test(t) },
  { label: "committing", test: (t) => /no changes, nothing to commit|retrying push|git add|committed and pushed/.test(t) },
  { label: "pushing", test: (t) => /committed and pushed|pushed previously-committed|push/.test(t) },
];

function phaseIndex(logText) {
  let index = 0;
  for (let i = 0; i < PHASES.length; i += 1) {
    if (PHASES[i].test(logText || "")) index = i;
  }
  return index;
}

function renderPhases(logText) {
  const now = phaseIndex(logText);
  return `<div class="phases">${PHASES.map((p, i) => {
    const cls = i < now ? "done" : i === now ? "now" : "";
    return `<div class="ph ${cls}"><span class="n">${i + 1}</span>${escapeHtml(p.label)}</div>`;
  }).join("")}</div>`;
}

// Colourises a captured log the way the mockup does: the FATAL and run-FAILED
// lines loud, the success line green, pg_dump/ssh output dimmed. The text is
// escaped first and only then wrapped, so nothing in a log line can inject
// markup.
function logBox(text, extra = "") {
  const lines = String(text || "").trimEnd().split("\n").map((line) => {
    const safe = escapeHtml(line);
    if (/FATAL|run FAILED/.test(line)) return `<span class="err">${safe}</span>`;
    if (/committed and pushed|pushed previously-committed/.test(line)) return `<span class="ok">${safe}</span>`;
    if (/WARNING|retrying push/.test(line)) return `<span class="warn">${safe}</span>`;
    if (/^(pg_dump|ssh|fatal|error)/i.test(line)) return `<span class="dim">${safe}</span>`;
    return safe;
  });
  return `<div class="logbox"${extra}>${lines.join("\n")}</div>`;
}

// ---- 1. the health banner -------------------------------------------------

function healthBanner(s) {
  const h = s.health;
  const unpushed = s.git.present ? s.git.unpushed : null;
  let cls;
  let ico;
  let pill;
  let head;
  let sub;

  if (h.state === "never") {
    // NO AGE AND NO TIMESTAMP HERE, deliberately. There is no success to date,
    // and rendering an unknown as "0s ago" is how a service that has backed up
    // nothing comes to look like one that just succeeded.
    // ITS OWN STATE, NOT state-fail's. These two were rendered identically —
    // same class, same ✕, same solid red — and they are different situations:
    // a FAILED run still leaves an older good backup on the remote, while
    // "never completed" means NOTHING EXISTS ANYWHERE. Telling them apart by
    // reading the headline is exactly the "glance at the banner" case this
    // panel is for, so the distinction is carried by the border style and the
    // glyph too (acceptance criterion 12; found in testing, 2026-11-26).
    cls = "state-never";
    ico = "∅";
    pill = ["no backup has ever completed", "pill-err"];
    head = "No backup has EVER completed";
    sub = `Nothing has been pushed to the remote by this service — not an old backup, not a partial one. ${s.runsTotal ? "Open the newest run below for the reason." : "No run has been recorded either."}`;
  } else if (h.state === "fail") {
    // THE FAILURE IS THE PRIMARY STATE, ahead of any older success — showing
    // a stale success as the current state is this ecosystem's signature
    // defect. When the failure LEFT COMMITS BEHIND, the headline says so:
    // "the push failed" and "the remote is stale" are the same incident and
    // the operator needs the count in front of him, not one state hiding the
    // other.
    cls = "state-fail";
    ico = "✕";
    pill = [unpushed > 0 ? "run failed · remote stale" : "run failed", "pill-err"];
    head = unpushed > 0
      ? `Last run FAILED — committed locally, so the remote is STALE (${unpushed} unpushed commit${unpushed === 1 ? "" : "s"})`
      : "Last run FAILED — nothing was backed up this cycle";
    sub = unpushed > 0
      ? `${unpushed} commit${unpushed === 1 ? "" : "s"} exist only inside the backup container — <b>losing the host loses them.</b> Last on the remote: <b>${escapeHtml(stamp(h.stampEpoch))}</b>. Retry ${h.nextRunEpoch ? `due <b>${escapeHtml(stamp(h.nextRunEpoch))}</b>` : `in ${duration(h.retrySeconds)}`}.`
      : `Nothing was committed this cycle. Last on the remote: <b>${escapeHtml(stamp(h.stampEpoch))}</b>. Retry ${h.nextRunEpoch ? `due <b>${escapeHtml(stamp(h.nextRunEpoch))}</b>` : `in ${duration(h.retrySeconds)}`}.`;
  } else if (h.state === "stale" && unpushed > 0) {
    cls = "state-stale";
    ico = "!";
    pill = ["remote stale", "pill-warn"];
    head = "Committed locally — but the push has not landed, so the remote is STALE";
    sub = `${unpushed} local commit${unpushed === 1 ? "" : "s"} exist only inside the backup container. <b>Losing the host loses them.</b>`;
  } else if (h.state === "stale") {
    cls = "state-stale";
    ico = "!";
    pill = ["overdue", "pill-warn"];
    head = "The last successful backup is older than one scheduled interval";
    sub = `age ${duration(h.ageSeconds)} against a limit of ${duration(h.limitSeconds)}. ${s.scheduler.known ? "The scheduler is running." : "<b>The backup service's own state cannot be determined.</b>"}`;
  } else {
    cls = "state-ok";
    ico = "✓";
    pill = ["healthy", "pill-ok"];
    head = "Backed up";
    sub = "dumps · mirrors · commit · push";
  }

  const nextCell = s.scheduler.known && h.nextRunEpoch
    ? `<div class="v${h.state === "fail" ? " warny" : ""}">in ${duration(h.nextRunEpoch - s.nowEpoch)}</div>
       <div class="x">${escapeHtml(stamp(h.nextRunEpoch))} · ${escapeHtml(s.scheduler.nextRunReason === "retry" ? `retry interval ${duration(h.retrySeconds)}` : `interval ${duration(h.intervalSeconds)}`)}</div>`
    : `<div class="v warny">unknown</div>
       <div class="x">the scheduler is not reporting</div>`;

  return `
<div class="hb ${cls}" id="health">
  <div class="hb-top">
    <div class="hb-ico">${ico}</div>
    <div class="hb-txt">
      <div class="h">${escapeHtml(head)}</div>
      <div class="s">${sub}</div>
    </div>
    <div class="hb-act">
      <span class="pill ${pill[1]}">${escapeHtml(pill[0])}</span>
      ${s.runs[0] ? `<button type="button" class="btn-ghost btn-sm" data-open-run="${escapeHtml(s.runs[0].id)}">Open last log ↓</button>` : ""}
    </div>
  </div>
  <div class="hb-strip">
    <div class="hb-cell">
      <div class="k">Last success</div>
      <div class="v${h.stampEpoch ? "" : " bad"}">${h.stampEpoch ? escapeHtml(stamp(h.stampEpoch)) : "never"}</div>
      <div class="x" title="stamp ${escapeHtml(s.environmentOnly.stamp)}">${h.stampEpoch ? `${escapeHtml(duration(h.ageSeconds))} ago` : `no success stamp exists`}</div>
    </div>
    <div class="hb-cell">
      <div class="k">Next run</div>
      ${nextCell}
    </div>
    <div class="hb-cell">
      <div class="k">Unpushed commits</div>
      <div class="v ${unpushed === null ? "warny" : unpushed > 0 ? "bad" : "good"}">${unpushed === null ? "unknown" : count(unpushed)}</div>
      <div class="x">${s.git.present
        ? unpushed > 0
          ? `HEAD <code>${escapeHtml(s.git.head || "?")}</code> ≠ <code>${escapeHtml(s.git.upstreamSha || "?")}</code>`
          : `HEAD = ${escapeHtml(s.git.upstream || "upstream")}`
        : "no clone to compare against"}</div>
    </div>
    <div class="hb-cell">
      <div class="k">Container health</div>
      <div class="v ${h.containerHealthy ? "good" : "bad"}">${h.containerHealthy ? "healthy" : "UNHEALTHY"}</div>
      <div class="x" title="the limit is the stored interval plus a quarter of it">${h.stampEpoch
        ? `age ${count(h.ageSeconds)}s / limit ${count(h.limitSeconds)}s`
        : `healthcheck.sh exits 1 while no run has completed`}</div>
    </div>
  </div>
  ${h.quote ? logBox(h.quote, ' style="border:0;border-top:1px solid var(--border);border-radius:0;max-height:120px"') : ""}
</div>`;
}

// ---- 0. the degradation report -------------------------------------------
// Conditions, not errors: the page serves and says what it cannot see.

function conditions(s) {
  if (!s.conditions.length) return "";
  return `
<div class="panel panel-pad" id="conditions" style="border-color:var(--warn);margin-bottom:16px">
  <div style="font-size:12.5px;font-weight:650;margin-bottom:6px">This console is reporting ${s.conditions.length} condition${s.conditions.length === 1 ? "" : "s"}</div>
  <ul style="margin:0;padding-left:18px;font-size:12.5px;color:var(--text-dim);line-height:1.7">
    ${s.conditions.map((c) => `<li>${c.text}</li>`).join("\n    ")}
  </ul>
</div>`;
}

// ---- 2. run now ----------------------------------------------------------

function runNow(s) {
  const sch = s.scheduler;
  const queued = sch.queued;
  const running = sch.state === "running" || (sch.claimed && sch.state !== "sleeping");
  const liveLog = running && sch.currentRun ? s.liveLog : null;

  let state;
  let hint;
  let disabled = false;
  if (queued) {
    state = `<span class="pill pill-warn">queued</span>`;
    // QUEUED, NOT RUNNING. The request is a file; the scheduler claims it on
    // its next tick. Reporting it as running before it has started is the
    // failure shape this page is written against.
    hint = `waiting for the scheduler to claim it${sch.tickSeconds ? ` (it looks every ${sch.tickSeconds}s)` : ""} — nothing has started yet`;
    disabled = true;
  } else if (running) {
    state = `<span class="pill pill-warn">running</span>`;
    hint = `run <code>${escapeHtml(sch.currentRun || "")}</code> is in progress in the backup service`;
    disabled = true;
  } else if (!sch.known) {
    state = `<span class="pill pill-err">scheduler unknown</span>`;
    hint = "not reporting — a request would sit unclaimed; start the service first";
    disabled = true;
  } else {
    state = "";
    hint = "dumps → mirrors → commit → push";
  }

  const last = s.runs[0];
  const pill = last ? OUTCOME_PILL[last.outcome] || OUTCOME_PILL.unknown : null;

  return `
<div class="panel" id="runnow">
  <div class="panel-head">
    <h3 title="identical to the scheduled run — the console itself never dumps, commits or pushes">Run now</h3>
  </div>
  <div class="panel-pad">
    <div class="toolbar" style="margin-bottom:12px">
      <button type="button" class="btn-primary" id="run-btn"${disabled ? " disabled" : ""}>Run full backup</button>
      ${state}
      <span class="inline-note" style="margin:0" id="run-hint">${escapeHtml(hint)}</span>
    </div>
    ${running ? renderPhases(liveLog) : ""}
    ${running && liveLog ? logBox(liveLog) : ""}
    ${!running && !queued && last
      ? `<div class="run-collapsed">
      <span class="pill ${pill[1]}">${escapeHtml(pill[0])}</span>
      <span class="big">${escapeHtml(duration(last.duration_seconds))}</span>
      <span>${escapeHtml(last.summary || "")}</span>
      <span style="color:var(--text-faint)" title="trigger: ${escapeHtml(last.trigger)}">${last.head ? `<code>${escapeHtml(last.head)}</code>` : ""} · ${escapeHtml(last.trigger)}</span>
      <span class="spacer"></span>
      <button type="button" class="btn-sm" data-open-run="${escapeHtml(last.id)}">Show log</button>
    </div>`
      : ""}
  </div>
</div>`;
}

// ---- 3. run history ------------------------------------------------------

function runHistory(s) {
  const rows = s.runs.map((r) => {
    const pill = OUTCOME_PILL[r.outcome] || OUTCOME_PILL.unknown;
    const failed = r.outcome === "failed";
    return `
  <details class="row-x${failed ? " failed" : ""}" id="run-${escapeHtml(r.id)}" data-run="${escapeHtml(r.id)}">
    <summary class="run-sum">
      <span class="chev">▸</span>
      <span class="when">${escapeHtml(isoShort(r.started_at))}</span>
      <span class="dur">${escapeHtml(duration(r.duration_seconds))}</span>
      <span><span class="pill ${pill[1]}">${escapeHtml(pill[0])}</span></span>
      <span class="what"${failed ? ' style="color:var(--err);font-weight:650"' : ""}>${escapeHtml(r.summary || "")}</span>
    </summary>
    <div class="row-body">
      <div class="meta">
        <span>trigger <b>${escapeHtml(r.trigger || "?")}</b></span>
        <span>commit <b>${escapeHtml(r.head || "—")}</b></span>
        <span>pushed <b>${r.pushed === true ? "yes" : r.pushed === false ? "no" : "unknown"}</b></span>
        <span>unpushed after <b>${count(r.unpushed)}</b></span>
        <span>repo <b>${escapeHtml(bytes(r.repo_bytes))}</b> + git <b>${escapeHtml(bytes(r.git_bytes))}</b></span>
        <span>exit <b>${count(r.exit_code)}</b></span>
      </div>
      <div data-log-for="${escapeHtml(r.id)}">${
        r.logText === undefined
          ? `<div class="inline-note">loading this run's captured log…</div>`
          : r.logText === null
            ? `<div class="inline-note">this run's log file is no longer on the state volume</div>`
            : logBox(r.logText)
      }</div>
    </div>
  </details>`;
  });

  return `
<div class="section-head" id="runs">
  <h3>Run history</h3>
  <span class="note" title="one record + one log per run under ${escapeHtml(s.environmentOnly.stateDir)}/runs/">${count(s.runs.length)} of ${count(s.runsTotal)} retained · retention ${count(s.retention)}</span>
</div>
<div class="panel">
  ${rows.length ? rows.join("\n") : `<div class="panel-pad"><div class="inline-note">No run has been recorded yet.</div></div>`}
  ${s.runsTotal > s.runs.length
    ? `<div class="panel-head" style="border-bottom:0;border-top:1px solid var(--border-soft)">
    <span class="note" title="records older than the retention window are pruned; the commits are not">${count(s.runs.length)} of ${count(s.runsTotal)}</span>
    <button type="button" class="btn-sm" id="more-runs">Load 20 more</button>
  </div>`
    : ""}
</div>`;
}

// ---- 4. sources ----------------------------------------------------------

function sources(s) {
  const rows = s.sources.map((src) => {
    if (src.kind === "excluded") {
      return `<tr>
        <td style="color:var(--text-faint)"><b>${escapeHtml(src.label)}</b></td>
        <td style="color:var(--text-faint)">—</td>
        <td class="num" style="color:var(--text-faint)">—</td>
        <td class="num" style="color:var(--text-faint)">—</td>
        <td style="color:var(--text-faint);white-space:normal">${src.note}</td>
      </tr>`;
    }
    const delta = src.fault
      ? `<span class="why" title="The run aborted rather than commit a green, mirror-nothing backup.">${escapeHtml(src.fault)}</span>`
      : src.deltaFiles
        ? `<span class="delta-good">${src.deltaFiles > 0 ? "+" : "−"}${count(Math.abs(src.deltaFiles))} files</span> <span style="color:var(--text-faint)">(${count(src.files - src.deltaFiles)} → ${count(src.files)})</span>`
        : src.deltaBytes
          ? `<span class="delta-good">${escapeHtml(signedBytes(src.deltaBytes))}</span>`
          : src.deltaBytes === null
            ? `<span class="delta-flat">no previous run</span>`
            : `<span class="delta-flat">no change</span>`;
    return `<tr${src.fault ? ' class="src-alarm"' : ""}>
      <td><b>${escapeHtml(src.label)}</b>${src.note ? `<div style="font-size:11.5px;color:var(--text-dim);white-space:normal">${src.note}</div>` : ""}</td>
      <td><code>${escapeHtml(src.key)}</code></td>
      <td class="num">${src.present ? escapeHtml(bytes(src.bytes)) : "missing"}</td>
      <td class="num">${src.kind === "mirror"
        ? `${count(src.files)}${src.sourceFiles !== null ? ` <span style="color:var(--text-faint)">mirror</span> / ${src.fault ? `<b style="color:var(--err)">${count(src.sourceFiles)}</b>` : count(src.sourceFiles)} <span style="color:var(--text-faint)">src</span>` : ""}`
        : "—"}</td>
      <td style="white-space:normal">${delta}</td>
    </tr>`;
  });

  return `
<div class="section-head" id="sources">
  <h3>Sources</h3>
  <span class="note" title="sizes read live from the clone${s.sources[0]?.asOf ? `; counts as of the run at ${escapeHtml(isoShort(s.sources[0].asOf))}` : ""}"><span class="ro-tag">read-only</span></span>
</div>
<div class="panel">
  <div class="table-wrap">
    <table>
      <thead>
        <tr><th>source</th><th>in the repo</th><th class="num">size</th><th class="num">files</th><th title="change since the previous run">change</th></tr>
      </thead>
      <tbody>${rows.join("\n")}</tbody>
    </table>
  </div>
  <div class="panel-head" style="border-bottom:0;border-top:1px solid var(--border-soft)">
    <span class="note" title="A source switched off is indistinguishable, afterwards, from one that silently stopped being backed up.">repo ${escapeHtml(bytes(s.runs[0]?.repo_bytes ?? null))} + git ${escapeHtml(bytes(s.runs[0]?.git_bytes ?? null))} · no exclude switch, deliberately</span>
  </div>
</div>`;
}


// ---- 4b. the account export (userdata-git-history task 2.6) --------------
//
// WHY THIS PANEL IS NOT JUST ANOTHER SOURCE ROW. Every other source is a copy
// of something that still exists somewhere else — lose `stabbur.sql` and the
// live database is still there. These files are the ARCHIVE OF RECORD: the
// account tables' data is excluded from `mjolnir.sql`, so a restore of the
// dump yields two empty tables and the operator's learning progress comes
// from here and nowhere else. The three facts that matter are therefore not
// "how big" but WHEN IT LAST CHANGED and HOW MANY VERSIONS EXIST — git's
// history is the document's history, which is the whole design.

function exportsPanel(s) {
  const ex = s.exports || { present: false, files: [], total: 0 };
  const head = `
<div class="section-head" id="exports">
  <h3>Account documents</h3>
  <span class="note" title="one mutable file per account — git's own history is the document's history"><span class="ro-tag">read-only</span></span>
</div>`;

  if (!ex.present || ex.total === 0) {
    return `${head}
<div class="panel panel-pad">
  <span class="note" title="The export runs as part of every backup run, immediately before the commit. Until the first one completes, userdata_history's rolling window is the only copy of recent progress.">nothing exported yet — <code>userdata/</code> does not exist in the clone</span>
</div>`;
  }

  const rows = ex.files.map((f) => `<tr>
      <td><code>userdata/${escapeHtml(f.name)}</code></td>
      <td class="num">${escapeHtml(bytes(f.bytes))}</td>
      <td>${f.lastEpoch ? `${escapeHtml(stamp(f.lastEpoch))} <span style="color:var(--text-faint)">${escapeHtml(f.lastShort)}</span>` : '<span style="color:var(--text-faint)">never committed</span>'}</td>
      <td class="num">${f.commits ? `${ex.truncated ? "≥" : ""}${count(f.commits)}` : "—"}</td>
    </tr>`);

  return `${head}
<div class="panel">
  <div class="table-wrap">
    <table>
      <thead><tr><th>file</th><th class="num">size</th><th>last change</th><th class="num" title="commits touching this file">commits</th></tr></thead>
      <tbody>${rows.join("\n")}</tbody>
    </table>
  </div>
  <div class="panel-head" style="border-bottom:0;border-top:1px solid var(--border-soft)">
    <span class="note" title="Serialized with Postgres's own jsonb_pretty, whose key order is stable (by length, then bytewise), so one changed field is one changed line.">${count(ex.total)} account(s)${ex.truncated ? ` · commit counts are lower bounds` : ""}</span>
  </div>
</div>`;
}

// ---- 5. settings ---------------------------------------------------------

function settings(s) {
  const v = s.settings.values;
  const b = s.settings.bounds;
  const cell = (key, title, current, help, why = "") => `
    <div class="set-cell" data-set="${key}"${why ? ` title="${escapeHtml(why)}"` : ""}>
      <div class="k">${escapeHtml(title)}</div>
      <div class="cur">current ${escapeHtml(current)}</div>
      <div class="ctl">
        <input type="number" name="${key}" value="${v[key]}" min="${b[key].min}" max="${b[key].max}" step="1">
        <span class="unit">${key === "run_retention" ? "runs" : "seconds"}</span>
        <span class="inline-note" style="margin:0" data-human-for="${key}"></span>
      </div>
      <div class="src">${help}</div>
    </div>`;

  return `
<div class="section-head" id="settings">
  <h3>Settings</h3>
  <span class="note" title="stored by this service at ${escapeHtml(s.environmentOnly.stateDir)}/settings.json — the root .env is only the first-boot default">stored here, not in <code>.env</code></span>
</div>
<div class="panel panel-pad">
  <div class="set-grid">
    ${cell("interval_seconds", "Schedule interval", `${duration(v.interval_seconds)} (${count(v.interval_seconds)}s)`,
      `${s.settings.stored ? "" : "not stored yet — this is the seed · "}default <code>BACKUP_INTERVAL_SECONDS</code> ${count(s.settings.seeds.interval_seconds)}s`, "The container health limit follows this value: interval + interval/4.")}
    ${cell("retry_seconds", "Retry after a failure", `${duration(v.retry_seconds)} (${count(v.retry_seconds)}s)`,
      `${s.settings.stored ? "" : "not stored yet — this is the seed · "}default <code>BACKUP_RETRY_SECONDS</code> ${count(s.settings.seeds.retry_seconds)}s`, "Applies only after a failed run, never after a successful one.")}
    ${cell("run_retention", "Run-log retention", `${count(v.run_retention)} runs (${count(s.runsTotal)} on the volume)`,
      `${s.settings.stored ? "" : "not stored yet — this is the seed · "}prunes run logs only`, "Prunes the state volume's runs/ directory only. Commit history in the backup repository is never pruned.")}
  </div>
  <div class="save-bar">
    <button type="button" class="btn-primary" id="set-save" disabled>Save settings</button>
    <button type="button" class="btn-ghost btn-sm" id="set-revert" disabled>Revert</button>
    <span class="save-msg" id="set-msg">${s.settings.updatedAt ? `last saved ${escapeHtml(isoShort(s.settings.updatedAt))}${s.settings.updatedBy ? ` (${escapeHtml(s.settings.updatedBy)})` : ""}` : ""}</span>
  </div>
  <div class="ro-facts">
    <div class="ro-fact"><div class="k">Repo URL</div><div class="v">${escapeHtml(s.environmentOnly.repoUrl)}</div></div>
    <div class="ro-fact"><div class="k">Deploy key</div><div class="v">${escapeHtml(s.environmentOnly.sshKeyPath)}</div></div>
    <div class="ro-fact"><div class="k">Clone</div><div class="v">${escapeHtml(s.environmentOnly.clone)}</div></div>
  </div>
  <div class="inline-note" title="A console that can repoint the backup remote is a console that can silently stop backing up.">The repo URL, the deploy key and the database password are not editable here, by design.</div>
</div>`;
}

// ---- 6. commit history ---------------------------------------------------

function commits(s) {
  const rows = s.commits.map((c) => `
  <details class="row-x" id="commit-${escapeHtml(c.short)}" data-commit="${escapeHtml(c.short)}">
    <summary class="cm-sum">
      <span class="chev">▸</span>
      <span class="when">${escapeHtml(stamp(c.epoch))}</span>
      <span class="dur">${escapeHtml(c.short)}</span>
      <span class="what"><code>${escapeHtml(c.subject)}</code> · ${count(c.files.length)} file${c.files.length === 1 ? "" : "s"} changed</span>
      <span class="what" style="text-align:right">${c.onRemote === null ? "" : c.onRemote ? `<span class="pill pill-ok">on remote</span>` : `<span class="pill pill-warn">not pushed</span>`}</span>
    </summary>
    <div class="row-body">
      <div class="meta"><span>parent <b>${escapeHtml(c.parents[0] ? c.parents[0].slice(0, 7) : "— (root)")}</b></span><span>sha <b>${escapeHtml(c.sha)}</b></span></div>
      <div class="fileline"><span class="fh">path</span><span class="fh a">added</span><span class="fh d">removed</span></div>
      ${c.files.length
        ? c.files.map((f) => `<div class="fileline"><span class="p">${escapeHtml(f.path)}</span><span class="a">${f.binary ? "bin" : `+${f.added}`}</span><span class="d">${f.binary ? "bin" : `−${f.deleted}`}</span></div>`).join("\n      ")
        : `<div class="inline-note">no file changes recorded for this commit</div>`}
    </div>
  </details>`);

  return `
<div class="section-head" id="commits">
  <h3>Commit history</h3>
  <span class="note" title="newest first">${count(s.commits.length)} of ${count(s.commitsTotal)}</span>
</div>
<div class="panel">
  ${rows.length ? rows.join("\n") : `<div class="panel-pad"><div class="inline-note">${s.git.present ? "the clone holds no commits yet" : escapeHtml(s.git.reason || "there is no clone to read")}</div></div>`}
  ${s.commitsTotal > s.commits.length
    ? `<div class="panel-head" style="border-bottom:0;border-top:1px solid var(--border-soft)">
    <span class="note">${count(s.commits.length)} of ${count(s.commitsTotal)}</span>
    <button type="button" class="btn-sm" id="more-commits">Load 20 more</button>
  </div>`
    : ""}
</div>`;
}

// ---- 7. restore ----------------------------------------------------------
// The procedure per source, as commands to copy. The ON_ERROR_STOP warning is
// not decoration: without it psql reports success having skipped every failed
// statement, which is a restore that reports success having restored nothing.

function restore(s) {
  const url = s.environmentOnly.repoUrl;
  const head = s.git.head || "<sha>";
  const step = (n, title, why, cmd, warn = "") => `
  <div class="rs-step">
    <h4><span class="n">${n}</span>${title}</h4>
    <div class="why">${why}</div>
    <div class="cmd"><button type="button" class="btn-ghost btn-sm cp">Copy</button><pre>${cmd}</pre></div>
    ${warn ? `<div class="warnline">⚠ ${warn}</div>` : ""}
  </div>`;

  return `
<div class="section-head" id="restore">
  <h3>Restore</h3>
  <span class="note">run from a clone of the backup repository, at its root</span>
</div>
<details class="panel rs keepopen" id="restore-steps">
  <summary class="rs-sum">6 steps — clone · databases · account documents · blobs · audio · smia</summary>
  ${step(0, "Get the backup",
    "Any commit is a complete, self-consistent snapshot — pick one, do not merge two.",
    `git clone ${escapeHtml(url)} tun-backup
cd tun-backup
git log --oneline -5          <span class="c"># pick the commit to restore</span>
git checkout ${escapeHtml(head)}`)}
  ${step(1, "A database — <code>mjolnir</code> / <code>stabbur</code> / <code>phonexa</code> / <code>shadow</code>",
    "Restore into an EMPTY database and do <b>not</b> run <code>alembic upgrade head</code> first — each dump carries its own <code>CREATE TABLE</code>s and its <code>alembic_version</code> row.",
    `docker compose exec postgres \\
    psql -U tunadmin -d postgres -c 'DROP DATABASE phonexa' -c 'CREATE DATABASE phonexa OWNER phonexa'
<span class="c"># load as the SERVICE role, not the superuser (P42)</span>
docker compose exec -T postgres \\
    psql -v ON_ERROR_STOP=1 -U phonexa phonexa &lt; phonexa.sql`,
    "<code>ON_ERROR_STOP=1</code> is not optional — without it psql reports success having skipped every failed statement.")}
  ${step(2, "account documents — <code>userdata/</code>",
    "<b>Required, not optional.</b> <code>userdata</code> is excluded from <code>mjolnir.sql</code>, so step 1 yields EMPTY tables — these files are the only copy of the operator's progress. Run it before letting a device sync, or the device's next <code>GET</code> auto-creates factory defaults over an account that was never restored.",
    `<span class="c"># one file per account; the loop is the whole procedure</span>
for f in userdata/*.json; do
  uid=$(basename "$f" .json)
  docker compose exec -T postgres psql -v ON_ERROR_STOP=1 -U mjolnir -d mjolnir \\
      -v uid="$uid" -v doc="$(cat "$f")" &lt;&lt;'SQL'
INSERT INTO userdata (device_id, doc, updated_at) VALUES (:'uid', :'doc'::jsonb, now())
  ON CONFLICT (device_id) DO UPDATE SET doc = EXCLUDED.doc, updated_at = now();
SQL
done
<span class="c"># confirm: should print the archived document, not factory defaults</span>
curl -s -H "Authorization: Bearer $SYNC_TOKEN" \\
    "$TUN_PUBLIC_BASE/mjolnir/userdata/&lt;uid&gt;" | head -c 200`,
    "The SQL goes in on <b>stdin</b>, never via <code>psql -c</code>: <code>-c</code> is passed to the server verbatim and <code>:'uid'</code> would not be expanded. <code>userdata_history</code> is deliberately NOT restored — it is a rolling 48h window, not an archive.")}
  ${step(3, "stabbur blobs — <code>blobs/</code>",
    "Flat and content-addressed, so a copy by name is idempotent.",
    `docker compose cp blobs/. stabbur-backend:/blobs/`)}
  ${step(4, "phonexa audio — <code>phonexa-audio/</code>",
    "Plain file copy at the same relative paths. The mirror is copy-if-absent, so an edited sample holds its <b>pre-edit</b> audio and a deleted sample is still here (D147).",
    `docker compose cp phonexa-audio/. phonexa-backend:/data/audio/
<span class="c"># to refresh ONE file in the backup on purpose:</span>
docker compose exec backup rm ${escapeHtml(s.environmentOnly.clone.split(" @ ")[0])}/phonexa-audio/lang/nb/ingested/hus.wav`)}
  ${step(5, "smia — not here",
    "Deliberately not backed up. Recovery is a re-import; keep <code>smia/providers/</code> safe instead.",
    `docker compose exec smia-backend python -m scripts.bootstrap`)}
</details>`;
}

// ---- the content area, re-rendered on every poll -------------------------

export function renderContent(s) {
  return `
<div class="page-head">
  <div>
    <h2>Backup</h2>
    <div class="page-sub">4 databases · 2 file mirrors → <code>${escapeHtml(s.environmentOnly.repoUrl)}</code></div>
  </div>
  <div class="toolbar" style="margin:0">
    <span class="inline-note" style="margin:0" id="as-of">as of ${escapeHtml(isoShort(s.now))}</span>
    <button type="button" class="btn-sm" id="refresh">Refresh</button>
    <span class="theme-toggle" role="group" aria-label="Theme">
      <button type="button" data-theme="dark">Dark</button>
      <button type="button" data-theme="light">Light</button>
    </span>
  </div>
</div>
${conditions(s)}
${healthBanner(s)}
${runNow(s)}
${runHistory(s)}
${sources(s)}
${exportsPanel(s)}
${settings(s)}
${commits(s)}
${restore(s)}`;
}
