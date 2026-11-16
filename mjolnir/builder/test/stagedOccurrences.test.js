import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { stageOccurrence, stagedCount, flushShippable, peekStaged } from "../src/stagedOccurrences.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

// flush-record-atomicity (D-FA1): `flushShippable` SELECTS, it no longer
// deletes — consumption is deferred into the run's one consumption
// transaction. These cases therefore assert the selection and then delete
// the selected ids themselves, exactly as `consumptionPlan.js` does, so
// "ships N, leaves M" still means the same thing end to end.
async function applyFlush(pool, shippable) {
  const ids = shippable.filter((s) => s.stagedId).map((s) => s.stagedId);
  if (ids.length > 0) await pool.query("DELETE FROM staged_occurrences WHERE id = ANY($1)", [ids]);
  return shippable;
}

describe("stagedOccurrences: D-W2 selects to the next multiple of 5 of the deck's REAL total, FIFO by insertion order", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE card_slots, decks, staged_occurrences CASCADE");
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C20', 'Substantiv', 'C')");
  for (let i = 1; i <= 20; i++) {
    const id = `C20${String(i).padStart(3, "0")}`;
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C20', $2, $3)", [
      id,
      i,
      `note-${id}`,
    ]);
  }

  t.after(async () => {
    await closePool();
  });

  await t.test("11 staged ships exactly 10 (the 10 oldest), leaves 1", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 11; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    assert.equal(await stagedCount(pool, "C20"), 11);

    const { shippable: shipped } = await flushShippable(pool, "C20", 0);
    await applyFlush(pool, shipped);
    assert.equal(shipped.length, 10);
    assert.deepEqual(
      shipped.map((s) => s.cardId),
      Array.from({ length: 10 }, (_, i) => `C20${String(i + 1).padStart(3, "0")}`),
      "the 10 oldest (by insertion order) ship, not an arbitrary 10"
    );
    assert.ok(shipped.every((s) => s.letter === "A"));

    assert.equal(await stagedCount(pool, "C20"), 1, "exactly 1 left behind");
    const remaining = await peekStaged(pool, "C20");
    assert.deepEqual(remaining, [{ cardId: "C20011", letter: "A" }]);
  });

  await t.test("9 staged ships 5, leaves 4", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 9; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }

    const { shippable: shipped } = await flushShippable(pool, "C20", 0);
    await applyFlush(pool, shipped);
    assert.equal(shipped.length, 5);
    assert.equal(await stagedCount(pool, "C20"), 4);
  });

  await t.test("4 staged ships 0, leaves all 4 untouched", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 4; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }

    const { shippable: shipped } = await flushShippable(pool, "C20", 0);
    await applyFlush(pool, shipped);
    assert.deepEqual(shipped, []);
    assert.equal(await stagedCount(pool, "C20"), 4, "nothing popped — a no-op, not a partial flush");
  });

  await t.test("FIFO order is respected across multiple staging calls spanning simulated 'runs'", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    // "Run 1": stage 2.
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20001", letter: "A" });
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20002", letter: "A" });
    assert.deepEqual((await flushShippable(pool, "C20", 0)).shippable, [], "2 staged, nothing flushes");

    // "Run 2": stage 2 more — 4 total, still short.
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20003", letter: "A" });
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20004", letter: "A" });
    assert.deepEqual((await flushShippable(pool, "C20", 0)).shippable, [], "4 staged, still short of 5");

    // "Run 3": stage 1 more, crossing 5 — the original 5, oldest-first, ship.
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20005", letter: "A" });
    const { shippable: shipped } = await flushShippable(pool, "C20", 0);
    await applyFlush(pool, shipped);
    assert.deepEqual(
      shipped.map((s) => s.cardId),
      ["C20001", "C20002", "C20003", "C20004", "C20005"],
      "ships in the order staged across all three simulated runs, not just the last one"
    );
    assert.equal(await stagedCount(pool, "C20"), 0);
  });

  await t.test("staging/flushing is scoped per deck — one deck's flush never touches another's staged rows", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    await pool.query("INSERT INTO decks (code, title, category) VALUES ('C21', 'Verb', 'C') ON CONFLICT DO NOTHING");
    for (let i = 1; i <= 3; i++) {
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C21', $2, $3) ON CONFLICT DO NOTHING", [
        `C21${String(i).padStart(3, "0")}`,
        i,
        `note-c21-${i}`,
      ]);
    }
    for (let i = 1; i <= 3; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    await stageOccurrence(pool, { deckCode: "C21", cardId: "C21001", letter: "A" });
    await stageOccurrence(pool, { deckCode: "C21", cardId: "C21002", letter: "A" });

    assert.deepEqual((await flushShippable(pool, "C21", 0)).shippable, [], "C21 has only 2, short of 5");
    assert.equal(await stagedCount(pool, "C20"), 3, "C20's rows must be untouched by C21's flush attempt");
  });

  await t.test("a deck already off the 5-grid (pre-existing irregular total) realigns onto it, not just flushes multiples on top", async () => {
    // Simulates a real deck that accumulated occurrences the OLD way before
    // this mechanism existed — 83 already shipped, an irregular total.
    // Staging 5 more must NOT just ship all 5 (83+5=88, still irregular) —
    // it must ship only enough to reach the next multiple of 5 (85),
    // holding the rest until more arrives.
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 5; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    const { shippable: shipped } = await flushShippable(pool, "C20", 83);
    await applyFlush(pool, shipped);
    assert.equal(shipped.length, 2, "83 + 2 = 85, the next multiple of 5 — only 2 of the 5 staged ship");
    assert.deepEqual(shipped.map((s) => s.cardId), ["C20001", "C20002"], "the 2 oldest ship");
    assert.equal(await stagedCount(pool, "C20"), 3, "the other 3 stay staged until more arrives");
  });

  await t.test("a deck already ON the 5-grid behaves exactly like the floor(staged/5)*5 case", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 11; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    const { shippable: shipped } = await flushShippable(pool, "C20", 50);
    await applyFlush(pool, shipped);
    assert.equal(shipped.length, 10, "50 is already a multiple of 5 — behaves the same as alreadyShipped=0");
    assert.equal(await stagedCount(pool, "C20"), 1);
  });

  // D-FA1: the whole point — a selection that is never applied consumes
  // nothing, which is what makes a run that dies after the flush harmless.
  await t.test("flushShippable itself deletes nothing — the selection is a plan, not a consumption", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 7; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    const first = await flushShippable(pool, "C20", 0);
    assert.equal(first.shippable.length, 5);
    assert.equal(first.held.length, 2);
    assert.equal(await stagedCount(pool, "C20"), 7, "nothing consumed by computing the plan");
    const second = await flushShippable(pool, "C20", 0);
    assert.deepEqual(second.shippable.map((s) => s.cardId), first.shippable.map((s) => s.cardId), "and it is repeatable");
  });

  // D-FA1: this run's drained queue rows have no staged row yet — they sort
  // after every real staged row and flush in that same order.
  await t.test("drained queue rows join the selection after the real staged rows", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    for (let i = 1; i <= 3; i++) {
      await stageOccurrence(pool, { deckCode: "C20", cardId: `C20${String(i).padStart(3, "0")}`, letter: "A" });
    }
    const extra = [
      { pendingId: "901", cardId: "C20004", letter: "E" },
      { pendingId: "902", cardId: "C20005", letter: "E" },
    ];
    const { shippable, held, stagedTotal } = await flushShippable(pool, "C20", 0, extra);
    assert.equal(stagedTotal, 5);
    assert.deepEqual(
      shippable.map((s) => `${s.cardId}/${s.letter}`),
      ["C20001/A", "C20002/A", "C20003/A", "C20004/E", "C20005/E"],
      "real staged rows first, drained rows last — a card's A can never follow its own E"
    );
    assert.deepEqual(held, []);
    assert.equal(await stagedCount(pool, "C20"), 3, "still read-only, extras included");
  });

  await t.test("peekStaged is read-only — never deletes", async () => {
    await pool.query("TRUNCATE staged_occurrences");
    await stageOccurrence(pool, { deckCode: "C20", cardId: "C20001", letter: "A" });
    await peekStaged(pool, "C20");
    await peekStaged(pool, "C20");
    assert.equal(await stagedCount(pool, "C20"), 1, "repeated peeks must not consume anything");
  });
});
