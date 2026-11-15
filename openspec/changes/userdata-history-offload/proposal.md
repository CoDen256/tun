## Why

The daily git backup is being crushed by one table. Measured 2026-11-15 against
the live `tun-backup` clone:

| table in `mjolnir.sql` | rows | bytes |
|---|---|---|
| `userdata_history` | 73 | **30,902,238** |
| `userdata` | 3 | 1,272,224 |
| every other table combined | ~1,540 | ~206,000 |

`mjolnir.sql` is 32 MB and **96% of it is `userdata_history`**. One `userdata`
document is ~424 KB (it is `totalCards`, one entry per card with SRS state),
and `userdata_history` appends a **full copy of the document on every single
PATCH** — append-only, never pruned (D-S5). Every sync therefore adds ~424 KB
that the backup service re-dumps and re-commits to git forever. At a handful of
syncs a day this is on the order of a gigabyte a year of near-duplicate JSON,
for a single-user system with exactly one handset in the field.

The operator's own framing: *"the tun-backup gonna explode from the syncing of
the deckstats — we have to have one mutable userdata per user and use git to
track changes instead of saving the new userdata every time."*

## What Changes

- **`userdata_history` data leaves the backup dump.** `--exclude-table-data`
  (not `--exclude-table`) so a restore still yields a complete, working schema
  that simply starts empty — the same convention the smia exclusions already
  use. **BREAKING** for the current `git-backup` spec, which explicitly names
  `userdata_history` as a table that SHALL NOT be excluded.
- **The backup service exports one mutable file per account**:
  `userdata/<uid>.json`, pretty-printed with **sorted keys**, overwritten in
  place every run. Git's own history becomes the version history — which is
  what the operator asked for, and is strictly better than the table for this
  purpose because git stores deltas rather than 73 independent copies.
  Key-sorted pretty-printing is load-bearing, not cosmetic: a 424 KB
  single-line JSON blob is one changed line to git, while a pretty-printed one
  diffs to the handful of cards that actually moved.
- **The backup service produces the export itself**, by querying Postgres as
  the `mjolnir` role it already connects as. Nothing in `mjolnir` changes to
  make this happen, and **the device plane is not touched at all** — no write
  is added to `mjolnir-sync`'s request path.
- **The export joins the existing all-or-nothing transaction.** A failed export
  aborts the run exactly like a failed dump: `.tmp` + rename, every previously
  committed file left untouched, no commit.
- **`userdata_history` gains a 30-day retention sweep** in `mjolnir`, pruned by
  the service that owns the schema (hub, the only migrator). The Sync page's
  History panel keeps working for recent debugging; anything older is one
  `git log` away in `tun-backup`. **Amends D-S5** from "append-only, never
  removed" to "append-only within a retention window, with the permanent
  archive in git".
- **The Sync page's History panel stops claiming to be the archive.** Its
  subtitle today reads *"Every write, append-only — a last-write-wins row alone
  would not be a backup."* That sentence becomes false the moment retention
  lands, and a stale claim that a view is a backup is exactly the
  failure-reports-success shape this ecosystem keeps producing.

## Capabilities

### New Capabilities
- `userdata-archive`: how the authoritative version history of each account's
  synced document is stored, exported and recovered — one mutable file per
  account under git, rather than an unbounded table inside a SQL dump.

### Modified Capabilities
- `git-backup`: the "Disposable run-history tables are excluded from the
  mjolnir dump" requirement currently names `userdata_history` as a permanent
  ledger table that SHALL NOT be excluded. That reverses, and the backup
  service gains a new export artifact alongside the dumps and blob mirrors.

## Impact

- `backup/entrypoint.sh` — a new export step, a new exclusion, a new
  prune-on-leaving-the-set case for `userdata/` files.
- `mjolnir/hub/` — a retention sweep and one corrected sentence of UI copy.
- `bin/check-standards.sh` — `bin/_check_backup_sources.py` fails when an
  excluded table has no source; `userdata_history`'s source is now the git
  export, which that check must learn about rather than be worked around.
- `tun-backup` (the backup DATA repo) — gains a `userdata/` directory.
- **Not touched**: `mjolnir-sync`, the gateway, `docs/11-ota-contract.md`, and
  every byte of the device-facing contract.
