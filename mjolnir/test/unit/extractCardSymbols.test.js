import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { extractCardSymbols } from "../../tool/src/extractCardSymbols.js";

// assembly-tab-usability item 3 (task 3.2): extractCardSymbols scans the
// stock bundle's own numeric HTML entities for real occurrence counts,
// rather than a hand-maintained guess. Must throw loudly on an
// unrecognized codepoint rather than rendering an unlabeled row.

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
  // å genuinely does not occur in this build's sample content — a real
  // zero, not an omission.
  assert.equal(aring.occurrences, 0);

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

test("extractCardSymbols throws on an unrecognized codepoint rather than rendering an unlabeled row", () => {
  // 9999999 is not in CODEPOINT_NAMES and never will be a real IPA/Norwegian
  // codepoint this app ships — the extractor must refuse rather than
  // silently drop or mislabel it.
  const corrupted = "some card content with &#9999999; in it, nothing else of note\n";
  withTmpBundle(corrupted, (file) => {
    assert.throws(() => extractCardSymbols(file));
  });
});

test("extractCardSymbols still requires named entries even for the fixed Norwegian group", () => {
  // If æ/ø/å's codepoints weren't backed by CODEPOINT_NAMES, the fixed
  // Norwegian group itself would throw (not just the IPA scan) — this
  // guards against someone emptying the name table accidentally during
  // a future rebase without the real table ever having to be edited here.
  const text = "plain content, no numeric entities present at all\n";
  withTmpBundle(text, (file) => {
    const symbols = extractCardSymbols(file);
    assert.equal(symbols.norwegian.length, 3);
    assert.ok(symbols.norwegian.every((r) => r.occurrences === 0));
    assert.equal(symbols.ipa.length, 0);
  });
});
