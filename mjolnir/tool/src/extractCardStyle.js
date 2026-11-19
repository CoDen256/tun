import fs from "node:fs";

// card-preview-popup task 1 (tasks.md "1. Extractor"): a re-runnable
// extractor over the STOCK bundle this repo's own base folder ships —
// `base/smali.mjolnir.merged/assets/index.android.bundle`. Never
// hand-transcribed, and NEVER WRITES to base/ (D04 — base/ is read-only
// input, this only calls `fs.readFileSync`).
//
// This widens (and corrects) the extractor from assembly-tab-usability:
// that version anchored its face-ratio / card-height-formula regexes on a
// LOOK-ALIKE component (a different screen's card, module ~2024, with
// 0.28/0.28/0.44 faces and a "height - normalize(200)" formula) rather
// than the real study-session card (module ~2131 at the time this was
// written — module ids are NOT trusted as anchors, see below — with
// 0.29/0.29/0.40 faces and `max(normalize(260), windowH - insets -
// normalize(185))`). research/render-research.md (card-preview-popup) is
// the independent read that caught this. The class/theme extraction below
// was already anchored on the real, singular module-1441 definitions and
// didn't have this bug — it is widened here to discover the FULL class
// and tag maps (every key the bundle defines) instead of an enumerated
// subset, and to report which classes lose their fontFamily to
// `systemFonts` filtering, both computed from the extracted data rather
// than named in this file.
//
// Anchoring strategy:
//  - Literal tokens that are stable across an APK rebase (class/tag/theme
//    key names, the small set of fixed numeric/color constants that make
//    up this app's design system) are used as anchors — NOT
//    minifier-assigned single-letter identifiers (`f`, `u`, `l`...), which
//    *do* drift between builds, matched instead with `\w` wildcards.
//  - Metro module ids (e.g. "2131") are NOT used as anchors either: Metro
//    can renumber modules on a rebuild, so this extractor instead finds
//    the right module by its unique *shape* (the `insets.top`/
//    `insets.bottom`/`normalize(185)` formula occurs exactly once in the
//    stock bundle) and then scopes the rest of the card-geometry regexes
//    to that module's own source text, bounded by the surrounding
//    `__d(function(...){...}` markers. This is what keeps the extractor
//    from re-anchoring on the look-alike module again after some future
//    rebase reshuffles module ids.
//
// Fails LOUDLY (throws) the instant an anchor it expects is missing or
// (for the card module) is ambiguous, rather than emitting a smaller map
// that merely looks complete — design.md's risk note calls that exact
// failure mode "the failure mode that would reintroduce exactly this bug."
//
// Output location (task 1.4): this module is the shared location. Both
// `hub` (`hub/src/cardPreviewStyle.js`, `getCardPreviewData`) and
// `builder` (`builder/src/server.js`'s `/builder/api/card-preview`) import
// `extractCardStyle`/`extractCardSymbols` directly from
// `tool/src/extractCardStyle.js` / `tool/src/extractCardSymbols.js` and
// run them against the one stock bundle at
// `<baseFolderDir>/assets/index.android.bundle` (memoized per process —
// see `hub/src/cardPreviewStyle.js`). Nothing here writes a derived JSON
// file: the module + the bundle path IS the shared, re-derivable location.
// `builder-ship-strips` (a parallel in-progress package) is expected to
// read the same two functions the same way; a missing/unreadable bundle
// throws out of this function, and both known callers rethrow rather than
// fall back to invented values (see `hub/src/cardPreviewStyle.js`'s
// comment on why a failed extraction is never cached as a silent empty
// result).

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

function mustExec(regex, text, label) {
  const m = regex.exec(text);
  if (!m) {
    throw new Error(
      `card-style extractor: could not find "${label}" in the bundle — ` +
        `refusing to emit a partial/shrunk catalogue.`
    );
  }
  return m;
}

