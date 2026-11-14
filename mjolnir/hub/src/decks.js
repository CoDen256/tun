import { query } from "./db.js";

// The deck allocation table (tun/docs/03-data-model.md, builder/README.md,
// deck-consolidation). `hub`'s own `decks` row is metadata only (title/
// pacing knobs); the actual bundle deck entry is created once, lazily, by
// `ensureDeck` (D-P1) the first time `builder` mints a card into it.
//
// deck-consolidation: these are now the 2 families' STARTING codes only
// (`builder/src/deckFamilies.js`'s `DECK_FAMILIES`) — the original 10-way
// per-type/PoS split (C20-C29, one deck each) collapsed into `lexic`
// (starts C30) and `practice` (starts C20, repurposing the old
// "substantiv" code rather than keeping it). A family's overflow codes
// (C21, C31, ...) are never pre-seeded here — `deckFamilies.js`'s
// `ensureRolloverDeck` creates their `decks` row lazily, on first rollover.
export const DECK_ALLOCATION = [
  { code: "C20", title: "Practice", description: "Grammar, listening, and pronunciation practice." },
  { code: "C30", title: "Lexic", description: "Vocabulary and expressions." },
];

// Task 3.3. "Fixed catalog data" (13-operator-console-ux.md) — safe to
// auto-run on every container boot, unlike sample/test content, because
// idempotent "make sure these 10 rows exist" is always harmless to re-run.
// ON CONFLICT DO NOTHING so a re-run never clobbers an operator-edited
// pacing knob for a deck that already exists.
export async function seedDecks() {
  for (const { code, title, description } of DECK_ALLOCATION) {
    await query(
      `INSERT INTO decks (code, title, category, description, managed_by_hub) VALUES ($1, $2, $3, $4, TRUE)
       ON CONFLICT (code) DO NOTHING`,
      [code, title, code[0], description || ""]
    );
  }
  return DECK_ALLOCATION.length;
}

// Task 1.3: the operator's own edit affordance (same pattern as
// `publications.js`'s `updateLabel`) — independent of `seedDecks`'
// ON CONFLICT DO NOTHING, which never touches an already-existing row.
export async function updateDeckDescription(code, description) {
  const { rowCount } = await query("UPDATE decks SET description = $1 WHERE code = $2", [description, code]);
  if (rowCount === 0) throw new Error(`no such deck "${code}"`);
}

export async function listDecks() {
  const { rows } = await query("SELECT code, title, category, description FROM decks ORDER BY code");
  return rows;
}
