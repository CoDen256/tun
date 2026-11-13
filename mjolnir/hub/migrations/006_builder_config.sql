-- D-H3: the publish schedule, persisted so it's UI-editable without a
-- process restart. Single row, single key ('schedule'), read fresh by
-- clock.js on every tick — cheap at this project's solo-operator scale, no
-- caching needed.
--   {"kind": "daily", "at": "02:00"}
--   {"kind": "interval", "hours": 6}
--   {"kind": "manual"}
CREATE TABLE builder_config (
  key    TEXT PRIMARY KEY,
  value  JSONB NOT NULL
);
