import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { applyMigration } from "../../hub/src/deckConsolidationMigration.js";
import { runPublish } from "../src/pipeline.js";
import { loadDeckCardModel } from "../../src/deckData.js";
import { runExplode } from "../../src/commands/explode.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { startFakeStabbur, shaOf } from "./helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "./helpers/logicBundleFixture.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

// A pre-consolidation deck entry, shaped like a real already-published
// deck (findings.md §1) — the only fields `ensureDeck`'s NEW_DECK_DEFAULTS
// would also set.
function oldDeck(name, title) {
  return {
    ID: null, // assigned below once every deck is known
    Name: name,
    Title: title,
    Description: `${title} (pre-migration).`,
    PullCounter: 3,
    Code: "",
    Enabled: true,
    Counter1: "",
    Counter2: "",
    MaxInterval: 10,
    AutoTickStreak: 1,
    AutoHammerCount: 2,
    Cards: [],
  };
}

function oldCard(id, deckId, text) {
  return { DECK_ID: deckId, ID: id, N: `<div>${text}</div>`, E: `<div>answer-${text}</div>`, D: deckId, X: "", A: "N" };
}

// Tasks 5.1/5.2: migrates a synthetic pre-consolidation fixture (card_slots
// /card_content/occurrence_shipments/pending_occurrences/staged_occurrences
// populated across several of the old 10 deck codes, including one that
// pushes `lexic` past 999 cards to confirm rollover triggers), then runs a
// REAL publish — confirms the resulting bundle has exactly the expected
// "C"-prefixed decks, each with the expected content, and that retired
// codes are gone from `model.decks`. The pre-migration ACTIVE bundle
// (unlike every other pipeline test's empty starting fixture) already has
// the old decks baked in as real, already-published entries — exactly like
// a real device's current bundle before migration — since `replay()` alone
// would never surface the "stale deck left behind" problem `removeDeck`
// exists to fix.
describe("deck-consolidation: migrate a synthetic pre-consolidation fixture, then publish", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, occurrence_shipments, job_logs, logic_bundles, card_content CASCADE"
  );
  // DECK_ALLOCATION is already the NEW (post-deploy) table — C20/C30 — per
  // the Migration Plan's own ordering (code deploys before the migration
  // ever runs). C20's title still says "Substantiv" below precisely because
  // `seedDecks`' `ON CONFLICT DO NOTHING` never touches a pre-existing row;
  // this fixture plants that pre-existing row directly, same as a real
  // deploy would have left it.
  for (const { code, title, description } of DECK_ALLOCATION) {
    await pool.query("INSERT INTO decks (code, title, category, description, managed_by_hub) VALUES ($1, $2, $3, $4, TRUE)", [
      code,
      title,
      code[0],
      description || "",
    ]);
  }
  await pool.query("UPDATE decks SET title = 'Substantiv' WHERE code = 'C20'");
  // fix-prune-retired-decks-stock-deletion: C22/C27 are pre-migration
  // hub-managed codes (the old per-type scheme) that this test expects
  // `pruneRetiredDecks` to retire once their card_slots empty out —
  // `managed_by_hub = TRUE` is what makes them eligible for that, same as
  // any real hub-created deck.
  await pool.query(
    "INSERT INTO decks (code, title, category, description, managed_by_hub) VALUES ('C22', 'Verb', 'C', 'Verbs.', TRUE), ('C27', 'Listening', 'C', 'Listening comprehension.', TRUE)"
  );

  // Old C20 (substantiv -> lexic): 999 cards. Only the first is "real"
  // (content + shipment, baked into the pre-migration bundle); the rest are
  // bare `card_slots` filler — real production always ships a card's A
  // immediately (D91), but faithfully baking in all 999 would make this
  // suite slow for no additional coverage; the COUNT is what drives
  // rollover, not each filler row's content.
  for (let i = 1; i <= 999; i++) {
    const id = `C20${String(i).padStart(3, "0")}`;
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C20', $2, $3)", [
      id,
      i,
      `old-note-${id}`,
    ]);
  }
  await pool.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ('C20001', '<div>first</div>', '<div>answer-first</div>', '', 'N')");

  // Old C22 (verb -> lexic): 2 real cards — pushes lexic to 1001, past the
  // 999 cap, forcing rollover.
  await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C22001', 'C22', 1, 'old-note-C22001')");
  await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C22002', 'C22', 2, 'old-note-C22002')");
  await pool.query(
    "INSERT INTO card_content (card_id, n, e, x, a) VALUES ('C22001', '<div>verb1</div>', '<div>answer-verb1</div>', '', 'N'), ('C22002', '<div>verb2</div>', '<div>answer-verb2</div>', '', 'N')"
  );

  // Old C27 (listening -> practice): 1 real card.
  await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ('C27001', 'C27', 1, 'old-note-C27001')");
  await pool.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ('C27001', '<div>listen1</div>', '', '', 'N')");

  await pool.query(
    "INSERT INTO publications (build_id, base_version, patch_rev, data_rev, bundle_sha) VALUES ('b000000', '1.0.0', 0, 0, 'deadbeef')"
  );
  for (const { card, letter } of [
    { card: "C20001", letter: "A" },
    { card: "C22001", letter: "A" },
    { card: "C22002", letter: "A" },
    { card: "C27001", letter: "N" },
  ]) {
    await pool.query("INSERT INTO occurrence_shipments (card_id, letter, build_id) VALUES ($1, $2, 'b000000')", [card, letter]);
  }

  // The pre-migration ACTIVE bundle: the 3 old decks baked in as real,
  // already-published entries (findings.md §1 shape), each with its real
  // card's occurrence already in Cards[].
  const decksFixture = [oldDeck("C20", "Substantiv"), oldDeck("C22", "Verb"), oldDeck("C27", "Listening")];
  decksFixture.forEach((d, i) => (d.ID = i));
  decksFixture[0].Cards = [{ Card: "C20001N", P: "N" }];
  decksFixture[1].Cards = [{ Card: "C22001N", P: "N" }, { Card: "C22002N", P: "N" }];
  decksFixture[2].Cards = [{ Card: "C27001N", P: "N" }];
  const cardsFixture = [
    oldCard("C20001", "C20", "first"),
    oldCard("C22001", "C22", "verb1"),
    oldCard("C22002", "C22", "verb2"),
    oldCard("C27001", "C27", "listen1"),
  ];

  process.env.ALLOW_NO_COMPANION = "1";
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-deck-consolidation-"));
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(
    logicBundlePath,
    "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource({ decks: decksFixture, cards: cardsFixture })
  );
  runExplode(logicBundlePath);
  await seedActiveLogicBundle(pool, logicBundlePath);
  const dataDir = path.join(tmpDir, "data");

  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();
  const config = { stabburBaseUrl, stabburAuthToken: fake.authToken, sourceLang: "no", dataDir, publicBase: "https://tun.example.test" };

  function outputModel(buildId) {
    return loadDeckCardModel(path.join(dataDir, "ota", "bundle", `${buildId}.js`));
  }

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  let migrationResult;
  await t.test("the migration moves every card, rolls lexic over, retires C22/C27, retitles C20", async () => {
    migrationResult = await applyMigration(pool);
    assert.equal(migrationResult.mapping.length, 1002, "999 (C20) + 2 (C22) + 1 (C27)");
    assert.deepEqual(migrationResult.deletedDeckCodes.sort(), ["C22", "C27"]);
    assert.deepEqual(migrationResult.retitledDeckCodes, [{ code: "C20", family: "practice", title: "Practice" }]);

    const { rows: lexicCodes } = await pool.query(
      "SELECT DISTINCT deck_code FROM card_slots WHERE deck_code IN ('C30', 'C31') ORDER BY deck_code"
    );
    assert.deepEqual(lexicCodes.map((r) => r.deck_code), ["C30", "C31"], "lexic rolled over — 1001 cards exceed one code's cap");
  });

  await t.test("the next real publish produces exactly the expected decks, with the old codes gone", async () => {
    // 5.2: brand-new notes for BOTH families arrive after migration — each
    // must mint into its family's right currently-active code, not a
    // retired one. The practice note also exercises C20 directly this run
    // — title/description sync (like `flushDeck`'s own precedent for
    // description) only reaches a deck the run actually touches via mint/
    // regen/flush, not merely via `replay` recreating its history.
    fake.setNotes([
      {
        id: "new1",
        created_at: "2026-11-01T00:00:00.000Z",
        capture_id: null,
        type: "word",
        source_lang: "no",
        text: "word-new1",
        translations: [{ lang: "en", text: "translation-new1" }],
        transcription: "",
        pos: "substantiv",
        lemma: "word-new1",
        inflections: {},
        context_text: "",
        audio_blob: shaOf("audio for new1"),
        audio_sel_ms: null,
        grammar_rule_id: null,
        status: "ready",
      },
      {
        id: "new2",
        created_at: "2026-11-01T00:00:00.000Z",
        capture_id: null,
        type: "listening",
        source_lang: "no",
        text: "listening-new2",
        translations: [],
        transcription: "",
        pos: null,
        lemma: null,
        inflections: {},
        context_text: "",
        audio_blob: shaOf("audio for new2"),
        audio_sel_ms: null,
        grammar_rule_id: null,
        status: "ready",
      },
    ]);
    fake.addBlob(shaOf("audio for new1"), "audio for new1");
    fake.addBlob(shaOf("audio for new2"), "audio for new2");

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    // lexic is already rolled over to C31 (from the migration) — the new
    // note must land there, not back in the full C30. practice has plenty
    // of room at C20.
    assert.deepEqual(
      result.decksMinted.sort((a, b) => a.deckCode.localeCompare(b.deckCode)),
      [
        { deckCode: "C20", count: 1 },
        { deckCode: "C31", count: 1 },
      ]
    );
    const model = outputModel(result.buildId);
    const deckNames = model.decks.map((d) => d.Name).sort();
    assert.deepEqual(deckNames, ["C20", "C30", "C31"], "exactly the expected decks — C22/C27 are gone, C20/C30/C31 remain");

    const c20 = model.decks.find((d) => d.Name === "C20");
    assert.equal(c20.Title, "Practice", "C20's bundle entry must reflect its new title too, not the stale 'Substantiv'");
    assert.equal(c20.Cards.length, 1, "C27001's migrated occurrence (already shipped historically) — new2's is staged, held short of a multiple of 5; the stale old substantiv occurrence was pruned");
    assert.equal(c20.PullCounter, 0, "C20's old study position is meaningless against entirely different (practice) content now");

    const c30 = model.decks.find((d) => d.Name === "C30");
    assert.equal(c30.Title, "Lexic");
    assert.equal(c30.Cards.length, 1, "C20001's one migrated occurrence (the 998 filler cards were never shipped, so never replayed in)");

    const c31 = model.decks.find((d) => d.Name === "C31");
    assert.equal(c31.Title, "Lexic II");
    assert.equal(c31.Cards.length, 2, "C22001/C22002's migrated occurrences");

    // Migrated content survives under the new id, byte-identical.
    const migratedVerb1 = model.cards.find((c) => c.N.includes("verb1"));
    assert.ok(migratedVerb1, "verb1's content must survive migration");
    assert.equal(migratedVerb1.DECK_ID, "C31");

    const migratedListen1 = model.cards.find((c) => c.N.includes("listen1"));
    assert.ok(migratedListen1);
    assert.equal(migratedListen1.DECK_ID, "C20");

    // 5.2: the new note's card lands in C31 (lexic's active rollover code),
    // never C30 (full) and never a retired code.
    const newCard = model.cards.find((c) => c.N.includes("word-new1"));
    assert.ok(newCard);
    assert.equal(newCard.DECK_ID, "C31");
    assert.equal(newCard.ID, "C31003", "continues C31's own sequence after the 2 migrated verb cards");

    const newCard2 = model.cards.find((c) => c.N.includes("listening-new2"));
    assert.ok(newCard2);
    assert.equal(newCard2.DECK_ID, "C20", "a new practice note mints into C20, not a retired code");
    assert.equal(newCard2.ID, "C20002", "continues C20's own fresh sequence after the 1 migrated listening card");

    const { rows: decksTable } = await pool.query("SELECT code FROM decks ORDER BY code");
    assert.deepEqual(decksTable.map((d) => d.code), ["C20", "C30", "C31"]);
  });
});
