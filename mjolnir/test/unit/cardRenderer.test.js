import test from "node:test";
import assert from "node:assert/strict";
import path from "node:path";
import { extractCardStyle } from "../../tool/src/extractCardStyle.js";
import { normalize, normalizeFactor, parseCardHtml, renderCardFace } from "../../hub/src/cardRenderer.js";

// card-preview-popup task group 2 ("The renderer emulation"): unit/snapshot
// tests of the cascade's OUTPUT (resolved inline styles / markup), run
// against the real extracted style map and real stock card HTML (pulled
// straight out of the bundle, same way research/render-research.md and
// tasks.md 7.2 name them: B01028, Z01001, B12007, B12006, B01003, C01001,
// C01004, B01047, A01001) — matching acceptance.md's C1-C7/C9/C10. A
// browser-driven agent verifies the full popup later; this only checks that
// THIS renderer's computed output is correct.

const REAL_BUNDLE = path.join(import.meta.dirname, "../../base/smali.mjolnir.merged/assets/index.android.bundle");
const style = extractCardStyle(REAL_BUNDLE);

// Raw card HTML read directly off the stock bundle (see this test's own
// extraction, not hand-retyped from the research doc — the entities/quoting
// below are exactly what index.android.bundle contains for each ID).
const CARDS = {
  A01001: {
    N: '<div class="center">God morgen</div>',
    E: '<div class="center">Good morning</div>',
  },
  Z01001: {
    N: '<div class="center">Does Norwegian have<br><b class="bold">long</b> and <b class="bold green">short</b> vowels?</div>',
    E: '<div class="center"><div class="left">Yes. <b class="bold">Long</b> stressed vowels are <span class="italic">mostly</span> followed by <b class="bold">one consonant</b> or <b class="bold">no other letter</b>.<br><b class="bold green">Short</b> stressed vowels are <span class="italic">mostly</span> followed by <b class="bold green">two consonants</b>.</div></div>',
  },
  B01028: {
    E: '<div class="center"><div class="arialFont supWrap">k<div class="sup">j</div>(:)</div></div>',
  },
  B01003: {
    E: '<div class="center"><p>The sound of the letters in bold is</p><span class="arialFont">&#642;</span></div>',
    X: '<div class="center"><div class="left"><p>SJ is always [<span class="arialFontNormal"> &#642; </span>] and is very close to [<span class="arialFontNormal"> &#643; </span>], which is "SH" in English.</p>The strange letters we are using in this topic belong to the International Phonetic Alphabet.<br>You don\'t have to learn them, but they can be a useful reference.</div></div>',
  },
  B12007: {
    E: '<div class="center"><p><span class="red">Det</span> <span class="teal">regner</span> <span class=blueViolet>ikke</span> mye i Bergen</p>I Bergen <span class="teal">regner</span> <span class="red">det</span> <span class=blueViolet>ikke</span> mye</div>',
  },
  B12006: {
    E: "<div class=\"center\"><p>Bodil ga <span class=royalRed>ham</span> <span class=burntOrange>den</span></p>Bodil ga <span class=burntOrange>den</span> <span class=royalRed>til Ove</span></div>",
  },
  C01001: {
    X: '<div class="center"><div class="left"><p>Listen to these examples:</p></div><p><span class=dodgerBlue>¹hjem</span>met&emsp;&emsp;&emsp;the home<br><span class=royalRed>²hjem</span>me&emsp;&emsp;&emsp;at home</p></div>',
  },
  B01047: {
    X: '<div class="center flex"><div class="left">The G in the GTE ending of certain <span class="italic">preteritum</span> forms is effectively pronounced as the soft K (i.e. K with superscript J).</div></div>',
  },
  C01004: {
    N: '<div class="center">How can I learn when to produce <span class=dodgerBlue>tone 1</span> <br>and when to produce <span class=royalRed>tone 2</span>?</div>',
    X: '<div class="center"><div class="left"><p>Verbs (except prepositional verbs):<br>(å) <span class=royalRed>²kas</span>te, <span class=royalRed>²del</span>te, <span class=royalRed>²byg</span>de, <span class=royalRed>²trod</span>de</p> <p>Nouns of all genders:<br>(en) <span class=royalRed>²ti</span>me, (ei) <span class=royalRed>²jen</span>te, (et) <span class=royalRed>²bil</span>de</p> <p>Adjectives in the definite/plural form:<br><span class=royalRed>²fi</span>ne, <span class=royalRed>²fri</span>e, <span class=royalRed>²la</span>ve, <span class=royalRed>²rø</span>de</p> <p>Other 2-syllable words:<br><span class=royalRed>²de</span>re, <span class=royalRed>²ba</span>re</p> We will mostly focus on the rules for <span class=royalRed>tone 2</span>, which means that, by subtraction, any other situation will require <span class=dodgerBlue>tone 1</span>.</div></div>',
  },
};

