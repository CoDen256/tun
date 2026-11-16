// D-L3: each card's last-known-good rendered N/E/X/A, written at mint and
// refreshed on every regeneration while the source note is still returned
// by stabbur's pull — the newly-minted loop and the already-minted regen
// loop in `pipeline.js` are the only two places this is ever called from,
// mirroring exactly where content is already projected today. Pool-based,
// like `mint.js`/`publications.js` — builder's own copy of the same table
// hub/src/cardContent.js also reads/writes, same duplication pattern as
// publications.js (two processes, one database, D-P3).
export async function upsert(pool, cardId, { N, E, X, A }) {
  await pool.query(
    `INSERT INTO card_content (card_id, n, e, x, a, updated_at)
     VALUES ($1, $2, $3, $4, $5, now())
     ON CONFLICT (card_id) DO UPDATE SET n = $2, e = $3, x = $4, a = $5, updated_at = now()`,
    [cardId, N ?? null, E ?? null, X ?? null, A]
  );
}

// Keyed by card id, for `replay.js` to reconstruct every already-shipped
// card's content without touching the (removed) persistent bundle file.
export async function getAll(pool) {
  const { rows } = await pool.query("SELECT card_id, n, e, x, a FROM card_content");
  return new Map(rows.map((r) => [r.card_id, { N: r.n, E: r.e, X: r.x, A: r.a }]));
}

// The four content faces, in the order every readout presents them.
export const CONTENT_FACES = ["N", "E", "X", "A"];

// D-C2: a card's content is a pure function of its note (`project()`), so
// "would this publish actually change it" is exactly a field-by-field
// equality check against what's already stored — no fuzzy diffing, no new
// schema. `existing` is `undefined` for a card with no stored row yet
// (shouldn't normally happen for an already-minted card, but treated as
// "changed" rather than crashing on it — every face counts as written).
//
// builder-ship-strips (D-SS4): the comparison now NAMES the faces that
// differ, because the strip's hover readout reports "E and X change this
// publish", not merely "something changes". `contentChanged` is derived
// from this one function rather than re-implementing the comparison beside
// it — two comparison paths is exactly how the boolean and the per-face
// readout would come to disagree.
export function changedFaces(existing, projected) {
  if (!existing) return [...CONTENT_FACES];
  return CONTENT_FACES.filter((face) => existing[face] !== projected[face]);
}

export function contentChanged(existing, projected) {
  return changedFaces(existing, projected).length > 0;
}
