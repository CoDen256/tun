// backup-console — the operator-plane console over the backup service.
//
// WHAT IT MAY DO: read /state and /data, write the three settings, and write a
// run REQUEST. WHAT IT MAY NOT DO, ever: run pg_dump, touch the git clone,
// commit, or push. The clone has exactly one writer — the scheduler loop in
// `backup` — and /data is mounted read-only here so that rule is enforced by
// the filesystem rather than by anyone remembering it (design §2).
//
// WHY IT IS A SEPARATE SERVICE AND NOT AN HTTP LISTENER IN `backup`
// (design §1): that container holds the SSH deploy key with push access to the
// backup repository, so an HTTP surface there puts a network-reachable
// listener in the one place whose compromise means "an attacker can rewrite
// the backups". And `backup`'s health check is deliberately not liveness — it
// reads the success stamp — while a web server's is; one container cannot
// answer both questions with one exit code.
//
// IT HAS NO DATABASE AT ALL, so D157's "serve before you migrate" is trivially
// satisfied — but its spirit is the load-bearing part here: an empty state
// volume, a missing clone, a stopped `backup` service and a run that has never
// succeeded are all CONDITIONS THE PAGE REPORTS, never reasons to fail a
// request or refuse to boot. A console that will not load because there has
// never been a successful backup is useless at exactly the moment it is
// needed, which was this service's live state on 2026-11-20.
import http from "node:http";
import fs from "node:fs";
import { requireAuth } from "../../../libs/jsservice/auth.js";
import { renderShell } from "../../../libs/jsservice/layout.js";
import { PAGE_SCRIPT, PAGE_STYLE } from "./chrome.js";
import { PREFIX, rail, renderContent } from "./page.js";
import {
  REQUEST_FILE,
  CLAIM_FILE,
  SETTINGS_FILE,
  SETTING_BOUNDS,
  STATE_DIR,
  accountHistory,
  accountVersion,
  readScheduler,
  readState,
} from "./state.js";

const MAX_BODY = 64 * 1024;

function sendJson(res, status, body) {
  const data = JSON.stringify(body);
  res.writeHead(status, {
    "Content-Type": "application/json; charset=utf-8",
    "Content-Length": Buffer.byteLength(data),
    // Operator-plane pages and their data are never cached: the whole value of
    // this console is that it shows the CURRENT state of the backup.
    "Cache-Control": "no-store",
  });
  res.end(data);
}

function sendHtml(res, status, html) {
  res.writeHead(status, {
    "Content-Type": "text/html; charset=utf-8",
    "Content-Length": Buffer.byteLength(html),
    "Cache-Control": "no-store",
  });
  res.end(html);
}

function sendText(res, status, text) {
  res.writeHead(status, { "Content-Type": "text/plain; charset=utf-8", "Cache-Control": "no-store" });
  res.end(text);
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    let size = 0;
    req.on("data", (c) => {
      size += c.length;
      if (size > MAX_BODY) {
        reject(new Error("request body too large"));
        req.destroy();
        return;
      }
      chunks.push(c);
    });
    req.on("end", () => resolve(Buffer.concat(chunks).toString("utf8")));
    req.on("error", reject);
  });
}

function limitFrom(url, key, fallback) {
  const n = Number.parseInt(url.searchParams.get(key) || "", 10);
  if (!Number.isFinite(n)) return fallback;
  return Math.min(Math.max(n, 1), 500);
}

