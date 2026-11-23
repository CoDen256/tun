// THROWAWAY tester harness — not part of the suite. Delete after use.
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { runExplode } from "../../src/commands/explode.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { startFakeStabbur, shaOf } from "../test/helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "../test/helpers/logicBundleFixture.js";
import { makeDbLogger } from "../src/jobLogs.js";

export { shaOf };

export function wordNote(id, overrides = {}) {
  const audioText = `audio for ${id}`;
  return {
    id, created_at: "2026-10-01T00:00:00.000Z", capture_id: null, type: "word",
    source_lang: "no", text: `word-${id}`, translations: [{ lang: "en", text: `translation-${id}` }],
    transcription: "", pos: "substantiv", lemma: `word-${id}`, inflections: {}, context_text: "",
    audio_blob: shaOf(audioText), audio_sel_ms: null, grammar_rule_id: null, status: "ready",
    ...overrides,
  };
}

export async function setup({ fresh = true } = {}) {
  const pool = getPool();
  await migrate();
  if (fresh) await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, staged_occurrences, occurrence_shipments, job_logs, logic_bundles, card_content CASCADE"
  );
  if (fresh) {
    for (const { code, title, description } of DECK_ALLOCATION) {
      await pool.query("INSERT INTO decks (code, title, category, description) VALUES ($1, $2, $3, $4)", [
        code, title, code[0], description || "",
      ]);
    }
  }
  process.env.ALLOW_NO_COMPANION = "1";
  const tmpDir = process.env.FA_TMPDIR || fs.mkdtempSync(path.join(os.tmpdir(), "fa-"));
  fs.mkdirSync(tmpDir, { recursive: true });
  const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
  if (!fs.existsSync(logicBundlePath)) {
    fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\n" + buildFixtureBundleSource());
    runExplode(logicBundlePath);
  }
  if (fresh) await seedActiveLogicBundle(pool, logicBundlePath);
  const dataDir = path.join(tmpDir, "data");
  const fake = startFakeStabbur();
  const stabburBaseUrl = await fake.listen();
  const notesPath = path.join(tmpDir, "notes.json");
  const notes = !fresh && fs.existsSync(notesPath) ? JSON.parse(fs.readFileSync(notesPath, "utf8")) : [];
  for (const n of notes) fake.addBlob(shaOf(`audio for ${n.id}`), `audio for ${n.id}`);
  fake.setNotes([...notes]);
  const config = {
    stabburBaseUrl, internalToken: fake.authToken, sourceLang: "no", dataDir,
    publicBase: "https://tun.example.test", log: makeDbLogger(pool),
  };
  function addNotes(...ns) {
    notes.push(...ns);
    for (const n of ns) fake.addBlob(shaOf(`audio for ${n.id}`), `audio for ${n.id}`);
    fake.setNotes([...notes]);
    fs.writeFileSync(notesPath, JSON.stringify(notes));
  }
  return { pool, config, notesPath, fake, dataDir, tmpDir, addNotes, notes };
}

// Every (card,letter) of a deck and where it lives.
export async function places(pool, deckCode) {
  const m = new Map();
  const add = (c, l, w) => { const k = `${c}/${l}`; if (!m.has(k)) m.set(k, []); m.get(k).push(w); };
  const q = async (sql) => (await pool.query(sql, [deckCode])).rows;
  for (const r of await q("SELECT os.card_id, os.letter FROM occurrence_shipments os JOIN card_slots cs ON cs.id=os.card_id WHERE cs.deck_code=$1")) add(r.card_id, r.letter, "shipped");
  for (const r of await q("SELECT card_id, letter FROM staged_occurrences WHERE deck_code=$1")) add(r.card_id, r.letter, "staged");
  for (const r of await q("SELECT card_id, letter FROM pending_occurrences WHERE deck_code=$1")) add(r.card_id, r.letter, "pending");
  return m;
}

export async function snapshot(pool) {
  const t = async (sql) => (await pool.query(sql)).rows;
  return {
    staged: await t("SELECT id, deck_code, card_id, letter FROM staged_occurrences ORDER BY id"),
    pending: await t("SELECT id, deck_code, card_id, letter, remaining FROM pending_occurrences ORDER BY id"),
    shipped: await t("SELECT id, card_id, letter, build_id FROM occurrence_shipments ORDER BY id"),
    publications: await t("SELECT build_id, bundle_sha FROM publications ORDER BY build_id"),
  };
}
