import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { execFileSync } from "node:child_process";
import { ensureBlobsPresent, writePublicAudioManifest } from "../src/audioSnapshot.js";
import { startFakeStabbur, shaOf } from "./helpers/fakeStabbur.js";

function ffmpegAvailable() {
  try {
    execFileSync("ffmpeg", ["-version"], { stdio: "ignore" });
    execFileSync("ffprobe", ["-version"], { stdio: "ignore" });
    return true;
  } catch {
    return false;
  }
}

function probeDurationMs(filePath) {
  const out = execFileSync(
    "ffprobe",
    ["-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", filePath],
    { encoding: "utf8" }
  );
  return Math.round(parseFloat(out.trim()) * 1000);
}

function probeFormatName(filePath) {
  return execFileSync(
    "ffprobe",
    ["-v", "error", "-show_entries", "format=format_name", "-of", "csv=p=0", filePath],
    { encoding: "utf8" }
  ).trim();
}

// A webm/opus clip with no declared duration, as MediaRecorder emits.
// Written via `pipe:1` on purpose: given a real output path ffmpeg would
// seek back on close and patch a Duration element in, which is exactly the
// property these fixtures must not have.
function makeDurationlessWebm(destPath, seconds = 2) {
  fs.writeFileSync(
    destPath,
    execFileSync(
      "ffmpeg",
      ["-loglevel", "error", "-f", "lavfi", "-i", `sine=frequency=440:duration=${seconds}`,
       "-c:a", "libopus", "-f", "webm", "pipe:1"],
      { maxBuffer: 64 * 1024 * 1024 }
    )
  );
}

const describe = ffmpegAvailable() ? test : test.skip;

describe("audioSnapshot: D-F1 trims a card's audio to its note's audio_sel_ms", async (t) => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-audio-trim-"));
  // A 2.000s sine-wave clip, deterministic and ffmpeg-generated — no
  // external fixture file needed.
  const sourcePath = path.join(tmpDir, "source.mp3");
  execFileSync("ffmpeg", [
    "-y",
    "-loglevel",
    "error",
    "-f",
    "lavfi",
    "-i",
    "sine=frequency=440:duration=2",
    sourcePath,
  ]);
  const sourceBytes = fs.readFileSync(sourcePath);
  const originalSha = shaOf(sourceBytes);

  const fake = startFakeStabbur({ blobs: {} });
  fake.addBlob(originalSha, sourceBytes);
  const stabburBaseUrl = await fake.listen();
  const dataDir = path.join(tmpDir, "data");

  await t.test("a card with audio_sel_ms gets a derived, trimmed hash whose duration matches the selection", async () => {
    const cardAudio = { CARDTRIM: originalSha };
    const result = await ensureBlobsPresent(cardAudio, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDTRIM: [500, 1500] },
    });
    assert.notEqual(result.CARDTRIM, originalSha, "trimmed hash must differ from the original");
    const trimmedPath = path.join(dataDir, "blob", result.CARDTRIM);
    assert.ok(fs.existsSync(trimmedPath));
    const durationMs = probeDurationMs(trimmedPath);
    assert.ok(Math.abs(durationMs - 1000) < 150, `expected ~1000ms, got ${durationMs}ms`);

    // The original must still be present on disk, byte-identical — D45:
    // this only ever reads stabbur's canonical blob, never mutates it.
    const originalPath = path.join(dataDir, "blob", originalSha);
    assert.ok(fs.existsSync(originalPath));
    assert.deepEqual(fs.readFileSync(originalPath), sourceBytes);
  });

  await t.test("a card with no audio_sel_ms keeps the original hash unchanged", async () => {
    const cardAudio = { CARDPLAIN: originalSha };
    const result = await ensureBlobsPresent(cardAudio, { stabburBaseUrl, dataDir, selMsByCardId: {} });
    assert.equal(result.CARDPLAIN, originalSha);
  });

  await t.test("an out-of-range selection is clamped to the clip's actual duration, not thrown", async () => {
    const cardAudio = { CARDCLAMP: originalSha };
    const result = await ensureBlobsPresent(cardAudio, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDCLAMP: [1800, 10000] },
    });
    assert.notEqual(result.CARDCLAMP, originalSha);
    const durationMs = probeDurationMs(path.join(dataDir, "blob", result.CARDCLAMP));
    assert.ok(Math.abs(durationMs - 200) < 150, `expected ~200ms (clamped from 1800-10000 on a 2000ms clip), got ${durationMs}ms`);
  });

  await t.test("a selection entirely past the clip's duration collapses to the untrimmed original, not an empty file", async () => {
    const cardAudio = { CARDPAST: originalSha };
    const result = await ensureBlobsPresent(cardAudio, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDPAST: [5000, 9000] },
    });
    assert.equal(result.CARDPAST, originalSha, "clamping start and end both to duration collapses the range — ship the original");
  });

  await t.test("a selection whose bounds aren't real numbers ships the original instead of reaching ffmpeg", async () => {
    const cardAudio = { CARDNAN: originalSha };
    const result = await ensureBlobsPresent(cardAudio, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDNAN: [NaN, NaN] },
    });
    assert.equal(result.CARDNAN, originalSha, "an unusable selection must not become `-ss NaN`");
  });

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
  });
});

