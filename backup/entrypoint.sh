#!/usr/bin/env bash
# compose-backup-service's entrypoint — carries bin/backup.sh's logic
# forward unchanged (table exclusions D-B4b, --restrict-key D130,
# per-file blob-copy loop D129), with the connection method changed:
# network + password (D-C1) instead of `docker exec`, and the blob volume
# mounted directly (D-C2) instead of via a throwaway container. Runs its
# own schedule internally (D-C5) — no host cron.
#
# Covers THREE databases (mjolnir, stabbur, phonexa — D147) and TWO
# blob-like stores (stabbur's flat content-addressed blob volume, and
# phonexa's nested audio tree). The three dumps are one all-or-nothing
# transaction: a failure in any of them leaves all three committed .sql
# files untouched and makes no commit at all.
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
    # Every step here is checked explicitly, for the SAME reason the dump
    # section below documents at length: this function is called as
    # `run_backup || log ...`, and `||` disables errexit for the entire
    # function body recursively — so an unchecked failure here does not abort
    # anything. Found live by a real boot test (2026-11-13): the clone failed
    # with "Permission denied (publickey)", `git config`, `git add`,
    # `git diff --cached`, `git commit` and `git push` then all failed inside
    # a non-repository directory, and the container still logged
    # "entrypoint: committed and pushed" and slept for 24h with 0 restarts.
    # A backup service that reports success while backing up nothing is worse
    # than one that crashes.
    if ! git clone "$BACKUP_REPO_URL" "$BACKUP_REPO"; then
      log "entrypoint: FATAL clone of $BACKUP_REPO_URL failed — check BACKUP_SSH_KEY_PATH is the right key and is a deploy key on that repo" >&2
      return 1
    fi
    git -C "$BACKUP_REPO" config user.email "backup@tun.local" || { log "entrypoint: FATAL git config failed" >&2; return 1; }
    git -C "$BACKUP_REPO" config user.name "tun git-backup" || { log "entrypoint: FATAL git config failed" >&2; return 1; }
  fi

  # Belt and braces: whatever happened above, refuse to continue unless there
  # is a real repository to commit into. A later `git diff --cached --quiet`
  # returns 128 (not 0 or 1) outside a repository, which would otherwise fall
  # straight through to the commit/push path.
  if [ ! -d "$BACKUP_REPO/.git" ]; then
    log "entrypoint: FATAL $BACKUP_REPO is not a git repository — refusing to run" >&2
    return 1
  fi

  mkdir -p "$BACKUP_REPO/blobs" || { log "entrypoint: FATAL mkdir blobs failed" >&2; return 1; }

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
  if ! PGPASSWORD="$MJOLNIR_POSTGRES_PASSWORD" pg_dump -h mjolnir-postgres -U mjolnir \
      --restrict-key="$RESTRICT_KEY" \
      --no-owner \
      --no-privileges \
      --no-tablespaces \
      --exclude-table=job_logs \
      --exclude-table=build_jobs \
      postgres > "$BACKUP_REPO/mjolnir.sql.tmp"; then
    log "entrypoint: mjolnir dump failed — aborting this run, mjolnir.sql left untouched" >&2
    rm -f "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/stabbur.sql.tmp" \
          "$BACKUP_REPO/phonexa.sql.tmp"
    return 1
  fi

  log "entrypoint: dumping stabbur-postgres..."
  if ! PGPASSWORD="$STABBUR_POSTGRES_PASSWORD" pg_dump -h stabbur-postgres -U stabbur \
      --restrict-key="$RESTRICT_KEY" \
      --no-owner \
      --no-privileges \
      --no-tablespaces \
      stabbur > "$BACKUP_REPO/stabbur.sql.tmp"; then
    log "entrypoint: stabbur dump failed — aborting this run, stabbur.sql left untouched" >&2
    rm -f "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/stabbur.sql.tmp" \
          "$BACKUP_REPO/phonexa.sql.tmp"
    return 1
  fi

  # No --exclude-table here, deliberately, unlike mjolnir's dump above:
  # mjolnir's job_logs/build_jobs are regenerable machine output, but EVERY
  # phonexa table is user data — vowel samples' metadata, tokens, settings,
  # users, and the Shadowing tables (shadowing_media, shadowing_segments)
  # carrying split points, progress and transcripts. Shadowing needs no
  # special handling beyond being in this dump: its recordings are
  # deliberately ephemeral and never stored server-side, so the database IS
  # the Shadowing backup. Do not "optimize" any of it out (D147).
  log "entrypoint: dumping phonexa-postgres..."
  if ! PGPASSWORD="$PHONEXA_POSTGRES_PASSWORD" pg_dump -h phonexa-postgres -U phonexa \
      --restrict-key="$RESTRICT_KEY" \
      --no-owner \
      --no-privileges \
      --no-tablespaces \
      phonexa > "$BACKUP_REPO/phonexa.sql.tmp"; then
    log "entrypoint: phonexa dump failed — aborting this run, phonexa.sql left untouched" >&2
    rm -f "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/stabbur.sql.tmp" \
          "$BACKUP_REPO/phonexa.sql.tmp"
    return 1
  fi

  # All three dumps succeeded — only now do the real, previously-committed
  # filenames ever change.
  mv "$BACKUP_REPO/mjolnir.sql.tmp" "$BACKUP_REPO/mjolnir.sql" || { log "entrypoint: FATAL rename of mjolnir.sql failed" >&2; return 1; }
  mv "$BACKUP_REPO/stabbur.sql.tmp" "$BACKUP_REPO/stabbur.sql" || { log "entrypoint: FATAL rename of stabbur.sql failed" >&2; return 1; }
  mv "$BACKUP_REPO/phonexa.sql.tmp" "$BACKUP_REPO/phonexa.sql" || { log "entrypoint: FATAL rename of phonexa.sql failed" >&2; return 1; }

  # stabbur-blobs is mounted directly at /stabbur-blobs (D-C2) — no nested
  # docker run needed. Flat, content-addressed, write-once (D09/D45); a
  # plain per-file loop (not `cp -rn`, confirmed broken in busybox, D129).
  log "entrypoint: syncing stabbur's blob store..."
  MIRROR_DIR=blobs
  src_count=$(ls -1 /stabbur-blobs | wc -l)
  before=$(ls -1 "$BACKUP_REPO/blobs" | wc -l)
  log "  source volume has $src_count file(s)"
  if [ "$src_count" -eq 0 ]; then
    # Empty is only benign if the backup has never held anything for this
    # source. If the mirror already has files, an empty source means the
    # volume name drifted or the mount is wrong — and the old behaviour was to
    # warn and then commit a green, mirror-nothing backup.
    if [ "$(ls -1A "$BACKUP_REPO/$MIRROR_DIR" 2>/dev/null | wc -l)" -gt 0 ]; then
      log "entrypoint: FATAL source for $MIRROR_DIR is empty but the mirror is not — check the volume mount" >&2
      return 1
    fi
    log "  WARNING: source volume is empty — nothing to copy this run"
  fi
  copied=0
  for f in /stabbur-blobs/*; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    if [ ! -e "$BACKUP_REPO/blobs/$name" ]; then
      # Count only a copy that SUCCEEDED. `copied` was incremented
      # unconditionally, so the summary line reported copies that never
      # happened — and under the `run_backup || log ...` caller a failing `cp`
      # does not abort either (errexit is suppressed for the whole function).
      if cp "$f" "$BACKUP_REPO/blobs/$name"; then
        copied=$((copied + 1))
      else
        log "entrypoint: FATAL copy of blob $name failed" >&2
        return 1
      fi
    fi
  done
  after=$(ls -1 "$BACKUP_REPO/blobs" | wc -l)
  log "  blobs/: $before -> $after ($copied new)"

  # phonexa's audio, mounted read-only at /phonexa-audio (same D-C2 trick
  # as stabbur's blobs above). Same copy-if-absent policy, but the tree is
  # NESTED (lang/<lang>/ingested/<name>.wav) and the leaf names come from
  # user-entered text, so they can contain spaces and non-ASCII — hence
  # `find -print0` + `read -r -d ''` rather than a glob, and `mkdir -p` on
  # each destination's parent. Still not `cp -rn`: broken in busybox (D129)
  # and its exit status changed across coreutils versions anyway.
  #
  # STALENESS, ACCEPTED AND DELIBERATE (D147): copy-if-absent never
  # overwrites, and phonexa's files — unlike stabbur's write-once,
  # content-addressed blobs — CAN be rewritten in place (Formant Lab's
  # sample trim, or re-recording under the same key). So a sample edited
  # after its first backup keeps its PRE-EDIT audio here, and a sample
  # deleted in phonexa is never removed here. The alternative
  # (overwrite-if-different) would rewrite git history on every edit. To
  # refresh one file on purpose: delete it from the backup repo clone and
  # let the next run copy the current one.
  log "entrypoint: syncing phonexa's audio tree..."
  mkdir -p "$BACKUP_REPO/phonexa-audio" || { log "entrypoint: FATAL mkdir phonexa-audio failed" >&2; return 1; }
  MIRROR_DIR=phonexa-audio
  src_count=$(find /phonexa-audio -type f | wc -l)
  before=$(find "$BACKUP_REPO/phonexa-audio" -type f | wc -l)
  log "  source volume has $src_count file(s)"
  if [ "$src_count" -eq 0 ]; then
    # Empty is only benign if the backup has never held anything for this
    # source. If the mirror already has files, an empty source means the
    # volume name drifted or the mount is wrong — and the old behaviour was to
    # warn and then commit a green, mirror-nothing backup.
    if [ "$(ls -1A "$BACKUP_REPO/$MIRROR_DIR" 2>/dev/null | wc -l)" -gt 0 ]; then
      log "entrypoint: FATAL source for $MIRROR_DIR is empty but the mirror is not — check the volume mount" >&2
      return 1
    fi
    log "  WARNING: source volume is empty — nothing to copy this run"
  fi
  copied=0
  while IFS= read -r -d '' f; do
    rel="${f#/phonexa-audio/}"
    dest="$BACKUP_REPO/phonexa-audio/$rel"
    if [ ! -e "$dest" ]; then
      mkdir -p "$(dirname "$dest")" || { log "entrypoint: FATAL mkdir for $rel failed" >&2; return 1; }
      if cp "$f" "$dest"; then
        copied=$((copied + 1))
      else
        log "entrypoint: FATAL copy of audio $rel failed" >&2
        return 1
      fi
    fi
  done < <(find /phonexa-audio -type f -print0)
  after=$(find "$BACKUP_REPO/phonexa-audio" -type f | wc -l)
  log "  phonexa-audio/: $before -> $after ($copied new)"

  cd "$BACKUP_REPO" || { log "entrypoint: FATAL cd $BACKUP_REPO failed" >&2; return 1; }
  if ! git add -A; then
    log "entrypoint: FATAL git add failed" >&2
    return 1
  fi

  if git diff --cached --quiet; then
    # A previous run may have committed successfully and then FAILED to push,
    # leaving an unpushed local commit. The dumps are byte-identical on the
    # next run, so nothing is staged and this branch is taken — and without
    # the retry below the remote stays stale FOREVER while every subsequent
    # run logs success. Found by independent review, 2026-11-13.
    if [ -n "$(git log '@{u}..HEAD' --oneline 2>/dev/null)" ]; then
      log "entrypoint: no new changes, but local commits are unpushed — retrying push"
      if ! git push --quiet; then
        log "entrypoint: FATAL push of previously-committed backups still failing — the remote is STALE" >&2
        return 1
      fi
      log "entrypoint: pushed previously-committed backups"
      return 0
    fi
    log "entrypoint: no changes, nothing to commit"
    return 0
  fi

  # Checked for the same errexit-suppression reason as the clone above: a
  # failed push must never be logged as a successful backup.
  if ! git commit -m "backup $(date -u +%Y-%m-%dT%H:%M:%SZ)" --quiet; then
    log "entrypoint: FATAL commit failed" >&2
    return 1
  fi
  if ! git push --quiet; then
    log "entrypoint: FATAL push failed — the dumps are committed locally in $BACKUP_REPO but NOT on the remote" >&2
    return 1
  fi
  log "entrypoint: committed and pushed"
}

: "${BACKUP_REPO_URL:?set BACKUP_REPO_URL}"
: "${MJOLNIR_POSTGRES_PASSWORD:?set MJOLNIR_POSTGRES_PASSWORD in the root .env}"
: "${STABBUR_POSTGRES_PASSWORD:?set STABBUR_POSTGRES_PASSWORD}"
: "${PHONEXA_POSTGRES_PASSWORD:?set PHONEXA_POSTGRES_PASSWORD}"

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
