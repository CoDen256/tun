# Tun — services, projects and deployment

**Tun** = the farmyard: the shared centre every building faces. The naming
family is a Norwegian farm — `smia` the forge, `stabbur` the storehouse.

## Projects (one repository — D150)

Since **D150** the ecosystem is **one repository**, `tun`, with each former
repo as a top-level directory. The boundaries this table describes are
unchanged — they are now directory and Compose-service boundaries inside one
repo rather than repository boundaries, and the dependency column still holds
exactly.

| directory | contains | depends on |
|---|---|---|
| `docs/` | **ecosystem docs (this directory)**: the ADR log and all cross-project design. *(D84's "no deployable artifacts in `tun`" is **superseded by D150**: the repository root now owns the composing `compose.yaml`, the root `.env`, `.dockerignore`, `bin/check-standards.sh` and `DEPLOY.md`)* | — |
| `openspec/` | ecosystem-level OpenSpec changes; each project keeps its own `openspec/` for implementation-scoped ones | — |
| `mjolnir/` | `docs/findings.md`, `tool/` (bundle-tool, Node — D76), `patches/js/`, `patches/native/`, `apk/`, `builder/` (Node, imports `tool/` as a library), `hub/`, and **the gateway**: `caddy/Caddyfile`, `bin/ota-publish.sh`/`ota-verify.sh` (D75/D84) | stabbur |
| `stabbur/` | captures, notes, enrichment orchestration, triage UI, audio blobs | smia |
| `smia/` | `/inflect` `/ipa` `/tts` `/stt` `/translate`, provider chains, `/ui` | nothing |
| `phonexa/` | phonetics lab; deployed as part of the unified stack at the authenticated `/phonexa/` path (D147/D149) | smia (optional), stabbur (optional import) |
| `hover-translate/` | capture client (fork, Chrome-only, private/unpublished — D144). Never deployed | stabbur, smia |
| `backup/` | the git-backup service (D-C1..D-C5): a `pg_dump` per covered database plus the blob and audio mirrors | mjolnir / stabbur / phonexa databases (not smia yet) |

`mjolnir` is **self-contained for everything Mjølnir**: bundle format knowledge,
the JS patch set, the native patch source, the APK rebuild pipeline, the builder
and the device-facing hub. It is not coupled to phonexa. *(D37 stated this as a
property of a separate repository and is **superseded by D150** — the knowledge
boundary it protected is a directory boundary now, and it still holds.)*

`findings.md` lives in `mjolnir/docs/`. Cross-project design (this directory)
lives in `docs/`, which is also the "where do I start" entry point.

`grind/` (the gateway, once Caddy moves out of `mjolnir/`), `shadow/`,
`postgres/` (one shared cluster) and `libs/` (shared auth, prefix handling,
layout, bootstrap) are **planned, not present**: they arrive with the
`zone-isolation`, `postgres-consolidation` and `unified-auth` changes.

## Dependency graph

```
hover-translate ──capture──► stabbur ──enrich──► smia        (smia depends on nothing)
                                 ▲
                                 │ pull: GET /api/notes?source_lang=no&status=ready&since=…
                                 │       + blobs by sha256
                            mjolnir/hub ──OTA + sync──► device
                            mjolnir/builder
```

**The "stabbur ──enrich──► smia" arrow is live**, not just a diagram: stabbur's
note editor proxies `ipa`/`translations`/`inflections`/`tts` lookups to smia
server-side (never from the browser directly — smia's token and address stay
server-side-only), and a chosen TTS candidate's audio is pulled into
stabbur's own `blob/<sha256>` store rather than left referencing smia's
non-canonical cache (D45). See D118 and stabbur's `smia-enrichment-panel`
OpenSpec change for the full design.

**Correction/exception (D143):** the "never from the browser directly" rule
above is about *stabbur's own web UI* — a page served to any browser that
must never hold smia's credentials. It does not extend to
`hover-translate`: a private, unpublished, single-operator Chrome extension
calls `POST /smia/translations` **directly**, with its own smia token
configured by that same operator (`backend-configuration` spec,
`smia-translation-and-stabbur-capture` design D1). The distinction is who
the browser context belongs to — stabbur's UI is served to anyone who
loads it; the extension is configured by, and only runs for, the one
person who already holds both tokens. See D143 in `07-decisions.md`.

```
phonexa ──► smia (optional)        phonexa ◄── stabbur blob import (optional, by hash)
```

One-directional (**D44**): hub *pulls* from stabbur, stabbur does not know
hub exists and has no "published" state to report back. smia is a leaf.
Merging the repositories into one did not change this — the dependency is a
property of the code, not of where it is checked out.

## Division of knowledge

| | stabbur | mjolnir/hub |
|---|---|---|
| knows | text, source_lang, translations (any languages), context, audio, pos, inflections, transcription, type (`word`/`expression`/`listening`/`pronunciation`/`grammar`), status (`draft`/`ready`) | `card_slots` (permanent 6-char ids), deck assignment C20–C29, projection to N/E/X/A, occurrences, lag-11 interleave, bundle assembly, audio manifest, device sync, **which notes it has already minted (its own ledger — never pushed back to stabbur)** |
| does NOT know | decks, card ids, occurrences, N/E/X/A, anything Mjølnir | how content was captured or enriched |

stabbur would survive switching to a different SRS app entirely.

## Audio

**stabbur owns the canonical learning audio**; content-addressing is a
*convention*, not a central blob service.

```
smia     stateless — /tts returns BYTES. Private cache only.
stabbur  canonical: capture clips (wide + trimmed), TTS/Forvo results. blob/<sha256>
hub      per-build SNAPSHOT of exactly what the device needs
phonexa  its own sample audio (bound to Sample/Token/analysis); may import by hash
```

A central blob service would make studying depend on stabbur being up. The
snapshot removes that. Duplication costs ~30 KB per clip — nothing against 100 GB.
The hash being the filename makes every transfer self-verifying.

## UI

Every service ships its own UI with database exploration, in phonexa's spirit.
Served under **one domain by path** — `/stabbur`, `/smia`, `/mjolnir`,
`/phonexa` — with a shared header/nav so the UIs feel like one system. The
shell is vendored CSS, not a shared package (solo-dev simplicity over DRY).

Routes through the gateway, as served today:

| route | served by | note |
|---|---|---|
| `/ota/*` `/blob/*` `/audio-manifest/*` | caddy, off disk | **device-facing** — byte-identical to the frozen contract in `11-ota-contract.md` (D55) |
| `/mjolnir` | mjolnir-hub | operator login |
| `/builder` | mjolnir-builder | operator login |
| `/stabbur/*` | stabbur-backend | UI at `/stabbur/ui` |
| `/smia/*` | smia-backend | UI at `/smia/ui` |
| `/phonexa/*` | phonexa-backend | Caddy `basic_auth`; `/phonexa` must redirect to `/phonexa/` |
| `/adminer/*` | adminer | **unauthenticated at the gateway** — the operator token gates hub/builder, not this route (see the Caddyfile comment); also on `127.0.0.1:8082` |

stabbur and smia still serve their UI at the `/ui` sub-path rather than at the
prefix root; moving it is `unified-auth`'s task, not done here.

**phonexa is routed by path like the others** (D149, superseding D148's
subdomain decision). It became prefix-aware the same way stabbur (D46) and
smia (D119) did — `X-Forwarded-Prefix` → an injected global → one `API_BASE`
constant — so the dedicated hostname it used to need is gone, along with its
DNS record and certificate. It is still gated at Caddy by `basic_auth` on the
operator token (phonexa has no auth of its own and exposes destructive admin
endpoints), so it answers with a native credential prompt rather than hub's
login page, and it is not in the shared nav. Two consequences worth knowing:
`/phonexa` must redirect to `/phonexa/` or its relative assets escape the
prefix, and it now shares an origin with hub and builder.

## Deployment

One Contabo VPS: **8 GB RAM, 100 GB disk** (comfortably above the 4 GB floor).

**One repository, one Compose project, one deploy (D150).** A deploy is one
`git pull` and one `docker compose up` at the repository root. The root
`compose.yaml` defines only the shared Adminer and the backup service; it
`include:`s each project's own `compose.yaml` (`mjolnir`, `stabbur`, `smia`,
`phonexa`), and every one of those stays fully usable standalone
(`cd stabbur && docker compose up`).

