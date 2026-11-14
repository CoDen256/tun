// Mints `card_slots` (+ `minted_notes`) rows for a deck's newly-eligible
// notes — the permanent id ledger (D44/D-P3). Card ids are never reused and
// never computed by scanning the bundle (that's `nextCardId`'s job for the
// manual editor; here the id has to exist *before* the bundle is touched, so
// `inject-deck`'s `createCard` can be told it directly).
export async function mintCardSlots(pool, deckCode, notes) {
  const client = await pool.connect();
  try {
    await client.query("BEGIN");
    // Lock the deck's own row (not an aggregate query, which Postgres
    // refuses to combine with FOR UPDATE) to serialize concurrent minting
    // into the same deck.
    await client.query("SELECT code FROM decks WHERE code = $1 FOR UPDATE", [deckCode]);
    const { rows } = await client.query("SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = $1", [
      deckCode,
    ]);
    let nextNo = Number(rows[0].max_no) + 1;

    const minted = [];
    for (const note of notes) {
      const cardId = `${deckCode}${String(nextNo).padStart(3, "0")}`;
      await client.query(
        "INSERT INTO card_slots (id, deck_code, card_no, note_id, audio_sha256, grammar_rule_id) VALUES ($1, $2, $3, $4, $5, $6)",
        [cardId, deckCode, nextNo, note.id, note.audio_blob, note.grammar_rule_id ?? null]
      );
      await client.query("INSERT INTO minted_notes (note_id, card_slot_id) VALUES ($1, $2)", [note.id, cardId]);
      minted.push({ note, cardId });
      nextNo += 1;
    }

    await client.query("COMMIT");
    return minted;
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

// Maps every already-minted note id (hub's ledger) to its permanent card id
// and deck code, for the regenerate-on-every-publish step (03-data-model.md).
// The deck code rides along so `pipeline.js`'s D86 recovery path can
// recreate a card that's in this ledger but missing from the bundle without
// a second query.
export async function cardIdsForNotes(pool, noteIds) {
  if (noteIds.length === 0) return new Map();
  const { rows } = await pool.query(
    "SELECT mn.note_id, mn.card_slot_id, cs.deck_code FROM minted_notes mn JOIN card_slots cs ON cs.id = mn.card_slot_id WHERE mn.note_id = ANY($1)",
    [noteIds]
  );
  return new Map(rows.map((r) => [r.note_id, { cardId: r.card_slot_id, deckCode: r.deck_code }]));
}

// A still-present note's audio can change (a re-recorded clip); refresh the
// stored hash alongside its content on every run it's seen in the pull.
// `grammarRuleId` is refreshed the same way — a grammar note's referenced
// rule is as editable as any other field (cards-browser's grammar-rule link).
export async function updateAudioSha256(pool, cardId, audioSha256, grammarRuleId = null) {
  await pool.query("UPDATE card_slots SET audio_sha256 = $1, grammar_rule_id = $2 WHERE id = $3", [
    audioSha256,
    grammarRuleId,
    cardId,
  ]);
}

// `{cardId: sha256}` for every card ever minted — including ones whose
// source note has since been tombstoned on stabbur and so won't appear in
// the current pull (task 4.10: the manifest covers the whole bundle).
export async function allCardAudio(pool) {
  const { rows } = await pool.query("SELECT id, audio_sha256 FROM card_slots WHERE audio_sha256 IS NOT NULL");
  return Object.fromEntries(rows.map((r) => [r.id, r.audio_sha256]));
}

// Deck title for `ensureDeck` — hub's own `decks` table is the source of
// truth for titles (seeded with the allocation table, task 3.3).
export async function deckTitle(pool, deckCode) {
  const { rows } = await pool.query("SELECT title FROM decks WHERE code = $1", [deckCode]);
  if (rows.length === 0) throw new Error(`deck "${deckCode}" not found in hub's decks table — was it seeded?`);
  return rows[0].title;
}

// deck-descriptions (D-DD2): mirrors `deckTitle` exactly — same source of
// truth, same shape, same "not found" guard.
export async function deckDescription(pool, deckCode) {
  const { rows } = await pool.query("SELECT description FROM decks WHERE code = $1", [deckCode]);
  if (rows.length === 0) throw new Error(`deck "${deckCode}" not found in hub's decks table — was it seeded?`);
  return rows[0].description;
}
