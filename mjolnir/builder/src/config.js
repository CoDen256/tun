// Centralized env reading so server.js/clock.js/bin scripts don't each
// re-derive it slightly differently.
export function loadConfig() {
  const stabburBaseUrl = process.env.STABBUR_BASE_URL;
  // unified-auth 4.6: ONE value for every service-to-service call, replacing
  // STABBUR_AUTH_TOKEN here and SMIA_AUTH_TOKEN elsewhere. builder -> stabbur
  // never passes through the gateway, so the marker is not an option on that
  // leg and the token is what stabbur checks.
  const internalToken = process.env.INTERNAL_TOKEN;
  const dataDir = process.env.DATA_DIR || "../data";
  const publicBase = process.env.TUN_PUBLIC_BASE;
  if (!stabburBaseUrl) throw new Error("STABBUR_BASE_URL is required");
  // D85: stabbur's /api/notes and /api/grammar_rules require a credential on
  // every path (unified-auth 4.5 deleted the /ui and /blob carve-outs) — this
  // was missing entirely until found cross-checking a real pull against
  // stabbur's actual auth module.
  if (!internalToken) throw new Error("INTERNAL_TOKEN is required (the one service-to-service token)");
  if (!publicBase) throw new Error("TUN_PUBLIC_BASE is required (passed through to the publish module)");
  return {
    stabburBaseUrl,
    internalToken,
    dataDir,
    publicBase,
    sourceLang: process.env.SOURCE_LANG || "no",
  };
}
