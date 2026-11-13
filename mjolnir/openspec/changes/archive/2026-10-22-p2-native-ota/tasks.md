## 1. Pre-flight against the build base

- [x] 1.1 Confirm the five hook facts on `base/smali.mjolnir.merged` v1.5.12 still hold: LazyHolder 5-entry array, wrapper lazy chain at `ReactNativeHostWrapperBase.smali:148`, `ReactNativeHostHandler` + `$-CC` defaults, `Package.createReactNativeHostHandlers`, `FileSystemModule.smali:2784` filesDir anchor
- [x] 1.2 Baked-in URL/token are written as **placeholders** (`__MJOLNIR_OTA_URL__`, `__MJOLNIR_OTA_TOKEN__`) in the `const-string`s of D-N6, substituted at build time. The operator supplies the real values immediately before assembling (D64) — the smali does not need them to be written or reviewed
- [x] 1.3 Fallback-bundle pairing decided: the embedded tier-4 bundle is **plain stock v1.5.12** (built from this base), unmodified — the first content/UI change ships later as an OTA bundle, not baked in (D68)

## 2. Native patch — the new handler class

- [x] 2.1 Author `OtaPackage` smali implementing `Package` (four `create*` → emptyList; `createReactNativeHostHandlers` → one-element list of `this`) and `ReactNativeHostHandler`, under `smali_classes4/com/lightblitzlearning/ota/`
- [x] 2.2 Declare every `ReactNativeHostHandler` method forwarding to `ReactNativeHostHandler$-CC;->$default$…`, except `getJSBundleFile(Z)` which gets a real body (prevents `AbstractMethodError`)
- [x] 2.3 Implement `getJSBundleFile(Z)`: `useDeveloperSupport` → `null`; else run synchronous local selection, write the attempt marker before returning, spawn the background refresh+GC daemon, return the selected path or `null`

## 3. Native patch — launch-path selection (§2)

- [x] 3.1 Resolve base dir as bare `getFilesDir()/mjolnir-ota/` (D56); treat unreadable/invalid `active`/`pending` tokens as absent
- [x] 3.2 Implement tier order: pending(+promote: write `active`, delete `pending`) → active → newest-mtime boot-ok'd bundle → `null`
- [x] 3.3 Apply the cheap activation check (length>0 ∧ first 26 bytes `var __BUNDLE_START_TIME__=`) to each candidate; honour `bad-<id>` and the watchdog threshold
- [x] 3.4 Apply D54: rewrite `active` to the id actually returned, or delete it when falling through to the asset
- [x] 3.5 Write `active`/`pending` via `.tmp`→`renameTo` only

## 4. Native patch — watchdog (§4)

- [x] 4.1 Create `attempt-<id>-<n+1>` immediately before handing over a path (separate files, no read-modify-write)
- [x] 4.2 Skip + write `bad-<id>` when `attempts ≥ 2` ∧ no `boot-ok-<id>`; fall to next tier
- [x] 4.3 Treat `boot-ok-<id>` as making attempt count irrelevant forever; never auto-clear `bad-<id>`

## 5. Native patch — background refresh (§1, §3, §5, §6)

