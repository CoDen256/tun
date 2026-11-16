// D91 (supersedes D87/D88): word/expression's `E` occurrence isn't appended
// the run its card is minted — it's queued here until 11 other occurrences
// have landed in the same deck, across however many subsequent publishes
// that takes. Single-occurrence note types never touch this table.

import { stripHtml } from "./batchHistory.js";

export async function queuePendingOccurrence(pool, { deckCode, cardId, letter, remaining }) {
  await pool.query(
    "INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ($1, $2, $3, $4)",
    [deckCode, cardId, letter, remaining]
  );
}

// True if this card already has a queued row for `letter` — guards against
// double-queuing when the D86 recovery path recreates a card whose queue row
// may have already been written durably before an earlier run crashed.
export async function hasPendingOccurrence(pool, cardId, letter) {
  const { rows } = await pool.query("SELECT 1 FROM pending_occurrences WHERE card_id = $1 AND letter = $2", [
    cardId,
    letter,
  ]);
  return rows.length > 0;
}

// COMPUTES (never applies) this run's drain for `deckCode`: every pending
// row in the deck is decremented by `newACount` — the number of brand-new
// `A` occurrences just staged into that deck this run — and every row that
// would reach `remaining <= 0` drains, i.e. leaves the queue and becomes a
// staged-equivalent occurrence. A deck with `newACount` of 0 touches nothing
// (03-data-model.md: "a deck that gets zero new cards in a given publish
// leaves its queue untouched").
//
// flush-record-atomicity (D-FA1): this used to UPDATE and DELETE immediately,
// inside `flushDeck`, before anything recorded where those occurrences went.
// A run that died in the window destroyed them. The decrement and the
// deletes are now part of the single consumption transaction that also
// writes the publication row and the shipment rows, so a failed run leaves
// the queue at its pre-run countdown and the next run drains it again.
//
// `decrementIds` is an explicit ID LIST, not `WHERE deck_code = $1`: by the
// time the transaction applies it, this run's own freshly-queued rows are
// already in the table (mint-time inserts stay immediate), and a card's
// just-queued E must never be decremented by the very batch of A's that
// created it (03-data-model.md's worked example).
//
// D-F2: ORDER BY id ASC (insertion order) — without it, when more than one
// row crosses zero in the same run, the order they're appended to `Cards[]`
// is whatever Postgres's physical storage happens to return, not
// reproducible and not necessarily oldest-first. The row queued longest ago
// must always drain first.
export async function drainPendingOccurrences(pool, deckCode, newACount) {
  if (newACount <= 0) return { decrementIds: [], amount: 0, drained: [] };
  const { rows } = await pool.query(
    "SELECT id, card_id, letter, remaining FROM pending_occurrences WHERE deck_code = $1 ORDER BY id ASC",
    [deckCode]
  );
  return {
    decrementIds: rows.map((r) => r.id),
    amount: newACount,
    drained: rows
      .filter((r) => r.remaining - newACount <= 0)
      .map((r) => ({ pendingId: r.id, cardId: r.card_id, letter: r.letter })),
  };
}

// Forecast UI (task 6.2.8): per-deck queue depth and the oldest row's
// `remaining` count — "C20 has 40 E's queued, oldest one has 3 to go".
export async function pendingQueueDepths(pool) {
  const { rows } = await pool.query(
    "SELECT deck_code, count(*) AS depth, min(remaining) AS oldest_remaining FROM pending_occurrences GROUP BY deck_code"
  );
  return new Map(
    rows.map((r) => [r.deck_code, { depth: Number(r.depth), oldestRemaining: Number(r.oldest_remaining) }])
  );
}

// card-flow-view (D-F2's own ordering extended to a full breakdown, not just
// depth + oldest): every deck's pending occurrences grouped by their current
// `remaining` value — "C30 has 10 E's at +7 away, 1 at +1 away" — not a flat
// count, so the UI can render real drain tiers instead of implying a single
// FIFO queue. Each group's card list carries source note text (same
// `card_content`/`stripHtml` tolerance as batchHistory.js's occurrence rows)
// for the ship-order strip's hover detail; a card with no resolvable note
// text still appears, with an empty string rather than being dropped.
export async function pendingByTier(pool) {
  const { rows } = await pool.query(
    `SELECT po.deck_code, po.remaining, po.card_id, po.letter, cc.n
     FROM pending_occurrences po
     LEFT JOIN card_content cc ON cc.card_id = po.card_id
     ORDER BY po.deck_code, po.remaining ASC, po.id ASC`
  );
  const byDeck = new Map();
  for (const r of rows) {
    if (!byDeck.has(r.deck_code)) byDeck.set(r.deck_code, new Map());
    const tiers = byDeck.get(r.deck_code);
    if (!tiers.has(r.remaining)) tiers.set(r.remaining, []);
    tiers.get(r.remaining).push({ cardId: r.card_id, letter: r.letter, noteText: stripHtml(r.n) });
  }
  return new Map(
    [...byDeck.entries()].map(([deckCode, tiers]) => [
      deckCode,
      [...tiers.entries()].sort((a, b) => a[0] - b[0]).map(([remaining, cards]) => ({ remaining, cards })),
    ])
  );
}
