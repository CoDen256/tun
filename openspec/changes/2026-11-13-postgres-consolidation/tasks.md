## 0. Before any data moves

- [ ] 0.1 Establish the **live** volume for every database from the running
      containers, not from compose files or volume names:
      `docker inspect <container> --format '{{range .Mounts}}{{.Name}} {{.Destination}}{{"\n"}}{{end}}'`
      Two generations exist on at least one host (design.md, Risks).
- [ ] 0.2 Run a git-backup cycle and verify it committed a current
      `mjolnir.sql`, `stabbur.sql`, `phonexa.sql`.
- [ ] 0.3 Record row counts per table per database. These are the restore
      acceptance criteria, captured before anything is touched.
- [ ] 0.4 Decide whether smia's lookup cache and imported corpora are backed up
      in full or excluded as rebuildable. Do not leave this to omission.

## 1. The shared cluster

- [ ] 1.1 `postgres/compose.yaml`: one `postgres:17-alpine`, one volume,
      one health check, published on `127.0.0.1` under the `dev` profile only.
- [ ] 1.2 Idempotent init: create databases `mjolnir`, `stabbur`, `smia`,
      `phonexa`, `shadow`; one role each; `CONNECTION LIMIT` per role;
      each role granted only its own database.
- [ ] 1.3 Derive each role password from `POSTGRES_PASSWORD`; derive each
      service's `DATABASE_URL` in compose. Neither is typed into any `.env`.
- [ ] 1.4 Each project `include:`s `../postgres/compose.yaml` and declares
      `depends_on: postgres: service_healthy`.
- [ ] 1.5 Verify `docker compose up stabbur` starts `postgres` and
      `stabbur-backend` and nothing else.

## 2. Migration — one service at a time, old volumes retained

For each of mjolnir, stabbur, smia, phonexa:

- [ ] 2.1 Stop the service (not the old database).
- [ ] 2.2 `pg_dump` from the **verified live** volume of task 0.1.
- [ ] 2.3 Restore into the new cluster's database of the same name.
- [ ] 2.4 Compare row counts against task 0.3. A mismatch stops the migration;
      it does not get investigated later.
- [ ] 2.5 Repoint the service's `DATABASE_URL` and start it.
- [ ] 2.6 Exercise the service's own UI and one write path.
- [ ] 2.7 **Do not delete the old volume.** Retain until the whole change is
      verified and one backup cycle has run against the new cluster.

- [ ] 2.8 smia specifically: this is also the 16 → 17 upgrade. Confirm the
      restore is into 17 and that extensions, collations and any
      version-sensitive types survived.
- [ ] 2.9 `shadow` is created empty. `zone-isolation` populates it; nothing
      here writes to it.

## 3. Backup

- [ ] 3.1 `backup/entrypoint.sh`: one `pg_dump` per database against the one
      cluster — `mjolnir.sql`, `stabbur.sql`, `smia.sql`, `phonexa.sql`,
      `shadow.sql`.
- [ ] 3.2 Keep the all-or-nothing discipline: a failure in any dump leaves
      every committed `.sql` untouched and makes no commit. Keep the atomic
      `.tmp`-then-rename convention — it exists because a truncating
      redirect once committed empty backups as if they were real.
- [ ] 3.3 Keep the blob and audio mirrors unchanged.
- [ ] 3.4 Update `depends_on` and the connection parameters for one host.
- [ ] 3.5 Run a full cycle; verify five `.sql` files are committed and that
      each restores into a scratch database.

## 4. Operator surface

- [ ] 4.1 Adminer reaches all five databases from one login.
- [ ] 4.2 Remove phonexa's own `dev`-profile Adminer, now redundant.
- [ ] 4.3 `DEPLOY.md`: the restore procedure, per database, against one cluster.

## 5. Verification

- [ ] 5.1 Row counts match task 0.3 for every table in every database.
- [ ] 5.2 Every service starts clean against an empty cluster, migrations and
      all, with no manual step.
- [ ] 5.3 A service's role cannot connect to another service's database.
- [ ] 5.4 `/ota/*` served correctly throughout — including with the cluster
      stopped, which must change nothing about it.
- [ ] 5.5 `bin/ota-verify.sh` 16/16.
- [ ] 5.6 One backup cycle completes against the new cluster before any old
      volume is removed.
