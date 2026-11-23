// THROWAWAY. Usage: node .tester/scenarios.js <name>
import fs from "node:fs";
import path from "node:path";
import assert from "node:assert/strict";
import { setup, wordNote, shaOf, places, snapshot } from "./common.js";
import { runPublish } from "../src/pipeline.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
import { closePool } from "../src/db.js";

const name = process.argv[2];
const ok = (m) => console.log(`  OK   ${m}`);
const info = (m) => console.log(`  ..   ${m}`);

function diffSnap(a, b) {
  const key = (r) => JSON.stringify(r);
  const out = {};
  for (const t of ["staged", "pending", "shipped", "publications"]) {
    const A = a[t].map(key), B = b[t].map(key);
    out[t] = { onlyBefore: A.filter((x) => !B.includes(x)), onlyAfter: B.filter((x) => !A.includes(x)) };
  }
  return out;
}

// Seed: 6 cards in C30, 5 A's shipped, 1 A staged, 6 E's queued.
// Then C30001's E is set one step from draining (its A is already shipped —
// the non-self-healing shape).
async function seedBase(env) {
  env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
  const r = await runPublish(env.pool, env.config);
  assert.equal(r.published, true);
  await env.pool.query("UPDATE pending_occurrences SET remaining = 99 WHERE deck_code='C30'");
  await env.pool.query("UPDATE pending_occurrences SET remaining = 1 WHERE card_id='C30001' AND letter='E'");
  const { rows } = await env.pool.query("SELECT letter FROM occurrence_shipments WHERE card_id='C30001'");
  assert.ok(rows.some((x) => x.letter === "A"), "C30001's A must already be shipped");
  return r.buildId;
}

// Add `k` fresh notes so the flush actually fires this run.
async function addFlushingNotes(env, k, tag) {
  const fresh = Array.from({ length: k }, (_, i) => wordNote(`${tag}${i}`));
  env.addNotes(...fresh);
  return fresh;
}

async function expectInvariant(pool, label) {
  const p = await places(pool, "C30");
  const bad = [...p.entries()].filter(([, w]) => w.length !== 1);
  assert.deepEqual(bad, [], `${label}: every owed occurrence in exactly one place`);
  const integ = await checkOccurrenceIntegrity(pool);
  assert.deepEqual(integ.anomalies, [], `${label}: integrity check clean, got ${JSON.stringify(integ.anomalies)}`);
  ok(`${label}: ${p.size} occurrences, each in exactly one of shipped/staged/pending; integrity clean`);
  return p;
}

