import fs from "node:fs";

// Metadata only — no file read — for display surfaces (the forecast page's
// "publishing onto" banner) that need to show what `builder` would build
// from without paying for reading the bundle's bytes off disk. Returns
// `null` rather than throwing when nothing is active yet, since "no active
// logic bundle" is a normal, displayable state here, unlike `loadActive`
// below (which a real publish attempt should fail loudly on).
export async function getActiveMeta(pool) {
  const { rows } = await pool.query(
    "SELECT id, base_version, patch_rev, label, bundle_sha, created_at FROM logic_bundles WHERE active LIMIT 1"
  );
  if (rows.length === 0) return null;
  const row = rows[0];
  return {
    id: row.id,
    baseVersion: row.base_version,
    patchRev: row.patch_rev,
    label: row.label,
    bundleSha: row.bundle_sha,
    createdAt: row.created_at,
  };
}

// D-L4: every run starts fresh from whichever `logic_bundles` row is
// active — read-only, never mutated in place (its file is immutable once
// written, D-L1). Mirrors `hub/src/logicBundles.js`'s `getActive()` using
// builder's own `pool`, the same duplication pattern as `publications.js`/
// `mint.js` (two processes, one database, D-P3).
export async function loadActive(pool) {
  const { rows } = await pool.query("SELECT * FROM logic_bundles WHERE active LIMIT 1");
  if (rows.length === 0) {
    throw new Error(
      "no active logic bundle — submit one and mark it active via hub's OTA console before publishing (D-L1)"
    );
  }
  const row = rows[0];
  return {
    id: row.id,
    baseVersion: row.base_version,
    patchRev: row.patch_rev,
    filePath: row.file_path,
    bundleSha: row.bundle_sha,
    bytes: fs.readFileSync(row.file_path),
  };
}
