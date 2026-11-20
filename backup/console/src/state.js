// Everything the /backup/ page knows, read from two mounts and nothing else.
//
// THIS PROCESS HAS NO DATABASE, and that is not an omission. The service it
// reports on exists to dump Postgres, so the facts that matter most are
// exactly the ones Postgres cannot be trusted to hold: "the run failed
// because the database was unreachable". So the sources of truth are
//
//   /state   run records, each run's captured log, the three settings, the
//            scheduler's heartbeat, the manual-run request.   READ-WRITE
//   /data    the git clone the backup service maintains.       READ-ONLY
//
// /data IS MOUNTED READ-ONLY ON PURPOSE (design §2). The clone has exactly one
// writer — the scheduler loop in `backup` — because two writers against one
// git working tree is a race whose failure mode is a corrupt backup. This
// process cannot dump, cannot commit and cannot push, and the mount is what
// guarantees it rather than a rule someone has to remember.
//
// EVERY READ HERE DEGRADES. An absent clone, an empty state volume, a
// settings file someone truncated: each is a condition the page REPORTS. None
// of them may throw out of a request handler, because a console that will not
// load when there has never been a successful backup is useless at exactly
// the moment it is needed — which was the live state of this service on
// 2026-11-20.
import { execFile } from "node:child_process";
import fs from "node:fs";
import path from "node:path";

export const STATE_DIR = process.env.BACKUP_STATE_DIR || "/state";
export const CLONE_DIR = process.env.BACKUP_CLONE_DIR || "/data/tun-backup";
export const STAMP_FILE = path.join(path.dirname(CLONE_DIR), "last-success");
export const RUNS_DIR = path.join(STATE_DIR, "runs");
export const SETTINGS_FILE = path.join(STATE_DIR, "settings.json");
export const REQUEST_FILE = path.join(STATE_DIR, "run-request");
export const CLAIM_FILE = path.join(STATE_DIR, "run-claimed");
export const HEARTBEAT_FILE = path.join(STATE_DIR, "scheduler.json");

// The heartbeat is rewritten every tick (5s by default). Older than this and
// the honest answer is "I cannot tell what the backup service is doing",
// never "it is idle" — a page that implies a scheduler is waiting when the
// container is stopped is the failure shape this whole service is about.
const HEARTBEAT_STALE_SECONDS = 60;

// The three settings and their bounds. The seeds come from the environment
// (the same values the scheduler seeds its settings file from) and are used
// ONLY while nothing has been stored — never as an override (D151).
export const SETTING_BOUNDS = {
  interval_seconds: { min: 60, max: 2592000, seed: () => intEnv("BACKUP_INTERVAL_SECONDS", 86400) },
  retry_seconds: { min: 60, max: 604800, seed: () => intEnv("BACKUP_RETRY_SECONDS", 3600) },
  run_retention: { min: 1, max: 1000, seed: () => intEnv("BACKUP_RUN_RETENTION", 40) },
};

function intEnv(name, fallback) {
  const n = Number.parseInt(process.env[name] || "", 10);
  return Number.isFinite(n) && n > 0 ? n : fallback;
}

function readFileOr(file, fallback = null) {
  try {
    return fs.readFileSync(file, "utf8");
  } catch {
    return fallback;
  }
}

function readJsonOr(file, fallback = null) {
  const text = readFileOr(file);
  if (text === null) return fallback;
  try {
    return JSON.parse(text);
  } catch {
    // A half-written or hand-edited file. Reported as a condition rather than
    // thrown: the rest of the page is still true.
    return fallback;
  }
}

function run(cmd, args, { cwd, timeout = 8000 } = {}) {
  return new Promise((resolve) => {
    execFile(cmd, args, { cwd, timeout, maxBuffer: 16 * 1024 * 1024 }, (err, stdout, stderr) => {
      resolve({ ok: !err, stdout: stdout || "", stderr: stderr || (err ? String(err.message) : "") });
    });
  });
}

// `--no-optional-locks` so a read never tries to refresh the index: /data is
// mounted read-only and an index refresh would fail the command for no reason.
async function git(args) {
  return run("git", ["--no-optional-locks", "-C", CLONE_DIR, ...args]);
}

