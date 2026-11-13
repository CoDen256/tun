## Context

This is the one irreversible change in the project. The native half ships
inside a re-signed APK and **can never be patched afterward** (D04); a bug in it
is permanent. Everything it must do is already frozen in
`tun/docs/11-ota-contract.md` §1–§6, §8 — this design is *how* to realise that
contract in smali, not a reopening of it. If an instruction in the contract
turns out to be wrong during implementation, that is an ADR amendment in
`tun/docs/07-decisions.md`, not a silent deviation.

**Build base (source of truth):** `/home/coden/dev/mjolnir/base/smali.mjolnir.merged`
— app **v1.5.12**, versionCode **219**, apktool 2.12.1, decompiled 2026-10-20,
**unpatched**. Verified against this base:

| hook | path | fact |
|---|---|---|
| registration | `smali_classes4/expo/modules/ExpoModulesPackageList$LazyHolder.smali` | `<clinit>` builds a **5-entry** `[Lexpo/modules/core/interfaces/Package;` (size in `v0=0x5`) |
| lazy chain | `smali_classes4/expo/modules/ReactNativeHostWrapperBase.smali:148` | invokes `Package.createReactNativeHostHandlers(Context)` on each package and flattens into `reactNativeHostHandlers`; `getJSBundleFile()` takes the first non-null |
| handler interface | `…/core/interfaces/ReactNativeHostHandler.smali` + `…$-CC.smali` | `getJSBundleFile(Z)Ljava/lang/String;` plus `$default$` no-ops for every other method |
| package interface | `…/core/interfaces/Package.smali:63` | `createReactNativeHostHandlers(Landroid/content/Context;)Ljava/util/List;` |
| filesDir anchor | `smali_classes4/expo/modules/filesystem/FileSystemModule.smali:2784` | `documentDirectory == Uri.fromFile(getFilesDir()) + "/"` (D56) |
| embedded bundle | `assets/index.android.bundle` | v1.5.12 base bundle, 6 003 611 B; equals the *illustrative* `size` in §1's `current.json` example — the P1 verify was measured against the v1.5.10 patched bundle (6 003 468 B), nothing depends on size (D58) |

Permissions already present (findings §4): `INTERNET`, `WRITE_EXTERNAL_STORAGE`,
`RECEIVE_BOOT_COMPLETED`, `FOREGROUND_SERVICE`. No manifest edit.

## Goals / Non-Goals

**Goals:**
- Implement the frozen native contract exactly, as the smallest correct patch.
- Keep the launch path synchronous, local-only, single-digit ms — no ANR risk.
- Make the one registration edit auditable and minimal.
- Ship a JS companion that writes `boot-ok` and can rotate `config.json`.

**Non-Goals:**
- Version ordering, audio, retry/backoff, UI, self-healing (§8 — forbidden).
- Signature verification (D47 — sha256-over-TLS only).
- Any content/UI change to the embedded bundle — it ships plain stock
  v1.5.12, and the first real change is an OTA bundle, not baked into the APK.
- Any server work (P1 is live).

## Decisions

### D-N1 — Register by bumping the LazyHolder package array 5 → 6

`ExpoModulesPackageList$LazyHolder.<clinit>` is the single registration site. The
edit: change the packages array size from `0x5` to `0x6`, append one
`new-instance`/`aput-object` for the new package at index 5, and raise
`.locals`. Register note: `v0` currently holds `0x5` and is **reused later** as
the index-5 slot of the separate `modulesList`; so the array size must come from
a *fresh* register (e.g. bump `.locals 8 → 9`, use `v8` for the `0x6` size) and
the new package's index-5 `aput` can reuse `v0` (=`0x5`) without disturbing the
modulesList tail. Nothing else in `<clinit>` moves.

*Alternative considered — patch `MainApplication$reactNativeHost$1` to override
`getJSBundleFile` directly.* Rejected: that is the RN host, not the Expo wrapper
that actually drives the lazy `reactNativeHostHandlers` chain (findings §4); the
handler hook is the seam Expo already provides for exactly this, so it is the
smaller and more idiomatic edit.

### D-N2 — One new class implementing both `Package` and `ReactNativeHostHandler`

