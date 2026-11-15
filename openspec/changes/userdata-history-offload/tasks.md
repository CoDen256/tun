## 1. The per-account archive export (must land and be verified BEFORE any exclusion)

- [ ] 1.1 Add `jq` to `backup/Dockerfile`.
- [ ] 1.2 In `backup/entrypoint.sh`, add an export step that runs on the same
      `mjolnir` connection the dump already uses: for every row in `userdata`,
      write `$BACKUP_REPO/userdata/<uid>.json` containing `doc` serialized
      key-sorted, two-space indented, with a trailing newline.
- [ ] 1.3 Reject any uid not matching `^[A-Za-z0-9._:@-]{1,128}$` — abort the
      run with a FATAL log naming the uid, never write the file. (The
      validation that makes such a row impossible lives in a different
      process; a backup that a database row can redirect is not acceptable
      even when no such row can exist today.)
- [ ] 1.4 Use the file's `.tmp`-then-rename convention, and make a failure in
      the export abort the whole run exactly like a failed dump: `clean_tmp`
      the partial files, `return 1`, commit nothing, leave every previously
      committed file untouched. Check every command explicitly — `run_backup`
      is called as `run_backup || log ...`, which disables `errexit` for the
      entire function body.
- [ ] 1.5 Treat an empty or unparseable export as a failure, the same way an
      empty `pg_dump` is already treated: verify each written file is non-empty
      and parses as JSON before the rename.
- [ ] 1.6 Prune `userdata/<uid>.json` for any uid no longer present in
      `userdata`, logging the removal by uid — the same reasoning and the same
      shape as the existing `*.sql` prune for a database that left the set.
- [ ] 1.7 Log a per-run summary line in the style of the existing blob/audio
      steps: how many accounts were exported, how many files changed, how many
      were pruned.
- [ ] 1.8 **Verify against the real local stack before proceeding**: run the
      backup once (`RUN_ONCE=1`), confirm `userdata/<uid>.json` exists for the
      live uid, that its content matches `SELECT doc FROM userdata` for that
      uid, and that a second run with no sync in between stages nothing for
      that file. Do not start section 2 until this is observed.

## 2. Remove userdata_history from the dump

- [ ] 2.1 Add `--exclude-table-data=userdata_history` to `exclusions_for()`'s
      `mjolnir` case in `backup/entrypoint.sh`.
- [ ] 2.2 Rewrite that function's surrounding comment block so it states, in
      place, why this table is excluded and where its data now lives — the
      comment currently reasons only about regenerable machine output, and
      this exclusion is a different argument.
- [ ] 2.3 Teach `bin/_check_backup_sources.py` the third category: an excluded
      table whose recovery source is an export this backup service itself
      produces. It must still fail for an excluded table with no source, and
      must fail if the `userdata/` export is removed while the exclusion
      remains.
- [ ] 2.4 Run `bin/check-standards.sh` and confirm it passes.
- [ ] 2.5 Verify the size claim end to end: run the backup and confirm the new
      `mjolnir.sql` is on the order of 1 MB rather than 32 MB, and that it
      still contains every `userdata` row.
- [ ] 2.6 Verify the restore path: load the new `mjolnir.sql` into a scratch
      database after migrations and confirm every foreign key is satisfied and
      `userdata_history` exists and is empty.

## 3. Retention in mjolnir

- [ ] 3.1 Add a retention sweep to `mjolnir-hub` deleting `userdata_history`
      rows older than 30 days. Hub only — `mjolnir-sync` never migrates and
      must not grow a second job, and the backup service must never mutate a
      source it backs up.
- [ ] 3.2 Make the window a single named constant, not a literal repeated at
      the call site and in the UI copy.
- [ ] 3.3 Log what the sweep deleted (row count, oldest remaining timestamp),
      and make a sweep that deletes nothing succeed quietly.
- [ ] 3.4 Confirm the sweep cannot run before the archive export has ever
      succeeded — the ordering in `design.md` is the whole safety argument.

## 4. Stop the console claiming to be a backup

- [ ] 4.1 Replace the Sync page's history panel subtitle in
      `mjolnir/hub/src/server.js` (`renderDevicePage`) — today it reads "Every
      write, append-only — a last-write-wins row alone would not be a backup."
      It must state the bounded window and name where the permanent archive
      lives.
- [ ] 4.2 Where the panel shows fewer entries than exist because rows aged
      out, say so in the panel rather than rendering a silently truncated list.

## 5. Record the decisions

- [ ] 5.1 Amend D-S5 in `mjolnir`'s decision log in place: append-only within a
      retention window, permanent archive in the backup repository. Mark, do
      not delete, the superseded half.
- [ ] 5.2 Add the ADR row to `docs/07-decisions.md` for the archive's location
      and owner.
- [ ] 5.3 Update `013_userdata.sql`'s comment where it asserts rows are "never
      updated or removed afterward" — a migration comment that contradicts
      live behaviour is how this ecosystem grows stale claims.
- [ ] 5.4 Note in `DEPLOY.md` that restoring `mjolnir.sql` alone yields a
      working system with empty history, and that recovering a past document is
      a separate manual act against `tun-backup/userdata/<uid>.json`'s git
      history.
