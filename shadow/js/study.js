// study.js — the loop: one sentence, four primaries, a tray of the rest.
//
// Playback always comes out of the chapter chunk this screen already
// downloaded, and always stops dead at the sentence's end rather than
// running into the next one. Recording is a MediaRecorder blob held in a
// Map that dies with the tab: there is no endpoint to upload it to and no
// control here that suggests otherwise.
//
// Slow playback (0.7×) and its `S` binding are GONE, deliberately (task
// 5.8) — not hidden, not disabled: absent.

const Study = (() => {
  'use strict';

  const root = document.getElementById('s-study');
  const q = (s) => root.querySelector(s);
  const qa = (s) => Array.prototype.slice.call(root.querySelectorAll(s));

  const st = {
    segId: null,
    pos: 0,                 // parked playhead, 0..1 of the sentence
    playing: false,
    stopPlay: null,
    chapterId: null,
    entry: null,
    loading: false,
    recording: false,
    recorder: null,
    micStream: null,
    recTimer: 0, meterTimer: 0, recStart: 0,
  };
  const takes = new Map();  // segId -> {blob, buffer} — session only, never sent

  // ── where are we ───────────────────────────────────────────────────────
  function idx() { return App.sentences.findIndex((s) => s.id === st.segId); }
  function seg() { const i = idx(); return i < 0 ? null : App.sentences[i]; }
  function chapterOf(s) { return App.chapters.find((c) => c.id === s.parentId) || null; }

  function setState(txt) { qa('.js-state').forEach((e) => { e.textContent = txt; }); }

  // ── chapter audio ──────────────────────────────────────────────────────
  function offsetOf(s) {
    const e = st.entry;
    if (e && e.manifest) {
      const row = e.manifest.sentences.find((x) => x.id === s.id);
      if (row) return row.offsetMs;
      return s.startMs - e.manifest.startMs;
    }
    const ch = chapterOf(s);
    return ch ? s.startMs - ch.startMs : 0;
  }

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

  // ── painting ───────────────────────────────────────────────────────────
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
    const from = offsetOf(s);
    host.innerHTML = Wave.svg(e.peaks, from, from + s.durationMs, 180);
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
      b.title = 'sentence ' + (App.globalIndexOf(k.id) + 1);
      if (k.done) b.classList.add('done');
      if (k.id === s.id) b.classList.add('cur');
      b.addEventListener('click', () => go(App.globalIndexOf(k.id), false));
      host.appendChild(b);
    });
  }

  function render() {
    const book = App.book;
    const s = seg();
    q('#stBook').textContent = book ? (book.title || book.originalFilename || '') : '';
    if (!s) {
      q('#stIdx').textContent = '–';
      q('#stTotal').textContent = '–';
      q('#stChapter').textContent = '';
      q('.js-wave').innerHTML = Wave.placeholder('this split config has no sentences yet — run an analysis in Prepare');
      q('.js-ticks').innerHTML = '';
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
    paintTicks();
    setState(s.done ? 'done' : 'idle');
    q('.js-playhead').style.left = '0%';
    q('.js-wavewrap').classList.remove('playing');
  }

  // ── moving ─────────────────────────────────────────────────────────────
  function stopPlayback() {
    if (st.stopPlay) { st.stopPlay(); st.stopPlay = null; }
    st.playing = false;
    q('.js-wavewrap').classList.remove('playing');
    q('.js-playhead').style.left = '0%';
    qa('.js-play').forEach((b) => b.classList.remove('on'));
  }

  function hidePanels() {
    ['.js-cmp-panel', '.js-tr-panel', '.js-fl-panel'].forEach((sel) => q(sel).classList.add('hidden'));
    qa('.js-cmp, .js-tr, .js-fl').forEach((b) => b.classList.remove('on'));
  }

  async function go(nextIdx, markDone) {
    const s = seg();
    if (!s) return;
    if (markDone) {
      try {
        await Api.postProgress(App.book.id, { userId: App.userId, doneSegmentIds: [s.id] });
        await App.refreshBook();
      } catch (e) { App.toast('Could not save: ' + e.message, true); }
    }
    stopPlayback(); stopRecording();
    const all = App.sentences;
    if (!all.length) { render(); return; }
    const i = Math.max(0, Math.min(all.length - 1, nextIdx));
    st.segId = all[i].id;
    st.pos = 0;
    hidePanels();
    const box = q('.js-sentbox');
    if (box && !App.reduced) { box.classList.add('swap'); setTimeout(() => box.classList.remove('swap'), 170); }
    render();
    await ensureChapter(all[i]);
    render();
    saveCursor();
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
    st.stopPlay = ChapterAudio.play(st.entry, offsetOf(s), s.durationMs, {
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

  function togglePlay() {
    if (st.playing) { stopPlayback(); setState(seg() && seg().done ? 'done' : 'idle'); }
    else play();
  }

  // ── record (ephemeral, task 5.5) ───────────────────────────────────────
  const meterEl = q('.js-meter');
  for (let i = 0; i < 22; i++) meterEl.appendChild(document.createElement('i'));

  function stopRecording() {
    if (!st.recording) return;
    st.recording = false;
    clearInterval(st.recTimer); clearInterval(st.meterTimer);
    try { st.recorder.stop(); } catch (e) { /* already stopped */ }
    q('.js-recbar').classList.add('hidden');
    qa('.js-rec').forEach((b) => b.classList.remove('armed'));
  }

  async function startRecording() {
    if (st.recording) { stopRecording(); return; }
    const s = seg();
    if (!s) return;
    stopPlayback();
    try {
      if (!st.micStream) st.micStream = await navigator.mediaDevices.getUserMedia({ audio: true });
    } catch (e) { App.toast('Microphone unavailable: ' + e.message, true); return; }

    const chunks = [];
    const mime = pickRecorderMime();
    const rec = new MediaRecorder(st.micStream, mime ? { mimeType: mime } : undefined);
    rec.ondataavailable = (e) => { if (e.data && e.data.size) chunks.push(e.data); };
    rec.onstop = async () => {
      const blob = new Blob(chunks, { type: rec.mimeType || 'audio/webm' });
      const take = { blob, buffer: null };
      takes.set(s.id, take);
      setState('take held in memory — C to compare');
      try {
        const Ctx = window.AudioContext || window.webkitAudioContext;
        const ctx = new Ctx();
        take.buffer = await ctx.decodeAudioData(await blob.arrayBuffer());
        ctx.close();
      } catch (e) { /* playback still works; pitch comparison will not */ }
    };
    rec.start();
    st.recorder = rec;
    st.recording = true;
    st.recStart = performance.now();
    q('.js-recbar').classList.remove('hidden');
    qa('.js-rec').forEach((b) => b.classList.add('armed'));
    setState('recording');

    const rt = q('.js-rectime');
    st.recTimer = setInterval(() => {
      rt.textContent = ((performance.now() - st.recStart) / 1000).toFixed(1) + ' s';
    }, 100);

    // a real input level, read off the live stream
    try {
      const Ctx = window.AudioContext || window.webkitAudioContext;
      const ctx = new Ctx();
      const src = ctx.createMediaStreamSource(st.micStream);
      const an = ctx.createAnalyser();
      an.fftSize = 256;
      src.connect(an);
      const data = new Uint8Array(an.frequencyBinCount);
      const bars = meterEl.children;
      st.meterTimer = setInterval(() => {
        if (!st.recording) { ctx.close().catch(() => {}); clearInterval(st.meterTimer); return; }
        an.getByteFrequencyData(data);
        for (let i = 0; i < bars.length; i++) {
          const v = data[Math.floor((i * data.length) / bars.length)] / 255;
          bars[i].style.height = Math.max(8, v * 100).toFixed(0) + '%';
        }
      }, 80);
    } catch (e) { /* no meter, still recording */ }
  }

  function playTake(take, after) {
    const url = URL.createObjectURL(take.blob);
    const a = new Audio(url);
    a.onended = () => { URL.revokeObjectURL(url); if (after) after(); };
    a.play().catch(() => { URL.revokeObjectURL(url); if (after) after(); });
  }

  // ── compare (task 5.4) ─────────────────────────────────────────────────
  async function compare() {
    const s = seg();
    if (!s) return;
    const take = takes.get(s.id);
    if (!take) { App.toast('Record a take first — R.'); return; }
    stopRecording();
    qa('.js-cmp').forEach((b) => b.classList.add('on'));
    q('.js-cmp-panel').classList.remove('hidden');
    const svgEl = q('.js-contour');
    svgEl.innerHTML = '';

    // the two contours are computed while the two clips play
    const pitchWork = (async () => {
      const refRes = await fetch(Api.segmentAudioUrl(s.id, true));
      if (!refRes.ok) throw new Error('reference audio unavailable');
      const refBlob = await refRes.blob();
      let takeBlob = null;
      if (take.buffer) takeBlob = encodeWavBlob(take.buffer.getChannelData(0), take.buffer.sampleRate);
      const [refPitch, takePitch] = await Promise.all([
        Pitch.analyse(refBlob),
        takeBlob ? Pitch.analyse(takeBlob) : Promise.resolve(null),
      ]);
      return { refPitch, takePitch, takeMs: take.buffer ? take.buffer.duration * 1000 : 0 };
    })();

    play('comparing — reference (book)', () => {
      setTimeout(() => playTake(take, () => setState('compared')), 250);
      setState('comparing — your take');
    });

    try {
      const r = await pitchWork;
      const drew = Pitch.render(svgEl, r.refPitch, s.durationMs, r.takePitch, r.takeMs);
      if (!drew) App.toast('No pitch was detected in either clip.');
    } catch (e) {
      App.toast('Pitch analysis failed: ' + e.message, true);
    }
  }

  // ── transcribe (task 5.6) ──────────────────────────────────────────────
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

  // ── Formant Lab (task 5.7) — the BOOK's audio, never the take ─────────
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

  // ── boundary editing from Study (task 3.4) ────────────────────────────
  async function splitHere() {
    const s = seg();
    if (!s) return;
    const frac = st.pos > 0.02 && st.pos < 0.98 ? st.pos : 0.5;
    const atMs = Math.round(s.startMs + frac * s.durationMs);
    try {
      await Api.splitSegment(s.id, atMs);
      await afterBoundaryChange(s.id);
      App.toast('Split at ' + Math.round(frac * 100) + '% — this config now has ' + App.sentences.length + ' sentences.');
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

  function leaveQuietly() { stopPlayback(); stopRecording(); closeSheet(); }

  function openAt(segId) {
    st.segId = segId;
    App.show('study');
  }

  // ── wiring ─────────────────────────────────────────────────────────────
  function bind(sel, fn) { qa(sel).forEach((b) => b.addEventListener('click', fn)); }

  function init() {
    bind('.js-play', togglePlay);
    bind('.js-rec', startRecording);
    bind('.js-cmp', compare);
    bind('.js-done', () => go(idx() + 1, true));
    bind('.js-prev', () => go(idx() - 1, false));
    bind('.js-next', () => go(idx() + 1, false));
    bind('.js-split', () => { closeSheet(); splitHere(); });
    bind('.js-merge', () => { closeSheet(); mergeNext(); });
    bind('.js-tr', () => { closeSheet(); transcribe(); });
    bind('.js-fl', () => { closeSheet(); formantLab(); });
    bind('.js-jump', () => { closeSheet(); jumpUnfinished(); });
    bind('.js-help', () => { closeSheet(); App.overlay(true); });
    bind('.js-exit', () => App.show('library'));
    bind('.js-close-cmp', () => { q('.js-cmp-panel').classList.add('hidden'); qa('.js-cmp').forEach((b) => b.classList.remove('on')); });
    bind('.js-close-tr', () => { q('.js-tr-panel').classList.add('hidden'); qa('.js-tr').forEach((b) => b.classList.remove('on')); });
    bind('.js-close-fl', () => { q('.js-fl-panel').classList.add('hidden'); qa('.js-fl').forEach((b) => b.classList.remove('on')); });

    bind('.js-more', () => {
      q('.js-sheet').classList.toggle('open');
      q('.js-scrim').classList.toggle('on');
    });
    q('.js-scrim').addEventListener('click', closeSheet);

    // clicking the waveform parks the playhead — that is what X splits at
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
    switch (k) {
      case ' ': ev.preventDefault(); if (st.recording) stopRecording(); else togglePlay(); break;
      case 'r': ev.preventDefault(); startRecording(); break;
      case 'c': compare(); break;
      case 'enter': ev.preventDefault(); go(idx() + 1, true); break;
      case 'arrowleft': ev.preventDefault(); go(idx() - 1, false); break;
      case 'arrowright': ev.preventDefault(); go(idx() + 1, false); break;
      case 'x': splitHere(); break;
      case 'm': mergeNext(); break;
      case 't': transcribe(); break;
      case 'f': formantLab(); break;
      case 'u': jumpUnfinished(); break;
      case 'escape':
        if (q('.js-sheet').classList.contains('open')) { closeSheet(); return; }
        if (!q('.js-cmp-panel').classList.contains('hidden')
            || !q('.js-tr-panel').classList.contains('hidden')
            || !q('.js-fl-panel').classList.contains('hidden')) { stopPlayback(); hidePanels(); return; }
        stopPlayback(); stopRecording(); App.show('library');
        break;
      default: break;                       // there is no `S`: slow playback is gone
    }
  }

  return { init, enter, adopt, leaveQuietly, openAt, key, render };
})();