- [x] 5.1 Resolve config: read `config.json` `{url, token}` if present/parseable/https, else baked-in defaults; malformed ⇒ fall back, never crash
- [x] 5.2 Fetch + parse `current.json`; read only `buildId`/`url`/`sha256`/`size`, ignore the rest; validate buildId regex, https url, 64-hex sha256, `0 < size ≤ 64 MiB`; any failure ⇒ abandon silently
- [x] 5.3 Download with `HttpURLConnection`: no `Accept-Encoding`; `setInstanceFollowRedirects(false)` + manual https-only redirect loop (D53); `Authorization: Bearer`; connect 10 s / read 30 s / overall 120 s; stream into `.tmp`, abort when bytes > `size`
- [x] 5.4 Post-download verify (before rename): exact `size`, streamed `sha256`, 26-byte prefix; on success `renameTo bundle-<id>.js` then write `pending`; on failure delete `.tmp`, touch nothing else
- [x] 5.5 GC on the background thread only: delete `.tmp` and `bundle-*.js` outside {active, pending, two newest boot-ok'd} with their markers

## 6. Native patch — registration (irreversible edit)

- [x] 6.1 Edit `ExpoModulesPackageList$LazyHolder.<clinit>`: bump packages array `0x5`→`0x6` from a fresh register (raise `.locals 8`→`9`, size in `v8`), append `new-instance OtaPackage`/`aput` at index 5 (reuse `v0`=`0x5`), leave the `modulesList` tail untouched
- [x] 6.2 Smoke-assemble the patched smali and confirm no `baksmali`/`smali` errors

## 7. JS companion (redeployable, §4 JS side / §5)

- [x] 7.1 `patches/js/boot-ok-companion.js`: appended after `__r(0)`, a 3 s timer (survives → writes `documentDirectory + "mjolnir-ota/boot-ok-<buildId>"` empty; crash within 3 s → no marker) with a bounded retry while expo modules install; FS resolved via the app's own `__r(2150).requireNativeModule('ExponentFileSystem')` (which calls `ensureNativeModulesAreInstalled()` and falls back to `NativeModulesProxy`), degrading to the bare `globalThis.expo.modules` lookup only if that fails
- [x] 7.2 `buildId` substituted at build via `bundle-tool companion --build-id` (no publish pipeline in `mjolnir` yet; `tun/bin/ota-publish.sh` is the publisher — pass the SAME id). `__MJOLNIR_BUILD_ID__` placeholder, mirroring the token
- [x] 7.3 `patches/js/config-rotate.js`: exposes `globalThis.__mjolnirRotateOtaConfig(url, token)`, https-only (rejects non-https before writing) — D39/D53

## 8. Build, sign, install

- [x] 8.1 Embedded fallback = **plain stock v1.5.12** base bundle, `b3ad6aee…5741`, unmodified (D68). Ships as-is from `base/`; no companion in the embedded tier, which is correct — tier 4 has no buildId and is never watchdogged (contract §2)
- [x] 8.2 **Substitute `__MJOLNIR_OTA_URL__` / `__MJOLNIR_OTA_TOKEN__`** via `patches/native/substitute.sh <out-dir>` (env `MJOLNIR_OTA_URL`/`MJOLNIR_OTA_TOKEN`; refuses non-https and refuses to emit smali with a surviving placeholder), then gate the built dex with `patches/native/substitute.sh --check-dex <classes.dex>`. An unsubstituted placeholder ships an APK whose every fetch 401s, forever and silently (D64)
- [x] 8.3 Build → align → sign — **`apk/build.sh`**: stage `base/` into untracked `build/deploy/` → substitute (D64) → overlay the patch (asserts `OtaPackage` landed, `LazyHolder` is patched, no placeholder survives) → `at bl -fvazs -k ~/.android/debug.keystore` → unzip and gate every `classes*.dex`. Emits `build/deploy/signed.mjolnir.merged.apk` and prints its signer
- [x] 8.4 Installed; signer `d2a16b2d…675b` matches the existing install, so it upgraded in place

## 9. Acceptance — the irreversible-step gate

- [x] 9.1 **PASS** — L1 `select tier=asset path=null`. Dex sound: no `VerifyError`, no `AbstractMethodError`, no `ArrayIndexOutOfBounds` from the 5→6 array edit
- [x] 9.2 **PASS** — L2 `tier=pending path=…/bundle-b000002.js`, L3 and L4 `tier=active`. L4 is the load-bearing one: no quarantine means the companion's `boot-ok-b000002` was written
- [x] 9.3 **PASS.** Published `b000crash`: 122-byte bundle, valid 26-byte
      prefix, body = `throw new Error(...)` before any module code runs — so
      it satisfies native's cheap validity check but crashes before the
      companion's `__r(0)` call ever runs, making `boot-ok` structurally
      impossible. Five-launch `mjolnir-ota` logcat trace:
      `tier=pending→CRASH (attempt-1)` → `tier=active→CRASH (attempt-2)` →
      `tier=boot-ok path=bundle-b000003.js` (quarantined `bad-b000crash`,
      fell back — **no crash**, the recovering launch itself is clean) →
      `tier=active path=bundle-b000003.js` (recovery holds, D54's rewrite of
      `active` confirmed). Leaves a permanent `bad-b000crash` tombstone by
      design (D65)
- [x] 9.4 **PASS (after a real bug found and fixed, D71/P30).** First attempt:
      republished `current.json` at `b000002`, whose bundle GC had retained
      (one of the two newest boot-ok'd). `refresh()`'s existing-file early-exit
      only checked quarantined-vs-not and returned either way without checking
      active/pending, so `pending` was never written — device stayed on
      `b000003` across multiple restarts with no error. Fixed in
      `OtaPackage.java`, smali regenerated, rebuilt, reinstalled. **Retest
      2026-10-22 21:52, PASS**: `mjolnir-ota` logcat confirms
      `tier=active path=…/bundle-b000002.js` on the very next launch after
      repointing. Identity-based rollback (D26) now genuinely works with no
      reinstall
      **Bug found 2026-10-21 (D71/P30):** republished `current.json` at
      `b000002`, whose bundle file was still on disk (kept by GC as one of the
      two newest boot-ok'd). `refresh()`'s existing-file early-exit never wrote
      `pending`, so the device stayed on `b000003` across multiple restarts.
      Fixed in `OtaPackage.java` + regenerated `.smali`; **needs a rebuild,
      reinstall and a fresh 9.4 run before this task can be checked off**
- [x] 9.5 **PASS (both halves), plus a self-inflicted lockout found and
      recovered, D72/P31.** Positive: `config-rotate.js` wrote a new token
      (same URL); VPS token swapped to match; device fetched `b000final`
      under the NEW token exclusively (old token already dead server-side —
      proves `config.json` governs, not the baked-in default). Negative: a
      bundle wrote a non-https `config.json` directly (bypassing
      `config-rotate.js`'s own guard, to exercise native's own rejection);
      next cold start, native read it, rejected it, fell back — **no crash**.
      That fallback landed on the now-rotated-away baked-in token, bricking
      the OTA channel (not the app) until reinstall — see D72/P31 for why,
      and why this doesn't indict the contract. Recovered: rebuilt + reinstalled
      with the rotated token as the new baked-in default; device fetched
      `b000badcfg2` fresh over the network and the corrected self-heal
      companion restored `config.json`. Confirmed holding `tier=active`
- [x] 9.6 `bin/ota-verify.sh` 16/16 against the VPS
- [x] 9.7 Amendments recorded, never silent: **D65** (GC must preserve `bad-<id>` tombstones — §2 reconciled with §4), **D69/P29** (`Context` must not be dereferenced at `Package` registration time — found as a hard launch crash on first install), **D67** (P2 proven on device)

## 10. Next — the first real OTA payoff (P3)

Proves the workflow this project exists for: a behaviour change shipped as a
file, with no APK and no reinstall. The paywall patch is **not** part of this
project's plan (superseded by D68) — this is a small, low-stakes UI change
instead, chosen because it directly makes OTA state observable from the app
itself, with no `adb`.

- [x] 10.1 **UI patch: show the running OTA build on the "My account" screen.**
      Module **2176** renders a label/value list (`Name`, `User E-mail ID`,
      `Completed sessions`, `Cards archived`, `Cards in progress`,
      `Subscription status`) via repeated
      `jsx(View,{style:_.item},[jsx(Text,{style:_.label},"<Label>"),
      jsx(Text,{style:_.value},<value>)])` blocks (`assets/index.android.bundle`,
      search `children:"Name"`). Add one more such row, e.g. label `"App
      version"`, value = the running `buildId`. Two ways to get the value into
      JS, in order of preference:
      1. A tiny new module exporting the `BUILD_ID` the companion already bakes
         (same `__MJOLNIR_BUILD_ID__` substitution point, task 7.2) — avoids a
         filesystem read on a screen that may render before the companion's
         3 s delay elapses.
      2. Read `mjolnir-ota/active` via `ExponentFileSystem` (module 2150,
         same resolver pattern as the companion) — slightly more "live" but
         adds a read and a loading state to a settings screen (§8 forbids new
         UI/prompts affecting *native selection*, not a value label like this).
      Use `bundle-tool`'s content-locator patcher (patchback), not raw byte
      patching — the anchor string above is the locator. Verify the stock
      "My account" screen still renders unchanged otherwise.
- [x] 10.2 `bundle-tool companion --build-id b000003` to add the boot-ok writer
      (same companion as every OTA bundle; unrelated to 10.1, just bundled
      together)
- [x] 10.3 **PASS** — published as **b000003**; 10.4's fetch/promote proves it
      landed and was fetched correctly
- [x] 10.4 **PASS** — force-stop/relaunch cycles confirmed `tier=pending` →
      `tier=active`, holding `active` (not re-quarantined) over the further
      launches. "My account" shows `b000003`. **No APK rebuild.** P3 is real —
      every future change (including the deferred paywall patch, if ever
      revisited) is a file on the server.
