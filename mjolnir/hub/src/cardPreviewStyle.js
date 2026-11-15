import { extractCardStyle } from "../../tool/src/extractCardStyle.js";
import { extractCardSymbols } from "../../tool/src/extractCardSymbols.js";

// assembly-tab-usability item 3: computed once per process from this
// repo's own `base/` folder (D04 — read-only input, never written to) and
// memoized, since `base/` never changes while hub is running. A failed
// extraction is NOT cached as a silent empty result — it's rethrown every
// time, so a broken anchor surfaces on every page load until fixed, never
// quietly degrading into a shrunk catalogue (design.md's risk note).
let cached = null; // { bundlePath, style, symbols } | { bundlePath, error }

function bundlePathFor(baseFolderDir) {
  return `${baseFolderDir}/assets/index.android.bundle`;
}

export function getCardPreviewData(baseFolderDir) {
  const bundlePath = bundlePathFor(baseFolderDir);
  if (cached && cached.bundlePath === bundlePath) {
    if (cached.error) throw cached.error;
    return cached;
  }
  try {
    const style = extractCardStyle(bundlePath);
    const symbols = extractCardSymbols(bundlePath);
    cached = { bundlePath, style, symbols };
    return cached;
  } catch (err) {
    cached = { bundlePath, error: err };
    throw err;
  }
}

// Test-only: the module cache would otherwise leak between fixtures/base
// folders within the same test run (same pattern as cardText.js's
// `resetCardIndexCache`).
export function resetCardPreviewDataCache() {
  cached = null;
}

// Which on-disk font files task 3.3 serves, and the family name the CSS
// below asks a browser for — single source for both the route allowlist
// (server.js) and the @font-face declarations here, so a renamed font file
// can't silently desync the two.
export const CARD_PREVIEW_FONTS = [
  { file: "Poppins-Regular.ttf", family: "Poppins", weight: 400, style: "normal" },
  { file: "Poppins-Italic.ttf", family: "Poppins", weight: 400, style: "italic" },
  { file: "Poppins-Bold.ttf", family: "Poppins", weight: 700, style: "normal" },
  { file: "Poppins-BoldItalic.ttf", family: "Poppins", weight: 700, style: "italic" },
  { file: "Poppins-SemiBold.ttf", family: "Poppins", weight: 600, style: "normal" },
  { file: "arial.ttf", family: "CardArial", weight: 400, style: "normal" },
];

export function cardPreviewFontFaceCss() {
  return CARD_PREVIEW_FONTS.map(
    (f) =>
      `@font-face{font-family:'${f.family}';font-weight:${f.weight};font-style:${f.style};src:url('/mjolnir/cards/fonts/${f.file}') format('truetype');font-display:swap;}`
  ).join("\n");
}
