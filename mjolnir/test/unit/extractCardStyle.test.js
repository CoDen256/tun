import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { extractCardStyle } from "../../tool/src/extractCardStyle.js";

// assembly-tab-usability item 3 (task 3.1): extractCardStyle reads the
// stock bundle's own style/theme maps rather than a hand-transcribed
// guess. Per design.md's risk note, it must fail loudly — throw — the
// instant an anchor it expects is missing, rather than quietly emitting a
// smaller map that merely looks complete.

const REAL_BUNDLE = path.join(
  import.meta.dirname,
  "../../base/smali.mjolnir.merged/assets/index.android.bundle"
);

function withTmpBundle(text, fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-extractcardstyle-"));
  const file = path.join(dir, "bundle.js");
  fs.writeFileSync(file, text, "utf8");
  try {
    return fn(file);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("extractCardStyle pulls the real card geometry, formula and theme colors from the stock bundle", () => {
  const style = extractCardStyle(REAL_BUNDLE);

  // card geometry (design.md's confirmed-values table)
  assert.equal(style.card.width, 342);
  assert.equal(style.card.borderRadius, 20);
  assert.equal(style.card.borderWidth, 1);
  assert.equal(style.card.heightInsetBase, 200); // C = screenHeight - normalize(200)

  // face split
  assert.deepEqual(style.faces, { N: 0.28, E: 0.28, X: 0.44 });

  // divider: 60% width, normalize(1) height
  assert.equal(style.divider.widthPct, 60);
  assert.equal(style.divider.height, 1);

  // classes the preview was missing before this change
  assert.equal(style.classes.supWrap.marginHorizontal, 4);
  assert.equal(style.classes.sup.fontSize, 11);
  assert.equal(style.classes.arialFont.fontSize, 28);
  assert.equal(style.classes.arialFontNormal.fontSize, 18);

  // dark theme
  assert.equal(style.themes.dark.cardText, "#fff");
  assert.equal(style.themes.dark.studyCardHeading, "#737B95");
  assert.equal(style.themes.dark.headingAccent, "#3F8CFF");
  assert.equal(style.themes.dark.headingGray, "#7C8296");
  assert.equal(style.themes.dark.green, "#5DD8D0");
  assert.equal(style.themes.dark.borderColor, "#7C8296");

  // light theme
  assert.equal(style.themes.light.cardText, "#16215B");
  assert.equal(style.themes.light.studyCardHeading, "#ACB1C0");
  assert.equal(style.themes.light.headingAccent, "#246BFD");
  assert.equal(style.themes.light.headingGray, "#16215B");
  assert.equal(style.themes.light.cardBackground, "#FAFAFA");
  assert.equal(style.themes.light.borderColor, "#DADFF2");

  // #1B1D21 is a MAPPING (archivedBackground), not an extracted
  // cardBackground key — design.md is explicit that this must be labelled,
  // not read as a plain extraction.
  assert.equal(style.themes.dark.cardBackground, "#1B1D21");
  assert.equal(style.themes.dark.cardBackgroundSource, "archivedBackground");
});

test("extractCardStyle throws rather than returning a shrunk map when an anchor is missing", () => {
  // A truncated/corrupted bundle: has the normalize() anchor but nothing
  // else the extractor expects. Must throw, not silently return a partial
  // style object that merely looks complete.
  const corrupted =
    "normalize=function(t){var u=t/375,l=false?.7:1;return j.PixelRatio.roundToNearestPixel(t*u*l)}\n" +
    "console.log('nothing else of interest here');\n";
  withTmpBundle(corrupted, (file) => {
    assert.throws(() => extractCardStyle(file));
  });
});

test("extractCardStyle throws on a bundle missing the normalize() anchor entirely", () => {
  withTmpBundle("not a bundle at all, just plain text\n", (file) => {
    assert.throws(() => extractCardStyle(file));
  });
});

test("extractCardStyle throws if the dark theme object can't be located", () => {
  // Has the normalize anchor and a light theme, but no recognizable dark
  // theme object — must refuse rather than emit a style map with a
  // missing/empty dark theme.
  const missingDark =
    "normalize=function(t){var u=t/375,l=false?.7:1;return j.PixelRatio.roundToNearestPixel(t*u*l)}\n" +
    "light:{background:'#fff',cardText:'#16215B'}\n";
  withTmpBundle(missingDark, (file) => {
    assert.throws(() => extractCardStyle(file));
  });
});
