// Deck family table (deck-rollover D-DR1, filled in by deck-consolidation).
// Static and explicit — never computed arithmetic on deck codes — matching
// this project's existing convention for the old WORD_POS_DECK/TYPE_DECK/
// DECK_ALLOCATION tables this replaces.
//
// `practice` keeps the old C20-C29 range as its overflow sequence (deck-
// rollover's own design.md precedent: "C20-C29 is enough for now, don't
// over-engineer a cross-block continuation") — C20 itself is repurposed
// from "substantiv" to "practice"'s starting code, not kept as-is (deck-
// consolidation's proposal.md). `lexic` gets the same 10-code depth
// starting fresh at C30, since it absorbs 6 of the old 10 decks' worth of
// content at once and is the family most likely to need rollover
// immediately.
export const DECK_FAMILIES = {
  lexic: { title: "Lexic", codes: ["C30", "C31", "C32", "C33", "C34", "C35", "C36", "C37", "C38", "C39"] },
  practice: { title: "Practice", codes: ["C20", "C21", "C22", "C23", "C24", "C25", "C26", "C27", "C28", "C29"] },
};

// card-flow-view: "occurrences eventual" per deck mirrors `splitOccurrences`'
// immediate/queued split (pipeline.js) rather than a second source of truth —
// lexic decks mint word/expression notes (`{A,E}`, 2 occurrences/card),
// practice decks mint grammar/listening/pronunciation notes (1/card). A code
// outside both families (a stock A/B/Z deck, never present in `card_slots`)
// returns null — out of this view's scope entirely (design.md's Risk 1).
export function occurrencesPerCardForDeck(deckCode) {
  if (DECK_FAMILIES.lexic.codes.includes(deckCode)) return 2;
  if (DECK_FAMILIES.practice.codes.includes(deckCode)) return 1;
  return null;
}

const ROMAN_NUMERALS = [
  [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
  [100, "C"], [90, "XC"], [50, "L"], [40, "XL"],
  [10, "X"], [9, "IX"], [5, "V"], [4, "IV"], [1, "I"],
];

function toRoman(num) {
  let result = "";
  for (const [value, symbol] of ROMAN_NUMERALS) {
    while (num >= value) {
      result += symbol;
      num -= value;
    }
  }
  return result;
}

// D-DR4: a rollover code's `decks` row is created lazily, on first use, not
// pre-seeded like a family's starting code. `ON CONFLICT DO NOTHING` makes
// this idempotent across runs that mint into an already-rolled-over code
// (task 2.3) — same pattern `hub/src/decks.js`'s `seedDecks` already uses.
async function ensureRolloverDeck(pool, code, title) {
  await pool.query(
    "INSERT INTO decks (code, title, category, description, managed_by_hub) VALUES ($1, $2, $3, '', TRUE) ON CONFLICT (code) DO NOTHING",
    [code, title, code[0]]
  );
}

// deck-consolidation: the migration script computes its own id mapping up
// front (a pure, read-only plan — see `hub/src/deckConsolidationMigration.
// js`), rather than discovering rollover via `resolveActiveDeckCode`'s live
// `card_slots` queries as it goes — so it needs this same title-derivation
// step (D-DR4) exposed on its own, for whichever overflow codes its plan
// says it will use. A no-op for a family's STARTING code (position 0) —
// that one is pre-seeded via `DECK_ALLOCATION`/`seedDecks`, not this path.
export async function ensureDeckRowForFamilyCode(pool, familyKey, code) {
  const family = DECK_FAMILIES[familyKey];
  if (!family) throw new Error(`unknown deck family "${familyKey}"`);
  const index = family.codes.indexOf(code);
  if (index <= 0) return;
  await ensureRolloverDeck(pool, code, `${family.title} ${toRoman(index + 1)}`);
}

// D-DR2: resolves a family to whichever of its configured codes is
// currently active — the first one with fewer than 999 minted cards.
// Checked fresh per call (per family per run, at each call site) rather
// than cached across runs, since a cached "active code" could drift from
// `card_slots`' real state if it's ever edited out of band.
export async function resolveActiveDeckCode(pool, familyKey) {
  const family = DECK_FAMILIES[familyKey];
  if (!family) throw new Error(`unknown deck family "${familyKey}"`);

  for (let i = 0; i < family.codes.length; i++) {
    const code = family.codes[i];
    const { rows } = await pool.query("SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = $1", [
      code,
    ]);
    if (Number(rows[0].max_no) < 999) {
      if (i > 0) await ensureRolloverDeck(pool, code, `${family.title} ${toRoman(i + 1)}`);
      return code;
    }
  }

  throw new Error(`deck family "${familyKey}" has exhausted every configured code`);
}
