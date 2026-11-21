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

// ---- the account export (userdata-git-history task 2.6) -------------------
//
// One file per account, and for each: its size, when it last CHANGED, and how
// many commits have touched it. The last two are the point — the whole design
// is "git's own history is the history of the document", so a panel that
// showed only a size would be reporting the least interesting fact about it.
//
// ONE bounded `git log` pass for every file, not one call per file: a repo
// with many accounts would otherwise cost a process spawn each. `-n` bounds
// it; a file whose last change is older than that window reports `commits`
// as "at least N", never a wrong exact number.
//
// NOT CACHED, deliberately (tier-2 decision). The clone is local, the call is
// bounded, and this page's entire value is that it shows the CURRENT state of
// the backup — a cache here would reintroduce exactly the staleness the
// console exists to expose. Revisit only if a real repo makes it slow.
const EXPORT_LOG_LIMIT = 500;

export async function exportArchive() {
  const dir = path.join(CLONE_DIR, "userdata");
  let names = [];
  try {
    names = fs.readdirSync(dir).filter((f) => f.endsWith(".json")).sort();
  } catch {
    return { present: false, files: [], total: 0, truncated: false };
  }

  const SEP = "\x1f";
  const REC = "\x1e";
  const log = await git(["log", `-n${EXPORT_LOG_LIMIT}`, "--name-only", `--format=${REC}%h${SEP}%ct`, "--", "userdata"]);
  const facts = new Map();
  let scanned = 0;
  if (log.ok) {
    for (const chunk of log.stdout.split(REC).slice(1)) {
      const [header, ...lines] = chunk.split("\n");
      const [short, ct] = header.split(SEP);
      scanned += 1;
      for (const line of lines) {
        const file = line.trim();
        if (!file.startsWith("userdata/")) continue;
        const name = file.slice("userdata/".length);
        const prior = facts.get(name);
        if (prior) prior.commits += 1;
        else facts.set(name, { commits: 1, lastShort: short, lastEpoch: Number(ct) });
      }
    }
  }

  const files = names.map((name) => {
    let bytes = null;
    try {
      bytes = fs.statSync(path.join(dir, name)).size;
    } catch {
      /* vanished between readdir and stat */
    }
    const f = facts.get(name) || null;
    return {
      name,
      uid: name.replace(/\.json$/, ""),
      bytes,
      commits: f ? f.commits : 0,
      lastShort: f ? f.lastShort : null,
      lastEpoch: f ? f.lastEpoch : null,
    };
  });

  return {
    present: true,
    files,
    total: files.length,
    // True when the log window was filled, i.e. commit counts are lower
    // bounds rather than totals. Stated rather than hidden.
    truncated: scanned >= EXPORT_LOG_LIMIT,
  };
}

// ---- one account's archived history (userdata-git-history task 6.2) ------
//
// THE ARCHIVED TIER OF THE SYNC PAGE READS THIS, from hub, over the internal
// plane. It is deliberately a LISTING plus two on-demand reads, never one
// payload: a document is ~110 KB and a page that inlined every version of it
// would be exactly the thing D-UP4 forbids.
//
// A uid is a path segment from another service, so it is matched against the
// same shape mjolnir-sync's own UID_RE allows and REJECTED otherwise — never
// sanitised. `git show <sha>:userdata/<uid>.json` is not shell-interpolated
// (execFile, no shell), but a uid that escaped the directory would still read
// a file it has no business reading.
const UID_RE = /^[A-Za-z0-9._:@-]{1,128}$/;
const ARCHIVE_LIMIT = 200;

export function archivePathFor(uid) {
  return UID_RE.test(uid) ? `userdata/${uid}.json` : null;
}

// Reads one commit's patch into the SAME vocabulary the console's per-PATCH
// tier already speaks — a changed scalar's before/after, and how many card
// occurrences appeared or disappeared. Derived from the diff, never from the
// documents: the point of the serialization is that the diff is small and
// legible, so the diff is what gets read.
//
// It reports what the DIFF shows, which for a coarse tier is exactly the
// honest limit: several syncs inside one backup period collapse into one set
// of before/after values, and a value changed and changed back between two
// runs leaves nothing here at all. The page states both, scoped to this tier.
function summarizePatch(lines) {
  const fields = {};
  let added = 0;
  let deleted = 0;
  let cardsAdded = 0;
  let cardsRemoved = 0;
  let created = false;

  // `"name": value` at any depth. Only TOP-LEVEL scalars end up being shown,
  // which the four-space indent distinguishes; nested lines still count
  // toward added/deleted and the card tallies.
  const FIELD = /^([+-])(\s*)"([^"]+)":\s*(.*?),?\s*$/;

  for (const line of lines) {
    if (line.startsWith("new file mode")) created = true;
    if (line.startsWith("+++") || line.startsWith("---") || line.startsWith("@@") || line.startsWith("diff --git")
        || line.startsWith("index ") || line.startsWith("new file") || line.startsWith("deleted file")) {
      continue;
    }
    if (line.startsWith("+")) added += 1;
    else if (line.startsWith("-")) deleted += 1;
    else continue;

    const m = FIELD.exec(line);
    if (!m) continue;
    const [, sign, indent, name, rawValue] = m;
    if (name === "ID") {
      // One `"ID":` line per card occurrence, so these are occurrence counts.
      if (sign === "+") cardsAdded += 1;
      else cardsRemoved += 1;
      continue;
    }
    // Four spaces is top level in jsonb_pretty's output; deeper lines belong
    // to a card or a reminder entry and are not account-level facts.
    if (indent.length !== 4) continue;
    const value = rawValue === "[" || rawValue === "{" ? "(structure)" : rawValue;
    const slot = fields[name] || (fields[name] = { from: null, to: null });
    if (sign === "+") slot.to = value;
    else slot.from = value;
  }

  return { added, deleted, cardsAdded, cardsRemoved, fields, created };
}

