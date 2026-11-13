-- D-L1: the operator-managed, versioned store of assembled base+patch JS
-- bundles. Exactly one row is ever `active` — that's what `builder` builds
-- onto every run (builder/src/logicBundle.js's `loadActive`). Replaces the
-- single mutable `BUNDLE_PATH` file, which conflated "which base+patches"
-- (operator-owned, rare) with "which cards" (builder-owned, constant).
--
-- `active` is an app-layer-enforced single-row invariant (hub/src/
-- logicBundles.js's `activate`), not a DB constraint — acceptable at this
-- project's single-operator scale (design.md's documented trade-off).
CREATE TABLE logic_bundles (
  id            SERIAL PRIMARY KEY,
  base_version  TEXT NOT NULL,     -- from the base folder's apktool.yml (versionInfo.versionName)
  patch_rev     INTEGER NOT NULL,  -- global monotonic counter, never resets on a base change (D-L2)
  file_path     TEXT NOT NULL,     -- data/logic/<id>.js, immutable once written
  bundle_sha    TEXT NOT NULL,
  label         TEXT,
  active        BOOLEAN NOT NULL DEFAULT FALSE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
