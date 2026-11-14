import test from "node:test";
import assert from "node:assert/strict";
import { project, NOTE_TYPES } from "../src/projector.js";
import { fixtureNote } from "./fixtures/stabburNotes.js";

test("projects all five note types without throwing, each with occurrence set + A matching 03-data-model.md's table", () => {
  // D91: word/expression drop "N" from their occurrence set (never
  // quizzed text-first); the N *content* field is unaffected.
  const expected = {
    word: { A: "N", occurrences: ["A", "E"] },
    expression: { A: "N", occurrences: ["A", "E"] },
    listening: { A: "N", occurrences: ["A"] },
    pronunciation: { A: "E", occurrences: ["N"] },
    grammar: { A: "E", occurrences: ["N"] },
  };
  assert.deepEqual(NOTE_TYPES.sort(), Object.keys(expected).sort());

  for (const type of NOTE_TYPES) {
    const note = fixtureNote({ type, grammar_rule_id: type === "grammar" ? "rule-1" : null });
    const card = project(note);
    assert.equal(card.A, expected[type].A, `A for ${type}`);
    assert.deepEqual(card.occurrences, expected[type].occurrences, `occurrences for ${type}`);
    assert.equal(typeof card.N, "string");
    assert.equal(typeof card.E, "string");
    assert.equal(typeof card.X, "string");
  }
});

test("projection is pure: re-running on unchanged input produces identical output", () => {
  const note = fixtureNote({ type: "word" });
  assert.deepEqual(project(note), project(note));
});

test("throws on an unknown note type rather than silently defaulting", () => {
  assert.throws(() => project(fixtureNote({ type: "unknown-type" })), /no projector for note type/);
});

test("grammar projection uses a placeholder when no grammarRuleLookup is given, and the rule's content when it is", () => {
  const note = fixtureNote({ type: "grammar", grammar_rule_id: "rule-1" });
  const withoutLookup = project(note);
  assert.match(withoutLookup.X, /rule-1/);
  assert.match(withoutLookup.X, /not yet available/);

  const withLookup = project(note, { grammarRuleLookup: (id) => (id === "rule-1" ? { title: "Present tense", html: "<p>...</p>" } : undefined) });
  assert.match(withLookup.X, /Present tense/);
});

test("translations: one per line, lang code bold+teal (the stock bundle's own emphasis classes), no field-name prefix", () => {
  const note = fixtureNote({
    type: "word",
    translations: [
      { lang: "en", text: "house" },
      { lang: "de", text: "Haus" },
    ],
  });
  const card = project(note);
  assert.equal(
    card.E,
    '<div class="center"><b class="bold teal">en</b>: house<br><b class="bold teal">de</b>: Haus</div>'
  );
});

test("substantiv: article+sg_indef, sg_def, pl_def, pl_indef each on their own line, no labels", () => {
  const note = fixtureNote({
    type: "word",
    pos: "substantiv",
    text: "hus",
    transcription: "",
    inflections: { article: "et", sg_indef: "hus", sg_def: "huset", pl_indef: "hus", pl_def: "husene" },
  });
  assert.equal(project(note).N, '<div class="center">et hus<br>huset<br>husene<br>hus</div>');
});

test("adjektiv: positiv, nøytrum+flertall, komparativ+superlativ, each on their own line", () => {
  const note = fixtureNote({
    type: "word",
    pos: "adjektiv",
    text: "stor",
    transcription: "",
    inflections: { positiv: "stor", nøytrum: "stort", flertall: "store", komparativ: "større", superlativ: "størst" },
  });
  assert.equal(project(note).N, '<div class="center">stor<br>stort store<br>større størst</div>');
});

test("verb: infinitiv, presens, preteritum, perfektum each on their own line — matches the stock bundle's own layout", () => {
  const note = fixtureNote({
    type: "word",
    pos: "verb",
    text: "stjele",
    transcription: "",
    inflections: { infinitiv: "å stjele", presens: "stjeler", preteritum: "stjal", perfektum: "har stjålet" },
  });
  assert.equal(project(note).N, '<div class="center">å stjele<br>stjeler<br>stjal<br>har stjålet</div>');
});

test("adverb: just the form, no label", () => {
  const note = fixtureNote({ type: "word", pos: "adverb", text: "fort", transcription: "", inflections: { form: "fort" } });
  assert.equal(project(note).N, '<div class="center">fort</div>');
});

test("transcription still trails as its own line, after the inflection layout", () => {
  const note = fixtureNote({
    type: "word",
    pos: "substantiv",
    text: "hus",
    transcription: "hʉːs",
    inflections: { article: "et", sg_indef: "hus", sg_def: "huset", pl_indef: "hus", pl_def: "husene" },
  });
  assert.equal(project(note).N, '<div class="center">et hus<br>huset<br>husene<br>hus<br>hʉːs</div>');
});

test("a POS with no defined inflection layout (or empty inflections) falls back to the bare text", () => {
  const note = fixtureNote({ type: "word", pos: "preposisjon", text: "i", transcription: "", inflections: {} });
  assert.equal(project(note).N, '<div class="center">i</div>');
});
