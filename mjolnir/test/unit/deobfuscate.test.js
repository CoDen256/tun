import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { runExplode } from "../../src/commands/explode.js";
import { runDeobfuscate } from "../../src/commands/deobfuscate.js";

const FIXTURE = path.resolve("test/fixtures/demo.bundle");

function withTempCopy(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-deob-"));
  const bundlePath = path.join(dir, "demo.bundle");
  fs.copyFileSync(FIXTURE, bundlePath);
  try {
    return fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("deobfuscate rewrites the interop-wildcard pattern and emits its helper", () => {
  withTempCopy((bundlePath) => {
    runExplode(bundlePath);
    runDeobfuscate(bundlePath);

    const out = fs.readFileSync(
      path.join(bundlePath + ".exploded", "deobfuscated", "300.js"),
      "utf8"
    );
    assert.match(out, /function _interopRequireWildcard\(/);
    assert.match(out, /_interopRequireWildcard\(_r\(d\[0\]\)\)/);
    assert.doesNotMatch(out, /WeakMap\(\),\s*\n\s*n = new WeakMap/);
  });
});

test("deobfuscate leaves non-matching modules unmodified", () => {
  withTempCopy((bundlePath) => {
    runExplode(bundlePath);
    runDeobfuscate(bundlePath);

    const before = fs.readFileSync(path.join(bundlePath + ".exploded", "824.js"), "utf8");
    const after = fs.readFileSync(
      path.join(bundlePath + ".exploded", "deobfuscated", "824.js"),
      "utf8"
    );
    assert.equal(after, before);
  });
});

test("deobfuscate skips data-classified modules", () => {
  withTempCopy((bundlePath) => {
    runExplode(bundlePath);
    const manifest = JSON.parse(
      fs.readFileSync(path.join(bundlePath + ".exploded", "manifest.json"), "utf8")
    );
    const dataIds = Object.entries(manifest)
      .filter(([, m]) => m.classification === "data")
      .map(([id]) => id);

    runDeobfuscate(bundlePath);

    for (const id of dataIds) {
      assert.equal(
        fs.existsSync(path.join(bundlePath + ".exploded", "deobfuscated", `${id}.js`)),
        false
      );
    }
  });
});