// Balanced object/array literal starting at the first `openChar` at/after
// `fromIdx`. Ignores braces/brackets inside quoted strings so a stray
// "}"/"{" inside a literal can never truncate the scan early.
function sliceBalanced(text, fromIdx, openChar, closeChar, label) {
  const start = text.indexOf(openChar, fromIdx);
  if (start === -1) throw new Error(`card-style extractor: expected a "${openChar}" literal for "${label}", found none`);
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
    if (c === openChar) depth++;
    else if (c === closeChar) {
      depth--;
      if (depth === 0) return text.slice(start, i + 1);
    }
  }
  throw new Error(`card-style extractor: unbalanced literal while scanning for "${label}"`);
}

function sliceBalancedObject(text, fromIdx, label) {
  return sliceBalanced(text, fromIdx, "{", "}", label);
}

function sliceBalancedArray(text, fromIdx, label) {
  return sliceBalanced(text, fromIdx, "[", "]", label);
}

// Generic parser for a minified object-literal BODY (the text between the
// outer `{`/`}`, exclusive) into [key, rawValueText] pairs, respecting
// nested {}, (), [] and quoted strings so it survives arbitrarily-shaped
// values (plain style objects, `Object.assign(...)` calls, theme-icon JSX
// calls, etc.) without needing a value-shape-specific regex per key. This
// is what makes the class/tag maps DISCOVERED rather than an enumerated,
// hard-coded list of names this file expects to find.
function parseTopLevelEntries(bodyText) {
  const entries = [];
  let i = 0;
  while (i < bodyText.length) {
    while (i < bodyText.length && /[\s,]/.test(bodyText[i])) i++;
    if (i >= bodyText.length) break;
    const keyMatch = /^[A-Za-z_$][\w$]*/.exec(bodyText.slice(i));
    if (!keyMatch) break; // not a plain identifier key — stop defensively
    const key = keyMatch[0];
    i += key.length;
    while (i < bodyText.length && /\s/.test(bodyText[i])) i++;
    if (bodyText[i] !== ":") break;
    i++;
    while (i < bodyText.length && /\s/.test(bodyText[i])) i++;
    let depth = 0;
    let inStr = null;
    const start = i;
    while (i < bodyText.length) {
      const c = bodyText[i];
      if (inStr) {
        if (c === "\\") {
          i += 2;
          continue;
        }
        if (c === inStr) inStr = null;
        i++;
        continue;
      }
      if (c === "'" || c === '"') {
        inStr = c;
        i++;
        continue;
      }
      if (c === "{" || c === "(" || c === "[") {
        depth++;
        i++;
        continue;
      }
      if (c === "}" || c === ")" || c === "]") {
        if (depth === 0) break;
        depth--;
        i++;
        continue;
      }
      if (c === "," && depth === 0) break;
      i++;
    }
    entries.push([key, bodyText.slice(start, i).trim()]);
    if (bodyText[i] === ",") i++;
  }
  return entries;
}

function objectBody(objText) {
  return objText.slice(1, -1);
}

// Resolves one property's raw value text into a structured descriptor.
// Anything this doesn't recognize is kept as `{ raw }` rather than thrown
// on — only a MISSING anchor (a Fonts.* or theme-token reference this
// extractor cannot resolve at all) fails loudly; an unrecognized-but-real
// property on a class/tag this extractor doesn't otherwise care about is
// not a reason to refuse the whole catalogue.
function resolveStyleValue(raw, { fontsMap, lightColors, darkColors }) {
  let m = raw.match(/^\(0,\w+\.normalize\)\((\d+(?:\.\d+)?)\)$/);
  if (m) return { normalize: Number(m[1]) };

  m = raw.match(/^-?\d+(?:\.\d+)?$/);
  if (m) return { literal: Number(m[0]) };

  // `(0,x.normalize)(t||16)`-shaped: a JS-level fallback used only when the
  // caller omits the prop entirely (div's own internal default — distinct
  // from the session font-size default captured separately below).
  m = raw.match(/^\(0,\w+\.normalize\)\(\w+\|\|(\d+(?:\.\d+)?)\)$/);
  if (m) return { normalize: Number(m[1]), fallbackOnly: true };

  m = raw.match(/^'([^']*)'$/);
  if (m) return { literal: m[1] };

  m = raw.match(/^\w+\.Fonts\.(\w+)$/);
  if (m) {
    const font = fontsMap[m[1]];
    if (!font) {
      throw new Error(
        `card-style extractor: a style references Fonts.${m[1]}, which was not found in the extracted Fonts map — ` +
          `the fonts module anchor may have changed; refusing to guess the real font family.`
      );
    }
    return { fontFamily: font };
  }

  m = raw.match(/^\w+\.default\.getTheme\(\)\.(\w+)$/);
  if (m) {
    const token = m[1];
    if (!(token in lightColors) && !(token in darkColors)) {
      throw new Error(
        `card-style extractor: a style references theme token "${token}", which was not found in either theme map.`
      );
    }
    return { themeToken: token, light: lightColors[token], dark: darkColors[token] };
  }

  // `F||r.default.getTheme().headingAccent`-shaped (the <a> tag's
  // overridable link color): resolve the theme fallback, note the override.
  m = raw.match(/^\w+\|\|\w+\.default\.getTheme\(\)\.(\w+)$/);
  if (m) {
    const token = m[1];
    if (!(token in lightColors) && !(token in darkColors)) {
      throw new Error(
        `card-style extractor: a style references theme token "${token}", which was not found in either theme map.`
      );
    }
    return { themeToken: token, light: lightColors[token], dark: darkColors[token], overridable: true };
  }

  return { raw };
}

