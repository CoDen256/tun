import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { readBaseVersion } from "../../src/apktoolYml.js";

test("reads versionInfo.versionName from the real base folder's apktool.yml", () => {
  assert.equal(readBaseVersion(path.join(import.meta.dirname, "../../base/smali.mjolnir.merged")), "1.5.12");
});

test("reads a quoted versionName the same way", () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-apktool-"));
  try {
    fs.writeFileSync(
      path.join(dir, "apktool.yml"),
      "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: '2.0.0'\n"
    );
    assert.equal(readBaseVersion(dir), "2.0.0");
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
});

test("throws a clear error when versionInfo/versionName is missing", () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-apktool-"));
  try {
    fs.writeFileSync(path.join(dir, "apktool.yml"), "version: 2.12.1\n");
    assert.throws(() => readBaseVersion(dir), /no "versionInfo:" block/);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
});
