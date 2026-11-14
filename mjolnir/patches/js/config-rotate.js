// Mjølnir OTA — config rotation capability (D39, task 7.3). Redeployable JS.
//
// Appended like the boot-ok companion. It does NOT rotate anything on its own;
// it exposes a helper a live bundle can call to rewrite
// `<documentDirectory>mjolnir-ota/config.json` with a new {url, token}, so the
// OTA endpoint/token can change without a reinstall. The capability must be
// available to a live bundle even if a given bundle never calls it.
//
// Invariant (D53): it ONLY ever writes an `https` url — it must not be able to
// downgrade transport. Native re-validates, but the companion must not write a
// url native would reject.
(function () {
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

  // Returns a Promise. Rejects (never writes) if url is not https or FS is
  // unavailable; resolves once config.json is written.
  function rotateOtaConfig(url, token) {
    var FS;
    try {
      FS = fileSystem();
    } catch (e) {
      return Promise.reject(e);
    }
    if (!FS || !FS.documentDirectory) {
      return Promise.reject(new Error('mjolnir: filesystem module unavailable'));
    }
    if (typeof url !== 'string' || url.slice(0, 8).toLowerCase() !== 'https://') {
      return Promise.reject(new Error('mjolnir: config url must be https (D53)'));
    }
    var dir = FS.documentDirectory + 'mjolnir-ota';
    var body = JSON.stringify({ url: url, token: token });
    return FS.makeDirectoryAsync(dir, { intermediates: true })
      .catch(function () {})
      .then(function () {
        return FS.writeAsStringAsync(dir + '/config.json', body, {});
      });
  }

  try {
    if (typeof globalThis !== 'undefined') {
      globalThis.__mjolnirRotateOtaConfig = rotateOtaConfig;
    }
  } catch (e) {}
})();
