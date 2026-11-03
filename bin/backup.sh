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

# job_logs/build_jobs are pure run-history bookkeeping (builder's own CI-job
# narration) — confirmed via every REFERENCES in hub/migrations/*.sql that
# nothing else depends on them (job_logs -> build_jobs is the only link, and
# both are excluded together). Everything that actually matters — card_slots,
# pending_occurrences, card_content, minted_notes, occurrence_shipments,
# publications, logic_bundles, userdata/userdata_history — has no FK tie to
# either. Deliberately NOT excluding publications/logic_bundles even though
# they look like the same kind of "build metadata": occurrence_shipments.
# build_id is a NOT NULL REFERENCES publications(build_id), and
# occurrence_shipments is the permanent shipped-occurrence ledger (D93) —
# excluding publications would make it unrestorable without faking rows to
# satisfy the FK. Both are tiny (one row per publish/assembly) regardless.
echo "backup.sh: dumping mjolnir-postgres..."
docker exec mjolnir-postgres pg_dump -U mjolnir \
  --exclude-table=job_logs \
  --exclude-table=build_jobs \
  postgres > "$BACKUP_REPO/mjolnir.sql"

echo "backup.sh: dumping stabbur-postgres..."
docker exec stabbur-postgres pg_dump -U stabbur stabbur > "$BACKUP_REPO/stabbur.sql"

# `docker run -v <name>:/path` SILENTLY CREATES an empty named volume if one
# by that exact name doesn't already exist — it never errors. Confirm the
# real volume exists first, or every run of this script would otherwise
# "succeed" against a phantom empty volume with nothing in the log to show
# for it (found live: this is exactly what happened the first time).
if ! docker volume inspect stabbur_stabbur-blobs >/dev/null 2>&1; then
  echo "backup.sh: ERROR — volume 'stabbur_stabbur-blobs' does not exist." >&2
  echo "  Run 'docker volume ls | grep -i blob' to find its real name, then" >&2
  echo "  fix the name in this script." >&2
  exit 1
fi

# stabbur-blobs is content-addressed and write-once (D09/D45), stored flat
# (no subdirectories — confirmed: stabbur's own compose mounts the volume
# directly at /app/blobs). A throwaway container reads it directly, so this
# script doesn't need to assume where Docker's own volume storage lives on
# disk.
#
# NOT `cp -rn /src/. /dst/`: confirmed live (three isolated tests) that
# busybox's `cp` silently copies ZERO files when `-r` and `-n` are combined
# — no error, exit 0, destination stays empty, even completely empty to
# begin with. `-r` alone works; `-n` alone (no recursion) works for a single
# file; combined, nothing is copied. This is what produced the empty
# blobs/ directory the first time this script ran for real. A plain
# per-file loop sidesteps the broken flag combination entirely (and is
# simpler to reason about than finding a correctly-behaving combination of
# flags in the first place) — verified to correctly skip an existing file
# and copy new ones.
echo "backup.sh: syncing stabbur's blob store..."
docker run --rm \
  -v stabbur_stabbur-blobs:/src:ro \
  -v "$BACKUP_REPO/blobs":/dst \
  alpine sh -c '
    src_count=$(ls -1 /src | wc -l)
    before=$(ls -1 /dst | wc -l)
    echo "  source volume has $src_count file(s)"
    if [ "$src_count" -eq 0 ]; then
      echo "  WARNING: source volume is empty — nothing to copy this run"
    fi
    copied=0
    for f in /src/*; do
      [ -e "$f" ] || continue
      name=$(basename "$f")
      if [ ! -e "/dst/$name" ]; then
        cp "$f" "/dst/$name"
        copied=$((copied + 1))
      fi
    done
    after=$(ls -1 /dst | wc -l)
    echo "  blobs/: $before -> $after ($copied new)"
  '

cd "$BACKUP_REPO"
git add -A

if git diff --cached --quiet; then
  echo "backup.sh: no changes, nothing to commit"
  exit 0
fi

git commit -m "backup $(date -u +%Y-%m-%dT%H:%M:%SZ)" --quiet
git push --quiet
echo "backup.sh: committed and pushed"
