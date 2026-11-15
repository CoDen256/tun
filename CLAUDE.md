# CLAUDE.md

## tun — the Norwegian learning ecosystem, one repository

Since **D150** this is a monorepo. Every former sibling repo is a top-level
directory here. One clone, one `docker compose up`, one Claude Code session.

**Start at `docs/README.md`. Read `docs/07-decisions.md` before proposing
anything — do not re-derive settled decisions.**

**The monorepo restructure is DONE and deployed** — the cutover to production
ran 2026-11-14 and all four restructure changes are archived.
`docs/14-restructure-handoff.md` is the closed historical record of it (and of
pitfalls P41–P68, which are still live lessons).

| directory | owns |
|---|---|
| `docs/` | the ecosystem design layer + the ADR log. The spec layer above every project. |
| `grind/` | the gateway (the gate into the tun): TLS, routing, the status page, and the `caddy` service. Moved here from `mjolnir/caddy/` by `unified-auth`, superseding D84. Derives the operator hash at boot — no hash is ever stored in a file |
| `mjolnir/` | bundle tool, JS + native patches, APK pipeline. Three services — the console (compose key `mjolnir-hub`; the *rename* to `mjolnir-workbench` is deferred, it must change the key and the gateway upstream together), `mjolnir-builder`, and `mjolnir-sync` (**device plane**, D158). `docs/findings.md` |
| `stabbur/` | learning content: captures, notes, enrichment, triage UI, audio blobs |
| `smia/` | linguistics: inflect / ipa / tts / stt / translate |
| `phonexa/` | phonetics lab: vowels, consonants, formants, live speech |
| `shadow/` | shadowing: media, segments, transcription |
| `postgres/` | the shared database cluster: one Postgres 17, five databases, five roles |
| `backup/` | the git-backup service |
| `libs/` | code shared across projects: auth, prefix handling, layout, bootstrap |

`hover-translate` stays an **external client** of the ecosystem (D154): its
own repository, a standalone browser extension, never deployed by this stack,
reaching `smia` and `stabbur` across origins. Since 2026-11-15 it is checked
out here as a **git submodule** (a pinned pointer, which does not reverse
D154), alongside `tun-backup/` (the backup DATA repo, `ignore = all` because
the backup service commits to it daily — a stale pinned SHA there is normal).

Mjølnir app internals live in `mjolnir/docs/findings.md`, not in `docs/`.

## The three zones — never blur them

1. **Device plane** — `/ota/*`, `/blob/*`, `/audio-manifest/*` (served off
   disk by the gateway, no process and no database in the path) and
   `/mjolnir/userdata/*` (served by `mjolnir-sync`, its own process, D158). A contract frozen in `docs/11-ota-contract.md`, with
   an APK in the field that cannot be rolled back. **Do not change anything
   here.** Not the token, not a header, not a cache directive. If a task seems
   to require it, the task is wrong. OTA is served off disk by the gateway and
   depends on no service and no database.
2. **Operator plane** — everything a human opens in a browser. One credential
   (`operator` / `OPERATOR_AUTH_TOKEN`), enforced as `basic_auth` in the
   gateway across all seven zones; behind it every service runs the one
   shared check from `libs/` (D159, D160).
3. **Internal** — service-to-service calls, which never pass through the
   gateway. One value, `INTERNAL_TOKEN` in the root `.env` (`unified-auth`
   4.6); `STABBUR_AUTH_TOKEN` and `SMIA_AUTH_TOKEN` are retired names that
   `bin/check-standards.sh` fails on.

## Standards (D151, D152) — these are enforced, not aspirational

- **No configuration value exists in two files.** Used by more than one
  project → the root `.env`. Used by exactly one → that project's `.env`.
  Derivable → computed in compose, typed nowhere.
- **Service names derive from their project:** `<project>-<role>`
  (`stabbur-backend`), URL prefix `/<project>/`. The compose key and the
  network hostname are always the same string. The prefix and the database name
  are NOT required to equal it — `/stabbur/` is served by `stabbur-backend`,
  and mjolnir's database is named `postgres` for historical reasons. No
  `container_name:` anywhere.
- `restart: unless-stopped`; a health check for the service itself; host ports
  on `127.0.0.1`, published only by a per-project `compose.override.yaml` —
  only the gateway publishes in the unified stack. **Not** a `dev` profile:
  Compose has no per-port profile and all three workarounds fail (D152's
  correction), and the override file is loaded only for the primary compose
  file of the directory it runs in, which is what makes
  `cd smia && docker compose up` publish ports while the root stack publishes
  none.
- One test layout per language (`pytest.ini` + `tests/`). **One Postgres 17
  cluster** (`postgres/`, D155/D156): five databases, five roles, every role
  password derived from the single `POSTGRES_PASSWORD`. Every service
  **serves before it migrates** (D157) — a database outage degrades pages
  instead of preventing boot. *(Until 2026-11-14 this bullet read "four
  separate instances, smia on 16, consolidation planned" — that world is
  gone, and the four pre-cutover volumes were retired the same day after the
  daily backup was restore-verified; the off-host dumps are the rollback now.)*
- **No CI.** Deliberately (D152). Do not add a workflow.
- Each project owns its `compose.yaml`; the root `include:`s them. Every
  project must stay runnable standalone.

## Documentation conventions

- A cross-cutting decision gets an ADR row in `docs/07-decisions.md`, with its
  rationale. Superseded decisions are **marked**, never deleted.
- Corrected findings are annotated in place so a stale claim cannot be read
  without its correction.
- OpenSpec: the root `openspec/` holds cross-cutting changes; each project's
  own `openspec/` holds implementation-scoped ones. **Change ids are bare
  slugs, never dated** (D153) — the CLI's `--change` flag rejects any name not
  starting with a letter.

## The batch workflow (D161)

Backlog items flow through `docs/15-agentic-workflow.md`: `/tun-triage`
groups `BACKLOG.md` verbatim into dependency-based packages (isolated from
each other, possibly spanning projects) and opens a batch under
`batches/<slug>/`; `/tun-design` (fresh
session per package) settles UI + architecture with the operator and writes
acceptance criteria; `/tun-build` (fresh session per package) implements,
tests, reviews and archives with no operator involvement. Archived ≠
operator-accepted — the batch's `OPERATOR-CHECKLIST.md` carries what the
operator tests live, and live findings return as new backlog items.

## OpenSpec / Opsx Workflow Rules

- **Post-Operation Commit:** Always create a Git commit after running any `opsx` operation.
- **Walkthrough Requirement for `opsx:apply`:** After executing `opsx:apply`, provide a concise, step-by-step walkthrough covering:
  - **UI / Visual Checks:** What key elements or changes to look for in the user interface (high-level, not overly detailed).
  - **Data / Storage Verification:** Where to poke around outside of the codebase (e.g., database tables, local storage, API endpoints, logs).
  - **Testing & Checkout:** Key terminal commands to run and specific UI flows/interactions to manually test.

## Do not touch

- `mjolnir/base/` — 35k decompiled files of the stock APK, the input to the one
  irreversible build (D04). Corrupting it is unrecoverable.
- `mjolnir_caddy_data` — the TLS certificates. Renaming that volume means
  re-issuing against Let's Encrypt rate limits.
