-- D-L3: each card's last-known-good rendered N/E/X/A, written at mint and
-- refreshed on every regeneration while the source note is still returned
-- by stabbur's pull. Left untouched once the note is tombstoned — stabbur's
-- read API excludes `deleted_at` notes forever, so a tombstoned note's row
-- is simply never written again, not a special case to code for.
--
-- `D` (the redundant deck-title copy) is deliberately NOT stored here — it's
-- filled from the deck row at assembly time, since it's trivially derivable
-- and storing it would just be one more place a deck rename could drift.
CREATE TABLE card_content (
  card_id     TEXT PRIMARY KEY REFERENCES card_slots (id),
  n           TEXT,
  e           TEXT,
  x           TEXT,
  a           TEXT NOT NULL,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
