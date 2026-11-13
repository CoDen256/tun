import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { runPatchback } from "../../src/commands/patchback.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";
import { extractFactoryBody } from "../../src/factory.js";

const generate = generatorPkg.default ?? generatorPkg;

const BASE_BUNDLE = path.resolve("base/smali.mjolnir.merged/assets/index.android.bundle");
const PAIR_BASELINE = path.resolve("patches/js/1440-audio-link-playback.baseline.js");
const PAIR_EDITED = path.resolve("patches/js/1440-audio-link-playback.edited.js");

const MOD_EXPO_MODULES_CORE = 2150;
const DOCUMENT_DIR = "file:///fake/documents/";

// Loads module 1440's exports with a minimal native-module stub recording
// every call made through `RNSoundPlayer`, so each assertion below can
// check exactly which native method (and with what arguments) the patched
// `playSoundFile` actually invoked. `existingFiles` is the set of
// `<sha256>.mp3` paths `FS.getInfoAsync` should report as present —
// audio-cache-prefetch's mod 1440 reaches `ExponentFileSystem` via `__r`
// directly (same pattern every companion in this repo already uses), so
// this installs `global.__r` as a real global rather than a module
// dependency.
function loadPatchedModule1440(patchedSource, { existingFiles = new Set(), contentUriBehavior } = {}) {
  const ast = parse(patchedSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);

  const calls = [];
  const rnSoundPlayer = {
    playSoundFile: (...args) => calls.push({ method: "playSoundFile", args }),
    playUrl: (...args) => calls.push({ method: "playUrl", args }),
  };
  const reactNativeStub = {
    NativeModules: { RNSoundPlayer: rnSoundPlayer },
    NativeEventEmitter: function () {
      return { addListener: () => ({ remove: () => {} }) };
    },
    Platform: { OS: "android" },
  };
  const interopDefault = (obj) => (obj && obj.__esModule ? obj : { default: obj });
  const deps = [
    interopDefault, // d[0]: module 1 — _interopRequireDefault
    // d[1]: module 68 — asyncToGenerator helper. `playAsset`/`getInfo` call
    // this immediately at object-literal construction time (not lazily), so
    // it must be a real function even though playSoundFile never uses it.
    { __esModule: true, default: (genFn) => (...args) => genFn(...args) },
    reactNativeStub, // d[2]: module 5 — react-native
    { __esModule: true, default: () => ({ uri: "stub" }) }, // d[3]: module 102 — asset resolver, unused by playSoundFile
  ];
  const requireStub = (idx) => deps[idx];

  const FS = {
    documentDirectory: DOCUMENT_DIR,
    getInfoAsync: async function (uri, options) {
      // Native ExponentFileSystem.getInfoAsync is a 2-arg call — (path,
      // InfoOptions) — asserting arguments.length here would have caught
      // the real "1 arg, 2 expected" bug (found live on-device) before it
      // ever shipped, same class as downloadAsync's own arg-count bug.
      assert.equal(arguments.length, 2, "getInfoAsync must be called with (path, options)");
      return { exists: existingFiles.has(uri) };
    },
    // D-P6: default behavior mirrors the real FileProvider-backed method —
    // a deterministic content:// URI derived from the file:// path. Tests
    // that need to exercise the getContentUriAsync-failure fallback pass
    // their own `contentUriBehavior` (e.g. a rejecting promise).
    getContentUriAsync: contentUriBehavior || (async (uri) => `content://fake.FileSystemFileProvider/${encodeURIComponent(uri)}`),
  };
  global.__r = (id) => {
    if (id !== MOD_EXPO_MODULES_CORE) throw new Error(`unexpected __r(${id}) in test`);
    return { requireNativeModule: (name) => (name === "ExponentFileSystem" ? FS : undefined) };
  };

  const mod = { exports: {} };
  fn({}, requireStub, (x) => x, (x) => x, mod, mod.exports, [0, 1, 2, 3]);

  return { exports: mod.exports.default, calls };
}

function cleanup() {
  delete global.__r;
  delete globalThis.MJOLNIR_AUDIO_MANIFEST;
}

