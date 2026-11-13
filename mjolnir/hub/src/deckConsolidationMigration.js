// deck-consolidation: a one-time, operator-triggered migration (never
// auto-run as part of `hub/src/migrate.js`'s routine startup migrations —
// this is irreversible and transforms real data, not "fixed catalog data,
// safe to re-run"). Moves every existing `card_slots` row to a new id under
// its new family's active deck code, repointing every table that
// references a card by id (design.md's D-DC1).
//
// `planMigration` is the single, pure source of truth for the old-id ->
// new-id mapping — both the dry-run report and the real apply call it
// against the exact same `card_slots` snapshot, so apply is guaranteed to
// produce exactly what the dry-run predicted (task 3.4).
import { DECK_FAMILIES, ensureDeckRowForFamilyCode } from "../../builder/src/deckFamilies.js";
import { moveCardRow } from "./cardMove.js";

// The original 10-way type/PoS split's decks, collapsed into deck-
// consolidation's 2 families (proposal.md's "What Changes"). A card's NEW
// family is derived from its OLD deck code, not by re-reading its source
// note — the note may have changed since the card was originally minted,
// and the old deck code is itself the permanent, authoritative record of
// what it was minted as.
export const OLD_DECK_TO_FAMILY = {
  C20: "lexic", // substantiv
  C21: "lexic", // adjektiv
  C22: "lexic", // verb
  C23: "lexic", // adverb
  C24: "lexic", // preposisjon
  C25: "lexic", // konjunksjon/subjunksjon
  C26: "lexic", // expression
  C27: "practice", // listening
  C28: "practice", // pronunciation
  C29: "practice", // grammar
};

// A family's starting code (`DECK_FAMILIES[key].codes[0]`) is pre-seeded by
// `hub/src/decks.js`'s `DECK_ALLOCATION`/`seedDecks` and must never be
// deleted by this migration, even if it ends up with zero cards — C20 is
// reused as `practice`'s starting point (proposal.md), so "zero cards at
// C20 right now" doesn't mean "C20 is retired", unlike every other old code.
function protectedStartingCodes() {
  return new Set(Object.values(DECK_FAMILIES).map((f) => f.codes[0]));
}

// D-DR2-style allocation, but against a pure in-memory plan instead of live
// `card_slots` queries — the whole point of a dry-run is to compute this
// without touching the database. Deterministic as long as it processes
// cards in the same (deck_code, card_no) order real `resolveActiveDeckCode`
// calls would see them in during a real apply (guaranteed below, since
// `planMigration` sorts its input the same way).
function resolveCodeForPlan(nextCardNoByCode, familyKey) {
  const family = DECK_FAMILIES[familyKey];
  if (!family) throw new Error(`unknown deck family "${familyKey}"`);
  for (const code of family.codes) {
    const used = nextCardNoByCode.get(code) || 0;
    if (used < 999) return code;
  }
  throw new Error(`deck family "${familyKey}" has exhausted every configured code during migration`);
}

// D-DC1/D-DC3: processes cards grouped by OLD deck code, then by OLD
// card_no ascending — this single global sort is also what guarantees
// correctness for the C20 reuse case: every old C20 (substantiv, `lexic`)
// row is fully processed and removed from the plan's view of C20 before any
// `practice`-mapped code (C27-C29, sorted after C20-C26) ever tries to
// claim C20 as its own starting point. `nextCardNoByCode` starts every code
// at 0 regardless of old occupancy — correct precisely because real apply
// deletes an old code's rows before any OTHER family's cards are assigned
// into that same code label (same ordering guarantee).
export function planMigration(oldCardRows) {
  const sorted = [...oldCardRows].sort((a, b) => a.deckCode.localeCompare(b.deckCode) || a.cardNo - b.cardNo);
  const nextCardNoByCode = new Map();
  const mapping = [];

  for (const row of sorted) {
    const family = OLD_DECK_TO_FAMILY[row.deckCode];
    if (!family) throw new Error(`old deck code "${row.deckCode}" has no configured family mapping`);
    const newDeckCode = resolveCodeForPlan(nextCardNoByCode, family);
    const newCardNo = (nextCardNoByCode.get(newDeckCode) || 0) + 1;
    nextCardNoByCode.set(newDeckCode, newCardNo);

    mapping.push({
      oldId: row.id,
      oldDeckCode: row.deckCode,
      family,
      newId: `${newDeckCode}${String(newCardNo).padStart(3, "0")}`,
      newDeckCode,
      newCardNo,
      noteId: row.noteId,
      audioSha256: row.audioSha256,
      grammarRuleId: row.grammarRuleId,
    });
  }

  return mapping;
}

function familyRolloverInfo(mapping) {
  const codesByFamily = new Map();
  for (const m of mapping) {
    if (!codesByFamily.has(m.family)) codesByFamily.set(m.family, new Set());
    codesByFamily.get(m.family).add(m.newDeckCode);
  }
  const result = {};
  for (const key of Object.keys(DECK_FAMILIES)) result[key] = (codesByFamily.get(key)?.size || 0) > 1;
  return result;
}

