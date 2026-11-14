// D93/D-H2: every card ever minted, joined with its per-side shipment/queue
// status. Search/filter/group happen in JS over this one already-joined
// shape — the operator's filter vocabulary ("a side pending") maps directly
// onto it, not onto a SQL WHERE clause that would need to re-derive
// occurrence semantics itself.
export async function cardsList(pool, { search = "", deckCode = "", statusFilter = "" } = {}) {
  const { rows: slots } = await pool.query(
    `SELECT cs.id, cs.deck_code, cs.note_id, cs.grammar_rule_id, cs.audio_sha256, d.title AS deck_title
     FROM card_slots cs JOIN decks d ON d.code = cs.deck_code
     ORDER BY cs.id`
  );
  if (slots.length === 0) return [];

  const cardIds = slots.map((s) => s.id);
  const { rows: shipped } = await pool.query(
    "SELECT card_id, letter, build_id FROM occurrence_shipments WHERE card_id = ANY($1) ORDER BY shipped_at ASC",
    [cardIds]
  );
  const { rows: pending } = await pool.query(
    "SELECT card_id, letter, remaining FROM pending_occurrences WHERE card_id = ANY($1)",
    [cardIds]
  );
  // D-L3: content now lives in `card_content` — durable DB state, frozen
  // once a note is tombstoned — not the (removed) persistent bundle file.
  // x/a included alongside n/e so the Cards page's inline card-preview
  // (card-preview capability) has every field it needs with no per-card
  // round trip.
  const { rows: contentRows } = await pool.query("SELECT card_id, n, e, x, a FROM card_content WHERE card_id = ANY($1)", [
    cardIds,
  ]);

  const shippedByCard = new Map();
  for (const row of shipped) {
    if (!shippedByCard.has(row.card_id)) shippedByCard.set(row.card_id, []);
    shippedByCard.get(row.card_id).push({ letter: row.letter, buildId: row.build_id, status: "shipped" });
  }
  const pendingByCard = new Map();
  for (const row of pending) {
    if (!pendingByCard.has(row.card_id)) pendingByCard.set(row.card_id, []);
    pendingByCard.get(row.card_id).push({ letter: row.letter, remaining: row.remaining, status: "pending" });
  }

  const contentByCard = new Map(contentRows.map((r) => [r.card_id, r]));

  let cards = slots.map((s) => {
    const content = contentByCard.get(s.id);
    return {
      id: s.id,
      deckCode: s.deck_code,
      deckTitle: s.deck_title,
      noteId: s.note_id,
      grammarRuleId: s.grammar_rule_id,
      audioSha256: s.audio_sha256,
      N: content?.n ?? "",
      E: content?.e ?? "",
      X: content?.x ?? "",
      A: content?.a ?? "N",
      sides: [...(shippedByCard.get(s.id) || []), ...(pendingByCard.get(s.id) || [])],
    };
  });

  if (deckCode) cards = cards.filter((c) => c.deckCode === deckCode);
  if (statusFilter === "pending") cards = cards.filter((c) => c.sides.some((s) => s.status === "pending"));
  if (statusFilter === "shipped") cards = cards.filter((c) => c.sides.length > 0 && c.sides.every((s) => s.status === "shipped"));
  if (search) {
    const q = search.toLowerCase();
    cards = cards.filter(
      (c) => c.N.toLowerCase().includes(q) || c.E.toLowerCase().includes(q) || c.id.toLowerCase().includes(q)
    );
  }

  return cards;
}

// Strips the N/E HTML projector.js wraps content in, down to plain text —
// this page is a dense operator table, not the device's own card renderer.
export function stripHtml(html) {
  return String(html).replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
}

// `card-preview` needs the card's own audio sha (for the blob-cache lookup)
// alongside everything `cardContent.get` already returns — a single small
// lookup, not folded into `cardsList` since only the preview page needs it.
export async function getCardSlot(pool, cardId) {
  const { rows } = await pool.query(
    "SELECT cs.id, cs.deck_code, cs.note_id, cs.audio_sha256, d.title AS deck_title FROM card_slots cs JOIN decks d ON d.code = cs.deck_code WHERE cs.id = $1",
    [cardId]
  );
  return rows[0] || null;
}
