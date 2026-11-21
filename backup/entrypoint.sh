#!/usr/bin/env bash
# compose-backup-service's entrypoint — carries bin/backup.sh's logic
# forward unchanged (table exclusions D-B4b, --restrict-key D130,
# per-file blob-copy loop D129), with the connection method changed:
# network + password (D-C1) instead of `docker exec`, and the blob volume
# mounted directly (D-C2) instead of via a throwaway container. Runs its
# own schedule internally (D-C5) — no host cron.
#
# Covers FOUR databases in one cluster (mjolnir, stabbur, phonexa,
# shadow — D155) and TWO blob-like stores (stabbur's flat content-addressed
# blob volume, and phonexa's nested audio tree). The five dumps are one
# all-or-nothing transaction: a failure in any of them leaves every committed
# .sql untouched and makes no commit at all.
set -euo pipefail

BACKUP_REPO="/data/tun-backup"
SSH_KEY="/root/.ssh/id_backup"
RESTRICT_KEY="tunbackupfixedkey"
# SEED VALUES NOW, NOT THE LIVE SCHEDULE (backup-console task 4). The live
# interval is the one stored in $SETTINGS_FILE on the state volume and edited
# from /backup/; these two variables are consulted only while nothing has been
# stored, so no setting exists as a live value in two places (D151). They are
# read in exactly one place below, SEED_INTERVAL/SEED_RETRY.
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

