# Tun — services, repos and deployment

**Tun** = the farmyard: the shared centre every building faces. The naming
family is a Norwegian farm — `smia` the forge, `stabbur` the storehouse.

## Repos (6)

| repo | contains | depends on |
|---|---|---|
| **tun** | `compose.yaml`, Caddyfile, backup scripts, **ecosystem docs (this directory)**, shared UI shell | — |
| **mjolnir** | `docs/findings.md`, `tool/`, `patches/js/`, `patches/native/`, `apk/`, `builder/`, `hub/` | stabbur |
| **stabbur** | captures, items, enrichment orchestration, triage UI, audio blobs | smia |
| **smia** | `/inflect` `/ipa` `/tts` `/stt` `/translate`, provider chains, `/ui` | nothing |
| **phonexa** | phonetics lab (unchanged) | smia (optional), stabbur (optional import) |
| **hover-translate** | capture client (fork, store releases) | stabbur, smia |

`mjolnir` is **self-contained for everything Mjølnir**: bundle format knowledge,
the JS patch set, the native patch source, the APK rebuild pipeline, the builder
and the device-facing hub. It is not coupled to phonexa.

`findings.md` lives in `mjolnir`. Cross-repo design (this directory) lives in
`tun`, which is also the "where do I start" entry point.

## Dependency graph

```
hover-translate ──capture──► stabbur ──enrich──► smia        (smia depends on nothing)
                                 ▲
                                 │ pull: GET /api/items?status=ready&since=…
                                 │       + blobs by sha256
                            mjolnir/hub ──OTA + sync──► device
                            mjolnir/builder

phonexa ──► smia (optional)        phonexa ◄── stabbur blob import (optional, by hash)
```

One-directional. stabbur does not know hub exists. smia is a leaf.

## Division of knowledge

| | stabbur | mjolnir/hub |
|---|---|---|
| knows | text, translations, context, audio, pos, inflections, transcription, kind (`word`/`phrase`/`sentence`/`grammar-rule`), status | `card_slots` (permanent 6-char ids), deck assignment C20–C29, card types a–e, projection to N/E/X/A, occurrences, lag-11 interleave, bundle assembly, audio manifest, device sync |
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
Served under **one domain by path** — `/stabbur`, `/smia`, `/mjolnir`, `/phonexa` —
with a shared header/nav so four UIs feel like one system. The shell is vendored
CSS, not a shared package (solo-dev simplicity over DRY).

## Deployment

One Contabo VPS: **8 GB RAM, 100 GB disk** (comfortably above the 4 GB floor).

```
caddy           TLS, path routing, STATIC serving of bundles and blobs
postgres        separate logical DB per service — NO cross-service FKs
stabbur         web + API
smia            web + API
phonexa         web + API (existing; /stream and js/realtime.js FROZEN)
mjolnir-hub     device-facing: /ota, /mjolnir/userdata, heartbeat
mjolnir-builder worker: polls build_jobs → bundle + audio manifest
```

Rough RAM: postgres 256–512 MB · phonexa 300–500 MB · stabbur ~150 MB ·
smia ~100 MB · hub ~80 MB · builder 500 MB–1 GB while assembling · caddy ~20 MB.
Disk: ordbank import ~1 GB, audio blobs 1–5 GB over years, kept bundles ~6 MB × 10.

**Separate databases, not schemas** — it is what makes service independence
structural rather than nominal.

### What `builder` is

A background process with no web interface. Building a bundle takes 30–60 s
(parse 6 MB, inject cards, reassemble, hash, gather audio). Publishing writes a
row to `build_jobs`; the builder picks it up and writes status back; the UI polls.
The CI-job pattern. No Redis/Celery for a single user.

### What `caddy` is for

TLS (automatic), path routing, and serving the 6 MB bundles and thousands of
small mp3s straight off disk. Python should never be in the path of those bytes.
Blobs are immutable and content-addressed → `Cache-Control: immutable`.
