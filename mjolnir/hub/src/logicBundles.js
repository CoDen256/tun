import { getPool, query } from "./db.js";

// D-L1: the operator-managed, versioned store of assembled base+patch JS
// bundles. Exactly one row is ever `active` — that's what `builder` builds
// onto every run (`builder/src/logicBundle.js`'s `loadActive`). Replaces the
// single mutable `BUNDLE_PATH` file this change removes entirely.

export async function create({ baseVersion, patchRev, filePath, bundleSha, label }) {
  const { rows } = await query(
    `INSERT INTO logic_bundles (base_version, patch_rev, file_path, bundle_sha, label)
     VALUES ($1, $2, $3, $4, $5) RETURNING *`,
    [baseVersion, patchRev, filePath, bundleSha, label ?? null]
  );
  return rows[0];
}

export async function list() {
  const { rows } = await query("SELECT * FROM logic_bundles ORDER BY created_at DESC");
  return rows;
}

export async function get(id) {
  const { rows } = await query("SELECT * FROM logic_bundles WHERE id = $1", [id]);
  return rows[0] ?? null;
}

export async function getActive() {
  const { rows } = await query("SELECT * FROM logic_bundles WHERE active LIMIT 1");
  return rows[0] ?? null;
}

// D-L1: clears every other row's `active` flag in the same transaction, so
// no reader ever observes zero or two active rows at once — the "activate"
// transaction is symmetric with "deactivate the rest," per design.md's
// stated reasoning for why this is app-layer-enforced rather than a partial
// unique index.
export async function activate(id) {
  const client = await getPool().connect();
  try {
    await client.query("BEGIN");
    const { rows } = await client.query("SELECT id FROM logic_bundles WHERE id = $1 FOR UPDATE", [id]);
    if (rows.length === 0) throw new Error(`no such logic bundle "${id}"`);
    await client.query("UPDATE logic_bundles SET active = FALSE WHERE active");
    await client.query("UPDATE logic_bundles SET active = TRUE WHERE id = $1", [id]);
    await client.query("COMMIT");
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

// D-L2: one global counter, never reset by a base change — scanned for the
// max rather than kept as a stored running counter, same "correct even with
// gaps" reasoning as `builder/src/buildId.js`'s `nextBuildId`.
export async function nextPatchRev() {
  const { rows } = await query("SELECT COALESCE(MAX(patch_rev), 0) AS max_rev FROM logic_bundles");
  return Number(rows[0].max_rev) + 1;
}
