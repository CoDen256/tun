-- ota-pull-tracking 3.1/3.2/3.3/3.4: the durable record of what the device
-- actually fetched from the gateway.
--
-- THIS IS THE SECOND ATTEMPT AT THIS QUESTION AND THE FIRST ONE IS WHY THE
-- SHAPE IS WHAT IT IS. 014_device_state_uid.sql created `device_state`
-- (active_build_id, pending_build_id, audio_cached, audio_total) and
-- 015_drop_device_state.sql dropped it, because the client never attached
-- those fields to a sync PATCH and the write path early-returned when they
-- were absent: correctly implemented, correctly tested, permanently empty
-- in production (D126). Nothing in this table depends on the device
-- reporting anything. Every row is written from the gateway's own access
-- log, which already sees every request, and the device is unaware this
-- table exists.
CREATE TABLE ota_pulls (
  id BIGSERIAL PRIMARY KEY,

  -- THE IDEMPOTENCY KEY (3.4). Ingest re-reads whole log files — Caddy rolls
  -- them, hub restarts, and a crash mid-file must be safe to retry — so the
  -- insert is `ON CONFLICT (dedup_key) DO NOTHING` and this column is what
  -- makes "the same event" mean the same thing twice. It is a sha256 over the
  -- gateway's own identifying fields for the line: its timestamp (float
  -- seconds, as Caddy writes it), the source address AND PORT, the method,
  -- the uri, the status and the size. The port is in there deliberately: it
  -- is what makes two genuinely distinct requests from one NAT'd home
  -- connection in the same millisecond distinguishable, and it is the one
  -- field that cannot repeat for a live connection.
  --
  -- It is NOT an offset into the file. An offset is wrong the moment the file
  -- rolls, and it cannot survive a truncation that leaves the same bytes at a
  -- different position.
  dedup_key TEXT NOT NULL UNIQUE,

  -- TWO KINDS, NEVER BLURRED (design.md §4).
  --   'bundle' — GET /ota/bundle/<buildId>.js. The bytes of one immutable
  --              build were served. Low volume, high meaning.
  --   'poll'   — GET /ota/current.json at app launch. High volume, and the
  --              ONLY device-liveness signal that exists now `device_state`
  --              is gone. A poll is not a pull.
  kind TEXT NOT NULL CHECK (kind IN ('bundle', 'poll')),

  -- NULL for every poll, and that is a fact about the record rather than a
  -- missing value: the access log holds a request, not a response body, so a
  -- poll says a device checked — never what it decided.
  --
  -- KEYED ON build_id ALONE (3.3), with no foreign key to `publications`.
  -- The buildId is a permanent identifier frozen by the OTA contract, so this
  -- column is insulated from anything the versioning work does to human
  -- labels (the label is rendered as a secondary line, joined at read time).
  -- NO FK, on purpose, twice over: a 404 for a build that was deleted from
  -- history is one of the most informative rows this table can hold, and a
  -- publication may be deleted while its pull record must survive.
  build_id TEXT,

  -- The gateway's own timestamp for the request, not the ingest time.
  event_at TIMESTAMPTZ NOT NULL,
  -- When hub first saw the line. Only ever used to explain the lag between
  -- "the phone fetched it" and "the page can show it".
  ingested_at TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- The outcome as the gateway reported it. A non-200 is recorded and is
  -- never counted as a successful pull anywhere: a 401 is an unauthenticated
  -- scan, a 404 is a request for a build that is not there, a 206 is a
  -- resumed transfer of a pull already counted once.
  status SMALLINT NOT NULL,
  -- Caddy's `size` field: response body bytes. NULL only if a line somehow
  -- lacks it.
  bytes BIGINT,
  method TEXT NOT NULL,
  uri TEXT NOT NULL,

  -- A NETWORK ADDRESS, AND NOTHING MORE. The OTA token is shared, so there
  -- is no account, uid or handset on these rows; a home connection means one
  -- address dominates, and it changes. Named `source_addr` rather than
  -- `device_*` so that no later reader can mistake it for an identity.
  source_addr TEXT NOT NULL
);

-- The Pulls page is "newest first, then filter", so the time index carries
-- the default view and both filters narrow it.
CREATE INDEX ota_pulls_event_at_idx ON ota_pulls (event_at DESC);
CREATE INDEX ota_pulls_kind_event_at_idx ON ota_pulls (kind, event_at DESC);
-- Partial: only bundle rows ever carry a build, and this index serves both
-- the per-build filter and Publish history's two new columns.
CREATE INDEX ota_pulls_build_id_idx ON ota_pulls (build_id, event_at DESC) WHERE build_id IS NOT NULL;

-- NOT excluded from the backup dump (design.md §9). A year of this table is
-- single-digit megabytes, and `bin/_check_backup_sources.py` exists precisely
-- to catch an excluded table whose data has no other source — which is what
-- this would become.
