import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { checkEquivalence } from "../../src/commands/check.js";

function withTempDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-check-"));
  try {
    return fn(dir);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("rename-and-reformat-only edit passes check", () => {
  withTempDir((dir) => {
    const baselinePath = path.join(dir, "baseline.js");
    const currentPath = path.join(dir, "current.js");
    fs.writeFileSync(
      baselinePath,
      `function greet(name) { var msg = "hi " + name; return msg; }`
    );
    fs.writeFileSync(
      currentPath,
      `function greet(who) {\n  var message = "hi " + who;\n  return message;\n}`
    );

    const result = checkEquivalence(baselinePath, currentPath);
    assert.equal(result.pass, true);
    assert.equal(result.diff, null);
  });
});

test("an added statement fails check with a reported difference", () => {
  withTempDir((dir) => {
    const baselinePath = path.join(dir, "baseline.js");
    const currentPath = path.join(dir, "current.js");
    fs.writeFileSync(baselinePath, `function greet(name) { return "hi " + name; }`);
    fs.writeFileSync(
      currentPath,
      `function greet(name) { console.log(name); return "hi " + name; }`
    );

    const result = checkEquivalence(baselinePath, currentPath);
    assert.equal(result.pass, false);
    assert.ok(result.diff.length > 0);
  });
});

test("a changed literal fails check with a reported difference", () => {
  withTempDir((dir) => {
    const baselinePath = path.join(dir, "baseline.js");
    const currentPath = path.join(dir, "current.js");
    fs.writeFileSync(baselinePath, `function version() { return "1.0.0"; }`);
    fs.writeFileSync(currentPath, `function version() { return "2.0.0"; }`);

    const result = checkEquivalence(baselinePath, currentPath);
    assert.equal(result.pass, false);
    assert.match(result.diff, /1\.0\.0/);
    assert.match(result.diff, /2\.0\.0/);
  });
});