// Flattens one class/tag's { prop: descriptor } map into the shape the
// renderer actually needs, folding in the systemFonts drop rule (task
// 1.2) — computed from the extracted `systemFonts` list, never a
// hard-coded "these classes drop their font" name list.
function finalizeStyle(propDescriptors, systemFontsSet) {
  const out = {};
  for (const [prop, desc] of Object.entries(propDescriptors)) {
    if (prop === "fontFamily") {
      const family = desc.fontFamily ?? desc.literal;
      if (family === undefined) {
        out.fontFamily = { raw: desc };
        continue;
      }
      if (systemFontsSet.has(family)) {
        out.fontFamily = family;
        out.fontDropped = false;
      } else {
        out.fontDropped = true;
        out.droppedFontFamily = family;
      }
      continue;
    }
    // Any prop whose value is a theme-token reference (`color`,
    // `textDecorationColor`, ...) gets the same `<prop>Token` /
    // `<prop>ByTheme` shape, generically — not just "color" by name. The
    // classesStyles object (`u` in the bundle) is a module-level constant
    // evaluated once, unlike tagsStyles (recomputed per render in a
    // useMemo) — so any class whose color resolves via a theme token is
    // frozen at whichever theme was active when the module first loaded.
    // That is a structural fact of WHERE the value came from, derived
    // here, not a named list of classes.
    if (desc.themeToken !== undefined) {
      out[`${prop}Token`] = desc.themeToken;
      out[`${prop}ByTheme`] = { light: desc.light, dark: desc.dark };
      if (desc.overridable) out[`${prop}Overridable`] = true;
      continue;
    }
    if (prop === "color" && desc.literal !== undefined) {
      out.color = desc.literal;
      continue;
    }
    if (desc.normalize !== undefined) {
      out[prop] = desc.normalize;
      if (desc.fallbackOnly) out[`${prop}FallbackOnly`] = true;
      continue;
    }
    if (desc.literal !== undefined) {
      out[prop] = desc.literal;
      continue;
    }
    // Unrecognized-but-real value (e.g. a ternary like `y?'stroke':void 0`)
    // — kept verbatim rather than thrown on; only a missing Fonts/theme
    // anchor is a hard failure (resolveStyleValue throws for those).
    out[prop] = desc.raw !== undefined ? desc.raw : desc;
  }
  return out;
}

function buildStyleMap(objText, ctx) {
  const entries = parseTopLevelEntries(objectBody(objText));
  const map = {};
  for (const [name, valueText] of entries) {
    if (valueText.startsWith("{") && valueText.endsWith("}")) {
      const propEntries = parseTopLevelEntries(objectBody(valueText));
      const descriptors = {};
      for (const [prop, propRaw] of propEntries) {
        descriptors[prop] = resolveStyleValue(propRaw, ctx);
      }
      map[name] = { __descriptors: descriptors, __raw: valueText };
    } else {
      map[name] = { __raw: valueText };
    }
  }
  return map;
}

