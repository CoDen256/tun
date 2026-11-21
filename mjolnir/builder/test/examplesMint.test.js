// projector-examples-column, end to end: a ready note's `examples` must reach
// the published bundle's card X face, both when the card is first minted and
// when an already-minted card is regenerated on a later publish (the case a
// migrated note is in: minted earlier, examples filled in afterwards).
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

function wordNote(id, overrides = {}) {
  const audioText = `audio for ${id}`;
  return {
    id, created_at: "2026-10-01T00:00:00.000Z", capture_id: null, type: "word", source_lang: "no",
    text: `word-${id}`, translations: [{ lang: "en", text: `translation-${id}` }], transcription: "",
    pos: "substantiv", lemma: `word-${id}`, inflections: {}, examples: [],
    audio_blob: shaOf(audioText), audio_sel_ms: null, grammar_rule_id: null, status: "ready",
    _audioText: audioText, ...overrides,
  };
}

describe("examples reach the published card's X face", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, occurrence_shipments, job_logs, logic_bundles, card_content CASCADE"
  );
  for (const { code, title, description } of DECK_ALLOCATION) {
    await pool.query("INSERT INTO decks (code, title, category, description) VALUES ($1, $2, $3, $4)", [
      code, title, code[0], description || "",
    ]);
  }
  process.env.ALLOW_NO_COMPANION = "1";
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-builder-examples-"));
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource());
  runExplode(logicBundlePath);
  await seedActiveLogicBundle(pool, logicBundlePath);
  const dataDir = path.join(tmpDir, "data");
  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();
  const config = { stabburBaseUrl, internalToken: fake.authToken, sourceLang: "no", dataDir, publicBase: "https://tun.example.test" };
  const outputModel = (buildId) => loadDeckCardModel(path.join(dataDir, "ota", "bundle", `${buildId}.js`));
  const xOf = async (cardId) => (await pool.query("SELECT x FROM card_content WHERE card_id = $1", [cardId])).rows[0]?.x;

  t.after(async () => {
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  const notes = [
    wordNote("e1", { examples: ["Bilen står ute.", "Vi tok bilen."] }),
    wordNote("e2"),
    wordNote("e3", { type: "expression", text: "komme i vei", examples: ["Vi må komme i vei."] }),
  ];
  for (const n of notes) fake.addBlob(n.audio_blob, n._audioText);

  await t.test("first mint: X carries the examples, one per line", async () => {
    fake.setNotes(notes.map((n) => ({ ...n })));
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    const model = outputModel(result.buildId);
    const c1 = model.cards.find((c) => c.N.includes("word-e1"));
    const c2 = model.cards.find((c) => c.N.includes("word-e2"));
    const c3 = model.cards.find((c) => c.N.includes("komme i vei"));
    assert.equal(c1.X, '<div class="left">Bilen står ute.<br>Vi tok bilen.</div>');
    assert.equal(c2.X, "");
    assert.equal(c3.X, '<div class="left">Vi må komme i vei.</div>');
    assert.equal(await xOf(c1.ID), c1.X, "card_content holds the same X the bundle carries");
  });

  await t.test("regeneration: examples added to an already-minted note reach its card on the next publish", async () => {
    // e2 was minted with no examples (like a note minted before its context
    // was migrated into `examples`); its examples are filled in afterwards.
    fake.setNotes(notes.map((n) => (n.id === "e2" ? { ...n, examples: ["Huset er rødt."] } : { ...n })));
    const result = await runPublish(pool, config);
    assert.equal(result.published, true);
    const c2 = outputModel(result.buildId).cards.find((c) => c.N.includes("word-e2"));
    assert.equal(c2.X, '<div class="left">Huset er rødt.</div>');
    assert.equal(await xOf(c2.ID), c2.X);
  });
});
