import fs from "node:fs";
import path from "node:path";
import { buildIndexFromBuffer, shiftModulesAfterReplace } from "../parseBundle.js";
import { loadPatch, applyPatchInBuffer, computePatchedModuleSourceInBuffer } from "../patches.js";
import { loadPatchbackPair } from "../patchbackPairs.js";
import { reassembleBundleFromBuffer } from "../reassemble.js";
import { readBaseVersion } from "../apktoolYml.js";
import { appendCompanion, substituteBakedPlaceholders } from "./companion.js";

// Where a decoded base APK folder keeps its Metro bundle — confirmed against
// `base/smali.mjolnir.merged/assets/index.android.bundle` (this repo's own
// base folder).
export const BASE_BUNDLE_RELATIVE_PATH = path.join("assets", "index.android.bundle");

// D-L7: extends the existing patch-apply flow (patchback's locate-by-content
// algorithm, unchanged, via `src/patches.js`) to multiple stored patches
// applied in one pass against a chosen base, never mutating the base itself.
// `outputPath` starts as a byte-identical copy of the base's own bundle;
// each patch is applied against that copy in order, re-deriving the module
// index fresh between patches (`loadIndex` auto-rebuilds on a stale
// size/mtime, same as every other `src/patches.js` caller) since each write
// shifts every later module's byte offsets. `base_version` is read from the
// base folder's own `apktool.yml` (confirmed not present anywhere in the
// bundle's own bytes, D-L7); `patch_rev` is the caller's responsibility to
// supply (builder-logic-bundle-store's single global counter lives in hub's
// `logic_bundles` table — this module has no database access of its own).
// D110/D111: a bundle's patch-like inputs are three genuinely different
// operations, not degrees of the same thing. `patchNames` (via
// `src/patches.js`, JSON-store) and `patchbackPairNames` (via
// `src/patchbackPairs.js`, raw `<id>-name.baseline.js`/`.edited.js` file
// pairs) both REPLACE an existing module's factory body in place, using the
// identical reconciliation algorithm (`computePatchedModuleSource`) — they
// differ only in how the target module is found (content locator vs. a
// module id named in the pair's own filename) and in storage shape (one
// JSON file with metadata vs. two plain source files). `companionFiles`
// APPEND brand-new top-level code after the bundle's entry call, touching
// zero existing module bytes (`src/commands/companion.js`'s mechanism —
// what `boot-ok-companion.js`/`config-rotate.js`/`ota-debug-report.js` all
// are, per `patches/README.md`). Assembly applies every JSON-store patch,
// then every patch-back pair, then appends every companion — all three in
// their own given order; only replace-vs-replace order can matter (two
// patches touching the same module), so patches and pairs are applied in
// argument order with no interleaving between the two lists.
export async function assembleBundle({
  baseFolderPath,
  patchNames,
  patchesDir,
  patchbackPairNames,
  patchbackDir,
  outputPath,
  companionFiles,
  placeholders,
}) {
  const baseBundlePath = path.join(baseFolderPath, BASE_BUNDLE_RELATIVE_PATH);
  if (!fs.existsSync(baseBundlePath)) {
    throw new Error(
      `no bundle found at ${baseBundlePath} — is "${baseFolderPath}" a decoded base APK folder?`
    );
  }
  const baseVersion = readBaseVersion(baseFolderPath);
  // D-G2 (generic-placeholder-substitution): BASE_VERSION is never operator-
  // supplied — it's always read from the base folder's own apktool.yml,
  // overriding any BASE_VERSION the caller might have mistakenly included.
  const mergedPlaceholders = { ...placeholders, BASE_VERSION: baseVersion };

  // Resolve every patch up front: "a patch that fails to locate aborts the
  // assembly with no partial output written" (task 5.3) — a patch name that
  // doesn't even exist on disk must fail before the output path is touched
  // at all, not partway through applying earlier patches.
  const patches = (patchNames || []).map((name) => loadPatch(patchesDir, name));
  // Same up-front resolution for patch-back pairs: an unknown name, or one
  // whose filename carries no leading module id, must abort before any
  // write happens too.
  const resolvedPatchbackDir = patchbackDir || (patchesDir ? path.join(patchesDir, "js") : undefined);
  const patchbackPairs = (patchbackPairNames || []).map((name) => loadPatchbackPair(resolvedPatchbackDir, name));
  // Same up-front resolution for companions: a missing file must abort
  // before any write happens, exactly like a missing patch name.
  const companionSources = (companionFiles || []).map((file) => ({
    name: path.basename(file).replace(/\.js$/, ""),
    source: fs.readFileSync(file, "utf8"),
  }));

  const outDir = path.dirname(outputPath);
  if (outDir && outDir !== ".") fs.mkdirSync(outDir, { recursive: true });

  const startedAt = Date.now();

  // D-P1 (assemble-performance-fix): parse the bundle exactly once, here,
  // then apply every patch/patch-back pair against this in-memory buffer
  // and index — never writing to `outputPath` until the very end. The
  // previous implementation wrote to `outputPath` after every single step
  // and called `loadIndex(outputPath)` again on the next one; since that
  // write changes the file's size/mtime, `loadIndex`'s own cache was
  // invalidated every iteration, forcing a full re-parse of the whole
  // bundle once per patch applied — a cost that scaled with patch count
  // instead of being paid once per assemble.
  let buffer = fs.readFileSync(baseBundlePath);
  let modules = buildIndexFromBuffer(buffer).modules;

  try {
    for (const patch of patches) {
      // A patch's own locator may still fail to resolve unambiguously
      // against this particular base (D-L7's "fails to locate" case) —
      // `applyPatchInBuffer`/`locatePatchTargetInBuffer` already throw a
      // clear error for that; propagating it here (instead of swallowing)
      // is what makes the catch below discard the partial output rather
      // than leaving one.
      const result = await applyPatchInBuffer({ buffer, cache: { modules }, patch });
      buffer = result.buffer;
      modules = result.modules;
    }

    for (const pair of patchbackPairs) {
      const mod = modules[pair.moduleId];
      if (!mod) {
        throw new Error(`patch-back pair "${pair.name}": module ${pair.moduleId} not found in this bundle`);
      }
      const patch = {
        baseline: fs.readFileSync(pair.baselinePath, "utf8"),
        modified: fs.readFileSync(pair.editedPath, "utf8"),
      };
      const newSource = await computePatchedModuleSourceInBuffer({
        buffer,
        cache: { modules },
        targetModuleId: pair.moduleId,
        patch,
      });
      const outBuffer = reassembleBundleFromBuffer(buffer, modules, [{ moduleId: pair.moduleId, newSource }]);
      const delta = Buffer.byteLength(newSource, "utf8") - (mod.end - mod.start);
      modules = shiftModulesAfterReplace(modules, pair.moduleId, mod.end, delta);
      buffer = outBuffer;
    }

    for (const { name, source } of companionSources) {
      // Companions are appended after the last module's own trailer (the
      // entry calls / sourcemap comments) — strictly outside every
      // module's [start, end) range, so `modules`' offsets stay valid with
      // no shift needed here.
      buffer = appendCompanion(buffer, source, { placeholders: mergedPlaceholders, name });
    }

    // Any placeholder (e.g. progress-sync-shim's SYNC_BASE_URL/SYNC_TOKEN,
    // audio-link-playback-minimal's AUDIO_BASE_URL, D120) can also appear
    // inside a patch-back-applied module's own source (the `2080-progress-
    // sync-shim` and `1440-audio-link-playback` pairs), not just inside an
    // appended companion — patch-back has no append-time substitution step
    // of its own, so this final pass over the whole assembled bundle is
    // where those patches' placeholders actually get baked. A no-op when no
    // placeholder appears anywhere.
    buffer = substituteBakedPlaceholders(buffer, mergedPlaceholders);

    // The only disk write in the whole assemble — everything above ran
    // against `buffer` in memory.
    fs.writeFileSync(outputPath, buffer);
  } catch (err) {
    // No partial output survives a failed assembly (task 5.3) — nothing
    // was ever written to `outputPath` until the line above, so there's
    // nothing to clean up here now; kept as a no-op guard in case a
    // future edit reintroduces an intermediate write.
    fs.rmSync(outputPath, { force: true });
    throw err;
  }

  // D-P2: operator-visible, not gated behind a debug flag — the original
  // performance diagnosis (repeated full-bundle re-parse) was made by
  // reading this code plus a local benchmark that couldn't reproduce the
  // reported ~90s production figure; this is what lets that be checked
  // directly against real hardware instead of trusted on faith.
  console.log(`[mjolnir-assemble] completed in ${Date.now() - startedAt}ms`);

  return {
    outputPath,
    baseVersion,
    placeholders: mergedPlaceholders,
    appliedPatches: patchNames || [],
    appliedPatchbackPairs: patchbackPairs.map((p) => p.name),
    appliedCompanions: companionSources.map((c) => c.name),
  };
}
