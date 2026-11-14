// auth.js — THE operator/internal check for every Node service
// (mjolnir-hub, mjolnir-builder, mjolnir-sync).
//
// `unified-auth` 4.1/4.2 replaced the whole mechanism. What was here before
// was the cookie-or-bearer check D-H6 grew for hub, moved verbatim into
// libs/ by zone-isolation, plus the login page and the login POST handler
// that went with it. All three are gone: the gateway is the gate now
// (`basic_auth` on all seven operator zones, unified-auth 3.1), so a login
// page inside a service would be a second credential store and a 302 to it
// would be a redirect loop for anything the gateway already let through.
//
// The rule, from `unified-auth/design.md`:
//
//     allow if  the gateway-verified marker header is present
//     allow if  Authorization: Bearer INTERNAL_TOKEN
//     else      reject
//
// THE MARKER IS ONLY TRUSTWORTHY BECAUSE OF TWO THINGS OUTSIDE THIS FILE:
// the gateway deletes any inbound copy before any route is considered
// (site-level `request_header -X-Tun-Operator`, unified-auth 3.5) and sets
// it only after the credential check passes; and no service publishes a port
// outside the loopback interface in production (4.7). Both are requirements,
// not conventions.
//
// HOW THE REJECTION IS SHAPED IS A DEVICE-CONTRACT MATTER, hence `rejectWith`.
// `/mjolnir/userdata/<uid>` must answer an unauthenticated request with a
// **302 carrying an EMPTY body**, never a 401 and never anything parseable:
// mod 2080's progress-sync shim calls `res.json()` with no status check, so a
// parseable error body is handed to the app AS userdata (P46). That shape is
// frozen — there is an APK in the field — so mjolnir-sync passes
// `rejectWith: "redirect"` and everything else takes the plain 401. In the
// deployed stack the gateway rejects first and this path is only reached by
// something talking to the service directly, which production does not allow;
// it is kept exact anyway, because "unreachable" is a deployment fact and the
// contract is a code one.
//
// THE ONE EXEMPTION LIVES HERE, not in the services (2026-11-14, P54).
// `libs/pyservice/auth.py` has carried `UNAUTHENTICATED_PATHS = ("/_health",)`
// since unified-auth 4.5 and its docstring claimed "/_health" was the one
// exemption in the whole ecosystem. That was true of the Python half only.
// The Node half had NO exemption in the library, and each of the three
// services open-coded its own health branch ABOVE its `requireAuth` call, at
// three different paths — `/mjolnir/_health`, `/builder/_health`, `/_health`.
// Three hand-written exemptions above one check is literally P50's shape: an
// auth decision written more than once can be changed in one copy only, and
// the copy that returns first is the one that decides.
//
// So the predicate is the library's, and the health HANDLER now sits BELOW
// the check in every service — `requireAuth` lets the probe path through and
// the branch runs as it always did. The paths are unchanged, because the
// container probes in mjolnir/compose.yaml hit those exact URLs and a probe
// that 401s is a service that reports unhealthy.
const MARKER_HEADER = "x-tun-operator"; // node lowercases incoming header names

// The container probe, and nothing else. It carries no data, it is never
// routed through the gateway, and a Docker health check cannot present a
// credential. Mirrors UNAUTHENTICATED_PATHS in libs/pyservice/auth.py.
export const HEALTH_PATH = "/_health";

// Each Node service answers the probe under its own URL prefix, because the
// gateway routes by prefix and the probe URL is the service's real one.
// `prefix` is "" for mjolnir-sync, "/mjolnir" for the console, "/builder" for
// the builder. EXACT equality, never a suffix match: `/mjolnir/userdata/…` is
// a device path and no shape of uid may be allowed to look like a probe.
export function isUnauthenticatedPath(pathname, prefix = "") {
  return pathname === `${prefix}${HEALTH_PATH}`;
}

function tokenFromAuthHeader(req) {
  const header = req.headers.authorization || "";
  return header.startsWith("Bearer ") ? header.slice("Bearer ".length) : null;
}

// ONE CONTRACT, BOTH LANGUAGES (2026-11-14, P55). The three implementations
// disagreed about a missing INTERNAL_TOKEN: builder's config.js threw at
// boot, hub's read it and carried on, and the Python services never looked at
// it until a request arrived. All three fail CLOSED, so none was a hole — but
// "fail closed" is not "one contract", and the difference stays invisible
// until the day one of them is relaxed.
//
// REQUIRED EVERYWHERE is the behaviour chosen. It is one ecosystem-wide
// credential in one file (the root .env, D151) that every compose fragment
// already passes to every service, so a service starting without it is
// misconfigured rather than configured differently; tolerating it would turn
// a boot-time misconfiguration into a 401 on a cross-service call hours
// later, at a caller with no way to name the cause — the house's defining
// defect class; and refusing to start is loud and cannot be mistaken for
// health. The marker header needs no configured value at all, so this can
// never leave a service OPEN, only keep it from starting.
//
// Mirrors `require_internal_token()` in libs/pyservice/auth.py.
export function requireInternalToken(env = process.env) {
  const token = env.INTERNAL_TOKEN;
  if (!token) {
    throw new Error(
      "INTERNAL_TOKEN is required (the one service-to-service token; it lives "
      + "in the repository root .env and every compose fragment passes it through)"
    );
  }
  return token;
}

export function isAuthorized(req, internalToken) {
  if (req.headers[MARKER_HEADER]) return true;
  if (!internalToken) return false;
  return tokenFromAuthHeader(req) === internalToken;
}

// Returns true (the request may proceed) or writes the rejection and returns
// false. `internalToken` is INTERNAL_TOKEN; the marker needs no configuration
// at all, which is the point — a service cannot be left open by a missing
// value, only closed by one.
export function requireAuth(req, res, internalToken, { rejectWith = "json", loginPath = "/login", prefix = "" } = {}) {
  // The exemption, applied before anything else and defined above. A service
  // that forgets to pass `prefix` gets the stricter behaviour (its probe
  // 401s and the container reports unhealthy), never a looser one.
  const pathname = new URL(req.url, "http://localhost").pathname;
  if (isUnauthenticatedPath(pathname, prefix)) return true;

  if (isAuthorized(req, internalToken)) return true;

  if (rejectWith === "redirect") {
    const url = new URL(req.url, "http://localhost");
    res.writeHead(302, { Location: `${loginPath}?next=${encodeURIComponent(url.pathname)}` });
    res.end(); // EMPTY BODY. P46 — never anything parseable on a device path.
  } else {
    res.writeHead(401, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ error: "unauthorized" }));
  }
  return false;
}
