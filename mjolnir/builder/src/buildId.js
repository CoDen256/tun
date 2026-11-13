// buildId stays the existing OTA identity, format `b` + 6 digits
// (03-data-model.md) — untouched by this change, just generated here instead
// of typed by hand. Scans existing ids for the max rather than counting rows,
// same reasoning as `nextCardId`: correct even with gaps.
export async function nextBuildId(pool) {
  const { rows } = await pool.query("SELECT build_id FROM publications WHERE build_id ~ '^b[0-9]{6}$'");
  let max = 0;
  for (const { build_id } of rows) {
    const n = Number.parseInt(build_id.slice(1), 10);
    if (n > max) max = n;
  }
  return `b${String(max + 1).padStart(6, "0")}`;
}
