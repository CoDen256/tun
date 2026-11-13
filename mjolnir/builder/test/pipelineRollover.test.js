import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { runPublish } from "../src/pipeline.js";
import { loadDeckCardModel } from "../../src/deckData.js";
import { runExplode } from "../../src/commands/explode.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { startFakeStabbur, shaOf } from "./helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "./helpers/logicBundleFixture.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

// `type=listening` resolves to the `practice` family (deck-consolidation) —
// single-occurrence, so this test doesn't need to reason about pending/
// staged occurrence mechanics, just the rollover itself.
function listeningNote(id) {
  const audioText = `audio for ${id}`;
  return {
    id,
    created_at: "2026-10-01T00:00:00.000Z",
    capture_id: null,
    type: "listening",
    source_lang: "no",
    text: `listening-${id}`,
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
  };
}

// deck-rollover task 3.3: a full pipeline run that simulates a family's
// starting code already being at the 999-card cap — confirms the next note
// assigned to that family rolls over to the family's next configured code,
// not a 1000th row in the first. Uses the real `practice` family
// (`DECK_FAMILIES.practice`, deck-consolidation) — its natural second code,
// C21, is already configured, no monkeypatching needed.
describe("builder pipeline: a family rolls over once its active code hits capacity", async (t) => {
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
  for (let i = 1; i <= 999; i++) {
    const cardId = `C20${String(i).padStart(3, "0")}`;
    await pool.query("INSERT INTO card_slots (id, deck_code, card_no, note_id) VALUES ($1, 'C20', $2, $3)", [
      cardId,
      i,
      `preexisting-note-${i}`,
    ]);
  }

  process.env.ALLOW_NO_COMPANION = "1";
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-builder-rollover-"));
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource());
  runExplode(logicBundlePath);
  await seedActiveLogicBundle(pool, logicBundlePath);
  const dataDir = path.join(tmpDir, "data");

  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();

  const config = {
    stabburBaseUrl,
    stabburAuthToken: fake.authToken,
    sourceLang: "no",
    dataDir,
    publicBase: "https://tun.example.test",
  };

  t.after(async () => {
    await fake.close();
    await closePool();
    fs.rmSync(tmpDir, { recursive: true, force: true });
  });

  await t.test("a new note assigned to the full family mints into the rollover code, auto-creating its deck", async () => {
    fake.setNotes([listeningNote("n1")]);
    fake.addBlob(shaOf("audio for n1"), "audio for n1");

    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    assert.deepEqual(result.decksMinted, [{ deckCode: "C21", count: 1 }]);

    const { rows: slots } = await pool.query("SELECT id, deck_code, card_no FROM card_slots WHERE note_id = 'n1'");
    assert.equal(slots.length, 1);
    assert.equal(slots[0].deck_code, "C21");
    assert.equal(slots[0].card_no, 1);
    assert.equal(slots[0].id, "C21001");

    const { rows: c20 } = await pool.query("SELECT count(*) FROM card_slots WHERE deck_code = 'C20'");
    assert.equal(Number(c20[0].count), 999, "the full deck must not have received a 1000th row");

    const { rows: deckRow } = await pool.query("SELECT title, description FROM decks WHERE code = 'C21'");
    assert.equal(deckRow.length, 1);
    assert.equal(deckRow[0].title, "Practice II");
    assert.equal(deckRow[0].description, "");

    const model = loadDeckCardModel(path.join(dataDir, "ota", "bundle", `${result.buildId}.js`));
    const deck = model.decks.find((d) => d.Name === "C21");
    assert.ok(deck, "the rollover deck must exist in the published bundle");
    assert.equal(deck.Title, "Practice II");
  });
});
