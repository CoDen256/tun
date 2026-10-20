# Delivery: bundle OTA, audio cache, versioning

## Principle: minimize the frozen part

The native patch ships once in a single re-signed APK and can never be fixed
afterwards. Therefore it does the smallest possible job. Everything that could
ever need a bug fix lives in the JS bundle, which is redeployable.

```
┌─ NATIVE (one build, frozen) ──────────────────────────────────────┐
│ 6th entry in ExpoModulesPackageList$LazyHolder →                  │
│   ReactNativeHostHandler.getJSBundleFile():                       │
│     • return null if useDeveloperSupport (never break Metro)      │
│     • return the active cached bundle if valid, else null         │
│       (null → falls back to assets://index.android.bundle)        │
│     • boot-watchdog: skip a bundle with ≥2 attempts and no        │
│       boot-ok marker                                              │
│     • kick off a background refresh; NEVER block startup          │
└───────────────────────────────────────────────────────────────────┘
┌─ JS (regenerated server-side, hot-fixable) ───────────────────────┐
│ mod 2111/2113  deck + card data      ← baked by bundle-tool       │
│ mod 1440       audio resolver        ← cache → stream → res/raw   │
│ mod 2080       sync (via shim)       ← our REST, no Firebase      │
│ NEW module     audio prefetcher      ← ExponentFileSystem         │
│ NEW module     boot-ok marker + restore hook                      │
│ mod 2119       (already patched: paywall)                         │
└───────────────────────────────────────────────────────────────────┘
```

### Why no native work is needed for audio

Both of these were verified in the decompiled APK and the bundle:

1. **`ExponentFileSystem` is already live.** `expo/modules/filesystem/FileSystemPackage`
   is one of the five packages registered in `ExpoModulesPackageList$LazyHolder`,
   exposing `downloadAsync`, `getInfoAsync`, `makeDirectoryAsync`, `moveAsync`,
   `deleteAsync`, `readAsStringAsync`, `writeAsStringAsync`, `documentDirectory`,
   `cacheDirectory`. The JS side can reach it: `requireNativeModule` /
   `NativeModulesProxy` / `expo-modules-core` are present in the bundle
   (mods 2143, 2148–2150, 2171).
2. **`playUrl` accepts local files.** `RNSoundPlayerModule.playUrl` →
   `prepareUrl` → `MediaPlayer.setDataSource(Context, Uri)`, which takes
   `file:///…` happily.

## Bundle activation: stale-while-revalidate

```
launch → activate the cached bundle IMMEDIATELY
       → in the background: GET /ota/current.json
         if current.buildId != active.buildId:
             download bundle → bundle-<id>.tmp
             verify size + sha256 + magic prefix "var __BUNDLE_START_TIME__"
             atomic rename → bundle-<id>.js
             write pending.json {buildId}
       → next launch activates it
```

Startup is never slower than stock, and a slow or unreachable server cannot
affect UX. Cost: new cards land one launch later. Given a daily study rhythm,
that is effectively invisible.

Three-tier fallback, as specified: **fetched-valid → previously-cached-valid →
embedded `assets://index.android.bundle`.**

### Boot watchdog (the anti-brick measure)

If a bundle is broken enough to crash at startup, the device never syncs again
and cannot be told to roll back — reinstall only. So:

```
JS     : on successful boot → writeAsStringAsync("boot-ok-<buildId>")
NATIVE : if bundle-<id> exists, no boot-ok-<id>, and attempts-<id> ≥ 2
             → skip it, fall back to the previous bundle, then the asset
```

~15 lines. This is the **only** extra responsibility granted to native, because
it is the only code that runs before JS.

## Audio cache

```
server : /ota/<buildId>/audio.json   { "C20007": "<sha256>", … }
         /blob/<sha256>              immutable, Cache-Control: immutable
device : <documentDirectory>/mj-audio/<sha256>.mp3
```

Resolution inside the patched mod 1440 wrapper (the single chokepoint through
which every `playSoundFile` call in the app funnels):

```
playSoundFile(name, ext):
    if name starts with a stock prefix (a/b/c01-c17/z) → playSoundFile(name, ext)   // UNCHANGED
    else if cached(name)   → playUrl("file://" + path)
    else if online         → playUrl(blobUrl)   + enqueue for caching
    else                   → skip
```

Stock cards keep byte-identical behaviour, so an audio bug can only ever affect
your own cards.

**Prefetch** runs on app foreground: read the manifest for the active build,
diff against the files present on disk, download the missing blobs with a small
concurrency cap. Content addressing means a version bump only pulls genuinely
new clips, and re-cutting one clip does not invalidate any other.

**The gap is tolerated**, deliberately: activate the bundle immediately even if
audio is incomplete. A card whose audio is not yet cached streams if online and
is skipped if not. Cards are reviewed many times, so a temporarily silent card
is recoverable; a bundle that never activates because one download 404'd is not.

## Partial downloads

Solved by the same mechanism everywhere: **download to `.tmp`, verify, atomic
rename.** A final name only ever appears after verification, so a partial
download is never addressable. Kill the app mid-download and you get an orphan
`.tmp` (swept on next launch) while the active pointer still names the previous
build.

**The directory listing is the truth** for what audio is cached — never a
written index that could drift from reality.

## Versioning

### Wire protocol: identity, not ordering

`current.json` names a `buildId`. The device asks only *"is
`current.buildId` different from `active.buildId`?"* — a string equality test.

- No ordering logic in frozen native code (where a mistake is permanent).
- **No version ordering on the server either.** Rollback is simply pointing
  `current.json` at an older `buildId`; the device sees "different" and fetches
  it. It neither knows nor cares that it is older.

### Three independent axes

```
base    : which APK's bundle the patches are applied to    (changes rarely)
patches : which logic patches are in, at what revision     (changes occasionally)
data    : which deck/card content snapshot                 (changes constantly)
```

The **patch manifest is the truth** — an explicit list `[{id, rev}, …]` recorded
in each publication, because "logic version 3" alone loses *which* of the five
or six patches are included. The integer is a label over a manifest revision.

### Human label

`base 6.0.3 · logic 3 · data 247` — rendered from the publication row. `data` is
monotonic and is simply the count of content publishes, which is what you asked
to be able to read at a glance. It is a label only; nothing in the protocol
parses or compares it.

## Observability and control (without adding app UI)

The device already talks to the server on every sync. Add fields to that same
payload rather than a separate call:

```
{ activeBuildId, pendingBuildId, audioCached, audioTotal, lastFetchError, bootOk }
```

hub renders this as a device panel. **Version selection is a server-side
control**: `/ota/current.json` points wherever you tell it. That gives you
rollback from your laptop instead of needing the phone — strictly better than an
in-app picker, and it respects the "no new Mjølnir views" constraint.