async function patchedModule1440Source() {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-audio-link-"));
  const outputPath = path.join(dir, "out.bundle");
  try {
    await runPatchback(BASE_BUNDLE, [`1440=${PAIR_BASELINE}:${PAIR_EDITED}`], outputPath);
    const patchedParsed = parseBundle(outputPath);
    return readModuleSource(outputPath, patchedParsed.modules.get(1440));
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("1440-audio-link-playback: a stock-prefixed id still calls playSoundFile unchanged, regardless of manifest/cache contents", async () => {
  const source = await patchedModule1440Source();
  const stockIds = ["a001", "b014", "c01007", "c17099", "z003"];
  for (const id of stockIds) {
    globalThis.MJOLNIR_AUDIO_MANIFEST = { [id]: "deadbeef" }; // present in the manifest — must still be ignored
    const { exports, calls } = loadPatchedModule1440(source);
    exports.playSoundFile(id, "mp3");
    assert.deepEqual(calls, [{ method: "playSoundFile", args: [id, "mp3"] }], `expected ${id} to play locally`);
  }
  cleanup();
});

test("audio-cache-prefetch: a non-stock id with a cached file plays via playUrl(content://...), never a raw file:// path or remote URL (D-P6)", async () => {
  const source = await patchedModule1440Source();
  const sha256 = "a".repeat(64);
  const cachedPath = `${DOCUMENT_DIR}mj-audio/${sha256}.mp3`;
  // D123: manifests are keyed with the builder's own uppercase card ids
  // (confirmed live, "C20001") — the runtime id passed to playSoundFile is
  // lowercase ("c20001"). Keying the fixture uppercase here, same as
  // production, is what makes this test actually exercise that lookup.
  globalThis.MJOLNIR_AUDIO_MANIFEST = { C20001: sha256 };
  const { exports, calls } = loadPatchedModule1440(source, { existingFiles: new Set([cachedPath]) });

  exports.playSoundFile("c20001", "mp3");
  await new Promise((resolve) => setTimeout(resolve, 10)); // getInfoAsync/getContentUriAsync resolve asynchronously

  assert.equal(calls.length, 1);
  assert.equal(calls[0].method, "playUrl");
  // D-P6: a raw file:// path can silently fail native MediaPlayer setup
  // (permission bits ExponentFileSystem.downloadAsync doesn't set) — must
  // always go through getContentUriAsync's content:// URI instead.
  assert.ok(calls[0].args[0].startsWith("content://"), `expected a content:// URI, got ${calls[0].args[0]}`);
  assert.ok(!calls[0].args[0].startsWith("file://"));
  cleanup();
});

test("audio-cache-prefetch: an uppercase-keyed manifest entry (the real builder shape) resolves against the app's lowercase runtime id (D123)", async () => {
  const source = await patchedModule1440Source();
  const sha256 = "c".repeat(64);
  const cachedPath = `${DOCUMENT_DIR}mj-audio/${sha256}.mp3`;
  globalThis.MJOLNIR_AUDIO_MANIFEST = { C22001: sha256 }; // uppercase key, as the builder actually writes it
  const { exports, calls } = loadPatchedModule1440(source, { existingFiles: new Set([cachedPath]) });

  exports.playSoundFile("c22001", "mp3"); // lowercase, as the app actually calls it
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(calls.length, 1, "expected the case-mismatched manifest entry to still resolve, not be treated as a cache miss");
  assert.equal(calls[0].method, "playUrl");
  cleanup();
});

test("audio-cache-prefetch: if getContentUriAsync fails, falls back to the raw file:// path rather than giving up (D-P6)", async () => {
  const source = await patchedModule1440Source();
  const sha256 = "a".repeat(64);
  const cachedPath = `${DOCUMENT_DIR}mj-audio/${sha256}.mp3`;
  globalThis.MJOLNIR_AUDIO_MANIFEST = { c20001: sha256 };
  const { exports, calls } = loadPatchedModule1440(source, {
    existingFiles: new Set([cachedPath]),
    contentUriBehavior: async () => {
      throw new Error("FileProvider not configured");
    },
  });

  exports.playSoundFile("c20001", "mp3");
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.deepEqual(calls, [{ method: "playUrl", args: [cachedPath] }]);
  cleanup();
});

test("audio-cache-prefetch: a non-stock id with no manifest entry silently does nothing — no exception, no URL attempted", async () => {
  const source = await patchedModule1440Source();
  globalThis.MJOLNIR_AUDIO_MANIFEST = {}; // no entry for this card at all
  const { exports, calls } = loadPatchedModule1440(source);

  assert.doesNotThrow(() => exports.playSoundFile("c20001", "mp3"));
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(calls.length, 0);
  cleanup();
});

test("audio-cache-prefetch: a non-stock id with a manifest entry but no cached file on disk silently does nothing (D-P3)", async () => {
  const source = await patchedModule1440Source();
  globalThis.MJOLNIR_AUDIO_MANIFEST = { c20001: "a".repeat(64) }; // resolvable, but never downloaded
  const { exports, calls } = loadPatchedModule1440(source, { existingFiles: new Set() });

  exports.playSoundFile("c20001", "mp3");
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(calls.length, 0); // never falls back to a direct URL play
  cleanup();
});

test("audio-cache-prefetch: a future-rollover id (e.g. c30xxx) is treated as non-stock", async () => {
  const source = await patchedModule1440Source();
  const sha256 = "b".repeat(64);
  const cachedPath = `${DOCUMENT_DIR}mj-audio/${sha256}.mp3`;
  globalThis.MJOLNIR_AUDIO_MANIFEST = { c30001: sha256 };
  const { exports, calls } = loadPatchedModule1440(source, { existingFiles: new Set([cachedPath]) });

  exports.playSoundFile("c30001", "mp3");
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(calls.length, 1);
  assert.equal(calls[0].method, "playUrl");
  assert.ok(calls[0].args[0].startsWith("content://"));
  cleanup();
});
