# Acceptance criteria — userdata-history-offload

The review contract for the build phase. Every criterion is a falsifiable,
observable end state, verifiable in the local dev compose stack by an agent
that did not write the code. Nothing here may be verified by reading code or
trusting a log line that says a thing succeeded.

Baseline, measured 2026-11-15 on the live `tun-backup` clone — a criterion that
compares against "before" compares against these numbers:

```
mjolnir.sql                     32,380,129 bytes
  public.userdata_history   73 rows   30,902,238 bytes
  public.userdata            3 rows    1,272,224 bytes
```

---

## Item: "tun-backup gonna explode from the syncing of the deckstats"

### A1 — The archive file exists and matches the database
**WHEN** the backup service is run once against the dev stack
(`docker compose run --rm -e RUN_ONCE=1 backup`)
**THEN** `tun-backup/userdata/<uid>.json` exists for every uid returned by
`SELECT device_id FROM userdata`, and for each one, parsing that file and
comparing it to that row's `doc` yields no difference.

### A2 — The file is pretty-printed and key-sorted
**WHEN** `tun-backup/userdata/<uid>.json` is opened
**THEN** it spans more than 1,000 lines (not one long line), every object's
keys are in sorted order, and the file ends with a newline.

### A3 — An unchanged document stages nothing
**WHEN** the backup is run twice with no device sync in between
**THEN** `git status --porcelain` in `tun-backup` reports no change to any
`userdata/*.json` file after the second run, and the run logs "no changes".

### A4 — A one-card change produces a small diff, not a rewritten file
**WHEN** a single card's SRS state is altered in `userdata.doc` (via a PATCH to
`/mjolnir/userdata/<uid>` through the dev stack) and the backup is run
**THEN** `git diff --stat` for that file in `tun-backup` shows fewer than 100
changed lines — demonstrably not the whole file.

### A5 — `mjolnir.sql` no longer carries the history table
**WHEN** the backup has run after the exclusion lands
**THEN** `grep -c 'COPY public.userdata_history' mjolnir.sql` finds the table's
schema but its `COPY` block contains zero data rows, `COPY public.userdata`
still contains every account row, and `mjolnir.sql` is under 2,000,000 bytes
(down from 32,380,129).

### A6 — A failed export commits nothing
**WHEN** the backup service is run with the export step forced to fail (e.g.
the `userdata` query pointed at a nonexistent relation) after at least one
successful previous run
**THEN** `git log -1` in `tun-backup` still shows the previous run's commit, no
`userdata/*.json` file differs from that commit, no `.tmp` file is left behind,
the container logs a FATAL line, and the health check reports unhealthy.

### A7 — An empty export is treated as a failure, not a success
**WHEN** the export produces an empty or non-JSON file for an account
**THEN** the run aborts before any rename, the previously archived file for
that account is byte-identical to what it was, and no commit is made.

### A8 — A departed account is pruned and logged
**WHEN** a uid present in a previous run's archive is deleted from `userdata`
and the backup is run
**THEN** that uid's `userdata/<uid>.json` is gone from the working tree, the
run logs a line naming that uid as pruned, the change is committed, and
`git show HEAD~1:userdata/<uid>.json` still returns the final content.

### A9 — A malformed uid aborts rather than writing
**WHEN** a row is inserted directly into `userdata` whose `device_id` contains
a character outside `[A-Za-z0-9._:@-]` (e.g. `../escape`) and the backup is run
**THEN** the run fails with a FATAL log naming the uid, no file is written
anywhere, and no commit is made.

### A10 — The standards check covers the new exclusion
**WHEN** `bin/check-standards.sh` is run
**THEN** it exits 0. **AND WHEN** the `userdata/` export step is removed from
`backup/entrypoint.sh` while `--exclude-table-data=userdata_history` remains,
**THEN** `bin/check-standards.sh` exits non-zero naming `userdata_history`.

### A11 — The dump still restores cleanly
**WHEN** the new `mjolnir.sql` is loaded into a scratch database that has had
hub's migrations run against it
**THEN** the load reports no foreign-key error, `SELECT count(*) FROM userdata`
matches the source, and `SELECT count(*) FROM userdata_history` returns 0.

### A12 — Retention deletes only aged rows
**WHEN** `userdata_history` is seeded with rows at 10, 29, 31 and 90 days old
and the retention sweep runs
**THEN** exactly the 31- and 90-day rows are gone, the 10- and 29-day rows
remain, and the sweep logs the deleted count and the oldest remaining
timestamp.

### A13 — A sweep with nothing to do succeeds
**WHEN** the sweep runs again immediately
**THEN** it deletes nothing, logs that it deleted nothing, and exits
successfully — it does not error and does not report a deletion.

### A14 — The Sync page no longer calls its history a backup
**WHEN** `/mjolnir/device` is opened in a browser (claude-in-chrome) and the
"Sync history" panel is read
**THEN** the panel's subtitle does **not** contain the words "would not be a
backup", it states the retention window in days, and it names the backup
repository as where older versions live.

### A15 — Truncation is visible, not silent
**WHEN** the Sync page is opened for an account whose history has had rows aged
out by retention
**THEN** the history panel visibly states that older entries are outside the
retention window — the list does not simply end without explanation.

### A16 — The device plane is untouched
**WHEN** the full diff of this change is reviewed
**THEN** no file under `mjolnir/sync/`, `grind/caddy/`, `mjolnir/patches/` or
`docs/11-ota-contract.md` is modified. **AND WHEN** a `GET`, `PATCH` and
`DELETE` are issued against `/mjolnir/userdata/<uid>` on the dev stack before
and after the change, **THEN** the status code, headers and body bytes are
identical in all three cases.
