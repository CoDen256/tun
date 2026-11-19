import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { extractCardSymbols } from "../../tool/src/extractCardSymbols.js";

// card-preview-popup task 1.3 (widening assembly-tab-usability's task 3.2):
// extractCardSymbols scans the stock bundle's own card content for real
// occurrence counts — both numeric HTML entities (`&#NNN;`) AND literal
// (non-entity) non-ASCII characters, which the bundle embeds as `\xNN`/
// `\uNNNN` JS string escapes (e.g. `p\xe5 skolen`) — rather than a
// hand-maintained guess. The scan is scoped to the card array itself
// (anchored on the real `DECK_ID`/`ID` field names), not the whole 6MB
// bundle, so unrelated code elsewhere can't inflate the Uses column.
// Must throw loudly on an unrecognized codepoint rather than rendering an
// unlabeled row.

const REAL_BUNDLE = path.join(
  import.meta.dirname,
  "../../base/smali.mjolnir.merged/assets/index.android.bundle"
);

function withTmpBundle(text, fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-extractcardsymbols-"));
  const file = path.join(dir, "bundle.js");
  fs.writeFileSync(file, text, "utf8");
  try {
    return fn(file);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("extractCardSymbols finds the real Norwegian-letter and IPA entities in the stock bundle", () => {
  const symbols = extractCardSymbols(REAL_BUNDLE);

  // Norwegian group: always æ/ø/å, in that order, even when a count is 0.
  assert.equal(symbols.norwegian.length, 3);
  const [ae, oslash, aring] = symbols.norwegian;
  assert.equal(ae.codepoint, 230);
  assert.equal(ae.glyph, "æ");
  assert.equal(ae.name, "LATIN SMALL LETTER AE");
  assert.ok(ae.occurrences > 0);

  assert.equal(oslash.codepoint, 248);
  assert.equal(oslash.glyph, "ø");

  assert.equal(aring.codepoint, 229);
  assert.equal(aring.glyph, "å");
  // å occurs only as a LITERAL `\xe5` escape in card content (e.g.
  // "p\xe5 skolen"), never as an `&#229;` entity — task 1.3's whole point
  // is that the old entity-only scan would have reported a false zero here.
  assert.ok(aring.occurrences > 0);
  assert.equal(aring.entityOccurrences, 0);
  assert.equal(aring.literalOccurrences, aring.occurrences);

  // IPA group: a known codepoint (649, LATIN SMALL LETTER U BAR / design.md
  // criterion 29's ʉ) must be present, correctly named, sorted by
  // occurrence count (non-increasing).
  const u = symbols.ipa.find((r) => r.codepoint === 649);
  assert.ok(u, "expected codepoint 649 (ʉ) in the ipa group");
  assert.equal(u.glyph, "ʉ");
  assert.equal(u.name, "LATIN SMALL LETTER U BAR");
  for (let i = 1; i < symbols.ipa.length; i++) {
    assert.ok(symbols.ipa[i - 1].occurrences >= symbols.ipa[i].occurrences);
  }

  // Plain ASCII entities (e.g. &#39; apostrophe) are not IPA noise.
  assert.ok(!symbols.ipa.some((r) => r.codepoint < 0x80));
});

// A minimal but structurally real card array: one card object with the
// real `DECK_ID`/`ID` field names the scope-anchor looks for.
function cardArrayFixture(nContent) {
  return `__d(function(e,s,i,a,t,n,l){t.exports=[{DECK_ID:"X01",ID:"X01001",N:"${nContent}",E:"",D:"X",X:"",A:"N"}]},9999,[]);\n`;
}

test("extractCardSymbols throws on an unrecognized codepoint rather than rendering an unlabeled row", () => {
  // 9999999 is not in CODEPOINT_NAMES and never will be a real IPA/Norwegian
  // codepoint this app ships — the extractor must refuse rather than
  // silently drop or mislabel it.
  const corrupted = cardArrayFixture("some card content with &#9999999; in it, nothing else of note");
  withTmpBundle(corrupted, (file) => {
    assert.throws(() => extractCardSymbols(file));
  });
});

test("extractCardSymbols still requires named entries even for the fixed Norwegian group", () => {
  // If æ/ø/å's codepoints weren't backed by CODEPOINT_NAMES, the fixed
  // Norwegian group itself would throw (not just the IPA scan) — this
  // guards against someone emptying the name table accidentally during
  // a future rebase without the real table ever having to be edited here.
  const text = cardArrayFixture("plain content, no numeric entities present at all");
  withTmpBundle(text, (file) => {
    const symbols = extractCardSymbols(file);
    assert.equal(symbols.norwegian.length, 3);
    assert.ok(symbols.norwegian.every((r) => r.occurrences === 0));
    assert.equal(symbols.ipa.length, 0);
  });
});

test("extractCardSymbols throws when the card array anchor can't be found at all", () => {
  // No `{DECK_ID:"` anywhere — must refuse rather than fall back to
  // scanning the whole file (which would silently reintroduce the
  // off-card noise task 1.3 scopes the scan to avoid).
  withTmpBundle("not a bundle at all, just plain text with &#230; in it\n", (file) => {
    assert.throws(() => extractCardSymbols(file), /card array/);
  });
});

test("extractCardSymbols counts a literal non-entity character the same as an entity (task 1.3)", () => {
  // æ (230) written as a literal `\xe6` escape, with no `&#230;` entity
  // anywhere — the Uses column must still show it.
  const text = cardArrayFixture("Norske ord: tr\\xe6r og sk\\xe6r");
  withTmpBundle(text, (file) => {
    const symbols = extractCardSymbols(file);
    const ae = symbols.norwegian.find((r) => r.codepoint === 230);
    assert.equal(ae.entityOccurrences, 0);
    assert.equal(ae.literalOccurrences, 2);
    assert.equal(ae.occurrences, 2);
  });
});
