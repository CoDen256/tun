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

  // A cold chapter is cut on demand, and since 2026-11-17 that cut has a
  // BOUNDED budget on the request path (holding a web worker for an hour was
  // a confirmed defect). When the budget expires the server answers 503 with
  // `state: 'preparing'` and a Retry-After — the encode it started in the
  // background is still running — so the honest client behaviour is to wait
  // and ask again rather than to report the chapter unavailable.
  const PREPARING_TRIES = 5;
  const PREPARING_MAX_WAIT_SEC = 30;

  async function fetchChunk(url) {
    for (let attempt = 0; ; attempt += 1) {
      const res = await fetch(url);
      if (res.ok) return res.arrayBuffer();
      let preparing = false;
      let wait = 15;
      if (res.status === 503) {
        const after = parseInt(res.headers.get('Retry-After') || '', 10);
        if (!isNaN(after)) wait = Math.min(after, PREPARING_MAX_WAIT_SEC);
        try {
          const body = await res.clone().json();
          preparing = body && body.state === 'preparing';
        } catch (e) { preparing = false; }
      }
      if (!preparing || attempt >= PREPARING_TRIES - 1) {
        if (preparing) {
          throw new Error('this chapter is still being cut — it is running in '
            + 'the background, try again in a minute');
        }
        throw new Error('chapter audio unavailable (HTTP ' + res.status + ')');
      }
      await new Promise((r) => setTimeout(r, wait * 1000));
    }
  }

  /** Fetch (once) everything needed to study a chapter. */
  async function ensure(chapterId, userId) {
    const hit = cache.get(chapterId);
    if (hit) { touch(chapterId); return hit.promise ? hit.promise : hit; }

    const entry = { id: chapterId, manifest: null, audio: null, url: null, peaks: null };
    entry.promise = (async () => {
      const manifest = await Api.chapterManifest(chapterId, userId);
      const bytes = await fetchChunk(Api.chunkUrl(manifest));
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

  /**
   * start() — the same range player, as a HANDLE that can also pause
   * (D4: the one play/pause model). handlers:
   *   onFrame(frac, chunkMs)  frac of [offsetMs, offsetMs+durationMs),
   *                           chunkMs = the element's real position, in
   *                           chunk-relative ms. Fired by rAF while visible
   *                           AND by timeupdate (~4/s) when it is not, so a
   *                           position observer keeps working in a hidden tab.
   *   onState('playing'|'paused')
   *   onEnd(reason)           'end' | 'stopped' | 'error' — exactly once
   *   onError(err)
   * The handle: stop(), pause(), resume(), togglePause(), paused, stopped,
   * positionMs() (chunk-relative), fraction().
   */
  function start(entry, offsetMs, durationMs, handlers) {
    const h = handlers || {};
    const audio = entry.audio;
    const endSec = (offsetMs + durationMs) / 1000;
    let raf = 0, timer = 0, stopped = false, paused = false, started = false;

    const frac = () => Math.max(0, Math.min(1, (audio.currentTime * 1000 - offsetMs) / Math.max(1, durationMs)));
    function emit() { if (h.onFrame) h.onFrame(frac(), audio.currentTime * 1000); }
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
      if (stopped || paused || !started) return;
      if (atEnd()) { finish('end'); return; }
      emit();
    }
    function onEnded() { if (!paused) finish('end'); }
    function tick() {
      if (stopped || paused) return;
      emit();
      if (audio.currentTime >= endSec) { finish('end'); return; }
      raf = requestAnimationFrame(tick);
    }
    // Wall-clock backstop: the range's remaining length, plus a margin for a
    // slow start. If it fires early, atEnd() is false and it re-arms itself.
    // Someone ELSE pausing the shared element (an evicted chunk) ends us.
    function arm() {
      clearTimeout(timer);
      const remainMs = Math.max(0, (endSec - audio.currentTime) * 1000) + 120;
      timer = setTimeout(() => {
        if (stopped || paused) return;
        if (atEnd() || audio.paused || audio.ended) finish('end');
        else arm();
      }, remainMs);
    }
    function go() {
      const p = audio.play();
      if (p && p.catch) {
        p.catch((e) => {
          // a play() interrupted by our own pause()/stop() is not a failure
          if (stopped || paused) return;
          if (h.onError) h.onError(e);
          finish('error');
        });
      }
      raf = requestAnimationFrame(tick);
      arm();
    }

    audio.addEventListener('timeupdate', onTimeUpdate);
    audio.addEventListener('ended', onEnded);

    metadataReady(audio).then(() => {
      if (stopped) return;
      audio.currentTime = offsetMs / 1000;
      started = true;
      if (!paused) go();
    });

    const handle = {
      stop() { finish('stopped'); },
      pause() {
        if (stopped || paused) return;
        paused = true;
        cancelAnimationFrame(raf);
        clearTimeout(timer);
        try { audio.pause(); } catch (e) { /* idle */ }
        if (started) emit();
        if (h.onState) h.onState('paused');
      },
      resume() {
        if (stopped || !paused) return;
        paused = false;
        if (started) go();
        if (h.onState) h.onState('playing');
      },
      togglePause() { if (paused) handle.resume(); else handle.pause(); },
      get paused() { return paused; },
      get stopped() { return stopped; },
      positionMs() { return audio.currentTime * 1000; },
      fraction: frac,
    };
    return handle;
  }

  /** The original API: play a range, get back a stop() function. */
  function play(entry, offsetMs, durationMs, handlers) {
    const hd = start(entry, offsetMs, durationMs, handlers);
    return () => hd.stop();
  }

  function stopAll() {
    cache.forEach((e) => { try { if (e.audio) e.audio.pause(); } catch (err) { /* idle */ } });
  }

  function clear() {
    Array.from(cache.keys()).forEach(drop);
    order.length = 0;
  }

  return { ensure, peek, refreshManifest, prefetch, play, start, stopAll, clear, PREFETCH_WITHIN: 3 };
})();

