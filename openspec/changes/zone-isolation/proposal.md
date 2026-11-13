## Why

The operator stated the requirement as a series of concrete failures that must
not propagate:

> *"If builder is not working, I still want to serve latest OTA bundle. Or if
> workbench is not working, I still want it to be able to receive the sync
> updates from device. If smia not working, stabbur should just not provide
> suggestions… the same goes for IPA vowel chart + lang editing / live speech /
> formant lab and shadowing — those are different services."*

Most of that already holds. Three things do not:

1. **`hub` is one process serving both the operator console and the device's
   progress sync.** Deploying the workbench interrupts device sync; a fault in
   either takes down the other.
2. **`hub` cannot start without Postgres at all.** `hub/bin/server.js` awaits
   `migrate()` and `seedDecks()` *before* `listen()`, so a database outage means
   `/mjolnir` returns 502 — not "no catalogue", no console whatsoever.
3. **phonexa is one process and one database serving two unrelated domains** —
   vowels/consonants/formants, and shadowing practice.

This change draws the zone boundaries where the data and the failure modes
already divide, and makes every cross-zone dependency degrade instead of cascade.

## What Changes

**Eight zones.**

```
DEVICE PLANE                        OPERATOR PLANE
  ota            files, no process    mjolnir-workbench
  mjolnir-sync   new container        mjolnir-builder
                                      stabbur   smia
                                      phonexa   shadow      (hover-translate: client)
```

**`hub` splits into `mjolnir-sync` and `mjolnir-workbench`.** `userdata.js` is
already a self-contained 396-line module with no coupling to the rest of hub;
`mjolnir-sync` is a thin server around it. Both share the `mjolnir` database.
`mjolnir-builder` is already its own container and keeps the property that it
needs no inbound path at all — with the gateway down, scheduled builds continue.

**phonexa splits into `phonexa` and `shadow`, with separate databases.** The
schema already divides cleanly: **zero foreign keys cross the two domains.**

```
 PHONEXA (vowels)                           SHADOW (shadowing)
 languages ─┬─► samples ─┬─► sample_analyses
            │            ├─► tokens          shadowing_media
            ├─► vowels ◄─┘                         │
            └─► consonants                         ▼
                                            shadowing_segments ─┐
 users ◄── settings                                 ▲───────────┘
   ▲
   └────────────── shadowing_media.user_id    ← the ONLY cross-domain FK
```

`shadowing.py` is already a Flask blueprint on its own `/api/v1/shadowing/*`
namespace importing only its own two models; `formanter.py` imports only the
vowel-domain models. The file boundary already matches the domain boundary.

The single cross-domain FK is dropped per D42's existing rule (no cross-service
foreign keys): `users`/`settings` stay with phonexa, and `shadow` holds a plain
`user_id`. The two stateless endpoints move with shadow — `/transcribe` (a pure
smia proxy, no database) and `/api/v1/youtube-extract` (shells to yt-dlp,
returns audio, no database) — which also moves the two processes most likely to
hang out of the service holding the vowel chart.

**shadow stores audio through phonexa**, per operator direction: shadow calls
phonexa's audio-storage API rather than mounting the audio volume. One owner of
the audio tree, one backup path.

**Every service serves before it migrates.** `listen()` first, schema work in
the background behind a readiness flag, pages render degraded rather than
failing to boot. With Postgres down the workbench shell, Assemble tab and OTA
verify tool still load; catalogue, Cards, Decks and Device show "database
unavailable"; publishing is refused with a reason — and the device keeps
updating throughout, because OTA is files on disk.

**One console across three containers.** Shared layout in `libs/` renders the
same navigation everywhere, and the gateway serves a static status page on any
502 — so a dead zone yields a page naming which zone died with links to the live
ones, not a bare gateway error.

## Capabilities

### New Capabilities
- `zone-isolation`: the zones, what may and may not propagate, the degradation
  contract, and the always-available status page.

### Modified Capabilities
- `auto-migration`: serve first, migrate behind a readiness flag.

## Impact

- `mjolnir/` (hub split), `phonexa/` (shadow extracted), `shadow/` (new),
  `grind/` (routing, status page), `libs/` (layout, bootstrap), `postgres/`
  (the `shadow` database, created empty by `postgres-consolidation`).
- A table move: `shadowing_media` and `shadowing_segments` out of the `phonexa`
  database into `shadow`.
- New ADR rows; D46's "vendored CSS, not a package" is reversed for layout.

**Non-goals:**
- No auth change. `mjolnir-sync` keeps validating exactly the credential it
  validates today; the device sees no difference. The gate is
  `unified-auth`.
- **No change to the device-facing contract.** The sync endpoint's path, method,
  header, body shape and status codes are unchanged. `11-ota-contract.md` is
  untouched.
