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
