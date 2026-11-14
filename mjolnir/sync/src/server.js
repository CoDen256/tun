// mjolnir-sync — the DEVICE PLANE half of what used to be one `hub` process.
//
// Serves exactly one route family: GET/PATCH/POST/DELETE
// /mjolnir/userdata/<uid>, the endpoint mod 2080's progress-sync shim
// (patches/js/2080-progress-sync-shim.edited.js) talks to. Nothing else lives
// here, on purpose.
//
// WHY IT IS A SEPARATE PROCESS (zone-isolation): the operator console is the
// most frequently redeployed service in the stack, and the device path has no
// rollback — there is an APK in the field. Sharing a process meant every
// workbench deploy interrupted device sync, and a fault in either took down
// the other.
//
// EVERY BYTE OF THIS CONTRACT IS COPIED FROM hub/src/server.js, NOT REDESIGNED.
// The handlers below are the same code, with the same comments, because the
// device cannot be rolled back if any of it is wrong. In particular:
//
//   - D-S2: GET auto-creates factory defaults and NEVER reports "not found".
//   - D-S4: an auto-created document carries `_justCreated: true`, which the
//     startup restore companion uses to tell a real document apart from this
//     call's own creation. Mod 2080 ignores the field entirely.
//   - The six device-status fields are STRIPPED from a PATCH body rather than
//     merged, because an older installed build still sends them and they must
//     never pollute the synced document.
//   - An unauthenticated request returns **302 to a login page, not 401**.
//     That is surprising for a device-facing endpoint and it is deliberate
//     here: it is what hub did, byte for byte, because `requireAuth` only
//     answers 401 for paths containing `/api/`. Preserving a wrong-looking
//     status code is the whole point of a frozen contract. `unified-auth`
//     moves this gate into the gateway, which is the right place to change it
//     — in a change that can coordinate with the device.
//
// This service does NOT run migrations. Exactly one service owns each
// database's schema (zone-isolation task 1.4) and for `mjolnir` that is the
// workbench; two processes racing one migration table is a real failure mode,
// prevented here by assignment rather than by locking.
import http from "node:http";
import { getOrCreate, merge, replace, remove } from "../../hub/src/userdata.js";
import { requireAuth } from "../../../libs/jsservice/auth.js";

const USERDATA_PREFIX = "/mjolnir/userdata/";

function sendJson(res, status, body) {
  const data = JSON.stringify(body);
  res.writeHead(status, { "Content-Type": "application/json; charset=utf-8", "Content-Length": Buffer.byteLength(data) });
  res.end(data);
}

// P46, generalised (2026-11-14). `sendJson` is for SUCCESS ONLY. Every
// non-success answer on this service goes through `sendOpaque`: a status code
// and an EMPTY body, nothing a `res.json()` with no status check can resolve.
//
// The original P46 fix patched the two branches that were known to fail (the
// readiness gate and the connection-error branch) and left
// `sendJson(res, 500, {error: err.message})` as the catch-all. That is not a
// safe default, it is a safe special case — and an independent reviewer walked
// straight through it: `decodeURIComponent('%ff')` throws `URIError` BEFORE
// any database call, so neither patched branch ran and the device path emitted
// `{"error":"URI malformed"}` with a 500. Mod 2080's shim
// (patches/js/2080-progress-sync-shim.edited.js:96) is
// `method === 'GET' ? res.json() : res.json().catch(...)` — the GET branch has
// no status check AND no catch, so that object becomes THE USERDATA DOCUMENT.
//
// So the rule is enforced at the only place that cannot be walked around: the
// default. Unknown exceptions included.
function sendOpaque(res, status) {
  if (res.headersSent) return res.end();
  res.writeHead(status, { "Content-Length": 0 });
  return res.end();
}

