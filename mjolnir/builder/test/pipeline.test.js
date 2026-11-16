import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { runForecast, runPublish } from "../src/pipeline.js";
import { loadDeckCardModel } from "../../src/deckData.js";
import { runExplode } from "../../src/commands/explode.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { readModuleSource } from "../../src/parseBundle.js";
import { execFileSync } from "node:child_process";
import { startFakeStabbur, shaOf } from "./helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "./helpers/logicBundleFixture.js";
import { buildGrammarRuleLookup } from "../src/stabburClient.js";
import { occurrencesForBuild } from "../src/batchHistory.js";
import { makeDbLogger } from "../src/jobLogs.js";
import { shipOrderForDeck } from "../src/cardFlow.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
import { renderIntegrityBanner } from "../src/server.js";

// deck-consolidation: `assignDeck` now resolves every `type=word` note
// (any `pos`) and `type=expression` to the single `lexic` family (starts at
// C30), and `type=grammar`/`listening`/`pronunciation` to `practice`
// (starts at C20) — there is no longer a distinct deck per PoS/type to use
// as a cheap isolation trick between unrelated test scenarios. Where the
// original suite used a fresh PoS to get a fresh, untouched deck, this
// version either shares the one deck its family actually uses, or (for the
// elaborate multi-run queue-mechanics block) deliberately seeds `lexic`'s
// current code up to its 999-card cap first so deck-rollover hands it a
// genuinely fresh, untouched deck to work with — exercising rollover itself
// as a side effect, instead of picking a different PoS.
//
// All notes accumulate in one `notes` array across the whole suite (every
// run does a full pull, so every call to `fake.setNotes` must pass the
// FULL current set, not just what's new) — `addNotes(...)` appends and
// re-sets in one step.

const OTHER_MODULE_ID = 102;
const otherModuleSource = () =>
  `__d(function (g, r, i, a, m, e, d) {\n  m.exports = function greet() { return "hi"; };\n}, ${OTHER_MODULE_ID}, []);\n`;

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

function wordNote(id, overrides = {}) {
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
    context_text: "",
    audio_blob: shaOf(audioText),
    audio_sel_ms: null,
    grammar_rule_id: null,
    status: "ready",
    _audioText: audioText,
    ...overrides,
  };
}

function practiceNote(id, type, overrides = {}) {
  const audioText = `audio for ${id}`;
  return {
    id,
    created_at: "2026-10-01T00:00:00.000Z",
    capture_id: null,
    type,
    source_lang: "no",
    text: `${type}-${id}`,
    translations: [],
    transcription: "",
    pos: null,
    lemma: null,
    inflections: {},
    context_text: "",
    audio_blob: shaOf(audioText),
    audio_sel_ms: null,
    grammar_rule_id: null,
    status: "ready",
    _audioText: audioText,
    ...overrides,
  };
}