# ---- THE DEV REMOTE (backup-console task 1) --------------------------------
# Measured 2026-11-20, before this existed: in dev BACKUP_REPO_URL is the
# placeholder `git@github.com:example/tun-backup.git` with BACKUP_SSH_KEY_PATH
# pointing at /dev/null, so this service had NEVER completed a single run on
# the operator's machine — `tun-backup-1` was `unhealthy`, failing to clone
# every hour since boot. Nothing about run history, commit history or the
# health banner can be verified against a service that never ran.
#
# So: when BACKUP_REPO_URL is a LOCAL ABSOLUTE PATH, create it as a **bare**
# repository if it is not one yet. Bare is not a detail — you cannot push to a
# non-bare repository's checked-out branch, so a plain directory as the remote
# fails at the last step of the run, which is the step most worth exercising.
#
# PRODUCTION IS UNTOUCHED AND CANNOT REACH THIS. The guard is the shape of the
# URL: `git@github.com:...` is not an absolute path, so every line below is
# dead code on the VPS. No new variable, no new mode flag, nothing to forget
# to switch off — the dev configuration IS `BACKUP_REPO_URL=/dev-remote/...`
# in the root .env (see .env.example).
#
# It also seeds ONE commit on `main`. An empty bare repo clones with an unborn
# HEAD and no upstream, and `git push --quiet` with no upstream is a fatal
# error — so a freshly initialised, commit-less remote would fail the first
# run for a reason that has nothing to do with the backup. Found by running
# it, not by reading it.
init_local_remote_if_needed() {
  case "$BACKUP_REPO_URL" in
    /*) ;;
    *) return 0 ;;   # a real remote (ssh/https) — nothing to do, ever
  esac
  if [ -d "$BACKUP_REPO_URL" ] && git -C "$BACKUP_REPO_URL" rev-parse --is-bare-repository >/dev/null 2>&1; then
    return 0
  fi
  if [ -e "$BACKUP_REPO_URL" ] && [ ! -d "$BACKUP_REPO_URL" ]; then
    log "entrypoint: FATAL BACKUP_REPO_URL=$BACKUP_REPO_URL exists and is not a directory" >&2
    return 1
  fi
  log "entrypoint: BACKUP_REPO_URL is a local path — initialising a bare dev remote at $BACKUP_REPO_URL"
  # Every step checked explicitly, exactly like the clone below and for the
  # same errexit-suppression reason documented there.
  mkdir -p "$BACKUP_REPO_URL" || { log "entrypoint: FATAL mkdir $BACKUP_REPO_URL failed" >&2; return 1; }
  git init --bare --initial-branch=main "$BACKUP_REPO_URL" >/dev/null \
    || { log "entrypoint: FATAL git init --bare failed" >&2; return 1; }
  seed=$(mktemp -d) || { log "entrypoint: FATAL mktemp for the remote seed failed" >&2; return 1; }
  if ! (
        set -e
        git -C "$seed" init --initial-branch=main -q
        git -C "$seed" config user.email "backup@tun.local"
        git -C "$seed" config user.name "tun git-backup"
        printf 'local dev remote for the tun backup service\n' > "$seed/README.md"
        git -C "$seed" add README.md
        git -C "$seed" commit -q -m "initialise the local dev backup remote"
        git -C "$seed" push -q "$BACKUP_REPO_URL" main:main
      ); then
    log "entrypoint: FATAL seeding the local dev remote failed" >&2
    rm -rf "$seed"
    return 1
  fi
  rm -rf "$seed"
  log "entrypoint: local dev remote ready (bare, one commit on main)"
}

# ---- THE ACCOUNT EXPORT (userdata-git-history task 2) ----------------------
# ONE MUTABLE FILE PER ACCOUNT, `userdata/<uid>.json`, overwritten in place on
# every run so that GIT'S OWN HISTORY is the history of the document.
#
# WHY THIS EXISTS AT ALL, measured 2026-11-20 against the committed backup:
# `mjolnir.sql` was 44 MB, of which `userdata_history`'s COPY block was
# **42.4 MB across 82 rows** (~517 KB each) — every other dump in the
# ecosystem combined was ~2 MB, and the repo's `.git` had reached 106 MB over
# 88 commits. `userdata_history` appends a COMPLETE copy of the account
# document on every PATCH, the device PATCHes on every sync, and the whole
# table was re-dumped and re-committed daily. Essentially the entire backup
# repository was redundant copies of one account's progress. A mutable file
# plus a version-control system is what that append-only table was badly
# reimplementing.
#
# WHY THIS SERVICE AND NOT mjolnir-sync OR hub (design §2). A filesystem write
# in the device-plane request path is forbidden — `docs/11-ota-contract.md` is
# frozen. hub would need a scheduler, a volume shared between two projects,
# and a second writer to coordinate with this run; and an export and a commit
# made by two different processes can disagree about what was archived. This
# service already connects to Postgres with a derived password, already has
# `psql`, and already owns the clone and the commit — so the file and the
# commit cannot drift apart. One writer, no new process, nothing in the device
# path.
#
# SERIALIZED BY POSTGRES ITSELF, `jsonb_pretty` (design §3). `jq` is NOT in
# this image (verified) and adding a dependency to the one container holding
# the SSH deploy key is a cost worth avoiding. jsonb_pretty emits keys in
# jsonb's STORED order — by length, then bytewise — recursively, and expands
# arrays one element per line. That is **stable**, which is the only property
# git needs; it is NOT alphabetical, and "fixing" it to alphabetical later
# would rewrite every line of every file and produce one enormous diff for no
# gain. The consequence that makes the whole design work: `totalCards` is an
# array of card objects, so one card's `Stage` changing is ONE line in the
# diff rather than an opaque half-megabyte blob.
#
# Every step is checked explicitly, and all of it is all-or-nothing, for the
# same errexit-suppression reason the dump section below documents at length:
# `run_backup` is called from `if`/`||`, which disables errexit for the entire
# function body recursively.
export_userdata() {
  local dir="$BACKUP_REPO/userdata" uids uid count=0
  mkdir -p "$dir" || { log "entrypoint: FATAL mkdir userdata failed" >&2; return 1; }

  # The uid list first, as its own checked step. A failure here (an
  # unreachable database, a revoked SELECT) must abort the run — an empty
  # account list would otherwise be indistinguishable from "every account
  # left the table" and would PRUNE every committed export. That is the
  # failure-reports-success shape this whole file is written against.
  if ! uids=$(PGPASSWORD="${POSTGRES_PASSWORD}_mjolnir" psql -h postgres -U mjolnir -d mjolnir \
        -v ON_ERROR_STOP=1 -At -c "SELECT device_id FROM userdata ORDER BY device_id"); then
    log "entrypoint: FATAL could not list accounts for the userdata export — aborting this run" >&2
    return 1
  fi

  while IFS= read -r uid; do
    [ -n "$uid" ] || continue
    # THE FILENAME IS DERIVED FROM DATA, so it is validated rather than
    # trusted: the same shape mjolnir-sync's own UID_RE allows. A uid holding
    # a slash or `..` would write outside `userdata/`, and the right answer is
    # to FAIL the run — a surprise uid is a surprise about the device plane,
    # not something to silently skip or sanitise.
    case "$uid" in
      *[!A-Za-z0-9._:@-]*|''|.|..)
        log "entrypoint: FATAL account id '$uid' is not a plain uid — refusing to derive a filename from it" >&2
        return 1 ;;
    esac
    # `-v uid=...` + `:'uid'` so the value is quoted by psql, never
    # interpolated into SQL by this shell.
    #
    # THE QUERY GOES IN ON STDIN, NOT VIA `-c`, and that is not a style
    # choice. psql expands `:'uid'` only in input it reads as a script; a
    # `-c` string is passed to the server verbatim, so the first live run of
    # this step failed with `syntax error at or near ":"`. Found by running
    # it, not by reading it.
    #
    # Written to `.json.tmp` and renamed only once EVERY account succeeded:
    # `cmd > file` truncates `file` before `cmd` runs, so a failed query
    # would otherwise leave an empty, committable file where a real export
    # used to be — found live on the first VPS run of the dumps, and the same
    # trap applies verbatim here.
    if ! printf '%s\n' "SELECT jsonb_pretty(doc) FROM userdata WHERE device_id = :'uid';" \
        | PGPASSWORD="${POSTGRES_PASSWORD}_mjolnir" psql -h postgres -U mjolnir -d mjolnir \
          -v ON_ERROR_STOP=1 -v uid="$uid" -At \
          > "$dir/$uid.json.tmp"; then
      log "entrypoint: FATAL export of account $uid failed — aborting this run, every committed export left untouched" >&2
      return 1
    fi
    # A query that succeeded but produced nothing is still a failed export:
    # `jsonb_pretty(NULL)` is NULL and prints as an empty line, so an empty
    # file means the row vanished between the two queries or `doc` is NULL.
    # Committing that over a real document is a silent data loss.
    if [ ! -s "$dir/$uid.json.tmp" ]; then
      log "entrypoint: FATAL export of account $uid is empty — aborting" >&2
      return 1
    fi
    count=$((count + 1))
  done <<EOF
$uids
EOF

  for uid in $uids; do
    [ -n "$uid" ] || continue
    mv "$dir/$uid.json.tmp" "$dir/$uid.json" \
      || { log "entrypoint: FATAL rename of userdata/$uid.json failed" >&2; return 1; }
  done

  # Prune the export of an account that has LEFT the table, exactly as the
  # loop below prunes the dump of a database that left the backup set — and
  # for the same reason: a file that sits in the repo forever, dated and
  # plausible, reads as a current archive of an account nothing exports any
  # more. Safe only because the uid list above is a CHECKED step: this line is
  # never reached with an empty list caused by a failure.
  local pruned=0 name path
  for path in "$dir"/*.json; do
    [ -e "$path" ] || continue
    name=$(basename "$path" .json)
    case "
$uids
" in
      *"
$name
"*) ;;
      *) log "entrypoint: account $name is no longer in the userdata table - pruning userdata/$name.json"
         rm -f "$path"
         pruned=$((pruned + 1)) ;;
    esac
  done
  log "  userdata/: $count account(s) exported$( [ "$pruned" -gt 0 ] && printf ', %s pruned' "$pruned" )"
}

run_backup() {
  if [ ! -d "$BACKUP_REPO/.git" ]; then
    init_local_remote_if_needed || { log "entrypoint: FATAL could not prepare the local dev remote" >&2; return 1; }
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
  # smia is DELIBERATELY NOT IN THIS SET (operator decision, 2026-11-14):
  # "remove smia from backup completely, it's totally rebuildable". Every
  # table it holds is either a cache (lookup_cache, tts_audio, provider_health)
  # or an imported corpus re-imported by smia/scripts/import_*.py on boot.
  # A pre-cutover full dump is retained off-host as the one historical copy;
  # nothing here produces a new one. If smia's volume is lost, the recovery
  # is a re-import, not a restore - and that means the provider archives are
  # the thing to keep safe, NOT this backup set. See DEPLOY.md.
  DATABASES="mjolnir stabbur phonexa shadow"

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
  # SMIA_DERIVED is gone with smia itself. For the record, it listed every
  # table that made smia's dump large: lookup_cache, tts_audio,
  # provider_health, corpus_sentence, dictcc_static_entry, ipa_dict_entry,
  # kaikki_entry, nst_dialect, nst_lexicon, ordbank_{boying,fullform,lemma,
  # paradigme}, pygmalion_audio, wikipron_entry. That is every table smia
  # has, which is exactly why dumping it at all was pointless.

  # userdata-git-history: `userdata` and `userdata_history` join mjolnir's
  # exclusion list, and they are a DIFFERENT CATEGORY from job_logs /
  # build_jobs. Those two are regenerable machine output with nothing to
  # restore. These two hold the operator's actual learning progress, and they
  # are excluded because the SAME DATA IS ARCHIVED BETTER somewhere else in
  # this very repository — `userdata/<uid>.json`, written by export_userdata
  # above, in the same run, before the same commit.
  #
  # `--exclude-table-data`, never `--exclude-table`: a restore still yields a
  # COMPLETE, working database whose two account tables simply start empty and
  # are refilled from the export (DEPLOY.md §7, and the /backup/ page's
  # restore step 2). Dropping the schema would make the restored database
  # broken rather than empty.
  #
  # `userdata_history` is not restored at all, and that is deliberate: it is a
  # rolling 48h window feeding the console's per-PATCH tier, not an archive.
  # It was 42.4 MB of a 44 MB dump (82 rows, ~517 KB each, measured
  # 2026-11-20) because it appends a complete copy of the account document on
  # every single PATCH.
  #
  # ORDERING, NOT A PREFERENCE: this line may only exist because the export is
  # already written, already committed, and already demonstrated to restore.
  # A dump that still carries the data is merely large; account data excluded
  # with no archive behind it is gone.
  exclusions_for() {
    case "$1" in
      mjolnir) echo "--exclude-table-data=job_logs --exclude-table-data=build_jobs --exclude-table-data=userdata --exclude-table-data=userdata_history" ;;
      # smia) retired - smia is no longer dumped at all (see DATABASES).
      *)       echo "" ;;
    esac
  }

  clean_tmp() {
    for db in $DATABASES; do rm -f "$BACKUP_REPO/$db.sql.tmp"; done
    # userdata-git-history: the account export writes `.json.tmp` beside the
    # committed files for exactly the same reason the dumps do, so a failed
    # run must leave none of them behind either.
    rm -f "$BACKUP_REPO/userdata"/*.json.tmp 2>/dev/null || true
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

  # THE ACCOUNT EXPORT, IN THE SAME RUN THAT COMMITS IT (userdata-git-history
  # task 2.1). Before the commit, after the dumps — so the export and the
  # commit cannot disagree about what was archived. A failure here aborts the
  # run with nothing staged, like every other step.
  log "entrypoint: exporting account documents..."
  if ! export_userdata; then
    clean_tmp
    return 1
  fi

  cd "$BACKUP_REPO" || { log "entrypoint: FATAL cd $BACKUP_REPO failed" >&2; return 1; }
  # Prune a dump whose database has LEFT the backup set. Without this, the
  # file sits in the repo forever, dated and plausible, reading as a current
  # backup of a database nothing dumps any more - which is the whole
  # failure-reports-success shape this file keeps running into. Found live:
  # removing smia from DATABASES left a committed smia.sql behind.
  for f in "$BACKUP_REPO"/*.sql; do
    [ -e "$f" ] || continue
    name=$(basename "$f" .sql)
    case " $DATABASES " in
      *" $name "*) ;;
      *) log "entrypoint: $name is no longer in the backup set - pruning $name.sql"
         rm -f "$f" ;;
    esac
  done

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

# ---- THE STATE VOLUME (backup-console tasks 3-5) ---------------------------
# Run records, each run's captured log, the three editable settings and the
# manual-run REQUEST all live on a second volume, mounted at /state. This loop
# writes them; backup-console reads them.
#
# WHY FILES AND NOT POSTGRES, which is not a preference. This service's entire
# job is dumping Postgres, so the run that most needs to be recorded is the one
# that failed BECAUSE Postgres was unreachable — and a Postgres-backed run log
# cannot record it. Storing the backup's own history inside the thing being
# backed up would also mean a restore rewrites the history of its own
# restoration.
#
# WHY A SECOND VOLUME AND NOT /data. /data holds the git clone, and the clone
# has exactly ONE writer: this loop. The console has to be able to write a run
# request without being able to write the clone at all — so it gets /state
# read-write and /data READ-ONLY. The single-writer rule is then enforced by
# the mount rather than by remembering; two writers against one git working
# tree is a race whose failure mode is a corrupt backup.
STATE_DIR="/state"
RUNS_DIR="$STATE_DIR/runs"
SETTINGS_FILE="$STATE_DIR/settings.json"
REQUEST_FILE="$STATE_DIR/run-request"
CLAIM_FILE="$STATE_DIR/run-claimed"
HEARTBEAT_FILE="$STATE_DIR/scheduler.json"
# How often the sleep wakes to look for a request and re-read the settings.
# The whole reason the sleep is not one long `sleep "$INTERVAL"` any more: a
# requested run would otherwise wait up to a full interval — 24 hours — and
# the console's button would be indistinguishable from a broken one.
TICK=5

# THE THREE SETTINGS, AND WHERE THEIR VALUES COME FROM (D151).
#
# Each of them lives in exactly ONE authoritative place: $SETTINGS_FILE on the
# state volume. The environment variables below are SEED values, consulted
# only while nothing has been stored — never allowed to override a stored
# value. That is the whole of D151 applied to a runtime-editable setting: the
# live value is in one file, and `.env` is a first-boot default, not a second
# copy.
#
# What stays environment-only and is never editable from the page:
# BACKUP_REPO_URL, BACKUP_SSH_KEY_PATH, POSTGRES_PASSWORD. A UI that can
# repoint the backup remote is a UI that can silently stop backing up.
SEED_INTERVAL="$INTERVAL"
SEED_RETRY="$RETRY_INTERVAL"
SEED_RETENTION="${BACKUP_RUN_RETENTION:-40}"

# Reads one integer setting. `$1` = key, `$2` = its seed. A missing file, a
# missing key, or a non-numeric value all fall back to the seed: a corrupt
# settings file must degrade to the documented default, never to an empty
# interval that would turn the schedule into a spin loop.
setting() {
  local value=""
  if [ -f "$SETTINGS_FILE" ]; then
    value=$(sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\([0-9][0-9]*\).*/\1/p" "$SETTINGS_FILE" | head -1)
  fi
  case "$value" in
    ''|*[!0-9]*) value="$2" ;;
  esac
  [ "$value" -gt 0 ] 2>/dev/null || value="$2"
  printf '%s' "$value"
}

