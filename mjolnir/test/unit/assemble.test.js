import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { assembleBundle } from "../../src/commands/assemble.js";
import { savePatch } from "../../src/patches.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";

const DEMO_BUNDLE = path.resolve("test/fixtures/demo.bundle");
const COMPANION_FILE = path.resolve("patches/js/boot-ok-companion.js");

async function withTmpDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-assemble-"));
  try {
    return await fn(dir);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

// A minimal decoded-base-APK-folder shape: `apktool.yml` (for base_version)
// + `assets/index.android.bundle` (the actual Metro bundle) — mirrors this
// repo's own `base/smali.mjolnir.merged/`.
function makeBaseFolder(dir, versionName) {
  const baseFolder = path.join(dir, "base-folder");
  fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
  fs.copyFileSync(DEMO_BUNDLE, path.join(baseFolder, "assets", "index.android.bundle"));
  fs.writeFileSync(
    path.join(baseFolder, "apktool.yml"),
    `version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: ${versionName}\n`
  );
  return baseFolder;
}

function moduleSource(bundlePath, moduleId) {
  const { modules } = parseBundle(bundlePath);
  return readModuleSource(bundlePath, modules.get(moduleId));
}

test("assembling from 3 patches against a known base produces one bundle reflecting all 3 changes, base_version from apktool.yml", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");

    const patchesDir = path.join(dir, "patches");
    const m2042 = moduleSource(baseBundlePath, 2042);
    const m1186 = moduleSource(baseBundlePath, 1186);
    const m824 = moduleSource(baseBundlePath, 824);

    savePatch(patchesDir, {
      name: "bump-2042",
      locator: { contains: "2.3.0" },
      baseline: m2042,
      modified: m2042.replace("2.3.0", "9.9.9"),
    });
    savePatch(patchesDir, {
      name: "bump-1186",
      locator: { contains: "16.5.0" },
      baseline: m1186,
      modified: m1186.replace("16.5.0", "99.0.0"),
    });
    savePatch(patchesDir, {
      name: "patch-824",
      locator: { contains: "return [];" },
      baseline: m824,
      modified: m824.replace("return [];", "return ['patched'];"),
    });

    const outputPath = path.join(dir, "out", "assembled.bundle");
    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: ["bump-2042", "bump-1186", "patch-824"],
      patchesDir,
      outputPath,
      companionFiles: [COMPANION_FILE],
      placeholders: { BUILD_ID: "b000099", PATCH_REV: 7, LABEL: "test-label", DATA_VERSION: "42" },
    });

    assert.equal(result.baseVersion, "1.5.12");
    assert.equal(result.placeholders.PATCH_REV, 7);
    assert.deepEqual(result.appliedPatches, ["bump-2042", "bump-1186", "patch-824"]);
    assert.deepEqual(result.appliedCompanions, ["boot-ok-companion"]);

    assert.match(moduleSource(outputPath, 2042), /9\.9\.9/);
    assert.match(moduleSource(outputPath, 1186), /99\.0\.0/);
    assert.match(moduleSource(outputPath, 824), /patched/);

    const outBytes = fs.readFileSync(outputPath, "utf8");
    assert.match(outBytes, /BUILD_ID = 'b000099'/);
    assert.match(outBytes, /BASE_VERSION = '1\.5\.12'/);
    assert.match(outBytes, /PATCH_REV = 7/);
    assert.match(outBytes, /LABEL = 'test-label'/);
    assert.match(outBytes, /DATA_VERSION = '42'/);

    // The base folder's own bundle must never be touched.
    const baseStillOriginal = moduleSource(baseBundlePath, 2042);
    assert.match(baseStillOriginal, /2\.3\.0/);
  });
});

test("a patch that fails to locate aborts the assembly with no partial output written", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const m2042 = moduleSource(baseBundlePath, 2042);

    savePatch(patchesDir, {
      name: "good-patch",
      locator: { contains: "2.3.0" },
      baseline: m2042,
      modified: m2042.replace("2.3.0", "9.9.9"),
    });
    savePatch(patchesDir, {
      name: "bad-patch",
      locator: { contains: "this-string-does-not-exist-anywhere" },
      baseline: m2042,
      modified: m2042.replace("2.3.0", "8.8.8"),
    });

    const outputPath = path.join(dir, "out", "assembled.bundle");
    await assert.rejects(
      () =>
        assembleBundle({
          baseFolderPath: baseFolder,
          patchNames: ["good-patch", "bad-patch"],
          patchesDir,
          outputPath,
        }),
      /matched no modules/
    );

    assert.equal(fs.existsSync(outputPath), false, "no partial output survives a failed assembly");
  });
});

test("an unknown patch name aborts before the output path is even touched", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    await assert.rejects(
      () =>
        assembleBundle({
          baseFolderPath: baseFolder,
          patchNames: ["nope"],
          patchesDir,
          outputPath,
        }),
      /no such patch/
    );
    assert.equal(fs.existsSync(outputPath), false);
  });
});

