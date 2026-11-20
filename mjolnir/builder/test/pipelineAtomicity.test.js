// flush-record-atomicity (D163/D-FA1/D-FA3) — the two regression cases
// `pipeline.test.js` does not cover:
//
//   1. a failure raised AFTER the consumption has already been applied,
//      inside the open transaction. `pipeline.test.js`'s D-FA1 case fails in
//      `ensureBlobsPresent`, which runs before `commitRun` is ever entered,
//      so it proves the plan was never applied — not that applying it is
//      atomic. Even a failure in `recordShipments` is too early: the deletes
//      and decrements come after it. This case breaks the LAST statement in
//      the transaction, with every delete and decrement already applied, so
//      only BEGIN…ROLLBACK can hold the line. (Checked by mutation: moving
//      the staged DELETE back onto the pool, outside the transaction, makes
//      this case fail.)
//
//   2. the per-deck drain, proven ARITHMETICALLY. The existing D-FA3 case
//      asserts the outcome (no duplicates, A before E), which a per-card
//      drain could in principle still produce for a small enough queue.
//      Here every queue row is parked far from draining, so the only
//      observable is the decrement itself: one pass of N, never N passes.
//      (Checked by mutation: reinstating a per-card drain makes this case
//      fail with a decrement of 28 where 14 is correct.)
//
// Own file rather than more cases appended to `pipeline.test.js`: that suite
// is one long stateful sequence whose later assertions depend on earlier
// runs, and `node --test` gives each file its own process and database
// lifecycle (`--test-concurrency=1` in package.json keeps them serial).
//
// Like every DB-backed suite here, this one SKIPS SILENTLY without
// DATABASE_URL — run it explicitly.
import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { runPublish } from "../src/pipeline.js";
import { runExplode } from "../../src/commands/explode.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { startFakeStabbur, shaOf } from "./helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "./helpers/logicBundleFixture.js";
import { makeDbLogger } from "../src/jobLogs.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

function wordNote(id) {
  const audioText = `audio for ${id}`;
  return {
    id,
    created_at: "2026-10-01T00:00:00.000Z",
    capture_id: null,
    type: "word",
    source_lang: "no",
    text: `word-${id}`,
    translations: [{ lang: "en", text: `translation-${id}` }],
    transcription: "",
    pos: "substantiv",
    lemma: `word-${id}`,
    inflections: {},
    examples: [],
    audio_blob: shaOf(audioText),
    audio_sel_ms: null,
    grammar_rule_id: null,
    status: "ready",
  };
}

