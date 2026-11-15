import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import {
  validateBuildId,
  checkMagicPrefix,
  checkCompanionMatch,
  checkReuse,
  publish,
  findBakedBaseVersion,
  findBakedPatchRev,
  MAX_BUNDLE_SIZE,
} from "../../tool/src/otaPublish.js";
import { previousVersions, writePublication } from "./publications.js";
import { create as createLogicBundle, activate, nextPatchRev } from "./logicBundles.js";
import { query } from "./db.js";
import { slugify, versionSlug } from "./slug.js";
import { assembleBundle } from "../../src/commands/assemble.js";
import { readBaseVersion } from "../../src/apktoolYml.js";

// D-H5/task 6.1: verification reuses exactly the guards `ota-publish.sh`/
// `builder` already enforce — no second implementation. Returns a list of
// `{check, ok, detail}` so the UI can show which of the "6 checks" passed,
// matching the mockup's "✓ 6 checks passed" pill. This is the FORCE-PUBLISH
// path's verification — it has a real `buildId` identity, so every
// `tool/src/otaPublish.js` guard applies.
export function verifyBundle(bytes, buildId, { dataDir, allowNoCompanion = process.env.ALLOW_NO_COMPANION === "1" } = {}) {
  const checks = [];
  const run = (name, fn) => {
    try {
      fn();
      checks.push({ check: name, ok: true });
    } catch (err) {
      checks.push({ check: name, ok: false, detail: err.message });
    }
  };

  run("size", () => {
    if (bytes.length === 0) throw new Error("empty bundle");
    if (bytes.length > MAX_BUNDLE_SIZE) throw new Error("bundle > 64 MiB, native rejects it (D48)");
  });
  run("buildId format", () => validateBuildId(buildId));
  run("magic prefix", () => checkMagicPrefix(bytes));
  run("companion buildId match", () => checkCompanionMatch(bytes, buildId, { allowNoCompanion }));
  run("not a byte-different reuse", () => checkReuse(path.join(dataDir, "ota", "bundle", `${buildId}.js`), bytes));
  run("sha256", () => crypto.createHash("sha256").update(bytes).digest("hex"));

  return { ok: checks.every((c) => c.ok), checks };
}

// D-L1/D-L5: the default submit flow's own, narrower verification — a
// freshly-dropped logic bundle has no `buildId` identity yet (that's only
// assigned once `builder` eventually publishes from it), so the
// buildId/companion-match/reuse-by-buildId guards above don't apply here;
// just the two checks that are meaningful for any bundle's raw bytes.
export function verifyLogicBundleBytes(bytes) {
  const checks = [];
  const run = (name, fn) => {
    try {
      fn();
      checks.push({ check: name, ok: true });
    } catch (err) {
      checks.push({ check: name, ok: false, detail: err.message });
    }
  };

  run("size", () => {
    if (bytes.length === 0) throw new Error("empty bundle");
    if (bytes.length > MAX_BUNDLE_SIZE) throw new Error("bundle > 64 MiB, native rejects it (D48)");
  });
  run("magic prefix", () => checkMagicPrefix(bytes));

  return { ok: checks.every((c) => c.ok), checks };
}

// D110: the filename itself is now human-readable (`<baseVersion>-patch
// <patchRev>[-<label-slug>]-<sha-prefix>.js`) instead of the bare sha256 —
// an operator browsing `data/logic/` or the workbench's file-path input
// could not tell one file from another before this. Still effectively
// content-addressed where it matters: the sha256 prefix in the filename
// keeps it unique and keeps a byte-identical resubmission a no-op write
// (same bytes -> same sha prefix -> same filename), not a collision risk —
// `baseVersion`/`patchRev`/`label` are cosmetic parts of the name only, the
// database row (keyed by its own id) remains the actual source of truth for
// which file is active.
function writeLogicBundleFile(dataDir, logicBundleDir, bytes, bundleSha, { baseVersion, patchRev, label } = {}) {
  const dir = logicBundleDir || path.join(dataDir, "logic");
  fs.mkdirSync(dir, { recursive: true });
  const parts = [versionSlug(baseVersion) || "base", `patch${patchRev ?? 0}`];
  if (label) parts.push(slugify(label));
  parts.push(bundleSha.slice(0, 10));
  const filePath = path.join(dir, `${parts.join("-")}.js`);
  // Content-addressed in practice, not identity-addressed the way a
  // buildId's bundle file is (D-L1: "immutable once written") — identical
  // bytes under the same sha prefix is simply a no-op write, never an error.
  if (!fs.existsSync(filePath)) fs.writeFileSync(filePath, bytes);
  return filePath;
}