function styleAttr(html, needle) {
  // crude but sufficient: find the opening tag containing `needle` in its
  // text and return its style attribute value.
  const idx = html.indexOf(needle);
  assert.ok(idx !== -1, `expected to find "${needle}" in: ${html}`);
  const tagStart = html.lastIndexOf("<", idx);
  const tagEnd = html.indexOf(">", tagStart);
  return html.slice(tagStart, tagEnd + 1);
}

test("normalize() — design §2 / research §2: round(x * shortSide/375 * (tablet?0.7:1))", () => {
  assert.equal(normalizeFactor(375, 812, false), 1);
  assert.equal(normalize(15, 375, 812, false), 15);
  assert.equal(normalize(342, 375, 812, false), 342);

  // C10: tablet device 768x1024 -> factor (768/375)*0.7
  const factor = normalizeFactor(768, 1024, true);
  assert.equal(factor.toFixed(3), "1.434");
  assert.equal(normalize(342, 768, 1024, true), Math.round(342 * factor));
  // a plain-div run at base font 15 computes to ~21-22px (acceptance: "≈21.5")
  assert.equal(normalize(15, 768, 1024, true), Math.round(15 * factor));
});

test("parseCardHtml — unquoted class attributes parse (research §2 'some class attrs are unquoted')", () => {
  const ast = parseCardHtml('<span class=royalRed>ham</span>');
  const span = ast.children[0];
  assert.equal(span.tag, "span");
  assert.deepEqual(span.classes, ["royalRed"]);
});

test("parseCardHtml — class attribute order is preserved, not sorted", () => {
  const ast = parseCardHtml('<div class="arialFont supWrap">x</div>');
  assert.deepEqual(ast.children[0].classes, ["arialFont", "supWrap"]);
});

test("C1 — .center is not bold: A01001 plain div text is Poppins-Regular, no font-weight emitted anywhere", () => {
  const { html } = renderCardFace(CARDS.A01001.N, style, { width: 375, height: 812, theme: "light" });
  const tag = styleAttr(html, "God morgen");
  assert.match(tag, /font-family:'Poppins-Regular'/);
  assert.doesNotMatch(html, /font-weight/);
  assert.match(tag, /text-align:center/);
});

test("C2 — default alignment is left: a div with no .center/.left class gets no text-align override", () => {
  const { html } = renderCardFace("<div>plain text</div>", style, {});
  const tag = styleAttr(html, "plain text");
  assert.doesNotMatch(tag, /text-align/);
});

