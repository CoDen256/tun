-- D-S5: the device-facing progress sync shim's storage. `device_id` is
-- whatever id the shim's `.doc(id)` is given — the real Firebase Auth
-- `uid` (D-S1), not a locally-generated identifier.
CREATE TABLE userdata (
  device_id   TEXT PRIMARY KEY,
  doc         JSONB NOT NULL,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Append-only — "last-write-wins storage is not a backup" (05-sync.md). A
-- row on every PATCH/POST/DELETE, never updated or removed afterward.
-- `doc` is NULL for a DELETE's row — there is no resulting document, but
-- the deletion itself still needs a permanent record (D-S5).
CREATE TABLE userdata_history (
  id          SERIAL PRIMARY KEY,
  device_id   TEXT NOT NULL,
  doc         JSONB,
  at          TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX userdata_history_device_id_idx ON userdata_history (device_id);

-- D31/D-S5: device status piggybacks on the same PATCH payload as progress
-- sync, rather than a separate endpoint — one row per device, overwritten
-- in place (this is live status, not history).
CREATE TABLE device_state (
  device_id         TEXT PRIMARY KEY,
  active_build_id   TEXT,
  pending_build_id  TEXT,
  audio_cached      INTEGER,
  audio_total       INTEGER,
  last_error        TEXT,
  seen_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);
