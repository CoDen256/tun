import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { loadManifest } from "../../src/commands/deobfuscate.js";
import { runExplode } from "../../src/commands/explode.js";
import { reassembleBundle } from "../../src/reassemble.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";

const FIXTURE = path.resolve("test/fixtures/demo.bundle");

function withTempCopy(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-reassemble-"));
  const bundlePath = path.join(dir, "demo.bundle");
  fs.copyFileSync(FIXTURE, bundlePath);
  try {
    return fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("reassembling with zero patches is byte-identical to the original bundle", () => {
  withTempCopy((bundlePath) => {
    runExplode(bundlePath);
    const manifest = loadManifest(bundlePath);
    const result = reassembleBundle(bundlePath, manifest, []);
    const original = fs.readFileSync(bundlePath);
    assert.equal(Buffer.compare(result, original), 0);
  });
});

test("reassembling with one patched module leaves every other module's content identical", () => {
  withTempCopy((bundlePath) => {
    runExplode(bundlePath);
    const manifest = loadManifest(bundlePath);

    const patchedSource = "__d(function(a,b,c,d,e,f,g){e.exports='9.9.9'},2042,[]);";
    const result = reassembleBundle(bundlePath, manifest, [
      { moduleId: "2042", newSource: patchedSource },
    ]);

    const outPath = path.join(path.dirname(bundlePath), "out.bundle");
    fs.writeFileSync(outPath, result);

    const originalParsed = parseBundle(bundlePath);
    const patchedParsed = parseBundle(outPath);

    assert.equal(patchedParsed.moduleCount, originalParsed.moduleCount);

    for (const [id, mod] of originalParsed.modules) {
      const patchedMod = patchedParsed.modules.get(id);
      const patchedContent = readModuleSource(outPath, patchedMod);
      if (id === 2042) {
        assert.equal(patchedContent, patchedSource);
      } else {
        const originalContent = readModuleSource(bundlePath, mod);
        assert.equal(patchedContent, originalContent, `module ${id} should be unchanged`);
      }
    }
  });
});
