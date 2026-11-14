import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { pruneRetiredDecks } from "../src/pipeline.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

function deck(name) {
  return { Name: name, Title: name, Cards: [] };
}

function model(...names) {
  return { decks: names.map(deck), cards: [] };
}

async function noopLog() {}

describe("pruneRetiredDecks: only prunes a code hub positively manages AND has zero card_slots left", async (t) => {
  const pool = getPool();
  await migrate();

  t.after(async () => {
    await closePool();
  });

  t.beforeEach(async () => {
    await pool.query("TRUNCATE card_slots, decks CASCADE");
  });

  // Task 4.1
  await t.test("does NOT remove a deck with zero card_slots rows when it has no decks row at all (stock deck)", async () => {
    const m = model("C01");
    await pruneRetiredDecks(pool, m, noopLog, 1);
    assert.deepEqual(m.decks.map((d) => d.Name), ["C01"], "no decks row => never pruned");
  });

  // Task 4.2
  await t.test("does NOT remove a deck with zero card_slots rows when its decks row has managed_by_hub = false", async () => {
    await pool.query("INSERT INTO decks (code, title, category, managed_by_hub) VALUES ('C10', 'Stock', 'C', FALSE)");
    const m = model("C10");
    await pruneRetiredDecks(pool, m, noopLog, 1);
    assert.deepEqual(m.decks.map((d) => d.Name), ["C10"], "managed_by_hub = false => never pruned");
  });

  // Task 4.3
  await t.test("DOES remove a deck with zero card_slots rows when managed_by_hub = true (existing retirement behavior)", async () => {
    await pool.query("INSERT INTO decks (code, title, category, managed_by_hub) VALUES ('C22', 'Verb', 'C', TRUE)");
    const m = model("C22");
    await pruneRetiredDecks(pool, m, noopLog, 1);
    assert.deepEqual(m.decks.map((d) => d.Name), [], "managed_by_hub = true and zero card_slots => pruned");
    const { rows } = await pool.query("SELECT code FROM decks WHERE code = 'C22'");
    assert.equal(rows.length, 0, "decks row is deleted too");
  });

  // Task 4.4
  await t.test(
    "regression: stock decks C01/C03/C10-C17 survive a full prune run alongside hub-managed C20/C30",
    async () => {
      const stockCodes = ["C01", "C03", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17"];
      for (const code of ["C20", "C30"]) {
        await pool.query("INSERT INTO decks (code, title, category, managed_by_hub) VALUES ($1, $2, 'C', TRUE)", [code, code]);
      }
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C20001', 'C20', 1, 'note-1')");

      const m = model(...stockCodes, "C20", "C30");
      await pruneRetiredDecks(pool, m, noopLog, 1);

      const survivingNames = m.decks.map((d) => d.Name).sort();
      assert.deepEqual(
        survivingNames,
        [...stockCodes, "C20"].sort(),
        "every stock deck survives; C20 survives (has a card_slots row); C30 is pruned (managed, zero cards)"
      );
    }
  );
});
