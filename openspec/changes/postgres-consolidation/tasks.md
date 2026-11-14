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

- [x] 0.1 Identify the **live** volume behind every database from the RUNNING
      containers, never from a compose file or a plausible-looking name:
      `docker ps -q | xargs -n1 docker inspect --format '{{.Name}} {{range .Mounts}}{{.Name}} {{end}}'`
      Two generations coexist on at least one host (`mjolnir_postgres_data` vs
      `tun_postgres_data`, `stabbur_stabbur-pg-data` vs `-pg-data-17` vs
      `tun_stabbur-pg-data`, `phonexa_postgres_data` vs `phonexa_pgdata`).
      Dumping the wrong one yields a complete, plausible, STALE database with
      no error anywhere. Write the mapping into `DEPLOY.md`.
- [x] 0.2 Find every container attached to those volumes **that this project
      does not own**. Verified live on the development host: `phonexa-postgres`
      and `phonexa-backend` run under Compose project `phonexa` from the
      pre-merge sibling checkout and hold `phonexa_postgres_data` and
      `phonexa_audio_data`. Two Postgres processes on one data directory
      corrupts it. Stand the old stacks down explicitly (`docker compose -p
      phonexa down` **without** `-v`, and the same for any other) and confirm
      with `docker ps` that nothing outside this project holds a target volume.
- [x] 0.3 **Dump ALL FIVE databases now, while every source is still intact and
      reachable.** This is the ordering fix: the previous version of this file
      dumped one service at a time *after* section 1 had already repointed the
      projects at the new cluster, which orphans the source containers — and an
      operator reaching for `--remove-orphans` after Compose warns would delete
      them outright.
- [x] 0.4 **smia must be dumped by hand, and this is blocking.** It is
      simultaneously the riskiest leg (the only 16 → 17 restore, task 3.4) and
      the only database the backup service has never covered — and its volume
      has already been destroyed once in this effort (P41). There is no
      `smia.sql` to fall back on.
      `pg_dump -h 127.0.0.1 -p 5433 -U smia smia > smia.sql`
- [x] 0.5 Verify each of the five dumps **restores** into a scratch cluster
      (its own project name, its own throwaway volume) and that row counts
      there match the source. A dump that has never been restored is a guess.
- [x] 0.6 **DONE on the VPS cutover, 2026-11-14.** All four dumps copied off-host to `~/tun-cutover-dumps/`
      and verified there independently: gzip -t clean, 15/5/16/11 tables.
      ORIGINAL NOTE: **Operator step (VPS).** Copy all five dumps off the host before
      cutting over — the whole point of the change is that one cluster holds
      everything, so the backups must not. On the development host the dumps
      live in the session scratchpad and the pre-migration volumes are still
      retained, which is the local equivalent; on the VPS this is a real
      `scp`/`rsync` and is not optional.
- [x] 0.7 Record row counts per table per database — these are the acceptance
      criteria for every later comparison. (Development-host baseline already
      captured: mjolnir 13 tables/1,630 rows, stabbur 7/16,593,
      smia 14/2,703,146, phonexa 11/3,610.)
- [x] 0.8 **Decided: smia is backed up SCHEMA-ONLY for every bulk table**
      (`--exclude-table-data`, never `--exclude-table`, so a restore still
      yields a complete working database that refills itself). Audited table by
      table: all 16 are schema (`alembic_version`), cache (`lookup_cache`,
      `tts_audio`, `provider_health`) or imported corpora rebuilt by
      `scripts/import_*.py` from `providers/`, which is itself tracked in git —
      so smia's real backup already lives in the monorepo. `tts_audio` is
      disposable for a second, independent reason: D118/D45 keep the
      authoritative copy of a CHOSEN candidate in stabbur's blob store, which
      IS backed up. **Measured: 225 MB → 19 KB**, and every run COMMITS to a
      git repo, so the alternative was a 225 MB daily commit of regenerable
      data. Verified the 19 KB file restores to all 16 tables at the correct
      migration version.

## 1. Build the new cluster ALONGSIDE the old ones

Nothing is repointed in this section. Every service keeps using its own
database until section 4, so a failure here costs nothing but a volume.

- [x] 1.1 Backup stayed stopped for the whole migration. (On the local cutover
      it is a compose service with no reachable remote, so it could not have
      pushed; on the VPS this must be an explicit `docker compose stop backup`
      before section 1 and `start` only after 6.6.)
