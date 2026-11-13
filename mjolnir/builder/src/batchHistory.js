// Exported for card-flow's ship-order/pending-tier hover text — same
// degrade-to-empty-string tolerance for a card with no resolvable note text.
export function stripHtml(html) {
  return String(html || "").replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
}

// D-H2: the one function both the Forecast page's past-batches panel and a
// batch's own expand-to-detail call — a past build's contents are a straight
// read of what it actually shipped (D93), never a recomputation. Content now
// comes from `card_content` (D-L3), not the removed persistent bundle file —
// a card's content is durable DB state independent of any bundle bytes.
export async function occurrencesForBuild(pool, buildId) {
  const { rows } = await pool.query(
    `SELECT os.card_id, os.letter, cs.deck_code, cs.note_id, cc.n
     FROM occurrence_shipments os
     JOIN card_slots cs ON cs.id = os.card_id
     LEFT JOIN card_content cc ON cc.card_id = os.card_id
     WHERE os.build_id = $1 ORDER BY os.id ASC`,
    [buildId]
  );
  return rows.map((r) => ({
    cardId: r.card_id,
    letter: r.letter,
    deckCode: r.deck_code,
    noteId: r.note_id,
    noteText: stripHtml(r.n),
    kind: "ship",
  }));
}

// Forecast page's "Past batches" panel: recent builds with a shipped-count
// summary ("3 A's, 2 E's") — one query, not N+1 per build.
export async function recentBatches(pool, limit = 10) {
  const { rows } = await pool.query(
    `SELECT p.build_id, p.created_at,
            COUNT(*) FILTER (WHERE os.letter != 'E') AS non_e_count,
            COUNT(*) FILTER (WHERE os.letter = 'E') AS e_count
     FROM publications p
     LEFT JOIN occurrence_shipments os ON os.build_id = p.build_id
     GROUP BY p.build_id, p.created_at
     ORDER BY p.created_at DESC
     LIMIT $1`,
    [limit]
  );
  return rows.map((r) => ({
    buildId: r.build_id,
    createdAt: r.created_at,
    nonECount: Number(r.non_e_count),
    eCount: Number(r.e_count),
  }));
}
