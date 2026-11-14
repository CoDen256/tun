import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { dryRun, applyMigration, planMigration } from "../src/deckConsolidationMigration.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

// A synthetic fixture mirroring the real pre-consolidation table shapes —
// not the real DB (this project's existing test convention). Shaped to
// exercise every table D-DC1 touches, plus an immediate `lexic` rollover
// (999 + 3 = 1002 cards migrating into it, one more than a single code can
// hold).
async function seedFixture(pool) {
  await pool.query(
    "TRUNCATE card_slots, publications, minted_notes, decks, pending_occurrences, occurrence_shipments, staged_occurrences, card_content CASCADE"
  );
  // `C20`/`C30` simulate the real system's state at migration time: already
  // seeded by `seedDecks()` with the NEW `DECK_ALLOCATION` (practice/lexic's
  // starting codes) well before this migration ever runs. `C20`'s title is
  // still "Substantiv" here deliberately — until this migration runs,
  // `card_slots` still has the OLD substantiv cards sitting under it; the
  // title only catches up to "Practice" once an operator re-seeds/updates it
  // (out of scope for this migration itself, which never touches `decks.
  // title`).
  await pool.query(
    "INSERT INTO decks (code, title, category, description) VALUES ('C20', 'Substantiv', 'C', ''), ('C30', 'Lexic', 'C', ''), ('C22', 'Verb', 'C', ''), ('C27', 'Listening', 'C', '')"
  );
  await pool.query(
    "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b000001', '1.0.0', 1, 1, 'deadbeef')"
  );

  // 999 old C20 (substantiv -> lexic) cards.
  for (let i = 1; i <= 999; i++) {
    const id = `C20${String(i).padStart(3, "0")}`;
    await pool.query(
      "INSERT INTO card_slots (id, deck_code, card_no, note_id, audio_sha256) VALUES ($1, 'C20', $2, $3, $4)",
      [id, i, `note-${id}`, `sha-${id}`]
    );
    await pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1, $2)", [`note-${id}`, id]);
  }
  // card_content + a shipped occurrence + a staged occurrence, on the first
  // and last C20 cards — enough to prove every referencing table migrates.
  await pool.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ('C20001', 'n1', 'e1', 'x1', 'A')");
  await pool.query("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C20001', 'A', 'b000001')");
  await pool.query("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C20', 'C20999', 'A')");
  await pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C20', 'C20999', 'E', 7)");

  // 3 old C22 (verb -> lexic) cards — these push lexic's total to 1002,
  // past a single code's 999 cap.
  for (let i = 1; i <= 3; i++) {
    const id = `C22${String(i).padStart(3, "0")}`;
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C22', $2, $3)", [
      id,
      i,
      `note-${id}`,
    ]);
  }

  // 2 old C27 (listening -> practice) cards.
  for (let i = 1; i <= 2; i++) {
    const id = `C27${String(i).padStart(3, "0")}`;
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C27', $2, $3)", [
      id,
      i,
      `note-${id}`,
    ]);
  }
}

