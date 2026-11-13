import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { upsert, get, getAll } from "../src/cardContent.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("cardContent: upsert at mint/regen time (D-L3)", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE card_content, card_slots, decks CASCADE");
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C20', 'Substantiv', 'C')");
  await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C20001', 'C20', 1, 'n1')");

  t.after(async () => {
    await closePool();
  });

  await t.test("upsert inserts, then overwrites, by card id", async () => {
    await upsert("C20001", { n: "<div>hus</div>", e: "<div>house</div>", x: null, a: "N" });
    assert.deepEqual(await get("C20001"), { N: "<div>hus</div>", E: "<div>house</div>", X: null, A: "N" });

    await upsert("C20001", { n: "<div>hus (edited)</div>", e: "<div>house</div>", x: null, a: "N" });
    assert.equal((await get("C20001")).N, "<div>hus (edited)</div>");
  });

  await t.test("getAll is keyed by card id, for replay", async () => {
    const all = await getAll();
    assert.ok(all.has("C20001"));
    assert.equal(all.get("C20001").E, "<div>house</div>");
  });

  await t.test("get returns null for a card with no content yet", async () => {
    assert.equal(await get("C20999"), null);
  });
});
