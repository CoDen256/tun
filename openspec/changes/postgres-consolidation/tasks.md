## STANDING RULES — read before touching anything

These are not tasks. They apply to every command in this change, and each one
exists because this repository has already been damaged by its absence.

- **NEVER pass `-v` to a `docker compose down` that resolves the root compose
  file.** `down -v` removes every volume the PROJECT DECLARES, not the ones its
  containers mount, and the root `compose.yaml` declares all of them no matter
  which services are running. This destroyed `mjolnir_postgres_data` and
  `smia_smia-pg-data` during the previous change (**P41**). Stop containers and
  remove throwaway volumes **by name**.
- **A verification harness must redirect EVERY volume in the RENDERED config**,
  enumerated with `docker compose config --format json`, and must assert that
  no name lacks the throwaway prefix *before* starting anything. Redirecting
  the ones you remembered is what caused P41.
- **Never point a bootstrap or test run at a database holding real data.**
  smia's `scripts/bootstrap.py` imports whenever a provider table looks empty,
  and `scripts/import_kaikki.py` begins with `TRUNCATE kaikki_entry`. A
  mis-detected database is silently truncated and reimported.
- **The backup service stays STOPPED from task 1.1 until task 6.6 passes.** It
  is the one process that can destroy a good backup by *succeeding*: if it runs
  while a database is half-migrated it dumps the new, empty-or-partial state,
  renames over the committed `.sql`, and pushes. The all-or-nothing rule does
  not help, because that run did not fail.
- Every dump is **verified restorable** before it is relied on. A file of the
  right size is not a backup.

## 0. Pre-flight — nothing is created or repointed yet

- [ ] 0.1 Identify the **live** volume behind every database from the RUNNING
      containers, never from a compose file or a plausible-looking name:
      `docker ps -q | xargs -n1 docker inspect --format '{{.Name}} {{range .Mounts}}{{.Name}} {{end}}'`
      Two generations coexist on at least one host (`mjolnir_postgres_data` vs
      `tun_postgres_data`, `stabbur_stabbur-pg-data` vs `-pg-data-17` vs
      `tun_stabbur-pg-data`, `phonexa_postgres_data` vs `phonexa_pgdata`).
      Dumping the wrong one yields a complete, plausible, STALE database with
      no error anywhere. Write the mapping into `DEPLOY.md`.
- [ ] 0.2 Find every container attached to those volumes **that this project
      does not own**. Verified live on the development host: `phonexa-postgres`
      and `phonexa-backend` run under Compose project `phonexa` from the
      pre-merge sibling checkout and hold `phonexa_postgres_data` and
      `phonexa_audio_data`. Two Postgres processes on one data directory
      corrupts it. Stand the old stacks down explicitly (`docker compose -p
      phonexa down` **without** `-v`, and the same for any other) and confirm
      with `docker ps` that nothing outside this project holds a target volume.
- [ ] 0.3 **Dump ALL FIVE databases now, while every source is still intact and
      reachable.** This is the ordering fix: the previous version of this file
      dumped one service at a time *after* section 1 had already repointed the
      projects at the new cluster, which orphans the source containers — and an
      operator reaching for `--remove-orphans` after Compose warns would delete
      them outright.
- [ ] 0.4 **smia must be dumped by hand, and this is blocking.** It is
      simultaneously the riskiest leg (the only 16 → 17 restore, task 3.4) and
      the only database the backup service has never covered — and its volume
      has already been destroyed once in this effort (P41). There is no
      `smia.sql` to fall back on.
      `pg_dump -h 127.0.0.1 -p 5433 -U smia smia > smia.sql`
- [ ] 0.5 Verify each of the five dumps **restores** into a scratch cluster
      (its own project name, its own throwaway volume) and that row counts
      there match the source. A dump that has never been restored is a guess.
- [ ] 0.6 Copy all five dumps **off this host**. The whole point of the change
      is that one cluster will hold everything; the backups must not.
- [ ] 0.7 Record row counts per table per database — these are the acceptance
      criteria for every later comparison. (Development-host baseline already
      captured: mjolnir 13 tables/1,630 rows, stabbur 7/16,593,
      smia 14/2,703,146, phonexa 11/3,610.)
- [ ] 0.8 Decide explicitly whether smia's lookup cache and imported corpora
      are dumped in full or excluded as rebuildable from `providers/`. State
      the decision; do not leave it to omission as it is today.

## 1. Build the new cluster ALONGSIDE the old ones

Nothing is repointed in this section. Every service keeps using its own
database until section 4, so a failure here costs nothing but a volume.

- [ ] 1.1 Stop the backup service and keep it stopped (standing rules).
- [ ] 1.2 `postgres/compose.yaml`: one `postgres:17-alpine`, one volume with an
      **explicit `name:`**, one health check, loopback-only ports in its own
      `compose.override.yaml`. The explicit name is not optional: without it
      the volume is `tun_<key>` through the root include and `postgres_<key>`
      from `cd postgres && docker compose up`, which is exactly how this host
      acquired a parallel `tun_*` generation. The cluster that will hold all
      five databases is the worst possible place to repeat that.
