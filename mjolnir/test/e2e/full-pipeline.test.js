import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { runExplode } from "../../src/commands/explode.js";
import { runDeobfuscate, explodedDirFor } from "../../src/commands/deobfuscate.js";
import { checkEquivalence } from "../../src/commands/check.js";
import { diffModuleFiles } from "../../src/commands/diff.js";
import { runPatchback } from "../../src/commands/patchback.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";
import { extractFactoryBody } from "../../src/factory.js";

const FIXTURE = path.resolve("test/fixtures/demo.bundle");

function withTempCopy(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-e2e-"));
  const bundlePath = path.join(dir, "demo.bundle");
  fs.copyFileSync(FIXTURE, bundlePath);
  return Promise.resolve()
    .then(() => fn(bundlePath, dir))
    .finally(() => fs.rmSync(dir, { recursive: true, force: true }));
}

function evalModuleExports(source) {
  const generate = generatorPkg.default ?? generatorPkg;
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);
  const mod = { exports: {} };
  fn({}, () => {}, () => {}, () => {}, mod, mod.exports, []);
  return mod.exports;
}

test("full pipeline: explode -> deobfuscate -> check -> diff -> patch-back", async () => {
  await withTempCopy(async (bundlePath, dir) => {
    const TARGET_MODULE_ID = "2042";

    // explode
    runExplode(bundlePath);
    const deobfuscatedDir = path.join(explodedDirFor(bundlePath), "deobfuscated");
    const dPath = path.join(deobfuscatedDir, `${TARGET_MODULE_ID}.js`);

    // deobfuscate
    runDeobfuscate(bundlePath);
    assert.ok(fs.existsSync(dPath));
    const dSource = fs.readFileSync(dPath, "utf8");
    assert.match(dSource, /'2\.3\.0'/);

    // refactor (rename-only) -> R
    const rPath = path.join(dir, "2042.r.js");
    const rSource = dSource
      .replace(/function \(g, r, i, a, m, e, d\)/, "function (global, require, importDefault, importAll, mod, exports, deps)")
      .replace("m.exports", "mod.exports");
    fs.writeFileSync(rPath, rSource);

    const checkResult = checkEquivalence(dPath, rPath);
    assert.equal(checkResult.pass, true, "rename-only refactor should pass check");

    // modify (real semantic edit on top of R) -> M
    const mPath = path.join(dir, "2042.m.js");
    const mSource = rSource.replace("2.3.0", "9.9.9");
    fs.writeFileSync(mPath, mSource);

    const checkAfterEdit = checkEquivalence(rPath, mPath);
    assert.equal(checkAfterEdit.pass, false, "a real semantic edit should fail check against R");

    const diffEntries = diffModuleFiles(rPath, mPath);
    const changed = diffEntries.filter((e) => e.kind !== "unchanged");
    assert.equal(changed.length, 1, "diff should report exactly one semantic change");
    assert.equal(changed[0].kind, "modified");

    // patch-back
    const outputBundlePath = path.join(dir, "out.bundle");
    await runPatchback(bundlePath, [`${TARGET_MODULE_ID}=${rPath}:${mPath}`], outputBundlePath);

    // confirm the output bundle parses successfully
    const patchedParsed = parseBundle(outputBundlePath);
    const originalParsed = parseBundle(bundlePath);
    assert.equal(patchedParsed.moduleCount, originalParsed.moduleCount);

    // confirm untouched modules are byte-identical, and the patched module reflects the edit
    for (const [id, mod] of originalParsed.modules) {
      const patchedMod = patchedParsed.modules.get(id);
      const patchedContent = readModuleSource(outputBundlePath, patchedMod);
      if (String(id) === TARGET_MODULE_ID) {
        assert.match(patchedContent, /9\.9\.9/);
        assert.doesNotMatch(patchedContent, /2\.3\.0/);
        assert.equal(evalModuleExports(patchedContent), "9.9.9");
      } else {
        const originalContent = readModuleSource(bundlePath, mod);
        assert.equal(patchedContent, originalContent, `module ${id} should be byte-identical`);
      }
    }
  });
});
