// syncTimeline.js — the Sync page's history panel: ONE chronological timeline
// at TWO fidelities (userdata-git-history task 6).
//
// WHAT THE TWO TIERS ARE, AND WHY THERE ARE TWO
//
//   recent   `userdata_history`, swept to a rolling 48h window, per-PATCH.
//            Answers "what did the phone just do?"
//   archive  the git history of `userdata/<uid>.json` in the backup repo,
//            one entry per backup run. Answers "how has progress moved over
//            weeks?"
//
// The operator reversed himself here deliberately and BOTH halves are
// load-bearing: shown that `userdata_history` fed a working per-PATCH
// timeline he chose to drop the table outright and let git be the only
// history; shown the daily-only replacement he reversed that and kept a short
// Postgres tail. `historyDeltas`, `summarizeDelta` and `historyDoc` are
// therefore KEPT, not deleted, and their vocabulary is reused by both tiers so
// the two read as one timeline.
//
// THE HORIZON IS LABELLED, AND THAT IS NOT DECORATION. A timeline whose
// resolution changes partway down without saying so misrepresents the data.
// So: a labelled divider carrying the actual horizon timestamp; fidelity
// marked ON THE ROWS (a left border, a dot style, a per-row badge), not only
// in a panel-level badge; and the archived tier's caveats — several syncs
// collapsing to one entry, a no-change period producing no entry, a
// changed-and-reverted value leaving no trace — stated INSIDE that tier,
// where they are true, instead of as a description of the whole panel.
//
// THE TIERS DEGRADE INDEPENDENTLY. The recent tier is a local Postgres read;
// the archived tier is a cross-service call to `backup-console`. When the
// archive is unreachable the recent tier must keep rendering in full — D157's
// "serve before you migrate" posture applied to a panel. Nothing in this file
// may let one tier's failure reach the other.
import { escapeHtml } from "../../../libs/jsservice/layout.js";