# Seeds the file from the environment ONCE, and only when nothing is stored.
# Written atomically (tmp + mv) for the same reason every write here is: the
# console may be reading it at any moment, and half a settings file reads as a
# corrupt one.
seed_settings() {
  [ -f "$SETTINGS_FILE" ] && return 0
  log "entrypoint: no stored settings — seeding $SETTINGS_FILE from the environment"
  cat > "$SETTINGS_FILE.tmp" <<EOF
{
  "interval_seconds": $SEED_INTERVAL,
  "retry_seconds": $SEED_RETRY,
  "run_retention": $SEED_RETENTION,
  "updated_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "updated_by": "environment seed"
}
EOF
  mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
}

# The scheduler's heartbeat: what the loop is doing right now, and when the
# next run is due. backup-console reads it to tell QUEUED from RUNNING, and
# treats a stale one as "the backup service's state cannot be determined" —
# which is the honest answer when the container is stopped, and better than a
# page that implies a scheduler is waiting when none is.
heartbeat() {
  local state="$1" due="$2" reason="$3" run_id="$4"
  cat > "$HEARTBEAT_FILE.tmp" <<EOF
{
  "updated_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "updated_epoch": $(date -u +%s),
  "state": "$state",
  "current_run": $( [ -n "$run_id" ] && printf '"%s"' "$run_id" || printf 'null' ),
  "next_run_epoch": ${due:-null},
  "next_run_reason": "$reason",
  "interval_seconds": $(setting interval_seconds "$SEED_INTERVAL"),
  "retry_seconds": $(setting retry_seconds "$SEED_RETRY"),
  "run_retention": $(setting run_retention "$SEED_RETENTION"),
  "tick_seconds": $TICK
}
EOF
  mv "$HEARTBEAT_FILE.tmp" "$HEARTBEAT_FILE"
}

