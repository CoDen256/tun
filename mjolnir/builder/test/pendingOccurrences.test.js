import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { drainPendingOccurrences, queuePendingOccurrence, pendingByTier } from "../src/pendingOccurrences.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("pendingOccurrences: D-F2 drains in deterministic insertion order", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE card_slots, decks, pending_occurrences CASCADE");
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C20', 'Substantiv', 'C')");
  for (const id of ["C20001", "C20002", "C20003"]) {
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C20', $2, $3)", [
      id,
      Number(id.slice(-3)),
      `note-${id}`,
    ]);
  }

  t.after(async () => {
    await closePool();
  });

  await t.test("multiple rows crossing zero in the same run drain in ascending id (insertion) order", async () => {
    // Queued in this order: C20002 first, then C20001, then C20003 —
    // insertion order is what `id ASC` must preserve, not card id order or
    // any other incidental ordering.
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20002", letter: "E", remaining: 2 });
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20001", letter: "E", remaining: 2 });
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20003", letter: "E", remaining: 2 });

    const drained = await drainPendingOccurrences(pool, "C20", 2);
    assert.deepEqual(
      drained.map((d) => d.cardId),
      ["C20002", "C20001", "C20003"],
      "drain order must match insertion order, regardless of card id order"
    );

    const { rows } = await pool.query("SELECT count(*) FROM pending_occurrences WHERE deck_code = 'C20'");
    assert.equal(Number(rows[0].count), 0, "every drained row must be deleted");
  });

  await t.test("rows that haven't crossed zero are excluded and left in place", async () => {
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20001", letter: "E", remaining: 11 });
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20002", letter: "E", remaining: 2 });

    const drained = await drainPendingOccurrences(pool, "C20", 2);
    assert.deepEqual(drained.map((d) => d.cardId), ["C20002"]);

    const { rows } = await pool.query("SELECT card_id, remaining FROM pending_occurrences WHERE deck_code = 'C20'");
    assert.deepEqual(rows, [{ card_id: "C20001", remaining: 9 }]);
  });

  // card-flow-view: the full per-remaining-value breakdown — groups with
  // ties stay together, groups are ordered ascending by `remaining`, and a
  // card with no `card_content` row degrades to empty note text instead of
  // being dropped (same tolerance `batchHistory.js`'s `stripHtml` already
  // has for every other occurrence listing).
  await t.test("pendingByTier groups by remaining, ascending, ties kept together, missing note text degrades to empty string", async () => {
    await pool.query("TRUNCATE pending_occurrences");
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20002", letter: "E", remaining: 7 });
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20001", letter: "E", remaining: 2 });
    await queuePendingOccurrence(pool, { deckCode: "C20", cardId: "C20003", letter: "E", remaining: 2 });

    const byDeck = await pendingByTier(pool);
    const tiers = byDeck.get("C20");
    assert.deepEqual(
      tiers.map((t) => t.remaining),
      [2, 7],
      "ascending by remaining, ties collapsed into one group"
    );
    assert.deepEqual(
      tiers[0].cards.map((c) => c.cardId),
      ["C20001", "C20003"],
      "insertion order preserved within a tied tier"
    );
    assert.ok(
      tiers.every((t) => t.cards.every((c) => c.noteText === "")),
      "no card_content row for these cards — degrades to empty string, not null/undefined"
    );
  });
});
