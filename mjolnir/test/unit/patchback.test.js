import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { runExplode } from "../../src/commands/explode.js";
import { runDeobfuscate, loadManifest, explodedDirFor } from "../../src/commands/deobfuscate.js";
import { runPatchback } from "../../src/commands/patchback.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";
import { parse } from "@babel/parser";
import { extractFactoryBody } from "../../src/factory.js";
import generatorPkg from "@babel/generator";

const generate = generatorPkg.default ?? generatorPkg;

const FIXTURE = path.resolve("test/fixtures/demo.bundle");

async function withTempCopy(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-patchback-"));
  const bundlePath = path.join(dir, "demo.bundle");
  fs.copyFileSync(FIXTURE, bundlePath);
  try {
    return await fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

function evalModuleExports(source) {
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);
  const mod = { exports: {} };
  fn({}, () => {}, () => {}, () => {}, mod, mod.exports, []);
  return mod.exports;
}

test("patch-back applies a renamed-and-edited module while leaving others byte-identical, and the edit executes correctly", async () => {
  await withTempCopy(async (bundlePath) => {
    runExplode(bundlePath);
    runDeobfuscate(bundlePath);

    const dir = explodedDirFor(bundlePath) + "/deobfuscated";
    const baselineSrc = fs.readFileSync(path.join(dir, "2042.js"), "utf8");
    assert.match(baselineSrc, /'2\.3\.0'/);

    const renamedPath = path.join(dir, "2042.renamed.js");
    const renamedSrc = baselineSrc.replace(
      /function \(g, r, i, a, m, e, d\)/,
      "function (global, require, importDefault, importAll, mod, exports, deps)"
    );
    fs.writeFileSync(renamedPath, renamedSrc.replace("m.exports", "mod.exports"));

    const editedPath = path.join(dir, "2042.edited.js");
    fs.writeFileSync(
      editedPath,
      fs.readFileSync(renamedPath, "utf8").replace("2.3.0", "9.9.9")
    );

    const outputPath = path.join(path.dirname(bundlePath), "out.bundle");
    await runPatchback(bundlePath, [`2042=${renamedPath}:${editedPath}`], outputPath);

    const manifest = loadManifest(bundlePath);
    const originalParsed = parseBundle(bundlePath);
    const patchedParsed = parseBundle(outputPath);

    for (const [id, mod] of originalParsed.modules) {
      const patchedMod = patchedParsed.modules.get(id);
      const patchedContent = readModuleSource(outputPath, patchedMod);
      if (id === 2042) {
        assert.match(patchedContent, /9\.9\.9/);
        assert.doesNotMatch(patchedContent, /2\.3\.0/);
        assert.equal(evalModuleExports(patchedContent), "9.9.9");
      } else {
        const originalContent = readModuleSource(bundlePath, mod);
        assert.equal(patchedContent, originalContent, `module ${id} should be byte-identical`);
      }
    }
    void manifest;
  });
});

test("patch-back realigns a renamed top-level local variable referenced by a later edited statement", async () => {
  await withTempCopy(async (bundlePath) => {
    runExplode(bundlePath);
    runDeobfuscate(bundlePath);

    const dir = explodedDirFor(bundlePath) + "/deobfuscated";
    const baselineSrc = fs.readFileSync(path.join(dir, "300.js"), "utf8");
    assert.match(baselineSrc, /var e = _interopRequireWildcard/);

    // refactor: rename the module-level local `e` (not a factory param) to
    // a readable name, then reference the new name from a later statement.
    const renamedPath = path.join(dir, "300.renamed.js");
    const renamedSrc = baselineSrc
      .replace("var e = _interopRequireWildcard", "var bugReportingModule = _interopRequireWildcard")
      .replace("e.get('BugReporting')", "bugReportingModule.get('BugReporting')");
    fs.writeFileSync(renamedPath, renamedSrc);

    // modify: a real semantic edit on the statement that uses the renamed local.
    const editedPath = path.join(dir, "300.edited.js");
    fs.writeFileSync(
      editedPath,
      renamedSrc.replace("bugReportingModule.get('BugReporting')", "bugReportingModule.get('BugReportingV2')")
    );

    const outputPath = path.join(path.dirname(bundlePath), "out-rename.bundle");
    await runPatchback(bundlePath, [`300=${renamedPath}:${editedPath}`], outputPath);

    const patchedParsed = parseBundle(outputPath);
    const patchedContent = readModuleSource(outputPath, patchedParsed.modules.get(300));
    assert.match(patchedContent, /BugReportingV2/);

    // the patched module must actually run without a ReferenceError for the
    // renamed-and-still-referenced local — require(d[0]) stubbed to return
    // an object with a `.get` method, like the real BugReporting module.
    const ast = parse(patchedContent, { sourceType: "script", allowReturnOutsideFunction: true });
    const { factory } = extractFactoryBody(ast);
    const fnSrc = generate(factory, { comments: false }).code;
    const fn = eval(`(${fnSrc})`);
    const mod = { exports: {} };
    let thrown = null;
    try {
      fn({}, () => ({ __esModule: true, get: (key) => `fetched:${key}` }), (x) => x, (x) => x, mod, mod.exports, [54]);
    } catch (err) {
      thrown = err;
    }
    assert.equal(thrown, null, thrown?.message);
    assert.equal(mod.exports.default, "fetched:BugReportingV2");
  });
});
