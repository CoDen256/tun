import fs from "node:fs";

// assembly-tab-usability item 3 (task 3.1): a re-runnable extractor over
// the STOCK bundle this repo's own base folder ships —
// `base/smali.mjolnir.merged/assets/index.android.bundle`. Never
// hand-transcribed (the old hub preview's whole defect, per proposal.md),
// and NEVER WRITES to base/ (D04 — base/ is read-only input, this only
// calls `fs.readFileSync`).
//
// Anchored on literal tokens that are stable across an APK rebase — class
// names, theme key names, and the small set of fixed numeric/color
// constants that make up this app's actual design system — NOT on
// minifier-assigned single-letter identifiers (`f`, `u`, `l`...), which
// *do* drift between builds and between unrelated call sites reusing the
// same letter. Every value below was confirmed by reading the real bundle
// text during the assembly-tab-usability design session (see design.md's
// table); the regexes here are what makes that confirmation re-runnable
// instead of a one-time transcription that can silently go stale.
//
// Fails LOUDLY (throws) the instant an anchor it expects is missing,
// rather than emitting a smaller map that merely looks complete — design.md's
// risk note calls that exact failure mode "the failure mode that would
// reintroduce exactly this bug."

function must(regex, text, label) {
  const m = text.match(regex);
  if (!m) {
    throw new Error(
      `card-style extractor: could not find "${label}" in the bundle — ` +
        `a style map's own shape has changed since this extractor was written; ` +
        `refusing to emit a partial/shrunk catalogue. Re-check the anchor regex ` +
        `against the new bundle text before trusting this preview again.`
    );
  }
  return m;
}

// Balanced-brace object literal starting at the first "{" at/after
// `fromIdx`. Ignores braces inside quoted strings so a stray "}"/"{"
// inside a literal (none in the themes today, but cheap insurance) can
// never truncate the scan early.
function sliceBalancedObject(text, fromIdx, label) {
  const start = text.indexOf("{", fromIdx);
  if (start === -1) throw new Error(`card-style extractor: expected an object literal for "${label}", found none`);
  let depth = 0;
  let inStr = null;
  for (let i = start; i < text.length; i++) {
    const c = text[i];
    if (inStr) {
      if (c === "\\") {
        i++;
        continue;
      }
      if (c === inStr) inStr = null;
      continue;
    }
    if (c === "'" || c === '"') {
      inStr = c;
      continue;
    }
    if (c === "{") depth++;
    else if (c === "}") {
      depth--;
      if (depth === 0) return text.slice(start, i + 1);
    }
  }
  throw new Error(`card-style extractor: unbalanced object literal while scanning for "${label}"`);
}

function themeColor(objText, key, themeLabel, { required = true } = {}) {
  const m = objText.match(new RegExp(`(?:^|[,{])${key}:'(#[0-9A-Fa-f]{3,8}|transparent|[a-zA-Z]+)'`));
  if (!m) {
    if (required) throw new Error(`card-style extractor: ${themeLabel} theme is missing "${key}"`);
    return undefined;
  }
  return m[1];
}

