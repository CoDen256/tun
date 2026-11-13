// practice-deck-remint: a safe, precondition-gated tool for moving one or
// more `card_slots` rows (and everything that references them) to a
// different deck — general enough to reuse if a similar note-reclassified-
// after-mint situation is found again (design.md), not a one-off script.
import { moveCardRow } from "./cardMove.js";
import { findPullEvidence } from "./deckPullEvidence.js";

export class ReassignmentBlockedError extends Error {
  constructor(sourceDeckCode, evidence) {
    super(
      `reassignment refused — ${sourceDeckCode} has pull evidence on ${evidence.length} device(s): ` +
        evidence.map((e) => `${e.deviceId} (${e.reason}: ${e.detail})`).join("; ")
    );
    this.name = "ReassignmentBlockedError";
    this.sourceDeckCode = sourceDeckCode;
    this.evidence = evidence;
  }
}

// Shared by `previewReassignment`/`reassignCards` — loads the named cards'
// current rows (throwing if any id doesn't exist or the set spans more than
// one source deck, since the safety precondition is scoped to one deck at a
// time) and runs the live precondition check against that one source deck.
async function resolveSourceAndCheck(pool, cardIds) {
  if (!cardIds || cardIds.length === 0) throw new Error("at least one card id is required");

  const { rows } = await pool.query(
    "SELECT id, deck_code, card_no, note_id, audio_sha256, grammar_rule_id FROM card_slots WHERE id = ANY($1)",
    [cardIds]
  );
  const foundIds = new Set(rows.map((r) => r.id));
  const missing = cardIds.filter((id) => !foundIds.has(id));
  if (missing.length > 0) throw new Error(`card(s) not found in card_slots: ${missing.join(", ")}`);

  const sourceDeckCodes = new Set(rows.map((r) => r.deck_code));
  if (sourceDeckCodes.size > 1) {
    throw new Error(
      `reassignment requires every card to share one source deck — got ${[...sourceDeckCodes].sort().join(", ")}`
    );
  }
  const sourceDeckCode = [...sourceDeckCodes][0];
  const sourceRows = [...rows].sort((a, b) => a.card_no - b.card_no);
  const evidence = await findPullEvidence(pool, sourceDeckCode);
  return { sourceRows, sourceDeckCode, evidence };
}

// Read-only: resolves the source deck, re-runs the live precondition check,
// and (if it passes) predicts the exact new ids the destination deck's
// normal next-`card_no` allocation would assign — without writing anything.
// For an operator to confirm the move is still safe and see what it would
// do before committing (task 3.1's "re-verify at run time").
export async function previewReassignment(pool, { cardIds, destinationDeckCode }) {
  const { sourceRows, sourceDeckCode, evidence } = await resolveSourceAndCheck(pool, cardIds);
  if (evidence.length > 0) {
    return { ok: false, sourceDeckCode, destinationDeckCode, evidence };
  }

  const { rows: maxRow } = await pool.query(
    "SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = $1",
    [destinationDeckCode]
  );
  let nextNo = Number(maxRow[0].max_no) + 1;
  const predicted = sourceRows.map((row) => ({
    oldId: row.id,
    newId: `${destinationDeckCode}${String(nextNo++).padStart(3, "0")}`,
  }));

  return { ok: true, sourceDeckCode, destinationDeckCode, predicted };
}

// The real move: re-runs the precondition check (never trusts a caller's
// earlier `previewReassignment` result — no time-of-check/time-of-use gap),
// refuses with no bypass if it fails, otherwise performs every card's move
// in one transaction via `moveCardRow`, assigning new ids through the
// destination deck's own row lock (same pattern `mint.js`'s `mintCardSlots`
// already uses — Postgres refuses to combine `FOR UPDATE` with an
// aggregate, so the deck row is locked first, the `MAX(card_no)` read
// second).
export async function reassignCards(pool, { cardIds, destinationDeckCode }) {
  const { sourceRows, sourceDeckCode, evidence } = await resolveSourceAndCheck(pool, cardIds);
  if (evidence.length > 0) {
    throw new ReassignmentBlockedError(sourceDeckCode, evidence);
  }

  const client = await pool.connect();
  try {
    await client.query("BEGIN");
    await client.query("SELECT code FROM decks WHERE code = $1 FOR UPDATE", [destinationDeckCode]);
    const { rows: maxRow } = await client.query(
      "SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = $1",
      [destinationDeckCode]
    );
    let nextNo = Number(maxRow[0].max_no) + 1;

    const moved = [];
    for (const row of sourceRows) {
      const newId = `${destinationDeckCode}${String(nextNo).padStart(3, "0")}`;
      await moveCardRow(client, {
        oldId: row.id,
        newId,
        newDeckCode: destinationDeckCode,
        newCardNo: nextNo,
        noteId: row.note_id,
        audioSha256: row.audio_sha256,
        grammarRuleId: row.grammar_rule_id,
      });
      moved.push({ oldId: row.id, newId });
      nextNo += 1;
    }

    await client.query("COMMIT");
    return { sourceDeckCode, destinationDeckCode, moved };
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}
