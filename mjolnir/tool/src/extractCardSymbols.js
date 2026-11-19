import fs from "node:fs";

// assembly-tab-usability item 3 (task 3.2): the symbol catalogue's data —
// extracted from the STOCK bundle's own card content (numeric HTML
// entities, `&#NNN;`, the same encoding the real app's card HTML uses for
// anything outside the Poppins-safe range), not guessed at. Counts are
// real occurrence counts in `index.android.bundle`'s own text, so the
// catalogue states what the app's sample content actually contains.
//
// A small hand-authored name table backs the few dozen codepoints this
// app's own IPA content actually uses (confirmed by running the entity
// scan below against the real bundle) — Unicode's own name database is not
// vendored into this repo, and this app uses a small, stable phonetic
// alphabet subset, so a short table beats pulling in a dependency for 32
// names. Fails loudly (throws) if the bundle ever contains an entity
// outside this table, rather than rendering an unlabeled row.
const CODEPOINT_NAMES = {
  39: "APOSTROPHE",
  101: "LATIN SMALL LETTER E",
  105: "LATIN SMALL LETTER I",
  111: "LATIN SMALL LETTER O",
  117: "LATIN SMALL LETTER U",
  121: "LATIN SMALL LETTER Y",
  229: "LATIN SMALL LETTER A WITH RING ABOVE",
  230: "LATIN SMALL LETTER AE",
  231: "LATIN SMALL LETTER C WITH CEDILLA",
  248: "LATIN SMALL LETTER O WITH STROKE",
  331: "LATIN SMALL LETTER ENG",
  339: "LATIN SMALL LIGATURE OE",
  593: "LATIN SMALL LETTER ALPHA",
  596: "LATIN SMALL LETTER OPEN O",
  598: "LATIN SMALL LETTER D WITH TAIL",
  600: "LATIN SMALL LETTER REVERSED OPEN E",
  601: "LATIN SMALL LETTER SCHWA",
  603: "LATIN SMALL LETTER OPEN E",
  618: "LATIN LETTER SMALL CAPITAL I",
  619: "LATIN SMALL LETTER L WITH MIDDLE TILDE",
  621: "LATIN SMALL LETTER L WITH RETROFLEX HOOK",
  627: "LATIN SMALL LETTER N WITH RETROFLEX HOOK",
  638: "LATIN SMALL LETTER R WITH FISHHOOK",
  642: "LATIN SMALL LETTER S WITH HOOK",
  643: "LATIN SMALL LETTER ESH",
  648: "LATIN SMALL LETTER T WITH RETROFLEX HOOK",
  649: "LATIN SMALL LETTER U BAR",
  650: "LATIN SMALL LETTER UPSILON",
  651: "LATIN SMALL LETTER V WITH HOOK",
  655: "LATIN LETTER SMALL CAPITAL Y",
  720: "MODIFIER LETTER TRIANGULAR COLON",
  809: "COMBINING VERTICAL LINE BELOW",
  8943: "MIDLINE HORIZONTAL ELLIPSIS",
  // card-preview-popup task 1.3: these surfaced only once card content was
  // scanned for LITERAL (non-entity) non-ASCII characters too — the
  // bundle embeds some of these directly as `\xNN`/`\uNNNN` JS string
  // escapes rather than as `&#NNN;` HTML entities (e.g. tone-number
  // superscripts in C01004's cards, `p\xe5 skolen`'s uppercase/accented
  // borrowings, and typographic punctuation).
  178: "SUPERSCRIPT TWO",
  185: "SUPERSCRIPT ONE",
  197: "LATIN CAPITAL LETTER A WITH RING ABOVE",
  198: "LATIN CAPITAL LETTER AE",
  201: "LATIN CAPITAL LETTER E WITH ACUTE",
  216: "LATIN CAPITAL LETTER O WITH STROKE",
  220: "LATIN CAPITAL LETTER U WITH DIAERESIS",
  233: "LATIN SMALL LETTER E WITH ACUTE",
  242: "LATIN SMALL LETTER O WITH GRAVE",
  252: "LATIN SMALL LETTER U WITH DIAERESIS",
  8211: "EN DASH",
  8217: "RIGHT SINGLE QUOTATION MARK",
  8230: "HORIZONTAL ELLIPSIS",
};

// tier 2 (assembly-tab-usability item 3, logged to DECISIONS-MADE.md):
// æ/ø/å are always listed as their own group, with the stock bundle's real
// occurrence count (which may be 0 — å does not occur anywhere in this
// build's own sample content) rather than omitted when a count is zero.
// The Norwegian-letter group is the app's fixed orthography, not a
// frequency sample, and nothing here is fabricated: the count shown is
// the true extracted count, including when that count is zero.
const NORWEGIAN_CODEPOINTS = [230, 248, 229]; // æ ø å