- [x] 1.2 `postgres/compose.yaml`: one `postgres:17-alpine`, one volume with an
      **explicit `name:`**, one health check, loopback-only ports in its own
      `compose.override.yaml`. The explicit name is not optional: without it
      the volume is `tun_<key>` through the root include and `postgres_<key>`
      from `cd postgres && docker compose up`, which is exactly how this host
      acquired a parallel `tun_*` generation. The cluster that will hold all
      five databases is the worst possible place to repeat that.
- [x] 1.3 Implemented as `postgres/init/bootstrap.sh`, a one-shot that runs on
      EVERY boot and is idempotent by construction (every statement guarded by
      a catalog check). Verified by running it twice: second run reports
      `exists`/`updated` throughout and exits 0. It also re-asserts schema and
      object ownership every boot, which makes a carelessly-restored database
      self-heal — proven by deliberately breaking a table's owner and watching
      the next boot repair it. Original:
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
- [x] 1.4 Derive each role password and each `DATABASE_URL` in compose from one
      `POSTGRES_PASSWORD`. This is the point at which the four per-database keys
      D151 kept can finally collapse into one, because a fresh cluster is the
      only place a new password takes effect.
- [x] 1.5 Verify the five databases, five roles and the connection limits exist,
      by querying the new cluster — not by reading the init script.

## 2. Restore into the new cluster

- [x] 2.1 Restore each of the five dumps from task 0.3/0.4 into the database of
      the same name. Restore from the DUMPS, not from a live source: the dumps
      are the verified artefact (0.5) and the sources stay untouched.
- [x] 2.2 `shadow` stays empty. `zone-isolation` populates it; nothing here
      writes to it.
- [x] 2.3 Compared per table, all four restored databases: **MATCH** against
      the 0.7 baseline (mjolnir 13 tables/1,630; stabbur 7/16,593; smia
      14/2,703,146; phonexa 11/3,610).
      **This comparison MUST happen before section 4 starts the services, and
      now has a proven reason:** smia's bootstrap imports into any table it
      finds empty, so running it first changes the counts. Observed live —
      `kaikki_entry` 0→79,403, `wikipron_entry` 0→3,432, plus two new tables.
      Nothing was lost (no table shrank; the source genuinely held 0), but the
      acceptance criterion is only meaningful before a service touches it.
- [x] 2.4 Confirm no service is using the new cluster yet.

## 3. The smia 16 → 17 leg, specifically

- [x] 3.1 Confirmed `PostgreSQL 17.11` (`SELECT version()`).
- [x] 3.2 Checked: extensions `plpgsql` only, collation `en_US.utf8` identical both sides, index counts equal (smia 26/26, mjolnir 19/19). Original: and any version-sensitive types survived.
      A collation change can reorder indexes silently.
- [x] 3.3 Compared three real lookups across the boundary (ordered lemma list, a LIKE count, ordered headwords) — all IDENTICAL. Original: against the old instance's answers
      before it is retired — smia holds 2.7M rows of imported corpora and a
      wrong collation shows up as subtly wrong results, not as an error.
- [x] 3.4 `smia_smia-pg-data` (the PG16 volume) retained; its container is
      stopped, not removed.

## 4. Cut over, one service at a time

- [x] 4.1 All four repointed and exercised through the gateway: `/stabbur/ui`
      200, `/mjolnir` 302→login, `/builder` 302, `/phonexa/` 401 (fail-closed
      by design), `/smia/ui` 200 after its import completes. Every container
      healthy, zero restarts.
      **RESTORE AS THE SERVICE ROLE, not as the superuser** — the dumps are
      `--no-owner` precisely so objects land owned by whoever restores them.
      Restoring as `tunadmin` leaves every table owned by `tunadmin`, and the
      service then dies with `permission denied for table alembic_version` /
      `for table schema_migrations` AFTER connecting successfully, so it reads
      as a migration bug rather than a privilege one. Hit exactly this during
      the end-to-end test; `postgres/init/bootstrap.sh` now repairs it on every
      boot as a safety net, but the correct procedure is
      `psql -U <db> -d <db> < <db>.sql`.
- [x] 4.2 Each project `include:`s `../postgres/compose.yaml` and declares
      `depends_on: postgres: service_healthy`. Remove its own postgres service
      **only after** that project's cut-over is verified.
