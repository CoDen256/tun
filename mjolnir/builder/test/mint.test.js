import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { deckTitle, deckDescription } from "../src/mint.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("mint: deckTitle/deckDescription read from hub's decks table", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE decks CASCADE");
  await pool.query(
    "INSERT INTO decks (code, title, category, description) VALUES ('C30', 'Lexic', 'C', 'Vocabulary and expressions.')"
  );
  await pool.query("INSERT INTO decks (code, title, category) VALUES ('C31', 'Lexic II', 'C')");

  t.after(async () => {
    await closePool();
  });

  await t.test("deckDescription mirrors deckTitle's exact shape", async () => {
    assert.equal(await deckTitle(pool, "C30"), "Lexic");
    assert.equal(await deckDescription(pool, "C30"), "Vocabulary and expressions.");
  });

  await t.test("a deck with no description set reads back as an empty string, not null", async () => {
    assert.equal(await deckDescription(pool, "C31"), "");
  });

  await t.test("an unknown deck code throws the same 'not found' error deckTitle already uses", async () => {
    await assert.rejects(() => deckDescription(pool, "C99-nonexistent"), /not found in hub's decks table/);
  });
});
