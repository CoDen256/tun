# tun

*Tun: the farmyard — the shared centre every building faces.*

**One repository** for a Norwegian learning ecosystem: capture a Norwegian
sentence while watching video, enrich it, and have it arrive as a
spaced-repetition card with real audio in a modded Mjølnir app — with every
step in between inspectable and editable by one operator.

Since **D150** this is a monorepo: the six former repositories (`mjolnir`,
`stabbur`, `smia`, `phonexa`, `hover-translate` and `tun` itself) are merged
here as top-level directories, with all history reachable — no SHA was
rewritten, and every former head commit is an ancestor of `HEAD`.

## Start reading here

1. [`docs/README.md`](docs/README.md) — the map of the ecosystem docs.
2. [`docs/07-decisions.md`](docs/07-decisions.md) — the ADR log. **Read it
   before proposing anything**; settled decisions are not re-derived, and
   superseded ones are marked, never deleted.
3. [`docs/10-roadmap.md`](docs/10-roadmap.md) → "Right now" — the current
   next step.

Open Claude Code **once, at the repository root**, for every kind of work:
[`CLAUDE.md`](CLAUDE.md) carries the ecosystem rules and each project's own
`CLAUDE.md` is loaded when you touch files in it.

## Projects

Each directory owns its own `compose.yaml`, which the root `compose.yaml`
`include:`s — so each runs standalone *and* all of them come up together.

| directory | owns |
|---|---|
| `docs/` | cross-project design: decisions (ADRs), pitfalls, open questions, roadmap, the frozen OTA contract |
| `openspec/` | ecosystem-level OpenSpec changes (each project has its own too) |
| `mjolnir/` | everything that knows the Mjølnir bundle format or talks to the device: bundle tool, JS + native patches, APK pipeline, builder, hub, `docs/findings.md` — plus the gateway (`caddy/Caddyfile`) and the OTA scripts |
| `stabbur/` | learning content: captures, notes, enrichment, triage UI, audio blobs |
| `smia/` | linguistics providers: inflect / ipa / tts / stt / translate |
| `phonexa/` | phonetics lab: vowels, consonants, formants, live speech |
| `hover-translate/` | capture client (a private Chrome extension — never deployed) |
| `backup/` | the git-backup service: a `pg_dump` per covered database (mjolnir, stabbur, phonexa — smia not yet) plus blob and audio mirrors |
| `bin/` | `check-standards.sh`, the mechanical enforcement of D150–D153 |

`grind/` (the gateway, once Caddy moves out of `mjolnir/`), `shadow/`,
`postgres/` (one shared cluster) and `libs/` (shared code) are **planned, not
present** — they arrive with the `zone-isolation`,
`postgres-consolidation` and `unified-auth` changes.

## Deploying

One `git pull`, one `docker compose up` here. There is no sibling-checkout
layout and no network to create by hand any more: one repository is one
Compose project is one default network.

```sh
cp .env.example .env     # then fill it in
docker compose up -d
```

Twelve services come up; only the gateway (80/443) and a loopback Adminer on
`127.0.0.1:8082` are published. **[`DEPLOY.md`](DEPLOY.md) is the runbook** —
first boot, the backup service, and the production cutover steps live there,
not here.

Working on one service alone:

```sh
docker compose up stabbur-backend   # from the root: that service + its database
cd stabbur && docker compose up     # the same, plus loopback ports for a native venv
```

See [`docs/02-services.md`](docs/02-services.md) for the service boundaries,
the twelve services and the gateway's routes.

## Status

**P1–P3 are done** (D73): the server is live, the one irreversible native OTA
patch is built, signed, installed and **proven on device** — `asset` →
`pending` → `active` → `active` across four launches with no false quarantine
— and the first real content change shipped as a file with no APK rebuild.
[`docs/12-p2-results.md`](docs/12-p2-results.md) records exactly what was
tested and what is still unproven.

**From here, every change to the app is a file on the server.** P4's pipeline
(`builder` + notes) is built and archived but not yet deployed;
[`docs/10-roadmap.md`](docs/10-roadmap.md) holds what to do next.
