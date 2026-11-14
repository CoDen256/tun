#!/usr/bin/env bash
# compose-backup-service's entrypoint — carries bin/backup.sh's logic
# forward unchanged (table exclusions D-B4b, --restrict-key D130,
# per-file blob-copy loop D129), with the connection method changed:
# network + password (D-C1) instead of `docker exec`, and the blob volume
# mounted directly (D-C2) instead of via a throwaway container. Runs its
# own schedule internally (D-C5) — no host cron.
#
# Covers FIVE databases in one cluster (mjolnir, stabbur, smia, phonexa,
# shadow — D155) and TWO blob-like stores (stabbur's flat content-addressed
# blob volume, and phonexa's nested audio tree). The five dumps are one
# all-or-nothing transaction: a failure in any of them leaves every committed
# .sql untouched and makes no commit at all.
set -euo pipefail

BACKUP_REPO="/data/tun-backup"
SSH_KEY="/root/.ssh/id_backup"
RESTRICT_KEY="tunbackupfixedkey"
INTERVAL="${BACKUP_INTERVAL_SECONDS:-86400}"
# After a FAILED run, not after a successful one. The two intervals used to
# be the same 24 hours: a service whose very first clone failed then sat for
# a full day before trying again, with nothing anywhere saying so. An hour
# is short enough that a fixed key, a restored network or a repaired remote
# is picked up the same morning, and long enough not to hammer a remote that
# is genuinely refusing us.
RETRY_INTERVAL="${BACKUP_RETRY_SECONDS:-3600}"
# Written ONLY when a run completes end to end — commit and push included.
# healthcheck.sh reads it, and that is the whole point: this container was
# "Up 7 hours" with an empty /data and `docker compose ps` could not tell it
# apart from a working one.
STAMP="/data/last-success"

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
  # EMPTY .sql in place, which then got committed and pushed as if it were a
  # real backup. Compounded by a second bug: calling `run_backup` as
  # `run_backup || echo ...` (below) disables `set -e` for the ENTIRE function
  # body, not just the top-level call — a real bash gotcha (&&/||/if suppress
  # errexit recursively for whatever they test, even through a subshell), so
  # the failed dump didn't abort the run either. Hence the atomic
  # dump-to-.tmp-then-rename convention used everywhere in this ecosystem: a
  # failed dump leaves only a `.tmp` behind and `return`s before `git add`
  # ever runs, so the previously-committed .sql is never touched.
  #
  # ALL-OR-NOTHING ACROSS FIVE DATABASES (D155). One cluster now, one
  # connection, one derived password per role. smia is IN THIS SET for the
  # first time — it was never backed up at all, while holding 2.7M rows of
  # imported corpora, and its volume was destroyed once during the monorepo
  # work with no dump to restore from (P41).
  DATABASES="mjolnir stabbur smia phonexa shadow"

  # Per-database table exclusions. mjolnir's job_logs/build_jobs are
  # regenerable machine output. smia's lookup_cache and tts_audio are a cache
  # rebuildable from providers/ and the upstream APIs, and dominate the dump
  # size. EVERY phonexa table is user data — vowel samples' metadata, tokens,
  # settings, users and the Shadowing tables (split points, progress,
  # transcripts); Shadowing recordings are deliberately never stored
  # server-side, so the database IS the Shadowing backup. Do not "optimize"
  # any of phonexa out (D147).
  # smia: SCHEMA ONLY for every bulk table — `--exclude-table-data`, not
  # `--exclude-table`, so a restore still yields a complete, working database
  # that simply starts empty and refills itself.
  #
  # THE 2026-11-13 AUDIT WAS WRONG AND IS CORRECTED HERE (2026-11-14). It
  # said: every excluded smia table is schema, a cache, or "an imported
  # corpus rebuilt by scripts/import_*.py from providers/ — which is itself
  # tracked in git, so smia's real backup is already in the monorepo". That
  # audit was done by reading the table list. Running the import says
  # otherwise:
  #
  #   [bootstrap] skipping scripts.import_nst:
  #       No such file: 'providers/nbno/nb_uttale_leksika.zip'
  #   [bootstrap] skipping scripts.import_leipzig:
  #       No such file: 'providers/leipzig/nob-no_web_2020_1M.tar.gz'
  #   $ ls smia/providers/leipzig/   ->  No such file or directory
  #
  # So the excluded tables split three ways, and the list below is annotated
  # accordingly. Verified by `git ls-files` against every path in
  # smia/scripts/bootstrap.py's _IMPORTS, and re-verified on every run of
  # bin/check-standards.sh (bin/_check_backup_sources.py), which fails if a
  # FOURTH excluded-and-sourceless table ever appears:
  #
  #   A. CACHE — regenerated by use, nothing to restore.
  #        lookup_cache, tts_audio, provider_health
  #      `tts_audio` is disposable for a second, independent reason:
  #      D118/D45 keep the authoritative copy of a CHOSEN tts candidate in
  #      stabbur's blob store, which IS backed up here.
  #
  #   B. REBUILDABLE FROM A FILE TRACKED IN THIS REPOSITORY — the original
  #      claim, true for these and only these. Drop the data, restore, and
  #      smia's bootstrap re-imports each one it finds empty, which is
  #      exactly how it was rebuilt after P41 destroyed its volume:
  #        ordbank_fullform, ordbank_lemma, ordbank_boying, ordbank_paradigme
  #                             <- providers/nbno/20220201_norsk_ordbank_nob_2005.tar.gz
  #        kaikki_entry         <- providers/kaikii/nb.jsonl
  #        ipa_dict_entry       <- providers/open-dict/nb.txt
  #        wikipron_entry       <- providers/wikipron/nob_latn_broad.tsv
  #        pygmalion_audio      <- providers/pygmalion/audio/manifest.jsonl
  #        dictcc_static_entry  <- providers/dict/{no-en,no-de,de-en}.txt
  #        corpus_sentence, for the `tatoeba` rows
  #                             <- providers/tatoeba/nob_sentences.tsv.bz2
  #
  #   C. NOT REBUILDABLE FROM THIS REPOSITORY. Excluded here AND with no
  #      source file in git, so these rows are backed by nothing at all:
  #        nst_lexicon, nst_dialect
  #            need providers/nbno/nb_uttale_leksika.zip, which is NOT in the
  #            tree (only nb_uttale_tillegg.zip is), so import_nst is skipped
  #            entirely on every boot
  #        corpus_sentence, for the `web_2020`/`news_2013`/`wikipedia_2014`
  #        (Leipzig) rows
  #            need providers/leipzig/*.tar.gz; that directory does not exist
  #      All three are 0 rows TODAY (measured 2026-11-14), so nothing is lost
  #      yet — this is a trap, not a loss. The moment someone drops those
  #      archives in and lets the import run, the rows exist and no backup
  #      covers them.
  #
  #      DELIBERATELY STILL EXCLUDED, not an oversight. Both sources are
  #      public re-downloads (Språkbanken for NST, Wortschatz Leipzig for the
  #      corpora) and both are large: a populated Leipzig import is ~3M
  #      sentences, and every run here COMMITS to a git repository, so
  #      including them would grow the backup repo by hundreds of megabytes a
  #      day for data an operator can fetch again. The decision is "cheap to
  #      re-obtain, expensive to store", NOT "already in the monorepo" — that
  #      is the claim that was false.
  #
  #      corpus_sentence cannot be split: pg_dump excludes a TABLE's data, not
  #      a subset of its rows, and tatoeba and Leipzig share one table (D4).
  #      It is excluded as a whole, which is category B for its tatoeba rows
  #      and category C for its Leipzig rows.
  #
  # This is task 0.8's decision, made explicitly rather than by omission. It
  # takes smia.sql from ~225 MB to a few hundred KB — and every run COMMITS to
  # a git repository, so a 225 MB daily commit of regenerable corpora would
  # bloat the backup repo indefinitely for data the repo already holds in
  # source form.
  SMIA_DERIVED="lookup_cache tts_audio provider_health corpus_sentence
                dictcc_static_entry ipa_dict_entry kaikki_entry nst_dialect
                nst_lexicon ordbank_boying ordbank_fullform ordbank_lemma
                ordbank_paradigme pygmalion_audio wikipron_entry"

  exclusions_for() {
    case "$1" in
      mjolnir) echo "--exclude-table-data=job_logs --exclude-table-data=build_jobs" ;;
      smia)    for t in $SMIA_DERIVED; do printf -- "--exclude-table-data=%s " "$t"; done ;;
      *)       echo "" ;;
    esac
  }

  clean_tmp() {
    for db in $DATABASES; do rm -f "$BACKUP_REPO/$db.sql.tmp"; done
  }

  for db in $DATABASES; do
    log "entrypoint: dumping $db..."
    # Derived, never typed — the same rule postgres/init/bootstrap.sh used to
    # create the role: "<POSTGRES_PASSWORD>_<db>".
    if ! PGPASSWORD="${POSTGRES_PASSWORD}_${db}" pg_dump -h postgres -U "$db" \
        --restrict-key="$RESTRICT_KEY" \
        --no-owner \
        --no-privileges \
        --no-tablespaces \
        $(exclusions_for "$db") \
        "$db" > "$BACKUP_REPO/$db.sql.tmp"; then
      log "entrypoint: $db dump failed — aborting this run, every committed .sql left untouched" >&2
      clean_tmp
      return 1
    fi
    # A dump that succeeded but produced nothing is still a failed backup.
    # pg_dump exits 0 on an empty database, and committing that over a good
    # file is precisely the "failure reports success" shape this ecosystem
    # keeps producing.
    if [ ! -s "$BACKUP_REPO/$db.sql.tmp" ]; then
      log "entrypoint: FATAL $db dump is empty — aborting" >&2
      clean_tmp
      return 1
    fi
  done

  # All five dumps succeeded — only now do the real, previously-committed
  # filenames ever change.
  for db in $DATABASES; do
    mv "$BACKUP_REPO/$db.sql.tmp" "$BACKUP_REPO/$db.sql" \
      || { log "entrypoint: FATAL rename of $db.sql failed" >&2; return 1; }
  done

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

# One place to record success, called on every path that really finished.
stamp_success() {
  date -u +%s > "$STAMP"
}

: "${BACKUP_REPO_URL:?set BACKUP_REPO_URL}"
: "${POSTGRES_PASSWORD:?set POSTGRES_PASSWORD in the root .env}"

# RUN_ONCE=1 runs the backup exactly once and exits — used for testing and
# for triggering a manual backup on demand (e.g. `docker compose run --rm
# -e RUN_ONCE=1 backup`) without waiting for the schedule.
if [ "${RUN_ONCE:-}" = "1" ]; then
  run_backup
  stamp_success
  exit 0
fi

while true; do
  if run_backup; then
    stamp_success
    sleep_for="$INTERVAL"
  else
    log "entrypoint: run FAILED — nothing was backed up this cycle; this container is now UNHEALTHY" >&2
    sleep_for="$RETRY_INTERVAL"
  fi
  next_run=$(date -u -d "+${sleep_for} seconds" +%Y-%m-%dT%H:%M:%SZ)
  log "entrypoint: sleeping ${sleep_for}s, next run at $next_run"
  sleep "$sleep_for"
done
