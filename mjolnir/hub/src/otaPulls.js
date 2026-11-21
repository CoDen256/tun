import fs from "node:fs";
import path from "node:path";
import zlib from "node:zlib";
import crypto from "node:crypto";
import { query } from "./db.js";

// ota-pull-tracking — reading the gateway's OTA access log into `ota_pulls`.
//
// WHY INGEST LIVES HERE AT ALL. `/ota/*` is served off disk by `caddy` with
// no process and no database in the path, and the device plane is frozen
// (docs/11-ota-contract.md). The gateway is therefore the only thing in the
// stack that can see a bundle download, and the only way to see it without
// touching a byte the device receives is to read what the gateway already
// writes. The device-reporting alternative was built, shipped and dropped as
// permanently empty (D126) — see 021_ota_pulls.sql.
//
// WHY IN HUB. The pull data is about build ids, which only hub knows, and hub
// already owns the `mjolnir` schema and its migrations (exactly one service
// migrates each database, and hub's migrate holds an advisory lock across the
// whole run after a second instance raced itself — P58).
//
// THE FILE IS A TRANSPORT, THE TABLE IS THE RECORD. Caddy rolls the log, the
// volume can be recreated, the container restarts; none of that may lose or
// duplicate an event. So every insert is `ON CONFLICT (dedup_key) DO
// NOTHING`, which makes re-reading a whole file free of consequence and
// removes any need for a durable file offset.
//
// NOTHING HERE MAY THROW INTO A PAGE OR A REQUEST. Hub mounts the log
// READ-ONLY and the mount may be missing entirely; a console that 500s
// because a log directory is absent would be observation turning itself into
// a dependency one level up from the gateway.

const LOG_FILE_RE = /^ota-pulls.*\.log(\.gz)?$/;

// Caddy's own path shapes, and the only two kinds this table holds
// (design.md §4). Anything else under /ota/* — notably
// /ota/<buildId>/audio.json, the audio snapshot the prefetcher reads — is
// deliberately NOT recorded: it is an audio fetch rather than a build
// adoption or a liveness ping, which is the same reason /blob/* and
// /audio-manifest/* are out of scope, and inventing a third kind would blur
// the two the design froze.
const BUNDLE_RE = /^\/ota\/bundle\/(.+)\.js$/;
const CURRENT_PATH = "/ota/current.json";
// Permissive on purpose: a bogus build id in a request is itself worth
// seeing, so the row is still recorded as a bundle request with no build.
const BUILD_ID_SAFE = /^[A-Za-z0-9._-]{1,64}$/;

// Per-file read state, in memory only. Losing it (a restart) costs a re-read,
// never a duplicate, because `dedup_key` is content-derived — which is the
// whole reason the resume story needs no file on disk.
const fileCursors = new Map();

let lastIngestAt = 0;
let inFlight = null;

export function otaPullLogDir() {
  // No default. A guessed path is a path that can be silently wrong, and with
  // this unset the only consequence is that no pull is recorded — the value
  // is typed next to its own mount in mjolnir/compose.yaml.
  return process.env.OTA_PULL_LOG_DIR || null;
}

function classify(uri) {
  const pathOnly = uri.split("?")[0];
  if (pathOnly === CURRENT_PATH) return { kind: "poll", buildId: null };
  const m = BUNDLE_RE.exec(pathOnly);
  if (m) return { kind: "bundle", buildId: BUILD_ID_SAFE.test(m[1]) ? m[1] : null };
  return null;
}