// Pulls every `key:'value-or-word'` pair out of an object-literal's body —
// used for the Fonts map and both theme objects, which mix color/name
// strings with non-string values (icon JSX elements for the themes) that
// this intentionally skips rather than trying to resolve.
function stringTokenMap(objText) {
  const body = objectBody(objText);
  const out = {};
  const re = /(?:^|[,{])([A-Za-z_$][\w$]*):'([^']*)'/g;
  let m;
  while ((m = re.exec(body))) {
    out[m[1]] = m[2];
  }
  return out;
}

export function extractCardStyle(bundlePath) {
  const text = fs.readFileSync(bundlePath, "utf8");

  // --- normalize(t) = round(t * width/375 * (isTablet ? 0.7 : 1)) -------
  must(
    /normalize=function\(\w\)\{var \w=\w\/375,\w=\w\?\.7:1;return \w\.PixelRatio\.roundToNearestPixel\(\w\*\w\*\w\)\}/,
    text,
    "normalize() scaling rule"
  );

  // --- Fonts name map (feeds fontFamily resolution everywhere below) -----
  const fontsStart = text.indexOf("poppinsRegular:'Poppins-Regular'");
  if (fontsStart === -1) throw new Error('card-style extractor: could not locate the Fonts name map ("poppinsRegular:\'Poppins-Regular\'")');
  const fontsObjStart = text.lastIndexOf("{", fontsStart);
  const fontsObj = sliceBalancedObject(text, fontsObjStart, "Fonts name map");
  const fontsMap = stringTokenMap(fontsObj);
  for (const required of ["poppinsRegular", "poppinsBold", "poppinsBoldItalic", "poppinsSemiBold", "poppinsItalic", "arialRegular"]) {
    if (!fontsMap[required]) {
      throw new Error(`card-style extractor: the Fonts map is missing "${required}" — cannot resolve fontFamily references.`);
    }
  }

  // --- android defaultSystemFonts ----------------------------------------
  const defaultSystemFontsIdx = text.indexOf("'Roboto','notoserif'");
  if (defaultSystemFontsIdx === -1) throw new Error("card-style extractor: could not locate android's defaultSystemFonts list");
  const defaultSystemFontsArrStart = text.lastIndexOf("[", defaultSystemFontsIdx);
  const defaultSystemFontsArr = sliceBalancedArray(text, defaultSystemFontsArrStart, "android defaultSystemFonts");
  const androidDefaults = [...defaultSystemFontsArr.matchAll(/'([^']+)'/g)].map((m) => m[1]);
  if (androidDefaults.length === 0) throw new Error("card-style extractor: android defaultSystemFonts list parsed empty");

  // --- the card renderer wrapper's systemFonts prop (module 1441) --------
  const sysFontsAnchorIdx = text.indexOf("defaultSystemFonts),[");
  if (sysFontsAnchorIdx === -1) throw new Error('card-style extractor: could not find the renderer\'s systemFonts concat ("defaultSystemFonts),[")');
  const rendererFontsArr = sliceBalancedArray(text, sysFontsAnchorIdx + "defaultSystemFonts),".length, "renderer systemFonts extra list");
  const rendererFontKeys = [...rendererFontsArr.matchAll(/\w+\.Fonts\.(\w+)/g)].map((m) => m[1]);
  if (rendererFontKeys.length === 0) throw new Error("card-style extractor: renderer systemFonts extra list parsed empty");
  const rendererFonts = rendererFontKeys.map((key) => {
    const font = fontsMap[key];
    if (!font) throw new Error(`card-style extractor: systemFonts references Fonts.${key}, missing from the Fonts map`);
    return font;
  });
  const systemFonts = [...androidDefaults, ...rendererFonts];
  const systemFontsSet = new Set(systemFonts);
  // Poppins-SemiBold must NOT be in systemFonts — this is the exact
  // mechanism that drops `.center`/`.tipOfTheDay`'s fontFamily on device.
  // If a future bundle ever added it, every "font dropped" flag below
  // would silently become wrong, so check it explicitly.
  if (systemFontsSet.has(fontsMap.poppinsSemiBold)) {
    throw new Error(
      `card-style extractor: ${fontsMap.poppinsSemiBold} is now IN systemFonts — the "font dropped" logic this ` +
        `extractor derives for .center/.tipOfTheDay is stale. Re-check design.md before trusting the preview.`
    );
  }

  // --- both themes, by token, fully discovered ---------------------------
  const lightStart = text.indexOf("light:{background:'#fff'");
  if (lightStart === -1) throw new Error('card-style extractor: could not locate the "light" theme object');
  const lightObj = sliceBalancedObject(text, lightStart + 6, "light theme");
  const lightColors = stringTokenMap(lightObj);

  const darkStart = text.indexOf("dark:{background:'#1B1D21'");
  if (darkStart === -1) throw new Error('card-style extractor: could not locate the "dark" theme object');
  const darkObj = sliceBalancedObject(text, darkStart + 5, "dark theme");
  const darkColors = stringTokenMap(darkObj);

  for (const required of ["cardText", "headingAccent", "headingGray", "green", "borderColor", "studyCardHeading", "background"]) {
    if (!(required in lightColors)) throw new Error(`card-style extractor: light theme is missing "${required}"`);
    if (!(required in darkColors) && required !== "cardBackground") {
      throw new Error(`card-style extractor: dark theme is missing "${required}"`);
    }
  }

  // Dark has NO cardBackground key — that is a MAPPING, not an extraction:
  // #1B1D21 is read off archivedBackground instead. Confirm the absence
  // rather than assuming it, so a future bundle that *adds* a dark
  // cardBackground key is noticed (and the mapping below would then be
  // stale) loudly rather than silently.
  if ("cardBackground" in darkColors) {
    throw new Error(
      "card-style extractor: the dark theme now HAS a cardBackground key — the archivedBackground mapping this " +
        "extractor assumes is stale. Update extractCardStyle.js before trusting the dark card background again."
    );
  }
  const dark = { ...darkColors, cardBackground: darkColors.archivedBackground, cardBackgroundSource: "archivedBackground" };
  if (!dark.cardBackground) throw new Error('card-style extractor: dark theme has no "archivedBackground" to map cardBackground from');
  const light = { ...lightColors };

  // --- class map and tag map (module 1441) — fully discovered -----------
  // `u={lg:{fontSize:...` is the classesStyles object literal; found by
  // its first key, `lg`, which (unlike minifier-assigned letters) is a
  // real class name stable across a rebase.
  const classesAnchorIdx = text.indexOf("lg:{fontSize:");
  if (classesAnchorIdx === -1) throw new Error('card-style extractor: could not find the classesStyles object (anchor "lg:{fontSize:")');
  const classesObjStart = text.lastIndexOf("{", classesAnchorIdx);
  const classesObj = sliceBalancedObject(text, classesObjStart, "classesStyles object");
  const ctx = { fontsMap, lightColors: light, darkColors: dark };
  const rawClasses = buildStyleMap(classesObj, ctx);
  if (!rawClasses.lg || !rawClasses.center || !rawClasses.supWrap) {
    throw new Error("card-style extractor: classesStyles parsed but is missing expected keys (lg/center/supWrap) — the generic object parser may be out of sync with the bundle's shape");
  }
  const classes = {};
  for (const [name, entry] of Object.entries(rawClasses)) {
    classes[name] = finalizeStyle(entry.__descriptors ?? {}, systemFontsSet);
  }
  if ("bold" in classes) {
    throw new Error(
      'card-style extractor: classesStyles now defines ".bold" — stock cards use it 1,459× assuming it is ' +
        "undefined (styled purely by the <b> tag); a real definition changes device behaviour and this " +
        "extractor/preview must be updated, not silently carry on."
    );
  }

  // tagsStyles (`z={div:{...},b:Object.assign(...),i:{...},p:{...},a:{...}}`,
  // the useMemo return value in the same module).
  const tagsAnchorIdx = text.indexOf("useMemo)(function(){return{div:{color:");
  if (tagsAnchorIdx === -1) throw new Error('card-style extractor: could not find the tagsStyles object (anchor "useMemo)(function(){return{div:{color:")');
  const tagsObjStart = text.indexOf("{div:{color:", tagsAnchorIdx); // the `{` right after "return"
  const tagsObj = sliceBalancedObject(text, tagsObjStart, "tagsStyles object");
  const rawTags = buildStyleMap(tagsObj, ctx);
  if (!rawTags.div || !rawTags.p) {
    throw new Error("card-style extractor: tagsStyles parsed but is missing expected keys (div/p)");
  }
  const tags = {};
  for (const [name, entry] of Object.entries(rawTags)) {
    if (name === "b") continue; // handled specially below (Object.assign + Platform.select)
    tags[name] = finalizeStyle(entry.__descriptors ?? {}, systemFontsSet);
  }

  // `b` is `Object.assign({}, Platform.select({ios:{...},android:{...}}))`
  // — not a plain style object, so resolved with a targeted anchor instead
  // of the generic parser (same "fails loudly" guarantee).
  const bMatch = must(
    /b:Object\.assign\(\{\},\w\.Platform\.select\(\{ios:\{fontFamily:\w\.Fonts\.(\w+),fontWeight:'(\d+)',color:\w\.default\.getTheme\(\)\.(\w+)\},android:\{fontFamily:\w\.Fonts\.(\w+),color:\w\.default\.getTheme\(\)\.(\w+)\}/,
    tagsObj,
    "tag <b> (poppinsBold, headingAccent, Platform.select)"
  );
  const bFontKey = bMatch[4]; // android branch — this is what Android (the device) renders
  const bColorToken = bMatch[5];
  const bFont = fontsMap[bFontKey];
  if (!bFont) throw new Error(`card-style extractor: tag <b> references Fonts.${bFontKey}, missing from the Fonts map`);
  tags.b = {
    fontFamily: systemFontsSet.has(bFont) ? bFont : undefined,
    fontDropped: !systemFontsSet.has(bFont),
    colorToken: bColorToken,
    colorByTheme: { light: light[bColorToken], dark: dark[bColorToken] },
    // iOS additionally sets fontWeight '800' — irrelevant on the device
    // this preview emulates (Android), noted for completeness only.
    iosFontWeight: Number(bMatch[2]),
  };

  // --- the study card's own geometry (module ~2131) ----------------------
  // Anchored on the card-height formula's unique shape (insets.top /
  // insets.bottom / normalize(185)), NOT on a module id — module ids can
  // be renumbered by Metro on a rebuild. Everything else about the card
  // (width/radius/border, face ratios, padding) is then looked up only
  // within this one module's own source text, so a look-alike card
  // component elsewhere in the bundle (the assembly-tab-usability bug)
  // cannot be matched by accident.
  const formulaRe = /Math\.max\((\w+),(\w+)-(\w+)\.top-\3\.bottom-\(0,\w+\.normalize\)\((\d+(?:\.\d+)?)\)\)/;
  const formulaMatch = mustExec(formulaRe, text, "card height formula max(minHeight, windowH - insets.top - insets.bottom - normalize(185))");
  const insetSubtrahend = Number(formulaMatch[4]);
  const formulaIdx = formulaMatch.index;

  const moduleStart = text.lastIndexOf("__d(function", formulaIdx);
  if (moduleStart === -1) throw new Error("card-style extractor: could not find the enclosing module start for the card height formula");
  let moduleEnd = text.indexOf("__d(function", formulaIdx + 1);
  if (moduleEnd === -1) moduleEnd = text.length;
  const cardModuleText = text.slice(moduleStart, moduleEnd);

  const minHeightMatches = [...cardModuleText.matchAll(/\(0,\w+\.normalize\)\((\d+(?:\.\d+)?)\)/g)].map((m) => Number(m[1]));
  if (!minHeightMatches.includes(260)) {
    throw new Error("card-style extractor: the card module does not contain normalize(260) (the card's min-height floor)");
  }

  const cardObjIdx = cardModuleText.indexOf("card:{width:");
  if (cardObjIdx === -1) throw new Error('card-style extractor: could not find "card:{width:" inside the card module');
  const cardObjStart = cardModuleText.lastIndexOf("{", cardObjIdx);
  const cardFullObj = sliceBalancedObject(cardModuleText, cardObjStart, "card component's StyleSheet object");
  const cardEntries = Object.fromEntries(parseTopLevelEntries(objectBody(cardFullObj)));
  if (!cardEntries.card) throw new Error('card-style extractor: StyleSheet object has no "card" key');
  const cardStyleDescriptors = Object.fromEntries(
    parseTopLevelEntries(objectBody(cardEntries.card)).map(([prop, raw]) => [prop, resolveStyleValue(raw, ctx)])
  );
  const cardStyle = finalizeStyle(cardStyleDescriptors, systemFontsSet);
  if (typeof cardStyle.width !== "number" || typeof cardStyle.borderRadius !== "number" || typeof cardStyle.borderWidth !== "number") {
    throw new Error("card-style extractor: the card's width/borderRadius/borderWidth did not resolve to numbers");
  }

  // Face ratios: literal substrings, scoped to the already-identified card
  // module so they cannot match a look-alike component's faces instead.
  const nCount = (cardModuleText.match(/height:\.29\*/g) || []).length;
  if (nCount < 2) throw new Error('card-style extractor: expected two ".29*" face heights (N and E) in the card module, found ' + nCount);
  if (!/height:\.4\*/.test(cardModuleText) && !/height:\.40\*/.test(cardModuleText)) {
    throw new Error('card-style extractor: expected a ".4*" (X) face height in the card module');
  }

  // Text padding inside each face (textContent + the top/X faces'
  // paddingVertical), scoped to the same module.
  const textContentIdx = cardModuleText.indexOf("textContent:{justifyContent:'center',paddingHorizontal:");
  if (textContentIdx === -1) throw new Error('card-style extractor: could not find "textContent" padding inside the card module');
  const textContentObjStart = cardModuleText.lastIndexOf("{", textContentIdx + "textContent:".length);
  const textContentObj = sliceBalancedObject(cardModuleText, textContentObjStart, "textContent padding object");
  const textContentDescriptors = Object.fromEntries(
    parseTopLevelEntries(objectBody(textContentObj)).map(([prop, raw]) => [prop, resolveStyleValue(raw, ctx)])
  );
  const textContentStyle = finalizeStyle(textContentDescriptors, systemFontsSet);

  const faceVerticalMatch = must(/height:\.29\*\w+,paddingVertical:\(0,\w+\.normalize\)\((\d+)\)/, cardModuleText, "top face paddingVertical");

  // --- the session's base font size and its adjustable range -------------
  // `(0,o.useState)(15)` paired with `(0,o.useRef)(15)` nearby, then the
  // 'inc'/'dec' clamps against 22/10 shortly after — all scoped to a
  // bounded window so the generic "15"/"10"/"22" substrings can't match
  // somewhere unrelated in a 6MB file.
  const baseFontAnchor = mustExec(
    /\(0,\w+\.useState\)\(15\)[\s\S]{0,80}?\(0,\w+\.useRef\)\(15\)/,
    text,
    "session base font size (useState(15)/useRef(15))"
  );
  const fontWindow = text.slice(baseFontAnchor.index, baseFontAnchor.index + 4000);
  must(/'inc'===\w+&&\w+<22/, fontWindow, "font-size increment clamp (<22)");
  must(/'dec'===\w+&&\w+>10/, fontWindow, "font-size decrement clamp (>10)");

  // --- the shared divider (module 1406, a single definition) -------------
  const divider = must(
    /textDivider:\{width:'(\d+)%',height:\(0,\w\.normalize\)\((\d+)\),backgroundColor:\w\.default\.getTheme\(\)\.borderColor\}/,
    text,
    "textDivider {width%, height}"
  );

  return {
    normalize: { referenceWidth: 375, tabletFactor: 0.7 },
    fonts: fontsMap,
    systemFonts,
    fontSizeControl: { default: 15, min: 10, max: 22 },
    classes,
    tags,
    card: {
      width: cardStyle.width,
      borderRadius: cardStyle.borderRadius,
      borderWidth: cardStyle.borderWidth,
      minHeight: 260,
      insetSubtrahend,
    },
    faces: { N: 0.29, E: 0.29, X: 0.4 },
    divider: { widthPct: Number(divider[1]), height: Number(divider[2]) },
    padding: {
      textHorizontal: textContentStyle.paddingHorizontal,
      textBottom: textContentStyle.paddingBottom,
      faceVertical: Number(faceVerticalMatch[1]),
    },
    themes: { light, dark },
  };
}