export function cloneExists() {
  try {
    return fs.statSync(path.join(CLONE_DIR, ".git")).isDirectory()
      || fs.statSync(path.join(CLONE_DIR, ".git")).isFile();
  } catch {
    return false;
  }
}

export function readSettings() {
  const stored = readJsonOr(SETTINGS_FILE);
  const out = { stored: !!stored, storedRaw: !!readFileOr(SETTINGS_FILE), values: {}, invalid: [] };
  for (const [key, bound] of Object.entries(SETTING_BOUNDS)) {
    const raw = stored ? stored[key] : undefined;
    const n = Number.parseInt(raw, 10);
    if (Number.isFinite(n) && n >= bound.min && n <= bound.max) {
      out.values[key] = n;
    } else {
      if (stored && raw !== undefined) out.invalid.push(key);
      out.values[key] = bound.seed();
    }
  }
  out.updatedAt = stored?.updated_at || null;
  out.updatedBy = stored?.updated_by || null;
  return out;
}

export function listRunFiles() {
  try {
    return fs
      .readdirSync(RUNS_DIR)
      .filter((f) => f.endsWith(".json"))
      .sort()
      .reverse();
  } catch {
    return [];
  }
}

export function readRuns(limit = 6) {
  const files = listRunFiles();
  const runs = [];
  for (const file of files.slice(0, limit)) {
    const rec = readJsonOr(path.join(RUNS_DIR, file));
    if (rec) runs.push(rec);
  }
  return { runs, total: files.length };
}

export function readRunLog(id, { tailBytes = 0 } = {}) {
  // The id comes from a URL. It is matched against the exact shape the
  // scheduler writes rather than sanitised, because "sanitised" is how a
  // `../` eventually gets through.
  if (!/^[0-9]{8}T[0-9]{6}Z$/.test(id)) return null;
  const file = path.join(RUNS_DIR, `${id}.log`);
  const text = readFileOr(file);
  if (text === null) return null;
  if (tailBytes && text.length > tailBytes) return text.slice(-tailBytes);
  return text;
}

export function readScheduler() {
  const hb = readJsonOr(HEARTBEAT_FILE);
  const nowEpoch = Math.floor(Date.now() / 1000);
  if (!hb) {
    return { known: false, state: "unknown", queued: requestPending(), claimed: claimPending(), reason: "no heartbeat on the state volume" };
  }
  const age = nowEpoch - (Number(hb.updated_epoch) || 0);
  const stale = age > HEARTBEAT_STALE_SECONDS;
  return {
    known: !stale,
    stale,
    ageSeconds: age,
    state: stale ? "unknown" : hb.state || "unknown",
    currentRun: hb.current_run || null,
    nextRunEpoch: Number(hb.next_run_epoch) || null,
    nextRunReason: hb.next_run_reason || null,
    tickSeconds: Number(hb.tick_seconds) || null,
    queued: requestPending(),
    claimed: claimPending(),
    reason: stale ? `the scheduler's heartbeat is ${age}s old — the backup service is stopped or wedged` : null,
  };
}

export function requestPending() {
  return fs.existsSync(REQUEST_FILE);
}

export function claimPending() {
  return fs.existsSync(CLAIM_FILE);
}

export function readStamp() {
  const text = readFileOr(STAMP_FILE);
  if (text === null) return null;
  const n = Number.parseInt(text.trim(), 10);
  return Number.isFinite(n) && n > 0 ? n : null;
}

// ---- the git clone --------------------------------------------------------

export async function gitInfo() {
  if (!cloneExists()) {
    return { present: false, reason: `no clone at ${CLONE_DIR} — the backup service has never cloned the remote` };
  }
  const [head, branch, upstream, unpushed, remote] = await Promise.all([
    git(["rev-parse", "--short", "HEAD"]),
    git(["rev-parse", "--abbrev-ref", "HEAD"]),
    git(["rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}"]),
    git(["rev-list", "--count", "@{u}..HEAD"]),
    git(["remote", "get-url", "origin"]),
  ]);
  const unpushedCount = unpushed.ok ? Number.parseInt(unpushed.stdout.trim(), 10) : null;
  const upstreamSha = upstream.ok ? (await git(["rev-parse", "--short", upstream.stdout.trim()])).stdout.trim() : null;
  return {
    present: true,
    head: head.ok ? head.stdout.trim() : null,
    branch: branch.ok ? branch.stdout.trim() : null,
    upstream: upstream.ok ? upstream.stdout.trim() : null,
    upstreamSha,
    unpushed: Number.isFinite(unpushedCount) ? unpushedCount : null,
    remoteUrl: remote.ok ? remote.stdout.trim() : null,
  };
}

