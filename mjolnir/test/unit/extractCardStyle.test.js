import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { extractCardStyle } from "../../tool/src/extractCardStyle.js";

// card-preview-popup task 1 (tasks.md "1. Extractor"): extractCardStyle
// reads the stock bundle's own style/theme maps rather than a
// hand-transcribed guess, and — per this change's own research
// (research/render-research.md) — corrects the previous
// (assembly-tab-usability) extraction, which had locked onto a
// LOOK-ALIKE card component (0.28/0.28/0.44 faces, a "- normalize(200)"
// formula) instead of the real study-session card (0.29/0.29/0.40 faces,
// "max(normalize(260), windowH - insets - normalize(185))"). Per design.md's
// risk note, it must fail loudly — throw — the instant an anchor it
// expects is missing, rather than quietly emitting a smaller map that
// merely looks complete.

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

test("extractCardStyle pulls the real (corrected) card geometry, formula and theme colors from the stock bundle", () => {
  const style = extractCardStyle(REAL_BUNDLE);

  // card geometry — corrected per research/render-research.md §5
  assert.equal(style.card.width, 342);
  assert.equal(style.card.borderRadius, 20);
  assert.equal(style.card.borderWidth, 1);
  assert.equal(style.card.minHeight, 260);
  assert.equal(style.card.insetSubtrahend, 185);

  // face split — corrected: 0.29 / 0.29 / 0.40, not 0.28 / 0.28 / 0.44
  assert.deepEqual(style.faces, { N: 0.29, E: 0.29, X: 0.4 });

  // divider: 60% width, normalize(1) height
  assert.equal(style.divider.widthPct, 60);
  assert.equal(style.divider.height, 1);

  // padding (task 1.1 "paddings")
  assert.equal(style.padding.textHorizontal, 16);
  assert.equal(style.padding.textBottom, 10);
  assert.equal(style.padding.faceVertical, 8);

  // base font size default + adjustable range (task 1.1)
  assert.deepEqual(style.fontSizeControl, { default: 15, min: 10, max: 22 });

  // the renderer's systemFonts list (task 1.1) — Poppins-SemiBold is
  // deliberately absent, which is what drops .center's/.tipOfTheDay's font
  assert.ok(style.systemFonts.includes("Poppins-Regular"));
  assert.ok(style.systemFonts.includes("Poppins-Bold"));
  assert.ok(style.systemFonts.includes("Poppins-BoldItalic"));
  assert.ok(style.systemFonts.includes("Poppins-Italic"));
  assert.ok(style.systemFonts.includes("arial"));
  assert.ok(!style.systemFonts.includes("Poppins-SemiBold"));

  // dark theme (by token, discovered — not an enumerated subset)
  assert.equal(style.themes.dark.cardText, "#fff");
  assert.equal(style.themes.dark.studyCardHeading, "#737B95");
  assert.equal(style.themes.dark.headingAccent, "#3F8CFF");
  assert.equal(style.themes.dark.headingGray, "#7C8296");
  assert.equal(style.themes.dark.green, "#5DD8D0");
  assert.equal(style.themes.dark.borderColor, "#7C8296");
  assert.equal(style.themes.dark.background, "#1B1D21");

  // light theme
  assert.equal(style.themes.light.cardText, "#16215B");
  assert.equal(style.themes.light.studyCardHeading, "#ACB1C0");
  assert.equal(style.themes.light.headingAccent, "#246BFD");
  assert.equal(style.themes.light.headingGray, "#16215B");
  assert.equal(style.themes.light.cardBackground, "#FAFAFA");
  assert.equal(style.themes.light.borderColor, "#DADFF2");
  assert.equal(style.themes.light.background, "#fff");

  // #1B1D21 is a MAPPING (archivedBackground), not an extracted
  // cardBackground key — design.md is explicit that this must be labelled.
  assert.equal(style.themes.dark.cardBackground, "#1B1D21");
  assert.equal(style.themes.dark.cardBackgroundSource, "archivedBackground");
});

