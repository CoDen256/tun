import fs from "node:fs";
import crypto from "node:crypto";

// D-L4 test helper: builder's pipeline now requires an active `logic_bundles`
// row to build onto (no more mutable `BUNDLE_PATH`) — every pipeline test
// seeds one from its fixture bundle file, exactly like an operator would via
// hub's OTA console (submit + activate), just inserted directly rather than
// through the HTTP layer these tests don't exercise.
export async function seedActiveLogicBundle(pool, bundlePath, { baseVersion = "1.5.12", patchRev = 1 } = {}) {
  const bytes = fs.readFileSync(bundlePath);
  const bundleSha = crypto.createHash("sha256").update(bytes).digest("hex");
  const { rows } = await pool.query(
    `INSERT INTO logic_bundles (base_version, patch_rev, file_path, bundle_sha, label, active)
     VALUES ($1, $2, $3, $4, $5, TRUE) RETURNING id`,
    [baseVersion, patchRev, bundlePath, bundleSha, "test fixture"]
  );
  return rows[0].id;
}
