import test from "node:test";
import assert from "node:assert/strict";
import { buildFixtureBundleSource, DECK_MODULE_ID, CARD_MODULE_ID } from "../fixtures/deckCardFixture.js";
import {
  buildIndexFromBuffer,
  readModuleSourceFromBuffer,
  resetParseCallCountForTests,
  getParseCallCountForTests,
} from "../../src/parseBundle.js";
import { applyPatchInBuffer } from "../../src/patches.js";

// Builds a trivial, always-clean-applying patch: baseline is the module's
// EXACT current source (read straight out of the buffer, never hand-typed
// — any drift there would make this a patch-diff test, not a parse-count
// test), modified is that same source with one extra top-level statement
// appended. `locator` must be unique to this one module among every module
// in the fixture bundle.
function trivialAppendPatch(buffer, cache, moduleId, locator, markerStatement) {
  const mod = cache.modules[moduleId];
  const baseline = readModuleSourceFromBuffer(buffer, mod);
  // The factory body is `__d(function (...) { <body> }, id, deps);` — insert
  // the marker statement right before the closing `}` of the function body,
  // the simplest possible "append one statement" edit.
  const closeIdx = baseline.lastIndexOf("}");
  const modified = baseline.slice(0, closeIdx) + `  ${markerStatement}\n` + baseline.slice(closeIdx);
  return { locator: { contains: locator }, baseline, modified };
}

test("assemble-performance-fix: applying multiple patches against an in-memory buffer parses the bundle exactly once, not once per patch (D-P1)", async () => {
  const source = buildFixtureBundleSource();
  const buffer = Buffer.from(source, "utf8");

  resetParseCallCountForTests();
  assert.equal(getParseCallCountForTests(), 0);

  let cache = { modules: buildIndexFromBuffer(buffer).modules };
  assert.equal(getParseCallCountForTests(), 1, "building the initial index must parse exactly once");

  // Two independent patches, each targeting a different module — the
  // realistic shape of a real assemble (several patch-back pairs, each its
  // own module) — applied in sequence against the SAME in-memory buffer.
  const patchA = trivialAppendPatch(buffer, cache, DECK_MODULE_ID, '"Name":"B01"', "g.patchedDecks = true;");
  let result = await applyPatchInBuffer({ buffer, cache, patch: patchA });
  let currentBuffer = result.buffer;
  cache = { modules: result.modules };

  assert.equal(
    getParseCallCountForTests(),
    1,
    "applying the first patch must not trigger another full-bundle parse"
  );

  const patchB = trivialAppendPatch(currentBuffer, cache, CARD_MODULE_ID, '"ID":"B01001"', "g.patchedCards = true;");
  result = await applyPatchInBuffer({ buffer: currentBuffer, cache, patch: patchB });
  currentBuffer = result.buffer;
  cache = { modules: result.modules };

  assert.equal(
    getParseCallCountForTests(),
    1,
    "applying a second patch must still not trigger another full-bundle parse — this is the actual fix: parse count stays flat regardless of how many patches are applied"
  );

  // Confirm both edits actually took effect — this is a parse-count test,
  // not a correctness test, but a passing parse-count assertion against a
  // no-op/broken patch mechanism would be a false positive.
  const deckSource = readModuleSourceFromBuffer(currentBuffer, cache.modules[DECK_MODULE_ID]);
  const cardSource = readModuleSourceFromBuffer(currentBuffer, cache.modules[CARD_MODULE_ID]);
  // Minified by terser along the way (variable names get renamed, `true`
  // becomes `!0`) — just confirm the marker identifiers survived, not the
  // exact unminified text.
  assert.match(deckSource, /patchedDecks/);
  assert.match(cardSource, /patchedCards/);
});
