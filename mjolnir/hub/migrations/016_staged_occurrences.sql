-- builder-sliding-window-shipping (D-W1): a second, independent staging
-- step that sits strictly after D91's pending_occurrences queue — tracks
-- "ready to ship, waiting for enough neighbors to also be ready" (no
-- countdown, just FIFO order by id), not "how many occurrences until this E
-- can drain". Only the largest multiple of 5 a deck currently holds here
-- ever flushes into Cards[] in a given run (D-W2) — guarantees the app's
-- own `5 × PullCounter` draw-offset math can never overshoot the array.
CREATE TABLE staged_occurrences (
  id          BIGSERIAL PRIMARY KEY,
  deck_code   TEXT NOT NULL,
  card_id     TEXT NOT NULL REFERENCES card_slots (id),
  letter      TEXT NOT NULL CHECK (letter IN ('N', 'E', 'A')),
  staged_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Every flush step touches "all staged rows for this deck" — scoped by
-- deck_code, same as pending_occurrences_deck_code_idx.
CREATE INDEX staged_occurrences_deck_code_idx ON staged_occurrences (deck_code);