test("assembling with zero patches still produces a byte-faithful copy stamped with the companion", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "2.0.0");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      outputPath,
      companionFiles: [COMPANION_FILE],
      placeholders: { BUILD_ID: "b000001", PATCH_REV: 1, LABEL: "test-label", DATA_VERSION: "1" },
    });

    assert.equal(result.baseVersion, "2.0.0");
    assert.match(moduleSource(outputPath, 2042), /2\.3\.0/, "no patches applied — original content untouched");
  });
});

test("multiple companions are all applied, in order — independent of patch order (D110)", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    const secondCompanionPath = path.join(dir, "second-companion.js");
    fs.writeFileSync(secondCompanionPath, "globalThis.__SECOND_COMPANION__ = true;\n");

    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      outputPath,
      companionFiles: [COMPANION_FILE, secondCompanionPath],
      placeholders: { BUILD_ID: "b000002", PATCH_REV: 3, LABEL: "test-label", DATA_VERSION: "3" },
    });

    assert.deepEqual(result.appliedCompanions, ["boot-ok-companion", "second-companion"]);
    const outBytes = fs.readFileSync(outputPath, "utf8");
    assert.match(outBytes, /BUILD_ID = 'b000002'/, "the first companion's placeholders are substituted");
    assert.match(outBytes, /__SECOND_COMPANION__ = true/, "the second companion's own content is appended too");
  });
});

test("an unknown companion file aborts the assembly before the output path is touched", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    await assert.rejects(() =>
      assembleBundle({
        baseFolderPath: baseFolder,
        patchNames: [],
        patchesDir,
        outputPath,
        companionFiles: [path.join(dir, "no-such-companion.js")],
      })
    );
    assert.equal(fs.existsSync(outputPath), false);
  });
});

test("a patch-back pair (module-id addressed, same reconciliation algorithm as JSON patches) is applied during assembly (D111)", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const patchbackDir = path.join(patchesDir, "js");
    fs.mkdirSync(patchbackDir, { recursive: true });

    const m2042 = moduleSource(baseBundlePath, 2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-bump-version.baseline.js"), m2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-bump-version.edited.js"), m2042.replace("2.3.0", "7.7.7"));

    const outputPath = path.join(dir, "out", "assembled.bundle");
    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      patchbackPairNames: ["2042-bump-version"],
      outputPath,
    });

    assert.deepEqual(result.appliedPatchbackPairs, ["2042-bump-version"]);
    assert.match(moduleSource(outputPath, 2042), /7\.7\.7/);
    // The base folder's own bundle must never be touched.
    assert.match(moduleSource(baseBundlePath, 2042), /2\.3\.0/);
  });
});

test("progress-sync-shim: --sync-base-url/--sync-token bake into both a patch-back-applied module and an appended companion in one assembly", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const patchbackDir = path.join(patchesDir, "js");
    fs.mkdirSync(patchbackDir, { recursive: true });

    // Stands in for `2080-progress-sync-shim`: the real pair carries the
    // same two placeholders inside a patch-back-applied module, which
    // `appendCompanion`'s own per-companion substitution never reaches.
    const m2042 = moduleSource(baseBundlePath, 2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-sync-shim.baseline.js"), m2042);
    fs.writeFileSync(
      path.join(patchbackDir, "2042-sync-shim.edited.js"),
      m2042.replace("2.3.0", "__MJOLNIR_SYNC_BASE_URL__ __MJOLNIR_SYNC_TOKEN__")
    );

    const restoreCompanionPath = path.join(dir, "restore-companion.js");
    fs.writeFileSync(
      restoreCompanionPath,
      "globalThis.__SYNC_URL__ = '__MJOLNIR_SYNC_BASE_URL__'; globalThis.__SYNC_TOKEN__ = '__MJOLNIR_SYNC_TOKEN__';\n"
    );

    const outputPath = path.join(dir, "out", "assembled.bundle");
    await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      patchbackPairNames: ["2042-sync-shim"],
      outputPath,
      companionFiles: [restoreCompanionPath],
      placeholders: { SYNC_BASE_URL: "https://hub.example.net/mjolnir/userdata", SYNC_TOKEN: "s3cret" },
    });

    const moduleOut = moduleSource(outputPath, 2042);
    assert.match(moduleOut, /https:\/\/hub\.example\.net\/mjolnir\/userdata s3cret/);
    const outBytes = fs.readFileSync(outputPath, "utf8");
    assert.match(outBytes, /__SYNC_URL__ = 'https:\/\/hub\.example\.net\/mjolnir\/userdata'/);
    assert.match(outBytes, /__SYNC_TOKEN__ = 's3cret'/);
    assert.ok(!outBytes.includes("__MJOLNIR_SYNC_"));
  });
});

