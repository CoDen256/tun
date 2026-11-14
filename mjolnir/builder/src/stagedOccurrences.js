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

// Pops the oldest staged rows for `deckCode` (FIFO by `id`, same ordering
// reasoning as pendingOccurrences.js's D-F2) and deletes them, flushing
// exactly enough to bring the deck's TOTAL occurrence count (`alreadyShipped`
// + staged) to the next multiple of 5 — NOT `floor(stagedCount / 5) * 5` in
// isolation. A deck that was already off the 5-grid before this mechanism
// existed (every real deck prior to builder-sliding-window-shipping) would
// otherwise never self-correct: `83 (irregular) + floor(5/5)*5 = 88`, still
// irregular forever, since adding multiples of 5 to a non-multiple never
// lands back on the grid. Computing the target against the deck's real
// current total — not just what's sitting in the staging buffer — is what
// actually fixes `Cards.length % 5 !== 0` for pre-existing decks, not just
// decks created after this fix shipped. Returns an empty array — a no-op,
// the caller logs "not enough yet" — when nothing would move the deck
// forward to its next multiple of 5.
export async function flushShippable(pool, deckCode, alreadyShipped) {
  const staged = await stagedCount(pool, deckCode);
  const target = Math.floor((alreadyShipped + staged) / 5) * 5;
  const shipCount = Math.max(0, Math.min(staged, target - alreadyShipped));
  if (shipCount === 0) return [];

  const { rows } = await pool.query(
    "SELECT id, card_id, letter FROM staged_occurrences WHERE deck_code = $1 ORDER BY id ASC LIMIT $2",
    [deckCode, shipCount]
  );
  await pool.query("DELETE FROM staged_occurrences WHERE id = ANY($1)", [rows.map((r) => r.id)]);
  return rows.map((r) => ({ cardId: r.card_id, letter: r.letter }));
}