# JSON string escaping, for the one field that carries free text (the
# summary). Backslash first, then quote, then the control characters a log
# line can really contain.
json_string() {
  printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/\t/\\t/g' | tr -d '\r\n'
}

# What the backup repository holds right now, as JSON. Deliberately derived
# from the REPO rather than from the list of databases: every `*.sql` at the
# top level and every top-level directory, so a source added later (the
# committed `userdata/` export, next change) appears here with no edit.
repo_sources_json() {
  local first=1 path name bytes files
  printf '{'
  for path in "$BACKUP_REPO"/*.sql; do
    [ -e "$path" ] || continue
    name=$(basename "$path")
    bytes=$(wc -c < "$path" | tr -d ' ')
    [ "$first" -eq 1 ] || printf ','
    first=0
    printf '"%s":{"bytes":%s}' "$name" "$bytes"
  done
  for path in "$BACKUP_REPO"/*/; do
    [ -d "$path" ] || continue
    name=$(basename "$path")
    case "$name" in .git) continue ;; esac
    files=$(find "$path" -type f ! -path '*/.git/*' | wc -l | tr -d ' ')
    bytes=$(du -sb "$path" 2>/dev/null | cut -f1)
    [ "$first" -eq 1 ] || printf ','
    first=0
    printf '"%s/":{"bytes":%s,"files":%s}' "$name" "${bytes:-0}" "$files"
  done
  printf '}'
}