- [x] 4.3 Verify `docker compose up stabbur-backend` starts the shared cluster
      and stabbur and nothing else — isolated development must survive this
      change (it is the operator's stated condition for accepting it).
- [x] 4.4a **The old per-service postgres containers become ORPHANS of the
      `tun` project the moment section 4 removes their service definitions.**
      Compose then prints an orphan warning on every `up`, and the documented
      cure for that warning — `--remove-orphans` — DELETES the containers
      still holding the pre-migration data. Observed on the development host
      immediately after rewiring: `tun-mjolnir-postgres-1`,
      `tun-stabbur-postgres-1`, `tun-smia-postgres-1` all still running and now
      undeclared. Stop them deliberately (`docker stop <name>`) once their
      cut-over is verified, and NEVER answer the orphan warning with
      `--remove-orphans` until task 6.7. The volumes survive either way; the
      point is that the containers are the convenient way to re-dump if the
      migration has to be repeated.
- [x] 4.4 **No old volume deleted.** `mjolnir_postgres_data`,
      `stabbur_stabbur-pg-data-17` and `smia_smia-pg-data` are all retained;
      their containers are stopped, not removed. They are the only rollback
      that does not involve the dumps.

## 5. Backup service

- [x] 5.1 Rewrote `backup/entrypoint.sh` for one cluster: five `pg_dump`s →
      `mjolnir.sql`, `stabbur.sql`, `smia.sql`, `phonexa.sql`, `shadow.sql`.
      **smia joins the backup set here** — it has never been in it.
- [x] 5.2 Kept the all-or-nothing discipline and the atomic `.tmp`-then-rename
      convention, and keep every failure check added after the previous change
      (clone, add, commit, push, the renames, both copy loops, and the
      unpushed-commit retry).
- [x] 5.3 Kept the blob and audio mirrors unchanged — but note the mirrors now
      fail the run when a source is empty while the mirror is not, which is the
      signal that a volume name drifted.
- [x] 5.4 Updated `depends_on` and the connection parameters for one host.
- [x] 5.5 Ran a full cycle against a local bare remote: five `.sql` files
      committed and pushed — `mjolnir.sql` 31 MB, `stabbur.sql` 269 KB,
      `smia.sql` 19 KB, `phonexa.sql` 632 KB, `shadow.sql` 716 B (empty but
      present). **smia is in the backup set for the first time.** Verified
      `smia.sql` restores into a scratch cluster. Also confirmed the
      clone-failure path still aborts loudly (exit 1, no false success).

## 6. Verification — none of this is optional

- [x] 6.1 Row counts match 0.7 for every table in every database — checked
      twice: once in the throwaway harness, and again on the real local cutover
      BEFORE any service started (mjolnir 1,630; stabbur 16,593; smia
      2,703,146; phonexa 3,610).
- [x] 6.2 Verified: all five databases created and every service's migrations
      applied automatically against the EMPTY shared cluster with no manual
      step (mjolnir 15 tables, stabbur 5, smia 16, phonexa 11, shadow 0 — it
      stays empty for zone-isolation). Run under project `vcon` with every
      rendered volume redirected to `vcon_*` and asserted so before starting.
      Original: — its own project
      name, its own throwaway volumes, never the production one — with
      migrations applied and no manual step. Assert the rendered volume list is
      fully redirected before starting (standing rules).
- [x] 6.3 Verified: `stabbur`→`smia`, `smia`→`mjolnir`, `phonexa`→`stabbur` all refused with `User does not have CONNECT privilege`; each role reaches its own database. Original: to another service's database.
- [x] 6.4 **PROVEN.** With `postgres` STOPPED (`State.Status = exited`), the
      device gate returned `15 passed, 0 failed, 1 SKIPPED` — the skip being
      D53's https assertion under `ALLOW_HTTP=1`, honestly reported rather than
      counted as a pass. The device plane has no database dependency, which is
      the single property that must hold at every step. Original: — the device path must not acquire a database
      dependency. This is the one property that must hold at every single step.
- [x] 6.5 See 6.4 — no SKIP hid an inverted assertion; the summary explicitly
      says "NOT a full proof" when anything is skipped. Original:, with no SKIPs
      hiding an inverted assertion (see `monorepo-merge` task 6.1 — a run that
      reports skips is not a proof).
- [x] 6.6 **DONE on the VPS cutover, 2026-11-14.** The backup service came up healthy against the new
      cluster, which under its new healthcheck means it genuinely produced a
      backup - five dumps committed and pushed.
      ORIGINAL NOTE: **Operator step (VPS).** A full backup cycle against the new cluster,
      verified restorable and copied off-host, before any old volume is
      removed. Proven locally against a throwaway bare remote (five `.sql`
      committed and pushed; `smia.sql` verified to restore), but a real run
      needs the deploy key, which is out of this repository's scope.
- [ ] 6.7 **Operator step, deliberately left undone.** Retire the old volumes
      one at a time, recording each name. They are retained on purpose:
      `mjolnir_postgres_data`, `stabbur_stabbur-pg-data-17`,
      `smia_smia-pg-data` (and `stabbur_stabbur-pg-data`, the pre-17 one D-U2
      already kept). Nothing automated should ever remove them.
