## Context

Six repositories, one deploy target, one operator. `tun` already acts as the
unification point via Compose `include:` across sibling checkouts (D94, D118,
D147), which works but requires five checkouts kept in step and one manual
network-creation step that two ADRs got wrong before D104 corrected them.

## Decision 1 — Keep `include:`, delete the external network

An earlier draft of this exploration proposed collapsing everything into a
single root `compose.yaml` on the reasoning that `include:` was a multi-repo
workaround. That was wrong, and the operator pushed back correctly.

`include:` provides something the monorepo still needs: **per-project ownership
and standalone runnability**. What was broken was never `include:` — it was
`tun-shared` being declared `external: true` in four files, which `include:`
merges verbatim and an including file cannot clear (D104).

In one repository that is one Compose project with one default network, so the
external network simply ceases to exist.

Verified empirically before adopting (2026-11-13, `docker compose` v5.4.0):

```
root compose.yaml ──include──► stabbur/compose.yaml ──include──► postgres/compose.yaml
                  └─include──► smia/compose.yaml    ──include──┘   (same file, twice)

$ docker compose config --services                      # from root
postgres, smia-backend, stabbur-backend                 # deduped, no conflict
$ docker compose -f stabbur/compose.yaml config --services
postgres, stabbur-backend                               # standalone works
```

Both properties hold: nested `include:` resolves, and a shared fragment pulled
in by two projects deduplicates. This is load-bearing for
`postgres-consolidation` — it is what lets one shared cluster coexist with
`cd stabbur && docker compose up`.

**Consequence:** `docker compose up stabbur` from the root starts postgres and
stabbur and nothing else. Isolated development does not require isolated
databases.

## Decision 2 — Config layering, with an invariant rather than a location

The failure mode today is not decentralisation, it is duplication: the same
secret typed into two files with nothing keeping them in step, and prose in
`.env.example` compensating for it. `SMIA_AUTH_TOKEN` appears in three files.

The rule is therefore about *cardinality*, not about *location*:

> A value used by more than one project lives in `tun/.env`.
> A value used by exactly one project lives in that project's `.env`.
> No value appears in two files, ever.

This keeps provider keys next to the provider code (operator preference,
explicitly stated) while still eliminating every sync hazard. Service-level
`env_file:` paths resolve relative to the including fragment, so a project's
own `.env` is read in both standalone and unified modes.

Derived values are computed, never typed: `DATABASE_URL` is assembled in
compose from `POSTGRES_PASSWORD`; `*_BASE_URL` and `*_UPSTREAM` disappear
entirely because service names always resolve within one project.

## Decision 3 — Full history, 1.5 GB, no rewriting

```
repo             pack      dominated by
phonexa          820 MB    264 commits of churned lang/*.wav
smia             172 MB    3,858 tracked provider files
mjolnir          145 MB    base/mjolnir.merged.apk (69 MB)
hover-translate   52 MB    three ~15 MB demo GIFs
stabbur          0.9 MB
tun              0.1 MB
```

A BFG strip would reach ~150 MB but rewrites every SHA, and this ecosystem's
ADR log and commit messages cross-reference each other heavily. The operator
accepted 1.5 GB explicitly. History stays intact; `git log --follow` works
across the move.

`base/mjolnir.merged.apk` stays in history deliberately: it is the input to the
one irreversible APK build (D04), and P2 has not happened yet.

## Decision 4 — Build contexts at the repo root

`libs/` only pays off if more than one service can `COPY` from it, which
requires `context: .` with `dockerfile: stabbur/Dockerfile`. The combined
working tree is ~10 GB (phonexa 6.3 G, mjolnir 1.4 G, smia 1.4 G — nearly all
gitignored audio, providers, node_modules and APK scratch), so a root
`.dockerignore` is not optional. This is the one new footgun the monorepo
introduces and it is a four-line file.

## Decision 5 — One root `CLAUDE.md` plus per-project ones

Claude Code loads nested `CLAUDE.md` files when it touches files in that
subtree. Root holds the ecosystem rules, the project map, documentation
conventions and the service standard; each project holds only its own
internals (`mjolnir/docs/findings.md` stays where it is). One session opened at
the root therefore has ecosystem context always and project context on demand —
which is the direct fix for the stated six-sessions problem.

## Risks

**Volume identity.** Moving from five Compose projects to one renames any
volume that relies on the default `<project>_<key>` naming. All four repos
already set explicit `name:` on every volume, so they survive — but
`mjolnir_caddy_data` holds the TLS certificates, and losing it means
re-issuing against Let's Encrypt rate limits. The explicit names are preserved
verbatim; this is a task-level assertion, not an assumption.

