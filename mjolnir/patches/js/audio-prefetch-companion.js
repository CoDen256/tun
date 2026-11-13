// Mjølnir audio cache prefetcher (audio-cache-prefetch, D-P1..D-P5).
// Appended the same way `boot-ok-companion.js` is, via `bundle-tool
// companion` — no new append mechanism, modifies zero existing module
// bytes.
//
// D122: `RNSoundPlayerModule`'s `playUrl`/`loadUrl` cannot play a remote
// `https://` URL at all (confirmed on a real device, traced to the compiled
// smali) — only a local `file://` path ever works. This companion is what
// makes that possible for non-stock cards: it downloads every card's audio
// to `<documentDirectory>mj-audio/<sha256>.mp3` ahead of time, so the
// patched mod 1440 (`1440-audio-link-playback.edited.js`) only ever has to
// check whether the file is already on disk, never attempt a network play.
//
// D-P4: runs once per app launch, fire-and-forget, never blocking startup.
// D-P2: keeps the fetched manifest as `globalThis.MJOLNIR_AUDIO_MANIFEST`
// so mod 1440's own lookup is synchronous — no per-play-call fetch.
// D-P3: a cache miss is just not played, this one time (D07) — there is no
// per-miss lazy download; only this sweep ever populates the cache.
// D-P5: downloads are capped (3 concurrent) and atomic (`.tmp` + rename via
// `moveAsync`, same convention the OTA bundle's own download path uses).
//
// `__MJOLNIR_AUDIO_BASE_URL__` is the same placeholder
// `1440-audio-link-playback.edited.js` uses (D120's existing baked-constant
// mechanism, not a new one) — both patches must be baked with the same
// value. `globalThis.MJOLNIR_BUILD_ID` is already set synchronously by
// `boot-ok-companion.js`, which runs first (both are appended in the same
// order they're passed to `bundle-tool assemble`'s `--companions`).
(function () {
  var AUDIO_BASE_URL = '__MJOLNIR_AUDIO_BASE_URL__';
  var CACHE_DIR_NAME = 'mj-audio';
  var CONCURRENCY = 3;
  // D-P4's Open Question, resolved: the sweep is otherwise completely
  // silent by design (a bad sweep must never crash startup) — console.log
  // is the only observability available with no `adb run-as` access.
  // Android routes it to logcat under `ReactNativeJS`, same as every other
  // companion's own breadcrumbs (D63):
  //     adb logcat -s ReactNativeJS:V | grep mjolnir-audio-prefetch
  var TAG = '[mjolnir-audio-prefetch]';
  function log() {
    try {
      var args = Array.prototype.slice.call(arguments);
      args.unshift(TAG);
      console.log.apply(console, args);
    } catch (e) {}
  }

  // Module ids pinned to this specific base bundle (same convention as
  // `boot-ok-companion.js`'s hardcoded 2150) — not derived, not looked up.
  var MOD_EXPO_MODULES_CORE = 2150;

  function fileSystem() {
    // Same resolver as boot-ok-companion.js/config-rotate.js — prefer the
    // app's own resolver (calls ensureNativeModulesAreInstalled() first),
    // fall back to the bare globalThis path.
    try {
      if (typeof __r === 'function') {
        var mod = __r(MOD_EXPO_MODULES_CORE);
        if (mod && typeof mod.requireNativeModule === 'function') {
          var viaApp = mod.requireNativeModule('ExponentFileSystem');
          if (viaApp) return viaApp;
        }
      }
    } catch (e) {}
    var g = typeof globalThis !== 'undefined' ? globalThis : null;
    return g && g.expo && g.expo.modules && g.expo.modules.ExponentFileSystem;
  }

  // Runs `items` through `worker` with at most `limit` in flight at once —
  // the full set still completes, just capped in concurrency (D-P5).
  function runWithConcurrency(items, limit, worker) {
    return new Promise(function (resolve) {
      var next = 0;
      var inFlight = 0;
      var done = 0;
      if (items.length === 0) return resolve();
      function pump() {
        while (inFlight < limit && next < items.length) {
          var item = items[next++];
          inFlight++;
          worker(item)
            .catch(function () {}) // one failed download must not stop the rest
            .then(function () {
              inFlight--;
              done++;
              if (done === items.length) resolve();
              else pump();
            });
        }
      }
      pump();
    });
  }

  function downloadOne(FS, dir, sha256) {
    var dest = dir + sha256 + '.mp3';
    var tmp = dest + '.tmp';
    // D-P5 addendum: native `ExponentFileSystem.downloadAsync` requires 3 args
    // — `(url, path, options)`, an `expo.modules.filesystem.DownloadOptions`
    // record (confirmed from the decompiled smali; every field has a Kotlin
    // default, so `{}` is valid and sufficient — no md5/headers/sessionType
    // requirement). Calling with only 2 args rejects with "Received 2
    // arguments, but 3 was expected" (found via the logcat diagnostics added
    // just before this fix).
    return FS.downloadAsync(AUDIO_BASE_URL + '/blob/' + sha256, tmp, {})
      .then(function (result) {
        // Atomic: the file is only ever addressable under its final name once
        // fully written — a killed app mid-download leaves only the orphan
        // `.tmp`, never a half-written `.mp3` a play attempt could pick up.
        return FS.moveAsync({ from: tmp, to: dest }).then(function () {
          log('downloaded', sha256, result && result.status);
        });
      })
      .catch(function (e) {
        log('download failed', sha256, e && e.message ? e.message : String(e));
        throw e; // still rejects — runWithConcurrency's own catch counts it
      });
  }

  function prefetch(FS, manifest) {
    var dir = FS.documentDirectory + CACHE_DIR_NAME + '/';
    var neededShas = Array.from(
      new Set(
        Object.keys(manifest)
          .map(function (cardId) {
            return manifest[cardId];
          })
          .filter(Boolean)
      )
    );

    return FS.makeDirectoryAsync(dir, { intermediates: true })
      .catch(function (e) {
        log('makeDirectoryAsync note (often just "already exists"):', e && e.message ? e.message : String(e));
      })
      .then(function () {
        return FS.readDirectoryAsync(dir).catch(function (e) {
          log('readDirectoryAsync failed:', e && e.message ? e.message : String(e));
          return [];
        });
      })
      .then(function (existingNames) {
        var have = {};
        for (var i = 0; i < existingNames.length; i++) {
          var name = existingNames[i];
          // Only a fully-written `<sha256>.mp3` counts as cached — an orphan
          // `.tmp` from a prior killed download is left alone (harmless,
          // never addressable) and never treated as present.
          if (name.slice(-4) === '.mp3') have[name.slice(0, -4)] = true;
        }
        var missing = neededShas.filter(function (sha256) {
          return !have[sha256];
        });
        log(
          'cache check:',
          neededShas.length,
          'needed,',
          existingNames.length,
          'dir entries,',
          missing.length,
          'missing'
        );
        return runWithConcurrency(missing, CONCURRENCY, function (sha256) {
          return downloadOne(FS, dir, sha256);
        }).then(function () {
          log('sweep complete');
        });
      });
  }

  function run() {
    var FS;
    try {
      FS = fileSystem();
    } catch (e) {
      log('fileSystem() threw', e && e.message ? e.message : String(e));
      return;
    }
    if (!FS || !FS.documentDirectory) {
      log('ExponentFileSystem unavailable — skipping this launch');
      return;
    }

    var buildId = typeof globalThis !== 'undefined' ? globalThis.MJOLNIR_BUILD_ID : undefined;
    if (!buildId) {
      log('no MJOLNIR_BUILD_ID set (e.g. the embedded tier-4 asset) — nothing to prefetch');
      return;
    }

    var manifestUrl = AUDIO_BASE_URL + '/audio-manifest/' + buildId + '.json';
    log('fetching manifest', manifestUrl);

    // D-P4: one attempt per launch — no retry loop on a failed fetch (e.g.
    // offline at launch). The next cold launch tries again naturally, since
    // MJOLNIR_BUILD_ID (and so the manifest it would fetch) never changes
    // mid-session anyway.
    fetch(manifestUrl)
      .then(function (res) {
        if (!res.ok) throw new Error('manifest fetch returned HTTP ' + res.status);
        return res.json();
      })
      .then(function (manifest) {
        if (!manifest || typeof manifest !== 'object') {
          log('manifest response was not an object — nothing to prefetch');
          return;
        }
        log('manifest ok:', Object.keys(manifest).length, 'cards');
        if (typeof globalThis !== 'undefined') globalThis.MJOLNIR_AUDIO_MANIFEST = manifest;
        return prefetch(FS, manifest);
      })
      .catch(function (e) {
        log('sweep aborted:', e && e.message ? e.message : String(e)); // never throw into startup
      });
  }

  try {
    run();
  } catch (e) {}
})();
