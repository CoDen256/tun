// Pure, stateless note -> card projection (tun/docs/03-data-model.md, "The
// five note/card types"). Never reads or writes anything; same input always
// produces the same `{N, E, X, A}` + occurrence set.


function translationsHtml(note) {
  const lines = note.translations.map((t) => `${t.text}`);
  return `<div class="center">${lines.join("<br>")}</div>`;
}

function ensurePrefix(prefix, str) {
  return str.startsWith(prefix) ? str : prefix + str;
}

// Strip a Norwegian indefinite article, and ONLY that.
//
// Called once, to build a `substantiv` headword as
// `article + dropIndefiniteArticle(text)`. The previous version dropped
// whatever the first word happened to be, which is right for "en bil" ->
// "bil" and silently destructive for a bare noun: "bil" -> "", so the
// headword rendered as the article alone ("en") with the noun gone. Stabbur
// notes carry both shapes, so both have to work.
//
// `(\s+|$)` is what keeps this honest - it anchors on a WORD, so "enkel",
// "etter" and "eire" are untouched even though they start with these two
// letters. Leading whitespace is trimmed first because note text is operator
// input, not a normalised field.
function dropIndefiniteArticle(str) {
  return str.trimStart().replace(/^(en|ei|et)(\s+|$)/i, "");
}


function wordInflectionLines(text, pos, inflections) {
  if (!inflections) return null;
  if (pos === "substantiv") {
    const { article, sg_indef, sg_def, pl_def, pl_indef } = inflections;
    const headword = [article, dropIndefiniteArticle(text)].filter(Boolean).join(" ");
    return [headword, sg_def, pl_indef, pl_def].filter(Boolean);
  }
  if (pos === "adjektiv") {
    // `nøytrum` with the ø — that is the key stabbur actually stores. The
    // destructure read `noytrum`, which is always undefined, so
    // `filter(Boolean)` dropped it and every adjective card lost its neuter
    // form silently: "stor / store / større størst" instead of
    // "stor / stort store / større størst". Nothing errored, the line was
    // just one word short.
    const { positiv, nøytrum, flertall, komparativ, superlativ } = inflections;
    const neuterPlural = [nøytrum, flertall].filter(Boolean).join(" ");
    const comparative = [komparativ, superlativ].filter(Boolean).join(" ");
    return [text, neuterPlural, comparative].filter(Boolean);
  }
  if (pos === "verb") {
    const { infinitiv, presens, preteritum, perfektum } = inflections;
    return [ensurePrefix("å ", text), presens, preteritum, ensurePrefix("har ", perfektum)].filter(Boolean);
  }
  if (pos === "adverb") {
    return inflections.form ? [inflections.form] : [text];
  }
  return null;
}

// The word card's headline: the inflection layout above when the POS has
// one and inflections are present, falling back to the bare `text` for
// every other POS (type=word with no inflections, per data-model.md) —
// `transcription`, if any, always trails as its own line either way.
function wordHeadlineHtml(note) {
  const lines = wordInflectionLines(note.text, note.pos, note.inflections);
  const body = lines && lines.length > 0 ? lines.join("<br>") : note.text;
  // Emit the transcription wrapper ONLY when there is a transcription. It was
  // unconditional, so a note with none rendered
  // `<div class="supWrap"></div><br>` — an empty div plus a line break, i.e. a
  // blank first line on the card, on every word note without a transcription.
  // Nothing errored; the card was just pushed down by one empty row.
  const sup = transcriptionHtml(note);
  return sup ? `<div class="supWrap">${sup}</div><br>${body}` : body;
}

// `grammarRuleLookup(id) => { title, html } | undefined` — optional. stabbur's
// p4-notes read API (D-N4) returns only `grammar_rule_id`, not the rule's
// content; no endpoint to fetch it exists yet in that contract (checked:
// neither notes-read-api nor any other p4-notes spec exposes one). Until
// that's added, `type=grammar` notes project with the rule id as a visible
// placeholder rather than failing the whole run — flagged in
// `openspec/changes/p4-builder/tasks.md` task 4.6 as a real cross-repo gap,
// not a silent guess.
function grammarRuleHtml(note, grammarRuleLookup) {
  const rule = grammarRuleLookup ? grammarRuleLookup(note.grammar_rule_id) : undefined;
  if (rule) return `<div class="center"><b class="bold">${rule.title}</b></div><div class="left">${rule.html}</div>`;
  return `<div class="center">[grammar rule ${note.grammar_rule_id} — content not yet available from stabbur]</div>`;
}

function transcriptionHtml(note){
  if (!note.transcription) return "";
  const map = {
  '"': '<div class="sup">2</div>',
  "'": '<div class="sup">1</div>'
  };

  const ipa = note.transcription
  .replace(/^[\/\[\]]+|[\/\[\]]+$/g, '')
  .replace(/["']/g, char => map[char]);

  return `[&ensp; ${ipa} ]`
}

const PROJECTORS = {
  // D91: word/expression's occurrence set drops `N` — the word is never
  // quizzed text-first, it only ever appears on reveal. The `N` *content*
  // field is unchanged; only the occurrence/quiz list shrinks.
  word: (note) => ({
    N: `<div class="center">${wordHeadlineHtml(note)}</div>`,
    E: translationsHtml(note),
    X: note.context_text ? `<div class="center">${note.context_text}</div>` : "",
    A: "N",
    occurrences: ["A", "E"],
  }),
  expression: (note) => ({
    N: `<div class="center">${note.text}</div>`,
    E: translationsHtml(note),
    X: note.context_text ? `<div class="center">${note.context_text}</div>` : "",
    A: "N",
    occurrences: ["A", "E"],
  }),
  listening: (note) => ({
    N: `<div class="center">${note.text}</div>`,
    E: translationsHtml(note),
    X: "",
    A: "N",
    occurrences: ["A"],
  }),
  pronunciation: (note) => ({
    N: `<div class="center">Read out:<br><span class="lg">${note.text}</span></div>`,
    E: `<div class="center"><div class="arialFont supWrap">${transcriptionHtml(note)}</div></div>`,
    X: "",
    A: "E",
    occurrences: ["N"],
  }),
  grammar: (note, { grammarRuleLookup } = {}) => ({
    N: `<div class="center">${note.text}</div>`,
    E: translationsHtml(note),
    X: grammarRuleHtml(note, grammarRuleLookup),
    A: "E",
    occurrences: ["N"],
  }),
};

export const NOTE_TYPES = Object.keys(PROJECTORS);

export function project(note, opts = {}) {
  const projector = PROJECTORS[note.type];
  if (!projector) {
    throw new Error(`no projector for note type "${note.type}" (expected one of ${NOTE_TYPES.join(", ")})`);
  }
  return projector(note, opts);
}