// The uid is the Firebase uid (D-S1), url-encoded by the shim with
// `encodeURIComponent(id)`. Two separate defects made this worth validating
// rather than passing straight through:
//
//   1. `decodeURIComponent` THROWS on an invalid percent-escape (`%ff`,
//      `%c3%28`). Unhandled, that reached the catch-all above.
//   2. `getOrCreate` WRITES ON GET (D-S2 auto-creation), with no shape check
//      at all — so `GET /mjolnir/userdata/<5000 chars>` answered 200 and
//      inserted a row. An unauthenticated attacker cannot reach this (the
//      gateway gates the prefix), but "only authenticated clients can fill
//      the table" is not a design, it is an accident.
//
// The charset is deliberately WIDER than Firebase's own 28-character
// alphanumeric uid (the live device's is `q1Px3MgvOZVBdkpM9DKmFBnDnMi1`) and
// the length cap is generous, because the field APK cannot be rolled back and
// this must never be the thing that rejects a real device. It rejects only
// what no uid is: empty, over-long, or containing a character outside
// `[A-Za-z0-9._:@-]`.
const UID_RE = /^[A-Za-z0-9._:@-]{1,128}$/;

function decodeUid(encoded) {
  let uid;
  try {
    uid = decodeURIComponent(encoded);
  } catch {
    return null; // invalid percent-escape — never a real device
  }
  return UID_RE.test(uid) ? uid : null;
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on("data", (c) => chunks.push(c));
    req.on("end", () => resolve(Buffer.concat(chunks)));
    req.on("error", reject);
  });
}

async function readJson(req) {
  const body = await readBody(req);
  return body.length ? JSON.parse(body.toString("utf8")) : {};
}

