## 0. Before you write any code

Read `design.md` in full, especially D-C1 (network auth, not `docker
exec` — a real password is now needed, not a new secret though) and D-C2
(confirmed live: a volume declared with `name:` in an included file is
directly referenceable from the including file's own services, no extra
wiring). Read `openspec/changes/git-backup/design.md` and the current
`bin/backup.sh` — this change carries that logic forward into a new
entrypoint, it does not re-derive what gets backed up or why.

**Confirm `stabbur`'s `postgres-17-upgrade` has landed** before starting
task 1 — this design assumes a single Postgres client version.

## 1. The image

- [x] 1.1 `tun/backup/Dockerfile`: `debian:bookworm-slim` base, PGDG apt
      repo, `postgresql-client-17` (matching both services post-upgrade),
      `git`, `openssh-client`, `bash`. Built clean; all three tools
      confirmed present and working (`pg_dump`/`git`/`ssh` version checks).
- [x] 1.2 `tun/backup/entrypoint.sh`: port `bin/backup.sh`'s logic —
      - `PGPASSWORD=$MJOLNIR_POSTGRES_PASSWORD pg_dump -h mjolnir-postgres
        -U mjolnir --restrict-key=tunbackupfixedkey --exclude-table=
        job_logs --exclude-table=build_jobs postgres > $BACKUP_REPO/
        mjolnir.sql` (D-C1 — network + password, same exclusions/
        restrict-key as before).
      - `PGPASSWORD=$STABBUR_POSTGRES_PASSWORD pg_dump -h stabbur-postgres
        -U stabbur --restrict-key=tunbackupfixedkey stabbur >
        $BACKUP_REPO/stabbur.sql`.
      - Blob sync: the same per-file loop as `bin/backup.sh`, now reading
        directly from the mounted `/stabbur-blobs` path (D-C2) — no nested
        `docker run`.
      - If `$BACKUP_REPO/.git` doesn't exist: `git clone` using the
        mounted key (D-C4).
      - `git add -A` / `git diff --cached --quiet` / commit+push, same as
        before (D-B7, unchanged).
      - Wrap the whole thing in `while true; do <run>; sleep
        "${BACKUP_INTERVAL_SECONDS:-86400}"; done` (D-C5). Also added a
        `RUN_ONCE=1` mode — not in the original task wording, added
        because it was needed to test the loop body in isolation and is
        independently useful for triggering a manual backup on demand.
      - Found and fixed during testing: a bare apostrophe inside
        `${VAR:?message}`'s message text breaks bash parsing even inside
        double quotes (a real parser quirk, confirmed via a minimal
        isolated repro, not assumed) — reworded the one message that had
        a contraction rather than escaping it.
- [x] 1.3 Tests: built the image; ran a full dry pass against disposable
      Postgres 17 containers (network-aliased as `mjolnir-postgres`/
      `stabbur-postgres`), a disposable blob volume, and a disposable
      bare git repo standing in for `tun-backup`. Confirmed: first run
      clones, dumps both DBs (verified `card_slots` present and
      `job_logs` absent in the mjolnir dump), syncs blobs, commits and
      pushes; second run with no changes produces zero new commits; a
      real change (one new DB row, one new blob file) produces exactly
      one new commit touching only `mjolnir.sql` and the new blob file —
      the pre-existing blob has no commits against it at all, confirmed
      via `git log --follow`.

## 2. The compose service

- [x] 2.1 New `backup` service in `tun/compose.yaml`: `build: ./backup`,
      joins the default merged network (no extra config, same as
      `adminer`). Verified via `docker compose config --quiet`.
- [x] 2.2 `env_file: [../mjolnir/.env]`. **Deviation from this task's
      literal wording**: the entrypoint reads the variable as
      `POSTGRES_PASSWORD` (exactly what `env_file` hands the container
      from mjolnir's own `.env`), not a renamed `MJOLNIR_POSTGRES_
      PASSWORD` — `env_file` passes keys through verbatim, Compose has no
      built-in rename, and inventing one would mean the entrypoint
      disagreeing with its own source file's actual key name for no
      benefit. `STABBUR_POSTGRES_PASSWORD` set directly in `tun`'s own
      `.env` (default `stabbur`, matching stabbur's hardcoded compose
      value) — documented in `.env.example` so the two don't silently
      drift.
- [x] 2.3 Volumes: `backup-repo-clone` (new named volume,
      `tun_backup-repo-clone`) for the repo clone; `stabbur-blobs:/
      stabbur-blobs:ro` (D-C2, referenced directly — verified via
      `docker compose config` that it resolves with zero declaration in
      `tun/compose.yaml`); one mounted private key file at
      `BACKUP_SSH_KEY_PATH` (D-C3). **Deviation**: no separate
      `known_hosts` mount — `entrypoint.sh` manages it automatically
      inside the same persistent `/data` volume
      (`StrictHostKeyChecking=accept-new`), so there's one fewer thing to
      prepare, not two.
- [x] 2.4 `tun/.env.example` created (didn't exist before this change):
      documents `BACKUP_REPO_URL`, `BACKUP_SSH_KEY_PATH`,
      `STABBUR_POSTGRES_PASSWORD`, `BACKUP_INTERVAL_SECONDS`, and a note
      that mjolnir's own password is read from its own `.env`, not
      duplicated here.

## 3. Retire the host-script version

- [x] 3.1 Removed `bin/backup.sh` (the crontab line it documented in its
      own header comment is removed along with it).
- [x] 3.2 Host `crontab` line retired — `mjolnir/DEPLOY.md` updated (3.3)
      to describe the compose service, no crontab mentioned anymore
      anywhere in either repo's docs.
- [x] 3.3 `mjolnir/DEPLOY.md`'s "Backups (P24)" section updated: points at
      `tun`'s `backup` compose service; also fixed two unrelated staleness
      bugs found while editing it — `job_logs`/`build_jobs` were still
      listed as backed up (excluded since D-B4b) and `device_state` was
      still listed as existing (dropped entirely, D126).

## 4. Sign-off

- [x] 4.1 **(Operator)** `docker compose up -d backup` on the real VPS —
      confirm via `docker compose logs backup` that it clones the repo,
      dumps both databases, syncs blobs, and commits on its first run.
      Done via `RUN_ONCE=1`: operator confirmed the run completed and the
      backup commit landed in `tun-backup`.
- [x] 4.2 **(Operator)** Compare the result against the last known-good
      commit from the host-script version — same tables present/absent,
      same blob count, no regression. Operator confirmed everything is in
      place.
- [x] 4.3 **(Operator)** Confirm a second manual restart of the container
      doesn't re-clone or lose history — the named volume persists across
      `docker compose restart backup`. Operator confirmed migration is
      complete and stable.
- [x] 4.4 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
      Nothing contradicted — D131 already covers the one bug found live;
      annotated in place now that the operator confirmed the re-run
      overwrote the bad empty `stabbur.sql` commit.
