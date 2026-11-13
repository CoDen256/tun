import fs from "node:fs";
import path from "node:path";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { minify } from "terser";
import { extractFactoryBody } from "./factory.js";
import { readModuleSource, readModuleSourceFromBuffer, shiftModulesAfterReplace } from "./parseBundle.js";
import { buildPatchedFactoryStatements } from "./commands/patchback.js";
import { reassembleBundle, reassembleBundleFromBuffer } from "./reassemble.js";

const generate = generatorPkg.default ?? generatorPkg;

export const DEFAULT_PATCHES_DIR = "patches";

function patchFilePath(patchesDir, name) {
  return path.join(patchesDir, `${name}.json`);
}

// Lists every patch file in `patchesDir`, each as its parsed JSON content.
export function listPatches(patchesDir) {
  if (!fs.existsSync(patchesDir)) return [];
  return fs
    .readdirSync(patchesDir)
    .filter((f) => f.endsWith(".json"))
    .map((f) => JSON.parse(fs.readFileSync(path.join(patchesDir, f), "utf8")))
    .sort((a, b) => a.name.localeCompare(b.name));
}

export function loadPatch(patchesDir, name) {
  const filePath = patchFilePath(patchesDir, name);
  if (!fs.existsSync(filePath)) throw new Error(`no such patch: ${name}`);
  return JSON.parse(fs.readFileSync(filePath, "utf8"));
}

// Writes one JSON file per patch, containing exactly the fields the
// patch-management spec requires: name, description, locator, baseline/
// modified source, a creation timestamp, and the (initially empty) list of
// bundle versions it's been verified against.
export function savePatch(patchesDir, { name, description, locator, baseline, modified, verifiedAgainstVersions }) {
  if (!name) throw new Error("patch name is required");
  if (!locator || typeof locator.contains !== "string" || !locator.contains) {
    throw new Error('patch locator must be a {contains: "<string>"}');
  }
  if (typeof baseline !== "string" || typeof modified !== "string") {
    throw new Error("patch baseline and modified source are required");
  }

  fs.mkdirSync(patchesDir, { recursive: true });
  const patch = {
    name,
    description: description || "",
    locator,
    baseline,
    modified,
    createdAt: new Date().toISOString(),
    verifiedAgainstVersions: verifiedAgainstVersions || [],
  };
  fs.writeFileSync(patchFilePath(patchesDir, name), JSON.stringify(patch, null, 2));
  return patch;
}

// Locates a patch's target module in a bundle by scanning module sources for
// the locator's `contains` string — the same substring-scan technique the
// `grep` command uses — rather than relying on a module id, which is not
// stable across bundle versions.
export function locatePatchTarget(bundlePath, cache, locator) {
  if (!locator || typeof locator.contains !== "string") {
    throw new Error('patch locator must be a {contains: "<string>"}');
  }
  const needle = locator.contains;
  const matches = [];
  for (const idStr of Object.keys(cache.modules)) {
    const mod = cache.modules[idStr];
    const source = readModuleSource(bundlePath, mod);
    if (source.includes(needle)) matches.push(Number(idStr));
  }
  if (matches.length === 0) {
    throw new Error(`locator ${JSON.stringify(needle)} matched no modules in this bundle`);
  }
  if (matches.length > 1) {
    throw new Error(
      `locator ${JSON.stringify(needle)} matched multiple modules (${matches.join(", ")}); cannot apply unambiguously`
    );
  }
  return matches[0];
}

// In-memory counterpart — same scan, reading each candidate module's
// source out of a buffer already held in memory.
export function locatePatchTargetInBuffer(buffer, cache, locator) {
  if (!locator || typeof locator.contains !== "string") {
    throw new Error('patch locator must be a {contains: "<string>"}');
  }
  const needle = locator.contains;
  const matches = [];
  for (const idStr of Object.keys(cache.modules)) {
    const mod = cache.modules[idStr];
    const source = readModuleSourceFromBuffer(buffer, mod);
    if (source.includes(needle)) matches.push(Number(idStr));
  }
  if (matches.length === 0) {
    throw new Error(`locator ${JSON.stringify(needle)} matched no modules in this bundle`);
  }
  if (matches.length > 1) {
    throw new Error(
      `locator ${JSON.stringify(needle)} matched multiple modules (${matches.join(", ")}); cannot apply unambiguously`
    );
  }
  return matches[0];
}

function parseSource(src) {
  return parse(src, { sourceType: "script", allowReturnOutsideFunction: true });
}

