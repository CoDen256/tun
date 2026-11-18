// builder-ship-strips D-SS6: the publish run's state, DERIVED from what is
// already stored — never from what the page remembers about a click.
//
// `build_jobs` carries status / started_at / finished_at / error / build_id
// and `job_logs` carries that run's own narration lines, so nothing here
// needs a new table. Everything on this page's "run slot" is computed from
// those two, which is what makes the result survive a reload and makes a
// SCHEDULED run nobody watched report itself on the next page load.
//
// THE STALLED STATE EXISTS BECAUSE A SPINNER IS A SUCCESS-SHAPED DISPLAY OF
// A DEAD RUN. `runPublish` marks a job `failed` in its own `catch`, so a
// process that is killed (OOM, container restart, `docker compose down`
// mid-run) leaves the row `running` forever. Rendering that as ongoing
// progress is the same defect class as P45/P47: the UI looks healthy while
// nothing is happening. A `running` row that has stopped producing narration
// is therefore reported as `stalled`, loudly, with how long it has been
// quiet.

import { recentBuildJobs } from "./buildJobs.js";
import { jobLogLines } from "./jobLogs.js";

// Tier-2 decision (full-sweep DECISIONS-MADE): 5 minutes of silence. Every
// `runPublish` checkpoint — pull, assign, per-deck mint/stage/flush, blobs,
// assemble, publish — writes a `job_logs` row, and the slowest of them
// (assembling and hashing the bundle) is seconds, not minutes. 5 minutes is
// far outside normal narration spacing while still being noticed inside one
// coffee break.
export const STALL_AFTER_MS = 5 * 60 * 1000;

// The tail is a tail, not an archive: the full log already has its own page
// (`/builder/logs?job=<id>`), which every run banner links to.
const TAIL_LIMIT = 60;

async function shippedForBuild(pool, buildId) {
  if (!buildId) return { total: 0, byDeck: [] };
  const { rows } = await pool.query(
    `SELECT cs.deck_code, count(*) AS count
       FROM occurrence_shipments os
       JOIN card_slots cs ON cs.id = os.card_id
      WHERE os.build_id = $1
      GROUP BY cs.deck_code
      ORDER BY cs.deck_code`,
    [buildId]
  );
  const byDeck = rows.map((r) => ({ deckCode: r.deck_code, count: Number(r.count) }));
  return { total: byDeck.reduce((n, d) => n + d.count, 0), byDeck };
}

function msBetween(a, b) {
  if (!a || !b) return null;
  return new Date(b).getTime() - new Date(a).getTime();
}

// `jobs` is accepted (rather than always re-queried) because the page already
// loads `recentBuildJobs` for other reasons — one query, two readers, same
// discipline as `loadDeckMeta`/`loadShipOrders`.
export async function describeLastRun(pool, { jobs = null, now = Date.now(), stallAfterMs = STALL_AFTER_MS } = {}) {
  const rows = jobs || (await recentBuildJobs(pool, 10));
  // A run still in flight is the one the page cares about even if a later
  // row finished first (it cannot, today — runs are serial — but the state
  // machine must not depend on that).
  const running = rows.find((j) => j.status === "running");
  const job = running || rows[0] || null;
  if (!job) return { kind: "none", job: null, lines: [], logHref: null };

  const logHref = `?job=${job.id}`;
  const base = {
    job: {
      id: job.id,
      buildId: job.build_id || null,
      status: job.status,
      requestedAt: job.requested_at,
      startedAt: job.started_at,
      finishedAt: job.finished_at,
      error: job.error || null,
      durationMs: msBetween(job.started_at, job.finished_at),
    },
    logHref,
  };

  if (job.status === "running") {
    const all = await jobLogLines(pool, job.id);
    const lines = all.slice(-TAIL_LIMIT).map((l) => ({ at: l.at, line: l.line }));
    const lastAt = all.length ? all[all.length - 1].at : job.started_at || job.requested_at;
    const silentMs = lastAt ? now - new Date(lastAt).getTime() : null;
    const stalled = silentMs !== null && silentMs > stallAfterMs;
    return {
      ...base,
      kind: stalled ? "stalled" : "running",
      lines,
      lastLineAt: lastAt || null,
      silentMs,
    };
  }

  if (job.status === "failed") {
    return { ...base, kind: "failed", lines: [] };
  }

  return { ...base, kind: "succeeded", lines: [], shipped: await shippedForBuild(pool, job.build_id) };
}
