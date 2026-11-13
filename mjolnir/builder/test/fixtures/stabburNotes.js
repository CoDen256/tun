// Matches stabbur's p4-notes `GET /api/notes` contract exactly (D-N4,
// stabbur/openspec/changes/p4-notes/design.md). Built against a fixture of
// that API's response shape so this change doesn't block on `p4-notes`
// landing (design.md's Migration Plan, step 4) — swap for the real service
// once it ships (task 5.4).

let counter = 0;
function nextId() {
  counter += 1;
  return `fixture-note-${counter}`;
}

// A reasonable default per note type, overridable per call. `audio_blob`
// defaults to a fixture sha256 — D74: audio is mandatory for Mjølnir
// eligibility with no type-based exception, so every helper here is
// audio'd and ready unless a test explicitly asks otherwise.
export function fixtureNote(overrides = {}) {
  const id = overrides.id || nextId();
  return {
    id,
    created_at: "2026-10-01T00:00:00.000Z",
    capture_id: null,
    type: "word",
    source_lang: "no",
    text: "hus",
    translations: [{ lang: "en", text: "house" }],
    transcription: "hʉːs",
    pos: "substantiv",
    lemma: "hus",
    inflections: { article: "et", sg_indef: "hus", sg_def: "huset", pl_indef: "hus", pl_def: "husene" },
    context_text: "Jeg bor i et hus.",
    audio_blob: `${id}-sha256`,
    audio_sel_ms: [0, 1200],
    grammar_rule_id: null,
    status: "ready",
    ...overrides,
  };
}

export function fixtureNotes(n, overrides = {}) {
  return Array.from({ length: n }, () => fixtureNote(overrides));
}
