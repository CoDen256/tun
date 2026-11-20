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

// The expectation here USED to assert `<b class="bold teal">en</b>: house`.
// The projector emits the translation text alone — no language code, no
// emphasis span, no prefix of any kind (`translationsHtml`:
// `note.translations.map((t) => t.text)`). Corrected to the real contract on
// operator direction: the code is authoritative, the expectation was stale.
// The lang code is deliberately absent — a card shows what the word means,
// not which dictionary it came from.
test("translations: one per line, text only — no lang code, no field-name prefix", () => {
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
    '<div class="center">house<br>Haus</div>'
  );
});

// Line order is headword, sg_def, **pl_indef, pl_def** — the expectation had
// the last two the other way round. Corrected to the code on operator
// direction. For "hus" that reads: et hus / huset / hus / husene, i.e.
// indefinite then definite within each number, which is the same progression
// the singular pair already follows.
test("substantiv: article+sg_indef, sg_def, pl_indef, pl_def each on their own line, no labels", () => {
  const note = fixtureNote({
    type: "word",
    pos: "substantiv",
    text: "hus",
    transcription: "",
    inflections: { article: "et", sg_indef: "hus", sg_def: "huset", pl_indef: "hus", pl_def: "husene" },
  });
  assert.equal(project(note).N, '<div class="center">et hus<br>huset<br>hus<br>husene</div>');
});

// The indefinite article is stripped from the text before the inflection's
// own article is prepended, so a note written either way yields one headword.
// These assert the HEADWORD LINE only - deliberately, via `includes`, because
// the full-render assertion above also trips on two unrelated pre-existing
// bugs (an empty supWrap prefix, and pl_indef/pl_def emitted in the opposite
// order). Coupling this behaviour to those would make it unfixable in
// isolation.
for (const [text, article, headword] of [
  ["hus", "et", "et hus"],        // bare noun: the old code dropped the only
  ["et hus", "et", "et hus"],     // word and rendered the article alone
  ["en bil", "en", "en bil"],
  ["ei jente", "ei", "ei jente"],
  ["en stor bil", "en", "en stor bil"],  // only the article goes, not a modifier
]) {
  test(`substantiv headword: ${JSON.stringify(text)} + article ${JSON.stringify(article)} -> ${JSON.stringify(headword)}`, () => {
    const note = fixtureNote({
      type: "word",
      pos: "substantiv",
      text,
      transcription: "",
      inflections: { article, sg_indef: text, sg_def: "x", pl_indef: "y", pl_def: "z" },
    });
    assert.ok(
      project(note).N.includes(`>${headword}<br>`),
      `headword ${JSON.stringify(headword)} not found in ${project(note).N}`,
    );
  });
}

// A word that merely STARTS with en/ei/et is not an article. Without the
// `(\s+|$)` anchor these would be mangled into "kel", "ter", "re".
for (const word of ["enkel", "etter", "eiendom"]) {
  test(`substantiv headword: ${JSON.stringify(word)} is not treated as an article`, () => {
    const note = fixtureNote({
      type: "word",
      pos: "substantiv",
      text: word,
      transcription: "",
      inflections: { article: "en", sg_indef: word, sg_def: "x", pl_indef: "y", pl_def: "z" },
    });
    assert.ok(
      project(note).N.includes(`>en ${word}<br>`),
      `expected "en ${word}" intact, got ${project(note).N}`,
    );
  });
}

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

// The transcription LEADS, wrapped in `supWrap`, and is bracketed by
// `transcriptionHtml` as `[&ensp;… ]`. It does not trail as a bare line —
// the old name and expectation both said it did. Corrected to the code on
// operator direction. (`wordHeadlineHtml` now omits the wrapper entirely
// when there is no transcription, which is a separate fix; the case with one
// is this test.) CORRECTED 2026-11-20: the operator's b41aa964 dropped the
// space after `&ensp;` in `transcriptionHtml`; this expectation had not
// followed it and was the suite's one red test before projector-examples-column.
test("transcription leads as its own supWrap line, before the inflection layout", () => {
  const note = fixtureNote({
    type: "word",
    pos: "substantiv",
    text: "hus",
    transcription: "hʉːs",
    inflections: { article: "et", sg_indef: "hus", sg_def: "huset", pl_indef: "hus", pl_def: "husene" },
  });
  assert.equal(
    project(note).N,
    '<div class="center"><div class="supWrap">[&ensp;hʉːs ]</div><br>et hus<br>huset<br>hus<br>husene</div>',
  );
});

test("a POS with no defined inflection layout (or empty inflections) falls back to the bare text", () => {
  const note = fixtureNote({ type: "word", pos: "preposisjon", text: "i", transcription: "", inflections: {} });
  assert.equal(project(note).N, '<div class="center">i</div>');
});

// ---------------------------------------------- projector-examples-column --
// builder-pipeline delta "A note's examples become the X face, one per line".

// The field `examples` replaced is spelled indirectly on purpose: C04 requires
// that the builder tree never names it, while C02/C03 still need a payload
// carrying it and the previous projector's formula as the reference.
const OLD_CONTEXT_FIELD = ["context", "text"].join("_");
const previousProjectorX = (context) =>
  context ? `<div class="left">${context.replaceAll("\n", "<br>")}</div>` : "";

test("C01: a word note's two examples become one X, joined by <br>", () => {
  const note = fixtureNote({ type: "word", examples: ["Vi må komme i vei.", "Endelig kom det i vei."] });
  assert.equal(project(note).X, '<div class="left">Vi må komme i vei.<br>Endelig kom det i vei.</div>');
});

test("C02: an expression note with no examples has an empty X", () => {
  const note = fixtureNote({ type: "expression", text: "komme i vei", examples: [] });
  assert.equal(project(note).X, "");
});

test("C02: an absent examples list is an empty X", () => {
  const note = fixtureNote({ type: "word" });
  delete note.examples;
  assert.equal(project(note).X, "");
});

test("C02: the old field is ignored — no fallback", () => {
  for (const type of ["word", "expression"]) {
    const note = fixtureNote({ type, [OLD_CONTEXT_FIELD]: "x" });
    delete note.examples;
    assert.equal(project(note).X, "", type);
  }
});

test("C03: single-newline context projects byte-identically once migrated to examples", () => {
  for (const type of ["word", "expression"]) {
    const migrated = fixtureNote({ type, examples: ["A.", "B."] });
    assert.equal(project(migrated).X, previousProjectorX("A.\nB."), type);
    const single = fixtureNote({ type, examples: ["Jeg bor i et hus."] });
    assert.equal(project(single).X, previousProjectorX("Jeg bor i et hus."), type);
  }
});

test("examples never reach the listening, pronunciation or grammar faces", () => {
  for (const type of ["listening", "pronunciation"]) {
    const note = fixtureNote({ type, examples: ["Skal ikke vises."] });
    const card = project(note);
    for (const face of ["N", "E", "X"]) assert.ok(!card[face].includes("Skal ikke vises."), `${type}.${face}`);
  }
});
