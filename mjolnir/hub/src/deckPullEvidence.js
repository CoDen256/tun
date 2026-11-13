// practice-deck-remint: the one invariant that makes a card-deck
// reassignment safe at all — `replay.js` (builder's) rejoins each shipped
// occurrence's deck from `card_slots`'s CURRENT `deck_code` on every
// publish, so moving a card already woven into a studied deck's `Cards[]`
// would shift every later occurrence's position for that device
// (docs/findings.md §C4). This module answers, live, "has any device ever
// pulled this deck" — never a hardcoded/cached assumption.
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { loadActive } from "../../builder/src/logicBundle.js";
import { loadDeckCardModel } from "../../src/deckData.js";

// A deck's `decksStatus`-shape numeric `ID` lives only in the active logic
// bundle's baked-in deck catalog (`model.decks[].ID`, assigned once at
// deck-creation time by `injectDeck.js`'s `ensureDeck`/`nextDeckId` — see
// docs/findings.md §1's deck shape). Nothing in hub's own Postgres schema
// stores it, so resolving it means reading the active bundle, same as any
// other code path that needs baked-in deck state (D-L4). Returns `null` for
// a deck code that has never been baked into any published bundle — such a
// deck can't appear in any device's `decksStatus` either, so the pull-
// evidence check below degrades to its `totalCards` half only.
export async function resolveDeckNumericId(pool, deckCode) {
  const active = await loadActive(pool);
  const scratchPath = path.join(os.tmpdir(), `mjolnir-deck-id-lookup-${process.pid}-${Date.now()}.js`);
  fs.writeFileSync(scratchPath, active.bytes);
  try {
    const model = loadDeckCardModel(scratchPath);
    const deck = model.decks.find((d) => d.Name === deckCode);
    return deck ? deck.ID : null;
  } finally {
    fs.rmSync(scratchPath, { force: true });
    fs.rmSync(`${scratchPath}.exploded`, { recursive: true, force: true });
  }
}

// Every device's synced `userdata` row, checked for either signal — a
// `decksStatus` entry naming this deck's numeric ID with `PullCounter > 0`,
// or any id in `totalCards` that's prefixed with this deck's code (a card
// already pulled and studied, present even if the deck-level counter
// somehow wasn't). Either signal alone is sufficient to block (spec's own
// scenario). Returns the full list of blocking evidence, not just a
// boolean, so a caller can report which device/evidence blocked it.
export async function findPullEvidence(pool, deckCode) {
  const numericId = await resolveDeckNumericId(pool, deckCode);
  const { rows } = await pool.query("SELECT device_id, doc FROM userdata");

  const evidence = [];
  for (const row of rows) {
    const doc = row.doc || {};

    if (numericId !== null) {
      const status = (doc.decksStatus || []).find((d) => d.ID === numericId);
      if (status && Number(status.PullCounter) > 0) {
        evidence.push({
          deviceId: row.device_id,
          reason: "decksStatus",
          detail: `PullCounter=${status.PullCounter} for deck ID ${numericId}`,
        });
        continue;
      }
    }

    const matchingCard = (doc.totalCards || []).find(
      (c) => typeof c?.ID === "string" && c.ID.startsWith(deckCode)
    );
    if (matchingCard) {
      evidence.push({ deviceId: row.device_id, reason: "totalCards", detail: matchingCard.ID });
    }
  }
  return evidence;
}
