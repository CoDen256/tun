import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { listCompanions } from "../../src/companions.js";

function withTmpDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-companions-"));
  try {
    return fn(dir);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("listCompanions lists standalone append scripts, excluding replace-patch pair members (D110)", () => {
  withTmpDir((dir) => {
    fs.writeFileSync(path.join(dir, "boot-ok-companion.js"), "// companion\n");
    fs.writeFileSync(path.join(dir, "config-rotate.js"), "// companion\n");
    fs.writeFileSync(path.join(dir, "2176-my-account-build-id.baseline.js"), "// replace-patch source, not a companion\n");
    fs.writeFileSync(path.join(dir, "2176-my-account-build-id.edited.js"), "// replace-patch source, not a companion\n");
    fs.writeFileSync(path.join(dir, "notes.txt"), "not even a .js file\n");

    const companions = listCompanions(dir);
    assert.deepEqual(
      companions.map((c) => c.name),
      ["boot-ok-companion", "config-rotate"]
    );
    assert.ok(companions.every((c) => path.isAbsolute(c.path) || !path.isAbsolute(dir) || c.path.startsWith(dir)));
  });
});

test("listCompanions returns an empty list for a missing directory, not an error", () => {
  assert.deepEqual(listCompanions("/no/such/directory/at/all"), []);
});

test("against the real repo's own patches/js/, boot-ok-companion/config-rotate/ota-debug-report are listed and the my-account-build-id pair is excluded", () => {
  const companions = listCompanions(path.join(import.meta.dirname, "../../patches/js"));
  const names = companions.map((c) => c.name);
  assert.ok(names.includes("boot-ok-companion"));
  assert.ok(names.includes("config-rotate"));
  assert.ok(names.includes("ota-debug-report"));
  assert.ok(!names.some((n) => n.includes("my-account-build-id")));
});
