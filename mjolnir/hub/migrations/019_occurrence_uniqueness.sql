-- flush-record-atomicity (D-FA3): a card owes each letter AT MOST ONCE,
-- ever (D18/D91 occurrence sets). That was a convention the pipeline
-- happened to respect, not something the database would refuse to break —
-- and on 2026-11-09 the b000040 recovery run broke it: `drainThenQueue` was
-- called once per RECOVERED CARD, so with 127 `E` rows queued at
-- remaining = 11 the first 11 recovered cards drained all of them at once,
-- `hasPendingOccurrence` stopped seeing a row from the 12th card on, the
-- same `E` was re-queued, and later cards drained and staged it a SECOND
-- time. 104 occurrences reached `occurrence_shipments` twice.
--
-- The ordering fix (one drain per deck per run) lives in
-- `builder/src/pipeline.js`. This file makes the invariant the database's
-- own, so a future double-stage fails the run loudly instead of silently
-- double-shipping.
--
-- De-duplication first, defensively: production was hand-repaired after the
-- incident (duplicates collapsed, queue rows dropped for already-shipped
-- occurrences), but a dev database restored from before that repair has
-- not been. Keeping the OLDEST row per (card_id, letter) matches the repair
-- that was actually performed live, and is the only choice that preserves
-- `replay`'s shipment-id ordering for the rows that stay.

DELETE FROM staged_occurrences a
  USING staged_occurrences b
  WHERE a.card_id = b.card_id AND a.letter = b.letter AND a.id > b.id;

DELETE FROM pending_occurrences a
  USING pending_occurrences b
  WHERE a.card_id = b.card_id AND a.letter = b.letter AND a.id > b.id;

DELETE FROM occurrence_shipments a
  USING occurrence_shipments b
  WHERE a.card_id = b.card_id AND a.letter = b.letter AND a.id > b.id;

CREATE UNIQUE INDEX staged_occurrences_card_letter_idx
  ON staged_occurrences (card_id, letter);

CREATE UNIQUE INDEX pending_occurrences_card_letter_idx
  ON pending_occurrences (card_id, letter);

CREATE UNIQUE INDEX occurrence_shipments_card_letter_idx
  ON occurrence_shipments (card_id, letter);