// ---- the run request -----------------------------------------------------
// A FILE, NOT AN INVOCATION. The console writes it; the scheduler claims it by
// renaming it and then runs the identical `run_backup` the schedule runs, with
// no flag and no variant behaviour. That is what makes the button trustworthy:
// a "Run now" with its own code path would be testing a path the schedule
// never uses, and the operator presses it precisely to check the schedule.
function requestRun() {
  const scheduler = readScheduler();
  if (fs.existsSync(REQUEST_FILE)) {
    return { ok: false, status: 409, message: "a run is already requested and waiting for the scheduler to claim it" };
  }
  if (fs.existsSync(CLAIM_FILE) || scheduler.state === "running") {
    return { ok: false, status: 409, message: "a run is already in progress — the scheduler runs one at a time" };
  }
  if (!scheduler.known) {
    return {
      ok: false,
      status: 409,
      message: "the backup service is not reporting a heartbeat, so a request would sit unclaimed — start the backup service first",
    };
  }
  try {
    const payload = JSON.stringify({ requested_at: new Date().toISOString(), requested_by: "backup-console" });
    // tmp + rename, so the scheduler can never observe half a request file.
    fs.writeFileSync(`${REQUEST_FILE}.tmp`, `${payload}\n`);
    fs.renameSync(`${REQUEST_FILE}.tmp`, REQUEST_FILE);
  } catch (err) {
    return { ok: false, status: 500, message: `could not write the request to the state volume: ${err.message}` };
  }
  return {
    ok: true,
    status: 202,
    message: `queued — the scheduler will claim it within ${scheduler.tickSeconds || 5}s and run it itself`,
  };
}

// ---- the three settings --------------------------------------------------
// Written here and nowhere else, which is what makes the stored file the one
// authoritative place (D151). The environment variables are seeds the backup
// service consults only when this file does not exist.
function saveSettings(input) {
  const values = {};
  for (const [key, bound] of Object.entries(SETTING_BOUNDS)) {
    const n = Number.parseInt(input[key], 10);
    if (!Number.isFinite(n)) return { ok: false, status: 400, message: `${key} must be a whole number` };
    if (n < bound.min || n > bound.max) {
      return { ok: false, status: 400, message: `${key} must be between ${bound.min} and ${bound.max}` };
    }
    values[key] = n;
  }
  // Rejected rather than clamped: a schedule the operator did not ask for is
  // worse than a refusal, and the retry interval exists to be SHORTER than
  // the schedule.
  if (values.retry_seconds > values.interval_seconds) {
    return {
      ok: false,
      status: 400,
      message: "the retry interval must not be longer than the schedule interval — it exists to come back sooner after a failure",
    };
  }
  const doc = {
    interval_seconds: values.interval_seconds,
    retry_seconds: values.retry_seconds,
    run_retention: values.run_retention,
    updated_at: new Date().toISOString(),
    updated_by: "backup-console",
  };
  try {
    fs.mkdirSync(STATE_DIR, { recursive: true });
    fs.writeFileSync(`${SETTINGS_FILE}.tmp`, `${JSON.stringify(doc, null, 2)}\n`);
    fs.renameSync(`${SETTINGS_FILE}.tmp`, SETTINGS_FILE);
  } catch (err) {
    return { ok: false, status: 500, message: `could not write ${SETTINGS_FILE}: ${err.message}` };
  }
  return {
    ok: true,
    status: 200,
    // No restart, and no file edited by hand: the scheduler re-reads this file
    // on every tick of its interruptible sleep, so the next run's due time
    // moves within seconds.
    message: "saved — the scheduler re-reads these within a few seconds, with no restart; the container health limit follows the new interval too",
  };
}

