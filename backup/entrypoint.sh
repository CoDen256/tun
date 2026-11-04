#!/usr/bin/env bash
# compose-backup-service's entrypoint — carries bin/backup.sh's logic
# forward unchanged (table exclusions D-B4b, --restrict-key D130,
# per-file blob-copy loop D129), with the connection method changed:
# network + password (D-C1) instead of `docker exec`, and the blob volume
# mounted directly (D-C2) instead of via a throwaway container. Runs its
# own schedule internally (D-C5) — no host cron.
set -euo pipefail

BACKUP_REPO="/data/tun-backup"
SSH_KEY="/root/.ssh/id_backup"
RESTRICT_KEY="tunbackupfixedkey"
INTERVAL="${BACKUP_INTERVAL_SECONDS:-86400}"

mkdir -p /root/.ssh
chmod 700 /root/.ssh
export GIT_SSH_COMMAND="ssh -i $SSH_KEY -o StrictHostKeyChecking=accept-new -o UserKnownHostsFile=/data/known_hosts"

log() {
  echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] $*"
}

run_backup() {
  if [ ! -d "$BACKUP_REPO/.git" ]; then
    log "entrypoint: cloning $BACKUP_REPO_URL (first run)..."
    git clone "$BACKUP_REPO_URL" "$BACKUP_REPO"
    git -C "$BACKUP_REPO" config user.email "backup@tun.local"
    git -C "$BACKUP_REPO" config user.name "tun git-backup"
  fi

  mkdir -p "$BACKUP_REPO/blobs"

  # Found live (first real run on the VPS): `cmd > file` TRUNCATES `file`
  # before `cmd` even runs — so a failed pg_dump was silently leaving an
  # EMPTY mjolnir.sql/stabbur.sql in place, which then got committed and
  # pushed as if it were a real backup. Compounded by a second bug: calling
  # `run_backup` as `run_backup || echo ...` (below) disables `set -e` for
  # the ENTIRE function body, not just the top-level call — a real bash
  # gotcha (&&/||/if suppress errexit recursively for whatever they test,
  # even through a subshell — confirmed by isolated repro before fixing),
  # so the failed dump didn't abort the run either. Fixed with the same
  # atomic dump-to-.tmp-then-rename convention used everywhere else in this
  # ecosystem (OTA bundles, blobs, logic bundles): a failed dump leaves only
  # a `.tmp` file behind and `return`s before `git add` ever runs — the
  # previously-committed mjolnir.sql/stabbur.sql is never touched by a
  # failed attempt, regardless of how `run_backup`'s own exit status is
  # later handled by its caller.
  log "entrypoint: dumping mjolnir-postgres..."
  if ! PGPASSWORD="$POSTGRES_PASSWORD" pg_dump -h mjolnir-postgres -U mjolnir \
      --restrict-key="$RESTRICT_KEY" \
      --exclude-table=job_logs \
      --exclude-table=build_jobs \
      postgres > "$BACKUP_REPO/mjolnir.sql.tmp"; then
    log "entrypoint: mjolnir dump failed — aborting this run, mjolnir.sql left untouched" >&2
    rm -f "$BACKUP_REPO/mjolnir.sql.tmp"
    return 1
  fi

  log "entrypoint: dumping stabbur-postgres..."
  if ! PGPASSWORD="$STABBUR_POSTGRES_PASSWORD" pg_dump -h stabbur-postgres -U stabbur \
      --restrict-key="$RESTRICT_KEY" \
      stabbur > "$BACKUP_REPO/stabbur.sql.tmp"; then
    log "entrypoint: stabbur dump failed — aborting this run, stabbur.sql left untouched" >&2
    rm -f "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/stabbur.sql.tmp"
    return 1
  fi

  # Both dumps succeeded — only now do the real, previously-committed
  # filenames ever change.
  mv "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/mjolnir.sql"
  mv "$BACKUP_REPO/stabbur.sql.tmp" "$BACKUP_REPO/stabbur.sql"

  # stabbur-blobs is mounted directly at /stabbur-blobs (D-C2) — no nested
  # docker run needed. Flat, content-addressed, write-once (D09/D45); a
  # plain per-file loop (not `cp -rn`, confirmed broken in busybox, D129).
  log "entrypoint: syncing stabbur's blob store..."
  src_count=$(ls -1 /stabbur-blobs | wc -l)
  before=$(ls -1 "$BACKUP_REPO/blobs" | wc -l)
  log "  source volume has $src_count file(s)"
  if [ "$src_count" -eq 0 ]; then
    log "  WARNING: source volume is empty — nothing to copy this run"
  fi
  copied=0
  for f in /stabbur-blobs/*; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    if [ ! -e "$BACKUP_REPO/blobs/$name" ]; then
      cp "$f" "$BACKUP_REPO/blobs/$name"
      copied=$((copied + 1))
    fi
  done
  after=$(ls -1 "$BACKUP_REPO/blobs" | wc -l)
  log "  blobs/: $before -> $after ($copied new)"

  cd "$BACKUP_REPO"
  git add -A

  if git diff --cached --quiet; then
    log "entrypoint: no changes, nothing to commit"
    return 0
  fi

  git commit -m "backup $(date -u +%Y-%m-%dT%H:%M:%SZ)" --quiet
  git push --quiet
  log "entrypoint: committed and pushed"
}

: "${BACKUP_REPO_URL:?set BACKUP_REPO_URL}"
: "${POSTGRES_PASSWORD:?set POSTGRES_PASSWORD, mjolnirs own password via env_file}"
: "${STABBUR_POSTGRES_PASSWORD:?set STABBUR_POSTGRES_PASSWORD}"

# RUN_ONCE=1 runs the backup exactly once and exits — used for testing and
# for triggering a manual backup on demand (e.g. `docker compose run --rm
# -e RUN_ONCE=1 backup`) without waiting for the schedule.
if [ "${RUN_ONCE:-}" = "1" ]; then
  run_backup
  exit 0
fi

while true; do
  run_backup || log "entrypoint: run failed, will retry next interval" >&2
  next_run=$(date -u -d "+${INTERVAL} seconds" +%Y-%m-%dT%H:%M:%SZ)
  log "entrypoint: sleeping ${INTERVAL}s, next run at $next_run"
  sleep "$INTERVAL"
done
