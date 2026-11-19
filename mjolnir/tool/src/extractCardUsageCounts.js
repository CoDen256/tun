import fs from "node:fs";
import { sliceCardArrayText } from "./extractCardSymbols.js";

// card-preview-popup task group 4 (Classes & tags table, design.md §4 /
// acceptance C27 "stock usage counts"). This is the "minimal addition"
// task group 4's brief calls for: task group 1's extractor
// (extractCardStyle.js) discovers WHICH tags/classes exist and how they
// resolve, but emits no per-tag/per-class usage count across the stock
// bundle. That count is a separate, purely-textual scan (not a style
// resolution), so it lives in its own small file rather than being bolted
// onto extractCardStyle.js's cascade-resolution logic — reusing
// extractCardSymbols.js's own card-array anchor (`sliceCardArrayText`)
// rather than re-deriving it, so a future rebase that moves the card array
// only has one anchor to keep in sync.
//
// Verified against the real stock bundle to match
// research/render-research.md §2's hand-counted numbers exactly: center
// 7542, italic 2303, left 1945, bold 1459, lg 186, arialFontNormal 104,
// arialFont 103, royalRed 95, dodgerBlue 94, boldItalic 54, green 41, sup
// 32, supWrap 28, red 24, blueViolet 22, teal 20, burntOrange 10, flex 3;
// tags div/b/p/br/span counted the same way (see test/unit/
// extractCardUsageCounts.test.js).
//
// The scanned text is the bundle's own JS source for the card array, where
// a quoted class attribute appears backslash-escaped (`class=\"center\"`)
// because it is itself a JS string literal inside a JS array literal —
// unescaped here (only within a throwaway copy used for counting; nothing
// is written back) before the normal class-attribute grammar is applied.

const KNOWN_TAGS = ["div", "b", "i", "p", "a", "br", "span"];

function unescapeQuotes(text) {
  return text.replace(/\\"/g, '"').replace(/\\'/g, "'");
}

function countTag(text, tag) {
  const re = new RegExp(`<${tag}(?=[\\s/>])`, "g");
  return (text.match(re) || []).length;
}

function countClasses(text) {
  const counts = {};
  const re = /class\s*=\s*(?:"([^"]*)"|'([^']*)'|([^\s>]+))/g;
  let m;
  while ((m = re.exec(text))) {
    const raw = m[1] ?? m[2] ?? m[3] ?? "";
    for (const cls of raw.split(/\s+/).filter(Boolean)) {
      counts[cls] = (counts[cls] || 0) + 1;
    }
  }
  return counts;
}

// Returns { tags: { div: n, b: n, ... }, classes: { center: n, bold: n, ... } }
// — a class/tag absent from stock content simply has no key (treated as 0
// by callers), not a fabricated 0 row for every name this file has never
// heard of.
export function extractCardUsageCounts(bundlePath) {
  const text = fs.readFileSync(bundlePath, "utf8");
  const cardText = unescapeQuotes(sliceCardArrayText(text));

  const tags = {};
  for (const tag of KNOWN_TAGS) tags[tag] = countTag(cardText, tag);

  const classes = countClasses(cardText);

  return { tags, classes };
}
