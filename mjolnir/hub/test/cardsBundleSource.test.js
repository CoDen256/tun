// card-preview-popup task group 5, task 5.2 — hub/src/cardsBundleSource.js.
// Reads a synthetic bundle through the real `loadDeckCardModel` (same
// fixture shape test/fixtures/deckCardFixture.js already uses for the data
// model's own tests) — never touches `data/ota/` on disk; this test writes
// its OWN throwaway bundle file under node:os.tmpdir(), never under any
// path CLAUDE.md calls the device plane.
import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { loadBundleRows, bundlePathFor, resetBundleSourceCache } from "../src/cardsBundleSource.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";

function withTempDataDir(buildId, write) {
  const dataDir = fs.mkdtempSync(path.join(os.tmpdir(), "cards-bundle-source-"));
  fs.mkdirSync(path.join(dataDir, "ota", "bundle"), { recursive: true });
  if (write) fs.writeFileSync(bundlePathFor(dataDir, buildId), buildFixtureBundleSource());
  return dataDir;
}

test("loadBundleRows: builds the common row shape from the fixture bundle, occurrences present/absent only", () => {
  resetBundleSourceCache();
  const dataDir = withTempDataDir("b000001", true);
  const { rows, error, buildId } = loadBundleRows(dataDir, "b000001");
  assert.equal(error, null);
  assert.equal(buildId, "b000001");
  // The fixture's distinct card ids: A01001, A01002, B01001 (acceptance
  // C34's "count equals the bundle's distinct card ids").
  assert.deepEqual(
    rows.map((r) => r.id).sort(),
    ["A01001", "A01002", "B01001"]
  );

  const dual = rows.find((r) => r.id === "B01001");
  // The fixture's dual-occurrence card (N and E both referenced).
  assert.deepEqual(dual.occurrences.map((o) => o.letter).sort(), ["E", "N"]);
  assert.ok(dual.occurrences.every((o) => o.status === "shipped"));

  const single = rows.find((r) => r.id === "A01001");
  assert.deepEqual(single.occurrences.map((o) => o.letter), ["N"]);
  assert.equal(single.isHubMinted, false); // corrected only by the caller, against card_slots
});

test("loadBundleRows: a bundle file that cannot be read degrades with an inline error, never throws", () => {
  resetBundleSourceCache();
  const dataDir = withTempDataDir("b000002", false); // never written
  const { rows, error } = loadBundleRows(dataDir, "b000002");
  assert.deepEqual(rows, []);
  assert.ok(typeof error === "string" && error.length > 0);
});

test("loadBundleRows: caches per build id — a second call for the same id does not re-read the file", () => {
  resetBundleSourceCache();
  const dataDir = withTempDataDir("b000003", true);
  const first = loadBundleRows(dataDir, "b000003");
  // Remove the file; a cached hit must still answer the same rows.
  fs.rmSync(bundlePathFor(dataDir, "b000003"));
  const second = loadBundleRows(dataDir, "b000003");
  assert.deepEqual(second.rows.map((r) => r.id), first.rows.map((r) => r.id));
});
