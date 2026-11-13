## Why

The Mjølnir app bakes its JS bundle into the APK; today every content or logic
change means a full decompile → patch → rebuild → re-sign → reinstall cycle
(`docs/findings.md` §4). P2 is the one-time native patch that breaks that cycle:
after it ships, the device fetches its bundle over the air and every future
change is a file swap on the VPS. The native code that does this **ships once
and can never be fixed** (D04) — so it must do the smallest correct job and be
reviewed in full before it is signed. This is the only irreversible step in the
project; everything else is undone by redeploying a file.

The contract this patch implements is already frozen in
`tun/docs/11-ota-contract.md` §1–§6 (Q11–Q16, D04/D08/D26/D39/D47–D57). This
change implements that document — it does not reopen it. P1's
`bin/ota-verify.sh` was **first** measured against an earlier v1.5.10 bundle
(`cfa9da16…`, **6 003 468 bytes**), then re-verified 16/16 against the
**v1.5.12 base** (`b3ad6aee…`, 6 003 611 bytes) now published as `b000001`.
Nothing in the contract depends on a particular bundle size — the `6003611` in
§1's `current.json` example is illustrative, not a measured constant (D58, §7).

## What Changes

- **New native class** implementing Expo's `ReactNativeHostHandler`, registered
  by bumping `ExpoModulesPackageList$LazyHolder`'s package array from 5 → 6.
  Its `getJSBundleFile(Z)` is the only method with a real body; it returns the
  path of the bundle to load, or `null` to fall through to the embedded asset.
- **Launch-path bundle selection** (synchronous, zero network I/O, returns in
  single-digit ms): dev → `pending`(+promote) → `active` → newest boot-ok'd
  bundle → `null`/asset, with the D54 rule that `active` is rewritten to the id
  actually returned.
- **Background refresh**: parse `current.json`, validate the wire contract,
  download under strict transport rules (https-only incl. redirects, no
  `Accept-Encoding`, cap bytes at `size` while streaming, 64 MiB ceiling,
  no trust in `Content-Length`), verify `size`+`sha256`+magic-prefix, stage via
  `.tmp` → rename, then set `pending`.
- **Boot watchdog** (anti-brick, D08/D52): `attempt-<id>-<n>` markers written
  immediately before a bundle is handed over; skip + quarantine (`bad-<id>`) at
  ≥2 attempts with no `boot-ok-<id>`; never auto-clear.
- **Config escape hatch** (D39, mandatory): `config.json` `{url, token}` read
  from the OTA dir if present/parseable/https, else baked-in defaults; malformed
  ⇒ fall back, never crash.
- **JS-side companion**: write `boot-ok-<buildId>` 3 s after root mount; the
  ability (not an obligation) to rewrite `config.json` to rotate URL/token.
- **BREAKING (intended):** the rebuilt APK is re-signed; Play Store updates for
  this install stop permanently. Expected for a resigned sideload (findings §4).

Out of scope: the P1 server side (already live, `docs/11-ota-contract.md` §7).
The embedded fallback bundle is plain stock v1.5.12, unmodified — the first
content change ships later as an OTA bundle, not baked into the APK.

## Capabilities

### New Capabilities
- `native-ota-loader`: the frozen native patch — bundle selection at launch,
  the `current.json` wire contract and its validation, the download + dual
  validity tests, the on-device marker-file layout, the boot watchdog, the
  `config.json` escape hatch, and the https/transport invariants. Implements
  `11-ota-contract.md` §1–§6 and §8's prohibitions.
- `ota-js-companion`: the JS-side half that native depends on — writing
  `boot-ok-<buildId>` after a stable mount, and (optionally) rewriting
  `config.json` to rotate the OTA URL/token without a reinstall.

### Modified Capabilities
<!-- None. The frozen server contract (P1) is unchanged; this change neither
     modifies nor depends on an existing mjolnir spec's requirements. -->

## Impact

- **Native/smali** (build base `/home/coden/dev/mjolnir/base/smali.mjolnir.merged`,
  v1.5.12 / versionCode 219): new class under `smali_classes4/expo/modules/…`;
  one edited method in `ExpoModulesPackageList$LazyHolder.<clinit>`. No manifest
  change — `INTERNET`/`WRITE_EXTERNAL_STORAGE`/`RECEIVE_BOOT_COMPLETED`/
  `FOREGROUND_SERVICE` already granted (findings §4).
- **JS bundle**: a small companion module (boot-ok timer + optional config
  writer) added to the published bundle. Does not touch native once shipped.
- **Irreversibility**: D04. Once signed and installed, the native half is
  permanent. Mitigations are all in-contract: the `config.json` escape hatch
  (D39) makes URL+token rotatable, and the watchdog (D08) prevents a bad bundle
  from bricking the install.
- **Server**: none new; relies on the live P1 endpoints and `bin/ota-verify.sh`.
- **Acceptance**: build → sign → install, then verify all four selection tiers,
  watchdog quarantine after two fast kills, and rollback by repointing
  `current.json` at an older `buildId`.
