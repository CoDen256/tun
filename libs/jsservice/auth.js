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
const MARKER_HEADER = "x-tun-operator"; // node lowercases incoming header names

function tokenFromAuthHeader(req) {
  const header = req.headers.authorization || "";
  return header.startsWith("Bearer ") ? header.slice("Bearer ".length) : null;
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
export function requireAuth(req, res, internalToken, { rejectWith = "json", loginPath = "/login" } = {}) {
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