// Classes the shared layout STYLE does not already carry, lifted from the
// accepted mockup's own <style> block (mockups/device-pulls.html, surface 3).
// No new palette: every colour is an existing variable, so both themes work
// without a second set of rules.
export const SYNC_TIMELINE_STYLE = `
.fid-badge { font-size: 10px; font-weight: 700; letter-spacing: .05em; text-transform: uppercase; border-radius: 99px; padding: 2px 8px 3px; }
.fid-badge.patch { background: var(--ok-soft); color: var(--ok); border: 1px solid var(--ok); }
.fid-badge.daily { background: var(--accent-soft); color: var(--accent-text); border: 1px solid var(--accent); }
.tier-head { display: flex; align-items: baseline; gap: 10px; flex-wrap: wrap; padding: 2px 0 10px; }
.tier-head .tier-name { font-size: 12.5px; font-weight: 700; }
.tier-head .tier-src { font-size: 11.5px; color: var(--text-faint); font-family: var(--mono); }
.tier-div { margin: 16px 0 12px; border-top: 1px dashed var(--accent); padding-top: 11px; }
.tier-div .td-label { display: flex; gap: 10px; align-items: baseline; flex-wrap: wrap; font-size: 12.5px; font-weight: 700; color: var(--accent-text); }
.tier-div .td-when { font-family: var(--mono); font-weight: 600; color: var(--text-faint); font-size: 11.5px; }
.tl-row.patch-row { border-left: 2px solid var(--ok); padding-left: 12px; }
.tl-row.patch-row .tl-time { color: var(--text-dim); }
.tl-row.git-row { border-left: 2px dotted var(--accent); padding-left: 12px; }
.tl-row.git-row .tl-dot { background: transparent; border: 2px solid var(--accent); width: 6px; height: 6px; }
.grain-note { display: flex; gap: 10px; align-items: flex-start; background: var(--accent-soft); border: 1px solid var(--accent); border-radius: 8px; padding: 12px 14px; font-size: 12.5px; color: var(--text); line-height: 1.6; }
.grain-note .gn-icon { font-weight: 700; color: var(--accent-text); }
.grain-note b { font-weight: 700; }
.arch-chip { display: inline-flex; align-items: center; gap: 5px; font-size: 10.5px; font-weight: 650; font-family: var(--mono); padding: 1px 7px 2px; border-radius: 4px; border: 1px dashed var(--accent); color: var(--accent-text); background: transparent; cursor: pointer; }
.arch-chip:hover { background: var(--accent-soft); }
.arch-chip.pending { border: 1px dashed var(--border); color: var(--text-faint); cursor: default; }
.arch-chip.pending:hover { background: transparent; }
.arch-box { margin: 8px 0 2px; border: 1px dashed var(--accent); border-radius: var(--radius); background: var(--accent-soft); padding: 10px 12px; font-size: 12px; line-height: 1.6; color: var(--text-dim); }
.arch-box b { color: var(--text); }
.arch-box .ab-head { font-size: 11px; text-transform: uppercase; letter-spacing: .05em; font-weight: 700; color: var(--accent-text); margin-bottom: 4px; }
.arch-box ul { margin: 6px 0 0; padding-left: 18px; }
.arch-box li { margin: 2px 0; }
.arch-box details summary { cursor: pointer; }
.commit-sha { font-family: var(--mono); font-size: 11.5px; color: var(--text-faint); }
.tl-actions { display: flex; gap: 4px; margin-top: 4px; flex-wrap: wrap; }
.diffbox { margin: 8px 0 2px; border: 1px solid var(--border-soft); border-radius: var(--radius); background: var(--bg-sunken); overflow-x: auto; }
.diffbox pre { margin: 0; padding: 10px 14px; font-family: var(--mono); font-size: 12px; line-height: 1.55; white-space: pre; }
.diffbox .d-hdr { color: var(--text-faint); }
.diffbox .d-add { color: var(--ok); }
.diffbox .d-del { color: var(--err); }
.state-box { display: flex; gap: 12px; align-items: flex-start; border-radius: 8px; padding: 14px 16px; font-size: 12.5px; line-height: 1.6; }
.state-box.err { background: var(--err-soft); border: 1px solid var(--err); }
.state-box.neutral { background: var(--bg-sunken); border: 1px solid var(--border); color: var(--text-dim); }
.state-box .sb-icon { font-size: 16px; line-height: 1.2; }
.state-box b { color: var(--text); }
.flow-banner { font-size: 12.5px; color: var(--text-dim); background: var(--bg-sunken); border: 1px solid var(--border); border-radius: 8px; padding: 11px 14px; margin: 0 0 14px; line-height: 1.6; }
.flow-banner b { color: var(--text); }
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

function isoMinute(d) {
  return new Date(d).toISOString().slice(0, 16).replace("T", " ");
}

function deltaHtml(detail) {
  if (!detail || !detail.length) return "";
  return detail
    .map((d) =>
      d.up === null
        ? `<span>${escapeHtml(d.label)} <span class="tl-delta flat">${escapeHtml(d.text)}</span></span>`
        : `<span>${escapeHtml(d.label)} <span class="tl-delta ${d.up ? "up" : "flat"}">${escapeHtml(d.text)}</span></span>`
    )
    .join(" &nbsp; ");
}

// The archived tier's own summarizer, written to produce the SAME shape and
// the SAME words as `userdata.js`'s `summarizeDelta` — "Session completed",
// `completedSessions 41 → 42`, `totalCards +3` — so that one change does not
// read as two unrelated kinds of event depending on which tier shows it.
//
// It reads the COMMIT'S DIFF rather than two documents, which is only
// possible because the export is serialized one scalar per line. The
// consequence, and it is stated on the page rather than hidden here: at this
// resolution several syncs inside one backup period are one set of before/
// after values.
export function summarizeCommit(commit) {
  if (commit.created) {
    return {
      title: "Archive created",
      detail: [{ label: "first exported version", text: `${commit.cardsAdded} card occurrences`, up: null }],
    };
  }
  const detail = [];
  const sessions = commit.fields?.completedSessions;
  const sessionsChanged = !!sessions && sessions.from !== null && sessions.to !== null && sessions.from !== sessions.to;
  const cardsDelta = (commit.cardsAdded || 0) - (commit.cardsRemoved || 0);

  if (sessionsChanged) {
    detail.push({
      label: "completedSessions",
      text: `${sessions.from} → ${sessions.to}`,
      up: Number(sessions.to) > Number(sessions.from),
    });
  }
  if (cardsDelta !== 0) {
    detail.push({ label: "totalCards", text: `${cardsDelta > 0 ? "+" : ""}${cardsDelta}`, up: cardsDelta > 0 });
  }

  if (sessionsChanged && cardsDelta !== 0) return { title: "Session completed", detail };
  if (sessionsChanged) return { title: "Progress updated", detail };
  if (cardsDelta !== 0) return { title: "Cards updated", detail };

  const changed = Object.keys(commit.fields || {}).filter((k) => k !== "completedSessions");
  if (changed.length) {
    return {
      title: "Settings updated",
      detail: changed.slice(0, 4).map((k) => ({ label: k, text: "changed", up: null })),
    };
  }
  // A commit with no top-level field change and no card added or removed is a
  // change INSIDE a card — one card's Stage or interval moving. That is the
  // single most common real change, and the line counts are the honest
  // description of it.
  return {
    title: "Cards rescheduled",
    detail: [{ label: "lines", text: `+${commit.added} / −${commit.deleted}`, up: null }],
  };
}

// ---- the recent tier ------------------------------------------------------

// Which committed version first captured a given PATCH: the earliest archive
// commit made AFTER it. Used for the per-row "archived · <sha>" marker, which
// is how a recent entry and its archived counterpart are made discoverable
// WITHOUT rendering one change as two timeline events — the archived
// counterpart is a marker on the recent row, never a second row.
function archivedBy(atMs, commitsAscending) {
  for (const c of commitsAscending) {
    if (c.epoch * 1000 > atMs) return c;
  }
  return null;
}

function patchRowHtml(entry, uid, commitsAscending, recentEntries) {
  const atMs = new Date(entry.at).getTime();
  const dot = entry.title === "Account deleted" ? "warn" : entry.title === "Synced" ? "" : "ok";
  const commit = archivedBy(atMs, commitsAscending);
  const docUrl = `/mjolnir/device/doc?uid=${encodeURIComponent(uid)}&historyId=${encodeURIComponent(entry.id)}`;

  let chip;
  let box = "";
  if (commit) {
    const commitMs = commit.epoch * 1000;
    // Every PATCH this same commit swallowed — the merge is the thing the
    // operator cannot see from the archived tier alone, so it is spelled out
    // from the side that still knows it.
    const covered = recentEntries.filter((r) => {
      const t = new Date(r.at).getTime();
      const by = archivedBy(t, commitsAscending);
      return by && by.sha === commit.sha;
    });
    const summary = summarizeCommit(commit);
    chip = `<span class="arch-chip" title="see this same change at the archived tier's resolution">⇣ archived · ${escapeHtml(commit.short)}</span>`;
    box = `<details class="arch-box"><summary class="ab-head">the same change, one tier down</summary>
      <div>Commit <b>${escapeHtml(commit.short)}</b> (${escapeHtml(isoMinute(commitMs))} backup run) is the archived entry that captured this PATCH.
      It merged <b>${covered.length} PATCH${covered.length === 1 ? "" : "es"}</b> into one entry titled <b>${escapeHtml(summary.title)}</b>${summary.detail.length ? ` — ${deltaHtml(summary.detail)}` : ""}.</div>
      <ul>${covered
        .map((r) => `<li><span class="mono">${escapeHtml(new Date(r.at).toISOString().slice(0, 16).replace("T", " "))}</span> · ${escapeHtml(r.title)} ${deltaHtml(r.detail)}</li>`)
        .join("")}</ul>
      <div style="margin-top:6px">Once this window is swept, <b>only</b> the merged line survives — ${covered.length > 1 ? "the order and the per-PATCH split" : "the exact time of day"} above is what is lost.</div>
    </details>`;
  } else {
    chip = `<span class="arch-chip pending" title="no backup run has committed an export covering this PATCH yet">⌛ not archived yet</span>`;
  }

  return `<div class="tl-row patch-row">
    <div class="tl-time">${escapeHtml(new Date(entry.at).toISOString().slice(11, 19))}<br><span style="opacity:.8">${escapeHtml(new Date(entry.at).toISOString().slice(5, 10))}</span></div>
    <div class="tl-rail"><div class="tl-dot ${dot}"></div></div>
    <div>
      <div class="tl-title">${escapeHtml(entry.title)} <span class="chip">${escapeHtml(timeAgo(entry.at))}</span> <span class="fid-badge patch">per-PATCH</span> ${chip}</div>
      ${entry.detail.length ? `<div class="tl-detail">${deltaHtml(entry.detail)}</div>` : ""}
      <details class="json-toggle" style="margin-top:4px;" data-doc-url="${escapeHtml(docUrl)}">
        <summary>raw doc</summary>
        <pre>loading…</pre>
      </details>
      ${box}
    </div>
  </div>`;
}

// POSTGRES BEING DOWN IS NOT HANDLED HERE, DELIBERATELY. Hub already answers
// the whole Sync page with its D157 "database unavailable" page, above this
// renderer, so a branch here would be unreachable code pretending to be a
// safety net. What matters for criterion 43 is the consequence, and it holds:
// that page says the database is unavailable and makes no claim about the
// archive at all.
function recentTierHtml({ uid, recent, latestAt, retentionHours, commitsAscending }) {
  const head = `<div class="tier-head">
    <span class="tier-name">Last ${retentionHours} hours</span>
    <span class="fid-badge patch">per-PATCH · full fidelity</span>
    <span class="tier-src">userdata_history · Postgres</span>
  </div>`;

  if (!recent.length) {
    return `${head}<div class="state-box neutral" style="margin-bottom:4px"><span class="sb-icon">⌛</span><div>
      <b>No sync in the last ${retentionHours} hours.</b> The window is empty, not broken —
      <code>userdata_history</code> is swept to ${retentionHours}h, so an idle device leaves this tier blank while the archived tier below is untouched.
      ${latestAt ? `Last PATCH on record: <span class="mono">${escapeHtml(isoMinute(latestAt))}</span>.` : "This account has never written a history row."}
    </div></div>`;
  }

  return head + recent.map((e) => patchRowHtml(e, uid, commitsAscending, recent)).join("\n");
}

// ---- the archived tier ----------------------------------------------------

function gitRowHtml(commit, prev, uid) {
  const summary = summarizeCommit(commit);
  const at = new Date(commit.epoch * 1000);
  const docUrl = `/mjolnir/device/archive?uid=${encodeURIComponent(uid)}&sha=${encodeURIComponent(commit.sha)}`;
  const diffUrl = `${docUrl}&diff=1`;
  return `<div class="tl-row git-row">
    <div class="tl-time">${escapeHtml(at.toISOString().slice(0, 10))}<br><span style="opacity:.8">${escapeHtml(timeAgo(at))}</span></div>
    <div class="tl-rail"><div class="tl-dot"></div></div>
    <div>
      <div class="tl-title">${escapeHtml(summary.title)} <span class="commit-sha">${escapeHtml(commit.short)}</span>
        <span class="chip">${escapeHtml(at.toISOString().slice(11, 16))} backup run</span> <span class="fid-badge daily">one entry per backup run</span></div>
      ${summary.detail.length ? `<div class="tl-detail">${deltaHtml(summary.detail)}</div>` : ""}
      <div class="tl-actions">
        <details class="json-toggle" data-doc-url="${escapeHtml(docUrl)}"><summary>document</summary><pre>loading…</pre></details>
        <details class="json-toggle" data-diff-url="${escapeHtml(diffUrl)}"><summary>diff vs ${escapeHtml(prev ? new Date(prev.epoch * 1000).toISOString().slice(0, 10) : "—")}</summary><pre>loading…</pre></details>
      </div>
    </div>
  </div>`;
}

function archiveTierHtml({ uid, archive, horizonMs, retentionHours }) {
  const divider = `<div class="tier-div"><div class="td-label">
      <span>Older than ${retentionHours} h — swept, archived only</span>
      <span class="fid-badge daily">one entry per backup run</span>
      <span class="td-when">horizon ${escapeHtml(isoMinute(horizonMs))}</span>
    </div></div>`;

  // UNREACHABLE. Named, with a retry, and with an explicit statement that the
  // other tier is unaffected — because the failure mode this guards against
  // is a page-wide error that makes a backup outage look like data loss.
  if (!archive.ok) {
    return `${divider}<div class="state-box err"><span class="sb-icon" style="color:var(--err)">⚠</span><div>
      <b>Archived tier unavailable — ${archive.configured === false ? "no archive service is configured for this deployment" : "the backup service could not be reached"}.</b>
      ${escapeHtml(archive.reason || "no reason given")}${archive.url ? ` <code>${escapeHtml(archive.url)}</code>` : ""}.
      <div style="margin-top:6px">The ${retentionHours}h tier above is unaffected: it is a local Postgres read, and a backup outage degrades this half of the panel, never the page (D157).
      Nothing is lost — the commits still exist in the backup repository, they just cannot be listed right now.</div>
      <div style="margin-top:10px"><a class="btn" href="/mjolnir/device?uid=${encodeURIComponent(uid)}#sync-history">↻ Retry archived tier</a></div>
    </div></div>`;
  }

  // SORTED BY TIME, NOT BY TOPOLOGY. `git log` returns commits in graph
  // order, which is only coincidentally chronological; this is a timeline and
  // a timeline that is nearly sorted is worse than one that is not.
  const older = (archive.commits || [])
    .filter((c) => c.epoch * 1000 <= horizonMs)
    .sort((a, b) => b.epoch - a.epoch);

  // NOTHING ARCHIVED, which is a different fact from unreachable and says so.
  if (!archive.present || !(archive.commits || []).length) {
    return `${divider}<div class="state-box neutral"><span class="sb-icon">∅</span><div>
      <b>Nothing archived yet for this account.</b> <code>userdata/${escapeHtml(uid)}.json</code> does not exist in the backup repository yet,
      so the ${retentionHours}h tier above is the entire history there is.
      <div style="margin-top:6px">The backup service writes the export on its next run; the first archived entry appears after it.
      Until then, anything swept out of <code>userdata_history</code> is <b>gone</b> — the window is the only copy.</div>
    </div></div>`;
  }

  const caveat = `<div class="grain-note" style="margin:0 0 12px"><span class="gn-icon">⌛</span><div>
    <b>Below this line the resolution is one entry per backup run, and that is all there is.</b>
    The per-PATCH rows for these periods have been swept out of <code>userdata_history</code>; what remains is the git log of
    <code>userdata/${escapeHtml(uid)}.json</code>, which the backup service commits once per run. So several syncs inside one run's period are
    <b>one</b> entry, a period with no change is <b>no</b> entry, and a value that changed and changed back between two runs left no trace at all.
    Deltas are inferred by comparing consecutive commits — the same inference the tier above makes between consecutive PATCHes, over coarser input.
  </div></div>`;

  if (!older.length) {
    return `${divider}${caveat}<div class="state-box neutral"><span class="sb-icon">∅</span><div>
      <b>Every archived version is newer than the horizon.</b> ${(archive.commits || []).length} committed version(s) exist, but all of them fall inside the
      ${retentionHours}h window — so they are shown as the <span class="arch-chip pending">⇣ archived</span> marker on the per-PATCH rows above rather than as separate entries here,
      which is what keeps one change from being rendered as two events.
    </div></div>`;
  }

  return divider + caveat + older.map((c, i) => gitRowHtml(c, older[i + 1] || null, uid)).join("\n");
}

// ---- the panel ------------------------------------------------------------

export function renderSyncHistoryPanel({ uid, recent = [], latestAt = null, archive, retentionHours }) {
  const horizonMs = Date.now() - retentionHours * 3600 * 1000;
  // Ascending, because "which commit first captured this PATCH" is a
  // forward-looking question.
  const commitsAscending = archive.ok ? [...(archive.commits || [])].sort((a, b) => a.epoch - b.epoch) : [];

  const banner = `<div class="flow-banner">
    <b>Two tiers, one timeline.</b> The last ${retentionHours} hours are per-PATCH rows from <code>userdata_history</code> — kept, but swept to a rolling
    ${retentionHours}h window, and its data is excluded from <code>mjolnir.sql</code> (the export below is the long-term record, not the dump).
    Everything older is one entry per backup commit of <code>userdata/${escapeHtml(uid)}.json</code>.
    The two tiers read from different places and <b>fail independently</b>.
  </div>`;

  return `${banner}<div class="timeline">
${recentTierHtml({ uid, recent, latestAt, retentionHours, commitsAscending })}
${archiveTierHtml({ uid, archive, horizonMs, retentionHours })}
</div>
<div class="inline-note">Above the line: "raw doc" is that history row's full document (<code>historyDoc</code>), and "archived · &lt;sha&gt;" opens the same change as the archived tier recorded it.
Below the line: "document" is that commit's full export and "diff" is <code>git diff</code> against the previous commit — all fetched on demand, never inlined into this page.</div>`;
}
