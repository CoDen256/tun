import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import { execFileSync } from "node:child_process";

function sha256OfFile(filePath) {
  return crypto.createHash("sha256").update(fs.readFileSync(filePath)).digest("hex");
}

// Returns the clip's duration in ms, or `null` when it genuinely can't be
// determined. Not every blob carries a duration in its container: audio
// captured by hover-translate comes from the browser's `MediaRecorder`
// (`audio/webm`, opus), which streams out a WebM with no Duration element
// and no cues, because at header-write time the recording's length isn't
// known yet. Both `format=duration` and `stream=duration` read `N/A` for
// those, so the only way to the real length is to decode the thing.
function probeDurationMs(filePath) {
  const out = execFileSync(
    "ffprobe",
    ["-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", filePath],
    { encoding: "utf8" }
  );
  const seconds = parseFloat(out.trim());
  if (Number.isFinite(seconds)) return Math.round(seconds * 1000);
  return decodeDurationMs(filePath);
}

// Duration-by-decoding fallback for containers that don't declare one.
// `-f null` decodes without writing anything; `-progress pipe:1` reports
// position on stdout as parseable `key=value` lines, the last of which is
// the end of the stream. (`out_time_us` and not `out_time_ms` on purpose —
// ffmpeg reports *microseconds* in both fields, a long-standing quirk of
// the progress protocol.) Returns `null` rather than throwing if even this
// comes up empty, so an undecodable blob degrades to "ship it untrimmed"
// instead of failing the whole publish — same D-F1 spirit as the clamp.
function decodeDurationMs(filePath) {
  let out;
  try {
    out = execFileSync(
      "ffmpeg",
      ["-v", "error", "-i", filePath, "-f", "null", "-progress", "pipe:1", "-"],
      { encoding: "utf8", stdio: ["ignore", "pipe", "pipe"] }
    );
  } catch {
    return null;
  }
  let micros = NaN;
  for (const line of out.split("\n")) {
    const match = /^out_time_us=(\d+)$/.exec(line.trim());
    if (match) micros = Number(match[1]);
  }
  return Number.isFinite(micros) ? Math.round(micros / 1000) : null;
}

// Everything downstream of this file assumes mp3: hub serves blobs as
// `Content-Type: audio/mpeg` and the device's prefetch companion caches
// them at `<sha256>.mp3`. stabbur's authoring UI uploads mp3, but
// hover-translate captures arrive as webm/opus, so "what stabbur stored"
// and "what hub can serve" are not the same format and the gap has to be
// closed here. `format_name` is a comma-joined list of every format the
// demuxer matched ("matroska,webm"), hence the membership test.
//
// Returns `null` when ffprobe can't read the file at all. That is not
// hypothetical: this runs over every blob in the bundle on every publish,
// and a blob ffprobe rejects would otherwise throw straight out of a
// publish that used to succeed — precisely the "one bad blob fails the
// whole publish" outcome D-F1 exists to prevent. Unreadable means nothing
// useful can be done with it (transcoding would fail for the same reason),
// so callers pass it through untouched.
function isMp3(filePath) {
  let out;
  try {
    out = execFileSync(
      "ffprobe",
      ["-v", "error", "-show_entries", "format=format_name", "-of", "csv=p=0", filePath],
      // stderr captured, not inherited: failure here is tolerated, so
      // ffprobe's complaint about an unreadable blob is not an error the
      // operator needs to see once per blob in the publish log.
      { encoding: "utf8", stdio: ["ignore", "pipe", "pipe"] }
    );
  } catch {
    return null;
  }
  return out.trim().split(",").includes("mp3");
}

function transcodeToMp3(srcPath, destPath) {
  // Blobs are stored by hash with no file extension, so ffmpeg can't infer
  // the output container from the filename and has to be told.
  execFileSync("ffmpeg", ["-y", "-loglevel", "error", "-i", srcPath, "-f", "mp3", destPath]);
}

