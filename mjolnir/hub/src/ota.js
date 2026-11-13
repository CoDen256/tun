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

// D-L7 follow-up: what the embedded Assemble tab shows the operator before
// they hit "Assemble" — the base version it'll read (so an empty Patch rev/
// Label field's eventual value isn't a total surprise) and what Patch rev
// will resolve to if left blank.
export async function assembleDefaults({ baseFolderDir, publicBase, operatorAuthToken }) {
  const baseVersion = readBaseVersion(baseFolderDir);
  const nextRev = await nextPatchRev();
  // boot-companion-label-data-version/D-L3: DATA_VERSION's pre-filled
  // default is the most recent `data_rev` already on record — unlike
  // PATCH_REV, nothing here increments it; the real next value is only
  // known once builder actually publishes.
  const { dataRev } = await previousVersions();
  // Booleans only — never the token value itself — so the Assemble tab can
  // tell the operator "leave blank, this server already has one" without
  // echoing a secret into a GET response any page script can read.
  return {
    baseFolderDir,
    baseVersion,
    nextPatchRev: nextRev,
    dataRev,
    syncBaseUrlConfigured: !!publicBase,
    syncTokenConfigured: !!operatorAuthToken,
    // D120/audio-cache-prefetch: this base URL has no token of its own
    // (the Caddy `/audio-manifest/*` and `/blob/*` routes are plain static,
    // unauthenticated by design) — only the URL needs a configured default
    // to report.
    audioBaseUrlConfigured: !!publicBase,
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
      // BUILD_ID/PATCH_REV are hub's own values, not operator-editable via
      // the generic placeholder map here — BUILD_ID is a real id only
      // assigned once this bundle is actually submitted (below), and
      // PATCH_REV is this function's own `patchRev` param (resolved via
      // `nextPatchRev()` above) — both always override anything the caller
      // might have put in `placeholders`, same as `assembleBundle`'s own
      // BASE_VERSION auto-override (D-G2).
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