const scenarios = {
  // FP-A: failure BEFORE the transaction, after the flush (the 2026-11-09 shape).
  async failAfterFlush(env) {
    await seedBase(env);
    const before = await snapshot(env.pool);
    const fresh = await addFlushingNotes(env, 4, "fa");
    // real mechanism: last note's blob was never registered with stabbur
    fresh[fresh.length - 1].audio_blob = shaOf("never-registered-A");
    env.fake.setNotes([...env.notes]);
    await assert.rejects(() => runPublish(env.pool, env.config), /could not fetch blob/);
    const after = await snapshot(env.pool);
    for (const r of before.staged) {
      assert.ok(after.staged.some((x) => x.id === r.id && x.card_id === r.card_id && x.letter === r.letter),
        `staged row ${r.id} (${r.card_id}/${r.letter}) was CONSUMED by a run that then failed`);
    }
    info(`staged ${before.staged.length} -> ${after.staged.length} (growth is this run's own mint-time inserts, D-FA1)`);
    assert.deepEqual(before.shipped, after.shipped, "occurrence_shipments untouched");
    assert.deepEqual(before.publications, after.publications, "publications untouched");
    for (const p of before.pending) {
      const now = after.pending.find((x) => x.id === p.id);
      assert.ok(now, `pending row ${p.id} survived`);
      assert.equal(now.remaining, p.remaining, `pending row ${p.id} countdown unchanged`);
    }
    ok("failure after flush consumed nothing (staged/shipped/publications byte-identical; countdowns unchanged)");
    // re-run succeeds and everything lands exactly once
    env.fake.addBlob(shaOf("never-registered-A"), "never-registered-A");
    const r = await runPublish(env.pool, env.config);
    assert.equal(r.published, true);
    const p = await expectInvariant(env.pool, "after recovery run");
    const pend = (await env.pool.query("SELECT card_id, letter, remaining FROM pending_occurrences WHERE deck_code='C30' ORDER BY id")).rows;
    const drains = (await env.pool.query("SELECT j.id, l.line FROM job_logs l JOIN build_jobs j ON j.id=l.build_job_id WHERE l.line LIKE 'drain:%' OR l.line LIKE 'ship:%' ORDER BY l.id")).rows;
    for (const d of drains) info(`job ${d.id}: ${d.line}`);
    info(`C30001/E now: ${JSON.stringify(p.get("C30001/E"))} remaining=${pend.find((x)=>x.card_id==="C30001").remaining}`);
    info(`pending remainings: ${JSON.stringify(pend.map((x)=>[x.card_id,x.remaining]))}`);
  },

  // FP-B: failure INSIDE the transaction — a real constraint violation from
  // 019's unique index on occurrence_shipments, hit by recordShipments.
  async failInsideTransaction(env) {
    await seedBase(env);
    // Make C30006's A (currently staged, will flush this run) already present
    // in occurrence_shipments under an older build, so recordShipments' INSERT
    // violates occurrence_shipments_card_letter_idx INSIDE the transaction.
    const { rows: st } = await env.pool.query("SELECT card_id, letter FROM staged_occurrences WHERE deck_code='C30'");
    assert.ok(st.length > 0, "something staged");
    const victim = st[0];
    const { rows: pubs } = await env.pool.query("SELECT build_id FROM publications ORDER BY build_id LIMIT 1");
    await env.pool.query("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ($1,$2,$3)", [
      victim.card_id, victim.letter, pubs[0].build_id,
    ]);
    const before = await snapshot(env.pool);
    await addFlushingNotes(env, 4, "fb");
    let err = null;
    try { await runPublish(env.pool, env.config); } catch (e) { err = e; }
    assert.ok(err, "the run must fail");
    info(`run failed with: ${err.message.split("\n")[0]}`);
    const after = await snapshot(env.pool);
    for (const r of before.staged) {
      assert.ok(after.staged.some((x) => x.id === r.id), `staged row ${r.id} (${r.card_id}/${r.letter}) was CONSUMED despite the rollback`);
    }
    info(`staged ${before.staged.length} -> ${after.staged.length} (pre-run rows all survive; growth is this run's mint-time inserts)`);
    assert.deepEqual(before.shipped, after.shipped, "no shipment row survived the rollback");
    assert.deepEqual(before.publications, after.publications, "no publication row survived the rollback");
    for (const p of before.pending) {
      const now = after.pending.find((x) => x.id === p.id);
      assert.ok(now && now.remaining === p.remaining, `pending row ${p.id} unchanged`);
    }
    ok("a failure inside the transaction rolled back publication + shipments + deletes + decrements, atomically");
  },

  // FP-C: failure BETWEEN COMMIT and publish() — publish() itself refuses,
  // for real (D62 reuse guard: the destination already holds different bytes).
  async failInPublish(env) {
    const firstBuild = await seedBase(env);
    await addFlushingNotes(env, 4, "fc");
    // The next buildId is max+1.
    const { rows } = await env.pool.query("SELECT build_id FROM publications ORDER BY build_id DESC LIMIT 1");
    const n = Number(rows[0].build_id.slice(1)) + 1;
    const nextBuild = `b${String(n).padStart(6, "0")}`;
    const bundleDir = path.join(env.dataDir, "ota", "bundle");
    fs.mkdirSync(bundleDir, { recursive: true });
    fs.writeFileSync(path.join(bundleDir, `${nextBuild}.js`), "// squatter bytes, not this run's bundle\n");
    const currentBefore = JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8"));
    let err = null;
    try { await runPublish(env.pool, env.config); } catch (e) { err = e; }
    assert.ok(err, "publish() must refuse");
    info(`publish refused: ${err.message.split("\n")[0]}`);
    const after = await snapshot(env.pool);
    assert.ok(after.publications.some((p) => p.build_id === nextBuild), `${nextBuild} committed before publish()`);
    const currentAfter = JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8"));
    assert.equal(currentAfter.buildId, currentBefore.buildId, "current.json still names the previous build");
    ok(`COMMIT happened (${nextBuild} in publications) while current.json still names ${currentBefore.buildId}`);
    await expectInvariant(env.pool, "after the committed-but-unpublished run");
    // Next run: fresh buildId, bundle contains everything recorded.
    fs.rmSync(path.join(bundleDir, `${nextBuild}.js`));
    const committedShipments = (await env.pool.query("SELECT card_id, letter FROM occurrence_shipments ORDER BY id")).rows;
    const r2 = await runPublish(env.pool, env.config);
    assert.equal(r2.published, true);
    assert.notEqual(r2.buildId, nextBuild, "the next run must NOT reuse the committed buildId");
    assert.notEqual(r2.buildId, firstBuild, "…nor any earlier one");
    info(`next run published ${r2.buildId} (skipping ${nextBuild})`);
    const { loadDeckCardModel } = await import("../../src/deckData.js");
    const model = loadDeckCardModel(path.join(bundleDir, `${r2.buildId}.js`));
    const deck = model.decks.find((d) => d.Name === "C30" || d.name === "C30");
    const inBundle = new Set((deck.Cards || []).map((c) => c.Card));
    const missing = committedShipments.filter((s) => !inBundle.has(`${s.card_id}${s.letter}`));
    assert.deepEqual(missing, [], "every occurrence the orphaned commit recorded is in the next bundle");
    ok(`all ${committedShipments.length} recorded occurrences present in ${r2.buildId}'s bundle (replay rebuilt them)`);
    // D62: no buildId's bytes ever changed.
    await expectInvariant(env.pool, "after the recovery publish");
  },

  // D-FA3: the b000040 fingerprint.
  async massRecovery(env) {
    await seedBase(env);
    await env.pool.query("UPDATE pending_occurrences SET remaining = 11 WHERE deck_code='C30'");
    const { rows: maxRow } = await env.pool.query("SELECT COALESCE(MAX(card_no),0) AS m FROM card_slots WHERE deck_code='C30'");
    let nextNo = Number(maxRow[0].m) + 1;
    const recovered = [];
    for (let i = 0; i < 30; i++) {
      const noteId = `rec${i}`;
      const cardId = `C30${String(nextNo).padStart(3, "0")}`;
      nextNo += 1;
      await env.pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1,'C30',$2,$3)", [cardId, Number(cardId.slice(-3)), noteId]);
      await env.pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1,$2)", [noteId, cardId]);
      await env.pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30',$1,'E',11)", [cardId]);
      recovered.push({ noteId, cardId });
    }
    env.addNotes(...recovered.map((r) => wordNote(r.noteId)));
    const pendingBefore = Number((await env.pool.query("SELECT count(*) c FROM pending_occurrences WHERE deck_code='C30'")).rows[0].c);
    const drainCallsBefore = 0;
    const r = await runPublish(env.pool, env.config);
    assert.equal(r.published, true);
    const p = await expectInvariant(env.pool, "after mass recovery");
    const pendingAfter = Number((await env.pool.query("SELECT count(*) c FROM pending_occurrences WHERE deck_code='C30'")).rows[0].c);
    assert.ok(pendingAfter <= pendingBefore, `queue may only shrink: ${pendingBefore} -> ${pendingAfter}`);
    ok(`pending queue ${pendingBefore} -> ${pendingAfter} (no re-queue)`);
    // A before E, in real shipment order
    const { rows: ship } = await env.pool.query("SELECT card_id, letter FROM occurrence_shipments os JOIN card_slots cs ON cs.id=os.card_id WHERE cs.deck_code='C30' ORDER BY os.id");
    const order = ship.map((s) => `${s.card_id}/${s.letter}`);
    let checked = 0;
    for (const { cardId } of recovered) {
      const a = order.indexOf(`${cardId}/A`), e = order.indexOf(`${cardId}/E`);
      if (a === -1 || e === -1) continue;
      assert.ok(a < e, `${cardId}: A@${a} must precede E@${e}`);
      checked++;
    }
    ok(`A-before-E verified for ${checked} recovered card(s) with both letters shipped`);
    // count drain log lines for C30 in this run
    const { rows: logs } = await env.pool.query("SELECT line FROM job_logs WHERE build_job_id=(SELECT max(id) FROM build_jobs) AND line LIKE 'drain: C30%'");
    assert.equal(logs.length, 1, `exactly ONE drain pass for C30 this run, got ${logs.length}: ${JSON.stringify(logs)}`);
    ok(`exactly one drain pass for C30 in the run (log: ${logs[0].line})`);
  },
};

const env = await setup();
try {
  await scenarios[name](env);
  console.log(`PASS ${name}`);
} finally {
  await env.fake.close();
  await closePool();
}
