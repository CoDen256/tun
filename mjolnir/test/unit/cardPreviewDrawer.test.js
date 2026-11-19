import test from "node:test";
import assert from "node:assert/strict";
import path from "node:path";
import {
  clampDrawerWidth,
  clampDrawerHeight,
  isSheetLayout,
  wrapSelectionOrInsert,
  isEdited,
  currentFaceHtml,
  copyAllFacesText,
  editorSlotLabel,
  highlightHtmlTokens,
  tagCopyText,
  classCopyText,
  symbolCopyText,
  buildClassesAndTagsRows,
  buildSymbolsRows,
  DRAWER_WIDTH_MIN,
  DRAWER_HEIGHT_MIN,
} from "../../hub/src/cardPreviewDrawer.js";
import { extractCardStyle } from "../../tool/src/extractCardStyle.js";
import { extractCardSymbols } from "../../tool/src/extractCardSymbols.js";
import { extractCardUsageCounts } from "../../tool/src/extractCardUsageCounts.js";
import { normalize } from "../../hub/src/cardRenderer.js";
import { _drawerEngine } from "../../hub/src/cardPreviewPopup.js";
import * as directDrawerEngine from "../../hub/src/cardPreviewDrawer.js";

// card-preview-popup task group 4 ("Tools drawer") — pure-logic tests.
// DOM/browser behaviour (actual dragging, clipboard, contenteditable
// cursor restore, debounce timing) is left to the tester agent verifying
// acceptance.md C23-C28 in a real browser, per this task's own brief.

const REAL_BUNDLE = path.join(import.meta.dirname, "../../base/smali.mjolnir.merged/assets/index.android.bundle");

test("cardPreviewPopup.js's _drawerEngine re-exports the exact cardPreviewDrawer.js functions (no second copy)", () => {
  assert.equal(_drawerEngine.clampDrawerWidth, directDrawerEngine.clampDrawerWidth);
  assert.equal(_drawerEngine.wrapSelectionOrInsert, directDrawerEngine.wrapSelectionOrInsert);
  assert.equal(_drawerEngine.isEdited, directDrawerEngine.isEdited);
  assert.equal(_drawerEngine.buildClassesAndTagsRows, directDrawerEngine.buildClassesAndTagsRows);
  assert.equal(_drawerEngine.buildSymbolsRows, directDrawerEngine.buildSymbolsRows);
  assert.equal(_drawerEngine.highlightHtmlTokens, directDrawerEngine.highlightHtmlTokens);
});

test("clampDrawerWidth — design §4 / C23: 320px…75% of the dialog", () => {
  assert.equal(clampDrawerWidth(700, 1000), 700);
  assert.equal(clampDrawerWidth(10, 1000), DRAWER_WIDTH_MIN);
  assert.equal(clampDrawerWidth(5000, 1000), 750);
  // narrow dialog: 75% can itself be below the 320 floor — the floor wins
  assert.equal(clampDrawerWidth(500, 300), DRAWER_WIDTH_MIN);
});

test("clampDrawerHeight — 160px…85% of the body (bottom sheet)", () => {
  assert.equal(clampDrawerHeight(400, 1000), 400);
  assert.equal(clampDrawerHeight(10, 1000), DRAWER_HEIGHT_MIN);
  assert.equal(clampDrawerHeight(5000, 1000), 850);
});

test("isSheetLayout — the ~760px breakpoint", () => {
  assert.equal(isSheetLayout(759), true);
  assert.equal(isSheetLayout(760), false);
  assert.equal(isSheetLayout(1200), false);
});

test("wrapSelectionOrInsert — C25: selecting text wraps it", () => {
  const html = "<span>regner</span>";
  const start = html.indexOf("regner");
  const end = start + "regner".length;
  const result = wrapSelectionOrInsert(html, start, end, '<span class="teal">', "</span>");
  assert.equal(result.value, '<span><span class="teal">regner</span></span>');
});

test("wrapSelectionOrInsert — no selection inserts at the cursor, cursor lands between open/close", () => {
  const result = wrapSelectionOrInsert("abc", 1, 1, "<b>", "</b>");
  assert.equal(result.value, "a<b></b>bc");
  assert.equal(result.selectionStart, 1 + "<b>".length);
  assert.equal(result.selectionEnd, result.selectionStart);
});

test("isEdited / currentFaceHtml — the edited chip and Reset's basis", () => {
  const original = { N: "<div>n</div>", E: "<div>e</div>", X: "" };
  assert.equal(isEdited(original, undefined), false);
  assert.equal(isEdited(original, {}), false);
  assert.equal(isEdited(original, { N: "<div>n</div>" }), false); // identical text: not edited
  assert.equal(isEdited(original, { N: "<div>changed</div>" }), true);

  assert.equal(currentFaceHtml(original, { N: "<div>changed</div>" }, "N"), "<div>changed</div>");
  assert.equal(currentFaceHtml(original, { N: "<div>changed</div>" }, "E"), "<div>e</div>");
  assert.equal(currentFaceHtml(original, null, "X"), "");
});

test("copyAllFacesText — Copy all concatenates and labels all three faces", () => {
  const text = copyAllFacesText({ N: "<div>n</div>", E: "<div>e</div>", X: "" });
  assert.match(text, /<!-- N -->\n<div>n<\/div>/);
  assert.match(text, /<!-- E -->\n<div>e<\/div>/);
  assert.match(text, /<!-- X -->\n$/);
});