export function createServer(config, boot) {
  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://localhost");

      // unified-auth 4.1. The shared check, like every other service: the
      // gateway-verified `X-Tun-Operator` marker, or INTERNAL_TOKEN.
      //
      // THE DEVICE'S OWN TOKEN IS NOT CHECKED HERE ANY MORE — it is checked
      // by the gateway, one hop earlier (`not header Authorization "Bearer
      // {$OPERATOR_TOKEN}"` in the /mjolnir/userdata/* block), which then
      // sets the marker. Nothing the device sends changed; what changed is
      // which process reads it.
      //
      // `rejectWith: "redirect"` reproduces the frozen contract EXACTLY: 302
      // to /mjolnir/login?next=<escaped path>, EMPTY BODY. Never a 401 and
      // never anything parseable — mod 2080's shim calls res.json() with no
      // status check (P46). In the deployed stack this branch is unreachable
      // from the device, because the gateway rejects first with byte-identical
      // output; it is kept exact because "unreachable" is a deployment fact
      // and the contract is a code one.
      //
      // UNCONDITIONAL, where the old gate was `if (config.operatorAuthToken)`
      // — an unset value used to leave the device plane wide open.
      // `prefix: ""` — mjolnir-sync answers its probe at a bare `/_health`,
      // which is also the Python services' path. The exemption is the shared
      // one in libs/jsservice/auth.js (2026-11-14, P54); it is EXACT
      // equality, never a suffix match, precisely so that no uid under
      // `/mjolnir/userdata/<uid>` can be shaped to look like a probe and slip
      // past this gate on a device path.
      if (!requireAuth(req, res, config.internalToken, { rejectWith: "redirect", loginPath: "/mjolnir/login", prefix: "" })) return;

      // Liveness/readiness, for the container health check only — never part
      // of the device contract, and the one path the shared check above lets
      // through unauthenticated.
      if (url.pathname === "/_health") {
        // 503 when degraded, not a 200 whose BODY says degraded. The probe
        // keys on the status code, and a body nobody parses is not a signal.
        const ready = boot.dbReady();
        return sendJson(res, ready ? 200 : 503, {
          service: "mjolnir-sync",
          status: boot.status(),
          db: ready,
        });
      }

      if (url.pathname.startsWith(USERDATA_PREFIX) && url.pathname.length > USERDATA_PREFIX.length) {
        // userdata-console (D-C1): this path segment is the real Firebase uid
        // (D-S1) — `userdata`/`userdata_history` stay keyed by it unchanged.
        const uid = decodeUid(url.pathname.slice(USERDATA_PREFIX.length));

        // A malformed or implausible uid is answered BEFORE the method
        // dispatch and before any database call: 404, empty body, no row
        // created, on every method. The device never sends one — it sends a
        // single-segment Firebase uid — so this changes nothing the frozen
        // contract describes, and it is the only ordering under which a GET
        // with a junk uid cannot write.
        if (uid === null) return sendOpaque(res, 404);

        // METHOD DISPATCH FIRST, readiness second. Independent review caught
        // this the other way round: the readiness gate sat above the method
        // check, so during a database outage a PUT answered 503 where the
        // frozen contract says 405. Whether the database is up has nothing to
        // do with whether a method is supported, and the device is entitled
        // to the same 405 either way.
        const SUPPORTED = ["GET", "PATCH", "POST", "DELETE"];
        if (!SUPPORTED.includes(req.method)) {
          res.writeHead(405, { "Content-Type": "text/plain" });
          return res.end("method not allowed");
        }

        // The database is this service's one hard dependency.
        //
        // 503, WITH AN EMPTY BODY. Both halves matter, and the body is the
        // half that nearly shipped a device bug.
        //
        // mod 2080's shim does NOT check the status code. It calls
        // `res.json()` unconditionally:
        //
        //     return fetch(...).then(res => method === 'GET' ? res.json() : ...)
        //
        // Pre-split a database outage produced a 502 from the gateway with an
        // empty body, so `res.json()` REJECTED and the shim took its error
        // path. The first version of this guard answered 503 with
        // `{"error":"database unavailable"}` — valid JSON, so `res.json()`
        // RESOLVED and handed mod 2080 that object AS IF IT WERE A USERDATA
        // DOCUMENT: no decks, no cards, no progress. Verified in isolation:
        //   502 + empty body  -> rejected   (the pre-split error path)
        //   503 + JSON body   -> RESOLVED with {error: ...}   <-- the bug
        //   503 + empty body  -> rejected   (identical to pre-split)
        //
        // So: an empty body, which reproduces the pre-split rejection exactly,
        // while the status code itself becomes honest — 503 says "I am here,
        // my dependency is not", which a 502 cannot distinguish from a
        // crashed service. The device cannot tell the difference; the
        // operator reading gateway logs can.
        //
        // Never return a parseable body on this path.
        if (!boot.dbReady()) return sendOpaque(res, 503);

        if (req.method === "GET") {
          const { doc, created } = await getOrCreate(uid);
          // D-S4: the startup restore module (patches/js/progress-sync-
          // restore-companion.js) needs to tell "a real existing document"
          // apart from "this GET call's own auto-creation" (D-S2) — mod 2080's
          // own shim ignores this extra field entirely.
          return sendJson(res, 200, created ? { ...doc, _justCreated: true } : doc);
        }
        if (req.method === "PATCH") {
          // `deviceId` and the device-status fields it used to ride alongside
          // are stripped rather than merged into the synced doc — an older
          // installed build may still send them, and they must never pollute
          // the userdata document itself.
          const STATUS_FIELDS = ["deviceId", "activeBuildId", "pendingBuildId", "audioCached", "audioTotal", "lastFetchError"];
          const body = await readJson(req);
          const patch = {};
          for (const [key, value] of Object.entries(body)) {
            if (!STATUS_FIELDS.includes(key)) patch[key] = value;
          }
          const doc = await merge(uid, patch);
          return sendJson(res, 200, doc);
        }
        if (req.method === "POST") {
          const doc = await readJson(req);
          const written = await replace(uid, doc);
          return sendJson(res, 200, written);
        }
        if (req.method === "DELETE") {
          await remove(uid);
          return sendJson(res, 200, { ok: true });
        }
        res.writeHead(405, { "Content-Type": "text/plain" });
        return res.end("method not allowed");
      }

      res.writeHead(404, { "Content-Type": "text/plain" });
      res.end("not found");
    } catch (err) {
      // A connection-level failure means the database went away AFTER this
      // service was ready. Flip readiness back so the next request gets an
      // honest 503 and the health check reports degraded, rather than every
      // request 500ing with a driver stack trace until someone restarts it.
      boot.noteError(err);
      if (boot.isConnectionError(err)) {
        // Empty body, same reasoning as the readiness gate above: a
        // parseable body here would be handed to mod 2080 as a document.
        return sendOpaque(res, 503);
      }
      console.error(err);
      // THE CATCH-ALL IS NOW FAIL-SAFE, not fail-descriptive. It used to be
      // `sendJson(res, 500, { error: err.message })`, which is how `%ff`
      // shipped `{"error":"URI malformed"}` to the device path. The operator
      // still gets the full error — on stderr, above — which is where a stack
      // trace belongs. The device gets a status code and nothing to parse.
      sendOpaque(res, 500);
    }
  });
}
