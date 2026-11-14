-- deck-descriptions: closes the gap where custom decks (C20-C29) always
-- shipped with a blank on-device Description field — mod 2119 already
-- renders it, stock decks already use it, builder just never populated it.
ALTER TABLE decks ADD COLUMN description TEXT NOT NULL DEFAULT '';
