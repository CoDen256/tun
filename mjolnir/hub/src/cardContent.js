import { query } from "./db.js";

// D-L3: each card's last-known-good rendered N/E/X/A, written at mint and
// refreshed on every regeneration while the source note is still returned
// by stabbur's pull; left untouched once the note is tombstoned — nothing
// special to code for, a tombstoned note simply never reappears in a future
// pull, so its row is never written again after its last live projection.

export async function upsert(cardId, { n, e, x, a }) {
  await query(
    `INSERT INTO card_content (card_id, n, e, x, a, updated_at)
     VALUES ($1, $2, $3, $4, $5, now())
     ON CONFLICT (card_id) DO UPDATE SET n = $2, e = $3, x = $4, a = $5, updated_at = now()`,
    [cardId, n ?? null, e ?? null, x ?? null, a]
  );
}

export async function get(cardId) {
  const { rows } = await query("SELECT n, e, x, a FROM card_content WHERE card_id = $1", [cardId]);
  if (rows.length === 0) return null;
  return { N: rows[0].n, E: rows[0].e, X: rows[0].x, A: rows[0].a };
}

// Keyed by card id, for the replay step (`builder/src/replay.js`) and the
// Cards page, which otherwise read content out of the now-removed bundle
// file.
export async function getAll() {
  const { rows } = await query("SELECT card_id, n, e, x, a FROM card_content");
  return new Map(rows.map((r) => [r.card_id, { N: r.n, E: r.e, X: r.x, A: r.a }]));
}
