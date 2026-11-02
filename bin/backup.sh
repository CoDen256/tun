#!/usr/bin/env bash
# Unified Postgres + blob backup, pushed to a plain private git repo
# (git-backup, tun/openspec/changes/git-backup/). Run on the VPS, on a
# cron schedule — see the crontab line documented in DEPLOY.md.
#
#   bin/backup.sh
#
# Dumps both mjolnir's and stabbur's Postgres databases, copies any new
# file from stabbur's content-addressed blob volume (never mjolnir's own
# data/blob/ — that's a rebuildable cache of stabbur's canonical copies,
# D-B4), then commits and pushes — but only if something actually changed
# (D-B7). No encryption (D-B2): the one rule that makes that fine is that
# nothing in this script ever writes a secret into $BACKUP_REPO.
#
# Addresses containers by their fixed `container_name:` (not `docker
# compose exec`, which depends on which compose project's directory you
# run it from) — works identically whether the stack was brought up via
# tun's unified `include:` or as independent per-repo stacks (D94/D98).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BACKUP_REPO="$SCRIPT_DIR/tun-backup"

if [ ! -d "$BACKUP_REPO/.git" ]; then
  echo "backup.sh: no git repo at $BACKUP_REPO — clone it first (see git-backup's tasks.md 1.1)" >&2
  exit 1
fi

mkdir -p "$BACKUP_REPO/blobs"

echo "backup.sh: dumping mjolnir-postgres..."
docker exec mjolnir-postgres pg_dump -U mjolnir postgres > "$BACKUP_REPO/mjolnir.sql"

echo "backup.sh: dumping stabbur-postgres..."
docker exec stabbur-postgres pg_dump -U stabbur stabbur > "$BACKUP_REPO/stabbur.sql"

# stabbur-blobs is content-addressed and write-once (D09/D45) — `cp -n`
# (never overwrite an existing destination file) makes this naturally
# incremental with no manifest/diffing of our own to maintain. A throwaway
# container reads the named volume directly, so this script doesn't need
# to assume where Docker's own volume storage lives on disk.
echo "backup.sh: syncing stabbur's blob store..."
docker run --rm \
  -v stabbur_stabbur-blobs:/src:ro \
  -v "$BACKUP_REPO/blobs":/dst \
  alpine sh -c 'cp -n /src/. /dst/ 2>/dev/null; true'

cd "$BACKUP_REPO"
git add -A

if git diff --cached --quiet; then
  echo "backup.sh: no changes, nothing to commit"
  exit 0
fi

git commit -m "backup $(date -u +%Y-%m-%dT%H:%M:%SZ)" --quiet
git push --quiet
echo "backup.sh: committed and pushed"