A single class `com/lightblitzlearning/ota/OtaPackage` (name TBD) implements
`Package` (five `create*` methods return `Collections.emptyList()` except
`createReactNativeHostHandlers`, which returns a one-element list containing
`this`) and `ReactNativeHostHandler`. Only `getJSBundleFile(Z)` carries a real
body; every other handler method is declared forwarding to the matching
`ReactNativeHostHandler$-CC;->$default$…` (hand-written smali must declare them
explicitly — desugared default-interface methods are not inherited for free).

*Alternative — two classes (a Package and a separate handler).* Rejected as more
smali for no benefit; one class is easier to audit for a frozen artifact.

### D-N3 — `getJSBundleFile` = synchronous local selection, then spawn refresh

Control flow, all of it returning in single-digit ms:

```
getJSBundleFile(useDeveloperSupport):
  if useDeveloperSupport: return null                      // never touch Metro
  base = <getFilesDir()>/mjolnir-ota/                      // D56, bare path
  selected = selectBundle(base)    // tiers 1–4, local file reads only
  if selected != null:
      write attempt-<id>-<n+1>     // BEFORE handing over (D52)
  startDaemon(() -> { refresh(base); gc(base); })          // background only
  return selected                                           // path or null
```

`selectBundle` applies §2's order (pending+promote → active → newest boot-ok'd →
null), runs the cheap activation check (read 26 bytes), honours `bad-<id>` and
the watchdog threshold, and applies the D54 rule (rewrite/delete `active` to
match what it returns). Promotion and the `active` rewrite are cheap local
writes and stay on the launch path; **GC is background-only**. The refresh
thread is a plain daemon `Thread` — no executor, no foreground service — so a
slow or dead server can never delay the return or cause an ANR.

### D-N4 — HTTP via `HttpURLConnection` with manual redirect handling

The download must (a) never send `Accept-Encoding` (D49), (b) enforce `https`
before the first byte *and after every redirect* (D53), (c) never trust
`Content-Length` and instead cap bytes against `size` while streaming (D49).
Use `HttpURLConnection` with `setInstanceFollowRedirects(false)` and a manual
redirect loop that re-checks the scheme on each `Location`; do **not** set any
`Accept-Encoding` header (letting the stack negotiate gzip transparently keeps
`sha256` over the uncompressed bytes). Set `Authorization: Bearer <token>`,
connect-timeout 10 s, read-timeout 30 s, and an outer 120 s wall-clock guard on
the whole refresh. Stream into `bundle-<id>.js.tmp`, aborting the instant
written bytes exceed `size`.

*Alternative — OkHttp (already bundled).* Workable, but OkHttp adds transparent
gzip and automatic redirect following that must be explicitly disabled to honour
D49/D53; `HttpURLConnection` with nothing added is the more obviously-correct
frozen choice. Either is acceptable; `HttpURLConnection` is the default.

### D-N5 — Verify in the contract's two different places (D51)

After download, before rename: exact byte length `== size`, streamed-SHA-256
`== sha256`, and the 26-byte magic prefix. On success, `renameTo`
`bundle-<id>.js`, then write `pending=<id>`. On any failure: delete the `.tmp`,
touch nothing else. At activation (every launch): length `> 0` and first 26
bytes `== var __BUNDLE_START_TIME__=` only — never re-hash on the cold path.

### D-N6 — State as marker files, baked-in defaults as string constants

All state is marker files under `mjolnir-ota/` (D50); `active`/`pending` are
single-token files written `.tmp`→`renameTo`. The baked-in OTA URL and bearer
token are `const-string`s in the new class — the bootstrap and last resort.
`config.json` (`{url, token}`, https-only, malformed ⇒ ignore) overrides them at
runtime (D39), which is what makes the only frozen secrets rotatable without a
reinstall.

### D-N7 — JS companion in the published bundle

A small module added to the bundle (not native): on root mount, start a 3 s
timer; if it elapses, `FileSystem.writeAsStringAsync(documentDirectory +
"mjolnir-ota/boot-ok-<buildId>", "")` (D52). Optionally, a bundle may rewrite
`documentDirectory + "mjolnir-ota/config.json"` with a new https `{url, token}`
to rotate the endpoint. The companion learns its own `buildId` from the bundle
it ships in (baked at publish time). Being JS, it is redeployable — only the
native half is frozen.