// D-L1/D-L5/task 4.1: the OTA console's default submit action. Creates a
// `logic_bundles` row — it does NOT touch `current.json` and does NOT run
// `builder`. `baseVersion`/`patchRev` are read from the bundle's own baked
// constants (the same mechanism `BUILD_ID` uses); the caller-supplied
// `baseVersion`/`patchRev` are only used when a baked value is absent (the
// UI's "prompt the operator" case, ota-console spec).
export async function submitBundle(bytes, { label, baseVersion, patchRev, dataDir, logicBundleDir } = {}) {
  const verify = verifyLogicBundleBytes(bytes);
  if (!verify.ok) {
    throw new Error(
      `refusing: ${verify.checks
        .filter((c) => !c.ok)
        .map((c) => `${c.check}: ${c.detail}`)
        .join("; ")}`
    );
  }

  const resolvedBaseVersion = findBakedBaseVersion(bytes) || baseVersion;
  if (!resolvedBaseVersion) {
    throw new Error("refusing: this bundle has no baked base_version — enter one manually");
  }
  const bakedPatchRev = findBakedPatchRev(bytes);
  const resolvedPatchRev = bakedPatchRev ?? (patchRev === undefined || patchRev === null ? null : Number(patchRev));
  if (resolvedPatchRev === null || resolvedPatchRev === undefined) {
    throw new Error("refusing: this bundle has no baked patch_rev — enter one manually");
  }

  const bundleSha = crypto.createHash("sha256").update(bytes).digest("hex");
  const filePath = writeLogicBundleFile(dataDir, logicBundleDir, bytes, bundleSha, {
    baseVersion: resolvedBaseVersion,
    patchRev: resolvedPatchRev,
    label,
  });

  return createLogicBundle({
    baseVersion: resolvedBaseVersion,
    patchRev: resolvedPatchRev,
    filePath,
    bundleSha,
    label: label || null,
  });
}

// Placeholder for a companion's BUILD_ID placeholder at assembly time — a
// freshly-assembled logic bundle has no device-facing build identity yet
// (that's only assigned once `builder` eventually publishes from it, and
// re-stamped on every publish regardless, D105's `restampCompanionBuildId`)
// so any value matching `appendCompanion`'s own charset (D48) is fine here.
const ASSEMBLE_PLACEHOLDER_BUILD_ID = "unassigned";

// progress-sync-shim's shim/restore-companion fetch against
// `${SYNC_BASE_URL}/<id>` directly (confirmed: `patches/js/
// 2080-progress-sync-shim.edited.js` and `progress-sync-restore-
// companion.js` both do `fetch(SYNC_BASE_URL + '/' + encodeURIComponent(id), ...)`)
// — the default needs the full `/mjolnir/userdata` path, not just the host
// `publicBase` already names. Moved here (from server.js) so
// `assembleDefaults` below can compute the same resolved value it now
// returns, instead of only a boolean — server.js imports these back for
// its own `/mjolnir/ota/assemble-submit` default-filling.
export function defaultSyncBaseUrl(publicBase) {
  if (!publicBase) return undefined;
  return `${publicBase.replace(/\/+$/, "")}/mjolnir/userdata`;
}