export function createServer() {
  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://localhost");

      // unified-auth 4.1 / D159 / D160: the ONE shared check every service
      // runs — the gateway-verified X-Tun-Operator marker, or INTERNAL_TOKEN.
      // No new credential and no login page: the gateway is the gate, and it
      // strips any inbound copy of the marker before any route is reached.
      //
      // `prefix: ""` because the gateway's `handle_path /backup/*` strips the
      // prefix before forwarding, so this process really is mounted at `/`
      // and its probe path really is `/_health` — the one path the shared
      // check lets through, because a container probe carries no credential.
      if (!requireAuth(req, res, process.env.INTERNAL_TOKEN, { prefix: "" })) return;

      if (url.pathname === "/_health") {
        // Liveness AND a readable report of what it can see. 200 whenever this
        // process can serve, because its dependencies being absent is the
        // thing it exists to REPORT — a console that reports itself unhealthy
        // because no backup has ever completed would be restarted by nobody
        // and would hide the very state it is there to show.
        const scheduler = readScheduler();
        return sendJson(res, 200, {
          service: "backup-console",
          status: "ready",
          scheduler: scheduler.state,
          schedulerKnown: scheduler.known,
        });
      }

      if (req.method === "GET" && (url.pathname === "/" || url.pathname === "")) {
        const state = await readState({
          runLimit: limitFrom(url, "runs", 6),
          commitLimit: limitFrom(url, "commits", 6),
        });
        return sendHtml(
          res,
          200,
          renderShell({
            title: "backup · tun",
            brand: "tun · backup",
            activeZone: `${PREFIX}/`,
            activeHref: "#health",
            rail,
            body: `<style>${PAGE_STYLE}</style>${renderContent(state)}<script>${PAGE_SCRIPT}</script>`,
          })
        );
      }

      // The same renderer the full page uses, for the poll — so there is no
      // second copy of the page's logic in the browser to drift from it.
      if (req.method === "GET" && url.pathname === "/api/view") {
        const state = await readState({
          runLimit: limitFrom(url, "runs", 6),
          commitLimit: limitFrom(url, "commits", 6),
        });
        return sendHtml(res, 200, renderContent(state));
      }

      // The machine-readable state, for anything that would rather not parse
      // HTML — including `userdata-git-history`, which reads this service's
      // git history for its archived tier.
      if (req.method === "GET" && url.pathname === "/api/state") {
        const state = await readState({
          runLimit: limitFrom(url, "runs", 6),
          commitLimit: limitFrom(url, "commits", 6),
        });
        return sendJson(res, 200, state);
      }

      // ---- the archived tier, read by hub over the internal plane --------
      // (userdata-git-history task 6.2)
      //
      // INTERNAL, NOT THROUGH THE GATEWAY. hub calls these service-to-service
      // with INTERNAL_TOKEN; the shared check above is the only gate, and the
      // gateway has no route to them at all.
      //
      // THREE ENDPOINTS, NOT ONE, and that is the D-UP4 rule applied across a
      // service boundary: the listing carries no document, and a version's
      // document and its diff are fetched only when the operator opens that
      // entry. One account's document is ~110 KB; a listing that inlined
      // every version of it would be the exact failure this change exists to
      // fix, moved from the backup repo into a web page.
      //
      // Everything here DEGRADES rather than throws. hub renders only this
      // half of the panel from it, and a backup outage must never take the
      // per-PATCH tier down with it.
      if (req.method === "GET" && url.pathname === "/api/exports/history") {
        const uid = url.searchParams.get("uid") || "";
        const result = await accountHistory(uid, { limit: limitFrom(url, "limit", 50) });
        return sendJson(res, result.ok ? 200 : 404, result);
      }

      if (req.method === "GET" && url.pathname === "/api/exports/version") {
        const uid = url.searchParams.get("uid") || "";
        const sha = url.searchParams.get("sha") || "";
        const wantDiff = url.searchParams.get("diff") === "1";
        const result = await accountVersion(uid, sha, { diff: wantDiff });
        return sendJson(res, result.ok ? 200 : 404, result);
      }

      if (req.method === "POST" && url.pathname === "/api/run") {
        const result = requestRun();
        return sendJson(res, result.status, { ok: result.ok, message: result.message });
      }

      if (req.method === "POST" && url.pathname === "/api/settings") {
        let input;
        try {
          input = JSON.parse((await readBody(req)) || "{}");
        } catch {
          return sendJson(res, 400, { ok: false, message: "the request body is not JSON" });
        }
        const result = saveSettings(input);
        return sendJson(res, result.status, { ok: result.ok, message: result.message });
      }

      return sendText(res, 404, "not found");
    } catch (err) {
      // The whole error on stderr, where a stack trace belongs; a short one to
      // the operator. Nothing here is on the device plane, so a readable body
      // is safe — but it must still never be the page, because an error page
      // that replaces the console hides the conditions the console reports.
      console.error(err);
      if (!res.headersSent) sendJson(res, 500, { ok: false, message: err.message });
      else res.end();
    }
  });
}
