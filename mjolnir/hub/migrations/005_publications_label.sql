-- The OTA console (ota-console spec) needs a persistent, editable label per
-- historical build for its history-management table — `current.json`'s
-- `label` field only ever describes whichever build is *currently* active,
-- there was nowhere to keep one per past build until now. Nullable: every
-- row published before this migration has no label on record.
ALTER TABLE publications ADD COLUMN label TEXT;