**Two generations of volumes already exist on at least one host.** Verified
locally (2026-11-13): `mjolnir_caddy_data` *and* `tun_caddy_data`,
`mjolnir_postgres_data` *and* `tun_postgres_data`,
`stabbur_stabbur-pg-data` *and* `tun_stabbur-pg-data`,
`phonexa_postgres_data` *and* `phonexa_pgdata`, plus
`stabbur_stabbur-pg-data-17` beside `stabbur_stabbur-pg-data`. Something ran
under a `tun` project name at some point and left a parallel set behind. Before
any volume is touched, the live set must be established from the running
containers (`docker inspect`), not from the compose files — otherwise a later
migration can read a stale database and silently back up the wrong one.

**Stale local config.** `mjolnir/.env` on the development machine still sets
`STABBUR_UPSTREAM=backend:5056`, but stabbur's service key is `stabbur-backend`
with no network alias. Production resolves correctly (verified: `/stabbur/ui`
returns 200), so this is local drift only — but it is exactly the class of
error the naming standard exists to prevent.

**`mjolnir` tracks 7 files under `node_modules/`.** Cleaned up during the merge.

**smia's `providers/` is tracked in git (3,858 files) while `DEPLOY.md` and
`tun/compose.yaml` both state it is gitignored and must be `rsync`ed
separately.** One of those is wrong and the "clone and run" story depends on
which. Resolved during the merge rather than after.

## Alternatives considered

- **Squash per repo** (~20 MB): rejected, loses the blame trail the ADR log
  leans on.
- **History + BFG strip** (~150 MB): rejected, rewrites SHAs that documents
  cite.
- **Single flat root `compose.yaml`**: rejected after operator pushback; loses
  standalone per-project runnability for no gain once the external network is
  gone.
- **`services/` and `ops/` subdirectories**: rejected by the operator; with
  eight projects a flat top level reads better.

## Correction found during implementation — per-port profiles do not exist

Tasks 4.5 and the service standard said host ports should sit "behind a `dev`
profile". That is not implementable. Compose's `profiles:` gates an entire
service, not an individual port mapping, and every workaround fails on
Compose v5.4.0 (each verified, 2026-11-13):

| attempt | result |
|---|---|
| `ports: ["${P-}"]` (empty when unset) | rejected: `no port specified: <empty>` |
| `dev`-profiled sidecar, `network_mode: "service:x"` + `ports:` | daemon refuses: `conflicting options: port publishing and the container type network mode` |
| `dev` profile on the database service itself | project invalid: `service smia-backend depends on undefined service` |

The mechanism that works is a per-project `compose.override.yaml` holding only
the loopback port mappings. Compose auto-loads an override file **only** for
the primary compose file of the directory it is invoked in. Verified:

```
cd svc && docker compose config          -> ports published
docker compose config        (root, via include:)  -> NO ports
docker compose -f svc/compose.yaml config          -> NO ports
```

This is better than what the task asked for. `cd smia && docker compose up`
publishes loopback ports so a native venv can connect, while the unified stack
publishes nothing at all — production is safe by construction rather than by
remembering to omit a profile flag. It also directly satisfies the operator's
requirement that developing and testing one service alone be trivial.

## Data hazard found during implementation — one Postgres password cannot be shared yet

D151 says configuration must not be duplicated, and the obvious reading is one
`POSTGRES_PASSWORD` for all four databases. Two agents independently found that
this silently breaks every existing database.

Postgres applies `POSTGRES_PASSWORD` **only when it initialises a fresh data
directory**. The three existing volumes were created with the literals their
compose files hardcoded:

| volume | password baked in at init |
|---|---|
| `stabbur_stabbur-pg-data-17` | `stabbur` |
| `smia_smia-pg-data` | `smia` |
| `phonexa_postgres_data` | `${PHONEXA_POSTGRES_PASSWORD:-phonexa}` |
| `mjolnir_postgres_data` | the operator's real value in `mjolnir/.env` |

A single shared value would authenticate against none of them, and the only
symptom would be an authentication failure from each backend — no startup
error, nothing in the database logs pointing at the cause.

So this change keeps **four keys, one per database**
(`MJOLNIR_POSTGRES_PASSWORD`, `STABBUR_POSTGRES_PASSWORD`,
`SMIA_POSTGRES_PASSWORD`, `PHONEXA_POSTGRES_PASSWORD`), each defaulting to the
literal its volume was created with, and all four defined in the root `.env`
and nowhere else. D151 is satisfied — the invariant is "no value in two files",
not "one value for everything".

`postgres-consolidation` collapses them into one `POSTGRES_PASSWORD`, because
that change dump/restores into a **fresh** cluster, which is the only point at
which a new password can take effect. Attempting the collapse here would have
been a silent outage.