// One log line -> one event, or null for anything unparseable or out of
// scope. Defensive about every field: this is a file written by another
// process and read by this one, so a format change must degrade to "no new
// rows", never to a crash.
export function parseLogLine(line) {
  const trimmed = line.trim();
  if (!trimmed) return null;
  let rec;
  try {
    rec = JSON.parse(trimmed);
  } catch {
    return null;
  }
  const req = rec.request;
  if (!req || typeof req.uri !== "string" || typeof rec.ts !== "number") return null;
  if (typeof rec.status !== "number") return null;
  const cls = classify(req.uri);
  if (!cls) return null;

  const addr = req.client_ip || req.remote_ip || "unknown";
  const port = req.remote_port || "";
  const method = typeof req.method === "string" ? req.method : "?";
  const size = typeof rec.size === "number" ? rec.size : null;

  // The dedup key. `ts` is Caddy's float seconds and carries sub-microsecond
  // precision; combined with the source port it identifies one request even
  // when a NAT'd home connection issues several in the same millisecond.
  const dedupKey = crypto
    .createHash("sha256")
    .update(`${rec.ts}|${addr}:${port}|${method}|${req.uri}|${rec.status}|${size === null ? "" : size}`)
    .digest("hex");

  return {
    dedupKey,
    kind: cls.kind,
    buildId: cls.buildId,
    eventAt: new Date(rec.ts * 1000),
    status: rec.status,
    bytes: size,
    method,
    uri: req.uri,
    sourceAddr: addr,
  };
}

// Read the new bytes of one file. Returns the text and the offset to remember.
//
// TRUNCATION AND ROLLING ARE NORMAL, NOT ERRORS. If the file is shorter than
// where we stopped, Caddy rolled or something truncated it, and the correct
// response is to start again from zero — re-reading content already in the
// table costs nothing but the parse.
function readNewText(fullPath, stat) {
  if (fullPath.endsWith(".gz")) {
    // A rolled, compressed file never grows. Read it once per (size, mtime).
    const prev = fileCursors.get(fullPath);
    if (prev && prev.size === stat.size && prev.mtimeMs === stat.mtimeMs) return null;
    const text = zlib.gunzipSync(fs.readFileSync(fullPath)).toString("utf8");
    return { text, cursor: { size: stat.size, mtimeMs: stat.mtimeMs, offset: stat.size } };
  }

  const prev = fileCursors.get(fullPath);
  let start = prev && prev.offset <= stat.size ? prev.offset : 0;
  if (start === stat.size) return null;

  const fd = fs.openSync(fullPath, "r");
  try {
    const length = stat.size - start;
    const buf = Buffer.allocUnsafe(length);
    fs.readSync(fd, buf, 0, length, start);
    let text = buf.toString("utf8");
    // Stop at the last newline: the gateway may be mid-write, and half a JSON
    // line parsed now would be a line lost forever once the offset moved past
    // it.
    const lastNl = text.lastIndexOf("\n");
    if (lastNl === -1) return null;
    text = text.slice(0, lastNl + 1);
    return {
      text,
      cursor: { size: stat.size, mtimeMs: stat.mtimeMs, offset: start + Buffer.byteLength(text, "utf8") },
    };
  } finally {
    fs.closeSync(fd);
  }
}

async function insertEvents(events) {
  let inserted = 0;
  const CHUNK = 500;
  for (let i = 0; i < events.length; i += CHUNK) {
    const chunk = events.slice(i, i + CHUNK);
    const values = [];
    const params = [];
    chunk.forEach((e, idx) => {
      const b = idx * 9;
      values.push(`($${b + 1},$${b + 2},$${b + 3},$${b + 4},$${b + 5},$${b + 6},$${b + 7},$${b + 8},$${b + 9})`);
      params.push(e.dedupKey, e.kind, e.buildId, e.eventAt, e.status, e.bytes, e.method, e.uri, e.sourceAddr);
    });
    const { rowCount } = await query(
      `INSERT INTO ota_pulls (dedup_key, kind, build_id, event_at, status, bytes, method, uri, source_addr)
       VALUES ${values.join(",")}
       ON CONFLICT (dedup_key) DO NOTHING`,
      params
    );
    inserted += rowCount;
  }
  return inserted;
}

