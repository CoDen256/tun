## Context

Read `tun/docs/07-decisions.md` D121/D122 in full before touching anything —
this design exists entirely because of what D122 found tracing the compiled
smali. Read `tun/docs/04-delivery.md`'s corrected "Audio cache" section
(updated alongside D122) — it already reflects this design's shape, this
document is the detailed "how," not a re-derivation. Read
`patches/js/boot-ok-companion.js` for the append/global-constant pattern
this design's prefetcher reuses, and `builder/src/audioSnapshot.js` for the
existing `writeAudioManifest`/`ensureBlobsPresent` functions this change
extends rather than replaces.

Confirmed directly from source:
- `caddy/Caddyfile`'s `/ota/*` block requires `Authorization: Bearer
  {$OTA_TOKEN}` (P23); `/blob/*` and the (now-retired) `/audio-by-card/*`
  are both plain, unauthenticated static files — "the hash/id in the URL is
  the capability, not a secret."
- No existing JS companion reads `config.json` back (only
  `config-rotate.js` writes it) — there is no existing mechanism for JS to
  know the OTA bearer token.
- `globalThis.MJOLNIR_BUILD_ID` is already set synchronously by the boot-ok
  companion (`patches/js/boot-ok-companion.js`), immediately after the
  entry call, before any other appended code runs.
- `ExponentFileSystem`'s `downloadAsync` is confirmed already reachable
  from the bundle (`docs/findings.md` §C9), same as `readAsStringAsync`/
  `writeAsStringAsync`/`makeDirectoryAsync`, which `config-rotate.js` and
  `ota-debug-report.js` already use successfully.

## Goals / Non-Goals

**Goals:**
- Make a custom card's audio actually audible, for real, on the real
  device — the thing the previous attempt failed to achieve.
- Prefetch starts at app launch, not reactively on the first cache miss —
  operator's explicit requirement.
- Zero native work, zero new secrets threaded to JS (no OTA token on the
  client side).
- Retire the now-pointless `/audio-by-card/*` duplication cleanly.

**Non-Goals:**
- Cache eviction / size limits — not asked for, and at this project's scale
  (thousands of short clips, a few hundred KB each) not yet a real problem;
  revisit only if it becomes one.
- Retrying a failed prefetch sweep mid-session — one attempt per launch is
  enough (see D-P4); a later launch tries again naturally.
- Any change to `builder`'s minting/publish pipeline's eligibility rules —
  audio-mandatory-for-every-card (D74) is unchanged; this only changes how
  the device gets the bytes.

## Decisions

### D-P1 — Manifest served from a new unauthenticated path, not the existing token-gated one

`/ota/<buildId>/audio.json` already exists and already has the right
content — but it sits behind the OTA bearer token, and nothing on the JS
side has ever read that token back (confirmed: only `config-rotate.js`
writes `config.json`, nothing reads it). Two options:

1. Teach JS to read `config.json` and extract the token — a genuinely new
   capability, and now the client carries a token that can go stale
   relative to the server exactly like D72/P31 already warned about for a
   different token.
2. Serve a second, unauthenticated copy of the same manifest content at a
   new path — `/audio-manifest/<buildId>.json` — mirroring exactly why
   `/blob/*` and the old `/audio-by-card/*` are already unauthenticated:
   the content (card ids + sha256 hashes) isn't sensitive, and the buildId
   that selects which manifest to fetch is already baked into the bundle
   in plaintext (`MJOLNIR_BUILD_ID`).

**Chosen: option 2.** No new JS capability, no new token to keep fresh,
consistent with the security reasoning already established for two other
device-facing paths.

### D-P2 — The manifest is kept as an in-memory global, not re-fetched per play call

`globalThis.MJOLNIR_AUDIO_MANIFEST = {cardId: sha256}`, set once by the
prefetcher companion after its fetch succeeds (same pattern as
`MJOLNIR_BUILD_ID`). The patched `playSoundFile` reads this global
synchronously; the only async work per play call is `FS.getInfoAsync(path)`
to confirm the file is actually on disk. Re-fetching the manifest on every
play call would add latency and a failure mode (no network at exactly the
moment of a reveal) to something that should be instant.

### D-P3 — A cache miss is always a silent skip, never a streaming attempt

Confirmed by D122: there is no native code path that successfully streams
a remote URL on this player. `04-delivery.md`'s original sketch (`else if
online: playUrl(blobUrl) + enqueue for caching`) is corrected — a cache
miss skips playback this one time (D07: "a temporarily silent card is
recoverable") and relies entirely on the next prefetch sweep (D-P4) to have
it ready by the next review. No per-miss lazy single-file download is
added either — it would duplicate the prefetcher's own diff-and-download
logic for a case the regular sweep already covers on the next launch.

### D-P4 — Prefetch runs once per app launch, not on every foreground resume

The OTA bundle itself only updates on the *next* cold launch (D06's
stale-while-revalidate) — within one running session, `MJOLNIR_BUILD_ID`
never changes, so the manifest it would fetch never changes either.
Re-running the sweep on every foreground resume (the literal reading of
`04-delivery.md`'s original "runs on app foreground" phrasing) would
re-diff the same directory against the same manifest repeatedly for no
benefit, burning battery/network. Chosen: run once, at the same point in
startup the boot-ok companion's own timer logic lives, fire-and-forget,
never blocking the UI thread or app startup.

### D-P5 — Downloads are capped and atomic

A small concurrency cap (3 concurrent `downloadAsync` calls) — enough to
make a cold cache (a fresh install, or a big batch of new cards) finish in
reasonable time without opening dozens of connections at once. Each
download target is written to `<sha256>.mp3.tmp` first, then renamed —
identical convention to the OTA bundle's own download path, so a killed
app mid-download leaves an orphan `.tmp` (harmless, never addressable) and
never a half-written file a later play attempt could pick up.

### D-P6 — `/audio-by-card/*` and `writeAudioByCardFiles` are retired, not kept alongside

Once the device resolves `cardId → sha256` itself from the manifest, the
card-id-keyed duplicate file has no remaining purpose — keeping it would
mean maintaining two parallel "make this card's audio reachable" mechanisms
for one consumer that only ever needs one. `builder/src/audioSnapshot.js`'s
`writeAudioByCardFiles` and the Caddy block it fed are both removed in this
change, not just left unused.

## Risks / Trade-offs

- **A device that's never online at launch never gets anything prefetched
  that run** — acceptable per D-P4/Non-Goals: the next launch tries again,
  and D07 already tolerates a temporarily silent card.
- **Three concurrent downloads is a guess, not measured** — fine at this
  project's scale (a few hundred short clips); revisit only if real-device
  testing shows it's actually too slow or too aggressive.
- **The manifest duplication (`/ota/<buildId>/audio.json` and
  `/audio-manifest/<buildId>.json` are the same content, two paths)** is
  the same class of acceptable duplication D45 already accepts for
  audio-blob storage itself.

## Migration Plan

None — no on-device data depends on the old mechanism (it never worked).
Sequencing within this change:

1. `builder`: new unauthenticated manifest write + retire
   `writeAudioByCardFiles`, independently testable.
2. Caddy: swap the `/audio-by-card/*` block for `/audio-manifest/*`.
3. The prefetcher companion, testable against a fixture manifest/server.
4. The rewritten mod 1440 patch, testable against the same fixtures used
   for the prefetcher.
5. `AUDIO_BASE_URL` default-suffix change in both assemble paths.

## Open Questions

- Should the prefetcher companion log anything observable (matching
  `ota-debug-report.js`'s precedent) for "N of M cards cached" visibility
  without `adb`? Not required for this change to work, but would help
  diagnose a future "audio still silent" report. Lean toward adding a
  minimal one-line `Log.i`-equivalent (`console.log`, visible via `adb
  logcat` same as the existing `mjolnir-ota` breadcrumb) once the core
  mechanism is proven on-device — not blocking the first version.