// Scoped to only the original 10 pre-consolidation codes — never the whole
// `card_slots` table. A deck code outside `OLD_DECK_TO_FAMILY` is simply not
// this migration's concern (a hand-created custom deck from the manual
// editor, unrelated to the type/PoS split being consolidated here, or —
// post-migration — one of the NEW family codes this very script just
// created); `planMigration` throwing on an unmapped code is a safety net
// for THESE rows, not a reason to feed it rows it was never meant to see.
async function loadOldCardRows(queryable) {
  const oldCodes = Object.keys(OLD_DECK_TO_FAMILY);
  const { rows } = await queryable.query(
    "SELECT id, deck_code, card_no, note_id, audio_sha256, grammar_rule_id FROM card_slots WHERE deck_code = ANY($1) ORDER BY deck_code, card_no",
    [oldCodes]
  );
  return rows.map((r) => ({
    id: r.id,
    deckCode: r.deck_code,
    cardNo: r.card_no,
    noteId: r.note_id,
    audioSha256: r.audio_sha256,
    grammarRuleId: r.grammar_rule_id,
  }));
}

// Task 2.1/2.2: read-only — writes nothing. Reports the full old-id ->
// new-id mapping plus a per-table row-count summary of what WOULD change,
// and whether a family's migration would trigger an immediate rollover
// (more than one of its codes used).
export async function dryRun(pool) {
  const oldCardRows = await loadOldCardRows(pool);
  const mapping = planMigration(oldCardRows);
  const oldIds = mapping.map((m) => m.oldId);

  const tableCounts = { card_slots: mapping.length };
  const countQueries = [
    ["card_content", "SELECT count(*) AS count FROM card_content WHERE card_id = ANY($1)"],
    ["pending_occurrences", "SELECT count(*) AS count FROM pending_occurrences WHERE card_id = ANY($1)"],
    ["staged_occurrences", "SELECT count(*) AS count FROM staged_occurrences WHERE card_id = ANY($1)"],
    ["occurrence_shipments", "SELECT count(*) AS count FROM occurrence_shipments WHERE card_id = ANY($1)"],
    ["minted_notes", "SELECT count(*) AS count FROM minted_notes WHERE card_slot_id = ANY($1)"],
  ];
  for (const [table, sql] of countQueries) {
    const { rows } = await pool.query(sql, [oldIds]);
    tableCounts[table] = Number(rows[0].count);
  }

  return {
    mapping,
    tableCounts,
    rolloverTriggered: familyRolloverInfo(mapping),
    retiredDeckCodes: [...new Set(mapping.map((m) => m.oldDeckCode))].filter((c) => !protectedStartingCodes().has(c)),
  };
}

// Tasks 3.1-3.3: the same plan, applied for real, in one transaction —
// either every card moves and every stale `decks` row is cleaned up, or
// none of it does.
export async function applyMigration(pool) {
  const client = await pool.connect();
  try {
    await client.query("BEGIN");

    const oldCardRows = await loadOldCardRows(client);
    const mapping = planMigration(oldCardRows);

    // D-DR4: any overflow code this plan needs gets its `decks` row created
    // up front, via the exact same title derivation `resolveActiveDeckCode`
    // itself uses for an ordinary rollover — a no-op for each family's
    // starting code (already seeded by `DECK_ALLOCATION`).
    const newCodesUsed = new Set(mapping.map((m) => m.newDeckCode));
    const familyByNewCode = new Map(mapping.map((m) => [m.newDeckCode, m.family]));
    for (const code of newCodesUsed) {
      await ensureDeckRowForFamilyCode(client, familyByNewCode.get(code), code);
    }

    // D-DC1 (practice-deck-remint task 2.1): for each card, in the plan's
    // own deterministic order — `moveCardRow` does the actual insert-
    // repoint-delete for one row; shared with `cardReassignment.js`'s
    // narrower single-card tool rather than duplicated.
    for (const row of mapping) {
      await moveCardRow(client, {
        oldId: row.oldId,
        newId: row.newId,
        newDeckCode: row.newDeckCode,
        newCardNo: row.newCardNo,
        noteId: row.noteId,
        audioSha256: row.audioSha256,
        grammarRuleId: row.grammarRuleId,
      });
    }

    // D-DC5: delete a retired code's `decks` row outright once zero
    // `card_slots` rows reference it — except a family's own starting code
    // (C20/C30), which must never be deleted even if momentarily empty.
    const protectedCodes = protectedStartingCodes();
    const oldCodesTouched = new Set(mapping.map((m) => m.oldDeckCode));
    const deletedDeckCodes = [];
    for (const code of oldCodesTouched) {
      if (protectedCodes.has(code)) continue;
      const { rows: remaining } = await client.query("SELECT count(*) AS count FROM card_slots WHERE deck_code = $1", [
        code,
      ]);
      if (Number(remaining[0].count) === 0) {
        await client.query("DELETE FROM decks WHERE code = $1", [code]);
        deletedDeckCodes.push(code);
      }
    }

    // A family's starting code that's ALSO one of the old retired codes is
    // being REUSED (C20: substantiv -> practice), not freshly created — its
    // `decks` row already existed before this migration (and before
    // `deck-consolidation`'s code even deployed), so `seedDecks`' `ON
    // CONFLICT DO NOTHING` never touches its title. Left alone, it would
    // show the OLD family's name forever even though its content is now
    // entirely the new family's. Retitle it explicitly, here, as part of
    // this one-time reuse event — the only place that ever has both "this
    // code is being reused" and "here is its new family" in scope at once.
    const retitledDeckCodes = [];
    for (const [familyKey, family] of Object.entries(DECK_FAMILIES)) {
      const startingCode = family.codes[0];
      if (oldCodesTouched.has(startingCode) && !deletedDeckCodes.includes(startingCode)) {
        await client.query("UPDATE decks SET title = $1 WHERE code = $2", [family.title, startingCode]);
        retitledDeckCodes.push({ code: startingCode, family: familyKey, title: family.title });
      }
    }

    await client.query("COMMIT");
    return { mapping, deletedDeckCodes, retitledDeckCodes };
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}
