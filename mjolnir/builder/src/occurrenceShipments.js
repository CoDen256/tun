// D93/D-H1: the per-occurrence shipment log — written once per occurrence at
// the moment it actually ships (mint-time for an immediate letter,
// drain-time for a queued one). `pipeline.js` buffers `(cardId, letter)`
// pairs through the whole run and calls `recordShipments` only after
// `publish()` succeeds — never speculatively, so a failed run never leaves a
// row naming a build that was never actually published.

export async function recordShipments(pool, shipments, buildId) {
  for (const { cardId, letter } of shipments) {
    await pool.query("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ($1, $2, $3)", [
      cardId,
      letter,
      buildId,
    ]);
  }
}

// Cards page (D-H2): every shipped occurrence for a set of card ids, most
// recent first.
export async function shipmentsForCards(pool, cardIds) {
  if (cardIds.length === 0) return new Map();
  const { rows } = await pool.query(
    "SELECT card_id, letter, build_id, shipped_at FROM occurrence_shipments WHERE card_id = ANY($1) ORDER BY shipped_at ASC",
    [cardIds]
  );
  const byCard = new Map();
  for (const row of rows) {
    if (!byCard.has(row.card_id)) byCard.set(row.card_id, []);
    byCard.get(row.card_id).push({ letter: row.letter, buildId: row.build_id, shippedAt: row.shipped_at });
  }
  return byCard;
}

// Batch history (D-H2): every occurrence a specific build actually shipped.
export async function shipmentsForBuild(pool, buildId) {
  const { rows } = await pool.query(
    "SELECT card_id, letter FROM occurrence_shipments WHERE build_id = $1 ORDER BY id ASC",
    [buildId]
  );
  return rows.map((r) => ({ cardId: r.card_id, letter: r.letter }));
}
