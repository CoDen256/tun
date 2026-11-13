// D85: stabbur's /api/notes and /api/grammar_rules require a bearer token on
// every path except /ui and /blob/ (same shared-token middleware as smia,
// D-N1) — missing entirely until found cross-checking a real pull against
// stabbur's actual auth.py (neither side's fixture/mock exercised auth).
function authHeaders(authToken) {
  if (!authToken) throw new Error("stabbur authToken is required (D85 — /api/notes and /api/grammar_rules require it)");
  return { Authorization: `Bearer ${authToken}` };
}

// Pull step (task 4.2): `GET /api/notes?source_lang=no&status=ready&since=…`
// (D-N4, stabbur's p4-notes read API). `status=ready` is always sent, though
// the contract hard-filters to ready regardless (D-N4 notes-read-api).
export async function pullNotes({ baseUrl, authToken, sourceLang = "no", since } = {}) {
  if (!baseUrl) throw new Error("pullNotes requires baseUrl");
  const url = new URL("/api/notes", baseUrl);
  url.searchParams.set("source_lang", sourceLang);
  url.searchParams.set("status", "ready");
  if (since) url.searchParams.set("since", since);

  const res = await fetch(url, { headers: authHeaders(authToken) });
  if (!res.ok) {
    throw new Error(`stabbur pull failed: ${res.status} ${res.statusText}`);
  }
  return res.json();
}

// D74: audio is mandatory for every Mjølnir card, no type-based exception. A
// `ready` note with no `audio_blob` simply isn't eligible yet.
export function filterAudioEligible(notes) {
  return notes.filter((n) => !!n.audio_blob);
}

// D89: `GET /api/grammar_rules` has existed in stabbur since p4-notes'
// first implementation commit — nothing in `builder` called it until now.
export async function pullGrammarRules({ baseUrl, authToken } = {}) {
  if (!baseUrl) throw new Error("pullGrammarRules requires baseUrl");
  const res = await fetch(new URL("/api/grammar_rules", baseUrl), { headers: authHeaders(authToken) });
  if (!res.ok) {
    throw new Error(`stabbur grammar_rules pull failed: ${res.status} ${res.statusText}`);
  }
  return res.json();
}

// Fetches the list once and returns a synchronous `id -> {title, html}`
// lookup — `projector.js`'s `grammarRuleLookup` param is plain and
// synchronous, so the fetch has to happen up front, once per run, not per
// note.
export async function buildGrammarRuleLookup({ baseUrl, authToken } = {}) {
  const rules = await pullGrammarRules({ baseUrl, authToken });
  const byId = new Map(rules.map((r) => [r.id, { title: r.title, html: r.html }]));
  return (id) => byId.get(id);
}