# ONE RECORD PER RUN, AND FOUR OUTCOMES RATHER THAN TWO.
#
# `run_backup` already produces four distinct endings and they are not the
# same fact:
#
#   committed       dumps changed, commit and push both returned
#   no-changes      dumps byte-identical, nothing committed. NOT a failure
#   push-recovered  a PREVIOUS run committed and failed to push, and this run
#                   pushed it ("pushed previously-committed backups"). It must
#                   not be flattened into no-changes: the operator needs to
#                   see that the remote WAS stale and now is not
#   failed          any step returned non-zero; nothing committed this cycle
#
# They are read off the run's own log lines, which are the stable strings
# `run_backup` logs, rather than by changing `run_backup` to report them.
# Nothing in the backup path is altered to make it observable — the manual
# button and the schedule have to be the same code, and that is easiest to
# guarantee by not touching it at all.
write_record() {
  local run_id="$1" trigger="$2" rc="$3" started_epoch="$4" started_at="$5" log_file="$6"
  local finished_epoch finished_at outcome summary head_sha parent_sha unpushed pushed repo_bytes git_bytes
  finished_epoch=$(date -u +%s)
  finished_at=$(date -u +%Y-%m-%dT%H:%M:%SZ)

  if [ "$rc" -ne 0 ]; then
    outcome="failed"
    # The last FATAL line is the cause; failing that, the last line at all.
    summary=$(grep -a 'FATAL' "$log_file" 2>/dev/null | tail -1)
    [ -n "$summary" ] || summary=$(tail -1 "$log_file" 2>/dev/null)
  elif grep -aq 'pushed previously-committed backups' "$log_file" 2>/dev/null; then
    outcome="push-recovered"
    summary="pushed a previously-committed backup — the remote was stale and is now current"
  elif grep -aq 'committed and pushed' "$log_file" 2>/dev/null; then
    outcome="committed"
    summary="committed and pushed"
  elif grep -aq 'no changes, nothing to commit' "$log_file" 2>/dev/null; then
    outcome="no-changes"
    summary="every dump byte-identical and no new files — nothing to commit"
  else
    # An exit status of 0 with none of the four known endings in the log means
    # the log and the exit code disagree. Recorded as its own outcome rather
    # than guessed at: "reported success, said nothing" is the exact shape
    # this whole file is written against.
    outcome="unknown"
    summary="the run exited 0 but logged none of the known endings — read the log"
  fi

  head_sha=$(git -C "$BACKUP_REPO" rev-parse --short HEAD 2>/dev/null || true)
  parent_sha=$(git -C "$BACKUP_REPO" rev-parse --short HEAD^ 2>/dev/null || true)
  unpushed=$(git -C "$BACKUP_REPO" rev-list --count '@{u}..HEAD' 2>/dev/null || echo "")
  case "$unpushed" in ''|*[!0-9]*) unpushed="null"; pushed="null" ;;
    0) pushed="true" ;;
    *) pushed="false" ;;
  esac
  repo_bytes=$(du -sb --exclude=.git "$BACKUP_REPO" 2>/dev/null | cut -f1)
  git_bytes=$(du -sb "$BACKUP_REPO/.git" 2>/dev/null | cut -f1)

  cat > "$RUNS_DIR/$run_id.json.tmp" <<EOF
{
  "id": "$run_id",
  "trigger": "$trigger",
  "outcome": "$outcome",
  "exit_code": $rc,
  "started_at": "$started_at",
  "started_epoch": $started_epoch,
  "finished_at": "$finished_at",
  "duration_seconds": $(( finished_epoch - started_epoch )),
  "summary": "$(json_string "$summary")",
  "head": "${head_sha:-}",
  "parent": "${parent_sha:-}",
  "unpushed": $unpushed,
  "pushed": $pushed,
  "repo_bytes": ${repo_bytes:-0},
  "git_bytes": ${git_bytes:-0},
  "sources": $(repo_sources_json),
  "log": "runs/$run_id.log"
}
EOF
  mv "$RUNS_DIR/$run_id.json.tmp" "$RUNS_DIR/$run_id.json"
  log "entrypoint: recorded run $run_id as $outcome (trigger $trigger)"
}

