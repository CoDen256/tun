## 0. Before you write any code

Read `design.md` in full, especially D-P1 (why the manifest gets a new
unauthenticated path instead of reusing the token-gated `/ota/<buildId>/
audio.json`) and D-P3 (a cache miss is always silent — there is no
streaming fallback, confirmed broken, D122). Read
`tun/docs/07-decisions.md` D121/D122 before touching
`patches/js/1440-audio-link-playback.edited.js` — this change overwrites it
in place, it does not create a second file.

## 1. `builder`: manifest + retiring the old static copy

- [x] 1.1 `builder/src/audioSnapshot.js`: new function writing the audio
      manifest to an unauthenticated static location (e.g.
      `data/audio-manifest/<buildId>.json`), alongside the existing
      `writeAudioManifest` (which keeps writing the token-gated
      `data/ota/<buildId>/audio.json` copy unchanged — some other future
      consumer may still want the authenticated version; this change only
      adds a second, public one).
- [x] 1.2 Remove `writeAudioByCardFiles` and its call site in
      `pipeline.js` (or wherever it's invoked) — no longer needed once the
      device resolves `cardId → sha256` itself.
- [x] 1.3 Tests: publishing a build writes the new manifest copy with
      correct `{cardId: sha256}` content; `writeAudioByCardFiles` and its
      output directory are gone from the codebase (no dangling references).

## 2. Caddy

- [x] 2.1 Remove the `/audio-by-card/*` block from `caddy/Caddyfile`.
- [x] 2.2 Add a new `/audio-manifest/*` block, same shape as `/blob/*`
      (unauthenticated, GET/HEAD only, long-lived `Cache-Control` —
      immutable per buildId, since a given buildId's manifest never
      changes once published).
- [x] 2.3 Confirm via `caddy adapt --adapter caddyfile` (per D99's
      established practice) that the new block compiles to a reachable
      route, not shadowed by directive ordering.

## 3. The prefetcher companion

- [x] 3.1 New `patches/js/audio-prefetch-companion.js` (appended the same
      way `boot-ok-companion.js` is, via `src/commands/companion.js` — no
      new append mechanism): on app launch, read `globalThis
      .MJOLNIR_BUILD_ID`, fetch `${AUDIO_BASE_URL}/audio-manifest/
      ${MJOLNIR_BUILD_ID}.json`, set `globalThis.MJOLNIR_AUDIO_MANIFEST` to
      the result. `AUDIO_BASE_URL` is read from the same
      `__MJOLNIR_AUDIO_BASE_URL__` placeholder the mod 1440 patch uses
      (D120's existing baked-constant mechanism — not a new one).
- [x] 3.2 Same companion: list `<documentDirectory>/mj-audio/`, diff
      against the manifest's sha256 values, download whatever's missing
      from `${AUDIO_BASE_URL}/blob/<sha256>` via `ExponentFileSystem
      .downloadAsync`, capped at 3 concurrent downloads (D-P5), writing to
      `<sha256>.mp3.tmp` then renaming — never surfacing a partially
      written file.
- [x] 3.3 Never blocks startup: the fetch-and-download sweep runs
      fire-and-forget; no await on the critical startup path.
- [x] 3.4 One attempt per launch, no retry loop if the manifest fetch fails
      (offline at launch) — per D-P4, the next launch tries again.
- [x] 3.5 Tests: a fixture manifest + fixture server, confirm the diff
      correctly skips already-cached files, downloads only missing ones,
      respects the concurrency cap, and a killed-mid-download simulation
      never leaves an addressable partial file.

## 4. Rewrite the mod 1440 patch

- [x] 4.1 Overwrite `patches/js/1440-audio-link-playback.edited.js` (same
      file, not a new one) and its `.baseline.js` counterpart if needed:
      `playSoundFile` checks the stock-prefix list unchanged; otherwise
      looks up `globalThis.MJOLNIR_AUDIO_MANIFEST[name]` for a sha256, and
      if the corresponding `<documentDirectory>/mj-audio/<sha256>.mp3`
      exists (`FS.getInfoAsync`), calls `s.playUrl("file://" + path)`;
      otherwise does nothing (D-P3 — no attempt at any direct URL play).
- [x] 4.2 Tests: a stock-prefixed id's patched output still calls
      `playSoundFile` unchanged; a non-stock id with a cached file plays
      via the `file://` path; a non-stock id with no manifest entry or no
      cached file silently does nothing (no exception, no URL play
      attempted).

## 5. Baked-constant default update

- [x] 5.1 `hub/src/server.js`'s `defaultAudioBaseUrl` and
      `src/commands/ui.js`'s `defaultAudioBaseUrl`: drop the
      `/audio-by-card` suffix — default to the bare `TUN_PUBLIC_BASE`
      (the device now builds `/audio-manifest/...` and `/blob/...` itself).
- [x] 5.2 Tests: assembling with `audioBaseUrl` omitted bakes the bare
      public base, not a `/audio-by-card`-suffixed one.

## 6. Hand-off

This change's implementable scope ends with the patch files, `builder`
changes, and Caddy block landed and tested. **Assembling/installing a
bundle with the rewritten patch and verifying it on-device are the
operator's own steps, done outside this change.**

- [x] 6.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 6.2 **(Operator, outside this change)** Assemble/install a bundle
      with the rewritten mod 1440 patch and the new prefetcher companion;
      confirm on-device: app launch triggers the prefetch sweep (observable
      via `mj-audio/` populating without opening any card); a real
      published custom card's audio plays after the sweep has run; a stock
      card still plays with no network activity.
