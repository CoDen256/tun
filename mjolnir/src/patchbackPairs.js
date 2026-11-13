import fs from "node:fs";
import path from "node:path";

// D111: a third real mechanism alongside src/patches.js's JSON-store
// REPLACE patches and src/companions.js's APPEND companions — raw
// `<name>.baseline.js`/`<name>.edited.js` file pairs under `patches/js`
// (this repo's own `2176-my-account-build-id` is a live example), applied
// via the exact same reconciliation algorithm as JSON-store patches
// (`src/patches.js`'s `computePatchedModuleSource`, itself reusing
// `src/commands/patchback.js`'s `buildPatchedFactoryStatements`), the only
// difference being how the target module is found: a JSON-store patch
// carries a content locator (stable across bundle versions, no module id
// needed); a raw pair instead names its target module id directly in its
// own filename (`<moduleId>-<name>.baseline.js`) — a convention this repo
// already used for `bundle-tool patch-back`, but never listed or assembled
// anywhere beyond that one manual CLI invocation.
export const DEFAULT_PATCHBACK_DIR = "patches/js";

// Lists every baseline/edited pair in `dir` — a lone `.baseline.js` or
// `.edited.js` with no matching sibling is skipped (incomplete pair, not
// usable), not an error, since this is a read-only listing, not validation
// of the directory's contents as a whole.
export function listPatchbackPairs(dir) {
  if (!fs.existsSync(dir)) return [];
  const files = new Set(fs.readdirSync(dir));
  const pairs = [];
  for (const f of files) {
    if (!f.endsWith(".baseline.js")) continue;
    const name = f.slice(0, -".baseline.js".length);
    const editedFile = `${name}.edited.js`;
    if (!files.has(editedFile)) continue;
    const idMatch = name.match(/^(\d+)-/);
    pairs.push({
      name,
      moduleId: idMatch ? Number(idMatch[1]) : null,
      baselinePath: path.join(dir, f),
      editedPath: path.join(dir, editedFile),
    });
  }
  return pairs.sort((a, b) => a.name.localeCompare(b.name));
}

export function loadPatchbackPair(dir, name) {
  const pair = listPatchbackPairs(dir).find((p) => p.name === name);
  if (!pair) throw new Error(`no such patch-back pair: ${name}`);
  if (pair.moduleId === null) {
    throw new Error(
      `patch-back pair "${name}" has no leading "<module-id>-" in its filename — cannot locate a target module`
    );
  }
  return pair;
}
