import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";

// Canonical implementation of the OTA publish guards that used to live only
// in `ota-publish.sh` (D75/D76). The CLI wraps this; `builder` imports it
// in-process — one implementation of "is this buildId reuse safe," not a
// bash version and a second Node reimplementation.

const BUILD_ID_RE = /^[A-Za-z0-9._-]{1,64}$/; // D48 — same charset native validates
const MAGIC_PREFIX = "var __BUNDLE_START_TIME__="; // checked by the device at every activation (D51)
export const MAX_BUNDLE_SIZE = 67108864; // 64 MiB — native rejects anything larger (D48)

export function validateBuildId(buildId) {
  if (!BUILD_ID_RE.test(buildId)) {
    throw new Error(`refusing: buildId must match ${BUILD_ID_RE} — got '${buildId}'`);
  }
}

export function checkMagicPrefix(bytes) {
  const prefix = bytes.subarray(0, MAGIC_PREFIX.length).toString("utf8");
  if (prefix !== MAGIC_PREFIX) {
    throw new Error(
      `refusing: bundle does not start with '${MAGIC_PREFIX}' — the device would reject it at activation`
    );
  }
}

// The companion bakes the buildId into the JS (`BUILD_ID = '<id>'`); a
// mismatch between that and the buildId being published is silent AND
// frozen (D64-class failure on the JS side — see ota-publish.sh). Returns
// the baked id, or null if no companion is present.
function findBakedBuildId(bytes) {
  const match = bytes.toString("utf8").match(/BUILD_ID\s*=\s*'([A-Za-z0-9._-]{1,64})'/);
  return match ? match[1] : null;
}

// D-L1: siblings to `findBakedBuildId`, same regex-match-on-bundle-text
// approach — base_version/patch_rev are baked into the companion the exact
// same way (`src/commands/companion.js`'s placeholder substitution), so hub
// reads them back out with the same technique rather than a second
// mechanism. Both return null if the companion wasn't built with that
// constant baked in (the "prompt the operator" case, D-L1).
export function findBakedBaseVersion(bytes) {
  const match = bytes.toString("utf8").match(/BASE_VERSION\s*=\s*'([A-Za-z0-9._-]{1,64})'/);
  return match ? match[1] : null;
}

export function findBakedPatchRev(bytes) {
  const match = bytes.toString("utf8").match(/PATCH_REV\s*=\s*(\d+)/);
  return match ? Number(match[1]) : null;
}

export function checkCompanionMatch(bytes, buildId, { allowNoCompanion = false } = {}) {
  const baked = findBakedBuildId(bytes);
  if (baked != null) {
    if (baked !== buildId) {
      throw new Error(
        `refusing: companion bakes BUILD_ID '${baked}' but you are publishing as '${buildId}'. ` +
          `boot-ok-${baked} would never match bundle-${buildId}.js — native would quarantine this build on its third launch.`
      );
    }
    return baked;
  }
  if (!allowNoCompanion) {
    throw new Error(
      "refusing: no boot-ok companion found in the bundle. Without it native writes no boot-ok and " +
        "quarantines this build on its third launch. Pass allowNoCompanion only for a bundle no patched device will ever fetch."
    );
  }
  return null;
}

// The boot-ok companion's baked constants are plain appended text, not
// something `deckData.js`'s save path touches — nothing re-stamps them, so
// they stay frozen at whatever the ASSEMBLE of that logic bundle baked.
// For `BUILD_ID` that was already fatal and visible (`checkCompanionMatch`
// refused the publish); for `DATA_VERSION` it was silent, and every publish
// after the first off a given logic bundle shipped a device-visible data
// revision that was simply wrong.
//
// builder-ship-strips (D-SS7): this restamps every PUBLISH-TIME fact —
// build identity, data revision and build timestamp. Assemble-time facts
// (`BASE_VERSION`, `PATCH_REV`) are deliberately NOT restamped: they come
// from the logic bundle this run built onto and cannot change mid-run
// (D-L4/D-L6).
//
// It keys on the CONSTANT NAME (`var NAME = '...'`), not on whatever
// literal assemble happened to bake, so it succeeds regardless of what the
// bundle currently says — the previous implementation had to read the baked
// value back out first and could only replace that exact string.
//
// Call this on the working file, after the deck/card save and BEFORE the
// bundle's hash is computed and `publish()` runs, on every single run — not
// just the first. Returns `{restamped, missing}`: the constant names it
// actually rewrote, and any it was asked to rewrite but could not find (an
// older companion predating that constant — reported, not fatal, since the
// active logic bundle is not re-assembled by a publish).
const RESTAMPABLE = ["BUILD_ID", "DATA_VERSION", "BUILT_AT"];