// Puts an mp3 copy of `srcPath` at `destPath`. Copies the bytes verbatim
// when the source is already mp3 — re-encoding an mp3 to mp3 would lose a
// generation for nothing, and keeping it byte-identical keeps the derived
// hash equal to the original's, so an untrimmed mp3 card costs no extra
// blob.
function materializeAsMp3(srcPath, destPath) {
  // `null` (unreadable) copies too — there is nothing better to do with a
  // blob ffprobe can't parse than ship it exactly as it arrived.
  if (isMp3(srcPath) !== false) fs.copyFileSync(srcPath, destPath);
  else transcodeToMp3(srcPath, destPath);
}

// D-F1: trims `srcPath` to `[startMs, endMs]`, clamped to the file's actual
// duration so a stale/out-of-range selection (a clip replaced without
// clearing the selection, or stale metadata) can't fail the whole publish
// over one bad note. If clamping collapses the range to nothing, ships the
// untrimmed original instead of an invalid/empty clip. Either way the
// result is mp3 — including on the bail-out paths, so a non-mp3 source
// can't slip through untranscoded just because its selection was bad.
function trimToRange(srcPath, destPath, [startMs, endMs]) {
  // A selection that isn't two real numbers can't be clamped into one —
  // `Math.min`/`Math.max` propagate NaN silently and every comparison
  // against it is false, so an unusable selection would sail past the
  // collapse check below and reach ffmpeg as a literal `-ss NaN`. Reject
  // it up front and ship the original, as with any other bad selection.
  if (!Number.isFinite(startMs) || !Number.isFinite(endMs)) {
    materializeAsMp3(srcPath, destPath);
    return;
  }
  const durationMs = probeDurationMs(srcPath);
  // Unknown duration (`null`) means there's nothing to clamp *against* —
  // clamping to it would poison the arithmetic the same way. Pass the
  // selection through untouched instead: ffmpeg stops at end-of-stream on
  // its own, so an over-long range yields a short clip rather than an
  // error. Only the stale-selection guard is lost, and just for blobs
  // whose length nothing can cheaply establish.
  const limitMs = durationMs ?? Infinity;
  const clampedStart = Math.max(0, Math.min(startMs, limitMs));
  const clampedEnd = Math.max(clampedStart, Math.min(endMs, limitMs));
  if (clampedEnd <= clampedStart) {
    materializeAsMp3(srcPath, destPath);
    return;
  }
  execFileSync("ffmpeg", [
    "-y",
    "-loglevel",
    "error",
    "-i",
    srcPath,
    "-ss",
    String(clampedStart / 1000),
    "-to",
    String(clampedEnd / 1000),
    // Extensionless output path — ffmpeg has to be told the container.
    "-f",
    "mp3",
    destPath,
  ]);
}

