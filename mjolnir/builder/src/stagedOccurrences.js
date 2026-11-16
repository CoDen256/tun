// builder-sliding-window-shipping (D-W1): occurrences that are eligible to
// ship (freshly staged `A`'s from newly-minted cards, `E`'s whose D91
// 11-countdown just drained) but not yet appended to a deck's Cards[] — a
// second, independent staging step that sits strictly after
// pendingOccurrences.js's own queue, not inside it. Only the largest
// multiple of 5 a deck currently holds here ever flushes in a given run
// (D-W2), guaranteeing the app's own `5 × PullCounter` draw-offset math
// (docs/findings.md) can never overshoot `Cards.length`.

export async function stageOccurrence(pool, { deckCode, cardId, letter }) {
  await pool.query(
    "INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ($1, $2, $3)",
    [deckCode, cardId, letter]
  );
}

export async function stagedCount(pool, deckCode) {
  const { rows } = await pool.query(
    "SELECT count(*) AS count FROM staged_occurrences WHERE deck_code = $1",
    [deckCode]
  );
  return Number(rows[0].count);
}

// Read-only — reports the current staged rows for `deckCode` in FIFO order
// (`id` ASC) without deleting anything. For the forecast's dry-run preview
// (D-P5's "one implementation, read-only, no row inserted" convention,
// extended here to staged rows too) — never called from the real flush
// path, which uses `flushShippable` below instead.
export async function peekStaged(pool, deckCode) {
  const { rows } = await pool.query(
    "SELECT card_id, letter FROM staged_occurrences WHERE deck_code = $1 ORDER BY id ASC",
    [deckCode]
  );
  return rows.map((r) => ({ cardId: r.card_id, letter: r.letter }));
}

// SELECTS the oldest staged rows for `deckCode` (FIFO by `id`, same
// ordering reasoning as pendingOccurrences.js's D-F2), enough to bring the
// deck's TOTAL occurrence count (`alreadyShipped` + staged) to the next
// multiple of 5 — NOT `floor(stagedCount / 5) * 5` in isolation. A deck that
// was already off the 5-grid before this mechanism existed (every real deck
// prior to builder-sliding-window-shipping) would otherwise never
// self-correct: `83 (irregular) + floor(5/5)*5 = 88`, still irregular
// forever, since adding multiples of 5 to a non-multiple never lands back on
// the grid. Computing the target against the deck's real current total — not
// just what's sitting in the staging buffer — is what actually fixes
// `Cards.length % 5 !== 0` for pre-existing decks.
//
// flush-record-atomicity (D-FA1): THIS FUNCTION NO LONGER DELETES ANYTHING.
// It used to pop-and-delete, which is precisely the defect — the rows were
// consumed durably inside `flushDeck`, long before `writePublication` and
// `recordShipments`, with no transaction spanning the gap, so a run that
// died in between destroyed occurrences that existed nowhere else (the
// in-memory model holding them is discarded by `runPublish`'s `finally`).
// It is now a read-only PLAN: the caller records the returned `stagedId`s in
// a consumption plan and deletes them inside the one transaction that also
// writes the publication row and the shipment rows.
//
// `extraStaged` are this run's drained-queue occurrences — "staged
// equivalents" that have NOT been written to `staged_occurrences` (their
// pending rows are deleted in the same deferred transaction). They sort
// after every real staged row, exactly where the old drain-then-stage order
// put them. Returns `{ shippable, held, stagedTotal }`; `held` entries that
// carry a `pendingId` are the ones the caller must insert as real staged
// rows inside the transaction.
export async function flushShippable(pool, deckCode, alreadyShipped, extraStaged = []) {
  const { rows } = await pool.query(
    "SELECT id, card_id, letter FROM staged_occurrences WHERE deck_code = $1 ORDER BY id ASC",
    [deckCode]
  );
  const all = [
    ...rows.map((r) => ({ stagedId: r.id, cardId: r.card_id, letter: r.letter })),
    ...extraStaged,
  ];
  const target = Math.floor((alreadyShipped + all.length) / 5) * 5;
  const shipCount = Math.max(0, Math.min(all.length, target - alreadyShipped));
  return { shippable: all.slice(0, shipCount), held: all.slice(shipCount), stagedTotal: all.length };
}

// flush-record-atomicity (D-FA3): the D86 recovery path re-stages a card's
// immediate occurrences when the card is missing from the rebuilt model. Now
// that a failed run no longer consumes its staged rows, that card's A is
// routinely ALREADY staged (or already shipped) from the run that died — and
// 019's unique index would turn a second insert into a hard failure. Asking
// first is the fix: an occurrence that is already accounted for is simply
// not staged again, and does not count toward the drain's decrement.
export async function hasOccurrence(pool, cardId, letter) {
  const { rows } = await pool.query(
    `SELECT 1 FROM staged_occurrences WHERE card_id = $1 AND letter = $2
     UNION ALL
     SELECT 1 FROM occurrence_shipments WHERE card_id = $1 AND letter = $2
     LIMIT 1`,
    [cardId, letter]
  );
  return rows.length > 0;
}