// One `git log --numstat` call for the whole page: the commit list AND every
// listed commit's changed files, so expanding a row costs no request. Binary
// files report `-` for both counts, which is passed through as such rather
// than printed as zero.
export async function commitHistory(limit = 6) {
  if (!cloneExists()) return { total: 0, commits: [] };
  const SEP = "\x1f"; // unit separator — cannot occur in a sha, date or subject
  const REC = "\x1e"; // record separator — one per commit
  const [count, log, onRemote] = await Promise.all([
    git(["rev-list", "--count", "HEAD"]),
    git([
      "log",
      `-n${limit}`,
      "--numstat",
      `--format=${REC}%H${SEP}%h${SEP}%ct${SEP}%s${SEP}%p`,
    ]),
    git(["rev-list", "@{u}"]),
  ]);
  const remoteShas = new Set(onRemote.ok ? onRemote.stdout.split("\n").filter(Boolean) : []);
  const commits = [];
  if (log.ok) {
    for (const chunk of log.stdout.split(REC).slice(1)) {
      const [headerLine, ...bodyLines] = chunk.split("\n");
      const [sha, short, ct, subject, parents] = headerLine.split(SEP);
      const files = [];
      for (const line of bodyLines) {
        if (!line.trim()) continue;
        const [added, deleted, file] = line.split("\t");
        if (file === undefined) continue;
        files.push({ added, deleted, path: file, binary: added === "-" });
      }
      commits.push({
        sha,
        short,
        epoch: Number(ct),
        subject,
        parents: (parents || "").trim().split(" ").filter(Boolean),
        files,
        onRemote: remoteShas.size ? remoteShas.has(sha) : null,
      });
    }
  }
  return { total: count.ok ? Number.parseInt(count.stdout.trim(), 10) : commits.length, commits };
}

// ---- sources -------------------------------------------------------------
//
// READ-ONLY, AND THERE IS NO CONTROL TO EXCLUDE ANY OF THEM. The operator was
// offered per-source toggles and declined: a source switched off is
// indistinguishable, afterwards, from a source that silently stopped being
// backed up, which is the exact failure this service's design fights. smia is
// listed as DELIBERATELY EXCLUDED rather than omitted, for the same reason —
// an absence has to read as a decision.
const SOURCE_DEFS = [
  { key: "mjolnir.sql", label: "mjolnir", kind: "db", note: "minus <code>job_logs</code> and <code>build_jobs</code> (data only)" },
  { key: "stabbur.sql", label: "stabbur", kind: "db", note: "" },
  { key: "phonexa.sql", label: "phonexa", kind: "db", note: "no table excluded — every table is user data (D147)" },
  { key: "shadow.sql", label: "shadow", kind: "db", note: "" },
  {
    key: "blobs/",
    label: "stabbur blobs",
    kind: "mirror",
    mirror: "blobs",
    note: "flat, content-addressed, write-once",
  },
  {
    key: "phonexa-audio/",
    label: "phonexa audio",
    kind: "mirror",
    mirror: "phonexa-audio",
    note: "nested <code>lang/&lt;lang&gt;/ingested/&lt;name&gt;.wav</code> · copy-if-absent, never overwritten",
  },
];

function dirStats(dir) {
  let bytes = 0;
  let files = 0;
  const stack = [dir];
  while (stack.length) {
    const current = stack.pop();
    let entries;
    try {
      entries = fs.readdirSync(current, { withFileTypes: true });
    } catch {
      continue;
    }
    for (const entry of entries) {
      if (entry.name === ".git") continue;
      const full = path.join(current, entry.name);
      if (entry.isDirectory()) stack.push(full);
      else if (entry.isFile()) {
        files += 1;
        try {
          bytes += fs.statSync(full).size;
        } catch {
          /* vanished between readdir and stat — count the file, not the size */
        }
      }
    }
  }
  return { bytes, files };
}

