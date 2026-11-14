import fs from "node:fs";
import path from "node:path";
import { query } from "./db.js";

// Task 3.4/6.2: all the UI needs, plus how many occurrences each build
// actually shipped (D93) for the history table's "Cards" column.
export async function listPublications() {
  const { rows } = await query(
    `SELECT p.build_id, p.base_version, p.patch_rev, p.data_rev, p.bundle_sha, p.label, p.created_at,
            COUNT(DISTINCT os.card_id) AS card_count
     FROM publications p
     LEFT JOIN occurrence_shipments os ON os.build_id = p.build_id
     GROUP BY p.build_id, p.base_version, p.patch_rev, p.data_rev, p.bundle_sha, p.label, p.created_at
     ORDER BY p.created_at DESC`
  );
  return rows.map((r) => ({ ...r, card_count: Number(r.card_count) }));
}

// D-H5/task 6.1: the OTA console is a third caller of the same guarded
// publish module builder already imports in-process — this just needs its
// own row in hub's own history, since this publish didn't go through
// builder's pipeline (which writes its own via builder/src/publications.js).
export async function previousVersions() {
  const { rows } = await query(
    "SELECT base_version, patch_rev, data_rev FROM publications ORDER BY created_at DESC LIMIT 1"
  );
  if (rows.length === 0) return { baseVersion: "0", patchRev: 0, dataRev: 0 };
  return { baseVersion: rows[0].base_version, patchRev: rows[0].patch_rev, dataRev: rows[0].data_rev };
}

export async function writePublication({ buildId, baseVersion, patchRev, dataRev, bundleSha, label }) {
  await query(
    `INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha, label)
     VALUES ($1, $2, $3, $4, $5, $6)`,
    [buildId, baseVersion, patchRev, dataRev, bundleSha, label]
  );
}

export async function updateLabel(buildId, label) {
  const { rowCount } = await query("UPDATE publications SET label = $1 WHERE build_id = $2", [label, buildId]);
  if (rowCount === 0) throw new Error(`no such build "${buildId}"`);
}

// Task 6.2: blocked while any occurrence shipment names this build (D93's
// append-only log would otherwise lose the only record of which build
// shipped those sides) or while it's the live `current.json` build —
// deleting the thing the device is actively fetching would be a self-
// inflicted outage, not a history cleanup.
export async function deleteBuild(buildId, { dataDir }) {
  const { rows } = await query("SELECT count(*) FROM occurrence_shipments WHERE build_id = $1", [buildId]);
  if (Number(rows[0].count) > 0) {
    throw new Error(`refusing: build "${buildId}" shipped ${rows[0].count} occurrence(s) — its history would be unrecoverable`);
  }
  const current = readCurrent(dataDir);
  if (current && current.buildId === buildId) {
    throw new Error(`refusing: "${buildId}" is the currently active build — set another build as current first`);
  }
  const { rowCount } = await query("DELETE FROM publications WHERE build_id = $1", [buildId]);
  if (rowCount === 0) throw new Error(`no such build "${buildId}"`);
}

export function readCurrent(dataDir) {
  try {
    return JSON.parse(fs.readFileSync(path.join(dataDir, "ota", "current.json"), "utf8"));
  } catch {
    return null;
  }
}
