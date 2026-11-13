import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { deckTotals, nextMultipleOf5, gridStatusForDeck, shipOrderForDeck } from "../src/cardFlow.js";
import { stageOccurrence } from "../src/stagedOccurrences.js";
import { recordShipments } from "../src/occurrenceShipments.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("cardFlow: absolute totals, grid status, and real ship-order reconstruction", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, decks, staged_occurrences, occurrence_shipments, card_content CASCADE"
  );
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C30', 'Lexic', 'C')");
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C20', 'Practice', 'C')");

  t.after(async () => {
    await closePool();
  });

  await t.test("nextMultipleOf5 always returns the NEXT multiple, even when already on-grid", () => {
    assert.equal(nextMultipleOf5(0), 5);
    assert.equal(nextMultipleOf5(3), 5);
    assert.equal(nextMultipleOf5(35), 40, "already a multiple of 5 — the next one, not itself");
    assert.equal(nextMultipleOf5(83), 85, "pre-existing irregular total realigns to the next grid point");
  });

  await t.test("deckTotals counts cards minted / shipped / staged per deck and derives occurrences eventual", async () => {
    await pool.query("TRUNCATE card_slots, staged_occurrences, occurrence_shipments, publications CASCADE");
    for (let i = 1; i <= 3; i++) {
      const id = `C30${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [id, i, `note-${id}`]);
    }
    for (let i = 1; i <= 2; i++) {
      const id = `C20${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C20', $2, $3)", [id, i, `note-${id}`]);
    }
    await stageOccurrence(pool, { deckCode: "C30", cardId: "C30001", letter: "A" });
    await stageOccurrence(pool, { deckCode: "C30", cardId: "C30002", letter: "A" });
    await pool.query(
      "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b1', '1.0', 1, 1, 'sha')"
    );
    await recordShipments(pool, [{ cardId: "C20001", letter: "N" }], "b1");

    const totals = await deckTotals(pool);
    assert.deepEqual(totals.get("C30"), { mintedCount: 3, occurrencesEventual: 6, shippedCount: 0, stagedCount: 2 });
    assert.deepEqual(totals.get("C20"), { mintedCount: 2, occurrencesEventual: 2, shippedCount: 1, stagedCount: 0 });
  });

  await t.test("gridStatusForDeck: on-grid when shipped is a multiple of 5, stalled with elapsed days otherwise", async () => {
    const onGrid = await gridStatusForDeck(pool, "C30", 0);
    assert.deepEqual(onGrid, { onGrid: true, stalledDays: null });

    // C20001 was just shipped above (1 occurrence) — off-grid, stalled 0 days.
    const stalled = await gridStatusForDeck(pool, "C20", 1);
    assert.equal(stalled.onGrid, false);
    assert.equal(stalled.stalledDays, 0, "just shipped — 0 elapsed days, not null");
  });

  await t.test("shipOrderForDeck reconstructs shipped-then-staged order and clamps open at the next multiple of 5", async () => {
    await pool.query("TRUNCATE card_slots, staged_occurrences, occurrence_shipments, publications CASCADE");
    for (let i = 1; i <= 7; i++) {
      const id = `C30${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [id, i, `note-${id}`]);
    }
    await pool.query(
      "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b2', '1.0', 1, 1, 'sha')"
    );
    await recordShipments(
      pool,
      [
        { cardId: "C30001", letter: "A" },
        { cardId: "C30002", letter: "A" },
        { cardId: "C30003", letter: "A" },
      ],
      "b2"
    );
    await stageOccurrence(pool, { deckCode: "C30", cardId: "C30004", letter: "A" });

    const order = await shipOrderForDeck(pool, "C30");
    assert.deepEqual(
      order.shipped.map((o) => o.cardId),
      ["C30001", "C30002", "C30003"]
    );
    assert.deepEqual(
      order.staged.map((o) => o.cardId),
      ["C30004"]
    );
    // nextMultipleOf5(3) = 5; open = 5 - (3 + 1) = 1.
    assert.equal(order.open, 1);
    assert.equal(order.shipped[0].noteText, "", "no card_content row — degrades to empty string, never crashes");
  });
});
