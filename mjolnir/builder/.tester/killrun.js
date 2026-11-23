// THROWAWAY. Usage: node .tester/killrun.js seed|<killphase>|verify <arg>
import fs from "node:fs";
import path from "node:path";
import assert from "node:assert/strict";
import { setup, wordNote, shaOf, places, snapshot } from "./common.js";
import { runPublish } from "../src/pipeline.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
import { getPool, closePool } from "../src/db.js";

const phase = process.argv[2];
const SNAP = process.env.FA_SNAP || "/tmp/fa_snap.json";

if (phase === "seed") {
  const env = await setup({ fresh: true });
  env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
  const r = await runPublish(env.pool, env.config);
  assert.equal(r.published, true);
  await env.pool.query("UPDATE pending_occurrences SET remaining = 99 WHERE deck_code='C30'");
  await env.pool.query("UPDATE pending_occurrences SET remaining = 1 WHERE card_id='C30001' AND letter='E'");
  // the run that will be killed mints 4 fresh cards -> flush fires
  env.addNotes(...Array.from({ length: 4 }, (_, i) => wordNote(`k${i}`)));
  fs.writeFileSync(SNAP, JSON.stringify({
    snap: await snapshot(env.pool),
    current: JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8")),
  }));
  console.log(`seeded; baseline buildId=${r.buildId}`);
  await env.fake.close();
  await closePool();
} else if (phase === "verify") {
  const env = await setup({ fresh: false });
  const { snap: before, current: currentBefore } = JSON.parse(fs.readFileSync(SNAP, "utf8"));
  const after = await snapshot(env.pool);
  const currentAfter = JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8"));
  console.log(`  current.json: ${currentBefore.buildId} -> ${currentAfter.buildId}`);
  console.log(`  publications: ${JSON.stringify(before.publications.map((p) => p.build_id))} -> ${JSON.stringify(after.publications.map((p) => p.build_id))}`);
  console.log(`  shipped:  ${before.shipped.length} -> ${after.shipped.length}`);
  console.log(`  staged:   ${before.staged.length} -> ${after.staged.length}`);
  console.log(`  pending:  ${before.pending.length} -> ${after.pending.length}`);
  for (const r of before.staged) {
    assert.ok(after.staged.some((x) => x.id === r.id), `CONSUMED: staged row ${r.id} ${r.card_id}/${r.letter} vanished`);
  }
  for (const r of before.pending) {
    const now = after.pending.find((x) => x.id === r.id);
    const shippedNow = after.shipped.some((s) => s.card_id === r.card_id && s.letter === r.letter);
    const stagedNow = after.staged.some((s) => s.card_id === r.card_id && s.letter === r.letter);
    assert.ok(now || shippedNow || stagedNow, `LOST: pending ${r.card_id}/${r.letter} is nowhere`);
    if (now && !shippedNow && !stagedNow) {
      console.log(`  pending ${r.card_id}/${r.letter}: remaining ${r.remaining} -> ${now.remaining}`);
    }
  }
  const p = await places(env.pool, "C30");
  const bad = [...p.entries()].filter(([, w]) => w.length !== 1);
  assert.deepEqual(bad, [], "every occurrence in exactly one place");
  const integ = await checkOccurrenceIntegrity(env.pool);
  assert.deepEqual(integ.anomalies, [], `integrity clean, got ${JSON.stringify(integ.anomalies)}`);
  console.log(`  OK every one of ${p.size} occurrences in exactly one place; integrity clean`);
  // and the next run brings everything through
  env.addNotes(wordNote("post0"), wordNote("post1"), wordNote("post2"), wordNote("post3"), wordNote("post4"));
  const r2 = await runPublish(env.pool, env.config);
  assert.equal(r2.published, true);
  console.log(`  next run published ${r2.buildId}`);
  assert.ok(!before.publications.some((x) => x.build_id === r2.buildId), "fresh buildId, never a reused one");
  const after2 = await snapshot(env.pool);
  const p2 = await places(env.pool, "C30");
  const bad2 = [...p2.entries()].filter(([, w]) => w.length !== 1);
  assert.deepEqual(bad2, [], "still exactly one place after the recovery run");
  const integ2 = await checkOccurrenceIntegrity(env.pool);
  assert.deepEqual(integ2.anomalies, [], `integrity clean after recovery, got ${JSON.stringify(integ2.anomalies)}`);
  console.log(`  OK after recovery run: shipped ${after.shipped.length} -> ${after2.shipped.length}, ${p2.size} occurrences, integrity clean`);
  // D62: no bundle file's bytes ever changed for a given buildId
  const bundleDir = path.join(env.dataDir, "ota", "bundle");
  console.log(`  ota/bundle: ${fs.readdirSync(bundleDir).filter((f) => f.endsWith(".js")).sort().join(" ")}`);
  await env.fake.close();
  await closePool();
} else {
  const env = await setup({ fresh: false });
  const pool = getPool();
  const origConnect = pool.connect.bind(pool);
  pool.connect = function (...a) {
    // pg's Pool.query() itself calls connect(cb) — only the promise form
    // (no callback) is the checked-out client commitRun uses.
    if (typeof a[0] === "function") return origConnect(...a);
    return (async () => {
    const client = await origConnect();
    const origQuery = client.query.bind(client);
    client.query = async (sql, params) => {
      const r = await origQuery(sql, params);
      const s = typeof sql === "string" ? sql : sql.text || "";
      if (phase === "precommit" && /DELETE FROM staged_occurrences/.test(s)) {
        fs.writeSync(1, "KILL: SIGKILL immediately after DELETE FROM staged_occurrences, inside the open transaction\n");
        process.kill(process.pid, "SIGKILL");
      }
      if (phase === "postcommit" && s.trim() === "COMMIT") {
        fs.writeSync(1, "KILL: SIGKILL immediately after COMMIT returned, before publish()\n");
        process.kill(process.pid, "SIGKILL");
      }
      if (phase === "midflush" && /SELECT id, card_id, letter FROM staged_occurrences/.test(s)) {
        fs.writeSync(1, "KILL: SIGKILL during the flush selection\n");
        process.kill(process.pid, "SIGKILL");
      }
      return r;
    };
    return client;
    })();
  };
  if (phase === "midflush") {
    const origPoolQuery = pool.query.bind(pool);
    pool.query = async (sql, params) => {
      const r = await origPoolQuery(sql, params);
      const s = typeof sql === "string" ? sql : sql.text || "";
      if (/SELECT id, card_id, letter FROM staged_occurrences/.test(s)) {
        fs.writeSync(1, "KILL: SIGKILL during the flush selection\n");
        process.kill(process.pid, "SIGKILL");
      }
      return r;
    };
  }
  await runPublish(env.pool, env.config);
  console.log("UNEXPECTED: the run completed without being killed");
}