describe("builder pipeline: the consumption transaction is atomic and the recovery drain runs once per deck", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, staged_occurrences, occurrence_shipments, job_logs, logic_bundles, card_content CASCADE"
  );
  for (const { code, title, description } of DECK_ALLOCATION) {
    await pool.query("INSERT INTO decks (code, title, category, description) VALUES ($1, $2, $3, $4)", [
      code,
      title,
      code[0],
      description || "",
    ]);
  }

  process.env.ALLOW_NO_COMPANION = "1";
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-builder-atomicity-"));
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource());
  runExplode(logicBundlePath);
  await seedActiveLogicBundle(pool, logicBundlePath);

  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();
  const config = {
    stabburBaseUrl,
    internalToken: fake.authToken,
    sourceLang: "no",
    dataDir: path.join(tmpDir, "data"),
    publicBase: "https://tun.example.test",
    log: makeDbLogger(pool),
  };

  const notes = [];
  function addNotes(...newNotes) {
    notes.push(...newNotes);
    for (const n of newNotes) fake.addBlob(shaOf(`audio for ${n.id}`), `audio for ${n.id}`);
    fake.setNotes([...notes]);
  }

  const ledger = async () => ({
    staged: (await pool.query("SELECT id, card_id, letter FROM staged_occurrences ORDER BY id")).rows,
    pending: (await pool.query("SELECT id, card_id, letter, remaining FROM pending_occurrences ORDER BY id")).rows,
    shipped: (await pool.query("SELECT id, card_id, letter, build_id FROM occurrence_shipments ORDER BY id")).rows,
    publications: (await pool.query("SELECT build_id FROM publications ORDER BY build_id")).rows,
  });

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  // Six cards in C30: five A's ship, the sixth stays staged (D-W2's
  // multiple-of-5 grid), six E's queue.
  addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
  const first = await runPublish(pool, config);
  assert.equal(first.published, true, "setup publish");

  await t.test("D-FA1: a failure raised AFTER the deletes, inside the consumption transaction, rolls them back with everything else", async () => {
    await pool.query("UPDATE pending_occurrences SET remaining = 99 WHERE deck_code = 'C30'");
    await pool.query("UPDATE pending_occurrences SET remaining = 1 WHERE card_id = 'C30001' AND letter = 'E'");

    // The failure has to land AFTER `commitRun` has already deleted staged
    // rows and decremented the queue, or the rollback is never actually
    // exercised (the transaction's order is publication -> shipments ->
    // decrements -> deletes -> staged inserts). The last step is the one to
    // break: C30001's E is one new card from draining, and a staged row for
    // that same (card, letter) is planted with an id high enough that the
    // flush holds it instead of shipping it. The drained E is then held too,
    // so `commitRun` tries to INSERT it as a real staged row — straight into
    // `staged_occurrences_card_letter_idx` (migration 019), with every
    // delete and decrement already applied inside the open transaction.
    await pool.query("INSERT INTO staged_occurrences (id, deck_code, card_id, letter) VALUES (999999, 'C30', 'C30001', 'E')");

    const before = await ledger();
    addNotes(...Array.from({ length: 4 }, (_, i) => wordNote(`t${i}`)));

    await assert.rejects(() => runPublish(pool, config), /duplicate key value violates unique constraint/);

    const after = await ledger();
    for (const row of before.staged) {
      assert.ok(
        after.staged.some((r) => r.id === row.id),
        `staged row ${row.id} (${row.card_id}/${row.letter}) was deleted by a transaction that then rolled back`
      );
    }
    assert.deepEqual(after.shipped, before.shipped, "no shipment row survives the rollback");
    assert.deepEqual(after.publications, before.publications, "no publication row survives the rollback");
    for (const row of before.pending) {
      const now = after.pending.find((r) => r.id === row.id);
      assert.ok(now, `pending row ${row.id} (${row.card_id}/${row.letter}) survives — its DELETE rolled back`);
      assert.equal(now.remaining, row.remaining, `pending row ${row.id}'s countdown is unchanged — the decrement rolled back too`);
    }

    // Clean the planted duplicate up so the next case starts consistent.
    await pool.query("DELETE FROM staged_occurrences WHERE id = 999999");
    assert.deepEqual((await checkOccurrenceIntegrity(pool)).anomalies, [], "the ledger is consistent after the rollback");
  });

  await t.test("D-FA3: the recovery drain decrements every queue row exactly once per run, not once per recovered card", async () => {
    // Park every queued E far from draining, so the ONLY observable this
    // run leaves on them is the size of the decrement.
    await pool.query("UPDATE pending_occurrences SET remaining = 100 WHERE deck_code = 'C30'");

    // 14 cards in hub's ledger but absent from the bundle (no card_content,
    // no shipment, no staged row) — the D86 recovery path, with more cards
    // than the 11 of the b000040 fingerprint.
    const RECOVERED = 14;
    const { rows: maxRow } = await pool.query("SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = 'C30'");
    let nextNo = Number(maxRow[0].max_no) + 1;
    const recovered = [];
    for (let i = 0; i < RECOVERED; i++) {
      const noteId = `rec${i}`;
      const cardId = `C30${String(nextNo).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [cardId, nextNo, noteId]);
      await pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1, $2)", [noteId, cardId]);
      await pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30', $1, 'E', 100)", [cardId]);
      recovered.push({ noteId, cardId });
      nextNo += 1;
    }
    addNotes(...recovered.map(({ noteId }) => wordNote(noteId)));

    const before = await ledger();
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    const after = await ledger();

    const deltas = new Set();
    for (const row of before.pending) {
      const now = after.pending.find((r) => r.id === row.id);
      assert.ok(now, `queue row ${row.id} (${row.card_id}/${row.letter}) cannot drain from 100 and must survive`);
      deltas.add(row.remaining - now.remaining);
    }
    assert.deepEqual(
      [...deltas],
      [RECOVERED],
      `every queue row decremented by exactly ${RECOVERED} — one pass per deck. ` +
        `A per-card drain (the b000040 defect) would apply ${RECOVERED} separate passes instead. Got ${[...deltas]}`
    );

    const { rows: drainLines } = await pool.query(
      "SELECT line FROM job_logs WHERE build_job_id = (SELECT max(id) FROM build_jobs) AND line LIKE 'drain: C30%'"
    );
    assert.equal(drainLines.length, 1, `exactly one drain pass logged for C30, got ${JSON.stringify(drainLines.map((r) => r.line))}`);

    assert.deepEqual((await checkOccurrenceIntegrity(pool)).anomalies, [], "mass recovery left no duplicate, no orphan, no order break");
  });
});
