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

  await t.test("shipOrderForDeck reconstructs shipped-then-staged order and opens to the next multiple of 5 above shipped+staged", async () => {
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
    // D-SS5: measured from shipped + staged — nextMultipleOf5(3 + 1) = 5,
    // open = 5 - 4 = 1.
    assert.equal(order.open, 1);
    assert.equal(order.shipped[0].noteText, "", "no card_content row — degrades to empty string, never crashes");
  });

  // builder-ship-strips D-SS5: the two cases the old expression got wrong.
  await t.test("shipOrderForDeck: staged occurrences that carry the deck past its next multiple of 5", async () => {
    await pool.query("TRUNCATE card_slots, staged_occurrences, occurrence_shipments, publications CASCADE");
    for (let i = 1; i <= 254; i++) {
      const id = `C30${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [id, i, `note-${id}`]);
    }
    await pool.query(
      "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b3', '1.0', 1, 1, 'sha')"
    );
    await recordShipments(
      pool,
      Array.from({ length: 245 }, (_, i) => ({ cardId: `C30${String(i + 1).padStart(3, "0")}`, letter: "A" })),
      "b3"
    );
    for (let i = 246; i <= 254; i++) {
      await stageOccurrence(pool, { deckCode: "C30", cardId: `C30${String(i).padStart(3, "0")}`, letter: "A" });
    }

    const order = await shipOrderForDeck(pool, "C30");
    assert.equal(order.shipped.length, 245);
    assert.equal(order.staged.length, 9);
    // 245 + 9 = 254; the real target is 255, so exactly ONE slot is open —
    // the old expression computed 250 - 254 = -4 and clamped it to 0.
    assert.equal(order.open, 1);
  });

  await t.test("shipOrderForDeck: a deck on the 5-grid with nothing staged awaits a whole batch", async () => {
    await pool.query("TRUNCATE card_slots, staged_occurrences, occurrence_shipments, publications CASCADE");
    for (let i = 1; i <= 5; i++) {
      const id = `C30${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [id, i, `note-${id}`]);
    }
    await pool.query(
      "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b4', '1.0', 1, 1, 'sha')"
    );
    await recordShipments(
      pool,
      Array.from({ length: 5 }, (_, i) => ({ cardId: `C30${String(i + 1).padStart(3, "0")}`, letter: "A" })),
      "b4"
    );

    const order = await shipOrderForDeck(pool, "C30");
    assert.equal(order.staged.length, 0);
    // SUPERSEDES the old `open === 0` expectation (card-flow-view's spec
    // scenario, corrected by this change): five more cards are awaited
    // before anything can ship, and reporting 0 asserted that nothing was.
    assert.equal(order.open, 5);
  });
});
