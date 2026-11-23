// THROWAWAY (independent tester). node .tester/scenarios2.js <name>
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
const counts = async (pool) => {
  const one = async (t) => Number((await pool.query(`SELECT count(*) c FROM ${t}`)).rows[0].c);
  return {
    card_slots: await one("card_slots"), staged: await one("staged_occurrences"),
    pending: await one("pending_occurrences"), shipped: await one("occurrence_shipments"),
    publications: await one("publications"), card_content: await one("card_content"),
  };
};
async function expectClean(pool, label) {
  const integ = await checkOccurrenceIntegrity(pool);
  assert.deepEqual(integ.anomalies, [], `${label}: integrity, got ${JSON.stringify(integ.anomalies)}`);
}

const scenarios = {
  // 8. happy path, counts before and after.
  async happyPath(env) {
    const c0 = await counts(env.pool);
    info(`before: ${JSON.stringify(c0)}`);
    env.addNotes(...Array.from({ length: 5 }, (_, i) => wordNote(`h${i}`)));
    const r = await runPublish(env.pool, env.config);
    assert.equal(r.published, true);
    const c1 = await counts(env.pool);
    info(`after run 1 (${r.buildId}): ${JSON.stringify(c1)}`);
    assert.deepEqual(c1, { card_slots: 5, staged: 0, pending: 5, shipped: 5, publications: 1, card_content: 5 });
    const { loadDeckCardModel } = await import("../../src/deckData.js");
    const bundlePath = path.join(env.dataDir, "ota", "bundle", `${r.buildId}.js`);
    const model = loadDeckCardModel(bundlePath);
    const deck = model.decks.find((d) => (d.Name || d.name) === "C30");
    assert.equal(deck.Cards.length, 5, "bundle holds exactly the 5 shipped A occurrences");
    assert.deepEqual(deck.Cards.map((c) => c.Card).sort(), ["C30001A","C30002A","C30003A","C30004A","C30005A"]);
    const current = JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", "current.json"), "utf8"));
    assert.equal(current.buildId, r.buildId);
    assert.equal(current.sha256, (await env.pool.query("SELECT bundle_sha FROM publications WHERE build_id=$1", [r.buildId])).rows[0].bundle_sha,
      "publications.bundle_sha (committed BEFORE publish) equals the sha of what actually got served");
    await expectClean(env.pool, "after run 1");
    ok(`run 1: 5 minted, 5 A shipped, 5 E queued, bundle+current.json agree, sha matches the pre-publish COMMIT`);
    // run 2: 5 more
    env.addNotes(...Array.from({ length: 5 }, (_, i) => wordNote(`h2${i}`)));
    const r2 = await runPublish(env.pool, env.config);
    const c2 = await counts(env.pool);
    info(`after run 2 (${r2.buildId}): ${JSON.stringify(c2)}`);
    assert.deepEqual(c2, { card_slots: 10, staged: 0, pending: 10, shipped: 10, publications: 2, card_content: 10 });
    const pend = (await env.pool.query("SELECT card_id, remaining FROM pending_occurrences ORDER BY id")).rows;
    assert.deepEqual(pend.slice(0, 5).map((p) => p.remaining), [6, 6, 6, 6, 6], "the first batch's E's drained 5 (11-5)");
    assert.deepEqual(pend.slice(5).map((p) => p.remaining), [11, 11, 11, 11, 11], "run 2's own E's are NOT decremented by the A's that created them");
    await expectClean(env.pool, "after run 2");
    ok("run 2: counts, countdowns and grid all correct; integrity clean");
  },

  // 4. the per-DECK drain, observed: one decrement pass per deck per run,
  // across TWO decks, with a non-draining row whose arithmetic proves it.
  async perDeckDrain(env) {
    env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)),
      ...Array.from({ length: 6 }, (_, i) => wordNote(`v${i}`, { type: "expression" })));
    const r0 = await runPublish(env.pool, env.config);
    assert.equal(r0.published, true);
    const decks = (await env.pool.query("SELECT DISTINCT deck_code FROM pending_occurrences ORDER BY 1")).rows.map((x) => x.deck_code);
    info(`decks with a queue: ${decks.join(", ")}`);
    // every queued E parked high enough that none can drain this run
    await env.pool.query("UPDATE pending_occurrences SET remaining = 100");
    // 14 recovered cards per deck (> the 11 of the b000040 fingerprint)
    const recovered = [];
    for (const deckCode of decks) {
      const { rows } = await env.pool.query("SELECT COALESCE(MAX(card_no),0) m FROM card_slots WHERE deck_code=$1", [deckCode]);
      let n = Number(rows[0].m) + 1;
      for (let i = 0; i < 14; i++) {
        const noteId = `r_${deckCode}_${i}`;
        const cardId = `${deckCode}${String(n).padStart(3, "0")}`;
        await env.pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1,$2,$3,$4)", [cardId, deckCode, n, noteId]);
        await env.pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1,$2)", [noteId, cardId]);
        await env.pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ($1,$2,'E',100)", [deckCode, cardId]);
        recovered.push({ deckCode, cardId, noteId });
        n += 1;
      }
    }
    env.addNotes(...recovered.map((x) => wordNote(x.noteId, x.deckCode.startsWith("C2") ? { type: "expression" } : {})));
    const before = (await env.pool.query("SELECT deck_code, card_id, remaining FROM pending_occurrences ORDER BY id")).rows;
    const r = await runPublish(env.pool, env.config);
    assert.equal(r.published, true);
    const after = (await env.pool.query("SELECT deck_code, card_id, remaining FROM pending_occurrences ORDER BY id")).rows;
    const byDeck = new Map();
    for (const b of before) {
      const a = after.find((x) => x.card_id === b.card_id);
      assert.ok(a, `${b.card_id}'s queue row must survive (remaining 100, cannot drain)`);
      const delta = b.remaining - a.remaining;
      if (!byDeck.has(b.deck_code)) byDeck.set(b.deck_code, new Set());
      byDeck.get(b.deck_code).add(delta);
    }
    for (const [deckCode, deltas] of byDeck) {
      assert.equal(deltas.size, 1, `${deckCode}: every queue row decremented by the SAME amount, got ${[...deltas]}`);
      const d = [...deltas][0];
      const recoveredInDeck = recovered.filter((x) => x.deckCode === deckCode).length;
      info(`${deckCode}: ${recoveredInDeck} cards recovered, every queue row decremented by exactly ${d}`);
      assert.equal(d, recoveredInDeck, `${deckCode}: ONE pass of ${recoveredInDeck}, not ${recoveredInDeck} passes`);
    }
    const drainLines = (await env.pool.query("SELECT line FROM job_logs WHERE build_job_id=(SELECT max(id) FROM build_jobs) AND line LIKE 'drain:%' ORDER BY id")).rows.map((x) => x.line);
    assert.equal(drainLines.length, byDeck.size, `one drain pass per deck, got ${JSON.stringify(drainLines)}`);
    info(`drain log lines: ${JSON.stringify(drainLines)}`);
    for (const deckCode of decks) {
      const p = await places(env.pool, deckCode);
      assert.deepEqual([...p.entries()].filter(([, w]) => w.length !== 1), [], `${deckCode}: exactly one place each`);
    }
    await expectClean(env.pool, "after per-deck recovery");
    ok(`per-deck drain proven arithmetically across ${byDeck.size} deck(s); no duplicates; integrity clean`);
  },

  // Probe: a D86-recovered card whose E is already STAGED (not pending).
  // hasPendingOccurrence only looks at pending_occurrences.
  async recoveredEAlreadyStaged(env) {
    env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
    const r0 = await runPublish(env.pool, env.config);
    assert.equal(r0.published, true);
    // Build the state by hand: a card with NO shipments (so replay cannot
    // rebuild it -> D86 fires) whose A and E are both already STAGED.
    const noteId = "ghost";
    const cardId = "C30099";
    await env.pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1,'C30',99,$2)", [cardId, noteId]);
    await env.pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1,$2)", [noteId, cardId]);
    await env.pool.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ($1,'ghost-n','ghost-e','','N')", [cardId]);
    await env.pool.query("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30',$1,'A')", [cardId]);
    await env.pool.query("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ('C30',$1,'E')", [cardId]);
    env.addNotes(wordNote(noteId));
    const r = await runPublish(env.pool, env.config);
    info(`run published=${r.published} ${r.buildId || ""}`);
    const p = await places(env.pool, "C30");
    const bad = [...p.entries()].filter(([, w]) => w.length !== 1);
    const integ = await checkOccurrenceIntegrity(env.pool);
    info(`C30099: A=${JSON.stringify(p.get("C30099/A"))} E=${JSON.stringify(p.get("C30099/E"))}`);
    info(`duplicates: ${JSON.stringify(bad)}`);
    info(`integrity: ${JSON.stringify(integ.anomalies)}`);
    assert.deepEqual(bad, [], "a recovered card whose E is already staged must not be double-accounted");
    ok("recovered card with a pre-staged E stayed single-accounted");
  },

  // 7. D-F1: tolerated per-note audio failures must not roll the run back.
  async dF1Tolerance(env) {
    // Every blob the fake stabbur serves is plain text, so ffprobe fails on
    // all of them — the "unreadable blob with no selection ships untouched"
    // tolerance. Plus two bad selections that bail out before ffmpeg.
    const fresh = Array.from({ length: 5 }, (_, i) => wordNote(`d${i}`));
    fresh[1].audio_sel_ms = [null, null];   // not two real numbers -> bail
    env.addNotes(...fresh);
    const r = await runPublish(env.pool, env.config);
    assert.equal(r.published, true, "one bad note must not fail the whole publish (D-F1)");
    const c = await counts(env.pool);
    info(`counts: ${JSON.stringify(c)}`);
    assert.equal(c.shipped, 5, "all five A's shipped despite unreadable blobs and a junk selection");
    assert.equal(c.pending, 5);
    await expectClean(env.pool, "after the tolerated failures");
    const manifest = JSON.parse(fs.readFileSync(path.join(env.dataDir, "ota", r.buildId, "audio.json"), "utf8"));
    assert.equal(Object.keys(manifest).length, 5, "audio manifest still covers every card");
    ok("tolerated per-note audio failures did NOT roll back the consumption transaction");
  },

  // 7b. The UNtolerated one (pre-existing, unchanged by this change):
  // probeDurationMs runs ffprobe unguarded, so a selection on an unreadable
  // blob throws out of ensureBlobsPresent — the exact 2026-11-09 shape.
  // What matters here is that it now consumes nothing.
  async dF1Untolerated(env) {
    env.addNotes(...Array.from({ length: 6 }, (_, i) => wordNote(`s${i}`)));
    assert.equal((await runPublish(env.pool, env.config)).published, true);
    await env.pool.query("UPDATE pending_occurrences SET remaining = 99");
    await env.pool.query("UPDATE pending_occurrences SET remaining = 1 WHERE card_id='C30001'");
    const before = await snapshot(env.pool);
    const fresh = Array.from({ length: 4 }, (_, i) => wordNote(`u${i}`));
    fresh[3].audio_sel_ms = [1000, 2000];   // selection -> probeDurationMs -> ffprobe throws
    env.addNotes(...fresh);
    let err = null;
    try { await runPublish(env.pool, env.config); } catch (e) { err = e; }
    assert.ok(err, "the run must fail");
    info(`run failed with: ${String(err.message).split("\n")[0]}`);
    const after = await snapshot(env.pool);
    for (const row of before.staged) assert.ok(after.staged.some((x) => x.id === row.id), `staged ${row.card_id}/${row.letter} CONSUMED`);
    assert.deepEqual(before.shipped, after.shipped, "no shipment rows");
    assert.deepEqual(before.publications, after.publications, "no publication row");
    for (const pr of before.pending) {
      const now = after.pending.find((x) => x.id === pr.id);
      assert.ok(now && now.remaining === pr.remaining, `pending ${pr.card_id}/${pr.letter} countdown moved`);
    }
    ok("an ffprobe failure inside ensureBlobsPresent (the 2026-11-09 mechanism) consumed nothing");
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
