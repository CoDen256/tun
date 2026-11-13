-- hub's schema (D-P3). Scoped to exactly what builder/P4 needs — no
-- /mjolnir/userdata, device_state, or userdata_history (those are P5).

-- Permanent, minted-once 6-character card identity (findings.md C3). `id`
-- IS `deck_code || lpad(card_no, 3, '0')` — stored denormalized rather than
-- computed so a lookup by id needs no string-building.
CREATE TABLE card_slots (
  id          TEXT PRIMARY KEY CHECK (char_length(id) = 6),
  deck_code   TEXT NOT NULL,
  card_no     INTEGER NOT NULL CHECK (card_no BETWEEN 1 AND 999),
  note_id     TEXT NOT NULL,
  retired     BOOLEAN NOT NULL DEFAULT FALSE,
  UNIQUE (deck_code, card_no)
);

-- One row per Mjølnir deck (category decks C20-C29 plus anything else
-- builder/the manual editor ever creates). Mirrors the bundle's own deck
-- shape (findings.md §1) closely enough that `ensureDeck` (src/injectDeck.js)
-- and this table agree on defaults.
CREATE TABLE decks (
  code              TEXT PRIMARY KEY,
  title             TEXT NOT NULL,
  category          TEXT NOT NULL CHECK (char_length(category) = 1),
  max_interval      INTEGER NOT NULL DEFAULT 10,
  auto_tick_streak  INTEGER NOT NULL DEFAULT 1,
  auto_hammer_count INTEGER NOT NULL DEFAULT 2,
  enabled           BOOLEAN NOT NULL DEFAULT TRUE
);

-- One row per publish. Three separately-owned version fields, not one
-- (D77): base_version/patch_rev are operator-set and copied forward;
-- data_rev is bumped by builder automatically on every publish.
CREATE TABLE publications (
  build_id      TEXT PRIMARY KEY,
  base_version  TEXT NOT NULL,
  patch_rev     INTEGER NOT NULL,
  data_rev      INTEGER NOT NULL,
  bundle_sha    TEXT NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- The CI-job pattern (02-services.md): builder writes a row, picks it up,
-- writes status back; builder's UI polls. No Redis/Celery for one operator.
CREATE TABLE build_jobs (
  id            BIGSERIAL PRIMARY KEY,
  status        TEXT NOT NULL CHECK (status IN ('queued', 'running', 'succeeded', 'failed')),
  requested_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  started_at    TIMESTAMPTZ,
  finished_at   TIMESTAMPTZ,
  error         TEXT
);

-- hub's own ledger of which stabbur notes it has already minted a card for
-- (D44) — never pushed back to stabbur. This is what "newly-eligible" means
-- for the floor check: any ready+audio'd note not yet in this table.
CREATE TABLE minted_notes (
  note_id       TEXT PRIMARY KEY,
  card_slot_id  TEXT NOT NULL REFERENCES card_slots (id),
  minted_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);
