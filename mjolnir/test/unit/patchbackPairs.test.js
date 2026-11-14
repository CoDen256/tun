import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { listPatchbackPairs, loadPatchbackPair } from "../../src/patchbackPairs.js";

function withTmpDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-patchback-pairs-"));
  try {
    return fn(dir);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("listPatchbackPairs lists complete baseline/edited pairs, parsing the leading module id (D111)", () => {
  withTmpDir((dir) => {
    fs.writeFileSync(path.join(dir, "2176-my-account-build-id.baseline.js"), "// baseline\n");
    fs.writeFileSync(path.join(dir, "2176-my-account-build-id.edited.js"), "// edited\n");
    fs.writeFileSync(path.join(dir, "boot-ok-companion.js"), "// not a pair at all\n");
    fs.writeFileSync(path.join(dir, "incomplete.baseline.js"), "// no matching .edited.js\n");

    const pairs = listPatchbackPairs(dir);
    assert.deepEqual(pairs.map((p) => p.name), ["2176-my-account-build-id"]);
    assert.equal(pairs[0].moduleId, 2176);
    assert.ok(fs.existsSync(pairs[0].baselinePath));
    assert.ok(fs.existsSync(pairs[0].editedPath));
  });
});

test("listPatchbackPairs returns an empty list for a missing directory, not an error", () => {
  assert.deepEqual(listPatchbackPairs("/no/such/directory/at/all"), []);
});

test("loadPatchbackPair throws a clear error for an unknown name", () => {
  withTmpDir((dir) => {
    assert.throws(() => loadPatchbackPair(dir, "nope"), /no such patch-back pair/);
  });
});

test("loadPatchbackPair throws when the name carries no leading module id", () => {
  withTmpDir((dir) => {
    fs.writeFileSync(path.join(dir, "no-id-here.baseline.js"), "// baseline\n");
    fs.writeFileSync(path.join(dir, "no-id-here.edited.js"), "// edited\n");
    assert.throws(() => loadPatchbackPair(dir, "no-id-here"), /no leading/);
  });
});

test("against the real repo's own patches/js/, the 2176-my-account-build-id pair is listed with moduleId 2176", () => {
  const pairs = listPatchbackPairs(path.join(import.meta.dirname, "../../patches/js"));
  const pair = pairs.find((p) => p.name === "2176-my-account-build-id");
  assert.ok(pair, "expected to find the repo's own my-account-build-id pair");
  assert.equal(pair.moduleId, 2176);
});
