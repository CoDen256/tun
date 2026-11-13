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
| `mjolnir/` | bundle tool, JS + native patches, APK pipeline, builder, workbench, device sync, `docs/findings.md` |
| `stabbur/` | learning content: captures, notes, enrichment, triage UI, audio blobs |
| `smia/` | linguistics: inflect / ipa / tts / stt / translate |
| `phonexa/` | phonetics lab: vowels, consonants, formants, live speech |
| `shadow/` | shadowing: media, segments, transcription |
| `hover-translate/` | capture client (browser extension — never deployed) |
| `postgres/` | the shared database cluster |
| `backup/` | the git-backup service |
| `libs/` | code shared across projects: auth, prefix handling, layout, bootstrap |

Mjølnir app internals live in `mjolnir/docs/findings.md`, not in `docs/`.

`grind/`, `shadow/`, `postgres/` and `libs/` are created by the
`zone-isolation`, `postgres-consolidation` and `unified-auth` changes.

## The three zones — never blur them

1. **Device plane** — `/ota/*`, `/blob/*`, `/audio-manifest/*` and
   `/mjolnir/userdata/*`. A contract frozen in `docs/11-ota-contract.md`, with
   an APK in the field that cannot be rolled back. **Do not change anything
   here.** Not the token, not a header, not a cache directive. If a task seems
   to require it, the task is wrong. OTA is served off disk by the gateway and
   depends on no service and no database.
2. **Operator plane** — everything a human opens in a browser. One credential,
   enforced in the gateway.
3. **Internal** — service-to-service calls, which never pass through the
   gateway and carry `INTERNAL_TOKEN`.

## Standards (D151, D152) — these are enforced, not aspirational

- **No configuration value exists in two files.** Used by more than one
  project → the root `.env`. Used by exactly one → that project's `.env`.
  Derivable → computed in compose, typed nowhere.
- **Directory name = compose service key = hostname = database name = URL
  prefix.** No `container_name:` anywhere.
- `restart: unless-stopped`; a health check for the service itself; host ports
  on `127.0.0.1` behind the `dev` profile — only the gateway publishes.
- One Postgres major version. One test layout per language (`pytest.ini` +
  `tests/`). Migrations run on boot, and a service **serves before it
  migrates** (`libs/`), so a database outage degrades pages instead of
  preventing boot.
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