## Risks / Trade-offs

- **Any native bug is permanent (D04).** → Full review of this design before
  signing; a staged build where the APK is *not* shipped the same day it is
  written (roadmap). The watchdog (D08) and the `config.json` escape hatch (D39)
  are the two in-contract safety nets.
- **Wrong register allocation in `<clinit>` → `VerifyError`/boot crash.** → The
  `v0`-reuse-for-`modulesList` trap (above) is called out explicitly; verify the
  rebuilt dex boots the *stock* bundle before testing OTA at all.
- **Hand-written `$-CC` forwarding omitted → `AbstractMethodError` at runtime.**
  → The new class must declare every `ReactNativeHostHandler` method, each
  forwarding to its `$default$`; confirmed the `-CC` class exists in the base.
- **Embedded fallback / native version mismatch.** The frozen shell is v1.5.12;
  the embedded fallback bundle is **plain stock v1.5.12** — v1.5.12-compatible
  by construction, not the superseded April `if(false)` bundle. → Pin the
  fallback to a bundle built from this same base (Migration Plan).
- **Baked-in token leaks in the APK.** Accepted (D47 threat model: single user,
  own VPS); rotatable via `config.json` if ever needed.
- **Two fast kills within 3 s falsely quarantine a good bundle (D52).** Accepted
  — the consequence is a fall-back + republish, not a brick; visible in the sync
  heartbeat.

## Migration Plan

1. **Pre-flight on the base.** Confirm the five hook facts above still hold on
   `base/smali.mjolnir.merged` (they do as of 2026-10-20).
2. **Write the patch:** add `OtaPackage` smali under
   `smali_classes4/com/lightblitzlearning/ota/`; apply the `<clinit>` 5→6 edit.
3. **Prepare the embedded fallback bundle:** take the v1.5.12 base
   `index.android.bundle` **as-is** (plain stock) and add only the JS
   companion. This bundle is the APK's
   tier-4 asset. Note the first *companion-bearing* bundle published to the VPS
   must be `b000002`, not `b000001`: `b000001` carries no `boot-ok` companion
   and would be quarantined on its third launch, so it must not be the bundle
   the patched APK first fetches (D62).
4. **Build → align → sign** via the existing `0306.orig` pipeline; **do not ship
   the same day it is written.**
5. **Rollback strategy:** the frozen patch itself has none post-install — that
   is the point. Pre-install, rollback is "don't sign/install." Post-install,
   the recoverable surface is entirely in-contract: publish a new `buildId`
   (fixes a bad bundle via the watchdog), or rotate `config.json` (fixes a bad
   URL/token). Keep the *unpatched* v1.5.12 APK as the clean-reinstall escape.
6. **Acceptance** (the irreversible-step gate — all must pass before declaring
   P2 done):
   - boots the **stock** embedded bundle (dex integrity) before any OTA;
   - tier 4 → tier 2/3 → tier 1: publish a bundle, confirm fetch+promote, then
     confirm `active` load on next launch;
   - watchdog: a deliberately-crashing bundle is quarantined after two launches
     and falls back;
   - rollback: repoint `current.json` at an older `buildId`, confirm the device
     fetches it (identity, not ordering — D26);
   - `config.json`: write a new token, confirm the next refresh uses it;
   - re-run `bin/ota-verify.sh` against the VPS.

## Open Questions

- **Baked-in token value.** The `const-string` bearer token compiled into the
  frozen APK — which P1 token, and is it the one that should be the permanent
  bootstrap? (Rotatable later via `config.json`, but the baked-in value is the
  last resort.) Needs the operator's input before signing.
- **Fallback bundle pairing.** ✅ Resolved: the embedded tier-4 bundle is
  **plain stock v1.5.12**, built from this same base, so native and JS agree
  on available native modules.
- **Package vs. two classes (D-N2)** and **exact `$-CC` forwarding list** are
  apply-time smali details to lock against the base, not open design questions.
