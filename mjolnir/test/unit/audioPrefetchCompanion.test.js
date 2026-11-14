import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";

const COMPANION_SOURCE = fs.readFileSync(path.resolve("patches/js/audio-prefetch-companion.js"), "utf8");

const MOD_EXPO_MODULES_CORE = 2150;
const DOCUMENT_DIR = "file:///fake/documents/";
const AUDIO_BASE_URL = "https://mjolnir.example.net";

// Runs the companion's own IIFE (it self-invokes — there is no factory
// function to extract) against a fully mocked `__r`/`fetch`/ExponentFileSystem,
// both installed as real globals the same way the real app provides them
// (`boot-ok-companion.js`'s own pattern). `existingFiles` seeds
// `readDirectoryAsync`'s result (already-cached `<sha256>.mp3` names, or an
// orphan `.tmp`); `downloadBehavior(sha256)` lets a test make one specific
// download hang/reject to simulate a killed-mid-download case.
async function runPrefetcher({
  buildId = "b000001",
  manifest = {},
  existingFiles = [],
  downloadBehavior = () => Promise.resolve(),
} = {}) {
  const fetchCalls = [];
  const downloadCalls = [];
  const moveCalls = [];
  let maxConcurrent = 0;
  let inFlight = 0;

  const FS = {
    documentDirectory: DOCUMENT_DIR,
    makeDirectoryAsync: async () => {},
    readDirectoryAsync: async () => existingFiles,
    downloadAsync: async function (url, dest, options) {
      // Native `ExponentFileSystem.downloadAsync` is a 3-arg call — asserting
      // on `arguments.length` here would have caught the real "2 args, 3
      // expected" bug (found live on-device) before it ever shipped.
      assert.equal(arguments.length, 3, "downloadAsync must be called with (url, dest, options)");
      inFlight++;
      maxConcurrent = Math.max(maxConcurrent, inFlight);
      downloadCalls.push({ url, dest, options });
      const sha256 = path.basename(dest).replace(/\.mp3\.tmp$/, "");
      try {
        return await downloadBehavior(sha256);
      } finally {
        inFlight--;
      }
    },
    moveAsync: async ({ from, to }) => {
      moveCalls.push({ from, to });
    },
  };

  global.__r = (id) => {
    if (id !== MOD_EXPO_MODULES_CORE) throw new Error(`unexpected __r(${id}) in test`);
    return { requireNativeModule: (name) => (name === "ExponentFileSystem" ? FS : undefined) };
  };
  global.fetch = async (url) => {
    fetchCalls.push(url);
    return { ok: true, status: 200, json: async () => manifest };
  };
  if (buildId) globalThis.MJOLNIR_BUILD_ID = buildId;

  const indirectEval = eval;
  indirectEval(COMPANION_SOURCE.replace(/__MJOLNIR_AUDIO_BASE_URL__/g, AUDIO_BASE_URL));

  // The companion's own promise chain runs detached (fire-and-forget, same
  // as the real app calling it) — give it a tick to settle before asserting.
  await new Promise((resolve) => setTimeout(resolve, 30));

  const audioManifest = globalThis.MJOLNIR_AUDIO_MANIFEST;
  delete global.__r;
  delete global.fetch;
  delete globalThis.MJOLNIR_BUILD_ID;
  delete globalThis.MJOLNIR_AUDIO_MANIFEST;

  return { fetchCalls, downloadCalls, moveCalls, maxConcurrent, audioManifest };
}

test("audio-prefetch-companion: fetches the manifest for the current build id and exposes it as a global (D-P1/D-P2)", async () => {
  const manifest = { C20001: "a".repeat(64) };
  const { fetchCalls, audioManifest } = await runPrefetcher({ buildId: "b000042", manifest });
  assert.equal(fetchCalls.length, 1);
  assert.equal(fetchCalls[0], `${AUDIO_BASE_URL}/audio-manifest/b000042.json`);
  assert.deepEqual(audioManifest, manifest);
});

