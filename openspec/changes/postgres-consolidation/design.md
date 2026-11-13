## Context

The operator's governing requirement across this whole effort is failure
isolation between zones. Consolidating databases moves in the opposite
direction, so it needs an explicit justification rather than an assumption that
fewer containers is better.

## Decision — one cluster, five databases

A Postgres *cluster* is one running copy of the Postgres program. One cluster
can hold many *databases*, which cannot see each other: separate tables,
separate roles, separate dumps. Today the stack runs five copies of the program.
This change runs one copy holding five databases.

What is genuinely isolated, and what becomes shared:

```
 still isolated per database            now shared across the cluster
 ──────────────────────────────         ─────────────────────────────
 a bad migration in one service         the Postgres process crashing
 a runaway query (per-role limits)      a major-version upgrade
 corrupt or dropped table               disk exhaustion   ─┐
 separate pg_dump per service           host failure      ─┴─ already shared
 roles and permissions
```

The right-hand column is mostly pre-existing correlation: one VPS, one disk.
The failures that actually occur in practice — a migration that fails
mid-deploy, a query that will not terminate, a table dropped by accident — stay
confined to one database either way.

**The device path is unaffected by any of it.** `/ota/*`, `/blob/*` and
`/audio-manifest/*` are served by the gateway directly from the filesystem
(D55); no Postgres is in that path. The one zone that must never go down does
not depend on this decision at all.

What is gained: one container instead of five, one password, one health check,
one backup connection, one Adminer login over five databases — and the `shadow`
database that `zone-isolation` needs costs nothing instead of a sixth container.
The argument strengthened once the phonexa split raised the database count from
four to five.

## Decision — isolation is preserved by roles, not by processes

Each database gets its own role, its own password derived from the single
`POSTGRES_PASSWORD`, and a `CONNECTION LIMIT`. A service can reach only its own
database. This is what keeps D42's "no cross-service FKs" enforceable: the FK
cannot be written because the role cannot see the other schema, which is a
stronger guarantee than the convention it replaces.

## Decision — isolated development is unaffected

The operator's condition was that consolidation must not interfere with
developing or testing one service alone. It does not, because of the nested
`include:` dedup verified in `monorepo-merge`:

```
$ docker compose up stabbur        # from the root
postgres, stabbur-backend          # and nothing else
```

The shared cluster is a dependency like any other, pulled in by `depends_on`.
Running one service does not run the stack.

## Decision — migrate by dump and restore, never by moving data directories

Four of the five databases are already on 17, so copying `PGDATA` would appear
to work for them and fail only for smia. Mixed methods across one migration is
how a partial restore happens. One method: `pg_dump` out, `pg_restore` in,
verified row counts on both sides, old volumes retained until verification
passes.

## Risks

**The volume-identity hazard is at its sharpest here.** Verified on the
development host (2026-11-13), two generations of volumes coexist:
`mjolnir_postgres_data` and `tun_postgres_data`;
`stabbur_stabbur-pg-data` and `tun_stabbur-pg-data`;
`stabbur_stabbur-pg-data-17` beside `stabbur_stabbur-pg-data`;
`phonexa_postgres_data` and `phonexa_pgdata`. Dumping the wrong one produces a
plausible, complete, *stale* database with no error anywhere. The live volume
for each service must be read from the running container, not inferred from a
compose file or a volume name that looks right.

**smia is being backed up for the first time.** Its first dump will be large
(it holds the lookup cache and imported corpora) and the backup repository will
grow accordingly. If smia's data is considered rebuildable from `providers/` and
the import scripts, excluding the cache tables is the alternative — but that is
a decision to take knowingly, not by omission, which is how it stands today.

**Shared fate on cluster-level failure** is the accepted cost, named above.

**A single `POSTGRES_PASSWORD` derives five role passwords.** Rotating it
rotates all five together. For one operator that is simpler, not weaker, but it
is a change in blast radius and is recorded as such.

## Alternatives considered

- **Keep five clusters, standardise all to 17.** Legitimate and lower-risk in
  the short term: it migrates one database instead of five. Rejected because it
  keeps five of everything permanently, makes `shadow` a sixth container, and
  the one-time risk is paid once while the operational cost is paid forever.
- **One cluster, one database, separate schemas.** Rejected: it breaks the
  "separate `.sql` per service" requirement the operator stated explicitly.