// ── Player: the ONE play/pause model (design D4) ─────────────────────────
// Every sentence player on the page — Study's lane (and its take), the
// Prepare row preview, the Explore cell preview — goes through here, so:
//   · ▶ always (re)starts from the beginning, playing or paused;
//   · a secondary pause pauses with the playhead frozen and resumes from
//     that point (handle.togglePause());
//   · starting ANY player stops every other one on the page (only one
//     sound is ever audible);
//   · positions are read off the real element, never animated.
//
// The `/segments/<id>/audio` cut is no longer used by any preview: Explore
// and Prepare both seek inside the chapter chunk (D3), loading it first
// with a loading state on the pressed control.
const Player = (() => {
  'use strict';
  let current = null;       // the one live handle
  let pending = null;       // a preview waiting for its chunk: {cancel()}

  function cancelPending() { if (pending) { const p = pending; pending = null; p.cancel(); } }

  /** Make `h` the one live player, stopping whatever else plays. A handle
      needs stop(); pause()/resume()/togglePause()/paused are optional. */
  function claim(h) {
    cancelPending();
    if (current && current !== h) { const c = current; current = null; try { c.stop(); } catch (e) { /* gone */ } }
    current = h;
    return h;
  }
  function release(h) { if (current === h) current = null; }
  function stopAll() {
    cancelPending();
    if (current) { const c = current; current = null; try { c.stop(); } catch (e) { /* gone */ } }
  }
  function active() { return current; }
  /** The live handle if it was started with this owner key, else null. */
  function owned(owner) { return current && current.owner === owner ? current : null; }

  /**
   * Play [fromMs, toMs) — chunk-relative — of a loaded chapter entry.
   * handlers as ChapterAudio.start (onFrame(frac, chunkMs), onState, onEnd,
   * onError) plus `owner`, a free-form key the caller can find it by. For a
   * CONTINUOUS run (audiobook mode) pass toMs = the chunk's end and follow
   * chunkMs in onFrame.
   */
  function chapter(entry, fromMs, toMs, handlers) {
    const h = handlers || {};
    stopAll();
    let hd = null;
    hd = ChapterAudio.start(entry, fromMs, Math.max(1, toMs - fromMs), {
      onFrame: h.onFrame,
      onState: h.onState,
      onError: h.onError,
      onEnd: (reason) => { release(hd); if (h.onEnd) h.onEnd(reason); },
    });
    hd.owner = h.owner || null;
    current = hd;
    return hd;
  }

  /** Where a sentence sits inside its chapter chunk: the manifest's own
      offset when it has the row (audio-accuracy), else derived. */
  function offsetOf(entry, chapter, s) {
    const row = entry && entry.manifest && entry.manifest.sentences
      && entry.manifest.sentences.find((x) => x.id === s.id);
    return row ? row.offsetMs : s.startMs - chapter.startMs;
  }

  /**
   * A sentence preview (Prepare row, Explore cell): the full stored span,
   * out of the chapter chunk. ui.onState('loading'|'playing'|'paused'|
   * 'stopped'), ui.onFrame(frac). Pressing it again restarts it.
   */
  function preview(ch, s, ui) {
    const owner = 'preview:' + s.id;
    const say = (x) => { if (ui.onState) ui.onState(x); };
    const run = (entry) => {
      const from = offsetOf(entry, ch, s);
      const hd = chapter(entry, from, from + s.durationMs, {
        owner,
        onFrame: (f) => { if (ui.onFrame) ui.onFrame(f); },
        onState: say,
        onEnd: () => say('stopped'),
        onError: (e) => { if (typeof App !== 'undefined') App.toast('Playback failed: ' + (e.message || e), true); },
      });
      if (ui.onFrame) ui.onFrame(0);
      say('playing');
      return hd;
    };
    const ready = ChapterAudio.peek(ch.id);
    if (ready) return run(ready);

    // Not loaded yet: show the loading state, play when it arrives — never
    // silence, never a neighbour. A newer press anywhere cancels this one.
    stopAll();
    let live = true;
    pending = { cancel: () => { live = false; say('stopped'); } };
    const mine = pending;
    say('loading');
    ChapterAudio.ensure(ch.id).then((entry) => {
      if (!live) return;
      if (pending === mine) pending = null;
      run(entry);
    }).catch((e) => {
      if (!live) return;
      if (pending === mine) pending = null;
      say('stopped');
      if (typeof App !== 'undefined') App.toast('Chapter audio unavailable: ' + e.message, true);
    });
    return null;
  }

  return { chapter, preview, claim, release, stopAll, active, owned, offsetOf };
})();