`include:` is what survived; the apparatus around it is what went. The
question this paragraph used to leave open — whether stabbur/smia/phonexa join
`mjolnir`'s compose file or bring their own — was answered "each brings its
own" (D94, D118, **D147** for phonexa) and that answer still stands. What is
gone is the five sibling checkouts and the `tun-shared` network declared
`external: true` in four files, which needed a one-time `docker network
create` before the first boot (D94/D98 got that wrong, D104 corrected it,
D150 retired the whole mechanism). One repository is one Compose project is
one default network, so every service resolves every other by name with no
configuration and no setup step.

**The gateway still lives in `mjolnir/`** — `mjolnir/caddy/Caddyfile` is the
only Caddy config and `mjolnir/bin/ota-publish.sh`/`ota-verify.sh` the only
OTA scripts, and nothing about them is duplicated at the root. D84's *reason*
for that (one repo owns the whole deployable stack) is superseded, but the
files stay where they are until `zone-isolation` moves them to `grind/`.

**Host ports.** The unified stack publishes **only** the gateway (80/443) plus
a loopback-only Adminer on `127.0.0.1:8082`. Every other port mapping lives in
a per-project `compose.override.yaml`, which Compose auto-loads only for the
primary compose file of the directory it is invoked in — so
`cd smia && docker compose up` publishes loopback ports for native
development while the unified stack publishes nothing at all (D152).

