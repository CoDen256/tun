-- D-L6: `writePublication` now reads base_version/patch_rev off the active
-- `logic_bundles` row at the moment of publish, instead of copying the last
-- publication's values forward (the never-actually-implemented rule this
-- change closes). This FK records which logic bundle a publish was built
-- from. Nullable: every publication written before this migration, and any
-- future force-published row with no logic bundle active yet, has none.
ALTER TABLE publications ADD COLUMN logic_bundle_id INTEGER REFERENCES logic_bundles (id);
