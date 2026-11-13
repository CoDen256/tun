// Centralized env reading so server.js/clock.js/bin scripts don't each
// re-derive it slightly differently.
export function loadConfig() {
  const stabburBaseUrl = process.env.STABBUR_BASE_URL;
  const stabburAuthToken = process.env.STABBUR_AUTH_TOKEN;
  const dataDir = process.env.DATA_DIR || "../data";
  const publicBase = process.env.TUN_PUBLIC_BASE;
  if (!stabburBaseUrl) throw new Error("STABBUR_BASE_URL is required");
  // D85: stabbur's /api/notes and /api/grammar_rules require a bearer token
  // on every path except /ui and /blob/ (same shared-token middleware as
  // smia, D-N1) — this was missing entirely until found cross-checking a
  // real pull against stabbur's actual auth.py.
  if (!stabburAuthToken) throw new Error("STABBUR_AUTH_TOKEN is required (stabbur's shared bearer token)");
  if (!publicBase) throw new Error("TUN_PUBLIC_BASE is required (passed through to the publish module)");
  // D-H6: not required — unset disables the operator-auth gate entirely
  // (local/dev ergonomics). Task 7.4's ordering constraint is the real
  // guard: the Caddy routes must never be uncommented for a deploy that
  // left this unset.
  const operatorAuthToken = process.env.OPERATOR_AUTH_TOKEN;
  return {
    stabburBaseUrl,
    stabburAuthToken,
    dataDir,
    publicBase,
    operatorAuthToken,
    sourceLang: process.env.SOURCE_LANG || "no",
  };
}
