import { extractCardStyle } from "../../tool/src/extractCardStyle.js";
import { extractCardSymbols } from "../../tool/src/extractCardSymbols.js";
import { cardFontFaceCss } from "./cardRenderer.js";

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

// Which on-disk font files this preview serves — single source for both
// the route allowlist (server.js) and the @font-face declarations
// `cardRenderer.js#cardFontFaceCss` builds, so a renamed font file can't
// silently desync the two.
//
// card-preview-popup task 2.3: each file is its OWN family name — 'Poppins-
// Regular'/'Poppins-Bold'/'Poppins-Italic'/'Poppins-BoldItalic'/'arial' —
// matching EXACTLY the `fontFamily` strings `extractCardStyle()` resolves
// for tags/classes (tags.b.fontFamily === 'Poppins-Bold', etc; see that
// file's `fontsMap`). There is deliberately no shared 'Poppins' family
// spanning several weights: that is what let a browser (or this CSS, in
// the version before this change) synthesize a heavier/obliqued glyph than
// the device ever draws. `Poppins-SemiBold.ttf` is still served (the
// Classes & tags tab, a later task group, may want to show the dropped
// face), but it backs no tag/class any card ever renders with on device.
export const CARD_PREVIEW_FONTS = [
  { file: "Poppins-Regular.ttf", family: "Poppins-Regular" },
  { file: "Poppins-Italic.ttf", family: "Poppins-Italic" },
  { file: "Poppins-Bold.ttf", family: "Poppins-Bold" },
  { file: "Poppins-BoldItalic.ttf", family: "Poppins-BoldItalic" },
  { file: "Poppins-SemiBold.ttf", family: "Poppins-SemiBold" },
  { file: "arial.ttf", family: "arial" },
];

// Thin wrapper kept here (not duplicated) so hub's font route table and the
// engine's font-face generator stay driven by the one list above; the real
// logic — which families a given extracted style map actually needs, and
// never emitting a weight/style other than normal/normal — lives in
// `cardRenderer.js#cardFontFaceCss` (task 2.3).
export function cardPreviewFontFaceCss(style) {
  return cardFontFaceCss(style, (file) => `/mjolnir/cards/fonts/${file}`);
}
