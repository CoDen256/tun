# CLAUDE.md

## tun — the Norwegian learning ecosystem, one repository

Since **D150** this is a monorepo. Every former sibling repo is a top-level
directory here. One clone, one `docker compose up`, one Claude Code session.

**Start at `docs/README.md`. Read `docs/07-decisions.md` before proposing
anything — do not re-derive settled decisions.**

| directory | owns |
|---|---|
| `docs/` | the ecosystem design layer + the ADR log. The spec layer above every project. |
| `grind/` | the gateway: TLS, routing, the operator gate, the status page |
| `mjolnir/` | bundle tool, JS + native patches, APK pipeline. Three services: `mjolnir-workbench` (console), `mjolnir-builder`, `mjolnir-sync` (**device plane**, D158). `docs/findings.md` |
| `stabbur/` | learning content: captures, notes, enrichment, triage UI, audio blobs |
| `smia/` | linguistics: inflect / ipa / tts / stt / translate |
| `phonexa/` | phonetics lab: vowels, consonants, formants, live speech |
| `shadow/` | shadowing: media, segments, transcription |
| `postgres/` | the shared database cluster: one Postgres 17, five databases, five roles |
| `backup/` | the git-backup service |
| `libs/` | code shared across projects: auth, prefix handling, layout, bootstrap |

`hover-translate` is **not** in this repository (D154). It is a fork, a
standalone browser extension, and never deployed — it lives in its own repo
and reaches `smia` and `stabbur` across origins like any external client.
Every reference to it inside `smia`, `stabbur` and `mjolnir` is still correct.

Mjølnir app internals live in `mjolnir/docs/findings.md`, not in `docs/`.

`grind/`, `shadow/` and `libs/` are created by the `zone-isolation` and
`unified-auth` changes; `postgres/` exists now (D155).

## The three zones — never blur them

1. **Device plane** — `/ota/*`, `/blob/*`, `/audio-manifest/*` (served off
   disk by the gateway, no process and no database in the path) and
   `/mjolnir/userdata/*` (served by `mjolnir-sync`, its own process, D158). A contract frozen in `docs/11-ota-contract.md`, with
   an APK in the field that cannot be rolled back. **Do not change anything
   here.** Not the token, not a header, not a cache directive. If a task seems
   to require it, the task is wrong. OTA is served off disk by the gateway and
   depends on no service and no database.
2. **Operator plane** — everything a human opens in a browser. One credential,
   enforced in the gateway.
3. **Internal** — service-to-service calls, which never pass through the
   gateway. Today they carry `STABBUR_AUTH_TOKEN` / `SMIA_AUTH_TOKEN` (two
   values, both in the root `.env`); `unified-auth` collapses them into one
   `INTERNAL_TOKEN` — planned, not yet done.

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
- One test layout per language (`pytest.ini` + `tests/`). One Postgres major
  version *as the target*: smia is still deliberately on `postgres:16` and the
  four databases are still four separate instances — `postgres-consolidation`
  collapses them, which is also the only point a shared password can take
  effect. Serving before migrating (shared `libs/`, so a database outage
  degrades pages instead of preventing boot) is `zone-isolation`'s and
  `unified-auth`'s work: planned, not yet done. Today each project runs its own
  migrations on boot.
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