Twelve services, all deployed today:

```
caddy             TLS, path routing, and STATIC serving of bundles, blobs and
                  the audio manifest straight off disk — no application
                  process in the path of those bytes (D55). The only service
                  that publishes a public port
mjolnir-postgres  hub + builder database
mjolnir-hub       device-facing (/ota, /mjolnir/userdata, heartbeat)
                  + operator UI: publish history (reads `publications`) (D80)
mjolnir-builder   worker + operator UI: live forecast (dry-run deck assignment
                  against stabbur's current ready+audio'd notes) and the
                  manual "publish now" button (D78, D80)
stabbur-postgres  stabbur database
stabbur-backend   web + API, reached at /stabbur/ (its UI at /stabbur/ui)
smia-postgres     smia database — deliberately still postgres:16
smia-backend      web + API, reached at /smia/ (its UI at /smia/ui)
phonexa-postgres  phonexa database (PG 17); its data volume and the audio
                  volume are both in the backup set (D147)
phonexa-backend   web + API (/stream and js/realtime.js frame pipeline
                  FROZEN — its base-URL constants are not, D149), reached at
                  /phonexa/ behind Caddy basic_auth (D147/D149)
adminer           ONE database browser for all four Postgres instances, via
                  Adminer's native server picker (D-T3) — not one per
                  database. Loopback only, 127.0.0.1:8082
backup            git-backup: one `pg_dump` per covered database inside a
                  single all-or-nothing transaction — mjolnir, stabbur and
                  phonexa — plus the stabbur blob and phonexa audio mirrors.
                  smia is NOT in the backup set yet; adding it (minus its
                  rebuildable lookup-cache tables) is decided but belongs to
                  postgres-consolidation
```

**Four separate Postgres instances, one per project.** Collapsing them into a
single cluster of four databases is `postgres-consolidation` — planned, not
done. Each instance's password is its own root-`.env` key
(`MJOLNIR_`/`STABBUR_`/`SMIA_`/`PHONEXA_POSTGRES_PASSWORD`) and they are
deliberately *not* collapsed into one: Postgres applies a password only when
it initialises a fresh data directory, so the existing volumes still carry the
literals they were created with.

Service keys are not renamed in this layout beyond the project prefixes:
`mjolnir-hub` keeps its key here, and becomes `mjolnir-workbench` only in
`zone-isolation`, which has to move the key and the gateway's `/mjolnir`
upstream together.

Rough RAM: each postgres 256–512 MB (four of them until
`postgres-consolidation`) · phonexa 300–500 MB · stabbur ~150 MB ·
smia ~100 MB · hub ~80 MB · builder 500 MB–1 GB while assembling · caddy ~20 MB.
Disk: ordbank import ~1 GB, audio blobs 1–5 GB over years, kept bundles ~6 MB × 10.

**Separate databases, not schemas** — it is what makes service independence
structural rather than nominal.

### What `builder` is

A background process with a small operator UI (D80) — no complexity beyond
that: a nightly clock checks whether any deck has crossed its 6-note floor and
publishes automatically if so (D78); the UI shows that same check as a live
forecast (which decks are close, how many notes each still needs) plus a
"publish now" button for when you don't want to wait. Building a bundle takes
30–60 s (parse 6 MB, inject cards, reassemble, hash, gather audio). Publishing
writes a row to `build_jobs`; `builder` picks it up and writes status back;
the UI polls. The CI-job pattern. No Redis/Celery for a single user.

### What `caddy` is for

TLS (automatic), path routing, and serving the 6 MB bundles and thousands of
small mp3s straight off disk. Python should never be in the path of those bytes.
Blobs are immutable and content-addressed → `Cache-Control: immutable`.
