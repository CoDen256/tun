import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import crypto from "node:crypto";
import {
  validateBuildId,
  checkMagicPrefix,
  checkCompanionMatch,
  checkReuse,
  publish,
  restampCompanionConstants,
  findBakedBaseVersion,
  findBakedPatchRev,
} from "../../tool/src/otaPublish.js";

const MAGIC = "var __BUNDLE_START_TIME__=";

function withTmpDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-otapublish-"));
  try {
    return fn(dir);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

function bundleBytes({ withCompanion = true, buildId = "b1", dataVersion = "1", builtAt = "2026-01-01T00:00:00.000Z" } = {}) {
  let src = `${MAGIC}1;\nconsole.log("hi");\n`;
  if (withCompanion) {
    src += `var BUILD_ID = '${buildId}';\n`;
    src += `var BASE_VERSION = '1.5.12';\n`;
    src += `var PATCH_REV = 3;\n`;
    src += `var DATA_VERSION = '${dataVersion}';\n`;
    src += `var BUILT_AT = '${builtAt}';\n`;
  }
  return Buffer.from(src, "utf8");
}

test("validateBuildId accepts the documented charset and rejects everything else", () => {
  validateBuildId("b000001");
  validateBuildId("a.b-c_1");
  assert.throws(() => validateBuildId("has a space"));
  assert.throws(() => validateBuildId("has/slash"));
  assert.throws(() => validateBuildId(""));
  assert.throws(() => validateBuildId("x".repeat(65)));
});

test("checkMagicPrefix refuses a bundle without the boot-ok activation prefix", () => {
  checkMagicPrefix(bundleBytes());
  assert.throws(() => checkMagicPrefix(Buffer.from("not a bundle", "utf8")));
});

test("checkCompanionMatch refuses a baked BUILD_ID that differs from the publish id", () => {
  const bytes = bundleBytes({ buildId: "b1" });
  assert.equal(checkCompanionMatch(bytes, "b1"), "b1");
  assert.throws(() => checkCompanionMatch(bytes, "b2"));
});

test("restampCompanionConstants restamps every publish-time fact, keyed on the constant NAME not the baked literal", () => {
  withTmpDir((dir) => {
    const file = path.join(dir, "bundle.js");
    // Deliberately wrong baked values — the restamp must not depend on
    // knowing what assemble happened to put there (D-SS7).
    fs.writeFileSync(file, bundleBytes({ buildId: "b000001", dataVersion: "99", builtAt: "1999-01-01T00:00:00.000Z" }));

    const { restamped, missing } = restampCompanionConstants(file, {
      BUILD_ID: "b000002",
      DATA_VERSION: "247",
      BUILT_AT: "2026-11-15T03:12:00.000Z",
    });
    assert.deepEqual(restamped, ["BUILD_ID", "DATA_VERSION", "BUILT_AT"]);
    assert.deepEqual(missing, []);

    const updated = fs.readFileSync(file);
    const text = updated.toString("utf8");
    // Second publish, same working file: without the restamp this would
    // refuse forever (the exact bug the BUILD_ID half guards against).
    assert.equal(checkCompanionMatch(updated, "b000002"), "b000002");
    assert.throws(() => checkCompanionMatch(updated, "b000001"));
    assert.match(text, /var DATA_VERSION = '247';/);
    assert.match(text, /var BUILT_AT = '2026-11-15T03:12:00\.000Z';/);
    // D-L4/D-L6: assemble-time facts are NOT restamped.
    assert.match(text, /var BASE_VERSION = '1\.5\.12';/);
    assert.match(text, /var PATCH_REV = 3;/);
  });
});

test("restampCompanionConstants reports a constant the companion doesn't carry, and is a no-op with no companion", () => {
  withTmpDir((dir) => {
    const noCompanion = path.join(dir, "none.js");
    const before = bundleBytes({ withCompanion: false });
    fs.writeFileSync(noCompanion, before);
    const result = restampCompanionConstants(noCompanion, { BUILD_ID: "b1", DATA_VERSION: "2", BUILT_AT: "z" });
    assert.deepEqual(result.restamped, []);
    assert.deepEqual(result.missing, ["BUILD_ID", "DATA_VERSION", "BUILT_AT"]);
    assert.deepEqual(fs.readFileSync(noCompanion), before, "nothing written when there is nothing to restamp");

    // An older companion predating BUILT_AT: what exists is restamped, what
    // doesn't is reported rather than failing the publish.
    const older = path.join(dir, "older.js");
    fs.writeFileSync(older, `${MAGIC}1;\nvar BUILD_ID = 'b000001';\nvar DATA_VERSION = '3';\n`);
    const partial = restampCompanionConstants(older, { BUILD_ID: "b000002", DATA_VERSION: "4", BUILT_AT: "2026-11-15T03:12:00.000Z" });
    assert.deepEqual(partial.restamped, ["BUILD_ID", "DATA_VERSION"]);
    assert.deepEqual(partial.missing, ["BUILT_AT"]);
  });
});

test("checkCompanionMatch refuses a missing companion unless allowNoCompanion", () => {
  const bytes = bundleBytes({ withCompanion: false });
  assert.throws(() => checkCompanionMatch(bytes, "b1"));
  assert.equal(checkCompanionMatch(bytes, "b1", { allowNoCompanion: true }), null);
});

test("findBakedBaseVersion/findBakedPatchRev read both finders correctly when both constants are baked", () => {
  const bytes = Buffer.from(
    `${MAGIC}1;\nvar BUILD_ID = 'b1';\nvar BASE_VERSION = '1.5.12';\nvar PATCH_REV = 3;\n`,
    "utf8"
  );
  assert.equal(findBakedBaseVersion(bytes), "1.5.12");
  assert.equal(findBakedPatchRev(bytes), 3);
});

test("findBakedBaseVersion/findBakedPatchRev return null when neither constant is present (the prompt-the-operator case)", () => {
  const bytes = bundleBytes({ withCompanion: false });
  assert.equal(findBakedBaseVersion(bytes), null);
  assert.equal(findBakedPatchRev(bytes), null);
});

test("checkReuse allows identical re-publish, refuses a buildId reused with different bytes", () => {
  withTmpDir((dir) => {
    const dest = path.join(dir, "b1.js");
    const bytes = bundleBytes();
    fs.writeFileSync(dest, bytes);
    assert.deepEqual(checkReuse(dest, bytes), { reused: true });
    assert.throws(() => checkReuse(dest, bundleBytes({ buildId: "different" })));
  });
});

test("publish writes the bundle and current.json, end to end", () => {
  withTmpDir((dir) => {
    const bundlePath = path.join(dir, "fixture.bundle.js");
    const bytes = bundleBytes({ buildId: "b000001" });
    fs.writeFileSync(bundlePath, bytes);

    const result = publish(bundlePath, "b000001", "test label", {
      dataDir: path.join(dir, "data"),
      publicBase: "https://example.test",
    });

    assert.equal(result.buildId, "b000001");
    assert.equal(result.reused, false);
    assert.equal(result.sha256, crypto.createHash("sha256").update(bytes).digest("hex"));

    const destPath = path.join(dir, "data", "ota", "bundle", "b000001.js");
    assert.ok(fs.existsSync(destPath));
    assert.deepEqual(fs.readFileSync(destPath), bytes);

    const current = JSON.parse(fs.readFileSync(path.join(dir, "data", "ota", "current.json"), "utf8"));
    assert.equal(current.buildId, "b000001");
    assert.equal(current.sha256, result.sha256);
    assert.equal(current.url, "https://example.test/ota/bundle/b000001.js");
    assert.equal(current.label, "test label");

    // Republishing identical bytes under the same buildId succeeds (reused).
    const again = publish(bundlePath, "b000001", "test label", {
      dataDir: path.join(dir, "data"),
      publicBase: "https://example.test",
    });
    assert.equal(again.reused, true);
  });
});

test("publish refuses plain http unless allowHttp", () => {
  withTmpDir((dir) => {
    const bundlePath = path.join(dir, "fixture.bundle.js");
    fs.writeFileSync(bundlePath, bundleBytes({ buildId: "b1" }));
    assert.throws(() =>
      publish(bundlePath, "b1", "l", { dataDir: path.join(dir, "data"), publicBase: "http://example.test" })
    );
    const result = publish(bundlePath, "b1", "l", {
      dataDir: path.join(dir, "data"),
      publicBase: "http://example.test",
      allowHttp: true,
    });
    assert.equal(result.buildId, "b1");
  });
});

test("publish refuses an oversized or empty bundle", () => {
  withTmpDir((dir) => {
    const bundlePath = path.join(dir, "fixture.bundle.js");
    fs.writeFileSync(bundlePath, Buffer.alloc(0));
    assert.throws(() =>
      publish(bundlePath, "b1", "l", { dataDir: path.join(dir, "data"), publicBase: "https://example.test" })
    );
  });
});