// Regression: hover-translate captures audio with the browser's
// `MediaRecorder`, which writes a streaming WebM carrying no duration at
// all — neither `format=duration` nor `stream=duration`, because the
// length isn't known when the header goes out. Trimming one used to clamp
// the selection against that `N/A`, turn the whole range into NaN, slip
// past the collapse check (every NaN comparison being false) and hand
// ffmpeg a literal `-ss NaN`, failing the entire publish over one card.
describe("audioSnapshot: D-F1 trims a capture whose container declares no duration", async (t) => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-audio-webm-"));
  const sourcePath = path.join(tmpDir, "capture.webm");
  makeDurationlessWebm(sourcePath);

  await t.test("the fixture really does lack a declared duration", () => {
    const declared = execFileSync(
      "ffprobe",
      ["-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", sourcePath],
      { encoding: "utf8" }
    ).trim();
    assert.ok(
      !Number.isFinite(parseFloat(declared)),
      `fixture must have no declared duration, got ${declared} — the regression it guards can't occur otherwise`
    );
  });

  const sourceBytes = fs.readFileSync(sourcePath);
  const originalSha = shaOf(sourceBytes);
  const fake = startFakeStabbur({ blobs: {} });
  fake.addBlob(originalSha, sourceBytes);
  const stabburBaseUrl = await fake.listen();
  const dataDir = path.join(tmpDir, "data");

  await t.test("trims to the selection, recovering the duration by decoding", async () => {
    const result = await ensureBlobsPresent({ CARDWEBM: originalSha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDWEBM: [500, 1500] },
    });
    assert.notEqual(result.CARDWEBM, originalSha, "trimmed hash must differ from the original");
    const durationMs = probeDurationMs(path.join(dataDir, "blob", result.CARDWEBM));
    assert.ok(Math.abs(durationMs - 1000) < 150, `expected ~1000ms, got ${durationMs}ms`);
  });

  await t.test("still clamps a stale over-long selection against the decoded duration", async () => {
    const result = await ensureBlobsPresent({ CARDWEBMCLAMP: originalSha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDWEBMCLAMP: [1800, 10000] },
    });
    const durationMs = probeDurationMs(path.join(dataDir, "blob", result.CARDWEBMCLAMP));
    assert.ok(Math.abs(durationMs - 200) < 150, `expected ~200ms, got ${durationMs}ms`);
  });

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
  });
});