// hub keeps its own per-build audio snapshot (D45) so studying never depends
// on stabbur being reachable. `cardAudio` is `{cardId: sha256}` — every card
// in the bundle, not just this run's new ones, since the whole bundle ships
// together. `stabburBaseUrl`/`dataDir` mirror `tool/src/otaPublish.js`'s own
// `/blob/<sha256>` convention (02-services.md).
//
// `selMsByCardId` (`{cardId: [startMs, endMs]}`, D-F1) trims a card's audio
// to its note's `audio_sel_ms` selection — only ever populated for cards
// whose note is present in *this* pull (a tombstoned note's selection isn't
// known any more, so its card keeps whatever hash it last had, same
// permanence rule as its content). The trimmed result is a *derived* hash
// living only in hub's own blob cache here — the original stays exactly
// where D45 says it should, in stabbur's canonical store, untouched by this
// (this function only ever reads it).
//
// Independently of any selection, a blob that isn't already mp3 is
// transcoded to mp3 — hub serves every blob as `audio/mpeg` and the device
// caches it as `<sha256>.mp3`, so a hover-translate webm/opus capture would
// otherwise reach the device as webm bytes wearing an mp3 name. This is the
// one place that knows both where blobs come from and what hub promises
// about them, so it's where the two are reconciled; same derived-hash
// treatment as a trim.
//
// Returns `{cardId: finalSha256}` — the derived hash wherever a trim or a
// transcode happened, the original hash otherwise — for the caller to hand
// to `writeAudioManifest`.
export async function ensureBlobsPresent(cardAudio, { stabburBaseUrl, dataDir, selMsByCardId = {} } = {}) {
  const blobDir = path.join(dataDir, "blob");
  fs.mkdirSync(blobDir, { recursive: true });

  for (const sha256 of new Set(Object.values(cardAudio))) {
    const dest = path.join(blobDir, sha256);
    if (fs.existsSync(dest)) continue;

    const res = await fetch(new URL(`/blob/${sha256}`, stabburBaseUrl));
    if (!res.ok) {
      throw new Error(`could not fetch blob ${sha256} from stabbur: ${res.status} ${res.statusText}`);
    }
    const bytes = Buffer.from(await res.arrayBuffer());
    const actualSha = crypto.createHash("sha256").update(bytes).digest("hex");
    if (actualSha !== sha256) {
      throw new Error(`blob ${sha256} hash mismatch after download (got ${actualSha}) — refusing to snapshot it`);
    }
    const tmp = `${dest}.tmp`;
    fs.writeFileSync(tmp, bytes);
    fs.renameSync(tmp, dest);
  }

  // One ffprobe per *blob*, not per card — cards routinely share a blob
  // (the same word recorded once, reused across a deck's cards), and this
  // runs over the whole bundle on every publish, not just the new cards.
  const mp3BySha = new Map();
  const blobIsMp3 = (sha256, filePath) => {
    if (!mp3BySha.has(sha256)) mp3BySha.set(sha256, isMp3(filePath));
    return mp3BySha.get(sha256);
  };

  const finalCardAudio = {};
  for (const [cardId, originalSha] of Object.entries(cardAudio)) {
    const selMs = selMsByCardId[cardId];
    const originalPath = path.join(blobDir, originalSha);
    // An mp3 with nothing to trim is already exactly what ships — don't
    // rewrite it, don't re-hash it. `null` (ffprobe can't read it) takes
    // this path too: unreadable blobs ship untouched rather than failing
    // the publish, exactly as they did before normalizing existed.
    if (!selMs && blobIsMp3(originalSha, originalPath) !== false) {
      finalCardAudio[cardId] = originalSha;
      continue;
    }
    const tmp = path.join(blobDir, `${originalSha}.derived.tmp`);
    if (selMs) trimToRange(originalPath, tmp, selMs);
    else transcodeToMp3(originalPath, tmp);
    const derivedSha = sha256OfFile(tmp);
    const dest = path.join(blobDir, derivedSha);
    if (fs.existsSync(dest)) {
      fs.rmSync(tmp);
    } else {
      fs.renameSync(tmp, dest);
    }
    finalCardAudio[cardId] = derivedSha;
  }
  return finalCardAudio;
}

export function writeAudioManifest(cardAudio, { dataDir, buildId }) {
  const dir = path.join(dataDir, "ota", buildId);
  fs.mkdirSync(dir, { recursive: true });
  const manifestPath = path.join(dir, "audio.json");
  const tmp = `${manifestPath}.tmp`;
  fs.writeFileSync(tmp, JSON.stringify(cardAudio, null, 2) + "\n");
  fs.renameSync(tmp, manifestPath);
  return manifestPath;
}

// D-P1 (audio-cache-prefetch): a second, unauthenticated copy of the same
// manifest `writeAudioManifest` writes to the token-gated `/ota/<buildId>/
// audio.json` — the prefetcher companion has no way to read the OTA bearer
// token back (nothing on the JS side ever has), so it fetches this plain
// copy instead. Same "the content isn't sensitive, the buildId that
// selects it already is baked into the bundle in plaintext" reasoning
// `/blob/*` already relies on. Content is identical; only the path/auth
// requirement differs.
export function writePublicAudioManifest(cardAudio, { dataDir, buildId }) {
  const dir = path.join(dataDir, "audio-manifest");
  fs.mkdirSync(dir, { recursive: true });
  const manifestPath = path.join(dir, `${buildId}.json`);
  const tmp = `${manifestPath}.tmp`;
  fs.writeFileSync(tmp, JSON.stringify(cardAudio, null, 2) + "\n");
  fs.renameSync(tmp, manifestPath);
  return manifestPath;
}
