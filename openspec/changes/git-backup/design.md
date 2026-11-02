## Context

Read `tun/docs/07-decisions.md` D09 (content-addressing already justified
as making "incremental backups trivial"), D45 (stabbur owns the canonical
audio; `hub`'s copy is a per-build snapshot, not canonical), and D94/D98
(why `tun/compose.yaml` is the one place that already knows about the whole
merged stack) before proposing an alternative home for this. Read
`mjolnir/DEPLOY.md`'s existing "Backups (P24)" section — it already
correctly names what hub's Postgres holds; this change automates what it
describes, and extends the same treatment to `stabbur`, which has nothing
written down at all today.

Confirmed directly:
- `builder` (`mjolnir`) has a real scheduler (`clock.js` + `builder_config`)
  and already holds hub's own `DATABASE_URL` — but has no access to, and no
  architectural reason to ever gain access to, `stabbur`'s separate
  database (D43: stabbur must not know hub exists; the reverse — hub
  holding stabbur's DB credentials — was never part of this project's
  design either).
- `stabbur` has no scheduling mechanism of any kind — pure request-driven
  Flask, confirmed by grepping for any cron/APScheduler/schedule-like
  import anywhere in its codebase. Building one solely for a backup job
  would be new infrastructure in a service that doesn't otherwise need any.
- `tun/compose.yaml` already runs a cross-cutting service this way —
  `adminer`, which reaches both `mjolnir-postgres` and `stabbur-postgres` by
  name from the same merged network `include:` sets up (D94/D98). This
  change's service is architecturally identical in shape: one container,
  reaching both databases by name, doing something neither individual
  repo's own compose file has any business owning.
- `stabbur`'s blob store is a named Docker volume (`stabbur-blobs`,
  real name `stabbur_stabbur-blobs`) — reachable from any service in the
  same merged Compose project once `include:` brings it in, same as any
  network name.

## Goals / Non-Goals

**Goals:**
- One mechanism, data-agnostic, covering both services' Postgres instances
  and stabbur's canonical blobs.
- Zero new application code in `mjolnir` or `stabbur` — purely additive at
  the `tun` unification layer.
- Simple enough that the operator won't eventually stop maintaining it —
  explicitly the stated reason for choosing plain git over a cloud-storage
  + encryption + retention-policy stack.

**Non-Goals:**
- Point-in-time recovery / WAL archiving — a nightly full dump is
  sufficient for this project's actual scale and risk tolerance; revisit
  only if that ever changes.
- Backing up `mjolnir`'s own `data/blob/`/`data/ota/`/`data/logic/` —
  all rebuildable (the first two from stabbur + a republish, the third
  from the operator's own patch/base-folder source, which is already
  version-controlled).
- Any observability surfaced inside `builder`'s or `hub`'s own UI —
  operator's explicit choice to keep this purely ops-level; a future change
  can add a "last backup" indicator if ever wanted, this one does not.
- Encryption, access-controlled storage, or any third-party cloud account —
  explicitly declined (see D-B2).

## Decisions

### D-B1 — One unified service in `tun/compose.yaml`, not a job in `builder` or new code in `stabbur`

Considered and rejected:
- **A scheduled job inside `builder`** (the operator's own first instinct,
  and architecturally sound for `hub`'s own database alone — `builder`
  already has the scheduler and the credentials). Rejected as the *whole*
  solution because it cannot reach `stabbur`'s database without violating
  the hard boundary this project has held since D43 (stabbur doesn't know
  hub exists; hub has never held stabbur's credentials, and giving it a
  second service's DB password for a backup job is a worse precedent than
  the problem it solves).
- **A new scheduler inside `stabbur`** — confirmed stabbur has none today;
  building one solely for this is disproportionate new infrastructure.

**Chosen**: a single new service in `tun/compose.yaml`, the one place that
already treats "reach every included service's Postgres by name" as a
solved, precedented problem (`adminer` does exactly this today). The
service is a small image (postgres client tools + git + a shell script),
not applicable to either repo's own domain logic, so it belongs at the
layer that unifies them, not inside either.

### D-B2 — No encryption; the one hard rule that makes that fine

