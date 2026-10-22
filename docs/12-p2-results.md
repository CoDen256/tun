# P2 — native OTA: what was built, tested and proven

Status: **the OTA path works end to end on the device (2026-10-20).** Every
future JS change is a file on the server. This file is the record of what was
verified and how, so nothing here reads as better-tested than it is.

## The proof

Four launches, force-stopped between each, `adb logcat -s mjolnir-ota:V`:

```
L1  select tier=asset   path=null                    embedded fallback; dex sound
L2  select tier=pending path=…/bundle-b000002.js     fetched, verified, promoted
L3  select tier=active  path=…/bundle-b000002.js     promotion persisted
L4  select tier=active  path=…/bundle-b000002.js     NOT quarantined
```

**L4 is the load-bearing line.** Had the JS companion failed to write
`boot-ok-b000002`, the watchdog would have quarantined the build on exactly
that launch and fallen back to `asset`. A broken companion looks perfectly
healthy for three launches — so L4, not L2, is what rules out the one silent
failure mode that would kill every future build.

## Verified

| area | how |
|---|---|
| `LazyHolder` 5→6 edit | boots; no `VerifyError` / `AbstractMethodError` / `ArrayIndexOutOfBounds` |
| Interface completeness | all 9 `ReactNativeHostHandler` + 6 `Package` methods present in the dex |
| Reproducible native build | smali regenerated from the reviewed Java twice — byte-identical both times |
| D49 transport | caps bytes while streaming, never trusts `Content-Length`; `ota-verify.sh` proves sha256 is identical with and without transport gzip |
| D64 placeholders | substitution + smali gate + `strings classes*.dex` gate; all five dexes clean |
| Signing | `d2a16b2d…675b` — matches the existing install, so it upgraded in place |
| Companion isolation | appends 3 383 bytes; stripping the block reproduces the base bundle byte-for-byte |
| Server contract | `bin/ota-verify.sh` 16/16 against the VPS |

## Now fully proven (2026-10-22)

All five acceptance items, each with a device logcat trace:

- **9.1/9.2** (2026-10-20): asset → pending → active → active, L4 load-bearing
  (no false quarantine).
- **9.3 watchdog positive**: a bundle crafted to pass the cheap validity check
  but crash before `__r(0)` — five launches, `pending→CRASH→CRASH→quarantine+
  fallback→active`, confirmed via `mjolnir-ota` logcat.
- **9.4 rollback**: repointed `current.json` at an older buildId; device
  fetched it. Found and fixed a real bug en route — **D71/P30**: GC's "two
  newest boot-ok'd" retention could leave an old bundle on disk that
  `refresh()`'s existing-file check never promoted, silently defeating
  rollback. Retested after the fix: PASS.
- **9.5 config rotation**, both halves: a live token rotation (device writes
  new token via `config-rotate.js`, server swaps to match, device fetches
  under the new token exclusively) and a malformed-config fallback (bad
  non-https config left on disk, next cold start rejects it, no crash).
  **Found and recovered D72/P31**: testing the malformed case *after* the
  token rotation left the compiled-in fallback token dead too, bricking the
  OTA channel (not the app) until a rebuild with the rotated token as the new
  baked-in default. Native behaved correctly throughout — the lockout was an
  operational ordering mistake.

Not yet proven: **tier 3** (newest-boot-ok'd, exercised only incidentally) and
GC under real load. **Q07** cold-start parse time with a padded bundle is
still unmeasured — the 2026-10-20 reading was SHA-256 *cost* (~20–40 ms over
6 MB), which settled D51; Q07 is the different question and it gates D03.

## Bugs found and fixed during P2

| | what | why it mattered |
|---|---|---|
| **D69 / P29** | `createReactNativeHostHandlers` called `c.getApplicationContext()` | Expo constructs `Package`s from the Application **constructor**, before `attachBaseContext()` — `mBase` is null, NPE, `Unable to instantiate application`. The app could not start. **Outside** every try/catch in `getJSBundleFile`, so the three-tier fallback could not save it: the tiers protect against a bad *bundle*, never a bad *registration*. Fixed by storing the `Context` raw and resolving lazily in `baseDir()` |
| **D65** | GC swept `bad-<id>` along with the bundle | A `current.json` still naming a quarantined id would re-download ~6 MB every launch forever, re-quarantine, and repeat. The tombstone must outlive the bundle |
| — | refresh re-fetched quarantined builds | Same data burn from the other direction; `refresh()` now skips an id with a `bad-<id>` marker |
| **P27** | `ota-verify.sh` reported PASS on empty values | A totally failed run printed *5 passed*, including the D49 check. `[ "$a" = "$b" ]` is true when both are unset. Now fails closed and aborts early |
| **P28 / D57** | Cloudflare orange-cloud in front of `/ota/*` | Re-encodes bodies (breaking D49 permanently) and intercepts the ACME challenge so no cert can issue. Must be DNS-only |
| — | `ota-publish.sh` buildId/companion coupling | The baked companion id and the published id were coupled by operator discipline alone; a mismatch silently quarantines every build. Now refused |

## Tooling added

- `mjolnir/apk/build.sh` — stage `base/` → substitute (D64) → overlay the patch
  → `at bl -fvazs` → gate every dex. Base is never written to; `build/deploy/`
  is recreated per run.
- `mjolnir/patches/native/substitute.sh` — placeholder substitution, non-https
  refusal, and a `--check-dex` post-build gate.
- `mjolnir/patches/native/build-smali.sh` — javac → d8 → baksmali, deterministic.
- `tun/bin/ota-publish.sh` — now refuses a buildId/companion mismatch and a
  bundle with no companion (`ALLOW_NO_COMPANION=1` to override).
