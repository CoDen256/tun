-- D93: a per-occurrence shipment log, not a card-level column. A card's two
-- sides can ship in two different, far-apart builds — a word/expression
-- card's A ships the run it's minted, its E ships whenever the cross-batch
-- queue drains (D91), which can be many publishes later. Written once per
-- occurrence at the moment it actually ships (mint-time for an immediate
-- letter, drain-time for a queued one) — append-only, never updated or
-- deleted.
CREATE TABLE occurrence_shipments (
  id          SERIAL PRIMARY KEY,
  card_id     TEXT NOT NULL,
  letter      TEXT NOT NULL,
  build_id    TEXT NOT NULL REFERENCES publications (build_id),
  shipped_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- The Cards page's per-side status query (join card_slots ->
-- occurrence_shipments -> pending_occurrences) is keyed by card_id.
CREATE INDEX occurrence_shipments_card_id_idx ON occurrence_shipments (card_id);

-- pending_occurrences already has a deck_code index (003); card_id is the
-- other join key the Cards page needs.
CREATE INDEX pending_occurrences_card_id_idx ON pending_occurrences (card_id);
