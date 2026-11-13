-- fix-prune-retired-decks-stock-deletion (D1/D3): `pruneRetiredDecks`
-- (builder/src/pipeline.js) could not tell "hub fully migrated this deck
-- away" from "hub never minted into this deck at all" — both read as zero
-- `card_slots` rows. Stock decks baked into the original APK (C01, C03,
-- C10-C17) fall into the latter case and were being deleted on every
-- publish. This column is hub's positive record of which deck codes it has
-- ever minted into; `pruneRetiredDecks` now requires it before pruning.
-- Backfilled true for every row that already exists, since every such row
-- was, by construction, inserted by hub itself (C20, C30 today).
ALTER TABLE decks ADD COLUMN managed_by_hub BOOLEAN NOT NULL DEFAULT FALSE;
UPDATE decks SET managed_by_hub = TRUE;
