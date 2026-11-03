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

run_backup() {
  if [ ! -d "$BACKUP_REPO/.git" ]; then
    echo "entrypoint: cloning $BACKUP_REPO_URL (first run)..."
    git clone "$BACKUP_REPO_URL" "$BACKUP_REPO"
    git -C "$BACKUP_REPO" config user.email "backup@tun.local"
    git -C "$BACKUP_REPO" config user.name "tun git-backup"
  fi

  mkdir -p "$BACKUP_REPO/blobs"

  echo "entrypoint: dumping mjolnir-postgres..."
  PGPASSWORD="$POSTGRES_PASSWORD" pg_dump -h mjolnir-postgres -U mjolnir \
    --restrict-key="$RESTRICT_KEY" \
    --exclude-table=job_logs \
    --exclude-table=build_jobs \
    postgres > "$BACKUP_REPO/mjolnir.sql"

  echo "entrypoint: dumping stabbur-postgres..."
  PGPASSWORD="$STABBUR_POSTGRES_PASSWORD" pg_dump -h stabbur-postgres -U stabbur \
    --restrict-key="$RESTRICT_KEY" \
    stabbur > "$BACKUP_REPO/stabbur.sql"

  # stabbur-blobs is mounted directly at /stabbur-blobs (D-C2) — no nested
  # docker run needed. Flat, content-addressed, write-once (D09/D45); a
  # plain per-file loop (not `cp -rn`, confirmed broken in busybox, D129).
  echo "entrypoint: syncing stabbur's blob store..."
  src_count=$(ls -1 /stabbur-blobs | wc -l)
  before=$(ls -1 "$BACKUP_REPO/blobs" | wc -l)
  echo "  source volume has $src_count file(s)"
  if [ "$src_count" -eq 0 ]; then
    echo "  WARNING: source volume is empty — nothing to copy this run"
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
  echo "  blobs/: $before -> $after ($copied new)"

  cd "$BACKUP_REPO"
  git add -A

  if git diff --cached --quiet; then
    echo "entrypoint: no changes, nothing to commit"
    return 0
  fi

  git commit -m "backup $(date -u +%Y-%m-%dT%H:%M:%SZ)" --quiet
  git push --quiet
  echo "entrypoint: committed and pushed"
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
  run_backup || echo "entrypoint: run failed, will retry next interval" >&2
  echo "entrypoint: sleeping ${INTERVAL}s"
  sleep "$INTERVAL"
done
