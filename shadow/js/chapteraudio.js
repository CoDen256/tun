// chapteraudio.js — the chapter chunk is the unit of download (design.md §3).
//
// On entering a chapter this makes exactly ONE audio request: it fetches the
// chunk's bytes once, wraps them in a blob URL for the <audio> element, and
// decodes a throwaway copy at a low sample rate purely to compute the peak
// envelope every waveform on the page is drawn from. After that, playing any
// sentence in the chapter is a seek inside audio already in memory — no
// request per sentence, which is what acceptance criterion 38 checks.
//
// Tier-2 decisions recorded here:
//  · the decode for peaks runs in an 8 kHz AudioContext, so a 45-minute
//    chapter costs ~86 MB transiently instead of ~500 MB, and the buffer is
//    dropped the moment the envelope is extracted;
//  · at most MAX_CHAPTERS chunks are kept; the least recently used one is
//    evicted and its blob URL revoked;
//  · the NEXT chapter is prefetched only once the reader is within
//    PREFETCH_WITHIN sentences of the end of this one, so "one request per
//    chapter entered" stays literally true while studying.

const ChapterAudio = (() => {
  'use strict';

  const MAX_CHAPTERS = 3;
  const PEAK_SAMPLE_RATE = 8000;
  const cache = new Map();          // chapterId -> entry
  const order = [];                 // chapterId, most-recent last

  function touch(id) {
    const i = order.indexOf(id);
    if (i >= 0) order.splice(i, 1);
    order.push(id);
    while (order.length > MAX_CHAPTERS) drop(order.shift());
  }

  function drop(id) {
    const e = cache.get(id);
    if (!e) return;
    try { if (e.audio) { e.audio.pause(); e.audio.removeAttribute('src'); e.audio.load(); } } catch (err) { /* already gone */ }
    if (e.url) URL.revokeObjectURL(e.url);
    cache.delete(id);
  }

  async function computePeaks(bytes) {
    const Ctx = window.AudioContext || window.webkitAudioContext;
    if (!Ctx) return null;
    let ctx = null;
    try {
      ctx = new Ctx({ sampleRate: PEAK_SAMPLE_RATE });
    } catch (e) {
      ctx = new Ctx();                       // some browsers refuse the rate
    }
    try {
      const buf = await ctx.decodeAudioData(bytes);
      return Wave.peaksFromBuffer(buf);      // the buffer dies with this scope
    } catch (e) {
      return null;                           // a missing picture is not a failure
    } finally {
      try { await ctx.close(); } catch (e) { /* closing twice is harmless */ }
    }
  }

  /** Fetch (once) everything needed to study a chapter. */
  async function ensure(chapterId, userId) {
    const hit = cache.get(chapterId);
    if (hit) { touch(chapterId); return hit.promise ? hit.promise : hit; }

    const entry = { id: chapterId, manifest: null, audio: null, url: null, peaks: null };
    entry.promise = (async () => {
      const manifest = await Api.chapterManifest(chapterId, userId);
      const res = await fetch(Api.chunkUrl(manifest));
      if (!res.ok) throw new Error('chapter audio unavailable (HTTP ' + res.status + ')');
      const bytes = await res.arrayBuffer();
      entry.manifest = manifest;
      entry.url = URL.createObjectURL(new Blob([bytes], { type: 'audio/ogg' }));
      entry.audio = new Audio(entry.url);
      entry.audio.preload = 'auto';
      // decodeAudioData detaches its input, so hand it a copy
      entry.peaks = await computePeaks(bytes.slice(0));
      delete entry.promise;
      return entry;
    })();
    cache.set(chapterId, entry);
    touch(chapterId);
    try {
      return await entry.promise;
    } catch (e) {
      cache.delete(chapterId);
      throw e;
    }
  }

  function peek(chapterId) {
    const e = cache.get(chapterId);
    return e && !e.promise ? e : null;
  }

  /** Boundaries inside the chapter changed — re-read the manifest, keep the audio. */
  async function refreshManifest(chapterId, userId) {
    const e = cache.get(chapterId);
    if (!e || e.promise) return null;
    e.manifest = await Api.chapterManifest(chapterId, userId);
    return e.manifest;
  }

  function prefetch(chapterId, userId) {
    if (!chapterId || cache.has(chapterId)) return;
    ensure(chapterId, userId).catch(() => { /* a failed prefetch costs nothing */ });
  }

  function metadataReady(audio) {
    if (audio.readyState >= 1) return Promise.resolve();
    return new Promise((resolve) => {
      const done = () => { audio.removeEventListener('loadedmetadata', done); resolve(); };
      audio.addEventListener('loadedmetadata', done);
    });
  }

  /**
   * Play [offsetMs, offsetMs+durationMs) of a loaded chapter, stopping dead
   * at the end of the range — never spilling into the next sentence
   * (criterion 24). Returns a stop() function.
   *
   * FOUR THINGS CAN STOP IT, deliberately, because requestAnimationFrame
   * alone cannot (confirmed by review, 2026-11-16): rAF is throttled to
   * nothing in a background tab and does not run at all on a locked
   * phone, while the audio keeps playing — so backgrounding mid-sentence
   * used to let the chapter run on through every following sentence,
   * which is precisely what criterion 24 forbids, on the device the
   * design exists for.
   *
   *   · rAF       the smooth one: drives onFrame, so it stays the primary
   *               path while the tab is visible;
   *   · timeupdate  fired by the media pipeline, not the frame clock, so
   *               it keeps arriving (~4/s) in a hidden tab;
   *   · ended     the chunk ran out before the range did;
   *   · a timer   armed for the remaining span plus a small margin. Timers
   *               are throttled in a background tab but not to zero, so
   *               this is the backstop of the backstop for a browser that
   *               decides to batch timeupdate as well.
   *
   * All four funnel into finish(), which is idempotent and removes every
   * listener, so whichever fires first wins and the rest are no-ops.
   */
  const END_EPSILON = 0.02;        // seconds; currentTime lands on a frame
                                   // boundary, not exactly on endSec

  function play(entry, offsetMs, durationMs, handlers) {
    const h = handlers || {};
    const audio = entry.audio;
    const endSec = (offsetMs + durationMs) / 1000;
    let raf = 0, timer = 0, stopped = false;

    function atEnd() {
      return audio.currentTime >= endSec - END_EPSILON;
    }
    function finish(reason) {
      if (stopped) return;
      stopped = true;
      cancelAnimationFrame(raf);
      clearTimeout(timer);
      audio.removeEventListener('timeupdate', onTimeUpdate);
      audio.removeEventListener('ended', onEnded);
      try { audio.pause(); } catch (e) { /* nothing playing */ }
      if (h.onEnd) h.onEnd(reason);
    }
    function onTimeUpdate() {
      // The backstop that works when the frame clock does not.
      if (!stopped && atEnd()) finish('end');
    }
    function onEnded() { finish('end'); }
    function tick() {
      if (stopped) return;
      const t = audio.currentTime;
      if (h.onFrame) h.onFrame(Math.max(0, Math.min(1, (t * 1000 - offsetMs) / Math.max(1, durationMs))));
      if (t >= endSec) { finish('end'); return; }
      raf = requestAnimationFrame(tick);
    }

    audio.addEventListener('timeupdate', onTimeUpdate);
    audio.addEventListener('ended', onEnded);

    metadataReady(audio).then(() => {
      if (stopped) return;
      audio.currentTime = offsetMs / 1000;
      const p = audio.play();
      if (p && p.catch) p.catch((e) => { if (h.onError) h.onError(e); finish('error'); });
      raf = requestAnimationFrame(tick);
      // Wall-clock backstop: the range's own length, plus a margin for a
      // slow start. It is re-armed by nothing — if it fires early,
      // atEnd() is false and it simply re-arms itself once.
      const armFor = () => {
        clearTimeout(timer);
        const remainMs = Math.max(0, (endSec - audio.currentTime) * 1000) + 120;
        timer = setTimeout(() => {
          if (stopped) return;
          if (atEnd() || audio.paused || audio.ended) finish('end');
          else armFor();
        }, remainMs);
      };
      armFor();
    });

    return () => finish('stopped');
  }

  function stopAll() {
    cache.forEach((e) => { try { if (e.audio) e.audio.pause(); } catch (err) { /* idle */ } });
  }

  function clear() {
    Array.from(cache.keys()).forEach(drop);
    order.length = 0;
  }

  return { ensure, peek, refreshManifest, prefetch, play, stopAll, clear, PREFETCH_WITHIN: 3 };
})();

// ── a single <audio> for the one-off previews Explore uses ────────────────
// Explore plays a sentence cut live by the server (GET /segments/<id>/audio)
// because it has no reason to pull a whole chapter just to hear one line.
const Preview = (() => {
  'use strict';
  let el = null, token = 0;
  function play(segId, onEnd) {
    const mine = ++token;
    if (!el) el = new Audio();
    el.pause();
    el.src = Api.segmentAudioUrl(segId, false);
    el.onended = () => { if (mine === token && onEnd) onEnd(); };
    const p = el.play();
    if (p && p.catch) p.catch(() => { if (mine === token && onEnd) onEnd(); });
    return () => { if (mine === token) { token++; el.pause(); } };
  }
  function stop() { token++; if (el) el.pause(); }
  return { play, stop };
})();
