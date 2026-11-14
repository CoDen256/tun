## Why

The ecosystem runs **five** Postgres containers — one per service — on one
VPS, at two different major versions (smia on 16, everything else on 17), with
four different password conventions (two hardcoded in compose, two from env),
four volumes, four health checks and four backup connections. The operator
asked for the versions to be standardised; standardising them requires a
dump/restore for smia regardless, because Postgres has no in-place major
upgrade.

Given that surgery is already required, this change consolidates to **one
Postgres 17 cluster holding one database per service**, which also makes the
`shadow` database that `zone-isolation` needs free rather than a sixth
container.

Logical separation is unchanged and D42's rule still holds: separate databases
per service, no cross-service foreign keys. What changes is the number of
running copies of the Postgres program, not the number of databases.

The operator's condition — *"as long as I get my mjolnir.sql phonexa.sql from
separate databases it's fine"* — is met: `pg_dump -d <name>` still produces one
file per service.

## What Changes

**One cluster, five databases.**

```
before                              after
──────                              ─────
mjolnir-postgres   17   mjolnir     postgres 17
stabbur-postgres   17   stabbur       ├── mjolnir
smia-postgres      16   smia          ├── stabbur
phonexa-postgres   17   phonexa       ├── smia
(none)                                ├── phonexa
                                      └── shadow
```

- One `postgres/` project, included by every project that needs a database
  (the shared-fragment dedup verified in `monorepo-merge`).
- One role per database with its own password derived from `POSTGRES_PASSWORD`,
  and a per-role connection limit so one service cannot starve another.
- Databases created idempotently on first boot; each service still runs its own
  migrations against its own database.
- smia goes 16 → 17 by dump/restore, as do the other three by moving cluster.
- `shadow` is created empty here, ready for `zone-isolation` to populate.

**Backup covers five databases, not three.** smia is added — today it is the
one service whose data is not backed up at all. `shadow` is added. Each is a
separate `pg_dump` producing a separate `.sql` file, with the existing
all-or-nothing commit discipline and atomic `.tmp`-then-rename convention
unchanged.

**Adminer** reaches all five databases from one login instead of needing a
server picker across four hosts.

## Capabilities

### New Capabilities
- `shared-database`: one cluster, one database per service, isolation
  guarantees, and what is and is not shared.

### Modified Capabilities
- `git-backup`: five databases including smia and shadow.
- `unified-deployment`: one database service rather than one per project.
- `auto-migration`: migrations run per-database against a shared cluster.

## Impact

- `postgres/` (new), every project's compose file, `backup/entrypoint.sh`,
  `.env.example`, `DEPLOY.md`.
- **A data migration.** This is the only change in the stack that moves
  operator data. It runs on its own, with a verified backup immediately before
  and a verified restore path.
- `docs/07-decisions.md`: a new ADR; D42's "separate logical databases per
  service" is reaffirmed, not superseded — only the number of clusters changes.

**Non-goals:**
- No schema changes. No table moves. (`shadow`'s table move is
  `zone-isolation`'s, deliberately kept out of the cluster migration.)
- No change to any service's connection code beyond its `DATABASE_URL`.
- No change to the device-facing contract. OTA does not use Postgres at all and
  is unaffected by every part of this change.