// Read every log file in the directory and insert what is not already there.
// Resolves to a small report; never rejects.
export async function ingestPulls({ logDir = otaPullLogDir() } = {}) {
  const report = { dir: logDir, files: 0, lines: 0, parsed: 0, inserted: 0, error: null };
  if (!logDir) {
    report.error = "OTA_PULL_LOG_DIR is not set";
    return report;
  }
  let names;
  try {
    names = fs.readdirSync(logDir).filter((n) => LOG_FILE_RE.test(n)).sort();
  } catch (err) {
    // The mount is absent, or unreadable. Not an error worth a page: it is
    // "there is nothing to ingest".
    report.error = err.code || err.message;
    return report;
  }

  const events = [];
  const cursorUpdates = [];
  for (const name of names) {
    const fullPath = path.join(logDir, name);
    let stat;
    try {
      stat = fs.statSync(fullPath);
    } catch {
      continue;
    }
    if (!stat.isFile()) continue;
    report.files += 1;
    let chunk;
    try {
      chunk = readNewText(fullPath, stat);
    } catch (err) {
      report.error = `${name}: ${err.code || err.message}`;
      continue;
    }
    if (!chunk) continue;
    const lines = chunk.text.split("\n");
    for (const line of lines) {
      if (!line.trim()) continue;
      report.lines += 1;
      const ev = parseLogLine(line);
      if (ev) events.push(ev);
    }
    cursorUpdates.push([fullPath, chunk.cursor]);
  }
  report.parsed = events.length;

  if (events.length) {
    try {
      report.inserted = await insertEvents(events);
    } catch (err) {
      // The database is the one thing worth NOT advancing the cursor for: the
      // same bytes must be re-read on the next attempt.
      report.error = err.message;
      return report;
    }
  }
  // Only advance cursors once the rows are safely in (or there were none).
  for (const [p, cursor] of cursorUpdates) fileCursors.set(p, cursor);
  return report;
}

// The ingest trigger (3.6, tier 2): page loads pull, with a cooldown, and a
// background interval covers the "nobody has the page open" case. There is no
// webhook and no inotify watch — the gateway must stay unaware that anything
// reads its log, and a 30-second lag on an operator page is invisible.
//
// `inFlight` collapses concurrent callers: two pages loading at once must not
// both walk the file.
export async function maybeIngest({ cooldownMs = 10000, logDir = otaPullLogDir() } = {}) {
  if (inFlight) return inFlight;
  if (Date.now() - lastIngestAt < cooldownMs) return null;
  lastIngestAt = Date.now();
  inFlight = (async () => {
    try {
      return await ingestPulls({ logDir });
    } catch (err) {
      // ingestPulls is written not to throw; this is the belt to its braces,
      // because the caller is a page render.
      return { dir: logDir, files: 0, lines: 0, parsed: 0, inserted: 0, error: err.message };
    } finally {
      inFlight = null;
    }
  })();
  return inFlight;
}

// Starts the background ingest. Returns a stop function.
export function startIngestLoop({ intervalMs = 60000 } = {}) {
  const tick = () => {
    maybeIngest({ cooldownMs: 0 }).then((r) => {
      if (r && r.inserted) console.log(`[ota-pulls] ingested ${r.inserted} event(s) from ${r.files} file(s)`);
    });
  };
  const timer = setInterval(tick, intervalMs);
  timer.unref?.();
  tick();
  return () => clearInterval(timer);
}

// ---- reads ---------------------------------------------------------------

// A SUCCESSFUL PULL IS A 200, AND ONLY A 200. A 206 is a resumed transfer of
// a pull that was already counted once (folding it in is what keeps a flaky
// connection from inflating the count); a 404 or 401 is not a pull at all.
const PULL_OK = "kind = 'bundle' AND status = 200";
// Liveness is a SUCCESSFUL poll. A 401 on /ota/current.json is an
// unauthenticated scan, which says nothing about the device being alive.
const POLL_OK = "kind = 'poll' AND status = 200";

export const WINDOWS = {
  "24h": { label: "last 24h", hours: 24 },
  "7d": { label: "last 7d", hours: 168 },
  "30d": { label: "last 30d", hours: 720 },
  all: { label: "all time", hours: null },
};

