## 0. Before you write any code

Read `design.md` in full, especially D-B1/D-B5/D-B6 as revised during
implementation — this is a host script + host `cron` entry, not a new
Docker service with its own deploy key, because the operator had already
cloned `~/dev/tun/tun-backup` directly on the host using their own existing
SSH identity before this task list was written. Read D-B2 (no encryption)
and the one hard rule it depends on (secrets never enter `tun-backup/`).

## 1. The private backup repository

- [x] 1.1 Create a new private GitHub repository for backup content only
      — **done**: `~/dev/tun/tun-backup`, remote
      `git@github.com:CoDen256/tun-backup.git`, cloned on the host.
- [x] 1.2 Git push authentication — **no new credential needed**: the
      clone already works over the operator's existing host SSH identity,
      the same one used for every other repo in this project (supersedes
      the original deploy-key task, D-B6).

## 2. The backup script

- [x] 2.1 New `tun/bin/backup.sh`: `docker exec mjolnir-postgres pg_dump -U
      mjolnir postgres` → `tun-backup/mjolnir.sql` (overwrite), and `docker
      exec stabbur-postgres pg_dump -U stabbur stabbur` → `tun-backup/
      stabbur.sql` (overwrite). Addresses containers by their fixed
      `container_name:` rather than `docker compose exec`, so it works
      identically regardless of which compose project (tun's unified
      `include:` or independent per-repo stacks) actually started them —
      confirmed both containers set `container_name:` explicitly. Each
      container's own bundled `pg_dump` always matches its own server
      version exactly, so the original design's "reconcile two server
      majors against one external client" concern doesn't apply.
- [x] 2.2 Same script: copy new files from the `stabbur_stabbur-blobs`
      named volume into `tun-backup/blobs/` via a throwaway `alpine`
      container (`docker run --rm -v stabbur_stabbur-blobs:/src:ro -v
      $BACKUP_REPO/blobs:/dst alpine sh -c 'cp -n /src/. /dst/'`) — reads
      the named volume directly, no assumption about where Docker's own
      volume storage lives on disk. `cp -n` (busybox, confirmed supported
      and tested) never overwrites an existing destination file, making
      this naturally incremental with no manifest of our own. Never
      touches `mjolnir`'s own `data/blob/` (D-B4 — not referenced anywhere
      in this script).
- [x] 2.3 Same script: `git add -A`, then `git diff --cached --quiet` to
      detect a no-op run before committing (D-B7) — verified against a
      disposable scratch repo (see 2.6).
- [x] 2.4 Added `tun-backup/` to `tun/.gitignore`.
- [x] 2.5 Documented in the script's own header comment and in
      `mjolnir/DEPLOY.md`'s existing "Backups (P24)" section (which
      previously described hub's own backup as manual and didn't yet
      mention `userdata`/`userdata_history`/`device_state` at all — both
      gaps closed in the same edit). The crontab line itself is
      **documented, not installed** — editing the operator's own crontab
      is a host-level change outside this change's scope, same as every
      other "the operator does this themselves" step in this project.
- [x] 2.6 Dry-run against a disposable scratch repo (not `tun-backup`
      itself, not a real database): confirmed a no-change run produces
      zero commits; a run with a real file change plus one new, one
      already-existing blob file produces exactly one commit touching
      only the changed file and the genuinely new blob — the existing
      blob's content was verified unchanged, not overwritten. The
      `docker exec`/`docker run` steps themselves need the real stack
      running to verify end-to-end (sign-off, below) — no Postgres
      containers are up in this sandbox.

## 3. Sign-off

- [x] 3.1 **(Operator)** First real run against the actual production
      databases — confirm the initial (large) commit succeeds and pushes
      to `tun-backup`; spot-check `mjolnir.sql`/`stabbur.sql` contain real
      data by restoring into a scratch Postgres and querying a known
      table. **Superseded**: this delivery mechanism (host script) never
      reached sign-off before `compose-backup-service` replaced it; the
      equivalent sign-off happened there instead (its tasks.md 4.1/4.2).
- [x] 3.2 **(Operator)** Install the documented `cron` entry. **Superseded
      — not done, and no longer applicable**: `compose-backup-service`
      retires this delivery mechanism before a crontab entry was ever
      installed; scheduling is internal to the replacement compose service
      (D-C5).
- [x] 3.3 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
      Nothing to record here — see D129/D130 for the bugs actually found
      against this version, and the proposal of `compose-backup-service`
      for why its delivery mechanism was superseded.
