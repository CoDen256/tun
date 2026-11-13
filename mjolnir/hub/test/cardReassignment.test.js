import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { seedActiveLogicBundle } from "../../builder/test/helpers/logicBundleFixture.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { previewReassignment, reassignCards, ReassignmentBlockedError } from "../src/cardReassignment.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

const C30_NUMERIC_ID = 7;

describe("cardReassignment: precondition-gated card move to a new deck", async (t) => {
  const pool = getPool();
  await migrate();

  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-card-reassignment-"));
  const bundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(
    bundlePath,
    "var __BUNDLE_START_TIME__=1;\n" +
      buildFixtureBundleSource({ decks: [{ ID: C30_NUMERIC_ID, Name: "C30", Title: "Lexic", Cards: [] }] })
  );

  async function seedFixture() {
    await pool.query(
      "TRUNCATE card_slots, publications, minted_notes, decks, pending_occurrences, occurrence_shipments, staged_occurrences, card_content, userdata, userdata_history, logic_bundles CASCADE"
    );
    await pool.query("INSERT INTO decks (code, title, category) VALUES ('C30', 'Lexic', 'C'), ('C20', 'Practice', 'C')");
    await seedActiveLogicBundle(pool, bundlePath, { baseVersion: "1.0.0", patchRev: 1 });

    await pool.query(
      "INSERT INTO card_slots (id, deck_code, card_no, note_id, audio_sha256) VALUES ('C30011', 'C30', 11, 'note-11', 'sha-11'), ('C30012', 'C30', 12, 'note-12', 'sha-12')"
    );
    await pool.query(
      "INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C20001', 'C20', 1, 'note-1'), ('C20002', 'C20', 2, 'note-2'), ('C20003', 'C20', 3, 'note-3'), ('C20004', 'C20', 4, 'note-4')"
    );
    await pool.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ('C30011', 'n11', 'e11', 'x11', 'N')");
    await pool.query(
      "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b1', '1.0', 1, 1, 'sha')"
    );
    await pool.query("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30011', 'N', 'b1')");
    await pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30', 'C30012', 'E', 5)");
  }

  t.after(async () => {
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  await t.test("happy path: moves both cards to C20005/C20006, repoints every referencing table", async () => {
    await seedFixture();
    // No userdata at all — zero pull evidence by construction.
    const preview = await previewReassignment(pool, { cardIds: ["C30011", "C30012"], destinationDeckCode: "C20" });
    assert.equal(preview.ok, true);
    assert.deepEqual(
      preview.predicted.map((p) => p.newId),
      ["C20005", "C20006"]
    );

    const result = await reassignCards(pool, { cardIds: ["C30011", "C30012"], destinationDeckCode: "C20" });
    assert.equal(result.sourceDeckCode, "C30");
    assert.deepEqual(
      result.moved,
      [
        { oldId: "C30011", newId: "C20005" },
        { oldId: "C30012", newId: "C20006" },
      ]
    );

    const { rows: oldRows } = await pool.query("SELECT id FROM card_slots WHERE id IN ('C30011', 'C30012')");
    assert.equal(oldRows.length, 0, "old ids must be gone from card_slots");

    const { rows: newRows } = await pool.query(
      "SELECT id, deck_code, card_no, note_id, audio_sha256 FROM card_slots WHERE id IN ('C20005', 'C20006') ORDER BY id"
    );
    assert.deepEqual(newRows, [
      { id: "C20005", deck_code: "C20", card_no: 5, note_id: "note-11", audio_sha256: "sha-11" },
      { id: "C20006", deck_code: "C20", card_no: 6, note_id: "note-12", audio_sha256: "sha-12" },
    ]);

    const { rows: content } = await pool.query("SELECT card_id, n FROM card_content WHERE card_id = 'C20005'");
    assert.equal(content.length, 1);
    assert.equal(content[0].n, "n11");

    const { rows: shipments } = await pool.query("SELECT card_id FROM occurrence_shipments");
    assert.equal(shipments[0].card_id, "C20005");

    const { rows: pending } = await pool.query("SELECT card_id, deck_code, remaining FROM pending_occurrences");
    assert.deepEqual(pending, [{ card_id: "C20006", deck_code: "C20", remaining: 5 }]);
  });

  await t.test("precondition failure: no rows touched, no bypass, refuses with ReassignmentBlockedError", async () => {
    await seedFixture();
    await pool.query("INSERT INTO userdata (device_id, doc) VALUES ($1, $2)", [
      "device-1",
      { decksStatus: [{ ID: C30_NUMERIC_ID, PullCounter: 2 }], totalCards: [] },
    ]);

    const preview = await previewReassignment(pool, { cardIds: ["C30011", "C30012"], destinationDeckCode: "C20" });
    assert.equal(preview.ok, false);
    assert.equal(preview.evidence.length, 1);

    await assert.rejects(
      () => reassignCards(pool, { cardIds: ["C30011", "C30012"], destinationDeckCode: "C20" }),
      ReassignmentBlockedError
    );

    const { rows } = await pool.query("SELECT id FROM card_slots WHERE id IN ('C30011', 'C30012')");
    assert.equal(rows.length, 2, "both source rows must still exist — nothing was touched");
  });

  await t.test("a forced mid-transaction failure leaves every table exactly as it was (full rollback)", async () => {
    await seedFixture();
    // Live `MAX(card_no)+1` allocation can't be collided by pre-planting a
    // row at the predicted id — any such row raises `MAX` itself, so the
    // real allocation always picks a slot past it (never a true collision).
    // A deterministic, allocation-independent failure instead: `card_slots.
    // id` has a real CHECK (char_length(id) = 6) — a 5-character deck code
    // produces an 8-character id, violating it on `moveCardRow`'s very
    // first INSERT, regardless of what `card_no` resolves to.
    const before = (await pool.query("SELECT id, deck_code, card_no, note_id FROM card_slots ORDER BY id")).rows;

    await assert.rejects(
      () => reassignCards(pool, { cardIds: ["C30011", "C30012"], destinationDeckCode: "C9999" }),
      /violates check constraint/
    );

    const after = (await pool.query("SELECT id, deck_code, card_no, note_id FROM card_slots ORDER BY id")).rows;
    assert.deepEqual(after, before, "every row must be exactly as it was before the failed attempt");

    const { rows: orphanContent } = await pool.query(
      "SELECT cc.card_id FROM card_content cc LEFT JOIN card_slots cs ON cs.id = cc.card_id WHERE cs.id IS NULL"
    );
    assert.equal(orphanContent.length, 0);
    const { rows: orphanPending } = await pool.query(
      "SELECT po.card_id FROM pending_occurrences po LEFT JOIN card_slots cs ON cs.id = po.card_id WHERE cs.id IS NULL"
    );
    assert.equal(orphanPending.length, 0);
  });
});
