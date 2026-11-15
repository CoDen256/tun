## Context

`mjolnir`'s `userdata`/`userdata_history` pair came from D-S5: the device's
progress-sync shim writes through `mjolnir-sync`, `userdata` holds the current
document and `userdata_history` appends a full copy on every PATCH/POST/DELETE,
on the stated principle that *"last-write-wins storage is not a backup"*
(`05-sync.md`, migration `013_userdata.sql`).

That principle was right and the implementation was the cheapest thing that
satisfied it at the time. What made it expensive is a property of the document
rather than of the design: `userdata.doc` carries `totalCards`, one entry per
card with its full SRS state, so a document is ~424 KB and every sync appends
another ~424 KB. `backup/entrypoint.sh` then dumps the whole table and commits
it to a git repository daily.

Measured 2026-11-15 on the live `tun-backup` clone, by splitting `mjolnir.sql`
on its `COPY` blocks:

```
rows      bytes        table
  73   30,902,238      public.userdata_history
   3    1,272,224      public.userdata
 302       86,036      public.card_content
 302       36,377      public.card_slots
 535       26,617      public.occurrence_shipments
```

96% of the dump, for 73 rows. The backup service's existing comments already
show this ecosystem has twice reasoned its way to "this table is big and
regenerable, exclude its data" (smia's corpora, mjolnir's `job_logs`). This is
the same move, with one difference that matters: these rows are **not**
regenerable, so the exclusion is only safe if something else holds them.

## Goals / Non-Goals

**Goals:**
- Stop `mjolnir.sql` growing by ~424 KB per device sync, forever.
- Keep every past version of every account document recoverable, with no window
  where neither the table nor the archive holds it.
- Keep the Sync page's history view working for recent debugging.
- Touch nothing on the device plane.

**Non-Goals:**
- Changing the shape of the `userdata` document, or splitting `totalCards` out
  of it. The document is the device's, mirrored verbatim; reshaping it is a
  device-plane conversation this change refuses to open.
- Changing what `mjolnir-sync` writes, when, or in what transaction.
- Building a history browser over git. The console's history view stays
  database-backed and bounded; `git log` in `tun-backup` is the archive's
  interface and that is deliberate.
- Backing up `smia` (out of the set since 2026-11-14) or revisiting any other
  exclusion.

## Decisions

### The export is produced by the backup service, not by mjolnir

`backup/entrypoint.sh` already connects to the cluster as the `mjolnir` role
with the derived password (`"<POSTGRES_PASSWORD>_mjolnir"`), immediately before
it dumps that database. Reading `userdata` there costs one more query on a
connection it already makes.

The two alternatives were considered and rejected:

- **`mjolnir-sync` writes the file on every PATCH.** Freshest possible archive,
  and wrong: it puts a filesystem write inside the device-plane request path,
  gives the device-plane process a second storage responsibility, and makes a
  full disk a device-sync failure. The zone split (D158) exists to prevent
  exactly this kind of accretion.
- **`mjolnir-hub` exports on a schedule.** Keeps knowledge of the document
  shape in the service that owns it, but adds a second scheduler and a volume
  shared between hub and backup, for no benefit — the export is a `SELECT` and
  a serializer, not domain logic.

Consequence, stated plainly: the archive is as fresh as the backup schedule
(daily), not as fresh as the last sync. A document synced and then lost within
the same day is lost. That is already true of every other table in this backup
and is the accepted property of a daily backup, not a new regression.

### Serialization: sorted keys, two-space indent, trailing newline

This is the whole reason git works as the history store. A 424 KB document
serialized as one line is, to git, one changed line per commit — diffs are
useless and the packfile stores near-full copies. Pretty-printed and
key-sorted, a sync that moved four cards diffs to a few dozen lines, and git's
delta compression does the rest.

Sorted keys are also what makes "unchanged document → zero diff" true. Postgres
`jsonb` already normalizes key order on storage, but relying on that as an
invariant of the serializer is the kind of assumption that breaks quietly years
later; sorting explicitly costs nothing and removes the question.

`jq -S --indent 2` is the obvious implementation and `jq` is a one-line addition
to `backup/Dockerfile`. Any serializer with the same two properties is
acceptable; the builder decides.

### File layout: `userdata/<uid>.json`

