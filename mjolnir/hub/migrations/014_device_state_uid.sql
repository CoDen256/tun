-- userdata-console / D-C1: `device_state.device_id` was keyed by the real
-- Firebase uid (D-S1) — fine for `userdata`, wrong for `device_state`,
-- which is physically local to one handset. Going forward `device_id` must
-- be a real, locally-generated per-device id (see
-- `patches/js/progress-sync-restore-companion.js`); `uid` is added so the
-- console can list every device an account has ever synced from.
--
-- The backfill (`uid = device_id`) is a one-time correction of the pre-fix
-- scheme, not a general migration pattern: every row that exists today was
-- actually keyed by a uid, so copying it into the new column is exactly
-- correct, not a loss of information.
ALTER TABLE device_state ADD COLUMN uid TEXT;
UPDATE device_state SET uid = device_id;
ALTER TABLE device_state ALTER COLUMN uid SET NOT NULL;
CREATE INDEX device_state_uid_idx ON device_state (uid);