test("progress-sync-shim: omitting --sync-base-url/--sync-token aborts assembly when either placeholder is present anywhere in the output", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const patchbackDir = path.join(patchesDir, "js");
    fs.mkdirSync(patchbackDir, { recursive: true });

    const m2042 = moduleSource(baseBundlePath, 2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-sync-shim.baseline.js"), m2042);
    fs.writeFileSync(
      path.join(patchbackDir, "2042-sync-shim.edited.js"),
      m2042.replace("2.3.0", "__MJOLNIR_SYNC_BASE_URL__")
    );

    const outputPath = path.join(dir, "out", "assembled.bundle");
    await assert.rejects(
      () =>
        assembleBundle({
          baseFolderPath: baseFolder,
          patchNames: [],
          patchesDir,
          patchbackPairNames: ["2042-sync-shim"],
          outputPath,
        }),
      /no value was given for SYNC_BASE_URL/
    );
  });
});

test("audio-link-playback-minimal: --audio-base-url bakes into a patch-back-applied module during assembly (D120)", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const patchbackDir = path.join(patchesDir, "js");
    fs.mkdirSync(patchbackDir, { recursive: true });

    // Stands in for `1440-audio-link-playback`: the real pair carries this
    // placeholder inside a patch-back-applied module, which
    // `appendCompanion`'s own per-companion substitution never reaches.
    const m2042 = moduleSource(baseBundlePath, 2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-audio-link.baseline.js"), m2042);
    fs.writeFileSync(
      path.join(patchbackDir, "2042-audio-link.edited.js"),
      m2042.replace("2.3.0", "__MJOLNIR_AUDIO_BASE_URL__")
    );

    const outputPath = path.join(dir, "out", "assembled.bundle");
    await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      patchbackPairNames: ["2042-audio-link"],
      outputPath,
      placeholders: { AUDIO_BASE_URL: "https://hub.example.net/audio-by-card" },
    });

    const moduleOut = moduleSource(outputPath, 2042);
    assert.match(moduleOut, /https:\/\/hub\.example\.net\/audio-by-card/);
    const outBytes = fs.readFileSync(outputPath, "utf8");
    assert.ok(!outBytes.includes("__MJOLNIR_AUDIO_BASE_URL__"));
  });
});

test("audio-link-playback-minimal: omitting --audio-base-url aborts assembly when the placeholder is present anywhere in the output", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const baseBundlePath = path.join(baseFolder, "assets", "index.android.bundle");
    const patchesDir = path.join(dir, "patches");
    const patchbackDir = path.join(patchesDir, "js");
    fs.mkdirSync(patchbackDir, { recursive: true });

    const m2042 = moduleSource(baseBundlePath, 2042);
    fs.writeFileSync(path.join(patchbackDir, "2042-audio-link.baseline.js"), m2042);
    fs.writeFileSync(
      path.join(patchbackDir, "2042-audio-link.edited.js"),
      m2042.replace("2.3.0", "__MJOLNIR_AUDIO_BASE_URL__")
    );

    const outputPath = path.join(dir, "out", "assembled.bundle");
    await assert.rejects(
      () =>
        assembleBundle({
          baseFolderPath: baseFolder,
          patchNames: [],
          patchesDir,
          patchbackPairNames: ["2042-audio-link"],
          outputPath,
        }),
      /no value was given for AUDIO_BASE_URL/
    );
  });
});

test("an unknown patch-back pair name aborts the assembly before the output path is touched", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    await assert.rejects(
      () =>
        assembleBundle({
          baseFolderPath: baseFolder,
          patchNames: [],
          patchesDir,
          patchbackPairNames: ["nope"],
          outputPath,
        }),
      /no such patch-back pair/
    );
    assert.equal(fs.existsSync(outputPath), false);
  });
});

test("generic-placeholder-substitution: a caller-supplied BASE_VERSION is silently overridden by the real computed value (D-G2)", async () => {
  await withTmpDir(async (dir) => {
    const baseFolder = makeBaseFolder(dir, "1.5.12");
    const patchesDir = path.join(dir, "patches");
    const outputPath = path.join(dir, "out", "assembled.bundle");

    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames: [],
      patchesDir,
      outputPath,
      companionFiles: [COMPANION_FILE],
      placeholders: {
        BUILD_ID: "b000003",
        BASE_VERSION: "9.9.9-not-the-real-one",
        PATCH_REV: 2,
        LABEL: "test-label",
        DATA_VERSION: "2",
      },
    });

    assert.equal(result.baseVersion, "1.5.12");
    assert.equal(result.placeholders.BASE_VERSION, "1.5.12");
    const outBytes = fs.readFileSync(outputPath, "utf8");
    assert.match(outBytes, /BASE_VERSION = '1\.5\.12'/);
    assert.ok(!outBytes.includes("9.9.9-not-the-real-one"));
  });
});
