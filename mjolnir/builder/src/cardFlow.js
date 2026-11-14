// builder-card-flow-ui: read-only queries backing the operator's per-deck
// card-flow view (design.md's "Decisions" — absolute totals and real
// Cards[] order computed from existing tables, never a second source of
// truth, never the published bundle file). Nothing here writes anything —
// mint/stage/drain/flush/publish are entirely unaffected.

import { occurrencesPerCardForDeck } from "./deckFamilies.js";
import { stripHtml } from "./batchHistory.js";

// design.md's Risk 2 mitigation: a deck's next flush target is always the
// smallest multiple of 5 STRICTLY GREATER than its current shipped count —
// `floor(shipped / 5) * 5 + 5` — even when `shipped` is itself already a
// multiple of 5 (the "4 staged toward 40" case, not "toward 35" again).
export function nextMultipleOf5(shipped) {
  return Math.floor(shipped / 5) * 5 + 5;
}

// Cards minted / shipped / staged — one cheap COUNT(*) per table, grouped by
// deck, per design.md's "compute from existing tables, not a new
// materialized summary" decision. "Occurrences eventual" is derived here
// from each deck's family occurrence shape, never stored.
export async function deckTotals(pool) {
  const [minted, shipped, staged] = await Promise.all([
    pool.query("SELECT deck_code, count(*) AS count FROM card_slots GROUP BY deck_code"),
    pool.query(
      "SELECT cs.deck_code, count(*) AS count FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id GROUP BY cs.deck_code"
    ),
    pool.query("SELECT deck_code, count(*) AS count FROM staged_occurrences GROUP BY deck_code"),
  ]);
  const mintedByDeck = new Map(minted.rows.map((r) => [r.deck_code, Number(r.count)]));
  const shippedByDeck = new Map(shipped.rows.map((r) => [r.deck_code, Number(r.count)]));
  const stagedByDeck = new Map(staged.rows.map((r) => [r.deck_code, Number(r.count)]));
  const deckCodes = new Set([...mintedByDeck.keys(), ...shippedByDeck.keys(), ...stagedByDeck.keys()]);

  const result = new Map();
  for (const deckCode of deckCodes) {
    const mintedCount = mintedByDeck.get(deckCode) || 0;
    const perCard = occurrencesPerCardForDeck(deckCode);
    result.set(deckCode, {
      mintedCount,
      occurrencesEventual: perCard === null ? null : mintedCount * perCard,
      shippedCount: shippedByDeck.get(deckCode) || 0,
      stagedCount: stagedByDeck.get(deckCode) || 0,
    });
  }
  return result;
}

// "On grid" iff the deck's shipped total is itself a multiple of 5 — a deck
// can have any number of pending/staged occurrences and still be on grid,
// since those haven't shipped yet. "Stalled" decks report how long it's been
// since their most recent shipment, not since they went off-grid (that
// moment isn't recorded anywhere; the last shipment is the closest durable
// signal of "nothing has moved").
export async function gridStatusForDeck(pool, deckCode, shippedCount) {
  if (shippedCount % 5 === 0) return { onGrid: true, stalledDays: null };
  const { rows } = await pool.query(
    `SELECT max(os.shipped_at) AS last_shipped_at
     FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id
     WHERE cs.deck_code = $1`,
    [deckCode]
  );
  const lastShippedAt = rows[0].last_shipped_at;
  const stalledDays = lastShippedAt
    ? Math.max(0, Math.floor((Date.now() - new Date(lastShippedAt).getTime()) / 86400000))
    : null;
  return { onGrid: false, stalledDays };
}

// A deck's real `Cards[]` order so far: shipped (occurrence_shipments, id
// ASC) then staged (staged_occurrences, id ASC) — the exact sequence that
// lands in Cards[] once the open slot(s) fill (design.md's "Resolve real
// Cards[] order" decision). `open` is clamped at 0; a negative raw value
// (design.md's Risk 2 — shouldn't happen under correct flush logic) is
// logged, not thrown, since this is a read-only view.
export async function shipOrderForDeck(pool, deckCode) {
  const [{ rows: shippedRows }, { rows: stagedRows }] = await Promise.all([
    pool.query(
      `SELECT os.card_id, os.letter, cc.n
       FROM occurrence_shipments os
       JOIN card_slots cs ON cs.id = os.card_id
       LEFT JOIN card_content cc ON cc.card_id = os.card_id
       WHERE cs.deck_code = $1
       ORDER BY os.id ASC`,
      [deckCode]
    ),
    pool.query(
      `SELECT so.card_id, so.letter, cc.n
       FROM staged_occurrences so
       LEFT JOIN card_content cc ON cc.card_id = so.card_id
       WHERE so.deck_code = $1
       ORDER BY so.id ASC`,
      [deckCode]
    ),
  ]);
  const toEntry = (r) => ({ cardId: r.card_id, letter: r.letter, noteText: stripHtml(r.n) });
  const shipped = shippedRows.map(toEntry);
  const staged = stagedRows.map(toEntry);

  const rawOpen = nextMultipleOf5(shipped.length) - (shipped.length + staged.length);
  if (rawOpen < 0) {
    console.error(
      `card-flow: ${deckCode} open-slot count computed negative (shipped=${shipped.length}, staged=${staged.length}) — data-integrity signal, not a crash`
    );
  }
  return { shipped, staged, open: Math.max(0, rawOpen) };
}
