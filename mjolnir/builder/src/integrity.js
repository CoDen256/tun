// flush-record-atomicity (D-FA4): the occurrence ledger's read-only
// integrity check.
//
// One query set, no writes, no side effects. It answers the single question
// nobody could answer on the morning of 2026-11-10: is every occurrence this
// pipeline owes still somewhere? The 2026-11-09 loss (13 `E` occurrences
// consumed by a run that then failed, recoverable only from a database
// backup) and the b000040 duplication (104 occurrences shipped twice, 115
// cards with their `E` ahead of their own `A`) both have an exact, cheap
// signature here. It was found by accident instead.
//
// Three anomaly kinds, all keyed by card id so the banner can name the
// offenders:
//
//   missing    — a minted card owes more occurrences than exist in
//                shipped ∪ staged ∪ pending. The 2026-11-09 fingerprint.
//   duplicate  — a (card, letter) exists more than once, in one table or
//                across two. The b000040 fingerprint.
//   orderBreak — a shipped `E` whose own `A` has never shipped. D91: "the
//                word is never quizzed text-first", so this is a real
//                device-visible defect, not bookkeeping.
//
// Deliberately NOT a table or a stored summary — it is computed from the
// three ledger tables on every page load, so it can never itself go stale
// (`cardFlow.js`'s "compute from existing tables, never a second source of
// truth" decision, extended to correctness).

import { DECK_FAMILIES } from "./deckFamilies.js";

// `occurrencesPerCardForDeck` already encodes the per-family occurrence
// count; these are the same two sets, as arrays SQL can match against.
const TWO_OCCURRENCE_DECKS = DECK_FAMILIES.lexic.codes;
const ONE_OCCURRENCE_DECKS = DECK_FAMILIES.practice.codes;

const UNION_OCC = `
  SELECT card_id, letter, 'shipped' AS place FROM occurrence_shipments
  UNION ALL SELECT card_id, letter, 'staged' FROM staged_occurrences
  UNION ALL SELECT card_id, letter, 'pending' FROM pending_occurrences
`;

// A hard cap, not pagination: a banner naming 500 cards has already made its
// point, and an unbounded list would be the one query on this page able to
// hurt. The counts are exact regardless (see `truncated`).
const MAX_LISTED = 500;

export async function checkOccurrenceIntegrity(pool) {
  const [duplicates, missing, orderBreaks] = await Promise.all([
    pool.query(
      `WITH occ AS (${UNION_OCC})
       SELECT card_id, letter, count(*) AS n, string_agg(place, '+' ORDER BY place) AS places
       FROM occ GROUP BY card_id, letter HAVING count(*) > 1
       ORDER BY card_id, letter LIMIT ${MAX_LISTED}`
    ),
    pool.query(
      `WITH occ AS (${UNION_OCC})
       SELECT cs.id AS card_id, cs.deck_code, count(DISTINCT o.letter) AS present
       FROM card_slots cs LEFT JOIN occ o ON o.card_id = cs.id
       WHERE cs.deck_code = ANY($1) OR cs.deck_code = ANY($2)
       GROUP BY cs.id, cs.deck_code
       HAVING count(DISTINCT o.letter) < CASE WHEN cs.deck_code = ANY($1) THEN 2 ELSE 1 END
       ORDER BY cs.id LIMIT ${MAX_LISTED}`,
      [TWO_OCCURRENCE_DECKS, ONE_OCCURRENCE_DECKS]
    ),
    pool.query(
      `SELECT DISTINCT os.card_id, cs.deck_code
       FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id
       WHERE os.letter = 'E' AND cs.deck_code = ANY($1)
         AND NOT EXISTS (SELECT 1 FROM occurrence_shipments a WHERE a.card_id = os.card_id AND a.letter = 'A')
       ORDER BY os.card_id LIMIT ${MAX_LISTED}`,
      [TWO_OCCURRENCE_DECKS]
    ),
  ]);

  const anomalies = [
    ...missing.rows.map((r) => ({
      kind: "missing",
      cardId: r.card_id,
      deckCode: r.deck_code,
      detail: `owes ${TWO_OCCURRENCE_DECKS.includes(r.deck_code) ? 2 : 1} occurrence(s), ${r.present} accounted for`,
    })),
    ...duplicates.rows.map((r) => ({
      kind: "duplicate",
      cardId: r.card_id,
      deckCode: null,
      detail: `${r.letter} exists ${r.n}× (${r.places})`,
    })),
    ...orderBreaks.rows.map((r) => ({
      kind: "orderBreak",
      cardId: r.card_id,
      deckCode: r.deck_code,
      detail: "E shipped but its own A never did (D91: never quizzed text-first)",
    })),
  ];

  return {
    anomalies,
    counts: {
      missing: missing.rows.length,
      duplicate: duplicates.rows.length,
      orderBreak: orderBreaks.rows.length,
    },
    truncated: [missing, duplicates, orderBreaks].some((r) => r.rows.length === MAX_LISTED),
  };
}