// The source-volume counts the mirror sections log, read back out of a run's
// own captured log. The console does not mount stabbur's blob volume or
// phonexa's audio tree — deliberately: the only honest statement it can make
// about a source is what the backup service saw when it last looked.
//
// The two mirror sections are matched by the line that opens them, not by
// position, so adding a third mirror cannot silently shift the parse.
export function mirrorFactsFromLog(text) {
  const facts = {};
  if (!text) return facts;
  let current = null;
  for (const line of text.split("\n")) {
    if (line.includes("syncing stabbur's blob store")) current = "blobs";
    else if (line.includes("syncing phonexa's audio tree")) current = "phonexa-audio";
    if (!current) continue;
    const src = line.match(/source volume has (\d+) file\(s\)/);
    if (src) facts[current] = { ...(facts[current] || {}), sourceFiles: Number(src[1]) };
    const moved = line.match(/^\s*([\w-]+)\/: (\d+) -> (\d+) \((\d+) new\)/);
    if (moved) {
      facts[moved[1]] = { ...(facts[moved[1]] || {}), mirrorBefore: Number(moved[2]), mirrorAfter: Number(moved[3]), copied: Number(moved[4]) };
    }
    const fault = line.match(/FATAL source for ([\w-]+) is empty but the mirror is not/);
    if (fault) facts[fault[1]] = { ...(facts[fault[1]] || {}), fault: "source is empty but the mirror is not — check the volume mount" };
  }
  return facts;
}

export function buildSources({ runs, lastLog }) {
  const latest = runs[0] || null;
  const previous = runs[1] || null;
  const mirrorFacts = mirrorFactsFromLog(lastLog);
  const out = [];
  for (const def of SOURCE_DEFS) {
    const live = { bytes: null, files: null, present: false };
    if (cloneExists()) {
      const full = path.join(CLONE_DIR, def.key.replace(/\/$/, ""));
      try {
        const stat = fs.statSync(full);
        live.present = true;
        if (stat.isDirectory()) {
          const d = dirStats(full);
          live.bytes = d.bytes;
          live.files = d.files;
        } else {
          live.bytes = stat.size;
        }
      } catch {
        live.present = false;
      }
    }
    const before = previous?.sources?.[def.key] || null;
    const facts = def.mirror ? mirrorFacts[def.mirror] || {} : {};
    out.push({
      ...def,
      present: live.present,
      bytes: live.bytes,
      files: live.files,
      deltaBytes: before && live.bytes !== null ? live.bytes - Number(before.bytes || 0) : null,
      deltaFiles: before && live.files !== null && before.files !== undefined ? live.files - Number(before.files) : null,
      sourceFiles: facts.sourceFiles ?? null,
      copied: facts.copied ?? null,
      fault: facts.fault || (facts.sourceFiles === 0 && (live.files || 0) > 0
        ? "source is empty but the mirror is not — check the volume mount"
        : null),
      asOf: latest?.finished_at || null,
    });
  }
  // Not a source: a statement that an absence is a decision.
  out.push({
    key: "smia",
    label: "smia",
    kind: "excluded",
    note: "not in the backup set — every table is a cache or a re-importable corpus (operator decision, 2026-11-14). Recovery is a re-import, so <code>smia/providers/</code> is the thing to keep safe",
    present: false,
    bytes: null,
    files: null,
  });
  return out;
}

// ---- the whole page's state ---------------------------------------------