function nameFor(codepoint) {
  const name = CODEPOINT_NAMES[codepoint];
  if (!name) {
    throw new Error(
      `card-symbol extractor: codepoint ${codepoint} (&#${codepoint};) occurs in the bundle but has no ` +
        `entry in CODEPOINT_NAMES — add its real Unicode name to tool/src/extractCardSymbols.js rather than ` +
        `rendering an unlabeled row.`
    );
  }
  return name;
}

// card-preview-popup task 1.3: scopes the scan to the card array itself
// (`[{DECK_ID:"...",ID:"...",N:...,E:...,X:...,A:...},...]`) rather than
// the whole 6MB bundle — `DECK_ID`/`ID` are real, stable domain field
// names (not minifier-assigned letters), so this anchor survives a
// rebase the way a module id would not. Scoping matters here because the
// surrounding app code also contains stray `&#NNN;`/`\xNN`/`\uNNNN`
// escapes (regex character classes, unrelated UI strings) that are not
// card content and would otherwise inflate the Symbols tab's "Uses"
// column with occurrences a card never actually shows.
function sliceCardArrayText(text) {
  const anchorIdx = text.indexOf('{DECK_ID:"');
  if (anchorIdx === -1) {
    throw new Error(
      'card-symbol extractor: could not find the card array (anchor \'{DECK_ID:"\') in the bundle — refusing to scan the whole file as a fallback.'
    );
  }
  const start = text.lastIndexOf("[", anchorIdx);
  if (start === -1) {
    throw new Error("card-symbol extractor: found a card object but no enclosing array start before it");
  }
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
    if (c === "[") depth++;
    else if (c === "]") {
      depth--;
      if (depth === 0) return text.slice(start, i + 1);
    }
  }
  throw new Error("card-symbol extractor: unbalanced array literal while scanning for the card array");
}

export function extractCardSymbols(bundlePath) {
  const text = fs.readFileSync(bundlePath, "utf8");
  const cardText = sliceCardArrayText(text);

  const counts = new Map();
  const entityCounts = new Map();
  const literalCounts = new Map();
  const bump = (map, cp) => map.set(cp, (map.get(cp) || 0) + 1);

  // HTML entities, e.g. `&#230;` (æ).
  for (const m of cardText.matchAll(/&#(\d+);/g)) {
    const cp = Number(m[1]);
    bump(counts, cp);
    bump(entityCounts, cp);
  }
  // Literal (non-entity) non-ASCII characters embedded as JS string
  // escapes, e.g. `p\xe5 skolen` (på skolen) or `…` (…). ASCII
  // escapes (control characters, `\x27` etc.) are not "symbols" for this
  // tab and are excluded by the cp >= 0x80 filter.
  for (const m of cardText.matchAll(/\\x([0-9a-fA-F]{2})/g)) {
    const cp = parseInt(m[1], 16);
    if (cp >= 0x80) {
      bump(counts, cp);
      bump(literalCounts, cp);
    }
  }
  for (const m of cardText.matchAll(/\\u([0-9a-fA-F]{4})/g)) {
    const cp = parseInt(m[1], 16);
    if (cp >= 0x80 && !(cp >= 0xd800 && cp <= 0xdfff)) {
      bump(counts, cp);
      bump(literalCounts, cp);
    }
  }
  // Actual literal UTF-8 characters, if the bundle ever stops escaping
  // them — counted the same way so this doesn't silently under-report if
  // a future rebase changes how Metro/Babel emits non-ASCII strings.
  for (const ch of cardText) {
    const cp = ch.codePointAt(0);
    if (cp >= 0x80 && !(cp >= 0xd800 && cp <= 0xdfff)) {
      bump(counts, cp);
      bump(literalCounts, cp);
    }
  }

  const seen = new Set();
  const rows = [];
  for (const cp of NORWEGIAN_CODEPOINTS) {
    rows.push({
      codepoint: cp,
      entity: `&#${cp};`,
      glyph: String.fromCodePoint(cp),
      name: nameFor(cp),
      occurrences: counts.get(cp) || 0,
      entityOccurrences: entityCounts.get(cp) || 0,
      literalOccurrences: literalCounts.get(cp) || 0,
      group: "norwegian",
    });
    seen.add(cp);
  }

  const ipa = [...counts.entries()]
    .filter(([cp]) => !seen.has(cp) && cp >= 0x80) // skip plain ASCII hits like &#39; / &#101;
    .sort((a, b) => b[1] - a[1])
    .map(([cp, occurrences]) => ({
      codepoint: cp,
      entity: `&#${cp};`,
      glyph: String.fromCodePoint(cp),
      name: nameFor(cp),
      occurrences,
      entityOccurrences: entityCounts.get(cp) || 0,
      literalOccurrences: literalCounts.get(cp) || 0,
      group: "ipa",
    }));

  return { norwegian: rows, ipa };
}