// The commits that touched one account's export, newest first. `--follow` is
// deliberately NOT used: the file is never renamed, and --follow's rename
// detection would make a deleted-then-recreated account look continuous.
export async function accountHistory(uid, { limit = 50 } = {}) {
  const file = archivePathFor(uid);
  if (!file) return { ok: false, reason: "not a uid", uid, commits: [] };
  if (!cloneExists()) {
    return { ok: false, reason: `no clone at ${CLONE_DIR} — the backup service has never cloned the remote`, uid, commits: [] };
  }
  const SEP = "\x1f";
  const REC = "\x1e";
  const capped = Math.min(Math.max(1, limit), ARCHIVE_LIMIT);
  // ONE call for the whole tier, patches included — `--unified=0` so each
  // commit carries only the lines that actually changed.
  //
  // THIS IS AFFORDABLE ONLY BECAUSE OF THE SERIALIZATION. A version of this
  // archive that stored one opaque blob per commit would make `-p` mean "ship
  // every byte of every version", and the alternative (`git show` once per
  // commit) is one process spawn per row. Because `jsonb_pretty` expands the
  // document one scalar per line, a day's change is a handful of lines, so
  // the whole tier's deltas come back in a single, small call.
  const log = await git([
    "log", `-n${capped}`, "--unified=0", "--no-color", "-p",
    `--format=${REC}%H${SEP}%h${SEP}%ct${SEP}%s`, "--", file,
  ]);
  if (!log.ok) {
    return { ok: false, reason: log.stderr || "git log failed", uid, commits: [] };
  }
  const commits = log.stdout
    .split(REC)
    .slice(1)
    .map((chunk) => {
      const [header, ...bodyLines] = chunk.split("\n");
      const [sha, short, ct, ...rest] = header.split(SEP);
      return { sha, short, epoch: Number(ct), subject: rest.join(SEP), ...summarizePatch(bodyLines) };
    });
  // `present` is about the FILE, not about the commits: an account exported
  // for the first time between two runs has a file and no history yet, and
  // "nothing archived yet" has to be distinguishable from "cannot read".
  let present = false;
  try {
    present = fs.statSync(path.join(CLONE_DIR, file)).isFile();
  } catch {
    present = false;
  }
  return { ok: true, uid, file, present, commits, truncated: commits.length >= capped };
}

// One version's document, and optionally its diff against the preceding
// commit — fetched only when the operator opens that entry.
export async function accountVersion(uid, sha, { diff = false } = {}) {
  const file = archivePathFor(uid);
  if (!file) return { ok: false, reason: "not a uid" };
  // A sha also arrives from a URL. Hex only, nothing else — `git show` would
  // otherwise happily accept a revision expression such as `HEAD~3` or a
  // branch name, which is not what this endpoint is for.
  if (!/^[0-9a-f]{4,40}$/.test(String(sha || ""))) return { ok: false, reason: "not a commit id" };
  if (!cloneExists()) return { ok: false, reason: "no clone" };

  const show = await git(["show", `${sha}:${file}`]);
  if (!show.ok) return { ok: false, reason: show.stderr || `no version of ${file} at ${sha}` };

  const out = { ok: true, uid, sha, text: show.stdout };
  if (diff) {
    const parents = await git(["rev-list", "--parents", "-n1", sha]);
    const parent = parents.ok ? (parents.stdout.trim().split(" ")[1] || null) : null;
    out.parent = parent;
    if (parent) {
      // `--unified=3` and `--no-color`: this is read as text by another
      // service, not rendered by a terminal.
      const d = await git(["diff", "--no-color", "--unified=3", parent, sha, "--", file]);
      out.diff = d.ok ? d.stdout : null;
      out.diffError = d.ok ? null : (d.stderr || "git diff failed");
    } else {
      // The first commit that introduced the file has no predecessor. Stated,
      // not rendered as an empty diff that would read as "nothing changed".
      out.diff = null;
      out.diffError = null;
      out.firstVersion = true;
    }
  }
  return out;
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
  // userdata-git-history: NOT a dump and not a mirror — one mutable file per
  // account, overwritten in place each run, so that git's own history is the
  // history of the document. It is the ARCHIVE OF RECORD for account state:
  // `userdata` and `userdata_history` are excluded from `mjolnir.sql`, and
  // restoring that dump yields two empty tables refilled from here.
  {
    key: "userdata/",
    label: "account documents",
    kind: "export",
    note: "one mutable <code>&lt;uid&gt;.json</code> per account, <code>jsonb_pretty</code>-serialized · <b>the archive of record</b> — this data is excluded from <code>mjolnir.sql</code>",
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
  // userdata-git-history task 2.6. Its own read, degrading on its own: an
  // absent `userdata/` directory is "nothing exported yet", never an error.
  const exports_ = await exportArchive();

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
    exports: exports_,
  };
}
