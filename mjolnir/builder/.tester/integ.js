// THROWAWAY: D-FA4 integrity check, one anomaly class at a time.
import assert from "node:assert/strict";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
import { renderIntegrityBanner } from "../src/server.js";

const pool = getPool();
const q = (s, p) => pool.query(s, p);
const ok = (m) => console.log(`  OK   ${m}`);
const info = (m) => console.log(`  ..   ${m}`);
await migrate();
await q("TRUNCATE card_slots, publications, staged_occurrences, pending_occurrences, occurrence_shipments, decks, card_content CASCADE");
await q("INSERT INTO decks (code, title, category, description) VALUES ('C30','lexic','C',''),('C20','practice','C','')");
await q("INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b000001','1',1,1,'s')");
const card = async (id, deck, no) => q("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1,$2,$3,$4)", [id, deck, no, `n${id}`]);

// --- clean baseline: a healthy C30 card (A shipped, E queued) and a healthy
// --- single-occurrence C20 card (A shipped).
await card("C30001", "C30", 1);
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30001','A','b000001')");
await q("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30001','E',11)");
await card("C20001", "C20", 1);
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C20001','A','b000001')");
let r = await checkOccurrenceIntegrity(pool);
assert.deepEqual(r.anomalies, [], `clean database must report nothing, got ${JSON.stringify(r.anomalies)}`);
assert.equal(renderIntegrityBanner(r), "", "clean database renders NO banner HTML at all");
ok("clean database: 0 anomalies, banner renders the empty string");

const reset = async () => {
  await q("DELETE FROM staged_occurrences WHERE card_id NOT IN ('C30001','C20001')");
  await q("DELETE FROM pending_occurrences WHERE card_id NOT IN ('C30001','C20001')");
  await q("DELETE FROM occurrence_shipments WHERE card_id NOT IN ('C30001','C20001')");
  await q("DELETE FROM card_slots WHERE id NOT IN ('C30001','C20001')");
};
const expect = async (label, kind, cardId) => {
  const res = await checkOccurrenceIntegrity(pool);
  assert.equal(res.anomalies.length, 1, `${label}: exactly one anomaly, got ${JSON.stringify(res.anomalies)}`);
  const a = res.anomalies[0];
  assert.equal(a.kind, kind, `${label}: kind`);
  assert.equal(a.cardId, cardId, `${label}: offending card id`);
  const html = renderIntegrityBanner(res);
  assert.match(html, new RegExp(cardId), `${label}: the banner names ${cardId}`);
  ok(`${label} -> kind=${a.kind} card=${a.cardId} detail="${a.detail}"`);
  await reset();
  assert.deepEqual((await checkOccurrenceIntegrity(pool)).anomalies, [], `${label}: clears again after removal`);
};

// A. owed occurrence that exists NOWHERE (the 2026-11-09 fingerprint)
await card("C30002", "C30", 2);
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30002','A','b000001')"); // E nowhere
await expect("A: owed occurrence exists nowhere", "missing", "C30002");

// A2. a card with NOTHING anywhere
await card("C30003", "C30", 3);
await expect("A2: minted card with no occurrence at all", "missing", "C30003");

// B. the same occurrence in TWO places — all three pairings
for (const [l, sql] of [
  ["staged+pending", ["INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30004','E')",
                      "INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30004','E',11)"]],
  ["shipped+pending", ["INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30004','E','b000001')",
                       "INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30','C30004','E',11)"]],
  ["shipped+staged", ["INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30004','E','b000001')",
                      "INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30004','E')"]],
]) {
  await card("C30004", "C30", 4);
  await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30004','A','b000001')");
  for (const s of sql) await q(s);
  await expect(`B: duplicate across ${l}`, "duplicate", "C30004");
}

// C. shipped E whose own A never shipped (D91 order break)
await card("C30005", "C30", 5);
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30005','E','b000001')");
await q("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30005','A')"); // A present, just unshipped
await expect("C: shipped E with an unshipped own A", "orderBreak", "C30005");

// D. several at once, all named
await card("C30006", "C30", 6);
await card("C30007", "C30", 7);
await q("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ('C30007','E','b000001')");
await q("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30','C30007','A')");
r = await checkOccurrenceIntegrity(pool);
info(`combined: ${JSON.stringify(r.counts)} -> ${r.anomalies.map((a) => `${a.kind}:${a.cardId}`).join(", ")}`);
assert.equal(r.anomalies.length, 2);
const html = renderIntegrityBanner(r);
for (const id of ["C30006", "C30007"]) assert.match(html, new RegExp(id));
assert.match(html, /2 anomalies/);
ok("two anomaly kinds at once: both card ids named in the banner");
await reset();
assert.deepEqual((await checkOccurrenceIntegrity(pool)).anomalies, [], "back to clean");
assert.equal(renderIntegrityBanner(await checkOccurrenceIntegrity(pool)), "", "and back to zero UI");
console.log("PASS integ");
await closePool();
