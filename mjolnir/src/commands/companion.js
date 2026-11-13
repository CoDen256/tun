import fs from "node:fs";
import path from "node:path";

// Appends a redeployable JS companion (e.g. the boot-ok marker writer) to a
// Metro bundle as new top-level code, AFTER the entry call(s) (`__r(0);`) and
// before the trailing sourcemap comments. It modifies zero existing module
// bytes — the bundle is not IIFE-wrapped and `__r` is a genuine global, so
// appended code runs at top level once the entry module has registered the app
// (docs/findings.md §4). This is deliberately outside the content-locator patch
// system (patchback), which rewrites module factory bodies and cannot add a
// module dependency; the companion needs none, because it reaches native
// modules via `globalThis.expo.modules.<Name>`.

// generic-placeholder-substitution (D-G1): any `__MJOLNIR_<KEY>__` found in a
// companion's source or an assembled bundle is substituted from a single
// `placeholders: {[key]: value}` map — no per-key constant, no per-key
// branch. Validation is by key NAME/SUFFIX convention, not a bespoke check
// per key: a `_URL`-suffixed key must be a bare `https://` URL (D53 —
// transport must never be silently downgradable); `BUILD_ID`/`BASE_VERSION`
// keep the charset native validates (D48); `PATCH_REV` must be a
// non-negative integer. Everything else is accepted as any non-empty
// string. Adding a new placeholder (e.g. `LABEL`, `DATA_VERSION`) needs
// zero changes here or anywhere in the CLI/HTTP/UI layers — just a new key
// in whatever map the caller already builds.
const PLACEHOLDER_PATTERN = /__MJOLNIR_([A-Z0-9_]+)__/g;
const URL_VALUE_RE = /^https:\/\/\S+$/; // D53-style: transport must not be downgradable
const ID_CHARSET_RE = /^[A-Za-z0-9._-]{1,64}$/; // D48 — same charset native validates

// Every distinct `__MJOLNIR_<KEY>__` key present in `text`, in first-seen
// order (a Set preserves insertion order in JS, which keeps companion
// console output and error messages in a stable, predictable sequence).
function findPlaceholderKeys(text) {
  const keys = new Set();
  const re = new RegExp(PLACEHOLDER_PATTERN);
  let match;
  while ((match = re.exec(text))) keys.add(match[1]);
  return keys;
}

// D-G1's three convention-based rules, by key name/suffix. Throws on a
// missing or malformed value; returns the value's final substituted string
// form on success.
function validatePlaceholderValue(key, rawValue, label) {
  if (rawValue === undefined || rawValue === null || rawValue === "") {
    throw new Error(`${label} contains __MJOLNIR_${key}__ but no value was given for ${key}`);
  }
  if (key.endsWith("_URL")) {
    if (!URL_VALUE_RE.test(rawValue)) {
      throw new Error(`${key} must be a bare https:// URL with no trailing slash expected by the caller — got '${rawValue}'`);
    }
    return String(rawValue);
  }
  if (key === "BUILD_ID" || key === "BASE_VERSION") {
    if (!ID_CHARSET_RE.test(rawValue)) {
      throw new Error(`${key} must match ${ID_CHARSET_RE} (D48) — got '${rawValue}'`);
    }
    return String(rawValue);
  }
  if (key === "PATCH_REV") {
    const n = typeof rawValue === "number" ? rawValue : Number(rawValue);
    if (!Number.isInteger(n) || n < 0) {
      throw new Error(`PATCH_REV must be a non-negative integer — got '${rawValue}'`);
    }
    return String(n);
  }
  return String(rawValue);
}

// Substitutes every `__MJOLNIR_<KEY>__` found in `text` from `placeholders`,
// validating each per D-G1. A key present in `text` with no matching entry
// in `placeholders` is still an error — same "contains X but no value was
// given" failure this project has always had, just reached generically.
function substitutePlaceholders(text, placeholders, label) {
  const keys = findPlaceholderKeys(text);
  let result = text;
  for (const key of keys) {
    const value = validatePlaceholderValue(key, placeholders ? placeholders[key] : undefined, label);
    result = result.split(`__MJOLNIR_${key}__`).join(value);
  }
  return result;
}

// Pure: returns a new Buffer with `companionSource` appended. `name` is used
// for a sentinel comment that makes re-appending the same companion an
// error. Every `__MJOLNIR_<KEY>__` placeholder in the companion's source is
// substituted from `placeholders`; a key the source doesn't reference is
// simply ignored, same as before.
export function appendCompanion(bundleBuffer, companionSource, { placeholders, name } = {}) {
  const sentinel = `/* mjolnir-companion: ${name || "unnamed"} */`;
  const original = bundleBuffer.toString("utf8");

  if (original.includes(sentinel)) {
    throw new Error(`companion '${name}' is already present in this bundle`);
  }

  const source = substitutePlaceholders(companionSource, placeholders, `companion '${name}'`);
  const block = `\n${sentinel}\n${source.trim()}\n`;

  // Insert before the first sourcemap/debugId comment if present, so those stay
  // the final lines; otherwise append at EOF.
  const mapIdx = original.search(/\n\/\/# (sourceMappingURL|debugId)=/);
  let result;
  if (mapIdx !== -1) {
    result = original.slice(0, mapIdx) + block + original.slice(mapIdx);
  } else {
    const sep = original.endsWith("\n") ? "" : "\n";
    result = original + sep + block.replace(/^\n/, "");
  }

  return Buffer.from(result, "utf8");
}

// Substitutes every `__MJOLNIR_<KEY>__` found anywhere across an entire
// assembled bundle — unlike `appendCompanion`'s substitution (one appended
// companion's own source), this also reaches patch-back-applied modules
// (e.g. the mod 2080 shim, the mod 1440 audio patch), since those modules'
// edited source becomes part of the bundle's own bytes with no append-time
// hook to substitute through. A no-op (returns the buffer unchanged) when no
// placeholder is present anywhere — an assembly using none of these patches
// pays nothing for this existing.
export function substituteBakedPlaceholders(bundleBuffer, placeholders = {}) {
  const text = bundleBuffer.toString("utf8");
  if (findPlaceholderKeys(text).size === 0) return bundleBuffer;
  return Buffer.from(substitutePlaceholders(text, placeholders, "this bundle"), "utf8");
}

export function runCompanion(bundlePath, outputPath, companionFile, { placeholders } = {}) {
  // Create the output directory if needed — otherwise writeFileSync throws a
  // raw ENOENT stack at the end of the work, after the bundle is built.
  const outDir = path.dirname(outputPath);
  if (outDir && outDir !== "." && !fs.existsSync(outDir)) {
    fs.mkdirSync(outDir, { recursive: true });
  }

  const bundle = fs.readFileSync(bundlePath);
  const companionSource = fs.readFileSync(companionFile, "utf8");
  const name = path.basename(companionFile).replace(/\.js$/, "");

  const out = appendCompanion(bundle, companionSource, { placeholders, name });
  fs.writeFileSync(outputPath, out);

  console.log(`appended companion '${name}' → ${outputPath}`);
  const keys = findPlaceholderKeys(companionSource);
  for (const key of keys) {
    const isSecret = key.includes("TOKEN") || key.includes("SECRET");
    console.log(`  ${key}  ${isSecret ? "(set)" : placeholders?.[key]}`);
  }
  if (keys.has("BUILD_ID")) {
    console.log(`  NOTE: pass the SAME buildId to tun/bin/ota-publish.sh so the`);
    console.log(`        boot-ok marker pairs with bundle-${placeholders?.BUILD_ID}.js (D52).`);
  }
}
