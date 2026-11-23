// THROWAWAY: migration 019 verification.
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";

const pool = getPool();
const q = (s, p) => pool.query(s, p);
const ok = (m) => console.log(`  OK   ${m}`);
const info = (m) => console.log(`  ..   ${m}`);

// 1. full migrate on an empty database
const ran = await migrate();
info(`migrate() applied ${ran.length} file(s); 019 included: ${ran.includes("019_occurrence_uniqueness.sql")}`);
assert.ok(ran.includes("019_occurrence_uniqueness.sql"));

// 2. idempotent: a second run applies nothing
const again = await migrate();
assert.deepEqual(again, [], `second migrate() must be a no-op, got ${JSON.stringify(again)}`);
ok("migrate() is idempotent (second run applied 0 files)");

// 3. the indexes exist on all three tables
const { rows: idx } = await q(
  `SELECT indexname, tablename, indexdef FROM pg_indexes
   WHERE indexname IN ('staged_occurrences_card_letter_idx','pending_occurrences_card_letter_idx','occurrence_shipments_card_letter_idx')
   ORDER BY indexname`
);
assert.equal(idx.length, 3, `all three unique indexes, got ${JSON.stringify(idx.map((r) => r.indexname))}`);
for (const r of idx) assert.match(r.indexdef, /CREATE UNIQUE INDEX/, `${r.indexname} must be UNIQUE`);
ok(`3 unique indexes present: ${idx.map((r) => `${r.tablename}(${r.indexname})`).join(", ")}`);

// 4. seed the world and prove each index REJECTS a duplicate
await q("INSERT INTO decks (code, title, category, description) VALUES ('C30','t','C','') ON CONFLICT DO NOTHING");
await q("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C30001','C30',1,'n1'),('C30002','C30',2,'n2')");
await q("INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b000001','1',1,1,'sha1'),('b000002','1',1,2,'sha2')");
const rejects = async (sql, params, label) => {
  await assert.rejects(() => q(sql, params), /duplicate key value violates unique constraint/, label);
  ok(`${label} rejected by the database`);
};
await q("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30001','A')");
await rejects("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30001','A')", [], "duplicate staged (C30001,A)");
await q("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30001','E',11)");
await rejects("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30001','E',5)", [], "duplicate pending (C30001,E)");
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30002','A','b000001')");
await rejects("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30002','A','b000002')", [], "duplicate shipment (C30002,A)");

// 5. re-apply 019 to a database that ALREADY holds duplicates (a dev DB
//    restored from before the live hand-repair). Drop the indexes, seed
//    duplicates with distinguishable payloads, un-ledger 019, migrate again.
await q("DROP INDEX staged_occurrences_card_letter_idx, pending_occurrences_card_letter_idx, occurrence_shipments_card_letter_idx");
await q("DELETE FROM schema_migrations WHERE filename = '019_occurrence_uniqueness.sql'");
await q("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30001','A')");              // dup #2
await q("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30001','A')");              // dup #3
await q("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30001','E',7)"); // dup, newer, remaining 7
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30002','A','b000002')");          // dup, newer build
const oldest = {
  staged: (await q("SELECT min(id) m FROM staged_occurrences WHERE card_id='C30001' AND letter='A'")).rows[0].m,
  pending: (await q("SELECT min(id) m FROM pending_occurrences WHERE card_id='C30001' AND letter='E'")).rows[0].m,
  shipped: (await q("SELECT min(id) m FROM occurrence_shipments WHERE card_id='C30002' AND letter='A'")).rows[0].m,
};
info(`pre-migration duplicate counts: staged ${(await q("SELECT count(*) c FROM staged_occurrences")).rows[0].c}, pending ${(await q("SELECT count(*) c FROM pending_occurrences")).rows[0].c}, shipped ${(await q("SELECT count(*) c FROM occurrence_shipments")).rows[0].c}`);
const ran2 = await migrate();
assert.deepEqual(ran2, ["019_occurrence_uniqueness.sql"], `019 re-applied, got ${JSON.stringify(ran2)}`);
ok("019 applies cleanly to a database seeded with pre-existing duplicates");

const survivors = {
  staged: (await q("SELECT id FROM staged_occurrences WHERE card_id='C30001' AND letter='A'")).rows,
  pending: (await q("SELECT id, remaining FROM pending_occurrences WHERE card_id='C30001' AND letter='E'")).rows,
  shipped: (await q("SELECT id, build_id FROM occurrence_shipments WHERE card_id='C30002' AND letter='A'")).rows,
};
for (const t of ["staged", "pending", "shipped"]) assert.equal(survivors[t].length, 1, `${t}: exactly one row survives`);
assert.equal(String(survivors.staged[0].id), String(oldest.staged), "staged: the OLDEST row survived");
assert.equal(String(survivors.pending[0].id), String(oldest.pending), "pending: the OLDEST row survived");
assert.equal(survivors.pending[0].remaining, 11, "pending: the oldest row's payload (remaining 11), not the newer 7");
assert.equal(String(survivors.shipped[0].id), String(oldest.shipped), "shipped: the OLDEST row survived");
assert.equal(survivors.shipped[0].build_id, "b000001", "shipped: the oldest row's build_id, not the newer b000002");
ok("de-duplication kept the OLDEST row in all three tables (payloads prove it)");

// 6. indexes back, still rejecting
const { rows: idx2 } = await q(
  `SELECT indexname FROM pg_indexes WHERE indexname LIKE '%_card_letter_idx' ORDER BY 1`
);
assert.equal(idx2.length, 3, `indexes recreated, got ${JSON.stringify(idx2)}`);
await rejects("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30001','A')", [], "post-migration duplicate staged");
const again2 = await migrate();
assert.deepEqual(again2, [], "still idempotent afterwards");
ok("idempotent after the re-apply too");
console.log("PASS mig019");
await closePool();