export function restampCompanionConstants(bundlePath, values) {
  let text = fs.readFileSync(bundlePath, "utf8");
  const restamped = [];
  const missing = [];
  let dirty = false;
  for (const name of RESTAMPABLE) {
    const value = values[name];
    if (value === undefined || value === null) continue;
    // Non-global: the companion is appended once, so the first (and only)
    // `var NAME = '...'` declaration is the one to rewrite.
    const re = new RegExp(`(var\\s+${name}\\s*=\\s*')[^']*(')`);
    if (!re.test(text)) {
      missing.push(name);
      continue;
    }
    text = text.replace(re, (_m, head, tail) => `${head}${String(value)}${tail}`);
    restamped.push(name);
    dirty = true;
  }
  if (dirty) fs.writeFileSync(bundlePath, text, "utf8");
  return { restamped, missing };
}

function sha256(bytes) {
  return crypto.createHash("sha256").update(bytes).digest("hex");
}

// A buildId is permanent identity. Reusing one for different bytes would make
// the device keep a stale bundle forever: it compares ids, not hashes (D26).
// Returns `{ reused: true }` if the existing file is byte-identical; throws if
// the buildId already exists with different content; returns
// `{ reused: false }` if no file exists yet at `destPath`.
export function checkReuse(destPath, newBytes) {
  if (!fs.existsSync(destPath)) {
    return { reused: false };
  }
  const existingSha = sha256(fs.readFileSync(destPath));
  const newSha = sha256(newBytes);
  if (existingSha !== newSha) {
    throw new Error(
      `refusing: buildId already exists with DIFFERENT content.\n` +
        `          on disk ${existingSha}\n` +
        `          new     ${newSha}\n` +
        `          buildIds are permanent (D26). Use a new one.`
    );
  }
  return { reused: true };
}

function checkPublicBaseHttps(publicBase, { allowHttp = false } = {}) {
  if (publicBase.startsWith("https://")) return;
  if (publicBase.startsWith("http://") && allowHttp) return;
  throw new Error(`refusing: publicBase must be https (D53) — got '${publicBase}'`);
}

// Writes `data/ota/bundle/<buildId>.js` and repoints `data/ota/current.json`.
// Mirrors ota-publish.sh exactly: same guards, same atomic-write convention
// (write to .tmp, rename over the target — a partial file is never
// addressable). Rollback is calling this again with an older buildId whose
// bundle is still on disk (D26) — there is no ordering anywhere in the system.
export function publish(bundlePath, buildId, label, opts = {}) {
  const {
    dataDir = "data",
    publicBase = process.env.TUN_PUBLIC_BASE,
    allowHttp = process.env.ALLOW_HTTP === "1",
    allowNoCompanion = process.env.ALLOW_NO_COMPANION === "1",
  } = opts;

  if (!publicBase) {
    throw new Error("refusing: publicBase is required (set TUN_PUBLIC_BASE)");
  }
  validateBuildId(buildId);
  checkPublicBaseHttps(publicBase, { allowHttp });

  if (!fs.existsSync(bundlePath)) {
    throw new Error(`no such file: ${bundlePath}`);
  }
  const bytes = fs.readFileSync(bundlePath);

  const size = bytes.length;
  if (size === 0) throw new Error("refusing: empty bundle");
  if (size > MAX_BUNDLE_SIZE) throw new Error(`refusing: bundle > 64 MiB, native rejects it (D48)`);

  checkMagicPrefix(bytes);
  checkCompanionMatch(bytes, buildId, { allowNoCompanion });

  const bundleDir = path.join(dataDir, "ota", "bundle");
  const blobDir = path.join(dataDir, "blob");
  fs.mkdirSync(bundleDir, { recursive: true });
  fs.mkdirSync(blobDir, { recursive: true });

  const destPath = path.join(bundleDir, `${buildId}.js`);
  const { reused } = checkReuse(destPath, bytes);
  const sha = sha256(bytes);

  if (!reused) {
    const tmpPath = `${destPath}.tmp`;
    fs.writeFileSync(tmpPath, bytes);
    fs.renameSync(tmpPath, destPath);
  }

  const resolvedLabel = label || buildId;
  const url = `${publicBase}/ota/bundle/${buildId}.js`;
  const current = {
    schema: 1,
    buildId,
    url,
    sha256: sha,
    size,
    label: resolvedLabel,
  };
  const currentPath = path.join(dataDir, "ota", "current.json");
  const currentTmpPath = `${currentPath}.tmp`;
  fs.writeFileSync(currentTmpPath, JSON.stringify(current, null, 2) + "\n");
  fs.renameSync(currentTmpPath, currentPath);

  return { buildId, size, sha256: sha, url, label: resolvedLabel, reused };
}