// Shared, pure core: given a module's current source text and a baseline/
// modified patch pair, computes the new (minified) source text. Reused by
// both the file-path API (`computePatchedModuleSource`, reads the original
// off disk) and the in-memory API (`computePatchedModuleSourceInBuffer`,
// assemble-performance-fix) — the diff/realign/minify logic itself never
// needs to know where the original text came from.
async function computePatchedSourceFromOriginal(originalSource, patch) {
  const oAst = parseSource(originalSource);
  const oFactory = extractFactoryBody(oAst).factory;

  const rFactory = extractFactoryBody(parseSource(patch.baseline)).factory;
  const mFactory = extractFactoryBody(parseSource(patch.modified)).factory;

  const newStatements = buildPatchedFactoryStatements({ oFactory, rFactory, mFactory });
  oFactory.body.body = newStatements;

  const { code: regenerated } = generate(oAst, { comments: false, retainLines: false });
  const minified = await minify(regenerated, { compress: true, mangle: true });
  if (minified.error) throw minified.error;

  let newSource = minified.code.trim();
  if (!newSource.endsWith(";")) newSource += ";";
  return newSource;
}

// Computes the patched source for the located target module, reusing
// patch-back's own realignment algorithm unmodified: locate -> diff the
// patch's baseline/modified -> `buildPatchedFactoryStatements` against the
// located module's current content. Never writes anything.
export async function computePatchedModuleSource({ bundlePath, cache, targetModuleId, patch }) {
  const mod = cache.modules[targetModuleId];
  const originalSource = readModuleSource(bundlePath, mod);
  return computePatchedSourceFromOriginal(originalSource, patch);
}

// In-memory counterpart — same computation, reading the module's current
// source out of a buffer already held in memory instead of the bundle
// file on disk.
export async function computePatchedModuleSourceInBuffer({ buffer, cache, targetModuleId, patch }) {
  const mod = cache.modules[targetModuleId];
  const originalSource = readModuleSourceFromBuffer(buffer, mod);
  return computePatchedSourceFromOriginal(originalSource, patch);
}

// Locates the target and computes its patched source, returning a preview
// (current vs. new content) without writing anything to the bundle.
export async function previewPatch({ bundlePath, cache, patch }) {
  const targetModuleId = locatePatchTarget(bundlePath, cache, patch.locator);
  const mod = cache.modules[targetModuleId];
  const currentSource = readModuleSource(bundlePath, mod);
  const newSource = await computePatchedModuleSource({ bundlePath, cache, targetModuleId, patch });
  return { targetModuleId, currentSource, newSource };
}

// Commits a patch: locate, compute, write the patched module, and
// reassemble the bundle in place — matching `patch-back`'s existing write
// path. `cache.modules`' start/end offsets (always fresh, auto-rebuilt from
// the bundle file if stale) double as the manifest `reassembleBundle` needs,
// so this never depends on a possibly-stale `explode` manifest.
export async function applyPatch({ bundlePath, cache, patch }) {
  const targetModuleId = locatePatchTarget(bundlePath, cache, patch.locator);
  const newSource = await computePatchedModuleSource({ bundlePath, cache, targetModuleId, patch });
  const outBuffer = reassembleBundle(bundlePath, cache.modules, [{ moduleId: targetModuleId, newSource }]);
  fs.writeFileSync(bundlePath, outBuffer);
  return { targetModuleId };
}

// In-memory counterpart (assemble-performance-fix/D-P1): locate, compute,
// splice, and return the new buffer PLUS a modules map with every
// downstream module's offset shifted by the resulting byte delta — never
// writes to disk, never re-parses. This is what lets `assembleBundle`
// apply a whole chain of patches against one in-memory buffer, parsing
// the bundle exactly once at the very start instead of once per patch.
export async function applyPatchInBuffer({ buffer, cache, patch }) {
  const targetModuleId = locatePatchTargetInBuffer(buffer, cache, patch.locator);
  const mod = cache.modules[targetModuleId];
  const newSource = await computePatchedModuleSourceInBuffer({ buffer, cache, targetModuleId, patch });
  const outBuffer = reassembleBundleFromBuffer(buffer, cache.modules, [{ moduleId: targetModuleId, newSource }]);
  const delta = Buffer.byteLength(newSource, "utf8") - (mod.end - mod.start);
  const modules = shiftModulesAfterReplace(cache.modules, targetModuleId, mod.end, delta);
  return { targetModuleId, buffer: outBuffer, modules };
}
