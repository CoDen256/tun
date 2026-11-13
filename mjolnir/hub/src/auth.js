// D-H6: a bare shared bearer token, same shape as stabbur's/smia's auth.py
// (D-N1) — one long-lived token, env-configured, no per-client identity, no
// scopes. The one real difference from that pattern: stabbur protects a
// JSON API consumed by its own SPA, which can attach `Authorization: Bearer`
// to every fetch after an unauthenticated shell loads. hub/builder render
// full HTML pages server-side — a plain GET navigation never carries a
// custom header, so the token has to also be acceptable via a cookie, set
// once from an unauthenticated `/login` page, for page loads to work at
// all. Both forms check the exact same configured token.
const COOKIE_NAME = "operator_token";

function tokenFromCookie(req) {
  const header = req.headers.cookie || "";
  const match = header.split(";").map((s) => s.trim()).find((s) => s.startsWith(`${COOKIE_NAME}=`));
  return match ? decodeURIComponent(match.slice(COOKIE_NAME.length + 1)) : null;
}

function tokenFromAuthHeader(req) {
  const header = req.headers.authorization || "";
  return header.startsWith("Bearer ") ? header.slice("Bearer ".length) : null;
}

// Returns true (request may proceed) or writes a 401/redirect and returns
// false. `loginPath` stays reachable unauthenticated — the one carve-out
// D-H6 names explicitly.
export function requireAuth(req, res, token, { loginPath = "/login" } = {}) {
  const url = new URL(req.url, "http://localhost");
  if (url.pathname === loginPath) return true;

  const provided = tokenFromAuthHeader(req) || tokenFromCookie(req);
  if (provided && provided === token) return true;

  // Every JSON endpoint in this service's routing lives under `/api/`
  // (`/mjolnir/api/publications`, `/mjolnir/ota/api/*`, `/mjolnir/ota/verify`,
  // `/mjolnir/ota/publish`) — a more reliable signal than `Accept`, which a
  // plain `fetch()` call (test or otherwise) often omits entirely.
  if (url.pathname.includes("/api/") || url.pathname.endsWith("/verify") || url.pathname.endsWith("/publish")) {
    res.writeHead(401, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ error: "unauthorized" }));
  } else {
    res.writeHead(302, { Location: `${loginPath}?next=${encodeURIComponent(url.pathname)}` });
    res.end();
  }
  return false;
}

export function renderLoginPage({ next = "/", error = false, loginPath = "/login" } = {}) {
  return `<!doctype html>
<html>
<head><meta charset="utf-8"><title>mjolnir / hub — sign in</title>
<style>
  body { font-family: system-ui, sans-serif; background: #14171c; color: #e8e6e1; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
  form { background: #1b1f26; border: 1px solid #2a3039; border-radius: 10px; padding: 24px; width: 280px; }
  input { width: 100%; padding: 8px 10px; margin: 8px 0 16px; border-radius: 6px; border: 1px solid #2a3039; background: #0f1216; color: #e8e6e1; box-sizing: border-box; }
  button { width: 100%; padding: 8px; border-radius: 6px; border: none; background: #c6703f; color: #1a0d05; font-weight: 600; cursor: pointer; }
  .error { color: #d1453f; font-size: 13px; margin-bottom: 8px; }
</style>
</head>
<body>
<form method="POST" action="${loginPath}">
  <h3>Operator sign in</h3>
  ${error ? '<div class="error">wrong token</div>' : ""}
  <input type="hidden" name="next" value="${next.replace(/"/g, "&quot;")}">
  <label>Token<input type="password" name="token" autofocus></label>
  <button type="submit">Sign in</button>
</form>
</body>
</html>`;
}

export async function handleLoginPost(req, res, token, { loginPath = "/login" } = {}) {
  const chunks = [];
  for await (const chunk of req) chunks.push(chunk);
  const params = new URLSearchParams(Buffer.concat(chunks).toString("utf8"));
  const provided = params.get("token") || "";
  const next = params.get("next") || "/";

  if (provided !== token) {
    res.writeHead(401, { "Content-Type": "text/html; charset=utf-8" });
    return res.end(renderLoginPage({ next, error: true, loginPath }));
  }

  res.writeHead(302, {
    Location: next,
    "Set-Cookie": `${COOKIE_NAME}=${encodeURIComponent(provided)}; HttpOnly; SameSite=Strict; Path=/`,
  });
  res.end();
}
