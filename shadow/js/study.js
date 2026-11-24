// study.js — the loop: one sentence, four primaries, a tray of the rest.
//
// The centre of this screen is TWO stacked lanes on one time axis (design.md
// §3): the audiobook's sentence above, the learner's take below, identical
// edges so they compare bar for bar. Each pitch contour is drawn inside its
// own lane.
//
// Playback always comes out of the chapter chunk this screen already
// downloaded, and always stops dead at the end of the window it is playing
// rather than running into the next sentence. Every playback here goes
// through the shared `Player` (chapteraudio.js, D4): ▶ restarts, the
// secondary ❚❚ (K) pauses and resumes with the playhead frozen, and starting
// any player stops every other one on the page.
//
// Recording is a MediaRecorder blob held in a Map that dies with the tab:
// there is no endpoint to upload it to. The microphone is acquired when a
// take starts and every track is stopped when it ends, is cancelled, or the
// screen is left (D5) — the browser's mic indicator goes away.
//
// Done-and-next is optimistic (D6): the next sentence is shown and starts
// playing at once, the progress write runs in the background, and a failure
// reverts the sentence to not-done and says so in the page.
//
// Split is reversed (D13): X / "Split…" stops playback and only THEN shows a
// red line to place; nothing is split without Confirm.
//
// AUDIOBOOK MODE (task 8, D10): every study action is dispatched through
// run(name, fn); `setGuard(fn)` installs ONE interceptor that sees the
// action name first and swallows it by returning true — that is how "any
// study action only stops audiobook mode" plugs in (abGuard below). Names:
// play pause rec cmp done prev next tick chprev chnext split merge tr fl
// jump exit contour help wave (a press on the sentence waveform) escape ab
// (L / ▶▶ Listen) ab-stop ab-end-x.
//
// Slow playback (0.7×) and its `S` binding are GONE, deliberately.

