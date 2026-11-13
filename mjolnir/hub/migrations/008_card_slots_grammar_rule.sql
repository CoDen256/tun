-- The Cards page (cards-browser spec) needs a type=grammar card's
-- grammar_rule_id to link to the rule in stabbur's UI, alongside the
-- existing source-note link. Nothing persisted this before — hub's
-- one-directional pull (D44) only ever passed a note's grammar_rule_id
-- through to content projection, never storing it. Nullable: only
-- type=grammar cards (one per deck C29) ever set it; mirrors how
-- audio_sha256 was added to this table later in P4 once a real need
-- surfaced, not part of the original schema.
ALTER TABLE card_slots ADD COLUMN grammar_rule_id TEXT;