- [ ] 1.3 Create databases `mjolnir`, `stabbur`, `smia`, `phonexa`, `shadow`;
      one role each with a `CONNECTION LIMIT`; each role granted only its own
      database.
      **Idempotency cannot come from `/docker-entrypoint-initdb.d`** — Postgres
      runs that directory only when it initialises a fresh data directory, the
      same mechanism `monorepo-merge`'s design records under "one Postgres
      password cannot be shared yet". If a first attempt half-fails and the
      volume survives, a re-run creates no databases, no roles, applies no
      passwords and never creates `shadow` — which `zone-isolation` then
      assumes exists — and the only symptom is per-service authentication
      failures. Use a bootstrap step that runs on EVERY start and is idempotent
      by construction (`CREATE DATABASE` guarded by a catalog check, `CREATE
      ROLE … ` likewise), and verify it by running it twice.
- [ ] 1.4 Derive each role password and each `DATABASE_URL` in compose from one
      `POSTGRES_PASSWORD`. This is the point at which the four per-database keys
      D151 kept can finally collapse into one, because a fresh cluster is the
      only place a new password takes effect.
- [ ] 1.5 Verify the five databases, five roles and the connection limits exist,
      by querying the new cluster — not by reading the init script.

## 2. Restore into the new cluster

- [ ] 2.1 Restore each of the five dumps from task 0.3/0.4 into the database of
      the same name. Restore from the DUMPS, not from a live source: the dumps
      are the verified artefact (0.5) and the sources stay untouched.
- [ ] 2.2 `shadow` stays empty. `zone-isolation` populates it; nothing here
      writes to it.
- [ ] 2.3 Compare row counts against 0.7, per table, for all five. A single
      mismatch stops the change here. It does not get investigated later.
- [ ] 2.4 Confirm no service is using the new cluster yet.

## 3. The smia 16 → 17 leg, specifically

- [ ] 3.1 Confirm the restore landed in 17 (`SELECT version()`).
- [ ] 3.2 Check extensions, collations and any version-sensitive types survived.
      A collation change can reorder indexes silently.
- [ ] 3.3 Compare a handful of real lookups against the old instance's answers
      before it is retired — smia holds 2.7M rows of imported corpora and a
      wrong collation shows up as subtly wrong results, not as an error.
- [ ] 3.4 Keep the old `postgres:16` volume until task 6 passes in full.

## 4. Cut over, one service at a time

- [ ] 4.1 For each of mjolnir, stabbur, smia, phonexa: stop the service, repoint
      its `DATABASE_URL`, start it, exercise its UI and one write path.
- [ ] 4.2 Each project `include:`s `../postgres/compose.yaml` and declares
      `depends_on: postgres: service_healthy`. Remove its own postgres service
      **only after** that project's cut-over is verified.
- [ ] 4.3 Verify `docker compose up stabbur-backend` starts the shared cluster
      and stabbur and nothing else — isolated development must survive this
      change (it is the operator's stated condition for accepting it).
- [ ] 4.4 **Do not delete any old volume.** They are the only rollback that does
      not involve the dumps.

## 5. Backup service

- [ ] 5.1 Rewrite `backup/entrypoint.sh` for one cluster: five `pg_dump`s →
      `mjolnir.sql`, `stabbur.sql`, `smia.sql`, `phonexa.sql`, `shadow.sql`.
      **smia joins the backup set here** — it has never been in it.
- [ ] 5.2 Keep the all-or-nothing discipline and the atomic `.tmp`-then-rename
      convention, and keep every failure check added after the previous change
      (clone, add, commit, push, the renames, both copy loops, and the
      unpushed-commit retry).
- [ ] 5.3 Keep the blob and audio mirrors unchanged — but note the mirrors now
      fail the run when a source is empty while the mirror is not, which is the
      signal that a volume name drifted.
- [ ] 5.4 Update `depends_on` and the connection parameters for one host.
- [ ] 5.5 Start the backup service again and run ONE cycle with `RUN_ONCE=1`.
      Verify five `.sql` files are committed, and that each **restores** into a
      scratch cluster.

## 6. Verification — none of this is optional

- [ ] 6.1 Row counts match 0.7 for every table in every database.
- [ ] 6.2 Every service starts against **a scratch cluster** — its own project
      name, its own throwaway volumes, never the production one — with
      migrations applied and no manual step. Assert the rendered volume list is
      fully redirected before starting (standing rules).
- [ ] 6.3 A service's role cannot connect to another service's database.
- [ ] 6.4 `/ota/*` is served correctly throughout, **including with the whole
      cluster stopped** — the device path must not acquire a database
      dependency. This is the one property that must hold at every single step.
- [ ] 6.5 `bin/ota-verify.sh` passes everything it can prove, with no SKIPs
      hiding an inverted assertion (see `monorepo-merge` task 6.1 — a run that
      reports skips is not a proof).
- [ ] 6.6 One full backup cycle completes against the new cluster, is verified
      restorable, and is copied off-host — **before** any old volume is
      removed.
- [ ] 6.7 Only now: retire the old volumes, one at a time, recording each name
      as it goes.
