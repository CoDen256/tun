// THROWAWAY (independent tester). Usage: node .tester/kill2.js seed|<kp>|verify
// Correct client patching: preserves pg's callback form, so a patched client
// returned to the pool does not deadlock the next pool.query (the bug in
// killrun.js).
import fs from "node:fs";
import path from "node:path";
import assert from "node:assert/strict";
import { setup, wordNote, shaOf, places, snapshot } from "./common.js";
import { runPublish } from "../src/pipeline.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
import { getPool, closePool } from "../src/db.js";

const phase = process.argv[2];
const SNAP = process.env.FA_SNAP || "/tmp/fa2_snap.json";
const KILL = (why) => { fs.writeSync(1, `KILLPOINT ${why}\n`); process.kill(process.pid, "SIGKILL"); };

if (phase === "seed") {
  const env = await setup({ fresh: true });
  env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
  const r = await runPublish(env.pool, env.config);
  assert.equal(r.published, true);
  await env.pool.query("UPDATE pending_occurrences SET remaining = 99 WHERE deck_code='C30'");
  await env.pool.query("UPDATE pending_occurrences SET remaining = 1 WHERE card_id='C30001' AND letter='E'");
  const { rows } = await env.pool.query("SELECT letter FROM occurrence_shipments WHERE card_id='C30001'");
  assert.ok(rows.some((x) => x.letter === "A"), "C30001's A already shipped (non-self-healing shape)");
  env.addNotes(...Array.from({ length: 4 }, (_, i) => wordNote(`k${i}`)));
  fs.writeFileSync(SNAP, JSON.stringify({
    snap: await snapshot(env.pool),
    current: JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8")),
    bundles: fs.readdirSync(path.join(env.dataDir, "ota", "bundle")).filter((f) => f.endsWith(".js"))
      .map((f) => [f, shaOf(fs.readFileSync(path.join(env.dataDir, "ota", "bundle", f), "utf8"))]),
  }));
  console.log(`seeded; baseline buildId=${r.buildId}`);
  await env.fake.close();
  await closePool();
} else if (phase === "verify") {
  const env = await setup({ fresh: false });
  const before = JSON.parse(fs.readFileSync(SNAP, "utf8"));
  const after = await snapshot(env.pool);
  const otaDir = path.join(env.dataDir, "ota");
  const currentAfter = JSON.parse(fs.readFileSync(path.join(otaDir, "current.json"), "utf8"));
  console.log(`  current.json ${before.current.buildId} -> ${currentAfter.buildId}`);
  console.log(`  publications ${JSON.stringify(before.snap.publications.map((p) => p.build_id))} -> ${JSON.stringify(after.publications.map((p) => p.build_id))}`);
  console.log(`  shipped ${before.snap.shipped.length} -> ${after.shipped.length}; staged ${before.snap.staged.length} -> ${after.staged.length}; pending ${before.snap.pending.length} -> ${after.pending.length}`);

  const committed = after.publications.length > before.snap.publications.length;
  console.log(`  consumption transaction committed before the kill: ${committed}`);
  // (1) nothing consumed without being recorded
  for (const r of before.snap.staged) {
    const stillStaged = after.staged.some((x) => x.id === r.id);
    const shippedNow = after.shipped.some((s) => s.card_id === r.card_id && s.letter === r.letter);
    assert.ok(stillStaged || shippedNow, `LOST: staged ${r.card_id}/${r.letter} neither staged nor shipped`);
  }
  for (const r of before.snap.pending) {
    const now = after.pending.find((x) => x.id === r.id);
    const shippedNow = after.shipped.some((s) => s.card_id === r.card_id && s.letter === r.letter);
    const stagedNow = after.staged.some((s) => s.card_id === r.card_id && s.letter === r.letter);
    assert.ok(now || shippedNow || stagedNow, `LOST: pending ${r.card_id}/${r.letter} is nowhere`);
    if (now && !committed) assert.equal(now.remaining, r.remaining, `pending ${r.card_id}/${r.letter} countdown moved WITHOUT a commit`);
  }
  // (2) exactly one place, integrity clean
  const p = await places(env.pool, "C30");
  assert.deepEqual([...p.entries()].filter(([, w]) => w.length !== 1), [], "every occurrence in exactly one place");
  const integ = await checkOccurrenceIntegrity(env.pool);
  assert.deepEqual(integ.anomalies, [], `integrity clean, got ${JSON.stringify(integ.anomalies)}`);
  console.log(`  OK ${p.size} occurrences, each in exactly one place; integrity clean`);
  // (3) D62: no buildId's bytes ever changed
  const seen = new Map(before.bundles);
  for (const f of fs.readdirSync(path.join(otaDir, "bundle")).filter((f) => f.endsWith(".js"))) {
    const sha = shaOf(fs.readFileSync(path.join(otaDir, "bundle", f), "utf8"));
    if (seen.has(f)) assert.equal(sha, seen.get(f), `D62: ${f} bytes CHANGED`);
    seen.set(f, sha);
  }
  // (4) the next run carries everything through to shipped
  const owed = [...before.snap.staged.map((r) => `${r.card_id}/${r.letter}`), "C30001/E"];
  let r2 = null;
  for (let round = 0; round < 3; round++) {
    env.addNotes(...Array.from({ length: 5 }, (_, i) => wordNote(`p${round}_${i}`)));
    r2 = await runPublish(env.pool, env.config);
    assert.equal(r2.published, true);
    assert.ok(!before.snap.publications.some((x) => x.build_id === r2.buildId), `fresh buildId (${r2.buildId})`);
    const sh = new Set((await snapshot(env.pool)).shipped.map((s) => `${s.card_id}/${s.letter}`));
    console.log(`  recovery round ${round} -> ${r2.buildId}; owed-not-yet-shipped: ${owed.filter((k) => !sh.has(k)).join(",") || "none"}`);
    if (owed.every((k) => sh.has(k))) break;
  }
  for (const f of fs.readdirSync(path.join(otaDir, "bundle")).filter((f) => f.endsWith(".js"))) {
    const sha = shaOf(fs.readFileSync(path.join(otaDir, "bundle", f), "utf8"));
    if (seen.has(f)) assert.equal(sha, seen.get(f), `D62: ${f} bytes CHANGED across runs`);
    seen.set(f, sha);
  }
  const after2 = await snapshot(env.pool);
  const shippedNow = new Set(after2.shipped.map((s) => `${s.card_id}/${s.letter}`));
  const notShipped = owed.filter((k) => !shippedNow.has(k));
  assert.deepEqual(notShipped, [], `every pre-kill owed occurrence must reach shipped: missing ${notShipped}`);
  const p2 = await places(env.pool, "C30");
  assert.deepEqual([...p2.entries()].filter(([, w]) => w.length !== 1), [], "still exactly one place after recovery");
  const integ2 = await checkOccurrenceIntegrity(env.pool);
  assert.deepEqual(integ2.anomalies, [], `integrity clean after recovery, got ${JSON.stringify(integ2.anomalies)}`);
  console.log(`  OK recovery run ${r2.buildId}: shipped ${after.shipped.length} -> ${after2.shipped.length}; every pre-kill owed occurrence shipped`);
  console.log(`  current.json now ${JSON.parse(fs.readFileSync(path.join(otaDir, "current.json"), "utf8")).buildId}; bundles ${[...seen.keys()].sort().join(" ")}`);
  await env.fake.close();
  await closePool();
} else {
  const env = await setup({ fresh: false });
  const pool = getPool();
  // --- correct, transparent client patch ---
  const origConnect = pool.connect.bind(pool);
  const patch = (client) => {
    if (client.__kp) return client;
    client.__kp = true;
    const oq = client.query.bind(client);
    client.query = function (...qa) {
      const s = typeof qa[0] === "string" ? qa[0] : (qa[0] && qa[0].text) || "";
      const fire = () => {
        if (phase === "indelete" && /DELETE FROM staged_occurrences WHERE id/.test(s)) KILL("inside the transaction, right after DELETE FROM staged_occurrences");
        if (/INSERT INTO publications/.test(s)) client.__sawPub = true;
        if (phase === "postcommit" && client.__sawPub && s.trim() === "COMMIT") KILL("immediately after commitRun's COMMIT returned, before publish()");
      };
      const last = qa[qa.length - 1];
      if (typeof last === "function") {
        qa[qa.length - 1] = function (err, res) { if (!err) fire(); return last(err, res); };
        return oq(...qa);
      }
      return oq(...qa).then((r) => { fire(); return r; });
    };
    return client;
  };
  pool.connect = function (...a) {
    if (typeof a[0] === "function") return origConnect((err, c, done) => a[0](err, c && patch(c), done));
    return origConnect().then(patch);
  };
  if (phase === "flush") {
    const oq = pool.query.bind(pool);
    pool.query = function (...qa) {
      const s = typeof qa[0] === "string" ? qa[0] : (qa[0] && qa[0].text) || "";
      const fire = () => { if (/SELECT id, card_id, letter FROM staged_occurrences/.test(s)) KILL("during the read-only flush selection"); };
      const last = qa[qa.length - 1];
      if (typeof last === "function") { qa[qa.length - 1] = function (e, r) { if (!e) fire(); return last(e, r); }; return oq(...qa); }
      return oq(...qa).then((r) => { fire(); return r; });
    };
  }
  if (phase === "inpublish") {
    const origRename = fs.renameSync;
    fs.renameSync = function (a, b) {
      const r = origRename(a, b);
      if (String(b).includes(path.join("ota", "bundle"))) KILL("inside publish(), after the bundle file landed, before current.json was repointed");
      return r;
    };
  }
  await runPublish(env.pool, env.config);
  console.log("UNEXPECTED: the run completed without being killed");
}