export function extractCardStyle(bundlePath) {
  const text = fs.readFileSync(bundlePath, "utf8");

  // --- normalize(t) = round(t * width/375 * (isTablet ? 0.7 : 1)) -------
  must(
    /normalize=function\(\w\)\{var \w=\w\/375,\w=\w\?\.7:1;return \w\.PixelRatio\.roundToNearestPixel\(\w\*\w\*\w\)\}/,
    text,
    "normalize() scaling rule"
  );

  // --- class map (feeds the HTML renderer's classesStyles) --------------
  const lg = must(/lg:\{fontSize:\(0,\w\.normalize\)\((\d+)\)\}/, text, "class .lg")[1];
  const arialFont = must(
    /arialFont:\{fontFamily:\w\.Fonts\.arialRegular,fontSize:\(0,\w\.normalize\)\((\d+)\)\}/,
    text,
    "class .arialFont"
  )[1];
  const arialFontNormal = must(
    /arialFontNormal:\{fontFamily:\w\.Fonts\.arialRegular,fontSize:\(0,\w\.normalize\)\((\d+)\)\}/,
    text,
    "class .arialFontNormal"
  )[1];
  must(/boldItalic:\{fontFamily:\w\.Fonts\.poppinsBoldItalic\}/, text, "class .boldItalic");
  must(/underline:\{textDecorationLine:'underline'\}/, text, "class .underline");
  const teal = must(/teal:\{color:'(#[0-9A-Fa-f]{6})'\}/, text, "class .teal color")[1];
  const dodgerBlue = must(/dodgerBlue:\{color:'(#[0-9A-Fa-f]{6})'\}/, text, "class .dodgerBlue color")[1];
  const royalRed = must(/royalRed:\{color:'(#[0-9A-Fa-f]{6})'\}/, text, "class .royalRed color")[1];
  const blueViolet = must(/blueViolet:\{color:'(#[0-9A-Fa-f]{6})'\}/, text, "class .blueViolet color")[1];
  const burntOrange = must(/burntOrange:\{color:'(#[0-9A-Fa-f]{6})'\}/, text, "class .burntOrange color")[1];
  const supWrapMx = must(
    /supWrap:\{flexDirection:'row',alignItems:'flex-start',justifyContent:'center',marginHorizontal:\(0,\w\.normalize\)\((\d+)\)\}/,
    text,
    "class .supWrap (flex row, top-aligned)"
  )[1];
  const sup = must(/sup:\{fontSize:\(0,\w\.normalize\)\((\d+)\)\}/, text, "class .sup")[1];
  const tipOfTheDay = must(
    /tipOfTheDay:\{fontFamily:\w\.Fonts\.poppinsSemiBold,color:'#fff',fontSize:\(0,\w\.normalize\)\((\d+)\)\}/,
    text,
    "class .tipOfTheDay"
  )[1];

  // --- tag styles (div/b/i/p/a) ------------------------------------------
  const divBase = must(
    /div:\{color:\w\.default\.getTheme\(\)\.cardText,fontSize:\(0,\w\.normalize\)\(\w\|\|(\d+)\),fontFamily:\w\.Fonts\.poppinsRegular\}/,
    text,
    "tag <div> (cardText base font size)"
  )[1];
  must(
    /b:Object\.assign\(\{\},\w\.Platform\.select\(\{ios:\{fontFamily:\w\.Fonts\.poppinsBold,fontWeight:'800',color:\w\.default\.getTheme\(\)\.headingAccent\}/,
    text,
    "tag <b> (poppinsBold, headingAccent)"
  );
  must(
    /i:\{fontFamily:\w\.Fonts\.poppinsRegular,fontStyle:'italic',textDecorationLine:'underline'\}/,
    text,
    "tag <i> (italic + underline)"
  );
  const pMarginBottom = must(
    /p:\{marginTop:0,marginBottom:\(0,\w\.normalize\)\((\d+)\)\}/,
    text,
    "tag <p> (marginBottom)"
  )[1];
  must(/a:\{color:\w\|\|\w\.default\.getTheme\(\)\.headingAccent/, text, "tag <a> (headingAccent)");

  // --- the study card's own geometry -------------------------------------
  const cardWidth = must(
    /card:\{width:\(0,\w\.normalize\)\((\d+)\),height:\w,borderRadius:\(0,\w\.normalize\)\((\d+)\),alignItems:'center'\}/,
    text,
    "card {width, borderRadius}"
  );
  const cardRadius = cardWidth[2];
  const cardWidthValue = cardWidth[1];
  const cardBorder = must(
    /\[\w\.card,\{borderWidth:\(0,\w\.normalize\)\((\d+)\),borderColor:\w\.default\.getTheme\(\)\.borderColor\}\]/,
    text,
    "card border (borderWidth in borderColor)"
  )[1];
  const cFormula = must(
    /var \w=\w\.height-\(\w\.isIos\?\(0,\w\.isIphoneX\)\(\)\?70:20:0\)-\(0,\w\.normalize\)\((\d+)\)/,
    text,
    "C = screenHeight - (iOS inset) - normalize(200)"
  )[1];
  const divider = must(
    /textDivider:\{width:'(\d+)%',height:\(0,\w\.normalize\)\((\d+)\),backgroundColor:\w\.default\.getTheme\(\)\.borderColor\}/,
    text,
    "textDivider {width%, height}"
  );

  // The three faces: 0.28C (N, plain touchable), 0.28C (E, ScrollView),
  // 0.44C (X, ScrollView) — confirmed as literal substrings next to each
  // other in the same card component, not independently-plausible numbers.
  if (!text.includes("height:.28*C}")) throw new Error('card-style extractor: N face "0.28*C" height not found');
  if (!text.includes("height:.28*C,paddingVertical:"))
    throw new Error('card-style extractor: E face "0.28*C" scrollable height not found');
  if (!text.includes("height:.44*C,paddingVertical:"))
    throw new Error('card-style extractor: X face "0.44*C" scrollable height not found');

  // --- both themes, by token name -----------------------------------------
  const lightStart = text.indexOf("light:{background:'#fff'");
  if (lightStart === -1) throw new Error('card-style extractor: could not locate the "light" theme object');
  const lightObj = sliceBalancedObject(text, lightStart + 6, "light theme");

  const darkStart = text.indexOf("dark:{background:'#1B1D21'");
  if (darkStart === -1) throw new Error('card-style extractor: could not locate the "dark" theme object');
  const darkObj = sliceBalancedObject(text, darkStart + 5, "dark theme");

  const light = {
    cardText: themeColor(lightObj, "cardText", "light"),
    studyCardHeading: themeColor(lightObj, "studyCardHeading", "light"),
    headingAccent: themeColor(lightObj, "headingAccent", "light"),
    headingGray: themeColor(lightObj, "headingGray", "light"),
    green: themeColor(lightObj, "green", "light"),
    cardBackground: themeColor(lightObj, "cardBackground", "light"),
    borderColor: themeColor(lightObj, "borderColor", "light"),
  };
  // Dark has NO cardBackground key — that is the one value design.md flags
  // as a MAPPING, not an extraction: #1B1D21 is read off archivedBackground
  // / navigationRoot instead. Confirm the absence rather than assuming it,
  // so a future bundle that *adds* a dark cardBackground key is noticed
  // (and the mapping comment below would then be wrong, loudly).
  const darkHasCardBackground = /(?:^|[,{])cardBackground:/.test(darkObj);
  if (darkHasCardBackground) {
    throw new Error(
      "card-style extractor: the dark theme now HAS a cardBackground key — " +
        "the archivedBackground/navigationRoot mapping this extractor (and the " +
        "preview) assumes is stale. Update extractCardStyle.js before trusting " +
        "the dark card background again."
    );
  }
  const dark = {
    cardText: themeColor(darkObj, "cardText", "dark"),
    studyCardHeading: themeColor(darkObj, "studyCardHeading", "dark"),
    headingAccent: themeColor(darkObj, "headingAccent", "dark"),
    headingGray: themeColor(darkObj, "headingGray", "dark"),
    green: themeColor(darkObj, "green", "dark"),
    // MAPPED, not extracted (design.md): dark has no cardBackground key.
    cardBackground: themeColor(darkObj, "archivedBackground", "dark"),
    cardBackgroundSource: "archivedBackground",
    borderColor: themeColor(darkObj, "borderColor", "dark"),
  };

  return {
    normalize: { referenceWidth: 375, tabletFactor: 0.7 },
    classes: {
      lg: { fontSize: Number(lg) },
      arialFont: { fontFamily: "Arial", fontSize: Number(arialFont) },
      arialFontNormal: { fontFamily: "Arial", fontSize: Number(arialFontNormal) },
      italic: {},
      boldItalic: {},
      underline: {},
      green: {},
      blue: {},
      darkBlue: {},
      red: { color: "red" },
      teal: { color: teal },
      dodgerBlue: { color: dodgerBlue },
      royalRed: { color: royalRed },
      blueViolet: { color: blueViolet },
      burntOrange: { color: burntOrange },
      center: {},
      left: {},
      supWrap: { marginHorizontal: Number(supWrapMx) },
      sup: { fontSize: Number(sup) },
      tipOfTheDay: { fontSize: Number(tipOfTheDay), color: "#fff" },
    },
    tags: {
      div: { fontSize: Number(divBase) },
      b: {},
      i: {},
      p: { marginBottom: Number(pMarginBottom) },
      a: {},
    },
    card: {
      width: Number(cardWidthValue),
      borderRadius: Number(cardRadius),
      borderWidth: Number(cardBorder),
      heightInsetBase: Number(cFormula),
    },
    divider: { widthPct: Number(divider[1]), height: Number(divider[2]) },
    faces: { N: 0.28, E: 0.28, X: 0.44 },
    themes: { light, dark },
  };
}
