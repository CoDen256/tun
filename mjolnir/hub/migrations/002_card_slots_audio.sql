-- Found implementing builder's audio-manifest step (task 4.10): `card_slots`
-- needs to remember the audio sha256 a card was minted/last regenerated
-- with, independent of the note still being in stabbur's current pull. A
-- card is permanent (03-data-model.md permanence rules) even if its source
-- note is later tombstoned on stabbur — without this column, building
-- audio.json for the *whole* bundle on a later run would have no way to
-- know a since-removed note's card's audio hash.
ALTER TABLE card_slots ADD COLUMN audio_sha256 TEXT;
