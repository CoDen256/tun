-- D91 (supersedes D87/D88): the mint floor is gone entirely; a word/
-- expression card's A occurrence ships the moment it's minted, and its E is
-- queued here until 11 other occurrences have landed in the same deck across
-- however many subsequent publishes it takes. Single-occurrence note types
-- never touch this table — nothing of their own to space against.
CREATE TABLE pending_occurrences (
  id          BIGSERIAL PRIMARY KEY,
  deck_code   TEXT NOT NULL,
  card_id     TEXT NOT NULL REFERENCES card_slots (id),
  letter      TEXT NOT NULL CHECK (letter IN ('N', 'E', 'A')),
  remaining   INTEGER NOT NULL
);

-- Every drain step touches "all pending rows for this deck" and "all rows at
-- remaining <= 0" — both scoped by deck_code.
CREATE INDEX pending_occurrences_deck_code_idx ON pending_occurrences (deck_code);