export async function readState({ runLimit = 6, commitLimit = 6 } = {}) {
  const conditions = [];
  const nowEpoch = Math.floor(Date.now() / 1000);

  let stateVolume = true;
  try {
    fs.accessSync(STATE_DIR, fs.constants.R_OK);
  } catch {
    stateVolume = false;
    conditions.push({
      key: "no-state-volume",
      text: `the state volume is not readable at ${STATE_DIR} — run history and settings cannot be read`,
    });
  }

  const settings = readSettings();
  if (!settings.stored) {
    conditions.push({
      key: "settings-seeded",
      text: "no settings have been stored yet — the values below are the first-boot seeds from the environment",
    });
  }
  if (settings.invalid.length) {
    conditions.push({
      key: "settings-invalid",
      text: `the stored settings file has unusable values for ${settings.invalid.join(", ")} — the environment seed is in force for those`,
    });
  }

  const { runs, total: runsTotal } = readRuns(runLimit);
  if (!runsTotal) {
    conditions.push({ key: "no-runs", text: "no run has been recorded on the state volume yet" });
  }

  const scheduler = readScheduler();
  if (!scheduler.known) {
    conditions.push({
      key: "scheduler-unknown",
      text: `the backup service's state cannot be determined — ${scheduler.reason}`,
    });
  }

  const gitState = await gitInfo();
  if (!gitState.present) conditions.push({ key: "no-clone", text: gitState.reason });

  const stamp = readStamp();
  if (stamp === null) {
    conditions.push({
      key: "never-succeeded",
      text: "no backup has ever completed — there is no success stamp at all",
    });
  }

  // Each listed run carries its own captured log text, so expanding a row on
  // the page costs no second request — and so a failed run's reason is in the
  // page the operator is already looking at.
  for (const r of runs) r.logText = readRunLog(r.id);
  const lastLog = runs[0] ? runs[0].logText : null;
  // The run in progress, tailed. Only the tail: a run's log is unbounded and
  // the page re-reads it every few seconds while a run is live.
  const liveLog = scheduler.state === "running" && scheduler.currentRun
    ? readRunLog(scheduler.currentRun, { tailBytes: 8000 })
    : null;
  const sources = buildSources({ runs, lastLog });
  const commits = await commitHistory(commitLimit);

  const interval = settings.values.interval_seconds;
  const retry = settings.values.retry_seconds;
  const limitSeconds = interval + Math.floor(interval / 4);
  const ageSeconds = stamp === null ? null : nowEpoch - stamp;
  const containerHealthy = stamp === null ? false : ageSeconds <= limitSeconds;

  // THE PRIMARY STATE, AND THE ORDER IS THE POINT.
  //
  // "never" first: a service that has never completed a run must never be
  // described by an age or a timestamp, because both imply a success.
  // Then the failure of the LAST run, ahead of an older success — presenting
  // a stale success as the current state is this ecosystem's signature defect.
  // Then an unpushed commit, which is a real and separate alarm: the dumps
  // exist only inside this host.
  let state = "ok";
  if (stamp === null) state = "never";
  else if (runs[0] && runs[0].outcome === "failed") state = "fail";
  else if (gitState.present && gitState.unpushed > 0) state = "stale";
  else if (!containerHealthy) state = "stale";

  const lastRun = runs[0] || null;
  const quote = lastLog
    ? lastLog.trimEnd().split("\n").slice(-3).join("\n")
    : null;

  return {
    now: new Date().toISOString(),
    nowEpoch,
    conditions,
    stateVolume,
    settings: {
      values: settings.values,
      stored: settings.stored,
      updatedAt: settings.updatedAt,
      updatedBy: settings.updatedBy,
      bounds: Object.fromEntries(Object.entries(SETTING_BOUNDS).map(([k, v]) => [k, { min: v.min, max: v.max }])),
      seeds: Object.fromEntries(Object.entries(SETTING_BOUNDS).map(([k, v]) => [k, v.seed()])),
    },
    environmentOnly: {
      repoUrl: gitState.remoteUrl || process.env.BACKUP_REPO_URL || "(not set)",
      sshKeyPath: process.env.BACKUP_SSH_KEY_PATH || "/root/.ssh/id_backup (ro mount)",
      clone: `${CLONE_DIR}${gitState.branch ? ` @ ${gitState.branch}` : ""}`,
      stamp: STAMP_FILE,
      stateDir: STATE_DIR,
    },
    health: {
      state,
      stampEpoch: stamp,
      ageSeconds,
      limitSeconds,
      containerHealthy,
      nextRunEpoch: scheduler.nextRunEpoch,
      nextRunReason: scheduler.nextRunReason,
      intervalSeconds: interval,
      retrySeconds: retry,
      quote,
      lastRun: lastRun
        ? { id: lastRun.id, outcome: lastRun.outcome, finishedAt: lastRun.finished_at, summary: lastRun.summary, trigger: lastRun.trigger }
        : null,
    },
    git: gitState,
    scheduler,
    runs,
    runsTotal,
    liveLog,
    retention: settings.values.run_retention,
    sources,
    commits: commits.commits,
    commitsTotal: commits.total,
  };
}
