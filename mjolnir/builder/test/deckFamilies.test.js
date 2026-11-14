import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { resolveActiveDeckCode } from "../src/deckFamilies.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

async function fillDeck(pool, deckCode, count) {
  for (let i = 1; i <= count; i++) {
    const cardId = `${deckCode}${String(i).padStart(3, "0")}`;
    await pool.query(
      "INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, $2, $3, $4)",
      [cardId, deckCode, i, `note-${cardId}`]
    );
  }
}

describe("deckFamilies: resolveActiveDeckCode", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE card_slots, decks CASCADE");
  await pool.query(
    "INSERT INTO decks (code, title, category, description) VALUES ('C30', 'Lexic', 'C', '')"
  );

  t.after(async () => {
    await closePool();
  });

  await t.test("a family's starting code with room resolves to itself", async () => {
    assert.equal(await resolveActiveDeckCode(pool, "lexic"), "C30");
  });

  await t.test("an unknown family key throws a clearly-named error", async () => {
    await assert.rejects(() => resolveActiveDeckCode(pool, "nope"), /unknown deck family "nope"/);
  });
});

// A synthetic 2-code family rather than the real `lexic`/`practice` (which
// each have 10 configured codes) — exhaustion would otherwise need 9990
// seeded rows just to reach the last code.
describe("deckFamilies: rollover and exhaustion against a synthetic family", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE card_slots, decks CASCADE");
  await pool.query(
    "INSERT INTO decks (code, title, category, description) VALUES ('C30', 'Lexic', 'C', '')"
  );

  t.after(async () => {
    await closePool();
  });

  // Monkeypatch the family table directly rather than adding a real
  // multi-code family to `DECK_FAMILIES` just for this test — the stub
  // table otherwise stays a faithful mirror of today's single-deck
  // assignments until `deck-consolidation` lands.
  const deckFamilies = await import("../src/deckFamilies.js");
  deckFamilies.DECK_FAMILIES.testFamily = { title: "Test", codes: ["C30", "C31"] };
  t.after(() => {
    delete deckFamilies.DECK_FAMILIES.testFamily;
  });

  await t.test("a full starting code resolves to the next configured code, auto-creating its deck row", async () => {
    await fillDeck(pool, "C30", 999);
    const code = await resolveActiveDeckCode(pool, "testFamily");
    assert.equal(code, "C31");
    const { rows } = await pool.query("SELECT title, description FROM decks WHERE code = 'C31'");
    assert.equal(rows.length, 1);
    assert.equal(rows[0].title, "Test II");
    assert.equal(rows[0].description, "");
  });

  await t.test("a second resolution into the already-rolled-over code does not duplicate or reset its row", async () => {
    await pool.query("UPDATE decks SET title = 'Edited By Operator' WHERE code = 'C31'");
    const code = await resolveActiveDeckCode(pool, "testFamily");
    assert.equal(code, "C31");
    const { rows } = await pool.query("SELECT title FROM decks WHERE code = 'C31'");
    assert.equal(rows.length, 1, "no duplicate row");
    assert.equal(rows[0].title, "Edited By Operator", "ON CONFLICT DO NOTHING must not clobber an operator edit");
  });

  await t.test("every configured code full throws, naming the exhausted family", async () => {
    await fillDeck(pool, "C31", 999);
    await assert.rejects(
      () => resolveActiveDeckCode(pool, "testFamily"),
      /deck family "testFamily" has exhausted every configured code/
    );
  });
});