// audio-cache-prefetch: the prefetcher companion and the rewritten mod 1440
// patch both build their own `/audio-manifest/...` and `/blob/...` paths
// off this one base (confirmed: `audio-prefetch-companion.js` does
// `fetch(AUDIO_BASE_URL + '/audio-manifest/' + buildId + '.json')` and
// `AUDIO_BASE_URL + '/blob/' + sha256`) — a single fixed sub-path default
// no longer makes sense now that the device resolves cardId → sha256
// itself (D-P6 retires `/audio-by-card/*`), so this defaults to the bare
// public base, not a sub-path.
export function defaultAudioBaseUrl(publicBase) {
  if (!publicBase) return undefined;
  return publicBase.replace(/\/+$/, "");
}

// D-L7 follow-up / assembly-tab-usability item 1: what the embedded
// Assemble tab shows the operator before they hit "Assemble & submit logic
// bundle" — now the real resolved values the Placeholders rows prefill
// with, not booleans.
//
// REVERSAL, recorded deliberately: this function used to return
// `syncTokenConfigured`/`syncBaseUrlConfigured`/`audioBaseUrlConfigured`
// booleans with the comment "Booleans only — never the token value itself
// — so the Assemble tab can tell the operator 'leave blank, this server
// already has one' without echoing a secret into a GET response any page
// script can read." The operator reversed that in the assembly-tab-
// usability design session: `OPERATOR_AUTH_TOKEN` is the same credential
// the browser already holds to reach this very page (it's behind the one
// operator-plane `basic_auth`, D159/D160) — returning it to a page that
// could not be open without already having it adds no new reader. This
// route never crosses into the device plane. A box that claims
// "configured" but renders nothing was exactly the complaint
// assembly-tab-usability item 1 was filed about, so the real value now
// goes out, masked client-side with a reveal toggle instead of withheld
// server-side.
export async function assembleDefaults({ baseFolderDir, publicBase, operatorAuthToken }) {
  const baseVersion = readBaseVersion(baseFolderDir);
  const nextRev = await nextPatchRev();
  // boot-companion-label-data-version/D-L3: DATA_VERSION's pre-filled
  // default is the most recent `data_rev` already on record — unlike
  // PATCH_REV, nothing here increments it; the real next value is only
  // known once builder actually publishes.
  const { dataRev } = await previousVersions();
  return {
    baseFolderDir,
    baseVersion,
    nextPatchRev: nextRev,
    label: `${baseVersion}-patch${nextRev}`,
    dataRev,
    syncBaseUrl: defaultSyncBaseUrl(publicBase),
    syncToken: operatorAuthToken || undefined,
    // D120/audio-cache-prefetch: this base URL has no token of its own
    // (the Caddy `/audio-manifest/*` and `/blob/*` routes are plain static,
    // unauthenticated by design).
    audioBaseUrl: defaultAudioBaseUrl(publicBase),
  };
}

// D112: the embedded Assemble tab's one-step "Assemble" action — assembles
// against this repo's own one base folder (never client-supplied; see
// config.js's `baseFolderDir`) and submits the result as a new
// `logic_bundles` row directly, with no intermediate output-bundle-path
// step and no separate upload-to-/mjolnir/ota/submit round trip. Standalone
// `bundle-tool`/bundle-workbench (no hub, no database, D108) keeps its own
// `assembleBundle` -> file path flow unchanged — this is hub-only, exactly
// like `forcePublish`'s own direct-to-disk-then-submit shape above.
export async function assembleAndSubmit({
  baseFolderDir,
  patchNames,
  patchesDir,
  patchbackPairNames,
  companionFiles,
  label,
  patchRev,
  dataDir,
  logicBundleDir,
  placeholders,
}) {
  const resolvedPatchRev = patchRev === undefined || patchRev === null ? await nextPatchRev() : Number(patchRev);
  const tmpPath = path.join(dataDir, `.assemble-submit-${Date.now()}-${Math.random().toString(36).slice(2)}.tmp`);
  fs.mkdirSync(dataDir, { recursive: true });
  try {
    const assembled = await assembleBundle({
      baseFolderPath: baseFolderDir,
      patchNames: patchNames || [],
      patchesDir,
      patchbackPairNames: patchbackPairNames || [],
      outputPath: tmpPath,
      companionFiles: companionFiles || [],
      // BUILD_ID is still hub's own value, not operator-editable via the
      // generic placeholder map — it's a real id only assigned once this
      // bundle is actually submitted (below), so it always overrides
      // anything the caller put in `placeholders`, same as
      // `assembleBundle`'s own BASE_VERSION auto-override (D-G2).
      //
      // PATCH_REV is DIFFERENT since assembly-tab-usability item 1: the
      // Assemble tab's `PATCH_REV` row *is* this function's `patchRev`
      // argument now (both read off the same row, server.js's
      // `/mjolnir/ota/assemble-submit` sends them together) — so this
      // override is identity, not a silent discard of what the operator
      // typed into the row. It stays written explicitly, rather than
      // relying on `placeholders.PATCH_REV` already matching, so a caller
      // that omits the row but passes `patchRev` (or vice versa) still gets
      // one coherent resolved value instead of two sources quietly
      // disagreeing.
      placeholders: { ...placeholders, BUILD_ID: ASSEMBLE_PLACEHOLDER_BUILD_ID, PATCH_REV: resolvedPatchRev },
    });
    const bytes = fs.readFileSync(tmpPath);
    const resolvedLabel = label || `${assembled.baseVersion}-patch${resolvedPatchRev}`;
    return await submitBundle(bytes, {
      label: resolvedLabel,
      baseVersion: assembled.baseVersion,
      patchRev: resolvedPatchRev,
      dataDir,
      logicBundleDir,
    });
  } finally {
    fs.rmSync(tmpPath, { force: true });
  }
}