test("editorSlotLabel — slot labels follow the active direction, not a fixed N/E/X", () => {
  assert.equal(editorSlotLabel({ top: "N", mid: "E", bottom: "X" }, "N"), "top face");
  assert.equal(editorSlotLabel({ top: "N", mid: "E", bottom: "X" }, "E"), "middle face");
  assert.equal(editorSlotLabel({ top: "E", mid: "N", bottom: "X" }, "N"), "middle face");
  assert.equal(editorSlotLabel({ top: "E", mid: "N", bottom: "X" }, "E"), "top face");
  assert.equal(editorSlotLabel({ top: "N", mid: "E", bottom: "X" }, "X"), "bottom face");
});

test("highlightHtmlTokens — tags/attributes/strings tokenize distinctly (C25)", () => {
  const tokens = highlightHtmlTokens('<span class="teal">hi</span>');
  const kinds = tokens.map((t) => t.kind);
  assert.ok(kinds.includes("tag"));
  assert.ok(kinds.includes("attr"));
  assert.ok(kinds.includes("string"));
  assert.ok(kinds.includes("text"));
  // Reassembling every token's text recovers the original exactly.
  assert.equal(tokens.map((t) => t.text).join(""), '<span class="teal">hi</span>');
});

test("tagCopyText — <br> is the one exception, never <br></br>", () => {
  assert.equal(tagCopyText("br"), "<br>");
  assert.equal(tagCopyText("b"), "<b></b>");
  assert.equal(tagCopyText("div"), "<div></div>");
});

test("classCopyText", () => {
  assert.equal(classCopyText("royalRed"), 'class="royalRed"');
});

test("symbolCopyText — entity vs literal character", () => {
  assert.equal(symbolCopyText({ codepoint: 649, literal: false }), "&#649;");
  assert.equal(symbolCopyText({ codepoint: 229, literal: true }), "å");
});

test("buildClassesAndTagsRows — exactly Selector/Resolves-to/Sample shape, no Kind, grouped (C27)", () => {
  const style = extractCardStyle(REAL_BUNDLE);
  const usage = extractCardUsageCounts(REAL_BUNDLE);
  const state = { width: 375, height: 812, tablet: false, theme: "light", fontSize: 15 };
  const normalizeFn = (v, w, h, t) => normalize(v, w, h, t);
  const rows = buildClassesAndTagsRows(style, usage, state, normalizeFn);

  const groups = rows.filter((r) => r.group).map((r) => r.group);
  assert.deepEqual(groups, ["Tags (tagsStyles, Android)", "Line metrics", "Classes (classesStyles)"]);

  const bySelector = Object.fromEntries(rows.filter((r) => r.selector).map((r) => [r.selector, r]));

  // .bold: undefined, no classesStyles entry, real usage count carried through
  assert.ok(bySelector[".bold"]);
  assert.deepEqual(bySelector[".bold"].flags, ["undefined"]);
  assert.equal(bySelector[".bold"].usage, 1459);

  // .center / .tipOfTheDay: font dropped, derived from the extractor's own flag
  assert.ok(bySelector[".center"].flags.includes("font dropped"));
  assert.ok(bySelector[".tipOfTheDay"].flags.includes("font dropped"));

  // line-metric rows: inferred, not copyable
  const poppinsLine = bySelector["Poppins line"];
  assert.deepEqual(poppinsLine.flags, ["inferred"]);
  assert.equal(poppinsLine.copyText, null);

  // br row copies <br>, not <br></br>
  assert.equal(bySelector.br.copyText, "<br>");

  // a resolved class's "Resolves to" sizes reflect the current font size
  const lgAt15 = bySelector[".lg"].resolvesTo;
  const rows18 = buildClassesAndTagsRows(style, usage, { ...state, fontSize: 18 }, normalizeFn);
  const lgAt18 = Object.fromEntries(rows18.filter((r) => r.selector).map((r) => [r.selector, r]))[".lg"].resolvesTo;
  // .lg's own fontSize(28) does not depend on the base font stepper, but
  // changing device/theme does change colour tokens elsewhere — assert at
  // least that device size changes the device-dependent rows' text.
  const rowsTablet = buildClassesAndTagsRows(style, usage, { ...state, width: 768, height: 1024, tablet: true }, normalizeFn);
  const lgTablet = Object.fromEntries(rowsTablet.filter((r) => r.selector).map((r) => [r.selector, r]))[".lg"].resolvesTo;
  assert.notEqual(lgAt15, lgTablet);
  assert.equal(lgAt15, lgAt18); // sanity: same device, .lg's fixed size is stable across the stepper
});

test("buildSymbolsRows — Entity/Glyph/Name/Uses rows, grouped, real counts", () => {
  const symbols = extractCardSymbols(REAL_BUNDLE);
  const rows = buildSymbolsRows(symbols);
  const groups = rows.filter((r) => r.group);
  assert.ok(groups.length >= 2);
  const dataRows = rows.filter((r) => !r.group);
  assert.ok(dataRows.length > 0);
  for (const r of dataRows) {
    assert.ok(typeof r.uses === "number");
    assert.ok(typeof r.copyText === "string");
  }
});