test("audio-prefetch-companion: downloads only the sha256s missing from the cache directory, skipping already-cached ones", async () => {
  const manifest = { C20001: "a".repeat(64), C20002: "b".repeat(64), C20003: "c".repeat(64) };
  const { downloadCalls, moveCalls } = await runPrefetcher({
    manifest,
    existingFiles: [`${"a".repeat(64)}.mp3`, `${"c".repeat(64)}.mp3.tmp`], // one cached, one orphaned tmp (not cached)
  });

  const downloadedShas = downloadCalls.map((c) => path.basename(c.dest).replace(/\.mp3\.tmp$/, ""));
  assert.deepEqual(downloadedShas.sort(), ["b".repeat(64), "c".repeat(64)].sort());
  // Every successful download is moved into place under its final name.
  assert.equal(moveCalls.length, 2);
  for (const { from, to } of moveCalls) {
    assert.ok(from.endsWith(".mp3.tmp"));
    assert.ok(to.endsWith(".mp3") && !to.endsWith(".mp3.tmp"));
  }
});

test("audio-prefetch-companion: respects the concurrency cap even with many missing files (D-P5)", async () => {
  const manifest = {};
  for (let i = 0; i < 10; i++) manifest[`C2000${i}`] = i.toString(16).padStart(64, "0");

  let release;
  const gate = new Promise((resolve) => {
    release = resolve;
  });
  const { maxConcurrent, downloadCalls } = await Promise.all([
    runPrefetcher({
      manifest,
      downloadBehavior: () => gate.then(() => {}),
    }),
    new Promise((resolve) => setTimeout(resolve, 15)).then(() => release()),
  ]).then(([result]) => result);

  assert.equal(downloadCalls.length, 10);
  assert.ok(maxConcurrent <= 3, `expected at most 3 concurrent downloads, saw ${maxConcurrent}`);
});

test("audio-prefetch-companion: a killed-mid-download (rejected downloadAsync) never calls moveAsync for that file, and doesn't stop the rest of the sweep (D-P5)", async () => {
  const badSha = "bad".padEnd(64, "0");
  const goodSha = "good".padEnd(64, "0");
  const manifest = { bad: badSha, good: goodSha };
  const { moveCalls, downloadCalls } = await runPrefetcher({
    manifest,
    downloadBehavior: (sha256) => (sha256 === badSha ? Promise.reject(new Error("killed")) : Promise.resolve()),
  });

  assert.equal(downloadCalls.length, 2);
  assert.equal(moveCalls.length, 1);
  assert.ok(moveCalls[0].to.includes(goodSha));
  assert.ok(!moveCalls.some((c) => c.to.includes(badSha)));
});

test("audio-prefetch-companion: no buildId set (e.g. the embedded tier-4 asset) — no fetch at all", async () => {
  const { fetchCalls } = await runPrefetcher({ buildId: null });
  assert.equal(fetchCalls.length, 0);
});

test("audio-prefetch-companion: a failed manifest fetch is a single silent attempt, no retry, no crash (D-P4)", async () => {
  global.__r = (id) =>
    id === MOD_EXPO_MODULES_CORE
      ? {
          requireNativeModule: (name) =>
            name === "ExponentFileSystem"
              ? { documentDirectory: DOCUMENT_DIR, makeDirectoryAsync: async () => {}, readDirectoryAsync: async () => [] }
              : undefined,
        }
      : (() => {
          throw new Error("unexpected __r");
        })();
  let fetchCallCount = 0;
  global.fetch = async () => {
    fetchCallCount++;
    throw new Error("offline");
  };
  globalThis.MJOLNIR_BUILD_ID = "b000001";

  const indirectEval = eval;
  assert.doesNotThrow(() => indirectEval(COMPANION_SOURCE.replace(/__MJOLNIR_AUDIO_BASE_URL__/g, AUDIO_BASE_URL)));
  await new Promise((resolve) => setTimeout(resolve, 30));

  assert.equal(fetchCallCount, 1);
  assert.equal(globalThis.MJOLNIR_AUDIO_MANIFEST, undefined);

  delete global.__r;
  delete global.fetch;
  delete globalThis.MJOLNIR_BUILD_ID;
});
