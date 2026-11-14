// D-L6: base_version/patch_rev are no longer copied forward from the
// previous publication — they're read off the active `logic_bundles` row at
// publish time instead (closing the gap: no code path ever actually bumped
// them under the old "copy forward" rule). `previousVersions` now exists
// only for `data_rev`, which `builder` still bumps automatically on every
// publish that runs (it only ever publishes because there's new/changed
// content, so every publish is by definition a new data_rev).
export async function previousVersions(pool) {
  const { rows } = await pool.query("SELECT data_rev FROM publications ORDER BY created_at DESC LIMIT 1");
  if (rows.length === 0) return { dataRev: 0 };
  return { dataRev: rows[0].data_rev };
}

export async function writePublication(pool, { buildId, baseVersion, patchRev, dataRev, bundleSha, logicBundleId }) {
  await pool.query(
    `INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha, logic_bundle_id)
     VALUES ($1, $2, $3, $4, $5, $6)`,
    [buildId, baseVersion, patchRev, dataRev, bundleSha, logicBundleId ?? null]
  );
}
