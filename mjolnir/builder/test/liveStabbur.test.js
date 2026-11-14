import test from "node:test";
import assert from "node:assert/strict";
import { pullNotes, pullGrammarRules } from "../src/stabburClient.js";

// Task 5.4: once stabbur's p4-notes actually shipped, the fixture
// (`test/fixtures/stabburNotes.js`) was confirmed field-for-field against
// the real service — this test keeps that confirmation re-checkable going
// forward, without making the suite depend on a live stabbur by default.
// Opt in with:
//   STABBUR_LIVE_URL=http://localhost:5056 STABBUR_LIVE_TOKEN=... npm test
const LIVE_URL = process.env.STABBUR_LIVE_URL;
const LIVE_TOKEN = process.env.STABBUR_LIVE_TOKEN;
const describe = LIVE_URL && LIVE_TOKEN ? test : test.skip;

const NOTE_FIELDS = [
  "id",
  "created_at",
  "capture_id",
  "type",
  "source_lang",
  "text",
  "translations",
  "transcription",
  "pos",
  "lemma",
  "inflections",
  "context_text",
  "audio_blob",
  "audio_sel_ms",
  "grammar_rule_id",
  "status",
].sort();

describe("live stabbur: GET /api/notes and /api/grammar_rules match builder's fixture shape (D-N4)", async (t) => {
  await t.test("GET /api/notes returns exactly the fields the fixture assumes, nothing more or less", async () => {
    const notes = await pullNotes({ baseUrl: LIVE_URL, authToken: LIVE_TOKEN, sourceLang: "no" });
    assert.ok(Array.isArray(notes));
    assert.ok(notes.length > 0, "expected at least one ready note — run scripts/seed_p4_notes.py in stabbur first");
    for (const note of notes) {
      assert.deepEqual(Object.keys(note).sort(), NOTE_FIELDS, `note ${note.id} has unexpected shape`);
      assert.notEqual(note.status, "draft", "the read API must never surface a draft note under any filter");
    }
  });

  await t.test("GET /api/grammar_rules returns {id, title, html} rows buildGrammarRuleLookup can index", async () => {
    const rules = await pullGrammarRules({ baseUrl: LIVE_URL, authToken: LIVE_TOKEN });
    assert.ok(Array.isArray(rules));
    for (const rule of rules) {
      assert.deepEqual(Object.keys(rule).sort(), ["html", "id", "title"]);
    }
  });

  await t.test("an unauthenticated or wrongly-authenticated pull 401s (D85 guard still holds against the real service)", async () => {
    await assert.rejects(() => pullNotes({ baseUrl: LIVE_URL, authToken: "definitely-wrong" }), /401/);
  });
});