// Task 4.2: thin wrapper over `logicBundles.activate` — the UI's "activate"
// button. Activating does not publish anything on its own; it only changes
// what `builder`'s *next* run will build onto (ota-console spec's
// "Activating a submitted bundle" scenario).
export async function activateLogicBundle(id) {
  await activate(id);
}

// D-L5/task 4.3: the emergency path, kept as a separate, explicitly-labeled
// action — publishes a raw bundle straight to `current.json`, bypassing
// `logic_bundles` activation and `builder` entirely. Per design.md's
// resolved open question, still writes an inactive `logic_bundles` row for
// provenance, so this path isn't a dead end for audit history even though
// it's never what `builder` builds from next.
export async function forcePublish(bytes, buildId, label, { dataDir, logicBundleDir, publicBase, allowNoCompanion } = {}) {
  const tmpPath = path.join(dataDir, `.ota-submit-${buildId}-${Date.now()}.tmp`);
  fs.mkdirSync(dataDir, { recursive: true });
  fs.writeFileSync(tmpPath, bytes);
  try {
    const result = publish(tmpPath, buildId, label, { dataDir, publicBase, allowNoCompanion });
    const { dataRev } = await previousVersions();
    const baseVersion = findBakedBaseVersion(bytes) || "0";
    const patchRev = findBakedPatchRev(bytes) ?? 0;
    await writePublication({ buildId, baseVersion, patchRev, dataRev, bundleSha: result.sha256, label });

    const forceLabel = `force-publish: ${label || buildId}`;
    const filePath = writeLogicBundleFile(dataDir, logicBundleDir, bytes, result.sha256, {
      baseVersion,
      patchRev,
      label: forceLabel,
    });
    await createLogicBundle({
      baseVersion,
      patchRev,
      filePath,
      bundleSha: result.sha256,
      label: forceLabel,
    });

    return result;
  } finally {
    fs.rmSync(tmpPath, { force: true });
  }
}

// Task 6.2 (unchanged): "set as current" — repoints `current.json` at a
// build whose bundle is already on disk, by calling the same `publish()`
// guards again with that build's own id.
export async function setCurrent(buildId, { dataDir, publicBase }) {
  const bundlePath = path.join(dataDir, "ota", "bundle", `${buildId}.js`);
  if (!fs.existsSync(bundlePath)) throw new Error(`no bundle on disk for "${buildId}"`);
  const { rows } = await query("SELECT label FROM publications WHERE build_id = $1", [buildId]);
  if (rows.length === 0) throw new Error(`no such build "${buildId}"`);
  const label = rows[0].label || buildId;
  return publish(bundlePath, buildId, label, { dataDir, publicBase });
}