A directory, one file per uid, named by the uid exactly as `userdata.device_id`
stores it. Uids are Firebase uids (D-S1) — the live one is
`q1Px3MgvOZVBdkpM9DKmFBnDnMi1` — and `mjolnir-sync` already validates the
column's contents against `^[A-Za-z0-9._:@-]{1,128}$` before any row is
written, so every value that can reach the table is a safe filename. The export
must nonetheless refuse a uid outside that set rather than write it: the
validation lives in a different process, and a backup that can be made to write
outside its directory by a database row is not acceptable even when no such row
can currently exist.

### Pruning a departed account

The existing script already prunes a `.sql` whose database left the set, with
the reasoning spelled out in its own comment: *"the file sits in the repo
forever, dated and plausible, reading as a current backup of a database nothing
dumps any more"*. A `userdata/<uid>.json` for a deleted account is the same
hazard, and gets the same treatment — removed and logged by uid, with the final
content still in git history.

### Retention: 30 days, swept by hub

The sweep is `DELETE FROM userdata_history WHERE at < now() - interval '30
days'`, run by `mjolnir-hub` — the service that owns the `mjolnir` schema and
already holds a `pg_advisory_lock` across its migration run (P58). Not by
`mjolnir-sync`, which never migrates and must not grow a second job; not by the
backup service, which must never mutate a source it is backing up.

Thirty days is chosen against what the history view is actually for — "what did
the last week of sessions do to this card" — not against a storage target. At
~424 KB a row and a handful of syncs a day it bounds the table to roughly tens
of megabytes, which is a live-database concern rather than a backup one now
that the dump excludes it.

**This amends D-S5.** The ADR row said append-only, never updated or removed,
and `013_userdata.sql`'s own comment repeats it. The principle it was defending
— that a single last-write-wins row is not a backup — is *preserved*, not
abandoned: the permanent archive simply moved to a store that is better at it.
The ADR row must be amended in place rather than quietly contradicted by code.

### Ordering: the archive must exist before the exclusion lands

Non-negotiable sequencing, because getting it backwards opens a window where
nothing holds the history:

1. Add the export, with `userdata_history` still in the dump. Verify a real run
   produces `userdata/<uid>.json` with the expected content.
2. Only then exclude `userdata_history`'s data from the dump.
3. Only then enable the retention sweep.

### The console's history panel must stop calling itself a backup

`renderDevicePage`'s history panel subtitle is *"Every write, append-only — a
last-write-wins row alone would not be a backup."* After retention that
sentence is false, and a UI that asserts a stale durability guarantee is the
exact failure-reports-success shape this codebase keeps rediscovering. It must
say what is true: a bounded recent window, with the permanent archive in the
backup repository.

### `bin/_check_backup_sources.py` must learn a third category

That check fails when an excluded table has no source, and its categories today
are "cache" and "rebuildable from a file tracked in this repository".
`userdata_history` is neither — its source is an export this same service
produces. The check gains that category, and must fail if the export is ever
removed while the exclusion remains. Working around the check instead of
teaching it would defeat the one mechanism that catches this class of mistake.

## Risks / Trade-offs

- **The archive is daily, the table was per-write.** Accepted above; it is the
  property of a daily backup, and the 30-day table covers the recent window
  where per-write granularity actually gets used.
- **Git repository growth is reduced, not eliminated.** A ~424 KB
  pretty-printed document whose card array genuinely changes every day still
  commits a real diff. Expected to be orders of magnitude smaller than 424 KB
  per sync of near-duplicate rows, but it is a reduction, not a fix, and the
  operator should see actual repo growth over a few weeks before assuming the
  problem is closed.
- **One-time: the existing 30.9 MB stays in git history.** Excluding the table
  stops the bleeding; it does not shrink the existing `tun-backup` repository.
  Rewriting that history is possible and is deliberately not part of this
  change — it is a destructive operation on the one copy of the backups, and
  48 MB is not hurting anything.
- **A restore from SQL alone yields no history.** By design, and worth stating
  in `DEPLOY.md`: restoring `mjolnir.sql` gives a current, working system with
  an empty `userdata_history`. Recovering history is a separate, manual act
  against the archived files.
- **`jq` on a 424 KB document, per account, per run.** Negligible at one
  account; still worth not doing inside a transaction or a retry loop.
