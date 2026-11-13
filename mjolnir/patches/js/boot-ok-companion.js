// Mjølnir OTA — boot-ok companion (D52). Redeployable JS, NOT frozen.
//
// This snippet is appended after the bundle's entry call (`__r(0);`) by
// `bundle-tool companion` — it modifies zero existing module bytes. It writes
// an empty `boot-ok-<buildId>` marker once the process has survived a few
// seconds, so the native watchdog counts a startup crash as a failed attempt
// (no marker) but a stable launch as success (marker present forever).
//
// It reaches the filesystem native module via the app's own resolver
// (`__r(2150).requireNativeModule`), falling back to
// `globalThis.expo.modules.ExponentFileSystem`. No dep-array edit is needed
// either way — `__r` is keyed by absolute module id (see docs/findings.md §4).
//
// `__MJOLNIR_BUILD_ID__` is substituted at build time (task 7.2). Until the
// publish pipeline bakes it, the operator passes `--build-id <id>` to
// `bundle-tool companion` and the SAME id to `tun/bin/ota-publish.sh`, so the
// marker pairs with `bundle-<id>.js`.
//
// `__MJOLNIR_BASE_VERSION__`/`__MJOLNIR_PATCH_REV__` are baked the same way
// (D-L1, builder-logic-bundle-store) — read back out of the assembled
// bundle by `tool/src/otaPublish.js`'s `findBakedBaseVersion`/
// `findBakedPatchRev` at ingest time. They don't drive any runtime behavior
// here; baking them as plain top-level constants (not just a comment) is
// what makes a submitted bundle self-describing without a sidecar file.
//
// `__MJOLNIR_LABEL__`/`__MJOLNIR_DATA_VERSION__` (boot-companion-label-
// data-version) are baked the same way, purely for on-device display on
// the account screen (module 2176) — free-form strings, no format checks.
//
// It also exposes `globalThis.MJOLNIR_BUILD_ID` synchronously (task 10.1) —
// this runs right after the entry call (`__r(0);`), long before any screen
// the user navigates to (e.g. "My account", module 2176) can mount, so that
// screen reads the real buildId with no filesystem read and no race against
// the 3 s boot-ok delay below. Unset on the embedded tier-4 asset, which
// ships with no companion at all (task 8.1) — readers must treat that as
// "no OTA active", not a bug.
(function () {
  var BUILD_ID = '__MJOLNIR_BUILD_ID__';
  var BASE_VERSION = '__MJOLNIR_BASE_VERSION__';
  var PATCH_REV = __MJOLNIR_PATCH_REV__;
  var LABEL = '__MJOLNIR_LABEL__';
  var DATA_VERSION = '__MJOLNIR_DATA_VERSION__';
  if (typeof globalThis !== 'undefined') {
    globalThis.MJOLNIR_BUILD_ID = BUILD_ID;
    globalThis.MJOLNIR_BASE_VERSION = BASE_VERSION;
    globalThis.MJOLNIR_PATCH_REV = PATCH_REV;
    globalThis.MJOLNIR_LABEL = LABEL;
    globalThis.MJOLNIR_DATA_VERSION = DATA_VERSION;
  }
  var DELAY_MS = 3000; // D52: survive 3 s before declaring boot-ok
  var RETRY_MS = 2000; // expo modules may not be installed yet at T+3s
  var MAX_TRIES = 5; // bounded — a dead build must never retry forever

  function fileSystem() {
    // Prefer the app's own resolver (module 2150): it calls
    // ensureNativeModulesAreInstalled() first and falls back to
    // NativeModulesProxy. The bare globalThis path below does neither, and if
    // it ever yields undefined no boot-ok is written and EVERY build is
    // quarantined on its third launch — silently. Verified: __r is a real
    // global keyed by absolute module id, and 2150 is registered before this
    // appended code runs (it sits after `__r(0);`).
    try {
      if (typeof __r === 'function') {
        var mod = __r(2150);
        if (mod && typeof mod.requireNativeModule === 'function') {
          var viaApp = mod.requireNativeModule('ExponentFileSystem');
          if (viaApp) return viaApp;
        }
      }
    } catch (e) {}
    var e2 = typeof globalThis !== 'undefined' ? globalThis : null;
    return e2 && e2.expo && e2.expo.modules && e2.expo.modules.ExponentFileSystem;
  }

  function writeBootOk(tries) {
    var FS = null;
    try {
      FS = fileSystem();
    } catch (e) {}
    if (!FS || !FS.documentDirectory) {
      // Not installed yet — re-check, up to MAX_TRIES, then give up.
      if (tries < MAX_TRIES) {
        setTimeout(function () {
          writeBootOk(tries + 1);
        }, RETRY_MS);
      }
      return;
    }
    try {
      // documentDirectory is the `file://` URI form WITH a trailing slash
      // (D56); writeAsStringAsync wants the URI, while native reads the bare
      // getFilesDir() path — both resolve to the same file. Do NOT "fix" this
      // asymmetry by stripping the scheme.
      var dir = FS.documentDirectory + 'mjolnir-ota';
      FS.makeDirectoryAsync(dir, { intermediates: true })
        .catch(function () {}) // already exists → fine
        .then(function () {
          return FS.writeAsStringAsync(dir + '/boot-ok-' + BUILD_ID, '', {});
        })
        .catch(function () {}); // never throw into startup
    } catch (e) {}
  }

  try {
    setTimeout(function () {
      writeBootOk(0);
    }, DELAY_MS);
  } catch (e) {}
})();
