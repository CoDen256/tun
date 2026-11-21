// archive.js — hub's read-only client for the account export's git history,
// held by `backup-console` (userdata-git-history task 6.2).
//
// WHY HUB DOES NOT READ THE CLONE ITSELF. The backup repository's clone lives
// on a volume with exactly one writer, the backup scheduler, and `backup-
// console` already mounts it READ-ONLY and already knows how to read it
// without refreshing its index. Mounting the same volume into a third
// container to run `git log` in a second place would put the backup's own
// storage layout into two projects' compose files, and the one thing this
// ecosystem's standards say loudest is that a fact lives in one place.
//
// THE INTERNAL PLANE, NEVER THE GATEWAY (unified-auth 4.6). Service to
// service, `Authorization: Bearer INTERNAL_TOKEN`, resolved by compose
// service name. The gateway has no route to these paths at all.
//
// EVERY FUNCTION HERE DEGRADES AND NONE OF THEM THROWS. This is the whole
// point of the two-tier panel: the recent tier is a local Postgres read and
// the archived tier is a cross-service call, and D157's "serve before you
// migrate" posture applied to a panel means a backup outage degrades HALF of
// one panel and nothing else. Every return value carries either `ok: true`
// with data or `ok: false` with a reason the page can print — there is no
// third shape and no exception to catch at the call site.
// The config object is PASSED IN rather than imported: hub builds it once in
// `bin/server.js` with `loadConfig()` and threads it through `createServer`,
// and a module that reached for its own copy would be a second loader with a
// second set of defaults.

// Short on purpose. This call sits in the render path of a page whose other
// half is local, and a backup service that is wedged rather than stopped must
// not hold the Sync page open for the operator. Two seconds is long enough
// for `git log` over a local clone by a wide margin.
const TIMEOUT_MS = 2000;

async function call(config, path, params, { timeoutMs = TIMEOUT_MS } = {}) {
  const root = config?.backupConsoleUrl || null;
  if (!root) {
    return { ok: false, reason: "BACKUP_CONSOLE_URL is not configured for this service", configured: false };
  }
  const url = new URL(path, root);
  for (const [k, v] of Object.entries(params)) url.searchParams.set(k, String(v));

  const started = Date.now();
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, {
      signal: controller.signal,
      headers: { Authorization: `Bearer ${config.internalToken}` },
    });
    const body = await res.json().catch(() => null);
    if (!res.ok) {
      return {
        ok: false,
        configured: true,
        status: res.status,
        // The console's own reason when it gave one — it knows things hub
        // cannot, such as "the backup service has never cloned the remote".
        reason: body?.reason || `backup-console answered HTTP ${res.status}`,
        url: `${url.pathname}${url.search}`,
      };
    }
    return { ...body, ok: true, configured: true, tookMs: Date.now() - started };
  } catch (err) {
    // An abort and a refused connection are different facts to an operator
    // staring at a page, so they are not flattened into "unavailable".
    const aborted = err.name === "AbortError";
    return {
      ok: false,
      configured: true,
      reason: aborted
        ? `timed out after ${timeoutMs}ms`
        : `could not reach backup-console: ${err.message}`,
      url: `${url.pathname}${url.search}`,
    };
  } finally {
    clearTimeout(timer);
  }
}

// The commits that touched one account's export, newest first. Carries NO
// document — one account's document is ~110 KB and D-UP4 keeps full documents
// out of any listing, on either side of a service boundary.
export async function archiveHistory(config, uid, { limit = 50 } = {}) {
  return call(config, "/api/exports/history", { uid, limit });
}

// One version's document, and optionally its diff against the preceding
// commit. Called only when the operator opens that entry.
export async function archiveVersion(config, uid, sha, { diff = false } = {}) {
  // A document read is allowed longer than the listing: it is a deliberate
  // click, not something standing between the operator and the page.
  return call(config, "/api/exports/version", { uid, sha, diff: diff ? "1" : "0" }, { timeoutMs: 5000 });
}

// How far the committed archive actually covers this account — the epoch of
// the newest commit touching its export, or null when nothing is archived or
// the archive cannot be read.
//
// THE SWEEP DEPENDS ON THIS BEING HONEST IN THE NEGATIVE DIRECTION. "I could
// not reach the archive" and "the archive covers nothing" must both come back
// as null, because the sweep's rule is "delete only what the archive already
// covers" and the safe answer to an unanswerable question is "nothing".
export async function archiveCoverage(config, uid) {
  const result = await archiveHistory(config, uid, { limit: 1 });
  if (!result.ok) return { ok: false, reason: result.reason, coveredThroughEpoch: null };
  const newest = result.commits?.[0] || null;
  return {
    ok: true,
    present: !!result.present,
    coveredThroughEpoch: newest ? newest.epoch : null,
    newest,
  };
}
