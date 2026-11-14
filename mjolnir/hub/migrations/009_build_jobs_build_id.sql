-- The Run log UI (builder-run-log spec) needs to link a succeeded job to the
-- build it actually published ("Published b000012"). Nothing recorded this
-- before — build_jobs tracked only its own lifecycle, never which
-- publications row (if any) it produced. Nullable: a failed or still-running
-- job never has one.
ALTER TABLE build_jobs ADD COLUMN build_id TEXT REFERENCES publications (build_id);
