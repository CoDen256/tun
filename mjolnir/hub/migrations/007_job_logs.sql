-- D-H4: not a real log shipper — just the run's own narration checkpoints
-- (pull, assign, mint, drain, regenerate, snapshot, publish), persisted
-- against the job that produced them so a failed run's log survives past
-- the failure, not just the terminal error already in `build_jobs.error`.
CREATE TABLE job_logs (
  id            SERIAL PRIMARY KEY,
  build_job_id  INTEGER NOT NULL REFERENCES build_jobs (id),
  at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  line          TEXT NOT NULL
);

CREATE INDEX job_logs_build_job_id_idx ON job_logs (build_job_id);