function windowClause(windowKey, params) {
  const w = WINDOWS[windowKey] || WINDOWS["30d"];
  if (w.hours === null) return "";
  params.push(`${w.hours} hours`);
  return ` AND event_at >= now() - $${params.length}::interval`;
}

export async function pullStats({ window: windowKey = "30d" } = {}) {
  const params = [];
  const win = windowClause(windowKey, params);
  const { rows } = await query(
    `SELECT
       (SELECT count(*) FROM ota_pulls WHERE ${PULL_OK}${win}) AS bundle_pulls,
       (SELECT count(DISTINCT build_id) FROM ota_pulls WHERE ${PULL_OK} AND build_id IS NOT NULL${win}) AS distinct_builds,
       (SELECT count(*) FROM ota_pulls WHERE ${POLL_OK}${win}) AS polls,
       (SELECT max(event_at) FROM ota_pulls WHERE ${PULL_OK}) AS last_pull_at,
       (SELECT build_id FROM ota_pulls WHERE ${PULL_OK} ORDER BY event_at DESC LIMIT 1) AS last_pull_build,
       (SELECT max(event_at) FROM ota_pulls WHERE ${POLL_OK}) AS last_poll_at,
       (SELECT count(*) FROM ota_pulls WHERE ${POLL_OK} AND event_at >= date_trunc('day', now())) AS polls_today,
       (SELECT count(*) FROM ota_pulls) AS total_rows`,
    params
  );
  const r = rows[0];
  return {
    bundlePulls: Number(r.bundle_pulls),
    distinctBuilds: Number(r.distinct_builds),
    polls: Number(r.polls),
    lastPullAt: r.last_pull_at,
    lastPullBuild: r.last_pull_build,
    lastPollAt: r.last_poll_at,
    pollsToday: Number(r.polls_today),
    totalRows: Number(r.total_rows),
  };
}

const SORTABLE = {
  ts: "event_at",
  kind: "kind",
  build: "build_id",
  status: "status",
  bytes: "bytes",
  source: "source_addr",
};

// The filters are built once, here, so the count and the listing can never
// disagree about what the operator asked for.
function eventFilters({ window: windowKey = "30d", kind = "all", build = "", source = "" } = {}) {
  const params = [];
  const where = ["1=1"];
  const win = windowClause(windowKey, params);
  if (win) where.push(win.replace(/^ AND /, ""));
  if (kind === "bundle" || kind === "poll") {
    params.push(kind);
    where.push(`kind = $${params.length}`);
  }
  if (build) {
    params.push(build);
    where.push(`build_id = $${params.length}`);
  }
  if (source) {
    params.push(`%${source}%`);
    where.push(`source_addr ILIKE $${params.length}`);
  }
  return { where: where.join(" AND "), params };
}

export async function countPullEvents(filters = {}) {
  const { where, params } = eventFilters(filters);
  const { rows } = await query(
    `SELECT count(*) AS n,
            count(*) FILTER (WHERE ${PULL_OK}) AS pulls,
            count(*) FILTER (WHERE kind = 'poll') AS polls
     FROM ota_pulls WHERE ${where}`,
    params
  );
  return { total: Number(rows[0].n), pulls: Number(rows[0].pulls), polls: Number(rows[0].polls) };
}

export async function listPullEvents(filters = {}) {
  const { sort = "ts", dir = "desc", limit = 4000 } = filters;
  const { where, params } = eventFilters(filters);
  const col = SORTABLE[sort] || "event_at";
  const order = dir === "asc" ? "ASC" : "DESC";
  params.push(limit);
  const { rows } = await query(
    `SELECT id, kind, build_id, event_at, status, bytes, method, uri, source_addr
     FROM ota_pulls
     WHERE ${where}
     ORDER BY ${col} ${order} NULLS LAST, event_at ${order}, id ${order}
     LIMIT $${params.length}`,
    params
  );
  return rows;
}

