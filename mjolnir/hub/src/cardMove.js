// Shared "move a card_slots row to a new id under a new deck" primitive —
// extracted from deckConsolidationMigration.js's own per-row loop (D-DC1) so
// practice-deck-remint's `cardReassignment.js` doesn't duplicate it. Both
// callers are responsible for their own transaction (`client` is assumed to
// already be inside one) and their own id/card_no allocation — this function
// only performs one row's actual move: insert new `card_slots`/`card_content`,
// repoint every table that references the old id, then delete the old rows.
// Never the reverse order — a FK would be briefly violated if an old row
// were deleted (or a referencing row repointed) before the new `card_slots`
// row it points at exists.
export async function moveCardRow(
  client,
  { oldId, newId, newDeckCode, newCardNo, noteId, audioSha256, grammarRuleId }
) {
  await client.query(
    "INSERT INTO card_slots (id, deck_code, card_no, note_id, audio_sha256, grammar_rule_id) VALUES ($1, $2, $3, $4, $5, $6)",
    [newId, newDeckCode, newCardNo, noteId, audioSha256 ?? null, grammarRuleId ?? null]
  );

  const { rows: contentRows } = await client.query("SELECT n, e, x, a FROM card_content WHERE card_id = $1", [oldId]);
  if (contentRows.length > 0) {
    const c = contentRows[0];
    await client.query("INSERT INTO card_content (card_id, n, e, x, a) VALUES ($1, $2, $3, $4, $5)", [
      newId,
      c.n,
      c.e,
      c.x,
      c.a,
    ]);
  }

  await client.query("UPDATE minted_notes SET card_slot_id = $1 WHERE card_slot_id = $2", [newId, oldId]);
  await client.query("UPDATE pending_occurrences SET card_id = $1, deck_code = $2 WHERE card_id = $3", [
    newId,
    newDeckCode,
    oldId,
  ]);
  await client.query("UPDATE staged_occurrences SET card_id = $1, deck_code = $2 WHERE card_id = $3", [
    newId,
    newDeckCode,
    oldId,
  ]);
  await client.query("UPDATE occurrence_shipments SET card_id = $1 WHERE card_id = $2", [newId, oldId]);

  if (contentRows.length > 0) {
    await client.query("DELETE FROM card_content WHERE card_id = $1", [oldId]);
  }
  await client.query("DELETE FROM card_slots WHERE id = $1", [oldId]);
}
