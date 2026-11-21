# Tasks — userdata-git-history

**Read `design.md` §5 before starting.** The order of sections 2, 4 and 5 below
is a hard requirement, not a preference: the archive must exist, be committed
and be proven to restore before the dump exclusion lands and before the sweep
deletes anything. A dropped history row is gone; a large dump is merely large.

## 1. Seed realistic data first
- [x] 1.1 Create an account with multiple syncs across several days by issuing
      PATCHes against the sync endpoint — never by hand-writing rows — so the
      export is tested against documents the real write path produced.
- [x] 1.2 Make the card array large enough that a single-field change is
      distinguishable in a diff.
- [x] 1.3 Capture `GET` and `PATCH` responses for this account NOW, before any
      change, as the byte-for-byte baseline criteria 25–27 compare against.

## 2. The export (lands first)
- [x] 2.1 Add an export step to `backup/entrypoint.sh`, before the commit, in
      the same run that commits it.
- [x] 2.2 One file per uid in the `userdata` table at `userdata/<uid>.json`.
- [x] 2.3 Serialize with Postgres's own `jsonb_pretty` — do **not** add `jq` to
      the image (see `design.md` §3; verified absent). Stable order is the
      requirement; do not "improve" it to alphabetical.
- [x] 2.4 Follow the existing all-or-nothing discipline exactly: dump to a
      temporary name and rename, so a failed export leaves every committed file
      untouched and makes no commit.
- [x] 2.5 Prune the file of a uid that has left the table, matching the existing
      pruning of a dump whose database left the backup set.
- [x] 2.6 Surface the export on the `/backup/` page as `backup-console`'s mockup
      shows: file, size, last change, commits touching it.

## 3. Restore, documented and proven
- [x] 3.1 Write the import procedure that reconstructs a `userdata` row from an
      archived file.
- [x] 3.2 Prove it: restore into an empty table and confirm the document
      matches, then confirm a device `GET` returns it rather than factory
      defaults.
- [x] 3.3 Render the procedure on the `/backup/` page as copyable commands.
- [x] 3.4 Update `mjolnir/DEPLOY.md` and the backup docs with the new step.

## 4. The dump exclusion (only after 2 and 3)
- [ ] 4.1 Add `--exclude-table-data` for `userdata` and `userdata_history` to
      mjolnir's exclusions.
- [ ] 4.2 Confirm the dump keeps both tables' **schema** and none of their data,
      and that a restore yields a complete working database.
- [ ] 4.3 Teach `bin/_check_backup_sources.py` the new category — excluded, with
      the backup repo's own export as its source — as an **assertion**, without
      weakening its ability to report a genuinely sourceless exclusion.
- [ ] 4.4 Amend `openspec/specs/git-backup/spec.md`'s protected-table list
      (already begun by `backup-console`; keep the two consistent).

## 5. The sweep (last, and irreversible)
- [ ] 5.1 Add a retention sweep for `userdata_history` to hub, window 48h.
- [ ] 5.2 Make it refuse to delete a period not already represented in the
      committed archive — the sweep must not be able to outrun the archive.
- [ ] 5.3 Make it idempotent.
- [ ] 5.4 Decide and record the trigger point inside hub (tier 2).

## 6. The Sync page's two-tier timeline
- [ ] 6.1 **Keep** `historyDeltas`, `summarizeDelta` and `historyDoc`. This
      change retains them; an earlier design direction deleted them and was
      reversed.
- [ ] 6.2 Add an internal endpoint on `backup-console` listing commits touching
      one account's export, with each version's document and diff available on
      demand. Internal plane — `INTERNAL_TOKEN`, never through the gateway.
- [ ] 6.3 Render one chronological timeline with a **labelled horizon**, per-row
      fidelity marking, and the archived tier's caveats scoped to that tier.
- [ ] 6.4 Make the relationship between a recent entry and its archived
      counterpart discoverable, without rendering one change as two events.
- [ ] 6.5 Fetch documents and diffs **on demand** only — no full document in the
      initial payload.
- [ ] 6.6 Implement the four states independently: both tiers, archive
      unreachable (recent tier still fully rendered), nothing archived, no
      recent syncs.
- [ ] 6.7 Leave the rest of the page alone — uid picker, progress snapshot,
      per-card table and current-document viewer.

## 7. Verification
- [ ] 7.1 Walk `acceptance.md` top to bottom against the running stack.
- [ ] 7.2 Run the byte-for-byte device-contract comparisons (25–27) against the
      baseline captured in 1.3. These must be **diffed**, not eyeballed.
- [ ] 7.3 Confirm the diff touches no file under `mjolnir/sync/`,
      `mjolnir/patches/`, `mjolnir/base/`, and does not modify
      `docs/11-ota-contract.md`.
- [ ] 7.4 Verify commit ordering per criteria 19–20.
- [ ] 7.5 `bin/check-standards.sh` passes.
- [ ] 7.6 Add an ADR row to `docs/07-decisions.md`: the archive replaces
      append-only history as the record of account state, amending D-S5, and
      the two-tier console reversal is recorded with both halves of the
      operator's decision.
