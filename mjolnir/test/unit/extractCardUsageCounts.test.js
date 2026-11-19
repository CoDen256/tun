import test from "node:test";
import assert from "node:assert/strict";
import path from "node:path";
import { extractCardUsageCounts } from "../../tool/src/extractCardUsageCounts.js";

// card-preview-popup task group 4's minimal extractor addition (Classes &
// tags stock usage counts). Verified against the hand-counted numbers in
// research/render-research.md §2 ("Class usage in the 2790 stock cards").

const REAL_BUNDLE = path.join(import.meta.dirname, "../../base/smali.mjolnir.merged/assets/index.android.bundle");
const usage = extractCardUsageCounts(REAL_BUNDLE);

test("class usage counts match research/render-research.md §2 exactly", () => {
  assert.equal(usage.classes.center, 7542);
  assert.equal(usage.classes.italic, 2303);
  assert.equal(usage.classes.left, 1945);
  assert.equal(usage.classes.bold, 1459);
  assert.equal(usage.classes.lg, 186);
  assert.equal(usage.classes.arialFontNormal, 104);
  assert.equal(usage.classes.arialFont, 103);
  assert.equal(usage.classes.royalRed, 95);
  assert.equal(usage.classes.dodgerBlue, 94);
  assert.equal(usage.classes.boldItalic, 54);
  assert.equal(usage.classes.green, 41);
  assert.equal(usage.classes.sup, 32);
  assert.equal(usage.classes.supWrap, 28);
  assert.equal(usage.classes.red, 24);
  assert.equal(usage.classes.blueViolet, 22);
  assert.equal(usage.classes.teal, 20);
  assert.equal(usage.classes.burntOrange, 10);
  assert.equal(usage.classes.flex, 3);
});

test("tag usage counts: only div/br/span/p/b occur in stock content", () => {
  assert.ok(usage.tags.div > 0);
  assert.ok(usage.tags.b > 0);
  assert.ok(usage.tags.p > 0);
  assert.ok(usage.tags.br > 0);
  assert.ok(usage.tags.span > 0);
  assert.equal(usage.tags.i, 0);
  assert.equal(usage.tags.a, 0);
});

test("a class absent from stock content has no key (never a fabricated 0 row)", () => {
  assert.equal("width" in usage.classes, false);
  assert.equal("tipOfTheDay" in usage.classes, false);
});