## The root `compose.yaml` was already destroyed before this change began

At HEAD the file was 47 bytes:

```
include:
  - b/compose.yaml
  - c/compose.yaml
```

`b/` does not exist. A tracked `c/compose.yaml` sat in the repo root containing
a matching stub. Both were committed in `afb81d39` ("Archive
phonexa-path-routing; sync unified-deployment spec") — an earlier session ran a
nested-`include:` probe from the repository root, clobbered the real file,
created `c/`, and committed both inside an unrelated commit. The real file was
8,889 bytes through `c08b0edc` and is recovered from there.

**This is a live production hazard independent of this change.** Any host that
pulled `afb81d39` cannot bring the stack up at all — `docker compose up` fails
immediately on the missing `b/compose.yaml`. The deployed stack is still
serving (verified: `/stabbur/ui` returns 200) because its containers predate
the pull, but the next `git pull && docker compose up` would have failed with
an error pointing at a path nobody would recognise.

All four fragment agents reported it independently, which is the strongest
argument for the adversarial-verification pattern in this workflow: no single
reviewer had to be the one to notice.

## The `.dockerignore` in the proposal would have broken phonexa

The proposal's draft list of exclusions named `phonexa/lang`.
`phonexa/Dockerfile:32` is `COPY phonexa/lang/ ./lang/` — 14 MB of language
data that the image genuinely needs. Excluding it would have produced an image
that builds and then fails at runtime with missing language assets.

The file is therefore derived from the actual `COPY` lines of all six
Dockerfiles, with a comment at the top saying so and naming the trap. Verified
two ways: a static check that every `COPY` source exists and survives the
ignore rules, and a real `docker build` of each image's COPY stage against the
root context. Result: 31.3 MB and 880 files sent to the daemon, down from
~940 MB and 41,678 files.

## The password rename broke the backup service, and it was caught before it ran

Splitting the postgres passwords into four per-database keys renamed mjolnir's
from `POSTGRES_PASSWORD` to `MJOLNIR_POSTGRES_PASSWORD`. `backup/entrypoint.sh`
reads it by name in two places — the `pg_dump` for mjolnir and a startup
`:?`-guard assertion — and previously received it through
`env_file: ../mjolnir/.env`, which the monorepo deleted.

So the backup container would have refused to start with
`set POSTGRES_PASSWORD, mjolnirs own password via env_file`. Loudly, thanks to
the existing `:?` guard, and not silently — but broken, and broken in the one
service whose failure is only noticed a day later at the next scheduled run.

Fixed by renaming the variable in `entrypoint.sh` to match, rather than mapping
the new name back to the old one in compose: the variable should say which
database it belongs to, which is the whole point of having four of them. All
four variables `entrypoint.sh` requires are now asserted present in the
rendered config.

The general lesson for the remaining three changes: a configuration rename is
not done when the compose files agree with each other. It is done when every
*consumer* agrees — including shell scripts, which no amount of
`docker compose config` will check.

## A verification harness destroyed two real volumes (P41)

Recorded because it happened during this change's own verification, and because
the mechanism is not obvious.

`docker compose down -v` removes every volume the **project declares**, not the
subset its running containers mount. The root `compose.yaml` `include:`s all
four projects, so the project declares all nine named volumes no matter which
services are started.

The full-stack boot harness redirected all nine to `verify_*` names and
asserted, before starting anything, that no real name survived in the rendered
config — its `down -v` was safe and verified so afterwards. A second, narrower
harness built later to run `bin/ota-verify.sh` redirected only
`caddy_data`/`caddy_config` and started **only** the `caddy` service.
`docker inspect` on that container was clean: four mounts, none of them real.
Its `down -v` nonetheless destroyed `mjolnir_postgres_data` and
`smia_smia-pg-data`.

Both were local development databases on the operator's own machine; the VPS
was never touched by any part of this work. `mjolnir` is restorable from
`tun-backup/mjolnir.sql` (31 MB, committed the same day). `smia` has no dump,
because smia is still outside the backup set — the gap this effort already
identified and `postgres-consolidation` closes. Its content is derived
(lookup cache plus imported corpora) and rebuildable from the tracked
`smia/providers/` via `smia/scripts/import_*.py`.

The lesson generalises past this incident and is why it is P41 rather than a
footnote: **this change's own design.md warns twice that volume identity is the
sharpest hazard in the whole restructure, and the warning was still not enough,
because it was aimed at "dump the wrong volume" rather than "declare a volume
you never mount".** The remaining three changes — `postgres-consolidation` most
of all, which moves every database — must treat `-v` as forbidden against the
root project and must assert redirection over the *rendered* volume list rather
than a remembered one.

