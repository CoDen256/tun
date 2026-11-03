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

- [ ] 1.1 `tun/backup/Dockerfile`: `debian:bookworm-slim` base, PGDG apt
      repo, `postgresql-client-17` (matching both services post-upgrade),
      `git`, `openssh-client`, `bash`.
- [ ] 1.2 `tun/backup/entrypoint.sh`: port `bin/backup.sh`'s logic —
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
        "${BACKUP_INTERVAL_SECONDS:-86400}"; done` (D-C5).
- [ ] 1.3 Tests: build the image; run a dry pass against disposable
      Postgres containers + a disposable blob volume + a disposable git
      remote (not the real `tun-backup`) confirming the same behaviors
      already verified for the host-script version (no-op run = no
      commit; a real change = exactly one commit; existing blobs
      untouched, new ones added).

## 2. The compose service

- [ ] 2.1 New `backup` service in `tun/compose.yaml`: `build: ./backup`,
      joins the default merged network (no extra config, same as
      `adminer`).
- [ ] 2.2 `env_file: [../mjolnir/.env]` for `MJOLNIR_POSTGRES_PASSWORD`
      (reads mjolnir's real `POSTGRES_PASSWORD`); `STABBUR_POSTGRES_
      PASSWORD` set directly in `tun`'s own `.env` to match stabbur's
      hardcoded compose-file value (D-C1 — documented clearly so the two
      don't silently drift).
- [ ] 2.3 Volumes: a new named volume for the repo clone
      (`backup-repo-clone`); `stabbur-blobs:/stabbur-blobs:ro` (D-C2,
      referenced directly, no declaration needed in `tun/compose.yaml`
      itself); one mounted private key file + `known_hosts` (D-C3) at
      paths read from `tun/.env` (`BACKUP_SSH_KEY_PATH`).
- [ ] 2.4 `tun/.env.example`: document `BACKUP_REPO_URL` (the git SSH
      URL), `BACKUP_SSH_KEY_PATH` (host path to the one private key file),
      `STABBUR_POSTGRES_PASSWORD`, `BACKUP_INTERVAL_SECONDS` (default
      `86400`).

## 3. Retire the host-script version

- [ ] 3.1 Remove `bin/backup.sh`.
- [ ] 3.2 Remove the documented host `crontab` line (was in the script's
      own header comment and `mjolnir/DEPLOY.md`).
- [ ] 3.3 Update `mjolnir/DEPLOY.md`'s "Backups (P24)" section to point at
      the compose service instead of the host script.

## 4. Sign-off

- [ ] 4.1 **(Operator)** `docker compose up -d backup` on the real VPS —
      confirm via `docker compose logs backup` that it clones the repo,
      dumps both databases, syncs blobs, and commits on its first run.
- [ ] 4.2 **(Operator)** Compare the result against the last known-good
      commit from the host-script version — same tables present/absent,
      same blob count, no regression.
- [ ] 4.3 **(Operator)** Confirm a second manual restart of the container
      doesn't re-clone or lose history — the named volume persists across
      `docker compose restart backup`.
- [ ] 4.4 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
