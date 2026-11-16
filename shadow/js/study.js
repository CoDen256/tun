// study.js — the loop: one sentence, four primaries, a tray of the rest.
//
// The centre of this screen is TWO stacked lanes on one time axis (design.md
// §3): the audiobook's sentence above, the learner's take below, identical
// edges so they compare bar for bar. Each pitch contour is drawn inside its
// own lane; the separate contour panel that used to sit under the waveform
// is gone.
//
// Playback always comes out of the chapter chunk this screen already
// downloaded, and always stops dead at the end of the window it is playing
// rather than running into the next sentence. Recording is a MediaRecorder
// blob held in a Map that dies with the tab: there is no endpoint to upload
// it to and no control here that suggests otherwise. Trimming a take is a
// window applied to bytes that are already ephemeral — nothing is re-encoded
// for storage and nothing is sent anywhere.
//
// Slow playback (0.7×) and its `S` binding are GONE, deliberately — not
// hidden, not disabled: absent.

const Study = (() => {
  'use strict';

  const root = document.getElementById('s-study');
  const q = (s) => root.querySelector(s);
  const qa = (s) => Array.prototype.slice.call(root.querySelectorAll(s));

  const st = {
    segId: null,
    pos: 0,                 // parked playhead, 0..1 of the DRAWN window
    playing: false,
    stopPlay: null,
    chapterId: null,
    entry: null,
    loading: false,
    recording: false,
    recorder: null,
    micStream: null,
    recTimer: 0, meterTimer: 0, recStart: 0,
    liveLevels: null,       // the envelope accumulating while the mic is open
    stopTake: null,
    // Every move to another sentence bumps this. A pitch analysis that
    // returns after the move carries a stale generation and is dropped
    // instead of painting onto a sentence the operator has already left
    // (task 3.6 — the bug the operator reported).
    gen: 0,
  };
  const takes = new Map();  // segId -> {blob, buffer, peaks, trim} — session only, never sent

  // ── where are we ───────────────────────────────────────────────────────
  function idx() { return App.sentences.findIndex((s) => s.id === st.segId); }
  function seg() { const i = idx(); return i < 0 ? null : App.sentences[i]; }
  function chapterOf(s) { return App.chapters.find((c) => c.id === s.parentId) || null; }

  function setState(txt) { qa('.js-state').forEach((e) => { e.textContent = txt; }); }

  // ── the window this sentence is drawn and played over ──────────────────
  // Chunk-relative milliseconds. With trimming ON this is the speech window
  // the server computed; with it OFF it is the full stored span. The STORED
  // span is what progress is computed from, server-side, and nothing here
  // ever sends a trimmed span anywhere near it.
  function spanOf(s, trimmed) {
    const e = st.entry;
    const row = e && e.manifest && e.manifest.sentences.find((x) => x.id === s.id);
    if (row) {
      if (trimmed && row.speechOffsetMs != null && row.speechEndOffsetMs != null
          && row.speechEndOffsetMs > row.speechOffsetMs) {
        return { from: row.speechOffsetMs, to: row.speechEndOffsetMs };
      }
      return { from: row.offsetMs, to: row.offsetMs + s.durationMs };
    }
    // no manifest row (a freshly split sentence, say): derive from the chapter
    const ch = chapterOf(s);
    const base = ch ? s.startMs - ch.startMs : 0;
    if (trimmed && s.speechStartMs != null && s.speechEndMs != null
        && s.speechEndMs > s.speechStartMs) {
      return { from: base + (s.speechStartMs - s.startMs), to: base + (s.speechEndMs - s.startMs) };
    }
    return { from: base, to: base + s.durationMs };
  }
  function window_(s) { return spanOf(s, App.trim); }

  /** Is anything actually being trimmed off this sentence right now? */
  function trimmedHere(s) {
    const full = spanOf(s, false), win = spanOf(s, true);
    return App.trim && (win.from > full.from + 1 || win.to < full.to - 1);
  }

  // ── chapter audio ──────────────────────────────────────────────────────
  async function ensureChapter(s, force) {
    const ch = chapterOf(s);
    if (!ch) { st.entry = null; st.chapterId = null; return null; }
    if (!App.book || App.book.audioState !== 'ready') { st.entry = null; st.chapterId = null; return null; }
    if (st.chapterId === ch.id && st.entry && !force) return st.entry;
    st.loading = true;
    setState('fetching this chapter…');
    paintWave();
    try {
      st.entry = await ChapterAudio.ensure(ch.id, App.userId);
      st.chapterId = ch.id;
      setState(s.done ? 'done' : 'idle');
    } catch (e) {
      st.entry = null; st.chapterId = null;
      App.toast('Chapter audio unavailable: ' + e.message, true);
      setState('no audio');
    } finally {
      st.loading = false;
      paintWave();
    }
    maybePrefetchNext();
    return st.entry;
  }

  function maybePrefetchNext() {
    const s = seg();
    if (!s || !App.book || App.book.audioState !== 'ready') return;
    const kids = App.sentencesOf(s.parentId);
    const pos = kids.findIndex((x) => x.id === s.id);
    if (pos < 0 || kids.length - pos > ChapterAudio.PREFETCH_WITHIN) return;
    const ci = App.chapterIndexOf(s.parentId);
    const next = App.chapters[ci + 1];
    if (next) ChapterAudio.prefetch(next.id, App.userId);
  }

  // ── painting: the sentence lane ────────────────────────────────────────
  function paintWave() {
    const s = seg();
    const host = q('.js-wave');
    if (!s) { host.innerHTML = ''; return; }
    if (st.loading) { host.innerHTML = Wave.placeholder('fetching this chapter’s audio…'); return; }
    const e = st.entry;
    if (!e || !e.peaks) {
      host.innerHTML = Wave.placeholder(
        App.book && App.book.audioState === 'ready'
          ? 'no waveform for this chapter'
          : 'this book has no stored audio — upload it again to study with sound');
      return;
    }
    const w = window_(s);
    host.innerHTML = Wave.svg(e.peaks, w.from, w.to, 180, null, 'var(--ref)');
    paintTrimChip(s);
  }

  function paintTrimChip(s) {
    const on = App.trim;
    qa('.js-trimchip').forEach((el) => {
      el.textContent = on ? (s && trimmedHere(s) ? 'silence trimmed' : 'no silence to trim') : 'full span';
      el.title = on
        ? 'Trim silence is on (Settings) — the lanes show the speech window; doneness still covers the full span'
        : 'Trim silence is off (Settings) — the full untrimmed span';
    });
  }

  // ── painting: the take lane ────────────────────────────────────────────
  // It keeps its height whether or not there is a take in it, which is what
  // stops the controls beneath from moving when one appears (task 3.2).
  function paintTake() {
    const s = seg();
    const lane = q('.js-lane-usr');
    const host = q('.js-userwave');
    const take = s ? takes.get(s.id) : null;
    lane.classList.toggle('has-take', !!take);
    if (!take) {
      host.innerHTML = '';
      Pitch.clear(q('.js-contour-usr'));
      q('.js-userplayhead').style.left = '0%';
      q('.js-userwrap').classList.remove('playing');
      return;
    }
    const w = takeWindow(take);
    if (take.peaks) {
      host.innerHTML = Wave.svg(take.peaks, w.fromMs, w.toMs, 180, null, 'var(--usr)');
    } else {
      host.innerHTML = Wave.placeholder('take recorded — its waveform could not be decoded');
    }
  }

  /** The take's own trim window, in ms, honouring the one setting. */
  function takeWindow(take) {
    const dur = take.buffer ? take.buffer.duration * 1000 : 0;
    if (App.trim && take.trim) return { fromMs: take.trim.from * 1000, toMs: take.trim.to * 1000 };
    return { fromMs: 0, toMs: dur };
  }

  function paintTicks() {
    const s = seg();
    const host = q('.js-ticks');
    host.innerHTML = '';
    if (!s) return;
    const kids = App.sentencesOf(s.parentId);
    kids.forEach((k) => {
      const b = document.createElement('button');
      b.type = 'button';
      b.title = 'sentence ' + (App.globalIndexOf(k.id) + 1) + (k.done ? ' — done' : '');
      if (k.done) b.classList.add('done');
      if (k.id === s.id) b.classList.add('cur');
      b.addEventListener('click', () => go(App.globalIndexOf(k.id), false));
      host.appendChild(b);
    });
  }

  /** `P`'s state, applied to both lanes at once (task 3.5). */
  function paintContourState() {
    const on = App.contours;
    const lanes = q('.js-lanes');
    if (lanes) lanes.classList.toggle('contours', on);
    qa('.js-contour-toggle').forEach((b) => {
      b.classList.toggle('on', on);
      b.setAttribute('aria-pressed', String(on));
    });
  }

  function render() {
    const book = App.book;
    const s = seg();
    q('#stBook').textContent = book ? (book.title || book.originalFilename || '') : '';
    paintContourState();
    if (!s) {
      q('#stIdx').textContent = '–';
      q('#stTotal').textContent = '–';
      q('#stChapter').textContent = '';
      q('.js-wave').innerHTML = Wave.placeholder('this split config has no sentences yet — run an analysis in Prepare');
      q('.js-ticks').innerHTML = '';
      paintTake();
      paintChapterNav();
      return;
    }
    const gi = idx();
    const total = App.sentences.length;
    const doneN = App.sentences.filter((x) => x.done).length;
    const ci = App.chapterIndexOf(s.parentId);
    q('#stIdx').textContent = gi + 1;
    q('#stTotal').textContent = Fmt.int(total);
    q('#stChapter').textContent = ci >= 0 ? `Chapter ${ci + 1}` : '';
    q('#stProg').style.width = (total ? (100 * doneN) / total : 0).toFixed(1) + '%';
    qa('.js-dur').forEach((e) => { e.textContent = Fmt.secs(s.durationMs); });
    qa('.js-at').forEach((e) => { e.textContent = Fmt.clock(s.startMs); });
    const txt = q('.js-sent-text');
    txt.textContent = s.text || '';
    paintWave();
    paintTrimChip(s);
    paintTake();
    paintTicks();
    paintChapterNav();
    setState(s.done ? 'done' : 'idle');
    q('.js-playhead').style.left = '0%';
    q('.js-wavewrap').classList.remove('playing');
  }

  function paintChapterNav() {
    const s = seg();
    const ci = s ? App.chapterIndexOf(s.parentId) : -1;
    const n = App.chapters.length;
    qa('.js-chprev').forEach((b) => { b.disabled = !(ci > 0); });
    qa('.js-chnext').forEach((b) => { b.disabled = !(ci >= 0 && ci < n - 1); });
  }

  // ── moving ─────────────────────────────────────────────────────────────
  function stopPlayback() {
    if (st.stopPlay) { st.stopPlay(); st.stopPlay = null; }
    if (st.stopTake) { st.stopTake(); st.stopTake = null; }
    st.playing = false;
    q('.js-wavewrap').classList.remove('playing');
    q('.js-playhead').style.left = '0%';
    q('.js-userwrap').classList.remove('playing');
    q('.js-userplayhead').style.left = '0%';
    qa('.js-play').forEach((b) => b.classList.remove('on'));
  }

  function hidePanels() {
    ['.js-tr-panel', '.js-fl-panel'].forEach((sel) => q(sel).classList.add('hidden'));
    qa('.js-cmp, .js-tr, .js-fl').forEach((b) => b.classList.remove('on'));
  }

  async function go(nextIdx, markDone) {
    const s = seg();
    if (!s) return;
    if (markDone) {
      try {
        // The FULL stored span, always: trimming is a playback attribute and
        // must never reach progress.
        await Api.postProgress(App.book.id, { userId: App.userId, doneSegmentIds: [s.id] });
        await App.refreshBook();
      } catch (e) { App.toast('Could not save: ' + e.message, true); }
    }
    stopPlayback(); stopRecording();
    st.gen++;                             // anything in flight is now stale
    const all = App.sentences;
    if (!all.length) { render(); return; }
    const i = Math.max(0, Math.min(all.length - 1, nextIdx));
    st.segId = all[i].id;
    st.pos = 0;
    hidePanels();
    Pitch.clear(q('.js-contour-ref'));
    Pitch.clear(q('.js-contour-usr'));
    const box = q('.js-sentbox');
    if (box && !App.reduced) { box.classList.add('swap'); setTimeout(() => box.classList.remove('swap'), 170); }
    render();
    await ensureChapter(all[i]);
    render();
    saveCursor();
  }

  /** Shift+←/→ — chapter stepping. The ends of the book are a no-op, not a
      wrap and not an error (task 4.2). */
  function stepChapter(dir) {
    const s = seg();
    if (!s) return;
    const ci = App.chapterIndexOf(s.parentId);
    if (ci < 0) return;
    const target = App.chapters[ci + dir];
    if (!target) {
      App.toast(dir < 0 ? 'This is the first chapter.' : 'This is the last chapter.');
      return;
    }
    const kids = App.sentencesOf(target.id);
    if (!kids.length) { App.toast('That chapter has no sentences in this split config.'); return; }
    go(App.globalIndexOf(kids[0].id), false);
  }

  let cursorTimer = 0;
  function saveCursor() {
    const s = seg();
    if (!s || !App.book) return;
    clearTimeout(cursorTimer);
    cursorTimer = setTimeout(() => {
      Api.putCursor(App.book.id, { userId: App.userId, positionMs: s.startMs })
        .catch(() => { /* the cursor is a convenience, not a transaction */ });
    }, 250);
  }

  // ── play ───────────────────────────────────────────────────────────────
  function play(label, after) {
    const s = seg();
    if (!s) return;
    if (!st.entry) {
      App.toast(App.book && App.book.audioState === 'ready'
        ? 'This chapter’s audio has not loaded yet.'
        : 'This book has no stored audio.');
      return;
    }
    stopPlayback();
    st.playing = true;
    q('.js-wavewrap').classList.add('playing');
    qa('.js-play').forEach((b) => b.classList.add('on'));
    setState(label || 'playing');
    const ph = q('.js-playhead');
    const w = window_(s);
    st.stopPlay = ChapterAudio.play(st.entry, w.from, Math.max(1, w.to - w.from), {
      onFrame: (f) => { st.pos = f; ph.style.left = (f * 100).toFixed(2) + '%'; },
      onEnd: (reason) => {
        st.playing = false; st.stopPlay = null;
        q('.js-wavewrap').classList.remove('playing');
        qa('.js-play').forEach((b) => b.classList.remove('on'));
        if (reason === 'end') { st.pos = 1; setState(seg() && seg().done ? 'done' : 'idle'); if (after) after(); }
      },
      onError: (e) => App.toast('Playback failed: ' + (e.message || e), true),
    });
  }

  // Task 4.3: pressing play while it is already playing RESTARTS the
  // sentence and puts the playhead back to 0. It used to stop, which is the
  // behaviour the operator reported as wrong.
  function togglePlay() {
    const restarting = st.playing;
    play(restarting ? 'restarted from the beginning' : 'playing');
  }

  // ── record (ephemeral) ─────────────────────────────────────────────────
  // The live waveform IS the take lane, in exactly the box the finished take
  // will occupy, so nothing below it moves when recording starts or stops
  // (tasks 3.2 / 3.3).
  function stopRecording() {
    if (!st.recording) return;
    st.recording = false;
    clearInterval(st.recTimer); clearInterval(st.meterTimer);
    try { st.recorder.stop(); } catch (e) { /* already stopped */ }
    q('.js-lane-usr').classList.remove('recording');
    qa('.js-rec').forEach((b) => b.classList.remove('armed'));
  }

  /**
   * Where speech sits inside a decoded take. Conservative at onsets, like
   * the server's own detector: a frame counts as speech well below the
   * clip's peak, and the window is pulled back a further guard before the
   * first speech frame. Clipping a soft consonant is the failure mode that
   * matters and it is invisible, so this errs towards keeping silence.
   *
   * It is a WINDOW over bytes that die with the session. Nothing is cut,
   * re-encoded for storage or uploaded.
   */
  const TAKE_FRAME_MS = 20;
  const TAKE_REL_THRESHOLD = 0.06;   // ~ -24 dB below the take's own peak
  const TAKE_GUARD_MS = 80;          // never trim closer than this to speech
  const TAKE_MIN_SPEECH_MS = 150;    // below this, trust nothing and keep it all

  function takeSpeechWindow(buffer) {
    const sr = buffer.sampleRate;
    const data = buffer.getChannelData(0);
    const step = Math.max(1, Math.round((sr * TAKE_FRAME_MS) / 1000));
    const n = Math.ceil(data.length / step);
    const rms = new Float32Array(n);
    let peak = 0;
    for (let i = 0; i < n; i++) {
      const a = i * step, b = Math.min(data.length, a + step);
      let acc = 0;
      for (let k = a; k < b; k++) acc += data[k] * data[k];
      const v = Math.sqrt(acc / Math.max(1, b - a));
      rms[i] = v;
      if (v > peak) peak = v;
    }
    const total = buffer.duration;
    if (peak <= 0) return { from: 0, to: total };
    const thr = peak * TAKE_REL_THRESHOLD;
    let first = -1, last = -1;
    for (let i = 0; i < n; i++) if (rms[i] >= thr) { if (first < 0) first = i; last = i; }
    if (first < 0) return { from: 0, to: total };
    const guard = TAKE_GUARD_MS / 1000;
    const from = Math.max(0, (first * TAKE_FRAME_MS) / 1000 - guard);
    const to = Math.min(total, ((last + 1) * TAKE_FRAME_MS) / 1000 + guard);
    if (to - from < TAKE_MIN_SPEECH_MS / 1000) return { from: 0, to: total };
    return { from, to };
  }

  async function startRecording() {
    if (st.recording) { stopRecording(); return; }
    const s = seg();
    if (!s) return;
    stopPlayback();
    try {
      if (!st.micStream) st.micStream = await navigator.mediaDevices.getUserMedia({ audio: true });
    } catch (e) { App.toast('Microphone unavailable: ' + e.message, true); return; }

    const mine = st.gen;
    const chunks = [];
    const mime = pickRecorderMime();
    const rec = new MediaRecorder(st.micStream, mime ? { mimeType: mime } : undefined);
    rec.ondataavailable = (e) => { if (e.data && e.data.size) chunks.push(e.data); };
    rec.onstop = async () => {
      const blob = new Blob(chunks, { type: rec.mimeType || 'audio/webm' });
      const take = { blob, buffer: null, peaks: null, trim: null };
      takes.set(s.id, take);
      setState('take held in memory — C to compare');
      try {
        const Ctx = window.AudioContext || window.webkitAudioContext;
        const ctx = new Ctx();
        take.buffer = await ctx.decodeAudioData(await blob.arrayBuffer());
        take.peaks = Wave.peaksFromBuffer(take.buffer);
        take.trim = takeSpeechWindow(take.buffer);
        ctx.close();
      } catch (e) { /* playback still works; pitch comparison will not */ }
      if (mine === st.gen) paintTake();
    };
    rec.start();
    st.recorder = rec;
    st.recording = true;
    st.recStart = performance.now();
    st.liveLevels = [];
    q('.js-lane-usr').classList.add('recording');
    q('.js-userwave').innerHTML = '';
    Pitch.clear(q('.js-contour-usr'));
    qa('.js-rec').forEach((b) => b.classList.add('armed'));
    setState('recording');

    const rt = q('.js-rectime');
    st.recTimer = setInterval(() => {
      rt.textContent = ((performance.now() - st.recStart) / 1000).toFixed(1) + ' s';
    }, 100);

    // a real input level, read off the live stream, drawn as the take lane
    try {
      const Ctx = window.AudioContext || window.webkitAudioContext;
      const ctx = new Ctx();
      const src = ctx.createMediaStreamSource(st.micStream);
      const an = ctx.createAnalyser();
      an.fftSize = 1024;
      src.connect(an);
      const data = new Uint8Array(an.fftSize);
      const host = q('.js-userwave');
      st.meterTimer = setInterval(() => {
        if (!st.recording) { ctx.close().catch(() => {}); clearInterval(st.meterTimer); return; }
        an.getByteTimeDomainData(data);
        let pk = 0;
        for (let i = 0; i < data.length; i++) {
          const v = Math.abs(data[i] - 128) / 128;
          if (v > pk) pk = v;
        }
        st.liveLevels.push(pk);
        host.innerHTML = Wave.barsSvg(st.liveLevels, 'var(--rec)', 180);
      }, 60);
    } catch (e) { /* no live picture, still recording */ }
  }

  // ── playing a take, through the same trim window the lane draws ────────
  let takeCtx = null;
  function playTake(take, after) {
    if (!take.buffer) {                       // decode failed: play it whole
      const url = URL.createObjectURL(take.blob);
      const a = new Audio(url);
      a.onended = () => { URL.revokeObjectURL(url); if (after) after(); };
      a.play().catch(() => { URL.revokeObjectURL(url); if (after) after(); });
      st.stopTake = () => { a.pause(); URL.revokeObjectURL(url); };
      return;
    }
    const Ctx = window.AudioContext || window.webkitAudioContext;
    if (!takeCtx) takeCtx = new Ctx();
    if (takeCtx.state === 'suspended') takeCtx.resume().catch(() => {});
    const w = takeWindow(take);
    const offset = w.fromMs / 1000, dur = Math.max(0.02, (w.toMs - w.fromMs) / 1000);
    const src = takeCtx.createBufferSource();
    src.buffer = take.buffer;
    src.connect(takeCtx.destination);
    const ph = q('.js-userplayhead');
    const wrap = q('.js-userwrap');
    wrap.classList.add('playing');
    const t0 = takeCtx.currentTime;
    let raf = 0, done = false;
    const finish = () => {
      if (done) return;
      done = true;
      cancelAnimationFrame(raf);
      wrap.classList.remove('playing');
      ph.style.left = '0%';
      st.stopTake = null;
      try { src.stop(); } catch (e) { /* already stopped */ }
      if (after) after();
    };
    const tick = () => {
      if (done) return;
      const f = Math.max(0, Math.min(1, (takeCtx.currentTime - t0) / dur));
      ph.style.left = (f * 100).toFixed(2) + '%';
      raf = requestAnimationFrame(tick);
    };
    src.onended = finish;
    src.start(0, offset, dur);
    raf = requestAnimationFrame(tick);
    st.stopTake = finish;
  }

  /** The trimmed slice of a take, as WAV — for Praat only, never for us. */
  function takeWavBlob(take) {
    if (!take.buffer) return null;
    const w = takeWindow(take);
    const sr = take.buffer.sampleRate;
    const all = take.buffer.getChannelData(0);
    const a = Math.max(0, Math.floor((w.fromMs / 1000) * sr));
    const b = Math.min(all.length, Math.ceil((w.toMs / 1000) * sr));
    return encodeWavBlob(all.subarray(a, Math.max(a + 1, b)), sr);
  }

  // ── compare — each contour on its own lane ─────────────────────────────
  async function compare() {
    const s = seg();
    if (!s) return;
    const take = takes.get(s.id);
    if (!take) { App.toast('Record a take first — R.'); return; }
    stopRecording();
    qa('.js-cmp').forEach((b) => b.classList.add('on'));
    const refSvg = q('.js-contour-ref'), usrSvg = q('.js-contour-usr');
    Pitch.clear(refSvg); Pitch.clear(usrSvg);

    // the generation guard: this is the sentence the analysis belongs to
    const mine = st.gen;
    const mineId = s.id;
    const w = window_(s);
    const refMs = Math.max(1, w.to - w.from);
    const tw = takeWindow(take);
    const takeMs = Math.max(1, tw.toMs - tw.fromMs);

    const pitchWork = (async () => {
      const refRes = await fetch(Api.segmentAudioUrl(s.id, true, App.trim));
      if (!refRes.ok) throw new Error('reference audio unavailable');
      const refBlob = await refRes.blob();
      const takeBlob = takeWavBlob(take);
      const [refPitch, takePitch] = await Promise.all([
        Pitch.analyse(refBlob),
        takeBlob ? Pitch.analyse(takeBlob) : Promise.resolve(null),
      ]);
      return { refPitch, takePitch };
    })();

    play('comparing — reference (book)', () => {
      setTimeout(() => playTake(take, () => setState('compared')), 250);
      setState('comparing — your take');
    });

    try {
      const r = await pitchWork;
      // Task 3.6 — a late result must never paint onto a sentence already
      // left. Both the generation and the identity have to still match.
      if (mine !== st.gen || mineId !== st.segId) return;
      const a = Pitch.renderOne(refSvg, r.refPitch, refMs, 'var(--ref)', false);
      const b = Pitch.renderOne(usrSvg, r.takePitch, takeMs, 'var(--usr)', true);
      if (!a && !b) App.toast('No pitch was detected in either clip.');
    } catch (e) {
      if (mine === st.gen) App.toast('Pitch analysis failed: ' + e.message, true);
    }
  }

  // ── transcribe ─────────────────────────────────────────────────────────
  let providerCache = null;
  async function provider() {
    if (providerCache) return providerCache;
    try {
      const all = await fetch(`${API_BASE}/api/v1/settings?userId=${App.userId}`).then((r) => r.json());
      const stored = all.transcribeBackend || {};
      providerCache = (typeof stored.provider === 'string' && stored.provider) || 'hf_whisper';
    } catch (e) { providerCache = 'hf_whisper'; }
    return providerCache;
  }

  async function transcribe() {
    const s = seg();
    if (!s) return;
    if (!App.book || App.book.audioState !== 'ready') { App.toast('This book has no stored audio.'); return; }
    const panel = q('.js-tr-panel'), out = q('.js-tr-text');
    panel.classList.remove('hidden');
    qa('.js-tr').forEach((b) => b.classList.add('on'));
    out.textContent = 'Transcribing this one sentence…';
    try {
      const wav = await fetch(Api.segmentAudioUrl(s.id, true));
      if (!wav.ok) throw new Error('sentence audio unavailable');
      const form = new FormData();
      form.append('file', await wav.blob(), 'sentence.wav');
      form.append('provider', await provider());
      const res = await fetch(API_BASE + '/transcribe', { method: 'POST', body: form, signal: AbortSignal.timeout(90000) });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(data.error || ('HTTP ' + res.status));
      const text = data.text || '(no speech detected)';
      out.textContent = text;
      await Api.patchSegmentText(s.id, text);
      s.text = text;
      q('.js-sent-text').textContent = text;
    } catch (e) {
      out.textContent = 'Transcription failed: ' + e.message;
    }
  }

  // ── Formant Lab — the BOOK's audio, never the take ─────────────────────
  async function formantLab() {
    const s = seg();
    if (!s) return;
    if (!App.book || App.book.audioState !== 'ready') { App.toast('This book has no stored audio.'); return; }
    const panel = q('.js-fl-panel'), out = q('.js-fl-text');
    panel.classList.remove('hidden');
    qa('.js-fl').forEach((b) => b.classList.add('on'));
    out.textContent = 'Preparing this sentence’s book audio…';
    // The window is opened FIRST, inside the user gesture that triggered F:
    // opening it after an awaited fetch loses the activation and the popup is
    // blocked. The listener goes up straight away too, because praat.html can
    // say it is ready before the audio has finished arriving here.
    const win = window.open(PHONEXA_BASE + '/praat.html?ingestFromOpener=1', '_blank');
    if (!win) { out.textContent = 'Popup blocked — allow popups for this site and press F again.'; return; }

    let buffer = null, ready = false;
    const handoff = () => {
      if (!ready || !buffer) return;
      window.removeEventListener('message', onMessage);
      win.postMessage({ type: 'load-audio-blob', buffer }, location.origin, [buffer]);
      buffer = null;
    };
    const onMessage = (e) => {
      if (e.origin !== location.origin || e.source !== win) return;
      if (!e.data || e.data.type !== 'praat-ready-for-blob') return;
      ready = true;
      handoff();
    };
    window.addEventListener('message', onMessage);

    try {
      const res = await fetch(Api.segmentAudioUrl(s.id, true));
      if (!res.ok) throw new Error('sentence audio unavailable');
      buffer = await res.arrayBuffer();
      handoff();
      out.innerHTML = `Sent this sentence's <b>book audio</b> (${Fmt.clock(s.startMs)} → ${Fmt.clock(s.endMs)}) `
        + 'to phonexa for vowel analysis. Your own take is never sent here.';
    } catch (e) {
      window.removeEventListener('message', onMessage);
      out.textContent = 'Could not open Formant Lab: ' + e.message;
    }
  }

  // ── boundary editing from Study ───────────────────────────────────────
  // The playhead is a fraction of the DRAWN window, which may be the trimmed
  // one, so it is resolved back to an absolute millisecond through that same
  // window — and then clamped inside the sentence's STORED span, because a
  // boundary is a stored thing and trimming never moves one.
  function playheadMs(s) {
    const w = window_(s);
    const ch = chapterOf(s);
    const base = ch ? ch.startMs : 0;
    const at = base + w.from + st.pos * (w.to - w.from);
    return Math.round(Math.max(s.startMs + 1, Math.min(s.endMs - 1, at)));
  }

  async function splitHere() {
    const s = seg();
    if (!s) return;
    const atMs = (st.pos > 0.02 && st.pos < 0.98)
      ? playheadMs(s)
      : Math.round(s.startMs + 0.5 * s.durationMs);
    try {
      await Api.splitSegment(s.id, atMs);
      await afterBoundaryChange(s.id);
      App.toast('Split at ' + Fmt.clock(atMs) + ' — this config now has ' + App.sentences.length + ' sentences.');
    } catch (e) { App.toast('Could not split: ' + e.message, true); }
  }

  async function mergeNext() {
    const s = seg();
    if (!s) return;
    const kids = App.sentencesOf(s.parentId);
    const i = kids.findIndex((x) => x.id === s.id);
    const next = kids[i + 1];
    if (!next) { App.toast('Nothing after this one in this chapter to merge.'); return; }
    try {
      await Api.mergeSegments(s.id, next.id);
      await afterBoundaryChange(s.id);
      App.toast('Merged — this config now has ' + App.sentences.length + ' sentences.');
    } catch (e) { App.toast('Could not merge: ' + e.message, true); }
  }

  async function afterBoundaryChange(keepSegId) {
    await App.refreshBook();
    st.segId = App.sentences.some((x) => x.id === keepSegId) ? keepSegId : (App.sentences[0] || {}).id;
    const s = seg();
    if (s && st.chapterId) await ChapterAudio.refreshManifest(st.chapterId, App.userId).catch(() => {});
    st.pos = 0;
    st.gen++;
    render();
    Explore.render();
  }

  function jumpUnfinished() {
    const i = App.sentences.findIndex((s) => !s.done);
    if (i < 0) { App.toast('Every sentence in this config is done.'); return; }
    go(i, false);
    setState('jumped to the first unfinished sentence');
  }

  // ── the ⋯ sheet (phone) ────────────────────────────────────────────────
  function closeSheet() {
    q('.js-sheet').classList.remove('open');
    q('.js-scrim').classList.remove('on');
  }

  // ── the phone's hidden navigation (task 6.1) ───────────────────────────
  let navTimer = 0;
  function revealNav(on) {
    document.body.classList.toggle('nav-open', !!on);
    clearTimeout(navTimer);
    // auto-hide: on the next action (every bound control calls revealNav(false))
    // or after a few idle seconds, whichever comes first.
    if (on) navTimer = setTimeout(() => document.body.classList.remove('nav-open'), 3600);
  }

  // ── lifecycle ──────────────────────────────────────────────────────────
  /** Called after the open book is (re)loaded: keep the sentence if it survived. */
  function adopt() {
    const all = App.sentences;
    if (!all.length) { st.segId = null; if (App.state.screen === 'study') render(); return; }
    if (!st.segId || !all.some((s) => s.id === st.segId)) {
      const book = App.book;
      st.segId = (book && book.cursorSegmentId) || all[0].id;
      if (!all.some((s) => s.id === st.segId)) st.segId = all[0].id;
    }
    if (App.state.screen === 'study') render();
  }

  /** Called when the Study screen is shown. */
  async function enter() {
    adopt();
    render();
    const s = seg();
    if (s) { await ensureChapter(s); render(); saveCursor(); }
  }

  function leaveQuietly() { stopPlayback(); stopRecording(); closeSheet(); revealNav(false); }

  function openAt(segId) {
    st.segId = segId;
    App.show('study');
  }

  // ── wiring ─────────────────────────────────────────────────────────────
  // Every bound control also hides the phone's pulled-down navigation: that
  // is the "auto-hide on the next action" of task 6.1.
  function bind(sel, fn) {
    qa(sel).forEach((b) => b.addEventListener('click', (e) => { revealNav(false); fn(e); }));
  }

  function init() {
    bind('.js-play', togglePlay);
    bind('.js-rec', startRecording);
    bind('.js-cmp', compare);
    bind('.js-done', () => go(idx() + 1, true));
    bind('.js-prev', () => go(idx() - 1, false));
    bind('.js-next', () => go(idx() + 1, false));
    bind('.js-chprev', () => stepChapter(-1));
    bind('.js-chnext', () => stepChapter(1));
    bind('.js-contour-toggle', () => App.setContours(!App.contours));
    bind('.js-split', () => { closeSheet(); splitHere(); });
    bind('.js-merge', () => { closeSheet(); mergeNext(); });
    bind('.js-tr', () => { closeSheet(); transcribe(); });
    bind('.js-fl', () => { closeSheet(); formantLab(); });
    bind('.js-jump', () => { closeSheet(); jumpUnfinished(); });
    bind('.js-help', () => { closeSheet(); App.overlay(true); });
    bind('.js-exit', () => App.show('library'));
    bind('.js-close-tr', () => { q('.js-tr-panel').classList.add('hidden'); qa('.js-tr').forEach((b) => b.classList.remove('on')); });
    bind('.js-close-fl', () => { q('.js-fl-panel').classList.add('hidden'); qa('.js-fl').forEach((b) => b.classList.remove('on')); });

    qa('.js-more').forEach((b) => b.addEventListener('click', () => {
      revealNav(false);
      q('.js-sheet').classList.toggle('open');
      q('.js-scrim').classList.toggle('on');
    }));
    q('.js-scrim').addEventListener('click', closeSheet);

    // the pull-tab: a short downward drag, or a plain tap, reveals the nav
    const pull = q('.js-pull');
    if (pull) {
      let py = null;
      pull.addEventListener('pointerdown', (e) => { py = e.clientY; });
      pull.addEventListener('pointermove', (e) => {
        if (py !== null && e.clientY - py > 16) { revealNav(true); py = null; }
      });
      pull.addEventListener('pointerup', () => {
        if (py !== null) revealNav(!document.body.classList.contains('nav-open'));
        py = null;
      });
      pull.addEventListener('pointercancel', () => { py = null; });
      // keyboard and synthetic activation still work
      pull.addEventListener('click', (e) => {
        if (e.detail === 0) revealNav(!document.body.classList.contains('nav-open'));
      });
    }

    // clicking the sentence lane parks the playhead — that is what X splits at
    const ww = q('.js-wavewrap');
    ww.addEventListener('click', (e) => {
      if (st.playing) return;
      const r = ww.getBoundingClientRect();
      st.pos = Math.max(0, Math.min(1, (e.clientX - r.left) / r.width));
      q('.js-playhead').style.left = (st.pos * 100).toFixed(2) + '%';
      ww.classList.add('playing');
      setState('playhead at ' + Math.round(st.pos * 100) + '% — X splits here');
    });
    let sx = null;
    ww.addEventListener('touchstart', (e) => { sx = e.touches[0].clientX; }, { passive: true });
    ww.addEventListener('touchend', (e) => {
      if (sx === null) return;
      const dx = e.changedTouches[0].clientX - sx;
      if (Math.abs(dx) > 48) go(idx() + (dx < 0 ? 1 : -1), false);
      sx = null;
    }, { passive: true });
  }

  function key(k, ev) {
    // Shift+←/→ step a CHAPTER; plain ←/→ still only move the sentence and
    // still never touch a done state (tasks 4.2 / 4.4).
    if (ev.shiftKey && (k === 'arrowleft' || k === 'arrowright')) {
      ev.preventDefault();
      revealNav(false);
      stepChapter(k === 'arrowleft' ? -1 : 1);
      return;
    }
    switch (k) {
      case ' ': ev.preventDefault(); if (st.recording) stopRecording(); else togglePlay(); break;
      case 'r': ev.preventDefault(); startRecording(); break;
      case 'c': compare(); break;
      case 'enter': ev.preventDefault(); go(idx() + 1, true); break;
      case 'arrowleft': ev.preventDefault(); go(idx() - 1, false); break;
      case 'arrowright': ev.preventDefault(); go(idx() + 1, false); break;
      case 'p': ev.preventDefault(); App.setContours(!App.contours); break;
      case 'x': splitHere(); break;
      case 'm': mergeNext(); break;
      case 't': transcribe(); break;
      case 'f': formantLab(); break;
      case 'u': jumpUnfinished(); break;
      case 'escape':
        if (document.body.classList.contains('nav-open')) { revealNav(false); return; }
        if (q('.js-sheet').classList.contains('open')) { closeSheet(); return; }
        if (!q('.js-tr-panel').classList.contains('hidden')
            || !q('.js-fl-panel').classList.contains('hidden')) { stopPlayback(); hidePanels(); return; }
        stopPlayback(); stopRecording(); App.show('library');
        break;
      default: break;                       // there is no `S`: slow playback is gone
    }
  }

  return { init, enter, adopt, leaveQuietly, openAt, key, render, paintContourState };
})();
