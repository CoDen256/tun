// Mjølnir OTA — debug tier reporter (observability "B", D63). DEBUG BUILDS ONLY.
//
// Append this to a debug bundle to make the native tier selection falsifiable
// on a release device where `run-as` is refused: ~4 s after start it logs the
// contents of `mjolnir-ota/` (dir listing + the `active`/`pending` tokens) via
// console.log, which Android routes to logcat under the `ReactNativeJS` tag:
//
//     adb logcat -s ReactNativeJS:V | grep mjolnir-ota-debug
//
// It corroborates native's own `mjolnir-ota` logcat breadcrumb (D63). Strip it
// from the production companion — it reads state but writes nothing.
(function () {
  var TAG = '[mjolnir-ota-debug]';

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

  function report(tries) {
    var FS = null;
    try {
      FS = fileSystem();
    } catch (e) {}
    if (!FS || !FS.documentDirectory) {
      if (tries < 5) {
        setTimeout(function () {
          report(tries + 1);
        }, 2000);
      }
      return;
    }
    var dir = FS.documentDirectory + 'mjolnir-ota';
    FS.readDirectoryAsync(dir)
      .then(function (names) {
        var singles = names.filter(function (n) {
          return n === 'active' || n === 'pending';
        });
        return Promise.all(
          singles.map(function (n) {
            return FS.readAsStringAsync(dir + '/' + n, {})
              .then(function (v) {
                return [n, v];
              })
              .catch(function () {
                return [n, null];
              });
          })
        ).then(function (pairs) {
          var tokens = {};
          pairs.forEach(function (p) {
            tokens[p[0]] = p[1];
          });
          console.log(
            TAG,
            JSON.stringify({ entries: names, active: tokens.active || null, pending: tokens.pending || null })
          );
        });
      })
      .catch(function () {
        console.log(TAG, 'mjolnir-ota dir not present yet (tier 4 / asset?)');
      });
  }

  try {
    setTimeout(function () {
      report(0);
    }, 4000);
  } catch (e) {}
})();