test("extractCardStyle discovers the full class map, not an enumerated subset", () => {
  const style = extractCardStyle(REAL_BUNDLE);

  for (const cls of [
    "supWrap",
    "sup",
    "arialFont",
    "arialFontNormal",
    "flex",
    "lg",
    "width",
    "italic",
    "boldItalic",
    "underline",
    "left",
  ]) {
    assert.ok(cls in style.classes, `expected ".${cls}" in the discovered class map`);
  }

  // every colour class named in design.md §2
  assert.equal(style.classes.green.colorByTheme.light, "#5DD8D0");
  assert.equal(style.classes.red.color, "red"); // 'red' is the CSS keyword, not a hex literal in the bundle
  assert.equal(style.classes.teal.color, "#00A4BF");
  assert.equal(style.classes.dodgerBlue.color, "#0080ff");
  assert.equal(style.classes.royalRed.color, "#cc0066");
  assert.equal(style.classes.blueViolet.color, "#8030cf");
  assert.equal(style.classes.burntOrange.color, "#ff7733");

  // .center has NO surviving font — flagged "font dropped" FROM DATA
  // (computed against the extracted systemFonts list), not by name.
  assert.equal(style.classes.center.fontDropped, true);
  assert.equal(style.classes.center.fontFamily, undefined);
  assert.equal(style.classes.center.droppedFontFamily, "Poppins-SemiBold");
  assert.equal(style.classes.tipOfTheDay.fontDropped, true);

  // classes with a font that DOES survive are marked not-dropped
  assert.equal(style.classes.italic.fontFamily, "Poppins-Italic");
  assert.equal(style.classes.italic.fontDropped, false);

  // .bold (1,459 stock uses) is undefined in classesStyles — it must
  // simply not appear, matching "undefined classes have no effect".
  assert.ok(!("bold" in style.classes));

  // the full tag map
  for (const tag of ["div", "b", "i", "p", "a"]) {
    assert.ok(tag in style.tags, `expected "<${tag}>" in the discovered tag map`);
  }
  assert.equal(style.tags.b.fontFamily, "Poppins-Bold");
  assert.equal(style.tags.b.fontDropped, false);
  assert.equal(style.tags.b.colorByTheme.light, "#246BFD");
  assert.equal(style.tags.b.colorByTheme.dark, "#3F8CFF");
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
  const missingDark =
    "normalize=function(t){var u=t/375,l=false?.7:1;return j.PixelRatio.roundToNearestPixel(t*u*l)}\n" +
    "light:{background:'#fff',cardText:'#16215B'}\n";
  withTmpBundle(missingDark, (file) => {
    assert.throws(() => extractCardStyle(file));
  });
});

test("extractCardStyle throws when the card-height-formula anchor (the real study card) is removed", () => {
  // Rebuild a minimal but faithful slice of the real bundle's relevant
  // anchors, then delete just the "normalize(185)" insets formula — the
  // anchor acceptance criterion C11 exercises. Everything else present,
  // only this one literal missing: must still throw, not fall back to a
  // look-alike/default formula.
  const real = fs.readFileSync(REAL_BUNDLE, "utf8");
  const mutilated = real.replace(/-\(0,(\w+)\.normalize\)\(185\)\)/, "-999)");
  withTmpBundle(mutilated, (file) => {
    assert.throws(() => extractCardStyle(file), /card height formula/);
  });
});

test("extractCardStyle throws when the classesStyles object's own anchor is removed (acceptance C11)", () => {
  // The class map is DISCOVERED generically (task 1.1/1.2 — no
  // hard-coded per-class list), so renaming one individual class's key
  // just changes what gets discovered under that name; it is the
  // structural anchor that locates the whole classesStyles object
  // ("lg:{fontSize:") that must fail loudly if it goes missing, which is
  // what this exercises.
  const real = fs.readFileSync(REAL_BUNDLE, "utf8");
  const mutilated = real.replace("lg:{fontSize:", "lgRenamedAnchor:{fontSize:");
  withTmpBundle(mutilated, (file) => {
    assert.throws(() => extractCardStyle(file), /classesStyles/);
  });
});

test("extractCardStyle throws, naming the class, when a fixed colour class's key is renamed/removed (acceptance C11)", () => {
  // Even though classes are discovered generically, each of the seven
  // FIXED colour classes named in design.md §2 is checked individually
  // post-discovery. The acceptance scenario (C11) is: rename one colour
  // class's anchor in a copy of the bundle and point the extractor at it —
  // the extractor must fail with an error naming the missing anchor,
  // rather than silently emitting a classes map missing that class (the
  // bug a previous run of this suite reproduced: this exact mutation used
  // to return successfully with "royalRed" simply absent from
  // style.classes).
  const real = fs.readFileSync(REAL_BUNDLE, "utf8");
  const mutilated = real.replace("royalRed:{color:'#cc0066'}", "royalRedMANGLED:{color:'#cc0066'}");
  withTmpBundle(mutilated, (file) => {
    assert.throws(() => extractCardStyle(file), /royalRed/);
  });
});
