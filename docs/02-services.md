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
| `mjolnir/` | `docs/findings.md`, `tool/` (bundle-tool, Node — D76), `patches/js/`, `patches/native/`, `apk/`, `builder/` (Node, imports `tool/` as a library), `hub/`, `sync/`, and `bin/ota-publish.sh`/`ota-verify.sh`. ***The gateway is no longer here***: `caddy/` moved to `grind/caddy/Caddyfile` with `unified-auth` section 1, superseding D84 | stabbur |
| `stabbur/` | captures, notes, enrichment orchestration, triage UI, audio blobs | smia |
| `smia/` | `/inflect` `/ipa` `/tts` `/stt` `/translate`, provider chains, and its UI at the prefix root `/smia/` (D46's `/ui` is superseded — D159) | nothing |
| `phonexa/` | phonetics lab; deployed as part of the unified stack at the authenticated `/phonexa/` path (D147/D149) | smia (optional), stabbur (optional import) |
| `shadow/` | shadowing: media, segments, transcription — split out of phonexa by `zone-isolation` | smia (transcription), phonexa (ingest, both optional-degrading) |
| `grind/` | the gateway: TLS, path routing, the operator `basic_auth` gate, the status page, the off-disk device plane. Moved out of `mjolnir/` by `unified-auth` §1 | — |
| `postgres/` | the one Postgres 17 cluster: five databases, five roles, bootstrap idempotent on every boot (D155/D156) | — |
| `libs/` | shared code: the one operator-auth check (D159), prefix handling, layout, serve-before-migrate bootstrap (D157) | — |
| *(external)* `hover-translate` | capture client (fork, Chrome-only, private/unpublished — D144). **Its own repository, not a project here — D154** (checked out as a pinned submodule since 2026-11-15). Never deployed | stabbur, smia |
| `backup/` | the git-backup service (D-C1..D-C5): a `pg_dump` per covered database (mjolnir, stabbur, phonexa, shadow — smia deliberately excluded, operator decision 2026-11-14: its tables are caches and imported corpora) plus the blob and audio mirrors | the cluster |

`mjolnir` is **self-contained for everything Mjølnir**: bundle format knowledge,
the JS patch set, the native patch source, the APK rebuild pipeline, the builder
and the device-facing hub. It is not coupled to phonexa. *(D37 stated this as a
property of a separate repository and is **superseded by D150** — the knowledge
boundary it protected is a directory boundary now, and it still holds.)*

`findings.md` lives in `mjolnir/docs/`. Cross-project design (this directory)
lives in `docs/`, which is also the "where do I start" entry point.

*(A paragraph here used to list `grind/`, `shadow/`, `postgres/` and `libs/`
as "planned, not present". All four exist and are in production since the
2026-11-14 cutover; they are rows in the table above now.)*

## Dependency graph

```
  hover-translate ──capture──► stabbur ──enrich──► smia   (smia depends on nothing)
  (external, own repo)             ▲                  ▲
                                   │                  │ transcribe
   pull: GET /api/notes?…          │                  │
         + blobs by sha256         │               shadow ──store audio──► phonexa
                        mjolnir-workbench
                        mjolnir-builder
                        mjolnir-sync ──────progress sync──────► device
                        (the gateway serves /ota/*, /blob/* and
                         /audio-manifest/* off disk — no process,
                         no database, D55)
```

**Eight zones, and what may NOT propagate between them** (D157/D158). The
device plane is two separate things: update delivery, which depends on nothing
but the gateway and a filesystem, and progress sync, which has its own process
and its own database but no dependency on the console.

| zone | hard dependencies | degrades to |
|---|---|---|
| `ota` (gateway, off disk) | gateway, filesystem | — |
| `mjolnir-sync` | gateway, database | — |
| `mjolnir-workbench` | gateway | db → 503 on data views, console and workbench keep serving; stabbur → no note links |
| `mjolnir-builder` | database, stabbur | gateway → **only its UI**; builds keep running |
| `stabbur` | gateway, database | smia → no suggestions |
| `smia` | gateway, database | `providers/` → empty candidates |
| `phonexa` | gateway, database | — |
| `shadow` | gateway, database | smia → no transcription; phonexa → no ingest, no profile names |
| `hover-translate` (external) | gateway | smia → no translation; stabbur → no capture |

Two shared dependencies remain — the gateway and the database cluster — and
`ota` depends on neither.

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
| `/mjolnir/userdata/*` | mjolnir-sync | **device-facing** — gated at the gateway on the device's `Bearer` token, its own `handle` block ahead of the operator plane (D158, `unified-auth` 2.1-2.3) |
| `/mjolnir` | mjolnir-hub | `basic_auth` at the gateway |
| `/builder` | mjolnir-builder | `basic_auth` at the gateway |
| `/stabbur/*` | stabbur-backend | UI at `/stabbur/` (D46's `/ui` superseded) |
| `/smia/*` | smia-backend | UI at `/smia/` (D46's `/ui` superseded) |
| `/phonexa/*` | phonexa-backend | Caddy `basic_auth`; `/phonexa` must redirect to `/phonexa/` |
| `/shadow/*` | shadow-backend | `basic_auth` at the gateway (D157's split-out service) |
| `/adminer/*` | adminer | `basic_auth` at the gateway. ***Corrected***: this row said "**unauthenticated at the gateway**" until `unified-auth` 3.1 — a database-admin tool on the public origin behind nothing. It is gated now, like every other operator zone; the `127.0.0.1:8082` mapping is loopback-only and unchanged |

**One credential for the whole operator plane, checked in the gateway**
(D160). Username `operator`, password `OPERATOR_AUTH_TOKEN`, Caddy
`basic_auth` in front of all seven zones above; the hash is derived from the
token at container start and is never stored in a file. Behind it, every
service runs **one** shared check (`libs/pyservice/auth.py`,
`libs/jsservice/auth.js`) — the gateway's `X-Tun-Operator` marker, or
`Bearer INTERNAL_TOKEN` for service-to-service calls — replacing the three
separate implementations D-S6, D-N1 and D-H6 had each added (D159). There are
no login pages and no per-service tokens left.

stabbur and smia serve their UI at the **prefix root** (`/stabbur/`,
`/smia/`) with assets under `/static/`; the `/ui` sub-path is gone (404) and
D46's `/ui` convention is superseded. This also fixed a live defect: with the
UI at `/ui`, `https://coden256.dev/stabbur/` answered 401 even with a correct
credential, because stabbur had no route at `/` at all.

**phonexa is routed by path like the others** (D149, superseding D148's
subdomain decision). It became prefix-aware the same way stabbur (D46) and
smia (D119) did — `X-Forwarded-Prefix` → an injected global → one `API_BASE`
constant — so the dedicated hostname it used to need is gone, along with its
DNS record and certificate. It is still gated at Caddy by `basic_auth` on the
operator token, so it answers with a native credential prompt. *(Updated: it
is no longer gated **only** at Caddy — "phonexa has no auth of its own" was
true when this was written and is not any more. D159 gave it the shared
check, which is why its destructive `POST /api/v1/admin/export`, previously
200 to an unauthenticated caller reaching the container directly, now answers
401.)* Two consequences worth knowing:
`/phonexa` must redirect to `/phonexa/` or its relative assets escape the
prefix, and it now shares an origin with hub and builder.

## Deployment

One Contabo VPS: **8 GB RAM, 100 GB disk** (comfortably above the 4 GB floor).

**One repository, one Compose project, one deploy (D150).** A deploy is one
`git pull` and one `docker compose up` at the repository root. The root
`compose.yaml` defines only the shared Adminer and the backup service; it
`include:`s each project's own `compose.yaml` (`grind`, `mjolnir`, `stabbur`,
`smia`, `phonexa`, `shadow` — each of which in turn `include:`s the shared
`postgres/`), and every one of those stays fully usable standalone
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

**The gateway lives in `grind/`** (`grind/caddy/Caddyfile`, moved out of
`mjolnir/` by `unified-auth` §1 with every device response byte-compared
before and after). The OTA scripts stay in `mjolnir/bin/` —
`ota-publish.sh`/`ota-verify.sh` are about the bundle pipeline, not the
gateway. *(This paragraph said "still lives in `mjolnir/` until
`zone-isolation` moves it" — that move happened, under `unified-auth` rather
than `zone-isolation`.)*

**Host ports.** The unified stack publishes **only** the gateway (80/443) plus
a loopback-only Adminer on `127.0.0.1:8082`. Every other port mapping lives in
a per-project `compose.override.yaml`, which Compose auto-loads only for the
primary compose file of the directory it is invoked in — so
`cd smia && docker compose up` publishes loopback ports for native
development while the unified stack publishes nothing at all (D152).

Twelve services, all deployed today (post-cutover, 2026-11-14):

```
caddy             TLS, path routing, the operator basic_auth gate, and STATIC
                  serving of bundles, blobs and the audio manifest straight
                  off disk — no application process in the path of those
                  bytes (D55). grind/'s service; the only one that publishes
                  a public port
postgres          ONE Postgres 17 cluster (D155): five databases, five roles,
                  each role's password derived from POSTGRES_PASSWORD
postgres-init     the one-shot idempotent bootstrap (D156): databases, roles,
                  grants on every boot, never /docker-entrypoint-initdb.d
mjolnir-hub       the operator console: publish history, cards browser,
                  device insights (D80). No device traffic any more
mjolnir-sync      DEVICE PLANE: /mjolnir/userdata/* progress sync, its own
                  process split out of hub (D158)
mjolnir-builder   worker + operator UI: live forecast and the manual
                  "publish now" button (D78, D80)
stabbur-backend   web + API, reached at /stabbur/ (its UI is that same path)
smia-backend      web + API, reached at /smia/ (its UI is that same path)
phonexa-backend   web + API (/stream and js/realtime.js frame pipeline
                  FROZEN — its base-URL constants are not, D149), reached at
                  /phonexa/ (D147/D149)
shadow-backend    shadowing, split out of phonexa (zone-isolation), at
                  /shadow/
adminer           ONE database browser for the one cluster (D-T3): log in as
                  a service role, which sees only its own database. Loopback
                  only, 127.0.0.1:8082, and gated at /adminer/
backup            git-backup: one `pg_dump` per covered database inside a
                  single all-or-nothing set — mjolnir, stabbur, phonexa,
                  shadow — plus the stabbur blob and phonexa audio mirrors.
                  smia is DELIBERATELY not dumped (operator decision,
                  2026-11-14): caches and imported corpora only — which
                  makes smia/providers/ the thing to keep safe (DEPLOY.md §7)
```

**One Postgres 17 cluster, five databases** (D155/D156) — the four separate
per-project instances this section used to describe were consolidated at the
2026-11-14 cutover, their four password keys retired (`bin/check-standards.sh`
fails on them), and the pre-cutover volumes retired after the daily backup was
restore-verified. D42's logical separation is unchanged: separate databases,
separate roles, no cross-service foreign keys.

Service keys are not renamed beyond the project prefixes: `mjolnir-hub` keeps
its key, and becomes `mjolnir-workbench` only in a change that moves the key
and the gateway's `/mjolnir` upstream together (deferred).

Rough RAM: the cluster 512 MB–1 GB · phonexa 300–500 MB · stabbur ~150 MB ·
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