const Study = (() => {
  'use strict';

  const root = document.getElementById('s-study');
  const q = (s) => root.querySelector(s);
  const qa = (s) => Array.prototype.slice.call(root.querySelectorAll(s));

  const st = {
    segId: null,
    pos: 0,                 // the ref playhead, 0..1 of the DRAWN window
    takePos: 0,             // the take playhead, seconds into its window
    // the ONE live playback of this screen: a Player handle (ref lane) or
    // the take handle (usr lane); null when idle
    player: null,
    lane: null,             // 'ref' | 'usr'
    auto: false,            // the live playback was started by autoplay
    label: '',
    note: 'idle',           // the state line while nothing plays
    cmpTimer: 0,
    split: null,            // {at: 0..1 of the drawn window} while splitting
    chapterId: null,
    entry: null,
    loading: false,
    recording: false,
    acquiring: false,
    recorder: null,
    micStream: null,        // ONLY while a take records (D5)
    recTimer: 0, meterTimer: 0, recStart: 0,
    liveLevels: null,       // the envelope accumulating while the mic is open
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

  /** The state line's resting text; while something plays, splits or
      records, stateText() says that instead. */
  function setState(txt) { st.note = txt; paintStateLine(); }

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
    // the cached chunk may have been evicted (LRU of 3 — Explore and Prepare
    // load chunks too); an evicted entry has no audio any more
    if (st.chapterId === ch.id && st.entry && !force && ChapterAudio.peek(ch.id) === st.entry) return st.entry;
    st.loading = true;
    setState('fetching this chapter…');
    paintWave();
    try {
      const e = await ChapterAudio.ensure(ch.id, App.userId);
      // a later move to another chapter owns st.entry now
      const cur = seg();
      if (cur && cur.parentId !== ch.id) return st.entry;
      st.entry = e;
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
    q('.js-played').innerHTML = '';
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
    host.innerHTML = Wave.svg(e.peaks, w.from, w.to, 180, null, 'var(--wave)');
    // the same bars in the sentence colour, revealed up to the playhead
    q('.js-played').innerHTML = Wave.svg(e.peaks, w.from, w.to, 180, null, 'var(--ref)');
    setRefHead(st.player && st.lane === 'ref' ? st.pos : 0);
    paintTrimChip(s);
  }

  /** The ref playhead and the played part of the sentence wave, together. */
  function setRefHead(pos) {
    const p = Math.max(0, Math.min(1, pos || 0)) * 100;
    q('.js-playhead').style.left = p.toFixed(2) + '%';
    q('.js-played').style.clipPath = 'inset(0 ' + (100 - p).toFixed(2) + '% 0 0)';
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
      markContour('.js-lane-usr', false);
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
      b.addEventListener('click', run('tick', () => go(App.globalIndexOf(k.id), { autoplay: true })));
      host.appendChild(b);
    });
  }

  function paintProgress() {
    const total = App.sentences.length;
    const doneN = App.sentences.filter((x) => x.done).length;
    const bar = q('#stProg');
    if (bar) bar.style.width = (total ? (100 * doneN) / total : 0).toFixed(1) + '%';
  }

  /** A lane carries .has-contour only while a contour is really drawn over
      it — that is what pushes its waveform back. */
  function markContour(laneSel, on) {
    const el = q(laneSel);
    if (el) el.classList.toggle('has-contour', !!on);
  }
  function clearContours() {
    Pitch.clear(q('.js-contour-ref'));
    Pitch.clear(q('.js-contour-usr'));
    markContour('.lane-ref', false);
    markContour('.js-lane-usr', false);
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
    qa('.js-book').forEach((e) => { e.textContent = book ? (book.title || book.originalFilename || '') : ''; });
    paintContourState();
    paintAuto();
    if (!s) {
      qa('.js-idx').forEach((e) => { e.textContent = '–'; });
      qa('.js-total').forEach((e) => { e.textContent = '–'; });
      qa('.js-chname').forEach((e) => { e.textContent = ''; });
      q('.js-played').innerHTML = '';
      q('.js-wave').innerHTML = Wave.placeholder('this split config has no sentences yet — run an analysis in Prepare');
      q('.js-ticks').innerHTML = '';
      paintTake();
      paintChapterNav();
      paintPlayState();
      paintAB();
      return;
    }
    const gi = idx();
    const total = App.sentences.length;
    const ci = App.chapterIndexOf(s.parentId);
    qa('.js-idx').forEach((e) => { e.textContent = gi + 1; });
    qa('.js-total').forEach((e) => { e.textContent = Fmt.int(total); });
    // "Chapter N · Title" when the chapter has a title (D15, task 9.3)
    qa('.js-chname').forEach((e) => { e.textContent = App.chapterLabel(chapterOf(s), ci); });
    paintProgress();
    qa('.js-dur').forEach((e) => { e.textContent = Fmt.secs(s.durationMs); });
    qa('.js-at').forEach((e) => { e.textContent = Fmt.clock(s.startMs); });
    const txt = q('.js-sent-text');
    txt.textContent = s.text || '';
    paintWave();
    paintTrimChip(s);
    paintTake();
    paintTicks();
    paintChapterNav();
    st.note = s.done ? 'done' : 'idle';
    paintSplit();
    paintPlayState();
    paintAB();
  }

  // ── the play state: pause pill, ↺, playhead caps, the state line ───────
  function stateText() {
    if (ab.running) return ab.gap ? 'audiobook · next sentence…' : 'audiobook · playing';
    if (st.split) return 'splitting — playback stopped';
    if (st.recording) return 'recording';
    const h = st.player;
    if (h && h.paused) {
      const at = st.lane === 'usr' ? st.takePos * 1000 : st.pos * drawnMs();
      return 'paused at ' + Fmt.secs(at) + ' — K resumes, Space restarts';
    }
    if (h && st.auto) return 'autoplay ▸ playing';
    if (h) return st.lane === 'usr' ? 'playing your take' : (st.label || 'playing');
    return st.note;
  }
  function paintStateLine() {
    const t = stateText();
    qa('.js-state').forEach((e) => { e.textContent = t; });
  }
  function drawnMs() {
    const s = seg();
    if (!s) return 0;
    const w = window_(s);
    return Math.max(0, w.to - w.from);
  }

  function paintPlayState() {
    const h = st.player;
    const paused = !!(h && h.paused);
    qa('.js-pause').forEach((b) => {
      b.setAttribute('aria-disabled', h ? 'false' : 'true');
      b.classList.toggle('paused', paused);
      b.querySelector('.pg').textContent = paused ? '▶' : '❚❚';
      b.querySelector('.pl').textContent = paused ? 'resume' : 'pause';
    });
    const restart = !!(h && !paused && st.lane === 'ref' && !st.split);
    qa('.js-play .gl').forEach((g) => { g.textContent = restart ? '↺' : '▶'; });
    const ww = q('.js-wavewrap'), uw = q('.js-userwrap');
    ww.classList.toggle('playing', !!h && st.lane === 'ref' && !paused);
    ww.classList.toggle('paused', !!h && st.lane === 'ref' && paused);
    uw.classList.toggle('playing', !!h && st.lane === 'usr' && !paused);
    uw.classList.toggle('paused', !!h && st.lane === 'usr' && paused);
    qa('.js-rec').forEach((b) => b.classList.toggle('armed', st.recording));
    paintStateLine();
  }

  // ── autoplay (D12) ─────────────────────────────────────────────────────
  function paintAuto() {
    const on = App.autoplay;
    qa('.js-auto').forEach((c) => {
      c.classList.toggle('off', !on);
      c.textContent = on ? '↻ autoplay' : 'autoplay off';
      c.setAttribute('aria-pressed', String(on));
    });
  }
  function flashAuto() {
    qa('.js-auto').forEach((c) => { c.classList.remove('flash'); void c.offsetWidth; c.classList.add('flash'); });
  }
  /** An operator-initiated move landed: play it if the setting says so. */
  function autoplay() {
    if (!App.autoplay || !st.entry || st.split || st.recording) return;
    flashAuto();
    play({ auto: true });
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
    clearTimeout(st.cmpTimer);
    if (st.player) st.player.stop();       // its onEnd clears st.player
    st.player = null; st.lane = null; st.auto = false;
    setRefHead(0);
    q('.js-userplayhead').style.left = '0%';
    paintPlayState();
  }

  function hidePanels() {
    ['.js-tr-panel', '.js-fl-panel'].forEach((sel) => q(sel).classList.add('hidden'));
    qa('.js-cmp, .js-tr, .js-fl').forEach((b) => b.classList.remove('on'));
  }

  /**
   * Move to sentence `nextIdx`. opts.markDone — done-and-next, optimistic
   * (D6); opts.autoplay — an operator-initiated move, which plays the new
   * sentence when the setting is on (D12).
   */
  async function go(nextIdx, opts) {
    const o = opts || {};
    const s = seg();
    if (!s) return;
    const all = App.sentences;
    if (!all.length) { render(); return; }
    if (o.markDone) markDoneOptimistic(s);
    stopPlayback(); stopRecording();
    if (st.split) endSplit();
    const i = Math.max(0, Math.min(all.length - 1, nextIdx));
    if (o.markDone && all[i].id === s.id) {
      // the very last sentence: marked, nowhere further to go
      paintTicks(); paintProgress(); setState('done');
      App.toast('That was the last sentence of this book.');
      return;
    }
    st.gen++;                             // anything in flight is now stale
    const mine = st.gen;
    st.segId = all[i].id;
    st.pos = 0;
    hidePanels();
    clearContours();
    const box = q('.js-sentbox');
    if (box && !App.reduced) { box.classList.add('swap'); setTimeout(() => box.classList.remove('swap'), 170); }
    render();
    await ensureChapter(all[i]);
    if (mine !== st.gen) return;          // moved on while the chapter loaded
    render();
    saveCursor();
    if (o.autoplay) autoplay();
  }

  // ── optimistic done (D6) ───────────────────────────────────────────────
  // The sentence reads done at once; the write runs behind. The newest
  // answer reconciles every sentence from the server's ranges (no book
  // reload), except ones whose own write is still in flight. A failure
  // reverts that one sentence and leaves a persistent in-page error.
  const pendingSaves = new Map();     // segId -> writes in flight
  let saveSeq = 0, appliedSeq = 0;

  function covers(ranges, start, end) {
    if (end <= start) return false;
    let cursor = start;
    for (const r of ranges) {            // normalized: sorted, disjoint
      if (r.startMs > cursor) return false;
      if (r.endMs > cursor) cursor = r.endMs;
      if (cursor >= end) return true;
    }
    return false;
  }
  function byId(id) { return App.sentences.find((x) => x.id === id) || null; }
  function settle(id) {
    const n = (pendingSaves.get(id) || 1) - 1;
    if (n > 0) pendingSaves.set(id, n); else pendingSaves.delete(id);
  }
  function repaintDoneness() {
    if (App.state.screen !== 'study') return;
    paintTicks();
    paintProgress();
    const s = seg();
    if (s && !st.player && !st.recording && !st.split && (st.note === 'idle' || st.note === 'done')) {
      setState(s.done ? 'done' : 'idle');
    }
  }

  function markDoneOptimistic(s) {
    const id = s.id, was = !!s.done;
    const bookId = App.book.id;
    const bookName = App.book.title || App.book.originalFilename || '(unnamed)';
    const n = App.globalIndexOf(id) + 1;
    s.done = true;
    pendingSaves.set(id, (pendingSaves.get(id) || 0) + 1);
    const seq = ++saveSeq;
    // The FULL stored span, always: trimming is a playback attribute and
    // must never reach progress.
    Api.postProgress(bookId, { doneSegmentIds: [id] }).then((res) => {
      settle(id);
      if (!App.book || App.book.id !== bookId) return;
      const mineNow = byId(id);
      if (mineNow) mineNow.done = true;
      if (res && Array.isArray(res.ranges) && seq > appliedSeq) {
        appliedSeq = seq;
        App.sentences.forEach((x) => {
          if (x.id === id || pendingSaves.has(x.id)) return;
          x.done = covers(res.ranges, x.startMs, x.endMs);
        });
        App.book.progressRanges = res.ranges;
      }
      if (res && typeof res.doneCount === 'number') App.book.doneCount = res.doneCount;
      repaintDoneness();
    }).catch((e) => {
      settle(id);
      if (!App.book || App.book.id !== bookId) {
        // another book is open now: nothing here to revert, but the loss
        // must still be said, naming the book it belongs to (D6)
        const msg = `Not saved — sentence ${n} of “${bookName}” is still NOT done (${e.message || e}). `
          + 'Open that book and press ↵ on it again.';
        q('.js-save-error-text').textContent = msg;
        q('.js-save-error').classList.remove('hidden');
        App.toast(msg, true);
        return;
      }
      const x = byId(id);
      if (x) x.done = was;
      showSaveError(x || s, e);
      repaintDoneness();
    });
  }

  function showSaveError(s, e) {
    const n = App.globalIndexOf(s.id) + 1;
    q('.js-save-error-text').textContent =
      `Not saved — sentence ${n} is still NOT done (${e.message || e}). `
      + 'Go back to it and press ↵ again.';
    q('.js-save-error').classList.remove('hidden');
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
    ab.resumeId = null;                   // a chapter step clears the resume offer (D10)
    ab.endCh = null;
    go(App.globalIndexOf(kids[0].id), { autoplay: true });
  }

  let cursorTimer = 0;
  function saveCursor() {
    const s = seg();
    if (!s || !App.book) return;
    clearTimeout(cursorTimer);
    cursorTimer = setTimeout(() => {
      Api.putCursor(App.book.id, { positionMs: s.startMs })
        .catch(() => { /* the cursor is a convenience, not a transaction */ });
    }, 250);
  }

  // ── play ───────────────────────────────────────────────────────────────
  /**
   * Play the sentence lane through the shared Player. opts: label, auto
   * (autoplay), fromF/toF (fractions of the drawn window — hear left /
   * right), after (on a natural end).
   */
  function play(opts) {
    const o = opts || {};
    const s = seg();
    if (!s) return;
    if (!st.entry) {
      App.toast(App.book && App.book.audioState === 'ready'
        ? 'This chapter’s audio has not loaded yet.'
        : 'This book has no stored audio.');
      return;
    }
    if (st.recording) stopRecording();
    stopPlayback();
    const w = window_(s);
    const span = Math.max(1, w.to - w.from);
    const fromF = o.fromF || 0, toF = o.toF == null ? 1 : o.toF;
    let h = null;
    h = Player.chapter(st.entry, w.from + fromF * span, w.from + toF * span, {
      owner: 'study',
      onFrame: (f, ms) => {
        if (st.player !== h) return;
        st.pos = Math.max(0, Math.min(1, (ms - w.from) / span));
        setRefHead(st.pos);
      },
      onState: () => { if (st.player === h) paintPlayState(); },
      onEnd: (reason) => {
        if (st.player !== h) return;
        st.player = null; st.lane = null; st.auto = false;
        paintPlayState();
        if (reason === 'end' && o.after) o.after();
      },
      onError: (e) => App.toast('Playback failed: ' + (e.message || e), true),
    });
    st.player = h; st.lane = 'ref'; st.auto = !!o.auto; st.label = o.label || '';
    st.pos = fromF;
    setRefHead(fromF);
    paintPlayState();
  }

  // Play RESTARTS the sentence from its beginning whether it is playing or
  // paused (D4); pausing is the secondary control, K.
  function togglePlay() { play(); }

  function togglePause() {
    if (!st.player) { App.toast('Nothing is playing — K pauses a sentence mid-way.'); return; }
    if (st.player.togglePause) st.player.togglePause();
    paintPlayState();
  }

  // ── record (ephemeral) ─────────────────────────────────────────────────
  // The live waveform IS the take lane, in exactly the box the finished take
  // will occupy, so nothing below it moves when recording starts or stops
  // (tasks 3.2 / 3.3). The microphone is held ONLY while a take records
  // (D5): acquired here per take, every track stopped when it ends.
  function releaseStream(stream) {
    if (!stream) return;
    stream.getTracks().forEach((t) => { try { t.stop(); } catch (e) { /* already ended */ } });
    if (st.micStream === stream) st.micStream = null;
  }

  function stopRecording() {
    if (!st.recording) return;
    st.recording = false;
    clearInterval(st.recTimer); clearInterval(st.meterTimer);
    const stream = st.micStream;
    try { st.recorder.stop(); } catch (e) { /* already stopped */ }
    // onstop releases the tracks once the last chunk is flushed; this is the
    // backstop in case it never fires — the mic indicator must go within 1 s.
    setTimeout(() => releaseStream(stream), 600);
    q('.js-lane-usr').classList.remove('recording');
    paintPlayState();
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
    if (st.acquiring) return;
    const s = seg();
    if (!s) return;
    stopPlayback();
    const mine = st.gen;
    let stream = null;
    st.acquiring = true;
    try {
      stream = await navigator.mediaDevices.getUserMedia({ audio: true });
    } catch (e) { App.toast('Microphone unavailable: ' + e.message, true); return; }
    finally { st.acquiring = false; }
    // moved or left while the permission/device came up: give it straight back
    if (mine !== st.gen || App.state.screen !== 'study' || st.split) { releaseStream(stream); return; }
    st.micStream = stream;

    const chunks = [];
    const mime = pickRecorderMime();
    const rec = new MediaRecorder(stream, mime ? { mimeType: mime } : undefined);
    rec.ondataavailable = (e) => { if (e.data && e.data.size) chunks.push(e.data); };
    rec.onstop = async () => {
      releaseStream(stream);
      const blob = new Blob(chunks, { type: rec.mimeType || 'audio/webm' });
      const take = { blob, buffer: null, peaks: null, trim: null };
      takes.set(s.id, take);
      // Guarded like paintTake() below: stopping a recording by navigating
      // away fires onstop AFTER st.gen moved on, and an unguarded setState
      // labelled the NEXT sentence with this take's status (confirmed
      // defect, 2026-11-17). The take itself is still kept — it is stored
      // under ITS OWN sentence id and is found again on the way back.
      if (mine === st.gen) setState('take held in memory — C to compare');
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
    markContour('.js-lane-usr', false);
    paintPlayState();

    const rt = q('.js-rectime');
    st.recTimer = setInterval(() => {
      rt.textContent = ((performance.now() - st.recStart) / 1000).toFixed(1) + ' s';
    }, 100);

    // a real input level, read off the live stream, drawn as the take lane
    try {
      const Ctx = window.AudioContext || window.webkitAudioContext;
      const ctx = new Ctx();
      const src = ctx.createMediaStreamSource(stream);
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
  // A handle on the shared Player too: it stops any other player, and K
  // pauses it (the AudioContext is suspended, so its clock — and the
  // playhead — freeze).
  let takeCtx = null;
  function playTake(take, after) {
    if (st.recording) stopRecording();
    stopPlayback();
    let done = false;
    const h = { owner: 'study-take', paused: false };
    const ph = q('.js-userplayhead');
    const end = (natural, cleanup) => {
      if (done) return;
      done = true;
      cleanup();
      ph.style.left = '0%';
      Player.release(h);
      if (st.player === h) { st.player = null; st.lane = null; }
      paintPlayState();
      if (natural && after) after();
    };

    if (!take.buffer) {                       // decode failed: play it whole
      const url = URL.createObjectURL(take.blob);
      const a = new Audio(url);
      const cleanup = () => { a.pause(); URL.revokeObjectURL(url); };
      h.stop = () => end(false, cleanup);
      h.pause = () => { if (done || h.paused) return; h.paused = true; a.pause(); paintPlayState(); };
      h.resume = () => { if (done || !h.paused) return; h.paused = false; a.play().catch(() => {}); paintPlayState(); };
      h.togglePause = () => (h.paused ? h.resume() : h.pause());
      a.onended = () => end(true, cleanup);
      Player.claim(h);
      st.player = h; st.lane = 'usr'; st.auto = false;
      a.play().catch(() => end(true, cleanup));
      paintPlayState();
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
    const t0 = takeCtx.currentTime;
    let raf = 0;
    const cleanup = () => {
      cancelAnimationFrame(raf);
      if (h.paused) { h.paused = false; takeCtx.resume().catch(() => {}); }
      try { src.stop(); } catch (e) { /* already stopped */ }
    };
    const tick = () => {
      if (done || h.paused) return;
      const el = Math.max(0, Math.min(dur, takeCtx.currentTime - t0));
      st.takePos = el;
      ph.style.left = ((el / dur) * 100).toFixed(2) + '%';
      raf = requestAnimationFrame(tick);
    };
    h.stop = () => end(false, cleanup);
    h.pause = () => {
      if (done || h.paused) return;
      h.paused = true; cancelAnimationFrame(raf);
      takeCtx.suspend().catch(() => {});
      paintPlayState();
    };
    h.resume = () => {
      if (done || !h.paused) return;
      h.paused = false;
      takeCtx.resume().catch(() => {});
      raf = requestAnimationFrame(tick);
      paintPlayState();
    };
    h.togglePause = () => (h.paused ? h.resume() : h.pause());
    src.onended = () => { if (!h.paused) end(true, cleanup); };
    Player.claim(h);
    st.player = h; st.lane = 'usr'; st.auto = false; st.takePos = 0;
    src.start(0, offset, dur);
    raf = requestAnimationFrame(tick);
    paintPlayState();
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
    clearContours();

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

    play({
      label: 'comparing — reference (book)',
      after: () => {
        st.cmpTimer = setTimeout(() => {
          if (mine !== st.gen) return;
          playTake(take, () => setState('compared'));
        }, 250);
      },
    });

    try {
      const r = await pitchWork;
      // Task 3.6 — a late result must never paint onto a sentence already
      // left. Both the generation and the identity have to still match.
      if (mine !== st.gen || mineId !== st.segId) return;
      // the CONTOUR hues, deliberately not the lane waveform hues
      const a = Pitch.renderOne(refSvg, r.refPitch, refMs, 'var(--ref-contour)', false);
      const b = Pitch.renderOne(usrSvg, r.takePitch, takeMs, 'var(--usr-contour)', true);
      markContour('.lane-ref', a);
      markContour('.js-lane-usr', b);
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
      const all = await Api.getSettings();
      const stored = all.transcribeBackend || {};
      providerCache = (typeof stored.provider === 'string' && stored.provider) || 'hf_whisper';
    } catch (e) { providerCache = 'hf_whisper'; }
    return providerCache;
  }

  /** Settings changed the provider: the next transcription re-reads it. */
  function forgetProvider() { providerCache = null; }

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

  // ── split, reversed (D13) ─────────────────────────────────────────────
  // X / "Split…" stops playback and only then shows the red line — at the
  // playing or paused position when that is inside the sentence, else the
  // middle. The line is a fraction of the DRAWN window (maybe trimmed), so it
  // is resolved back to an absolute millisecond through that window and then
  // clamped inside the STORED span: a boundary is a stored thing and
  // trimming never moves one.
  function msAt(s, frac) {
    const w = window_(s);
    const ch = chapterOf(s);
    const base = ch ? ch.startMs : 0;
    const at = base + w.from + frac * (w.to - w.from);
    return Math.round(Math.max(s.startMs + 1, Math.min(s.endMs - 1, at)));
  }

  function enterSplit() {
    const s = seg();
    if (!s || st.split) return;
    if (st.recording) stopRecording();
    let at = 0.5;
    if (st.player && st.lane === 'ref' && st.pos > 0.04 && st.pos < 0.96) at = st.pos;
    stopPlayback();
    closeSheet();
    st.split = { at };
    paintSplit();
    paintPlayState();
  }

  function paintSplit() {
    root.classList.toggle('splitting', !!st.split);
    const s = seg();
    if (!st.split || !s) return;
    const at = st.split.at;
    q('.js-split-line').style.left = (at * 100).toFixed(2) + '%';
    q('.js-split-shade').style.left = (at * 100).toFixed(2) + '%';
    q('.js-split-a').style.left = 'calc(' + (at * 50).toFixed(2) + '% - 4px)';
    q('.js-split-b').style.left = 'calc(' + (50 + at * 50).toFixed(2) + '% - 4px)';
    const d = drawnMs();
    q('.js-split-n').textContent = idx() + 1;
    q('.js-split-t').textContent = Fmt.secs(at * d);
    q('.js-split-d').textContent = Fmt.secs(d);
  }

  function endSplit() { st.split = null; paintSplit(); }

  function cancelSplit() {
    if (!st.split) return;
    stopPlayback();
    endSplit();
    paintPlayState();
  }

  function nudge(d) {
    if (!st.split) return;
    st.split.at = Math.max(0.03, Math.min(0.97, st.split.at + d));
    paintSplit();
  }

  function hear(side) {
    if (!st.split) return;
    const at = st.split.at;
    if (side === 'l') play({ fromF: 0, toF: at });
    else play({ fromF: at, toF: 1 });
  }

  async function confirmSplit() {
    const s = seg();
    if (!s || !st.split) return;
    const at = st.split.at;
    const atMs = msAt(s, at);
    const t = Fmt.secs(at * drawnMs());
    const n = idx() + 1;
    stopPlayback();
    endSplit();
    paintPlayState();
    try {
      await Api.splitSegment(s.id, atMs);
      await afterBoundaryChange(s.id);
      const inCh = App.sentencesOf(s.parentId).length;
      App.toast(`Split sentence ${n} at ${t} → ${n} + ${n + 1}. Chapter now has ${inCh}.`);
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
    go(i, { autoplay: true });
  }

  // ── the ⋯ sheet (phone) ────────────────────────────────────────────────
  function closeSheet() {
    q('.js-sheet').classList.remove('open');
    q('.js-scrim').classList.remove('on');
  }

  // ── the phone's hidden navigation (D14) ────────────────────────────────
  // Revealed by tapping the grabber or pulling it down; hidden again after
  // about 3 s or on the NEXT action — every dispatched action calls
  // revealNav(false), and so does a press anywhere outside the nav.
  const NAV_HIDE_MS = 3000;
  let navTimer = 0;
  function revealNav(on) {
    const want = !!on;
    clearTimeout(navTimer);
    if (want) navTimer = setTimeout(() => revealNav(false), NAV_HIDE_MS);
    if (document.body.classList.contains('nav-open') === want) return;
    document.body.classList.toggle('nav-open', want);
    if (want) document.addEventListener('pointerdown', outsidePress, true);
    else document.removeEventListener('pointerdown', outsidePress, true);
  }
  function outsidePress(e) {
    if (e.target.closest && (e.target.closest('.nav') || e.target.closest('.js-pull'))) return;
    revealNav(false);
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

  let autoplayOnEnter = false;

  /** Called when the Study screen is shown. */
  async function enter() {
    const auto = autoplayOnEnter;
    autoplayOnEnter = false;
    adopt();
    render();
    const s = seg();
    if (!s) return;
    const mine = ++st.gen;
    await ensureChapter(s);
    if (mine !== st.gen) return;
    render();
    saveCursor();
    if (auto) autoplay();
  }

  /** Leaving Study: nothing keeps playing, recording or holding the mic. */
  function leaveQuietly() {
    stopAB(false);
    ab.endCh = null;
    stopPlayback();
    stopRecording();
    releaseStream(st.micStream);
    if (st.split) endSplit();
    st.gen++;
    closeSheet();
    revealNav(false);
  }

  /** Explore opens a sentence here — an operator-initiated move (D12). */
  function openAt(segId) {
    st.segId = segId;
    autoplayOnEnter = true;
    App.show('study');
  }

  // ── audiobook mode (D10, task 8) ───────────────────────────────────────
  // ▶▶ Listen (L) reads the CURRENT chapter from the CURRENT sentence on.
  //
  //   untrimmed ("Trim in audiobook mode" off, the default): ONE continuous
  //     Player range from the sentence's stored start to the end of the
  //     chapter's last sentence — the recording's own pauses, no added gap.
  //     The UI follows the element's real position: onFrame fires per
  //     animation frame while the tab is visible (well inside A10.4's 300 ms)
  //     and on timeupdate (~4/s) when it is not; each boundary crossing moves
  //     the shown sentence, counter, waveform, ticks and playhead and saves
  //     the cursor.
  //   trimmed: each sentence's speech window, back to back — the next one is
  //     started from the previous one's natural end.
  //
  // It never marks anything done and never autoplays (no go() is involved).
  // Any study action, Space, Esc, or a press on the waveform only STOPS it
  // (abGuard), landing on the sentence being heard; the button then offers
  // "Resume from N+1". It stops at the end of the chapter and offers the
  // next one, never playing into it. A screen wake lock is held while it
  // runs; without the API it says so in the banner and runs anyway (D16).
  const ab = {
    running: false,
    starting: false,     // startAB is awaiting the chapter chunk
    run: 0,              // bumped per start/stop: stale handles and wake locks check it
    trimmed: false,      // the tempo of THIS run, read from the setting at start
    list: [],            // the chapter's sentences
    offs: [], ends: [],  // their stored spans, chunk-relative ms
    i: 0,                // the sentence being heard
    gap: false,          // between two sentences (natural tempo)
    resumeId: null,      // after a stop: the sentence Resume starts at
    endCh: null,         // after the chapter ran out: its index, for the bar
    wake: null, wakeOk: true,
    stoppedAt: 0,
  };

  function paintAB() {
    root.classList.toggle('ab-on', ab.running);
    root.classList.toggle('ab-end', !ab.running && ab.endCh != null);
    const banner = q('.js-ab-banner');
    if (banner) banner.classList.toggle('ab-gap', ab.running && ab.gap);
    // the resume offer only makes sense inside the chapter it was made in
    const s = seg();
    const r = ab.resumeId ? byId(ab.resumeId) : null;
    if (!r || !s || r.parentId !== s.parentId) ab.resumeId = null;
    const n = ab.resumeId ? App.globalIndexOf(ab.resumeId) + 1 : 0;
    qa('.js-ab').forEach((b) => {
      const phone = b.dataset.form === 'phone';
      b.classList.toggle('resume', !!n);
      b.innerHTML = '<span class="gl">▶▶</span>'
        + (n ? (phone ? 'Resume · ' + n : 'Resume from ' + n) : 'Listen')
        + (phone ? '' : '<span class="kbd">L</span>');
      b.title = n ? 'continue reading from sentence ' + n + ' (L)' : 'read this chapter aloud, sentence after sentence (L)';
      b.setAttribute('aria-label', n ? 'resume reading from sentence ' + n : 'listen: read this chapter aloud');
    });
    const trimmed = ab.running ? ab.trimmed : App.abTrim;
    const tempo = trimmed ? 'trimmed' : 'natural tempo (untrimmed)';
    qa('.js-tempo, .js-tempo-short').forEach((e) => { e.textContent = tempo; });
    qa('.js-wake').forEach((e) => {
      e.classList.toggle('off', !ab.wakeOk);
      e.textContent = ab.wakeOk ? '☼ screen stays on' : '☼ no wake lock — the screen may dim';
    });
    if (ab.endCh != null) {
      const ch = App.chapters[ab.endCh];
      qa('.js-chname-end').forEach((e) => { e.textContent = App.chapterLabel(ch, ab.endCh).replace(/^Chapter/, 'chapter'); });
      qa('.js-ab-endnext').forEach((b) => { b.disabled = ab.endCh >= App.chapters.length - 1; });
    }
  }

  // ── the screen wake lock ──
  async function wakeOn() {
    if (!navigator.wakeLock || !navigator.wakeLock.request) { ab.wakeOk = false; paintAB(); return; }
    const run = ab.run;
    try {
      const lock = await navigator.wakeLock.request('screen');
      // the run that asked is gone, or another request already holds one
      if (!ab.running || run !== ab.run || ab.wake) { lock.release().catch(() => {}); return; }
      ab.wake = lock;
      ab.wakeOk = true;
      lock.addEventListener('release', () => { if (ab.wake === lock) ab.wake = null; });
    } catch (e) { ab.wakeOk = false; }
    paintAB();
  }
  function wakeOff() {
    const w = ab.wake;
    ab.wake = null;
    if (w) w.release().catch(() => {});
  }
  // the browser drops the lock whenever the page is hidden; take it back
  document.addEventListener('visibilitychange', () => {
    if (document.visibilityState === 'visible' && ab.running && !ab.wake) wakeOn();
  });

  /** Show sentence k of the run without touching playback. */
  function abShow(k) {
    ab.i = k;
    ab.gap = false;
    st.segId = ab.list[k].id;
    st.gen++;                              // stale any analysis of the last one
    st.pos = 0;
    hidePanels();
    clearContours();
    render();
    saveCursor();
  }

  function abPlayhead(chunkMs) {
    const s = seg();
    if (!s) return;
    const w = window_(s);
    st.pos = Math.max(0, Math.min(1, (chunkMs - w.from) / Math.max(1, w.to - w.from)));
    setRefHead(st.pos);
  }

  function abHandlers(onEndNatural) {
    let h = null;
    const run = ab.run;
    const handlers = {
      owner: 'audiobook',
      onState: () => { if (st.player === h) paintPlayState(); },
      onError: (e) => App.toast('Playback failed: ' + (e.message || e), true),
      onEnd: (reason) => {
        if (st.player !== h || run !== ab.run) return;   // a stale run's handle
        st.player = null; st.lane = null;
        if (!ab.running) { paintPlayState(); return; }
        if (reason === 'end') { onEndNatural(); return; }
        stopAB(false);                     // stopped from elsewhere, or failed
      },
    };
    return { handlers, bindHandle(x) { h = x; } };
  }

  function abStartHandle(hd) {
    st.player = hd; st.lane = 'ref'; st.auto = false; st.label = '';
    paintPlayState();
  }

  function abContinuous() {
    const entry = st.entry;
    const from = ab.offs[ab.i];
    const to = ab.ends[ab.list.length - 1];
    const x = abHandlers(abEnd);
    x.handlers.onFrame = (f, ms) => {
      if (!ab.running || st.player !== hd) return;
      let k = ab.i;
      while (k + 1 < ab.list.length && ab.offs[k + 1] <= ms) k++;
      if (k !== ab.i) abShow(k);
      const gap = ms >= ab.ends[ab.i] && ab.i + 1 < ab.list.length;
      if (gap !== ab.gap) { ab.gap = gap; paintAB(); paintStateLine(); }
      abPlayhead(ms);
    };
    const hd = Player.chapter(entry, from, to, x.handlers);
    x.bindHandle(hd);
    abStartHandle(hd);
  }

  function abTrimmedFrom(k) {
    const s = ab.list[k];
    const w = spanOf(s, true);
    const x = abHandlers(() => {
      if (k + 1 < ab.list.length) { abShow(k + 1); abTrimmedFrom(k + 1); } else abEnd();
    });
    x.handlers.onFrame = (f, ms) => { if (ab.running && st.player === hd) abPlayhead(ms); };
    const hd = Player.chapter(st.entry, w.from, w.to, x.handlers);
    x.bindHandle(hd);
    abStartHandle(hd);
  }

  async function startAB(fromId) {
    if (ab.running || ab.starting) return;   // a second L / Listen while loading
    const target = byId(fromId) || seg();
    if (!target) return;
    ab.starting = true;
    try { await startABLoaded(target); } finally { ab.starting = false; }
  }

  async function startABLoaded(target) {
    if (st.recording) stopRecording();
    stopPlayback();
    closeSheet();
    ab.endCh = null;
    ab.resumeId = null;
    if (target.id !== st.segId) {          // Resume: move there, no autoplay
      st.segId = target.id;
      st.gen++;
      st.pos = 0;
      hidePanels();
      clearContours();
      render();
    }
    const mine = st.gen;
    await ensureChapter(target);
    if (mine !== st.gen || st.segId !== target.id || App.state.screen !== 'study') return;
    if (!st.entry) {
      App.toast(App.book && App.book.audioState === 'ready'
        ? 'This chapter’s audio has not loaded yet.' : 'This book has no stored audio.');
      return;
    }
    const ch = chapterOf(target);
    ab.list = App.sentencesOf(target.parentId);
    ab.i = Math.max(0, ab.list.findIndex((x) => x.id === target.id));
    ab.offs = ab.list.map((x) => Player.offsetOf(st.entry, ch, x));
    ab.ends = ab.list.map((x, k) => ab.offs[k] + x.durationMs);
    ab.trimmed = !!App.abTrim;
    ab.gap = false;
    ab.run++;
    ab.running = true;
    hidePanels();
    paintAB();
    saveCursor();
    wakeOn();
    if (ab.trimmed) abTrimmedFrom(ab.i); else abContinuous();
  }

  /** Stop on the sentence being heard; offer to resume from the next one. */
  function stopAB(announce) {
    if (!ab.running) return;
    ab.running = false;
    ab.run++;
    ab.gap = false;
    ab.stoppedAt = Date.now();
    wakeOff();
    stopPlayback();
    const s = seg();
    const kids = s ? App.sentencesOf(s.parentId) : [];
    const k = s ? kids.findIndex((x) => x.id === s.id) : -1;
    ab.resumeId = k >= 0 && k + 1 < kids.length ? kids[k + 1].id : null;
    setState(s && s.done ? 'done' : 'idle');
    paintAB();
    if (announce !== false && s) {
      const n = App.globalIndexOf(s.id) + 1;
      App.toast('Audiobook stopped — studying sentence ' + n + '.'
        + (ab.resumeId ? ' ▶▶ Resume continues from ' + (n + 1) + '.' : ''));
    }
  }

  /** The chapter ran out: stop, say so, offer the next — never play it. */
  function abEnd() {
    // the last crossing can fall between two frames of a short tail
    if (ab.list.length && ab.i !== ab.list.length - 1) abShow(ab.list.length - 1);
    ab.running = false;
    ab.run++;
    ab.gap = false;
    wakeOff();
    if (st.player) stopPlayback();
    ab.resumeId = null;
    const s = seg();
    ab.endCh = s ? App.chapterIndexOf(s.parentId) : null;
    setRefHead(0);
    setState(s && s.done ? 'done' : 'idle');
    paintPlayState();
    paintAB();
  }

  function toggleAB() {
    if (ab.running) { stopAB(); return; }
    startAB(ab.resumeId || st.segId);
  }

  // What does NOT stop it: the ab controls themselves, and preferences that
  // are not study actions (contours, the shortcut sheet, the autoplay chip,
  // closing a panel).
  const AB_PASS = new Set(['ab', 'ab-stop', 'ab-end-x', 'contour', 'help', 'autoplay-setting', 'panel']);
  function abGuard(name, e) {
    if (!ab.running) {
      // any action dismisses the end-of-chapter bar (its own ✕ included)
      if (ab.endCh != null && name !== 'ab-end-x') { ab.endCh = null; paintAB(); }
      return false;
    }
    if (AB_PASS.has(name)) return false;
    if (e && e.preventDefault && name === 'wave') e.preventDefault();
    closeSheet();
    stopAB();
    return true;                           // the press only stops
  }

  // ── action dispatch ────────────────────────────────────────────────────
  // Every study action goes through run(): it hides the phone's pulled
  // nav (the "next action"), consults the guard (audiobook mode, task 8),
  // and keeps the primary and tray controls inert while splitting (D13).
  let guard = null;
  function setGuard(fn) { guard = typeof fn === 'function' ? fn : null; }
  const INERT_WHILE_SPLITTING = new Set([
    'play', 'pause', 'rec', 'cmp', 'done', 'prev', 'next', 'split', 'merge', 'tr', 'fl', 'jump', 'ab',
  ]);
  const ENDS_SPLIT = new Set(['tick', 'chprev', 'chnext', 'exit']);
  function run(name, fn) {
    return (e) => {
      revealNav(false);
      if (guard && guard(name, e) === true) return;
      if (st.split) {
        if (INERT_WHILE_SPLITTING.has(name)) return;
        if (ENDS_SPLIT.has(name)) cancelSplit();
      }
      fn(e);
    };
  }
  function bind(sel, name, fn) {
    qa(sel).forEach((b) => b.addEventListener('click', run(name, fn)));
  }

  const doneNext = () => go(idx() + 1, { markDone: true, autoplay: true });
  const prev = () => go(idx() - 1, { autoplay: true });
  const next = () => go(idx() + 1, { autoplay: true });
  const exit = () => { closeSheet(); App.show('library'); };

  function init() {
    bind('.js-play', 'play', togglePlay);
    bind('.js-pause', 'pause', () => { if (st.player) togglePause(); });
    bind('.js-rec', 'rec', startRecording);
    bind('.js-cmp', 'cmp', compare);
    bind('.js-done', 'done', doneNext);
    bind('.js-prev', 'prev', () => { closeSheet(); prev(); });
    bind('.js-next', 'next', next);
    bind('.js-chprev', 'chprev', () => stepChapter(-1));
    bind('.js-chnext', 'chnext', () => stepChapter(1));
    bind('.js-contour-toggle', 'contour', () => App.setContours(!App.contours));
    bind('.js-split', 'split', () => { closeSheet(); enterSplit(); });
    bind('.js-merge', 'merge', () => { closeSheet(); mergeNext(); });
    bind('.js-tr', 'tr', () => { closeSheet(); transcribe(); });
    bind('.js-fl', 'fl', () => { closeSheet(); formantLab(); });
    bind('.js-jump', 'jump', () => { closeSheet(); jumpUnfinished(); });
    bind('.js-help', 'help', () => { closeSheet(); App.overlay(true); });
    bind('.js-exit', 'exit', exit);
    bind('.js-close-tr', 'panel', () => { q('.js-tr-panel').classList.add('hidden'); qa('.js-tr').forEach((b) => b.classList.remove('on')); });
    bind('.js-close-fl', 'panel', () => { q('.js-fl-panel').classList.add('hidden'); qa('.js-fl').forEach((b) => b.classList.remove('on')); });
    // the split bar's own controls are the ones that work while splitting
    bind('.js-hear-l', 'hear', () => hear('l'));
    bind('.js-hear-r', 'hear', () => hear('r'));
    bind('.js-split-cancel', 'split-cancel', cancelSplit);
    bind('.js-split-ok', 'split-ok', confirmSplit);
    // the chip flips the "Play sentence when opened" setting right here
    bind('.js-auto', 'autoplay-setting', () => {
      App.setAutoplay(!App.autoplay).catch(() => { /* App toasted it */ });
      paintAuto();
      App.toast('Play sentence when opened: ' + (App.autoplay ? 'on' : 'off') + ' (a Settings preference)');
    });
    q('.js-save-error-x').addEventListener('click', () => q('.js-save-error').classList.add('hidden'));
    // audiobook mode (D10)
    setGuard(abGuard);
    bind('.js-ab', 'ab', toggleAB);
    bind('.js-ab-stop', 'ab-stop', () => stopAB());
    bind('.js-ab-endnext', 'chnext', () => stepChapter(1));
    bind('.js-ab-endx', 'ab-end-x', () => { ab.endCh = null; paintAB(); });

    qa('.js-more').forEach((b) => b.addEventListener('click', () => {
      revealNav(false);
      q('.js-sheet').classList.toggle('open');
      q('.js-scrim').classList.toggle('on');
    }));
    q('.js-scrim').addEventListener('click', closeSheet);

    // The grabber: a short downward drag, or a plain tap, reveals the nav.
    //
    // The move and the release are tracked on the WINDOW, not on the tab. A
    // pull of the 16 px this gesture asks for leaves the grabber almost
    // immediately — a finger does, and so does an automated drag — and a
    // listener bound to the grabber alone stops hearing the gesture it is
    // supposed to recognise.
    const pull = q('.js-pull');
    if (pull) {
      let py = null;
      const onMove = (e) => {
        if (py === null) return;
        if (e.clientY - py > 16) { revealNav(true); endGesture(); }
      };
      const onUp = () => {
        // a tap with no travel toggles, so the grabber works for a thumb
        // that does not drag and for the keyboard
        if (py !== null) revealNav(!document.body.classList.contains('nav-open'));
        endGesture();
      };
      function endGesture() {
        py = null;
        window.removeEventListener('pointermove', onMove, true);
        window.removeEventListener('pointerup', onUp, true);
        window.removeEventListener('pointercancel', endGesture, true);
      }
      pull.addEventListener('pointerdown', (e) => {
        py = e.clientY;
        window.addEventListener('pointermove', onMove, true);
        window.addEventListener('pointerup', onUp, true);
        window.addEventListener('pointercancel', endGesture, true);
      });
      // keyboard activation (Enter/Space) reports no pointer at all
      pull.addEventListener('click', (e) => {
        if (e.detail === 0) revealNav(!document.body.classList.contains('nav-open'));
      });
    }

    // The sentence waveform: a press goes to the guard first ('wave' — the
    // audiobook stop path); while splitting it places and drags the line.
    // Outside split editing a press does nothing: there is no split line
    // before Split is pressed (D13).
    const ww = q('.js-wavewrap');
    const placeFrom = (ev) => {
      const r = ww.getBoundingClientRect();
      if (!st.split || !r.width) return;
      st.split.at = Math.max(0.03, Math.min(0.97, (ev.clientX - r.left) / r.width));
      paintSplit();
    };
    ww.addEventListener('pointerdown', (e) => {
      if (guard && guard('wave', e) === true) return;
      if (!st.split) return;
      e.preventDefault();
      stopPlayback();
      try { ww.setPointerCapture(e.pointerId); } catch (err) { /* synthetic */ }
      placeFrom(e);
      const mv = (ev) => placeFrom(ev);
      const up = () => {
        ww.removeEventListener('pointermove', mv);
        ww.removeEventListener('pointerup', up);
        ww.removeEventListener('pointercancel', up);
      };
      ww.addEventListener('pointermove', mv);
      ww.addEventListener('pointerup', up);
      ww.addEventListener('pointercancel', up);
    });
    // phone: swipe the waveform for prev / next (not while splitting)
    let sx = null;
    // (not right after the same touch stopped audiobook mode, either)
    ww.addEventListener('touchstart', (e) => {
      sx = (st.split || ab.running || Date.now() - ab.stoppedAt < 500) ? null : e.touches[0].clientX;
    }, { passive: true });
    ww.addEventListener('touchend', (e) => {
      if (sx === null || st.split) { sx = null; return; }
      const dx = e.changedTouches[0].clientX - sx;
      sx = null;
      if (Math.abs(dx) > 48) run(dx < 0 ? 'next' : 'prev', dx < 0 ? next : prev)();
    }, { passive: true });

    paintAuto();
    paintPlayState();
    paintAB();
  }

  function key(k, ev) {
    // While splitting only the split keys work; everything else is inert.
    if (st.split) {
      if (k === 'escape') { ev.preventDefault(); cancelSplit(); return; }
      if (k === 'enter') { ev.preventDefault(); confirmSplit(); return; }
      if (k === 'arrowleft' || k === 'arrowright') {
        ev.preventDefault();
        nudge((k === 'arrowleft' ? -1 : 1) * (ev.shiftKey ? 0.1 : 0.02));
        return;
      }
      if (k === ' ') ev.preventDefault();
      return;
    }
    // Shift+←/→ step a CHAPTER; plain ←/→ still only move the sentence and
    // still never touch a done state (tasks 4.2 / 4.4).
    if (ev.shiftKey && (k === 'arrowleft' || k === 'arrowright')) {
      ev.preventDefault();
      const d = k === 'arrowleft' ? -1 : 1;
      run(d < 0 ? 'chprev' : 'chnext', () => stepChapter(d))();
      return;
    }
    switch (k) {
      case ' ':
        ev.preventDefault();
        run('play', () => { if (st.recording) stopRecording(); else togglePlay(); })();
        break;
      case 'k': ev.preventDefault(); run('pause', togglePause)(); break;
      case 'r': ev.preventDefault(); run('rec', startRecording)(); break;
      case 'c': run('cmp', compare)(); break;
      case 'enter': ev.preventDefault(); run('done', doneNext)(); break;
      case 'arrowleft': ev.preventDefault(); run('prev', prev)(); break;
      case 'arrowright': ev.preventDefault(); run('next', next)(); break;
      case 'p': ev.preventDefault(); run('contour', () => App.setContours(!App.contours))(); break;
      case 'x': run('split', enterSplit)(); break;
      case 'm': run('merge', mergeNext)(); break;
      case 't': run('tr', transcribe)(); break;
      case 'f': run('fl', formantLab)(); break;
      case 'u': run('jump', jumpUnfinished)(); break;
      case 'l': ev.preventDefault(); run('ab', toggleAB)(); break;
      case 'escape':
        if (document.body.classList.contains('nav-open')) { revealNav(false); return; }
        if (q('.js-sheet').classList.contains('open')) { closeSheet(); return; }
        if (guard && guard('escape', ev) === true) return;
        if (!q('.js-tr-panel').classList.contains('hidden')
            || !q('.js-fl-panel').classList.contains('hidden')) { stopPlayback(); hidePanels(); return; }
        run('exit', exit)();
        break;
      default: break;                       // there is no `S`: slow playback is gone
    }
  }

  /** The trim switch moved, so both lanes are being REWINDOWED.

      A contour describes the window it was computed over, in that window's
      own duration — flip the switch and every path on screen describes a
      span that is no longer drawn beneath it (confirmed defect,
      2026-11-17: `App.setTrim` repainted the waveforms and left the
      contours, so both lanes stayed dimmed under paths that corresponded
      to nothing until the operator changed sentence or pressed P). The
      contour is cheap to lose and wrong to keep: clear it, then repaint.
      `P`'s own on/off state is untouched — the next C redraws. */
  function retrim() {
    clearContours();
    render();
  }

  return {
    init, enter, adopt, leaveQuietly, openAt, key, render, retrim, paintContourState, paintAuto,
    setGuard, forgetProvider,
  };
})();