// Per-day aggregates for the activity strip. One row per day in the span,
// including days with nothing at all — a silent stretch has to be drawn, and
// a day that produced no rows produces no row to draw it from.
export async function activityByDay({ days = 30 } = {}) {
  const { rows } = await query(
    `WITH span AS (
       SELECT generate_series(date_trunc('day', now()) - ($1::int - 1) * interval '1 day',
                              date_trunc('day', now()),
                              interval '1 day') AS day
     )
     SELECT to_char(span.day, 'YYYY-MM-DD') AS day,
            count(p.id) FILTER (WHERE ${POLL_OK}) AS polls,
            count(p.id) FILTER (WHERE ${PULL_OK}) AS pulls,
            count(p.id) FILTER (WHERE p.status <> 200) AS faults
     FROM span
     LEFT JOIN ota_pulls p ON p.event_at >= span.day AND p.event_at < span.day + interval '1 day'
     GROUP BY span.day
     ORDER BY span.day`,
    [days]
  );
  return rows.map((r) => ({
    day: r.day,
    polls: Number(r.polls),
    pulls: Number(r.pulls),
    faults: Number(r.faults),
  }));
}

// Every build that was ever pulled, for the filter dropdown.
export async function pulledBuildIds() {
  const { rows } = await query(
    `SELECT DISTINCT build_id FROM ota_pulls WHERE build_id IS NOT NULL ORDER BY build_id DESC`
  );
  return rows.map((r) => r.build_id);
}

// Publish history's two new columns, plus what separates the two
// never-pulled states (design.md §8).
//
// `polls_while_current` IS THE WHOLE POINT OF THIS QUERY. "Superseded before
// it could be" and "current and never fetched" mean opposite things, and the
// difference is whether the device ever had the chance: a build that was
// replaced before any device checked in could not have been taken, while a
// build that was current across a dozen launches and still was not taken is a
// fault. The window is [published, next publication) — or [published, now)
// for the newest row — and only SUCCESSFUL polls count, because a 401 scan is
// not the device checking in.
//
// This infers from timestamps alone and claims nothing more: a poll carries
// no build id, so this says "the device checked in while this build was the
// current one", never "the device saw this build and declined it".
export async function pullSummaryByBuild({ currentBuildId = null } = {}) {
  const { rows } = await query(
    `WITH windows AS (
       SELECT build_id, created_at,
              -- THE BUILD current.json NAMES IS STILL CURRENT, whatever the
              -- publication order says. Rolling back (D26) means repointing
              -- current.json at an OLDER build, so "the next publication
              -- superseded it" is simply false for that one row, and its
              -- window runs to now. Without this the fault case — current,
              -- never fetched — would report zero polls while being the live
              -- build, which is the one number the operator wants there.
              CASE WHEN build_id = $1 THEN NULL
                   ELSE lead(created_at) OVER (ORDER BY created_at) END AS superseded_at
       FROM publications
     )
     SELECT w.build_id,
            w.superseded_at,
            (SELECT count(*) FROM ota_pulls p
              WHERE p.build_id = w.build_id AND ${PULL_OK}) AS pulls,
            (SELECT max(p.event_at) FROM ota_pulls p
              WHERE p.build_id = w.build_id AND ${PULL_OK}) AS last_pull_at,
            (SELECT count(*) FROM ota_pulls p
              WHERE ${POLL_OK}
                AND p.event_at >= w.created_at
                AND (w.superseded_at IS NULL OR p.event_at < w.superseded_at)) AS polls_while_current
     FROM windows w`,
    [currentBuildId]
  );
  const byBuild = new Map();
  for (const r of rows) {
    byBuild.set(r.build_id, {
      pulls: Number(r.pulls),
      lastPullAt: r.last_pull_at,
      supersededAt: r.superseded_at,
      pollsWhileCurrent: Number(r.polls_while_current),
    });
  }
  return byBuild;
}