describe("deckConsolidationMigration", async (t) => {
  const pool = getPool();
  await migrate();

  t.after(async () => {
    await closePool();
  });

  await t.test("planMigration: hand-computed mapping for a small synthetic set, including a mid-plan rollover", () => {
    const oldCardRows = [
      { id: "C20999", deckCode: "C20", cardNo: 999, noteId: "n-last", audioSha256: null, grammarRuleId: null },
      ...Array.from({ length: 998 }, (_, i) => ({
        id: `C20${String(i + 1).padStart(3, "0")}`,
        deckCode: "C20",
        cardNo: i + 1,
        noteId: `n-${i + 1}`,
        audioSha256: null,
        grammarRuleId: null,
      })),
      { id: "C22001", deckCode: "C22", cardNo: 1, noteId: "n-verb-1", audioSha256: null, grammarRuleId: null },
      { id: "C22002", deckCode: "C22", cardNo: 2, noteId: "n-verb-2", audioSha256: null, grammarRuleId: null },
      { id: "C27001", deckCode: "C27", cardNo: 1, noteId: "n-listen-1", audioSha256: null, grammarRuleId: null },
    ];
    const mapping = planMigration(oldCardRows);

    // All 999 C20 cards fill C30 exactly (card_no 1-999, in old-card_no
    // order regardless of input array order — D-DC1's sort, not insertion
    // order).
    const c20Entries = mapping.filter((m) => m.oldDeckCode === "C20").sort((a, b) => a.newCardNo - b.newCardNo);
    assert.equal(c20Entries.length, 999);
    assert.equal(c20Entries[0].newId, "C30001");
    assert.equal(c20Entries[998].newId, "C30999");
    assert.ok(c20Entries.every((m) => m.family === "lexic" && m.newDeckCode === "C30"));

    // C22's 2 cards roll over into C31 — C30 is already full.
    const c22Entries = mapping.filter((m) => m.oldDeckCode === "C22").sort((a, b) => a.newCardNo - b.newCardNo);
    assert.deepEqual(
      c22Entries.map((m) => m.newId),
      ["C31001", "C31002"]
    );

    // C27 (practice) gets its own fresh sequence at C20, now that every old
    // C20 row has conceptually moved to C30 in this plan.
    const c27Entries = mapping.filter((m) => m.oldDeckCode === "C27");
    assert.deepEqual(c27Entries.map((m) => m.newId), ["C20001"]);
  });

  await t.test("dryRun: correct mapping/counts/rollover against the full synthetic fixture, writes nothing", async () => {
    await seedFixture(pool);
    const before = {
      cardSlots: (await pool.query("SELECT count(*) FROM card_slots")).rows[0].count,
      cardContent: (await pool.query("SELECT count(*) FROM card_content")).rows[0].count,
      pending: (await pool.query("SELECT count(*) FROM pending_occurrences")).rows[0].count,
      staged: (await pool.query("SELECT count(*) FROM staged_occurrences")).rows[0].count,
      shipments: (await pool.query("SELECT count(*) FROM occurrence_shipments")).rows[0].count,
      minted: (await pool.query("SELECT count(*) FROM minted_notes")).rows[0].count,
      decks: (await pool.query("SELECT count(*) FROM decks")).rows[0].count,
    };

    const report = await dryRun(pool);

    assert.equal(report.mapping.length, 1004, "999 + 3 + 2");
    assert.equal(report.tableCounts.card_slots, 1004);
    assert.equal(report.tableCounts.card_content, 1);
    assert.equal(report.tableCounts.pending_occurrences, 1);
    assert.equal(report.tableCounts.staged_occurrences, 1);
    assert.equal(report.tableCounts.occurrence_shipments, 1);
    assert.equal(report.tableCounts.minted_notes, 999);

    assert.equal(report.rolloverTriggered.lexic, true, "1002 lexic cards exceed one code's 999 cap");
    assert.equal(report.rolloverTriggered.practice, false, "2 practice cards fit in a single code");

    assert.deepEqual(report.retiredDeckCodes.sort(), ["C22", "C27"], "C20 is excluded — it's practice's protected starting code, not retired");

    // Read-only: every table's row count is byte-for-byte unchanged.
    const after = {
      cardSlots: (await pool.query("SELECT count(*) FROM card_slots")).rows[0].count,
      cardContent: (await pool.query("SELECT count(*) FROM card_content")).rows[0].count,
      pending: (await pool.query("SELECT count(*) FROM pending_occurrences")).rows[0].count,
      staged: (await pool.query("SELECT count(*) FROM staged_occurrences")).rows[0].count,
      shipments: (await pool.query("SELECT count(*) FROM occurrence_shipments")).rows[0].count,
      minted: (await pool.query("SELECT count(*) FROM minted_notes")).rows[0].count,
      decks: (await pool.query("SELECT count(*) FROM decks")).rows[0].count,
    };
    assert.deepEqual(after, before, "dry run must write nothing");
  });

  await t.test("applyMigration: produces exactly the dry-run's mapping, every table ends up internally consistent", async () => {
    await seedFixture(pool);
    const planned = await dryRun(pool);

    const result = await applyMigration(pool);
    assert.deepEqual(
      result.mapping.map((m) => m.newId).sort(),
      planned.mapping.map((m) => m.newId).sort(),
      "apply must move every card to exactly the id the dry-run predicted"
    );

    // Checking "no old id string exists anymore" would false-positive: the
    // `practice` migration's own new ids legitimately reuse "C20001" etc,
    // the exact strings `lexic`'s old substantiv cards used to occupy. The
    // real check is that no row keeps its OLD (id, note_id) pairing.
    const oldIds = planned.mapping.map((m) => m.oldId);
    const oldNoteIdById = new Map(planned.mapping.map((m) => [m.oldId, m.noteId]));
    const { rows: idMatches } = await pool.query("SELECT id, note_id FROM card_slots WHERE id = ANY($1)", [oldIds]);
    const trueSurvivors = idMatches.filter((r) => oldNoteIdById.get(r.id) === r.note_id);
    assert.equal(trueSurvivors.length, 0, "no old (id, note_id) pairing survives in card_slots");

    const { rows: newPresent } = await pool.query("SELECT count(*) FROM card_slots WHERE deck_code IN ('C30', 'C31', 'C20')");
    assert.equal(Number(newPresent[0].count), 1004);

    // card_content moved with its card (the one seeded row, now at C30001).
    const { rows: content } = await pool.query("SELECT card_id, n FROM card_content");
    assert.equal(content.length, 1);
    assert.equal(content[0].card_id, "C30001");
    assert.equal(content[0].n, "n1");

    // occurrence_shipments repointed, build_id untouched (D-DC2).
    const { rows: shipments } = await pool.query("SELECT card_id, build_id FROM occurrence_shipments");
    assert.equal(shipments.length, 1);
    assert.equal(shipments[0].card_id, "C30001");
    assert.equal(shipments[0].build_id, "b000001");

    // staged_occurrences + pending_occurrences repointed, deck_code updated too.
    const { rows: staged } = await pool.query("SELECT card_id, deck_code FROM staged_occurrences");
    assert.equal(staged.length, 1);
    assert.equal(staged[0].card_id, "C30999");
    assert.equal(staged[0].deck_code, "C30");

    const { rows: pending } = await pool.query("SELECT card_id, deck_code, remaining FROM pending_occurrences");
    assert.equal(pending.length, 1);
    assert.equal(pending[0].card_id, "C30999");
    assert.equal(pending[0].deck_code, "C30");
    assert.equal(pending[0].remaining, 7);

    // minted_notes repointed for every migrated card that had one.
    const { rows: minted } = await pool.query("SELECT count(*) FROM minted_notes WHERE card_slot_id LIKE 'C30%'");
    assert.equal(Number(minted[0].count), 999);

    // No orphans: every pending/staged/content row's card_id exists in card_slots.
    const { rows: orphanContent } = await pool.query(
      "SELECT cc.card_id FROM card_content cc LEFT JOIN card_slots cs ON cs.id = cc.card_id WHERE cs.id IS NULL"
    );
    assert.equal(orphanContent.length, 0);
    const { rows: orphanPending } = await pool.query(
      "SELECT po.card_id FROM pending_occurrences po LEFT JOIN card_slots cs ON cs.id = po.card_id WHERE cs.id IS NULL"
    );
    assert.equal(orphanPending.length, 0);
    const { rows: orphanStaged } = await pool.query(
      "SELECT so.card_id FROM staged_occurrences so LEFT JOIN card_slots cs ON cs.id = so.card_id WHERE cs.id IS NULL"
    );
    assert.equal(orphanStaged.length, 0);

    // C22/C27 (genuinely retired, zero cards left) are deleted; C20
    // (practice's protected starting code, now repopulated) survives.
    const { rows: decks } = await pool.query("SELECT code, title FROM decks ORDER BY code");
    assert.deepEqual(decks.map((d) => d.code).sort(), ["C20", "C30", "C31"]);
    assert.deepEqual(result.deletedDeckCodes.sort(), ["C22", "C27"]);

    // C20 is REUSED (substantiv -> practice), not freshly created — its
    // `decks` row predates this migration (seeded "Substantiv" by the
    // fixture, matching `seedDecks`' `ON CONFLICT DO NOTHING` never
    // touching a pre-existing title) and must be explicitly retitled, or it
    // would show the wrong family's name on-device forever.
    const c20 = decks.find((d) => d.code === "C20");
    assert.equal(c20.title, "Practice", "C20's stale 'Substantiv' title must be updated to its new family's title");
    assert.deepEqual(result.retitledDeckCodes, [{ code: "C20", family: "practice", title: "Practice" }]);
  });

  await t.test("a forced failure partway through leaves zero rows changed (full rollback)", async () => {
    await seedFixture(pool);
    const before = (await pool.query("SELECT id, deck_code, card_no, note_id FROM card_slots ORDER BY id")).rows;

    // Force a mid-loop failure: plant a `card_slots` row that occupies the
    // very first new id the plan will compute (C30001) — the migration's
    // own read is scoped to only the old C20-C29 codes (see
    // `loadOldCardRows`), so this planted C30 row is invisible to planning
    // but still collides for real when the loop's first INSERT runs.
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C30001', 'C30', 1, 'rogue')");

    await assert.rejects(() => applyMigration(pool), /duplicate key/);

    const after = (await pool.query("SELECT id, deck_code, card_no, note_id FROM card_slots ORDER BY id")).rows;
    // Only the planted rogue row differs — every real pre-migration row is
    // untouched, proving the transaction rolled back completely.
    const afterWithoutRogue = after.filter((r) => r.id !== "C30001");
    assert.deepEqual(afterWithoutRogue, before, "every original row must be exactly as it was before the failed attempt");

    await pool.query("DELETE FROM card_slots WHERE id = 'C30001'");
  });
});