describe("builder pipeline: forecast + publish against a fixture stabbur and an active logic bundle", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, occurrence_shipments, job_logs, logic_bundles, card_content CASCADE"
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
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-builder-pipeline-"));
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource() + otherModuleSource());
  runExplode(logicBundlePath);
  const otherModuleBefore = readModuleSource(logicBundlePath, loadDeckCardModel(logicBundlePath).manifest[OTHER_MODULE_ID]);
  await seedActiveLogicBundle(pool, logicBundlePath);
  const dataDir = path.join(tmpDir, "data");

  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();

  const config = {
    stabburBaseUrl,
    internalToken: fake.authToken,
    sourceLang: "no",
    dataDir,
    publicBase: "https://tun.example.test",
    // Matches production's real wiring (server.js/clock.js) — without this,
    // runPublish's `log` defaults to a no-op and nothing ever reaches
    // job_logs, which several assertions below read back from.
    log: makeDbLogger(pool),
  };

  const notes = [];
  function addNotes(...newNotes) {
    notes.push(...newNotes);
    fake.setNotes([...notes]);
  }

  function outputModel(buildId) {
    return loadDeckCardModel(path.join(dataDir, "ota", "bundle", `${buildId}.js`));
  }

  async function pendingRows(deckCode) {
    const { rows } = await pool.query(
      "SELECT card_id, letter, remaining FROM pending_occurrences WHERE deck_code = $1 ORDER BY id",
      [deckCode]
    );
    return rows;
  }

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  await t.test("a scheduled run with zero newly-eligible notes writes nothing (D91: no floor, just nothing to do)", async () => {
    addNotes();
    const result = await runPublish(pool, config);
    assert.equal(result.published, false);
    const { rows } = await pool.query("SELECT count(*) FROM build_jobs");
    assert.equal(Number(rows[0].count), 0);
  });

  await t.test("forecast still reports a deck's pending queue depth even with zero newly-eligible notes today", async () => {
    // The FK on pending_occurrences.card_id needs a real card_slots row to
    // point at — a bare dummy id with no matching row is never a situation
    // the real pipeline produces anyway.
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('ZZZTST', 'C30', 999, 'zzz-note')");
    await pool.query(
      "INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30', 'ZZZTST', 'N', 5)"
    );
    try {
      const forecast = await runForecast(pool, config);
      const c30 = forecast.byDeck.find((d) => d.deckCode === "C30");
      assert.ok(c30, "C30 must appear in byDeck despite zero newly-eligible notes");
      assert.equal(c30.newlyEligibleCount, 0);
      assert.equal(c30.pendingQueueDepth, 1, "one pending row was seeded");
      assert.equal(c30.pendingOldestRemaining, 5);
    } finally {
      await pool.query("DELETE FROM pending_occurrences WHERE deck_code = 'C30' AND card_id = 'ZZZTST'");
      await pool.query("DELETE FROM card_slots WHERE id = 'ZZZTST'");
    }
  });

  await t.test("forecast reports occurrence-level would-ship/would-queue, without minting (D-H2)", async () => {
    addNotes(wordNote("n1"), wordNote("n2"), wordNote("n3"), wordNote("n4"));
    for (const id of ["n1", "n2", "n3", "n4"]) fake.addBlob(shaOf(`audio for ${id}`), `audio for ${id}`);
    const forecast = await runForecast(pool, config);

    const c30 = forecast.byDeck.find((d) => d.deckCode === "C30");
    assert.equal(c30.newlyEligibleCount, 4);
    assert.equal(c30.pendingQueueDepth, 0);

    const shipIds = forecast.wouldShip.filter((o) => o.deckCode === "C30").map((o) => o.cardId);
    assert.deepEqual(shipIds.sort(), ["C30001", "C30002", "C30003", "C30004"]);
    assert.ok(forecast.wouldShip.filter((o) => o.deckCode === "C30").every((o) => o.letter === "A"));
    const queueIds = forecast.wouldQueue.filter((o) => o.deckCode === "C30").map((o) => o.cardId);
    assert.deepEqual(queueIds.sort(), ["C30001", "C30002", "C30003", "C30004"]);
    assert.ok(forecast.wouldQueue.filter((o) => o.deckCode === "C30").every((o) => o.letter === "E" && o.remaining === 11));

    const { rows } = await pool.query("SELECT count(*) FROM card_slots");
    assert.equal(Number(rows[0].count), 0, "forecast must not mint anything");
  });

  // builder-card-flow-ui: byDeck's absolute totals and pending-by-tier
  // breakdown, additive to the this-run deltas asserted above — a deck with
  // nothing minted yet reports zero totals and an on-grid status, not an
  // error or an omitted entry.
  await t.test("forecast reports absolute lifetime totals and grid status alongside this-run deltas", async () => {
    // Reuses n1-n4, already added by the previous test — this whole suite
    // accumulates notes across tests (see the file-level comment), so
    // re-adding the same ids here would duplicate them in the fake
    // stabbur's note list and break the next real publish's mint.
    const forecast = await runForecast(pool, config);
    const c30 = forecast.byDeck.find((d) => d.deckCode === "C30");

    assert.equal(c30.mintedCount, 0, "nothing minted into C30 yet at this point in the suite");
    assert.equal(c30.occurrencesEventual, 0);
    assert.equal(c30.shippedTotal, 0);
    assert.equal(c30.stagedTotal, 0);
    assert.deepEqual(c30.pendingByTier, []);
    assert.deepEqual(c30.gridStatus, { onGrid: true, stalledDays: null }, "0 shipped is trivially on-grid");
    assert.equal(typeof forecast.totalPulled, "number");
    assert.equal(typeof forecast.totalAlreadyMinted, "number");
  });

  let firstBuildId;
  await t.test("a single run with no floor to wait for ships every new card's A immediately and queues its E", async () => {
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    firstBuildId = result.buildId;
    assert.equal(result.buildId, "b000001");
    assert.deepEqual(result.decksMinted, [{ deckCode: "C30", count: 4 }]);

    const model = outputModel(result.buildId);
    const deck = model.decks.find((d) => d.Name === "C30");
    assert.ok(deck, "C30 (lexic's starting code) should have been created in the bundle");
    assert.equal(deck.Description, "Vocabulary and expressions.", "a freshly-created deck gets its real description, not blank");
    assert.equal(deck.Cards.length, 0, "4 A's staged this run, short of a multiple of 5 — none flush yet");
    assert.equal(model.cards.filter((c) => c.DECK_ID === "C30").length, 4);

    const queued = await pendingRows("C30");
    assert.equal(queued.length, 4, "every new card's E is queued, not shipped");
    assert.ok(queued.every((r) => r.letter === "E" && r.remaining === 11));

    const { rows: pubs } = await pool.query("SELECT * FROM publications");
    assert.equal(pubs.length, 1);
    assert.equal(pubs[0].build_id, "b000001");
    assert.equal(pubs[0].data_rev, 1);
    assert.equal(pubs[0].base_version, "1.5.12");
    assert.equal(pubs[0].patch_rev, 1);
    assert.ok(pubs[0].logic_bundle_id, "D-L6: the publication records which logic bundle it was built from");

    assert.ok(fs.existsSync(path.join(dataDir, "ota", "bundle", "b000001.js")));
    assert.ok(fs.existsSync(path.join(dataDir, "ota", "b000001", "audio.json")));
    const audioManifest = JSON.parse(fs.readFileSync(path.join(dataDir, "ota", "b000001", "audio.json"), "utf8"));
    assert.equal(Object.keys(audioManifest).length, 4);

    const { rows: jobs } = await pool.query("SELECT status FROM build_jobs ORDER BY requested_at DESC LIMIT 1");
    assert.equal(jobs[0].status, "succeeded");

    const otherModuleAfter = readModuleSource(path.join(dataDir, "ota", "bundle", "b000001.js"), model.manifest[OTHER_MODULE_ID]);
    assert.equal(otherModuleAfter, otherModuleBefore, "an unrelated module must be byte-identical after a builder publish");

    const { rows: content } = await pool.query("SELECT card_id FROM card_content WHERE card_id LIKE 'C30%' ORDER BY card_id");
    assert.deepEqual(content.map((r) => r.card_id), ["C30001", "C30002", "C30003", "C30004"]);
  });

  await t.test("forecast after a real publish shows nothing in would-ship, matching the run's outcome", async () => {
    const forecast = await runForecast(pool, config);
    assert.deepEqual(forecast.wouldShip, [], "everything currently eligible was just published — nothing left to ship");

    // builder-card-flow-ui: absolute totals now reflect the real publish
    // above — 4 cards minted (lexic: 2 occurrences each), 0 shipped (all 4
    // A's are staged, short of the next multiple of 5), 4 staged, 4 pending
    // (each card's E, queued at remaining=11).
    const c30 = forecast.byDeck.find((d) => d.deckCode === "C30");
    assert.equal(c30.mintedCount, 4);
    assert.equal(c30.occurrencesEventual, 8);
    assert.equal(c30.shippedTotal, 0);
    assert.equal(c30.stagedTotal, 4);
    assert.equal(c30.pendingTotal, 4);
    assert.deepEqual(
      c30.pendingByTier.map((t) => t.remaining),
      [11]
    );
    assert.equal(c30.pendingByTier[0].cards.length, 4);
    assert.deepEqual(c30.gridStatus, { onGrid: true, stalledDays: null }, "0 shipped is a trivial multiple of 5");
  });

  await t.test("editing an already-minted note's content reaches the device on the next publish, id/position unchanged", async () => {
    // A single new note in the OTHER family (listening -> practice) forces
    // a publish under D91 without touching lexic's own staged count —
    // unlike the pre-consolidation suite, any new WORD note here would
    // land in the same C30 deck as n1-n4 and perturb its staged count, so
    // "elsewhere" now means a different family, not a different PoS.
    notes[notes.findIndex((n) => n.id === "n1")] = wordNote("n1", { text: "EDITED" });
    addNotes(practiceNote("l0", "listening"));
    fake.addBlob(shaOf("audio for l0"), "audio for l0");

    const before = outputModel(firstBuildId);
    const n1CardBefore = before.cards.find((c) => c.DECK_ID === "C30" && c.N.includes("word-n1"));
    assert.ok(n1CardBefore, "sanity: n1's card should exist before the edit");
    const n1Id = n1CardBefore.ID;
    const n1Position = before.decks.find((d) => d.Name === "C30").Cards.findIndex((ref) => ref.Card.startsWith(n1Id));

    const forecastBeforePublish = await runForecast(pool, config);
    const wouldUpdateIds = forecastBeforePublish.wouldUpdate.map((u) => u.cardId);
    assert.deepEqual(wouldUpdateIds, [n1Id], "only n1's card is predicted to change — n2/n3/n4 are unedited");

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.equal(result.buildId, "b000002");
    assert.deepEqual(result.decksMinted, [{ deckCode: "C20", count: 1 }]);

    const { rows: regenLog } = await pool.query(
      "SELECT jl.line FROM job_logs jl JOIN build_jobs bj ON bj.id = jl.build_job_id WHERE bj.build_id = $1 AND jl.line LIKE 'regenerate:%'",
      [result.buildId]
    );
    assert.equal(regenLog.length, 1);
    assert.match(regenLog[0].line, /^regenerate: 1 of 4 existing card\(s\) actually changed content: C30\d{3}$/);

    const after = outputModel(result.buildId);
    const n1CardAfter = after.cards.find((c) => c.ID === n1Id);
    assert.match(n1CardAfter.N, /EDITED/);
    assert.equal(n1CardAfter.DECK_ID, "C30");
    const n1PositionAfter = after.decks.find((d) => d.Name === "C30").Cards.findIndex((ref) => ref.Card.startsWith(n1Id));
    assert.equal(n1PositionAfter, n1Position, "an existing card's Cards[] position must never move, even across a full replay");
    assert.equal(after.decks.find((d) => d.Name === "C30").Cards.length, 0, "C30's occurrences must not grow from a content-only regen — still 0, its 4 staged A's remain held");

    const practiceDeck = after.decks.find((d) => d.Name === "C20");
    assert.ok(practiceDeck, "practice's starting deck (C20) should now exist, from l0's mint");
    assert.equal(practiceDeck.Cards.length, 0, "l0's single staged occurrence is short of a multiple of 5, held");

    const { rows: contentRow } = await pool.query("SELECT n FROM card_content WHERE card_id = $1", [n1Id]);
    assert.match(contentRow[0].n, /EDITED/);
  });

  await t.test("D86: a note already in hub's ledger but missing from the bundle self-heals on a normal run", async () => {
    // Simulates a prior run that committed `mintCardSlots`'s DB rows
    // (ledger + card_slots) for a note but crashed before
    // `createCard`/save ever ran — no card_content or occurrence_shipments
    // row exists for it either, so `replay()` has nothing to recreate it
    // from. Continues lexic's own running sequence directly (C30005 — the
    // 5th lexic card after n1-n4), landing it on the next multiple of 5
    // once its A stages.
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C30005', 'C30', 5, 'd1')");
    await pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ('d1', 'C30005')");
    fake.addBlob(shaOf("audio for d1"), "audio for d1");
    addNotes(wordNote("d1", { pos: "adverb" }));

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [], "d1 is already in hub's ledger — nothing newly-eligible this run");

    const model = outputModel(result.buildId);
    const d1Card = model.cards.find((c) => c.ID === "C30005");
    assert.ok(d1Card, "self-heal must recreate the missing card");
    assert.match(d1Card.N, /word-d1/);

    const { rows: content } = await pool.query("SELECT card_id FROM card_content WHERE card_id = 'C30005'");
    assert.equal(content.length, 1, "self-heal writes card_content too, not just the in-memory card");

    // n1-n4's A's (4, staged) + d1's self-healed A (1 more) = 5 — exactly a
    // multiple of 5, so this run's flush finally ships all 5 at once.
    const lexicDeck = model.decks.find((d) => d.Name === "C30");
    assert.equal(lexicDeck.Cards.length, 5, "5 staged A's is an exact multiple of 5 — all flush this run");

    const { rows: jobs } = await pool.query("SELECT status FROM build_jobs ORDER BY requested_at DESC LIMIT 1");
    assert.equal(jobs[0].status, "succeeded");
  });

  await t.test("D-H4: a failed run's log shows every checkpoint reached before the failure, not just the terminal error", async () => {
    // A genuine, naturally-occurring failure mode (not a contrived id
    // collision) — a new note whose audio blob was never registered with
    // the fake stabbur, so the snapshot step's real blob fetch 404s, well
    // after mint/regen have already run and logged their checkpoints.
    const lines = [];
    const log = async (buildJobId, line) => lines.push({ buildJobId, line });
    addNotes(practiceNote("p1", "pronunciation", { audio_blob: shaOf("never registered") }));

    await assert.rejects(() => runPublish(pool, { ...config, log }), /could not fetch blob/);

    assert.ok(lines.length > 0, "at least some checkpoints were logged before the failure");
    const byBuildJob = new Map();
    for (const { buildJobId, line } of lines) {
      if (!byBuildJob.has(buildJobId)) byBuildJob.set(buildJobId, []);
      byBuildJob.get(buildJobId).push(line);
    }
    assert.equal(byBuildJob.size, 1, "all lines belong to the one build job this run created");
    const [thisRunLines] = [...byBuildJob.values()];
    assert.ok(thisRunLines.some((l) => l.startsWith("pulled")));
    assert.ok(thisRunLines.some((l) => l.startsWith("assign:")));
    assert.ok(thisRunLines.some((l) => l.startsWith("regenerate:")));
    assert.ok(thisRunLines.some((l) => l.includes("mint: C20")), "p1 (pronunciation -> practice) minted before the later failure");
    assert.ok(!thisRunLines.some((l) => l.startsWith("published")), "never reached — the run failed before publish()");

    const { rows: jobs } = await pool.query("SELECT status FROM build_jobs ORDER BY requested_at DESC LIMIT 1");
    assert.equal(jobs[0].status, "failed");

    // p1's card_slots/minted_notes rows survive the failed run (committed
    // independently of the later blob-fetch failure) — the next successful
    // run's regen/self-heal path picks it up, same D86 property, just
    // reached via a different trigger this time.
    const { rows: p1Slot } = await pool.query("SELECT id FROM card_slots WHERE note_id = 'p1'");
    assert.equal(p1Slot.length, 1, "p1's mint committed independently of the later failure");
  });

  await t.test("listening/pronunciation/grammar notes never touch pending_occurrences at all", async () => {
    fake.addBlob(shaOf("never registered"), "never registered");
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);

    const { rows } = await pool.query("SELECT count(*) FROM pending_occurrences WHERE deck_code = 'C20'");
    assert.equal(Number(rows[0].count), 0);

    const model = outputModel(result.buildId);
    const practiceDeck = model.decks.find((d) => d.Name === "C20");
    assert.ok(practiceDeck, "practice deck should exist from earlier mints");
    // l0 + p1 staged (single-occurrence each) = 2, short of a multiple of 5.
    assert.equal(practiceDeck.Cards.length, 0, "practice's 2 staged occurrences are held, short of a multiple of 5");
  });

  await t.test("D89: wiring a real grammarRuleLookup means a grammar note's placeholder text never appears", async () => {
    fake.setGrammarRules([{ id: "rule-2", title: "Past tense", html: "<p>har/hadde + perfect participle</p>" }]);
    addNotes(
      practiceNote("g1", "grammar", { grammar_rule_id: "rule-1" }),
      practiceNote("g2", "grammar", { grammar_rule_id: "rule-2" })
    );
    fake.addBlob(shaOf("audio for g1"), "audio for g1");
    fake.addBlob(shaOf("audio for g2"), "audio for g2");

    const grammarRuleLookup = await buildGrammarRuleLookup({ baseUrl: stabburBaseUrl, authToken: fake.authToken });
    const result = await runPublish(pool, { ...config, grammarRuleLookup });
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: "C20", count: 2 }]);

    const model = outputModel(result.buildId);
    const g2Card = model.cards.find((c) => c.DECK_ID === "C20" && c.N.includes("grammar-g2"));
    assert.ok(g2Card, "g2's card should have been minted into C20 (practice)");
    assert.match(g2Card.X, /Past tense/, "the rule's real title reached the card");
    assert.doesNotMatch(g2Card.X, /not yet available/, "the placeholder must never appear once a real lookup is wired");

    const g1Card = model.cards.find((c) => c.DECK_ID === "C20" && c.N.includes("grammar-g1"));
    assert.match(g1Card.X, /not yet available/, "g1 has no matching rule in stabbur's fixture data");
  });

  await t.test("D-F1: a real publish trims a note's audio to its audio_sel_ms, end to end", async () => {
    const clipPath = path.join(tmpDir, "e1-source.mp3");
    execFileSync("ffmpeg", ["-y", "-loglevel", "error", "-f", "lavfi", "-i", "sine=frequency=440:duration=2", clipPath]);
    const clipBytes = fs.readFileSync(clipPath);
    const clipSha = shaOf(clipBytes);
    fake.addBlob(clipSha, clipBytes);

    addNotes(
      wordNote("e1", {
        type: "expression",
        pos: undefined,
        text: "god morgen",
        audio_blob: clipSha,
        audio_sel_ms: [500, 1500],
      })
    );

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: "C30", count: 1 }], "expression -> lexic, same deck as every word note");

    const manifest = JSON.parse(fs.readFileSync(path.join(dataDir, "ota", result.buildId, "audio.json"), "utf8"));
    const model = outputModel(result.buildId);
    const e1Card = model.cards.find((c) => c.DECK_ID === "C30" && c.N.includes("god morgen"));
    assert.ok(e1Card, "e1's card should have been minted into C30 (lexic)");

    const manifestSha = manifest[e1Card.ID];
    assert.ok(manifestSha, "e1's card must have a manifest entry");
    assert.notEqual(manifestSha, clipSha, "the manifest must point at the trimmed derivative, not the original upload");

    const trimmedPath = path.join(dataDir, "blob", manifestSha);
    assert.ok(fs.existsSync(trimmedPath));
    const durationOut = execFileSync(
      "ffprobe",
      ["-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", trimmedPath],
      { encoding: "utf8" }
    );
    const durationMs = Math.round(parseFloat(durationOut.trim()) * 1000);
    assert.ok(Math.abs(durationMs - 1000) < 150, `expected ~1000ms (500-1500 selection), got ${durationMs}ms`);

    const originalPath = path.join(dataDir, "blob", clipSha);
    assert.ok(fs.existsSync(originalPath), "the original upload must still be fetched into hub's blob cache");
    assert.deepEqual(fs.readFileSync(originalPath), clipBytes, "the original must stay byte-identical — D45");
  });

  await t.test("D-L4: activating a second, different logic bundle changes what the very next publish builds onto", async () => {
    const secondBundlePath = path.join(tmpDir, "logic-bundle-2.js");
    const secondOtherModule = `__d(function (g, r, i, a, m, e, d) {\n  m.exports = function greet() { return "bonjour"; };\n}, ${OTHER_MODULE_ID}, []);\n`;
    fs.writeFileSync(secondBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource() + secondOtherModule);
    runExplode(secondBundlePath);
    const secondId = await seedActiveLogicBundle(pool, secondBundlePath, { baseVersion: "1.6.0", patchRev: 2 });
    await pool.query("UPDATE logic_bundles SET active = FALSE WHERE id != $1", [secondId]);

    fake.addBlob(shaOf("audio for h1"), "audio for h1");
    addNotes(wordNote("h1", { pos: "konjunksjon" }));

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: "C30", count: 1 }]);

    const { rows: pub } = await pool.query("SELECT base_version, patch_rev, logic_bundle_id FROM publications WHERE build_id = $1", [
      result.buildId,
    ]);
    assert.equal(pub[0].base_version, "1.6.0");
    assert.equal(pub[0].patch_rev, 2);
    assert.equal(pub[0].logic_bundle_id, secondId);

    const model = outputModel(result.buildId);
    const otherModuleAfter = readModuleSource(path.join(dataDir, "ota", "bundle", result.buildId + ".js"), model.manifest[OTHER_MODULE_ID]);
    assert.match(otherModuleAfter, /bonjour/, "built onto the second logic bundle's own unrelated module, not the first's");

    assert.equal(model.cards.filter((c) => c.DECK_ID === "C30").length, 7, "every lexic card minted so far survives the base change");
  });

  // ---- flush-record-atomicity (D-FA1/D-FA2/D-FA3) ----
  //
  // The 2026-11-09 18:59:50 incident, reproduced: a run that dies between
  // the flush and `recordShipments`. `flushShippable` and
  // `drainPendingOccurrences` used to consume DURABLY at flush time, while
  // the only other copy of what they consumed lived in the in-memory model
  // `runPublish`'s `finally` throws away. For a card that already has a
  // shipped occurrence the D86 self-heal can never bring it back — `replay`
  // recreates that card from its shipment row, so it is never seen as
  // missing and never re-staged. That is how 13 `E` occurrences
  // (C30049-C30061) were lost for good.

  async function stagedRows(deckCode) {
    const { rows } = await pool.query(
      "SELECT id, card_id, letter FROM staged_occurrences WHERE deck_code = $1 ORDER BY id",
      [deckCode]
    );
    return rows;
  }

  async function shippedCount(deckCode) {
    const { rows } = await pool.query(
      "SELECT count(*) AS count FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id WHERE cs.deck_code = $1",
      [deckCode]
    );
    return Number(rows[0].count);
  }

  // Every (card, letter) this deck owes, and where it currently lives —
  // the invariant the whole change exists to protect: exactly one of
  // shipped / staged / pending, never zero, never two.
  async function occurrencePlaces(deckCode) {
    const places = new Map();
    const add = (cardId, letter, where) => {
      const key = `${cardId}/${letter}`;
      if (!places.has(key)) places.set(key, []);
      places.get(key).push(where);
    };
    const { rows: shipped } = await pool.query(
      "SELECT os.card_id, os.letter FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id WHERE cs.deck_code = $1",
      [deckCode]
    );
    for (const r of shipped) add(r.card_id, r.letter, "shipped");
    for (const r of await stagedRows(deckCode)) add(r.card_id, r.letter, "staged");
    for (const r of await pendingRows(deckCode)) add(r.card_id, r.letter, "pending");
    return places;
  }

  let atomicityNewCardIds;
  await t.test("D-FA1: a run that fails after the flush consumes no staged or pending occurrence", async () => {
    // Induce the preconditions by SQL (inducing state, not asserting it):
    // C30001's queued E is one new card away from draining, and its card
    // already has a shipped A — the exact non-self-healing shape.
    await pool.query("UPDATE pending_occurrences SET remaining = 99 WHERE deck_code = 'C30'");
    await pool.query(
      "UPDATE pending_occurrences SET remaining = 1 WHERE deck_code = 'C30' AND card_id = 'C30001' AND letter = 'E'"
    );
    const { rows: priorShipment } = await pool.query(
      "SELECT letter FROM occurrence_shipments WHERE card_id = 'C30001'"
    );
    assert.ok(
      priorShipment.some((r) => r.letter === "A"),
      "sanity: C30001's A already shipped, so replay recreates the card and D86 can never re-stage its E"
    );

    const shippedBefore = await shippedCount("C30");
    const stagedBefore = await stagedRows("C30");
    const pendingBefore = await pendingRows("C30");

    // Enough brand-new cards that the flush genuinely fires this run (the
    // deck's total has to reach a multiple of 5) — one drained E plus `k`
    // fresh A's.
    let k = (5 - ((shippedBefore + stagedBefore.length + 1) % 5)) % 5;
    if (k === 0) k = 5;
    const fresh = Array.from({ length: k }, (_, i) => wordNote(`fa${i}`));
    for (const n of fresh) fake.addBlob(shaOf(`audio for ${n.id}`), `audio for ${n.id}`);
    // The LAST note's blob is never registered with the fake stabbur, so
    // the real `ensureBlobsPresent` throws — well after mint, drain, stage
    // and flush have all run. The same naturally-occurring failure shape as
    // the ffmpeg error that fired on 2026-11-09, not a contrived throw.
    fresh[fresh.length - 1].audio_blob = shaOf("fa-never-registered");
    addNotes(...fresh);

    await assert.rejects(() => runPublish(pool, config), /could not fetch blob/);

    const stagedAfter = await stagedRows("C30");
    const pendingAfter = await pendingRows("C30");

    assert.equal(await shippedCount("C30"), shippedBefore, "D-H1: a failed run records no shipment");
    for (const row of stagedBefore) {
      assert.ok(
        stagedAfter.some((r) => r.id === row.id),
        `staged row ${row.id} (${row.card_id}/${row.letter}) was consumed by a run that then failed — it is gone for good`
      );
    }
    const c30001E = pendingAfter.find((r) => r.card_id === "C30001" && r.letter === "E");
    assert.ok(c30001E, "C30001's queued E must still be queued — nothing recorded it, so nothing may consume it");
    assert.equal(c30001E.remaining, 1, "…at its pre-run countdown, so the next run drains it again rather than dropping it");
    assert.equal(
      pendingAfter.length,
      pendingBefore.length + k,
      "the only queue growth is this run's own freshly-minted E's (mint-time inserts stay immediate, D-FA1)"
    );

    atomicityNewCardIds = (
      await pool.query("SELECT cs.id FROM card_slots cs JOIN minted_notes mn ON mn.card_slot_id = cs.id WHERE mn.note_id = ANY($1) ORDER BY cs.id", [
        fresh.map((n) => n.id),
      ])
    ).rows.map((r) => r.id);
    assert.equal(atomicityNewCardIds.length, k, "every new note minted despite the later failure (D86's own precondition)");
  });

  await t.test("D-FA1: the next successful publish accounts for every occurrence the failed run touched, exactly once", async () => {
    // The companion half of the boundary: the failed run's own brand-new
    // cards have NO prior shipment, so even before this change D86 would
    // have re-staged them. C30001's E is the half that never self-heals.
    fake.addBlob(shaOf("fa-never-registered"), "fa-never-registered");
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);

    const places = await occurrencePlaces("C30");
    const c30001E = places.get("C30001/E");
    assert.deepEqual(c30001E?.length, 1, `C30001's E must live in exactly one place, found: ${c30001E}`);
    for (const cardId of atomicityNewCardIds) {
      assert.deepEqual(places.get(`${cardId}/A`)?.length, 1, `${cardId}'s A must live in exactly one place`);
      assert.deepEqual(places.get(`${cardId}/E`)?.length, 1, `${cardId}'s E must live in exactly one place`);
    }
    const doubled = [...places.entries()].filter(([, where]) => where.length > 1);
    assert.deepEqual(doubled, [], "no occurrence may exist in two places at once (or twice in one)");
  });

  // D-FA3: the b000040 fingerprint — `drainThenQueue` called once per
  // RECOVERED CARD instead of once per deck. With N queued E's sitting at
  // remaining 11, the first 11 recovered cards drained all of them at once;
  // from the 12th on `hasPendingOccurrence` no longer saw a row and
  // re-queued the same E, which later cards drained and staged a SECOND
  // time. 104 occurrences double-shipped, and 115 cards got their E ahead
  // of their own A in Cards[] — a D91 violation ("never quizzed
  // text-first") that deduplication cannot undo.
  await t.test("D-FA3: mass D86 recovery into a deck with a non-empty queue double-ships nothing and keeps A before E", async () => {
    const recovered = [];
    const { rows: maxRow } = await pool.query("SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = 'C30'");
    let nextNo = Number(maxRow[0].max_no) + 1;
    for (let i = 0; i < 14; i++) {
      const noteId = `rec${i}`;
      const cardId = `C30${String(nextNo).padStart(3, "0")}`;
      nextNo += 1;
      // The crashed run's committed half: card_slots + minted_notes + a
      // queued E, and nothing else — no card_content, no shipment, so the
      // card is missing from the rebuilt model and takes the D86 path.
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [
        cardId,
        Number(cardId.slice(-3)),
        noteId,
      ]);
      await pool.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1, $2)", [noteId, cardId]);
      await pool.query(
        "INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ('C30', $1, 'E', 11)",
        [cardId]
      );
      fake.addBlob(shaOf(`audio for ${noteId}`), `audio for ${noteId}`);
      recovered.push({ noteId, cardId });
    }
    addNotes(...recovered.map(({ noteId }) => wordNote(noteId)));

    const pendingBefore = (await pendingRows("C30")).length;
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);

    const places = await occurrencePlaces("C30");
    const doubled = [...places.entries()].filter(([, where]) => where.length > 1);
    assert.deepEqual(doubled, [], "no (card, letter) may be shipped/staged/queued more than once");

    assert.ok(
      (await pendingRows("C30")).length <= pendingBefore,
      "no already-drained E may be re-queued — the queue can only shrink in a run that mints nothing new"
    );

    // D91 by construction: every recovered card's own A is staged before
    // the single per-deck drain runs, so its E can never take a lower
    // position in the deck's real Cards[] order.
    const { shipped, staged } = await shipOrderForDeck(pool, "C30");
    const order = [...shipped, ...staged].map((o) => `${o.cardId}/${o.letter}`);
    for (const { cardId } of recovered) {
      const a = order.indexOf(`${cardId}/A`);
      const e = order.indexOf(`${cardId}/E`);
      if (a === -1 || e === -1) continue;
      assert.ok(a < e, `${cardId}: its A must precede its own E in Cards[] order (D91), got A@${a} E@${e}`);
    }
  });

  // D-FA4: the check that would have made 2026-11-09 visible the next
  // morning instead of by accident, days later.
  await t.test("D-FA4: the integrity check is silent on a healthy ledger and names the offender on a broken one", async () => {
    const healthy = await checkOccurrenceIntegrity(pool);
    assert.deepEqual(healthy.anomalies, [], "every run above left the ledger consistent");
    assert.equal(renderIntegrityBanner(healthy), "", "zero anomalies renders zero UI — no permanent green panel to stop reading");

    const { rows: staged } = await pool.query("SELECT deck_code, card_id, letter FROM staged_occurrences LIMIT 1");
    assert.equal(staged.length, 1, "sanity: something is staged at this point in the suite");
    const row = staged[0];

    // 019 makes the single-table duplicate impossible — the database
    // refuses it rather than letting it reach occurrence_shipments twice.
    await assert.rejects(
      () =>
        pool.query("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ($1, $2, $3)", [
          row.deck_code,
          row.card_id,
          row.letter,
        ]),
      /duplicate key value/,
      "a second staged row for the same (card, letter) is rejected by the database itself"
    );

    // So the remaining way to break it is ACROSS tables: the same
    // occurrence staged AND queued — exactly what b000040's re-queue
    // produced before the per-deck drain fix.
    await pool.query("INSERT INTO pending_occurrences (deck_code, card_id, letter, remaining) VALUES ($1, $2, $3, 11)", [
      row.deck_code,
      row.card_id,
      row.letter,
    ]);
    const broken = await checkOccurrenceIntegrity(pool);
    assert.deepEqual(broken.anomalies.map((a) => a.cardId), [row.card_id], "the banner names exactly the offending card");
    assert.equal(broken.anomalies[0].kind, "duplicate");
    assert.match(renderIntegrityBanner(broken), new RegExp(row.card_id));

    await pool.query("DELETE FROM pending_occurrences WHERE card_id = $1 AND letter = $2", [row.card_id, row.letter]);
    assert.deepEqual((await checkOccurrenceIntegrity(pool)).anomalies, [], "removing the row makes the banner disappear again");
  });

  // D91's cross-batch queue mechanics, isolated on a genuinely fresh,
  // untouched deck — deliberately rolled over to by seeding `lexic`'s
  // current code (C30) up to its 999-card cap first (deck-rollover), rather
  // than picking a different PoS the way the pre-consolidation suite did
  // (every PoS shares the same family/deck now).
  let rolloverDeckCode;
  let rolloverFirstBuildId;
  await t.test("rollover: filling lexic's current code forces the next mint to its overflow code", async () => {
    const { rows: countRow } = await pool.query("SELECT count(*) FROM card_slots WHERE deck_code = 'C30'");
    const already = Number(countRow[0].count);
    for (let i = already + 1; i <= 999; i++) {
      const id = `C30${String(i).padStart(3, "0")}`;
      await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C30', $2, $3)", [
        id,
        i,
        `filler-${id}`,
      ]);
    }

    fake.addBlob(shaOf("audio for r1"), "audio for r1");
    // `inflections: null` (the projector's own "no inflections" input), not
    // the fixture's default `{}`: an EMPTY object takes `wordInflectionLines`'
    // verb branch, which destructures `perfektum` as undefined and throws in
    // `ensurePrefix` — a pre-existing fixture/projector mismatch that fails
    // this test and the three after it on any database, with or without this
    // change. Out of scope here; left as a backlog item, not silently fixed
    // in the projector.
    addNotes(wordNote("r1", { pos: "verb", inflections: null }));

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    rolloverDeckCode = result.decksMinted[0].deckCode;
    rolloverFirstBuildId = result.buildId;
    assert.notEqual(rolloverDeckCode, "C30", "C30 is now full — the new card must land in lexic's next configured code");
    assert.equal(result.decksMinted[0].count, 1);

    const model = outputModel(result.buildId);
    const deck = model.decks.find((d) => d.Name === rolloverDeckCode);
    assert.ok(deck, "the rollover deck must exist in the published bundle");
    assert.equal(deck.Title, "Lexic II");
    assert.equal(deck.Cards.length, 0, "r1's single A staged, held — short of a multiple of 5");
  });

  await t.test("rollover deck: a subsequent run with 1 new note decrements the existing pending row and queues the new one fresh", async () => {
    fake.addBlob(shaOf("audio for r2"), "audio for r2");
    addNotes(wordNote("r2", { pos: "preposisjon" }));

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: rolloverDeckCode, count: 1 }]);

    const model = outputModel(result.buildId);
    assert.equal(model.decks.find((d) => d.Name === rolloverDeckCode).Cards.length, 0, "2 A's staged total, still short of a multiple of 5");

    // newACount=1 (r2's A) drains r1's existing E by 1 (11 -> 10, not yet
    // <=0, stays queued); r2's own E queues fresh at 11.
    const queued = await pendingRows(rolloverDeckCode);
    assert.equal(queued.length, 2);
    const byRemaining = queued.map((r) => r.remaining).sort((a, b) => a - b);
    assert.deepEqual(byRemaining, [10, 11], "r1's E decremented by r2's one new A; r2's E queued fresh at 11");
  });

  await t.test("rollover deck: enough cumulative new cards cross 11 and drain only the oldest E's", async () => {
    const tenMore = Array.from({ length: 10 }, (_, i) => wordNote(`r${3 + i}`, { pos: "preposisjon" }));
    for (const { id } of tenMore) fake.addBlob(shaOf(`audio for ${id}`), `audio for ${id}`);
    addNotes(...tenMore);

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: rolloverDeckCode, count: 10 }]);

    const model = outputModel(result.buildId);
    // 2 previously-staged A's (r1/r2, held) + 10 new A's + 1 newly-drained E
    // (r1's: 10 - newACount(10) = 0, reaches the floor) = 13 staged this
    // run. floor(13/5)*5 = 10 flush, FIFO (the 2 held A's + the 8 oldest of
    // the 10 new A's), leaving 3 staged (2 new A's + the drained E).
    assert.equal(model.decks.find((d) => d.Name === rolloverDeckCode).Cards.length, 10, "10 is the largest multiple of 5 within the 13 staged");

    // r1's E fully drained and removed; r2's E (queued more recently, only
    // decremented once before) stays at 1; the 10 new notes' E's queue
    // fresh at 11.
    const queued = await pendingRows(rolloverDeckCode);
    assert.equal(queued.length, 11, "r1's E drained away; r2's E remains at 1, plus 10 freshly-queued at 11");
    const byRemaining = queued.map((r) => r.remaining).sort((a, b) => a - b);
    assert.deepEqual(byRemaining, [1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11]);

    const { rows: stagedCountRow } = await pool.query(
      "SELECT count(*) FROM staged_occurrences WHERE deck_code = $1",
      [rolloverDeckCode]
    );
    assert.equal(Number(stagedCountRow[0].count), 3, "13 staged minus the 10 that just flushed");

    // D-H2: this build's own occurrencesForBuild must show the flushed
    // batch — FIFO by staging order, the oldest 10 of the 13 staged this
    // run are all A's (r1/r2's previously-held A's plus 8 of this run's 10
    // new ones); r1's newly-drained E was staged AFTER all 10 new A's (D-W3
    // stages drained rows only once the mint loop is done), so it's among
    // the 3 left held, not this flushed batch.
    const batchContents = await occurrencesForBuild(pool, result.buildId);
    assert.equal(batchContents.length, 10, "10 occurrences flush together this run");
    assert.equal(batchContents.filter((o) => o.letter === "A").length, 10);
    assert.equal(batchContents.filter((o) => o.letter === "E").length, 0, "r1's drained E staged after all 10 new A's — held, not flushed, this run");
    assert.ok(batchContents.every((o) => o.kind === "ship" && o.deckCode === rolloverDeckCode));
  });

  await t.test("rollover deck: a run with zero new cards in this deck leaves its queue numerically unchanged", async () => {
    const before = await pendingRows(rolloverDeckCode);

    fake.addBlob(shaOf("audio for g3"), "audio for g3");
    addNotes(practiceNote("g3", "grammar", { grammar_rule_id: "rule-1" }));

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: "C20", count: 1 }]);

    const after = await pendingRows(rolloverDeckCode);
    assert.deepEqual(after, before, "the rollover deck's queue must be byte-for-byte unchanged — it got zero new cards this run");
  });

  await t.test("D-H2: a build that held everything records zero flushed occurrences", async () => {
    // r1's own A was staged in rolloverFirstBuildId's own run but held (1
    // staged, short of a multiple of 5) — it only actually flushes, and
    // only gets recorded via occurrencesForBuild, in the LATER build that
    // crossed the multiple-of-5 threshold, not this one.
    const batchContents = await occurrencesForBuild(pool, rolloverFirstBuildId);
    assert.deepEqual(batchContents, [], "nothing flushed in the very first rollover run itself");
  });
});
