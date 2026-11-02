## Why

The operator has real, irreplaceable data at risk with no automated backup
today: `mjolnir`'s `DEPLOY.md` documents what *should* be backed up (P24)
but describes it as a manual step — "the one that gets forgotten" — and
nothing automated exists; `stabbur` has no backup documentation or
mechanism at all. Ranked by irreplaceability: `stabbur`'s Postgres (notes,
grammar rules — authored content with zero other copy) and its blob store
(canonical audio, D45) sit alongside `mjolnir/hub`'s Postgres (`card_slots`/
`occurrence_shipments`, whose permanent-id guarantee — D22/D23 — would be
unrecoverable if lost even though the underlying content survives in
stabbur; `userdata`/`userdata_history`, the operator's actual synced SRS
progress). A single, unified, data-agnostic backup mechanism covering both
services' databases plus stabbur's canonical blobs — explicitly skipping
`mjolnir`'s own `data/blob/` (a rebuildable cache of stabbur's copies, not a
canonical source) — closes this with no new application code in either
repo.

## What Changes

- **New `tun/bin/backup.sh`, triggered by a host `cron` entry** (not a job
  inside `builder`, not new code in `stabbur` — both were considered and
  rejected, see `design.md`; not a new long-lived Docker service either —
  revised once the operator had already cloned the backup repo directly on
  the host, see below). Shells out to `docker compose exec` to reach
  `mjolnir-postgres` and `stabbur-postgres` by name, same as any other
  host-level operational script in this project.
- **On a recurring schedule**: `pg_dump` both databases (overwriting the
  same two filenames each run — Postgres dump content, not history, is what
  matters), copy any new files from `stabbur`'s blob volume
  (content-addressed, write-once — only ever additions, never
  modifications) into the backup repo, then `git add` / commit / push to a
  private GitHub repository. No commit is made on a run with no changes.
- **No encryption** — operator's explicit, informed choice: the data is
  personal learning content (words, translations, session counts), not
  credentials. The one hard rule this depends on: `.env`/secrets never
  enter this repository, ever, under any circumstance.
- **Plain git for both SQL dumps and audio blobs** — content-addressed,
  write-once blobs are the one binary workload git handles well (no
  repeated-modification bloat); revisit only if the repo's size ever
  becomes a real nuisance, not preemptively.
- **Git push authentication is the operator's own existing host SSH
  identity** — `~/dev/tun/tun-backup` was cloned directly on the host before
  implementation began, using the same key already authenticating every
  other `git pull`/`git push` in this project. No new deploy key, no new
  secret to provision or store.

## Capabilities

### New Capabilities
- `git-backup`: the unified backup service, its schedule, and its git-push
  mechanism.

### Modified Capabilities
<!-- None — this adds a service to the unified stack without changing any
     existing deployment requirement. -->

## Impact

- `tun/bin/backup.sh` — new script.
- `tun/.gitignore` — excludes `tun-backup/`, the nested backup repo clone.
- A host `cron` entry (documented, operator-installed — not something this
  change edits on the operator's behalf).
- No changes to `mjolnir`'s or `stabbur`'s own code, compose files, or
  schemas — this is purely an addition at the unification layer, consistent
  with why `tun/compose.yaml` exists at all (D94).
- Depends on `tun-shared`/`include:` networking (D94/D98) and stabbur's
  named blob volume (`stabbur-blobs`) already being part of the merged
  project.