# Retention is one of the three editable settings, so the state volume cannot
# grow without bound. It prunes RUN RECORDS AND THEIR LOGS ONLY — the backup
# repository's commits are never pruned by anything here.
#
# Counted in runs rather than days, deliberately: "keep the last N runs" is a
# statement an operator can verify by looking, and it is what the acceptance
# criterion for this setting is written against. A day-based window on a
# service that runs once a day is a setting whose effect cannot be observed.
prune_runs() {
  local keep count victim
  keep=$(setting run_retention "$SEED_RETENTION")
  count=$(ls -1 "$RUNS_DIR"/*.json 2>/dev/null | wc -l | tr -d ' ')
  [ "$count" -gt "$keep" ] || return 0
  # Run ids are UTC timestamps, so a plain sort is chronological.
  for victim in $(ls -1 "$RUNS_DIR"/*.json 2>/dev/null | sort | head -n $(( count - keep ))); do
    rm -f "$victim" "${victim%.json}.log"
  done
  log "entrypoint: pruned $(( count - keep )) run record(s), retention is $keep"
}

# A full run, recorded. The backup itself is `run_backup`, UNCHANGED and
# unparameterised: a manual run and a scheduled run differ only in the
# `trigger` field written here, which is the entire point — a button that took
# its own code path would be testing a path the schedule never uses, and the
# operator presses it precisely to check that the schedule works.
#
# `if run_backup ... ; then` keeps the existing caller shape, including its
# documented gotcha: `if`/`||` suppress errexit for the whole function body
# recursively, which is why every step inside `run_backup` is checked
# explicitly. Do not "simplify" any of those checks away.
recorded_run() {
  local trigger="$1" run_id started_epoch started_at log_file rc
  started_epoch=$(date -u +%s)
  started_at=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  run_id=$(date -u -d "@$started_epoch" +%Y%m%dT%H%M%SZ)
  mkdir -p "$RUNS_DIR"
  log_file="$RUNS_DIR/$run_id.log"
  : > "$log_file"
  heartbeat running "" "$trigger" "$run_id"
  # tee, not a redirect: the line has to reach the container log AND the run's
  # own log file AS IT HAPPENS, because the console follows a run in progress
  # by reading this file. PIPESTATUS is not consulted — `if` on the pipeline
  # with pipefail set already yields run_backup's own status.
  if run_backup 2>&1 | tee -a "$log_file"; then
    rc=0
  else
    rc=$?
  fi
  write_record "$run_id" "$trigger" "$rc" "$started_epoch" "$started_at" "$log_file"
  prune_runs
  return "$rc"
}

# Did the console ask for a run? The request is a FILE the console writes and
# this function takes ownership of by renaming it — so the window in which a
# request exists but no run has started is visible to the console as QUEUED,
# and claiming it is a single atomic operation rather than a read-then-delete
# two services could race.
claim_request() {
  [ -f "$REQUEST_FILE" ] || return 1
  mv -f "$REQUEST_FILE" "$CLAIM_FILE" 2>/dev/null || return 1
  return 0
}

# The interruptible sleep. Short ticks instead of one long sleep, because a
# requested run must be picked up in seconds, and because re-reading the
# settings each tick is what makes a saved interval take effect with no
# restart: the due time is recomputed from the stored value every few seconds,
# so shortening the interval can even make the next run due immediately.
sleep_until_due() {
  local cycle_end="$1" reason="$2" interval due now
  while true; do
    if [ "$reason" = "retry" ]; then
      interval=$(setting retry_seconds "$SEED_RETRY")
    else
      interval=$(setting interval_seconds "$SEED_INTERVAL")
    fi
    due=$(( cycle_end + interval ))
    now=$(date -u +%s)
    heartbeat sleeping "$due" "$reason" ""
    if [ -f "$REQUEST_FILE" ]; then
      log "entrypoint: a run was requested from the console — picking it up now"
      return 0
    fi
    [ "$now" -ge "$due" ] && return 0
    sleep "$TICK"
  done
}

# One place to record success, called on every path that really finished.
stamp_success() {
  date -u +%s > "$STAMP"
}

: "${BACKUP_REPO_URL:?set BACKUP_REPO_URL}"
: "${POSTGRES_PASSWORD:?set POSTGRES_PASSWORD in the root .env}"

# The state volume has to exist before anything records anything into it. It
# is created rather than asserted: an empty volume is the normal first-boot
# state, and refusing to start on it would mean the console cannot report
# "nothing has run yet" — which is exactly the state this service was found in.
mkdir -p "$RUNS_DIR"
seed_settings

# RUN_ONCE=1 runs the backup exactly once and exits — used for testing and
# for triggering a manual backup on demand (e.g. `docker compose run --rm
# -e RUN_ONCE=1 backup`) without waiting for the schedule.
#
# NOTE FOR THE CONSOLE'S SAKE: this is NOT how the page's "Run now" works. A
# `docker compose run` is a SECOND container against the same clone, i.e. a
# second writer, which is the one thing the single-writer rule forbids. The
# page writes $REQUEST_FILE and this loop performs the run. This flag stays
# because it is useful from a shell, where the operator can see that the
# scheduler is idle.
if [ "${RUN_ONCE:-}" = "1" ]; then
  if recorded_run once; then
    stamp_success
    exit 0
  fi
  exit 1
fi

trigger="boot"
while true; do
  if recorded_run "$trigger"; then
    stamp_success
    reason="schedule"
  else
    log "entrypoint: run FAILED — nothing was backed up this cycle; this container is now UNHEALTHY" >&2
    reason="retry"
  fi
  # The request this cycle may have served is consumed only now, so the
  # console reports a requested run as in progress until it has really
  # finished, and never as finished before it has.
  rm -f "$CLAIM_FILE"
  cycle_end=$(date -u +%s)
  # The interval is read from the STORED setting inside sleep_until_due, on
  # every tick — not captured once at boot. The two INTERVAL/RETRY_INTERVAL
  # variables at the top of this file are now seeds for $SETTINGS_FILE and
  # nothing else reads them.
  if [ "$reason" = "retry" ]; then
    sleep_for=$(setting retry_seconds "$SEED_RETRY")
  else
    sleep_for=$(setting interval_seconds "$SEED_INTERVAL")
  fi
  next_run=$(date -u -d "+${sleep_for} seconds" +%Y-%m-%dT%H:%M:%SZ)
  log "entrypoint: sleeping up to ${sleep_for}s, next run at $next_run (waking every ${TICK}s to check for a requested run)"
  sleep_until_due "$cycle_end" "$reason"
  if claim_request; then
    trigger="manual"
  else
    trigger="schedule"
  fi
done
