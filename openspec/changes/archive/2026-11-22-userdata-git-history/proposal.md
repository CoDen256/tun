## Why

The backup repository is being destroyed by one table.

Measured 2026-11-20 against the committed backup, not inferred:

| fact | value |
|---|---|
| `tun-backup/mjolnir.sql` | **44 MB** |
| of which the `userdata_history` COPY block | **42.4 MB across 82 rows** (~517 KB each) |
| every other dump in the ecosystem, combined | ~2 MB |
| the backup repo's `.git` | **106 MB across 88 commits** |

`userdata_history` appends a **complete copy of the account document** on every
PATCH, POST and DELETE (`hub/src/userdata.js`'s `writeHistory`). The device
PATCHes on every sync, so the table grows by roughly half a megabyte per sync,
and the whole table is then re-dumped and re-committed to git **every single
day**. Essentially the entire backup repository is redundant copies of one
account's progress.

The backlog item: *"the mjolnir syncing of devices is nice, but i think the
tun-backup gonna explode from the syncing of the deckstats. i think we have to
have one mutable userdata per user and use git to track changes instead of
saving the new userdata everytime."*

That is exactly right, and git is the correct tool: a mutable file plus a
version-control system is the thing an append-only table was badly
reimplementing.

## What Changes

- **The backup service exports one mutable `userdata/<uid>.json` per account**,
  pretty-printed with stable key order, so that git's own history becomes the
  version history and `git diff` shows what actually changed.
  - The exporter is the **backup service**, reading Postgres directly. It
    already connects with a derived password and already has `psql`. This keeps
    the write out of the device-plane path entirely — no change under
    `mjolnir/sync/`.
  - Serialization uses Postgres's own `jsonb_pretty`. Verified live: it emits
    keys in jsonb's stored order (by length, then bytewise) recursively and
    expands arrays one element per line — deterministic and stable, which is
    all git needs. Confirmed that `jq` is **not** in the backup image, so this
    adds no dependency to the one container holding the SSH deploy key.
  - Because `totalCards` expands one element per line, changing a single card's
    `Stage` changes a single line in the diff.
- **`userdata` and `userdata_history` data leave the `mjolnir` dump.** The
  export becomes the archive of record for account state.
- **`userdata_history` is kept, but swept to a short rolling window** (48 hours).
  This reverses the first direction taken in design: the operator was shown that
  the table feeds a working per-PATCH timeline, chose to drop it, then on seeing
  the daily-only replacement reversed that and kept a short tail. So the console
  keeps full fidelity for recent activity and git carries the long term.
- **The Sync page's history becomes two tiers in one timeline** with an explicit
  horizon: per-PATCH from Postgres for 48 hours, one entry per day from the
  export's git history before that. The two tiers read from different places and
  **degrade independently** — if the backup service is unreachable the recent
  tier still renders.
- **A restore path for account state, which must exist before the exclusion
  lands.** Once `userdata` data is out of the dump, restoring `mjolnir.sql`
  yields an empty table and the account's progress comes from the committed
  export. Getting this order wrong opens a window in which nothing holds the
  operator's learning progress.

## Capabilities

### New Capabilities
- `userdata-archive`: a mutable, human-readable, version-controlled archive of
  each account's synced document, with a verified restore path, replacing an
  append-only table as the record of how progress changed over time.

### Modified Capabilities
- `userdata-console`: the Sync page's history panel becomes two-tier with a
  stated horizon, and degrades per tier rather than per page.
- `git-backup`: the mjolnir dump's exclusions change, and the backup run gains
  an export step.

## Impact

- `backup/entrypoint.sh` — an export step before the commit, and two new
  `--exclude-table-data` flags for mjolnir.
- `mjolnir/hub/` — a retention sweep for `userdata_history`, and the Sync page's
  history panel. `historyDeltas`/`historyDoc` are **kept**, not deleted.
- `openspec/specs/git-backup/spec.md` — the protected-table list, already
  amended by `backup-console`.
- `bin/_check_backup_sources.py` — excluding `userdata` creates an excluded
  table whose source is not a file in this repository but the backup repo's own
  export. That category must be asserted, not left to be rediscovered.
- **Not touched**: `mjolnir/sync/`, `mjolnir/patches/`, the APK, or any
  device-facing byte. The device's PATCH behaviour is unchanged; what changes is
  how long the resulting rows are kept and where the long-term copy lives.

## Dependency

**`backup-console` ships first.** This change's archived tier reads that
service's git-log endpoint, and its export is surfaced on that service's page.