The backed-up content is personal learning data (words, translations,
session/progress counts) — not credentials, not anything that grants
access to anything. Operator's explicit, informed choice, made aware of
the two real residual risks: the repository's visibility being flipped to
public by accident (permanent exposure of whatever was cloned in that
window, even if reverted), and the hosting account itself being
compromised. Both are accepted.

**The one invariant this depends on**: `.env` and any other secret
(`OTA_TOKEN`, `OPERATOR_AUTH_TOKEN`, Postgres passwords, the git deploy key
itself) must never be written into this repository, under any
circumstance, ever. The backup script's working directory and the
credentials directory are kept structurally separate (see D-B6) so there
is no copy-paste path between them.

### D-B3 — SQL dumps overwrite the same filename; blobs are added, never modified

```
backup-repo/
  mjolnir.sql     ← overwritten every run (full pg_dump, not a diff)
  stabbur.sql     ← overwritten every run
  blobs/<sha256>  ← added once, never touched again (content-addressed, D09)
```

Overwriting the SQL dumps keeps the working tree small regardless of how
many runs have happened — git's own history is the retention mechanism (a
past day's full dump is one `git checkout <commit> -- mjolnir.sql` away),
with no separate retention policy to configure or maintain. Blobs are
genuinely incremental: each run only copies files from `stabbur`'s blob
volume that aren't already present in `backup-repo/blobs/`.

### D-B4 — `mjolnir`'s own `data/blob/` is explicitly excluded

It is a per-build snapshot of bytes stabbur already owns canonically (D45)
— backing it up would duplicate exactly what `stabbur`'s own blob volume
already backs up, for a copy that's regenerable anyway (republishing
rebuilds it from `card_slots`/`card_content` + stabbur's current state, as
long as stabbur's own copies survive — which this backup already ensures).
`data/ota/`/`data/logic/` are excluded for the same "rebuildable, not
canonical" reasoning — the logic bundles are built from the operator's own
patch/base-folder sources, themselves already version-controlled.

### D-B5 — Scheduling is self-contained inside the container, not host cron

Matches this project's established preference (D92: the VPS deliberately
has no Node runtime, everything runs containerized) extended to its
logical conclusion — nothing needed on bare metal beyond Docker itself,
which is already there. The container runs a simple loop (sleep +
run, or a lightweight cron implementation inside the image) rather than
relying on the host's own `cron`.

### D-B6 — Git push authentication via a repo-scoped SSH deploy key

A GitHub deploy key can be scoped to exactly one repository and (if
read-only isn't needed) granted write access only to that repo — strictly
less privilege than a personal access token, which typically carries
broader account access unless deliberately scoped as a fine-grained PAT.
Stored in `tun`'s own gitignored `.env`, mounted into the backup container
at a path distinct from the backup repo's own working directory — the
script never has both the credential and a plausible destination to
accidentally commit it into in the same filesystem location.

### D-B7 — No commit on a no-op run

`git add -A` followed by checking `git diff --cached --quiet` before
committing — a run where nothing changed (no new sessions, no new cards)
produces zero commits, not an empty one every single scheduled tick
forever.

## Risks / Trade-offs

- **`pg_dump` runs against a live database** — momentary lock contention is
  possible but at this project's single-operator scale and Postgres's own
  MVCC design, not a practical concern; no special snapshotting needed.
- **A failed push is currently silent** (Non-Goal: no builder-UI
  observability) — the operator finds out via `docker compose logs
  git-backup` if they go looking, not proactively. Accepted per the
  operator's explicit "nothing in builder" preference; revisit only if a
  failure is ever actually missed for a worrying length of time.
- **Repo-size growth is unbounded** — accepted per the earlier design
  conversation; revisit (Git LFS, or a history squash) only if it's ever
  actually a nuisance, not preemptively.

## Migration Plan

None — purely additive, no existing data or behavior changes. First run
against a repo with substantial existing history (the operator's "really
really a lot of sessions") produces one large initial commit; every run
after that is small.

## Open Questions

- Exact dump/push frequency (daily? more often?) — not yet pinned down;
  default to daily unless the operator wants tighter.
