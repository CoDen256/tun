import { requireInternalToken } from "../../../libs/jsservice/auth.js";
// Centralized env reading so server.js/clock.js/bin scripts don't each
// re-derive it slightly differently.
export function loadConfig() {
  const stabburBaseUrl = process.env.STABBUR_BASE_URL;
  // unified-auth 4.6: ONE value for every service-to-service call, replacing
  // STABBUR_AUTH_TOKEN here and SMIA_AUTH_TOKEN elsewhere. builder -> stabbur
  // never passes through the gateway, so the marker is not an option on that
  // leg and the token is what stabbur checks.
  // Operator plane: required at boot, via the SHARED assertion rather than a
  // hand-written `if` — one contract, both languages (P55). The bespoke throw
  // that used to be further down said the same thing in different words, and
  // hub's copy of this line said nothing at all.
  const internalToken = requireInternalToken();
  const dataDir = process.env.DATA_DIR || "../data";
  const publicBase = process.env.TUN_PUBLIC_BASE;
  if (!stabburBaseUrl) throw new Error("STABBUR_BASE_URL is required");
  if (!publicBase) throw new Error("TUN_PUBLIC_BASE is required (passed through to the publish module)");
  return {
    stabburBaseUrl,
    internalToken,
    dataDir,
    publicBase,
    sourceLang: process.env.SOURCE_LANG || "no",
  };
}
