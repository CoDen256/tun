__d(function (g, r, i, a, m, e, d) {
  "use strict";

  var n = r(d[0]);
  Object.defineProperty(e, "__esModule", {
    value: !0
  }), e.default = void 0;
  var o,
    t,
    u = n(r(d[1])),
    l = r(d[2]),
    f = n(r(d[3])),
    s = l.NativeModules.RNSoundPlayer,
    c = new l.NativeEventEmitter(s),
    p = null,
    y = null;
  // D-A1: checks FOR stock, not for custom — a future rollover deck (e.g.
  // C30) isn't a stock prefix either, so it's automatically treated as
  // custom with no patch update needed.
  function isStockPrefix(cardId) {
    var firstChar = cardId.charAt(0);
    if (firstChar === "a" || firstChar === "b" || firstChar === "z") return true;
    var match = /^c(\d{2})/.exec(cardId);
    return !!match && Number(match[1]) >= 1 && Number(match[1]) <= 17;
  }
  // D122/audio-cache-prefetch: `playUrl`/`loadUrl` cannot play a remote
  // `https://` URL at all (confirmed on a real device, traced to the
  // compiled smali) — only a local `file://` path ever works. A non-stock
  // card therefore only ever plays from the local cache the
  // `audio-prefetch-companion.js` companion populates ahead of time, never
  // via a direct URL. `__r`/`ExponentFileSystem` are reachable the same way
  // every other companion in this repo already reaches them — no dependency
  // array edit needed, `__r` is a genuine bundle-wide global keyed by
  // absolute module id (confirmed, docs/findings.md §4).
  // Same logcat convention every companion in this repo uses (D63):
  //     adb logcat -s ReactNativeJS:V | grep mjolnir-audio-playback
  var TAG = "[mjolnir-audio-playback]";
  function log() {
    try {
      var args = Array.prototype.slice.call(arguments);
      args.unshift(TAG);
      console.log.apply(console, args);
    } catch (ex) {}
  }
  // Unconditional listener, independent of whatever the app itself wires up
  // via onFinishedPlaying/onFinishedLoading — lets logcat show native
  // playback lifecycle events even when nothing in the app is listening.
  try {
    c.addListener("FinishedPlaying", function (evt) {
      log("native event (unconditional): FinishedPlaying", evt && JSON.stringify(evt));
    });
    c.addListener("FinishedLoading", function (evt) {
      log("native event (unconditional): FinishedLoading", evt && JSON.stringify(evt));
    });
    // RNSoundPlayerModule's prepareUrl/mountSoundFile catch IOException
    // internally and emit this instead of throwing — the only visible sign
    // of a failed setDataSource()/prepare() (e.g. a file the player's own
    // process can't read). Nothing in this module listened for it before.
    c.addListener("OnSetupError", function (evt) {
      log("native event (unconditional): OnSetupError", evt && JSON.stringify(evt));
    });
  } catch (ex) {}
  var MOD_EXPO_MODULES_CORE = 2150;
  function fileSystem() {
    try {
      if (typeof __r === "function") {
        var mod = __r(MOD_EXPO_MODULES_CORE);
        if (mod && typeof mod.requireNativeModule === "function") {
          var viaApp = mod.requireNativeModule("ExponentFileSystem");
          if (viaApp) return viaApp;
        }
      }
    } catch (ex) {}
    var g2 = typeof globalThis !== "undefined" ? globalThis : null;
    return g2 && g2.expo && g2.expo.modules && g2.expo.modules.ExponentFileSystem;
  }
  e.default = {
    playSoundFile: function (n, o) {
      log("playSoundFile called:", n, o);
      if (isStockPrefix(n)) {
        log("stock prefix — delegating to native RNSoundPlayer.playSoundFile:", n);
        s.playSoundFile(n, o);
        return;
      }
      // D-P2: the manifest is an in-memory global the prefetcher companion
      // already populated — no fetch here, this lookup is synchronous.
      var manifest = typeof globalThis !== "undefined" ? globalThis.MJOLNIR_AUDIO_MANIFEST : null;
      if (!manifest) {
        log("no MJOLNIR_AUDIO_MANIFEST yet (prefetch sweep may still be running) — skipping:", n);
        return;
      }
      // D123 addendum: the manifest's keys are the card ids as the builder's
      // content DB stores them (uppercase, e.g. "C20001"), but playSoundFile
      // is invoked with the app's own lowercase runtime id ("c20001") — a
      // bare `manifest[n]` always missed, which read as "working" (silent
      // skip, D-P3's own intended behavior for a genuine cache miss) even
      // though every file was actually cached. Confirmed live: the
      // prefetch sweep logs showed "0 missing" while playback logged "no
      // manifest entry" for the exact same card, every single time.
      var sha256 = manifest[n] || manifest[String(n).toUpperCase()];
      if (!sha256) {
        log("no manifest entry for card (checked as-is and uppercased) — skipping:", n);
        return; // D-P3: no manifest entry — silent skip, never a URL attempt
      }
      var FS;
      try {
        FS = fileSystem();
      } catch (ex) {
        log("fileSystem() threw:", ex && ex.message ? ex.message : String(ex));
        return;
      }
      if (!FS || !FS.documentDirectory) {
        log("ExponentFileSystem unavailable — skipping:", n);
        return;
      }
      // documentDirectory is already a `file://…/` URI (D56) — do not
      // prepend another `file://` scheme on top of it.
      var path = FS.documentDirectory + "mj-audio/" + sha256 + ".mp3";
      log("resolved", n, "->", sha256, "checking cache at", path);
      // Same class of bug as D-P5's downloadAsync fix: native
      // ExponentFileSystem.getInfoAsync also takes 2 args — (path,
      // InfoOptions) — confirmed from the decompiled smali; both of
      // InfoOptions' fields (md5, size) are nullable, so {} is valid.
      FS.getInfoAsync(path, {})
        .then(function (info) {
          log("getInfoAsync result for", path, ":", info && JSON.stringify(info));
          if (info && info.exists) {
            // D-P6 (new): a file written by ExponentFileSystem.downloadAsync
            // has default (owner-only) Android file permissions — unlike the
            // stock asset-extraction path, which explicitly calls
            // File.setReadable(true, false) before building its own
            // file:// URI, nothing here widens this file's permissions.
            // RNSoundPlayerModule's prepareUrl (unlike the stock
            // playSoundFile path) has no such step either, so handing it a
            // raw file:// path here fails MediaPlayer.setDataSource() with a
            // silently-caught IOException, surfaced only as a native
            // "OnSetupError" event nothing was listening for (confirmed via
            // the decompiled smali). getContentUriAsync hands back a
            // content:// URI backed by a real FileProvider instead — those
            // use Binder permission grants, not raw file bits, and
            // RNSoundPlayerModule's setDataSource(Context, Uri) call is
            // scheme-agnostic, so no native change is needed.
            FS.getContentUriAsync(path)
              .then(function (contentUri) {
                log("resolved content:// URI — calling RNSoundPlayer.playUrl with", contentUri);
                s.playUrl(contentUri);
              })
              .catch(function (ex) {
                log(
                  "getContentUriAsync failed for",
                  path,
                  "— falling back to the raw file:// path (may silently fail to play):",
                  ex && ex.message ? ex.message : String(ex)
                );
                s.playUrl(path);
              });
          } else {
            log("cache miss — file does not exist on disk, skipping:", path);
          }
        })
        .catch(function (ex) {
          log("getInfoAsync failed for", path, ":", ex && ex.message ? ex.message : String(ex));
        });
    },
    playSoundFileWithDelay: function (n, o, t) {
      s.playSoundFileWithDelay(n, o, t);
    },
    loadSoundFile: function (n, o) {
      s.loadSoundFile(n, o);
    },
    setNumberOfLoops: function (n) {
      s.setNumberOfLoops(n);
    },
    playUrl: function (n) {
      log("playUrl called directly:", n);
      s.playUrl(n);
    },
    loadUrl: function (n) {
      log("loadUrl called directly:", n);
      s.loadUrl(n);
    },
    playAsset: (t = (0, u.default)(function* (n) {
      __DEV__ || "android" !== l.Platform.OS ? s.playUrl((0, f.default)(n).uri) : s.playSoundFile((0, f.default)(n).uri, '');
    }), function (n) {
      return t.apply(this, arguments);
    }),
    loadAsset: function (n) {
      __DEV__ || "android" !== l.Platform.OS ? s.loadUrl((0, f.default)(n).uri) : s.loadSoundFile((0, f.default)(n).uri, '');
    },
    onFinishedPlaying: function (n) {
      p && (p.remove(), p = void 0);
      p = c.addListener("FinishedPlaying", function (evt) {
        log("native event: FinishedPlaying", evt && JSON.stringify(evt));
        n(evt);
      });
    },
    onFinishedLoading: function (n) {
      y && (y.remove(), y = void 0);
      y = c.addListener("FinishedLoading", function (evt) {
        log("native event: FinishedLoading", evt && JSON.stringify(evt));
        n(evt);
      });
    },
    addEventListener: function (n, o) {
      return c.addListener(n, o);
    },
    play: function () {
      s.resume();
    },
    pause: function () {
      s.pause();
    },
    resume: function () {
      s.resume();
    },
    stop: function () {
      s.stop();
    },
    seek: function (n) {
      s.seek(n);
    },
    setVolume: function (n) {
      s.setVolume(n);
    },
    setSpeaker: function (n) {
      s.setSpeaker(n);
    },
    setMixAudio: function (n) {
      "android" === l.Platform.OS ? console.log("setMixAudio is not implemented on Android") : s.setMixAudio(n);
    },
    getInfo: (o = (0, u.default)(function* () {
      return s.getInfo();
    }), function () {
      return o.apply(this, arguments);
    }),
    unmount: function () {
      p && (p.remove(), p = void 0), y && (y.remove(), y = void 0);
    }
  };
}, 1440, [1, 68, 5, 102]);
