## Why

`audio-link-playback-minimal` is confirmed broken on a real device, not
merely unpolished: `RNSoundPlayerModule`'s `playUrl`/`loadUrl` cannot play a
remote `https://` URL at all (`tun/docs/07-decisions.md` D122 — traced to
the compiled smali: the module's one reused `MediaPlayer` instance calls
`setDataSource(Context, Uri)` directly on every call after the first, with
nothing catching the `ContentResolver` failure a non-`file://` scheme
triggers). `file://` URIs never hit that failing path at all, which is why
this was always going to need the cache-and-prefetch design — `04-delivery.md`
already sketched most of it, just with one assumption (a working streaming
fallback on a cache miss) now known to be false. This change builds the real
thing: download-to-local-file, prefetched from app launch, play-from-disk
only.

## What Changes

- **Overwrites `patches/js/1440-audio-link-playback.edited.js` in place**
  (same file, new content — the old mechanism has nothing worth keeping
  alongside it). Stock prefixes unchanged; any other card id resolves
  `cardId → sha256` from an in-memory manifest and plays
  `"file://" + <documentDirectory>/mj-audio/<sha256>.mp3` if present, or
  silently skips — **never** attempts a direct URL play, since there is no
  working fallback (D122).
- **New prefetcher companion**, appended the same way the boot-ok companion
  is: runs at app launch (not lazily on first miss), fetches
  `/audio-manifest/<buildId>.json` (reading `globalThis.MJOLNIR_BUILD_ID`,
  already baked by the existing boot-ok companion — no new id lookup
  needed), diffs against `<documentDirectory>/mj-audio/`, downloads missing
  blobs from `/blob/<sha256>` with a small concurrency cap, atomically
  (`.tmp` + rename, the same convention the OTA bundle itself already
  uses). Keeps the manifest as an in-memory global
  (`globalThis.MJOLNIR_AUDIO_MANIFEST`) so the patched `playSoundFile`'s
  lookup is synchronous.
- **New unauthenticated manifest endpoint**: `builder` writes a second copy
  of the per-build `audio.json` manifest to an unauthenticated static path
  (`/audio-manifest/<buildId>.json`), since the existing `/ota/<buildId>/
  audio.json` is token-gated (`P23`) and nothing on the JS side has ever
  read that token back — same "the content is the capability, not a
  secret" reasoning `/blob/*` already uses, applied to a manifest naming
  only card ids and sha256 hashes, keyed off a buildId that's already baked
  into the bundle in plaintext.
- **Retires `/audio-by-card/*`** (both the Caddy block and `builder`'s
  `writeAudioByCardFiles` write step) — it existed only to give the old,
  broken mechanism a predictable name-based URL; the device now resolves
  `cardId → sha256` itself from the manifest.
- **`AUDIO_BASE_URL`'s default suffix changes** from `/audio-by-card` to the
  bare public base — the device now builds both `/audio-manifest/...` and
  `/blob/...` paths itself, so a single fixed sub-path default no longer
  makes sense. The baked-constant mechanism itself (D120) is unchanged.

## Capabilities

### New Capabilities
- `audio-cache-prefetch`: the prefetcher companion, the cache-then-play mod
  1440 patch, and the unauthenticated manifest endpoint.

### Modified Capabilities
- `audio-link-playback`: direct-URL playback is removed entirely (every
  requirement in this capability describing `playUrl(url)` against a remote
  host is replaced by cache-then-play-from-disk semantics).

## Impact

- `patches/js/1440-audio-link-playback.edited.js` — rewritten in place.
- `patches/js/` — new prefetcher companion file.
- `builder/src/audioSnapshot.js` — `writeAudioByCardFiles` removed; new
  function writing the unauthenticated manifest copy.
- `caddy/Caddyfile` — `/audio-by-card/*` block removed; new
  `/audio-manifest/*` block (same shape as `/blob/*`).
- `hub/src/server.js`, `src/commands/ui.js` — `defaultAudioBaseUrl`'s
  default suffix changes.
- No changes to `stabbur`, `smia`, `builder`'s card-minting pipeline, or the
  native patch.
- Depends on `audio-link-playback-minimal` only for the parts it reuses
  (the baked-constant mechanism, D120); independent of `progress-sync-shim`,
  `userdata-console`, and `builder-logic-bundle-store`.