// Everything downstream assumes mp3 — hub serves blobs as `audio/mpeg`
// (`hub/src/server.js`) and the device's prefetch companion caches them as
// `<sha256>.mp3` (`patches/js/audio-prefetch-companion.js`). A
// hover-translate capture with no selection used to pass through
// untouched, so webm/opus bytes reached the device wearing an mp3 name.
describe("audioSnapshot: a non-mp3 blob is normalized to mp3 whatever its selection", async (t) => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-audio-norm-"));
  const sourcePath = path.join(tmpDir, "capture.webm");
  makeDurationlessWebm(sourcePath);
  const sourceBytes = fs.readFileSync(sourcePath);
  const originalSha = shaOf(sourceBytes);

  const mp3Path = path.join(tmpDir, "upload.mp3");
  execFileSync("ffmpeg", ["-y", "-loglevel", "error", "-f", "lavfi",
    "-i", "sine=frequency=440:duration=2", mp3Path]);
  const mp3Bytes = fs.readFileSync(mp3Path);
  const mp3Sha = shaOf(mp3Bytes);

  const fake = startFakeStabbur({ blobs: {} });
  fake.addBlob(originalSha, sourceBytes);
  fake.addBlob(mp3Sha, mp3Bytes);
  const stabburBaseUrl = await fake.listen();
  const dataDir = path.join(tmpDir, "data");

  await t.test("with no selection at all, it is still transcoded rather than passed through", async () => {
    const result = await ensureBlobsPresent({ CARDRAW: originalSha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: {},
    });
    assert.notEqual(result.CARDRAW, originalSha, "a webm capture must not ship as-is");
    const shipped = path.join(dataDir, "blob", result.CARDRAW);
    assert.equal(probeFormatName(shipped), "mp3");
    // Full length preserved — normalizing is not trimming.
    assert.ok(Math.abs(probeDurationMs(shipped) - 2000) < 150);
  });

  await t.test("a selection too broken to trim by still yields mp3, not the untouched source", async () => {
    const result = await ensureBlobsPresent({ CARDBAD: originalSha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: { CARDBAD: [NaN, NaN] },
    });
    assert.notEqual(result.CARDBAD, originalSha);
    assert.equal(probeFormatName(path.join(dataDir, "blob", result.CARDBAD)), "mp3");
  });

  await t.test("an mp3 with no selection is left byte-identical — no needless re-encode", async () => {
    const result = await ensureBlobsPresent({ CARDMP3: mp3Sha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: {},
    });
    assert.equal(result.CARDMP3, mp3Sha, "an already-shippable mp3 must keep its hash");
    assert.deepEqual(fs.readFileSync(path.join(dataDir, "blob", mp3Sha)), mp3Bytes);
  });

  await t.test("a blob ffprobe cannot read at all ships untouched rather than failing the publish", async () => {
    // Not hypothetical: normalizing probes every blob in the bundle on
    // every publish, so anything unreadable would otherwise throw out of a
    // publish that previously succeeded — the one-bad-blob-fails-everything
    // outcome D-F1 exists to prevent.
    const junk = Buffer.from("this is not audio at all");
    const junkSha = shaOf(junk);
    fake.addBlob(junkSha, junk);
    const result = await ensureBlobsPresent({ CARDJUNK: junkSha }, {
      stabburBaseUrl,
      dataDir,
      selMsByCardId: {},
    });
    assert.equal(result.CARDJUNK, junkSha, "an unreadable blob keeps its hash and ships as-is");
    assert.deepEqual(fs.readFileSync(path.join(dataDir, "blob", junkSha)), junk);
  });

  await t.test("the canonical original is still on disk untouched (D45)", () => {
    assert.deepEqual(fs.readFileSync(path.join(dataDir, "blob", originalSha)), sourceBytes);
  });

  await t.test("no .derived.tmp scratch file is left behind", () => {
    const leftovers = fs.readdirSync(path.join(dataDir, "blob")).filter((n) => n.endsWith(".tmp"));
    assert.deepEqual(leftovers, []);
  });

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
  });
});

test("writePublicAudioManifest: writes the same {cardId: sha256} content as the manifest, at an unauthenticated per-build path (D-P1)", () => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-audio-manifest-"));
  const dataDir = path.join(tmpDir, "data");

  try {
    const cardAudio = { CARDONE: "a".repeat(64), CARDTWO: "b".repeat(64) };
    const manifestPath = writePublicAudioManifest(cardAudio, { dataDir, buildId: "b000123" });

    assert.equal(manifestPath, path.join(dataDir, "audio-manifest", "b000123.json"));
    assert.deepEqual(JSON.parse(fs.readFileSync(manifestPath, "utf8")), cardAudio);

    // Republishing the same build id is a plain overwrite, not an error —
    // same tmp+rename convention as every other manifest write in this file.
    assert.doesNotThrow(() => writePublicAudioManifest(cardAudio, { dataDir, buildId: "b000123" }));
  } finally {
    fs.rmSync(tmpDir, { recursive: true, force: true });
  }
});