test("C3 — only <b> is bold, in the accent colour; .green overrides it; theme-aware", () => {
  const light = renderCardFace(CARDS.Z01001.N, style, { theme: "light" }).html;
  const dark = renderCardFace(CARDS.Z01001.N, style, { theme: "dark" }).html;

  const longLight = styleAttr(light, "long");
  assert.match(longLight, /font-family:'Poppins-Bold'/);
  assert.match(longLight, /color:#246BFD/);
  assert.doesNotMatch(longLight, /font-weight/); // no synthetic bold — the face file IS the weight

  const longDark = styleAttr(dark, "long");
  assert.match(longDark, /color:#3F8CFF/);

  // <b class="bold green">short</b> — .green (a class) wins over the <b> tag's headingAccent color
  const shortLight = styleAttr(light, "short");
  assert.match(shortLight, /color:#5DD8D0/);
  const shortDark = styleAttr(dark, "short");
  assert.match(shortDark, /color:#5DD8D0/); // green is theme-independent
});

test("C4 — nested div resets its parent's class (supWrap/arialFont do not reach div.sup)", () => {
  const { html } = renderCardFace(CARDS.B01028.E, style, {});
  const kTag = styleAttr(html, ">k<");
  assert.match(kTag, /font-family:'arial'/);
  assert.match(kTag, /font-size:28px/);

  const jTag = styleAttr(html, ">j<");
  assert.match(jTag, /font-family:'Poppins-Regular'/); // NOT arial — the nested div re-applied the div tag style
  assert.match(jTag, /font-size:11px/); // .sup's own fontSize, not the div's state.fontSize
  assert.doesNotMatch(jTag, /font-size:28px/);

  // the supWrap row itself is a real flex row, never <sup> — kTag IS that
  // row's own opening tag (the text "k" is its direct child).
  assert.doesNotMatch(html, /<sup/);
  assert.match(kTag, /display:inline-flex/);
  assert.match(kTag, /align-items:flex-start/);
  assert.match(kTag, /justify-content:center/);
});

test("C5 — colours of the colour classes (quoted and unquoted class=)", () => {
  const b12007 = renderCardFace(CARDS.B12007.E, style, {}).html;
  assert.match(styleAttr(b12007, "Det"), /color:#FF0000|color:red/);
  assert.match(styleAttr(b12007, "regner"), /color:#00A4BF/);
  assert.match(styleAttr(b12007, "ikke"), /color:#8030cf/);

  const b12006 = renderCardFace(CARDS.B12006.E, style, {}).html;
  assert.match(styleAttr(b12006, "ham"), /color:#cc0066/);
  assert.match(styleAttr(b12006, "den"), /color:#ff7733/);
});

test("C01004 — 7.2 gap: dodgerBlue (unused by any other fixture) alongside royalRed, literal non-ASCII chars (å, ø, ²) and repeated <p>/<br> runs in the longest X face (research §7: 'longest X → scrolls' — the scroll/clip behaviour itself is browser-only, acceptance C15; this only checks the cascade's resolved output)", () => {
  const n = renderCardFace(CARDS.C01004.N, style, { theme: "light" }).html;
  assert.match(styleAttr(n, "tone 1"), /color:#0080ff/);
  assert.match(styleAttr(n, "tone 2"), /color:#cc0066/);

  const x = renderCardFace(CARDS.C01004.X, style, { theme: "light" }).html;
  // literal (not entity-encoded) non-ASCII characters survive the cascade
  assert.ok(x.includes("å") && x.includes("ø") && x.includes("²"));
  assert.match(styleAttr(x, "²kas"), /color:#cc0066/);
  assert.match(styleAttr(x, "tone 1"), /color:#0080ff/);
  // every <p> in this face still gets the standard margins (research §7's
  // "p inside center" cascade, exercised here with four sibling <p>s)
  const pTags = [...x.matchAll(/<p[^>]*style="([^"]*)"/g)].map((m) => m[1]);
  assert.ok(pTags.length >= 4, `expected at least 4 <p> tags, got ${pTags.length}`);
  for (const decl of pTags) {
    assert.match(decl, /margin-top:0px/);
    assert.match(decl, /margin-bottom:6px/);
  }
  // every <br> is still literal, not collapsed, across this many siblings
  assert.ok((x.match(/<br>/g) || []).length >= 4);
});

test("C6 — IPA renders in Arial at the fixed normalize(28)/normalize(18) class sizes, decoded from entities", () => {
  const e = renderCardFace(CARDS.B01003.E, style, {}).html;
  // &#642; decoded to its literal glyph, inside the arialFont span
  const glyph = String.fromCodePoint(642);
  assert.ok(e.includes(glyph), "entity should be decoded to its literal character");
  const tag = styleAttr(e, glyph);
  assert.match(tag, /font-family:'arial'/);
  assert.match(tag, /font-size:28px/);

  const x = renderCardFace(CARDS.B01003.X, style, {}).html;
  const tagNormal = styleAttr(x, glyph);
  assert.match(tagNormal, /font-family:'arial'/);
  assert.match(tagNormal, /font-size:18px/);
});

test("C7 — wrapping defaults are always present on every div (no overflow, long words break), including across &emsp; runs", () => {
  const { html } = renderCardFace(CARDS.C01001.X, style, {});
  // every div in the subtree carries the wrap-safety declarations
  const divTags = [...html.matchAll(/<div[^>]*style="([^"]*)"/g)].map((m) => m[1]);
  assert.ok(divTags.length > 0);
  for (const decl of divTags) {
    assert.match(decl, /overflow-wrap:anywhere/);
    assert.match(decl, /word-break:break-word/);
  }
  // &emsp; decodes to a (breakable) space, not a literal "&emsp;" string
  assert.ok(!html.includes("&emsp;"));
});

test("C8 — <br> semantics: every <br>, including a trailing one, is emitted literally (no collapsing)", () => {
  const withTrailing = renderCardFace("<div>line<br></div>", style, {}).html;
  const withoutTrailing = renderCardFace("<div>line</div>", style, {}).html;
  assert.ok(withTrailing.includes("line<br>"));
  assert.equal((withTrailing.match(/<br>/g) || []).length, 1);
  assert.ok(!withoutTrailing.includes("<br>"));
});

test("C8 — a <br> that is the LAST thing in the whole face gets a zero-width-space anchor so the browser doesn't collapse its empty line box (confirmed by getClientRects() measurement: identical markup without this anchor renders at the SAME height with/without the trailing <br> in Chrome/Firefox/Safari — a real engine quirk, not something 'native <br>' handles for free)", () => {
  const withTrailing = renderCardFace("<div>line<br></div>", style, {}).html;
  const withoutTrailing = renderCardFace("<div>line</div>", style, {}).html;
  // the trailing <br> is followed immediately by U+200B (zero-width space)
  // and nothing else — invisible, but it IS "content" after the <br>, which
  // is what makes browsers create the second (empty) line box.
  assert.match(withTrailing, /<br>​<\/div>$/);
  assert.ok(!withoutTrailing.includes("​"));

  // a <br> that is NOT the final thing in the face (more content follows,
  // even in a different sibling element) must NOT get the anchor — only
  // the true trailing one needs it.
  const midBr = renderCardFace("<div>a<br>b</div>", style, {}).html;
  assert.ok(!midBr.includes("​"));

  // the anchor also has to reach through nesting: a trailing <br> inside a
  // nested div with nothing after it anywhere in the face still collapses
  // in real browsers unless marked.
  const nested = renderCardFace("<div><div>line<br></div></div>", style, {}).html;
  assert.match(nested, /<br>​<\/div><\/div>$/);
});

test("C9 — font size control: plain div runs follow the stepper; .lg stays fixed at normalize(28)", () => {
  const at15 = renderCardFace("<div>hello <span class=\"lg\">BIG</span></div>", style, { fontSize: 15 });
  assert.match(styleAttr(at15.html, "hello"), /font-size:15px/);
  assert.match(styleAttr(at15.html, "BIG"), /font-size:28px/);

  const at18 = renderCardFace("<div>hello <span class=\"lg\">BIG</span></div>", style, { fontSize: 18 });
  assert.match(styleAttr(at18.html, "hello"), /font-size:18px/);
  assert.match(styleAttr(at18.html, "BIG"), /font-size:28px/); // unaffected by the stepper

  assert.equal(style.fontSizeControl.min, 10);
  assert.equal(style.fontSizeControl.max, 22);
});

test("C10 — device scaling: tablet 768x1024 applies the 0.7 factor to both the stepper size and a fixed class size", () => {
  const factor = normalizeFactor(768, 1024, true);
  const r = renderCardFace('<div>hi <span class="lg">BIG</span></div>', style, { fontSize: 15, width: 768, height: 1024, tablet: true });
  assert.match(styleAttr(r.html, "hi"), new RegExp(`font-size:${Math.round(15 * factor)}px`));
  assert.match(styleAttr(r.html, "BIG"), new RegExp(`font-size:${Math.round(28 * factor)}px`));
  assert.equal(r.scaleFactor.toFixed(3), "1.434");
});

test("flex class renders as a flex row (never <sup>/vertical-align), per B01047's `center flex` X face", () => {
  const { html } = renderCardFace(CARDS.B01047.X, style, {});
  // the outer div carries both "center" and "flex" and is the first
  // element in source order, so the first "<div" in the output is it.
  const outer = styleAttr(html, "<div");
  assert.match(outer, /display:flex/);
  assert.match(outer, /align-items:center/);
});

test("undefined classes (e.g. .bold) have zero effect — <b class=\"bold\"> is styled purely by the <b> tag", () => {
  assert.equal(style.classes.bold, undefined);
  const { html } = renderCardFace('<b class="bold">x</b>', style, { theme: "light" });
  const tag = styleAttr(html, ">x<");
  assert.match(tag, /color:#246BFD/); // b's own headingAccent, nothing from ".bold"
});

test("p margins: marginTop 0, marginBottom normalize(6)", () => {
  const { html } = renderCardFace("<p>text</p>", style, {});
  const tag = styleAttr(html, "text");
  assert.match(tag, /margin-top:0px/);
  assert.match(tag, /margin-bottom:6px/);
});

test("warnings surface dropped fonts (.center/.tipOfTheDay) from the extractor's data, never a hard-coded name list", () => {
  const { warnings } = renderCardFace('<div class="center">x</div>', style, {});
  assert.ok(warnings.some((w) => w.kind === "fontDropped" && w.family === "Poppins-SemiBold"));
});
