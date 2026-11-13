import fs from "node:fs";
import path from "node:path";

// D110: companions (`bundle-tool companion`'s append-only snippets) and
// patchback-style replace-pairs (`bundle-tool patch-back`'s baseline/edited
// file pairs) both live under the same `patches/js/` directory in this
// repo's own convention (`patches/README.md`) — distinguished here by
// filename, not a separate directory: a `.baseline.js`/`.edited.js` pair
// member is source material for a REPLACE patch, never a standalone
// appendable script, so it's excluded from this listing.
export const DEFAULT_COMPANIONS_DIR = "patches/js";

function isPatchPairMember(filename) {
  return /\.(baseline|edited)\.js$/.test(filename);
}

// `{name, path}[]`, sorted — every `.js` file in `companionsDir` that isn't
// a replace-patch pair member. Returns `[]` (not an error) for a missing
// directory, matching `listPatches`'s own tolerance.
export function listCompanions(companionsDir) {
  if (!fs.existsSync(companionsDir)) return [];
  return fs
    .readdirSync(companionsDir)
    .filter((f) => f.endsWith(".js") && !isPatchPairMember(f))
    .sort()
    .map((f) => ({ name: f.replace(/\.js$/, ""), path: path.join(companionsDir, f) }));
}
