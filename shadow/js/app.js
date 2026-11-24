// app.js — the shell: one navigation, one open book, one keyboard.
//
// Five screens (Library · Explore · Study · Prepare, and ⚙ Settings, D9)
// live under the single nav at the top and nowhere else — no screen renders
// a second tab row (task 8.1). Explore, Study and Prepare all read the SAME loaded book and
// the SAME active split config, so switching between them never refetches
// and never disagrees.
//
// There is no alert/confirm/prompt in this page or in anything it loads
// (task 8.4): a modal dialog hangs an automated browser permanently, so
// every confirmation is an in-page panel.

const App = (() => {
  'use strict';

  const screens = {
    library: document.getElementById('s-library'),
    explore: document.getElementById('s-explore'),
    study: document.getElementById('s-study'),
    prepare: document.getElementById('s-prepare'),
    settings: document.getElementById('s-settings'),
  };
  // screens that need no open book
  const BOOKLESS = new Set(['library', 'settings']);
  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  const state = {
    // Always null since D168: the server uses its pinned owner id. Kept so
    // `App.userId` callers keep working until they are tidied away.
    userId: null,
    books: [],
    book: null,          // the loaded detail, or null
    sentences: [],       // active config, sorted by time
    chapters: [],
    byChapter: new Map(),// chapterId -> sentences
    screen: 'library',
    // ONE preference, default ON, governing BOTH lanes (task 2.5). Stored
    // under `shadowTrimSilence` in shadow's OWN settings store (D168) — it
    // used to be proxied to phonexa.
    trim: true,
    // "Play sentence when opened" (D12), default ON. Stored under
    // `shadowAutoplay` {on} in the same store, loaded with the trim switch.
    autoplay: true,
    // "Trim in audiobook mode" (D10), default OFF: natural tempo. Stored
    // under `shadowAudiobookTrim` {on}.
    abTrim: false,
    // `P`'s state. It must survive moving between sentences (task 3.5), so
    // it lives here and not in Study's per-sentence state; localStorage
    // carries it across reloads too.
    contours: localStorage.getItem('shadow.contours') !== '0',
  };

  // ── toast, standing in for the alerts this page may not use ────────────
  let toastTimer = 0;
  /** opts.undo — a function: the toast then carries an Undo button for its
      lifetime (6 s), D15. The button runs it once and closes the toast. */
  function toast(msg, bad, opts) {
    const el = document.getElementById('toast');
    const undo = opts && typeof opts.undo === 'function' ? opts.undo : null;
    el.textContent = '';
    const txt = document.createElement('span');
    txt.textContent = msg;
    el.appendChild(txt);
    if (undo) {
      const b = document.createElement('button');
      b.type = 'button';
      b.className = 'mini go';
      b.textContent = 'Undo';
      b.addEventListener('click', () => { el.classList.add('hidden'); clearTimeout(toastTimer); undo(); }, { once: true });
      el.appendChild(b);
    }
    el.classList.toggle('bad', !!bad);
    el.classList.toggle('has-undo', !!undo);
    el.classList.remove('hidden');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => el.classList.add('hidden'), undo ? 6000 : (bad ? 7000 : 3500));
  }

  // ── the playback preferences (shadow's own store, D168) ───────────────
  // Each setter changes the state at once, repaints what depends on it and
  // persists in the background; it RETURNS the save so the Settings screen
  // can say "✓ saved" on its row only once the server has it.
  const TRIM_KEY = 'shadowTrimSilence';
  const AUTOPLAY_KEY = 'shadowAutoplay';
  const AB_TRIM_KEY = 'shadowAudiobookTrim';

  function persist(key, value, what) {
    return Api.putSetting(key, value).catch((e) => {
      toast('Could not save the ' + what + ' setting: ' + e.message, true);
      throw e;
    });
  }

  /** Change it, repaint the lanes, and persist. Doneness is NOT touched by
      this: progress is always computed from the full stored span. */
  function setTrim(on) {
    state.trim = !!on;
    // retrim(), not render(): the lanes are being rewindowed, and a contour
    // drawn over the old window describes a duration that is about to stop
    // being on screen.
    if (typeof Study !== 'undefined' && state.screen === 'study') Study.retrim();
    return persist(TRIM_KEY, { on: state.trim }, 'trim');
  }

  async function loadSettings() {
    try {
      const all = await Api.getSettings();
      const stored = all && all[TRIM_KEY];
      // absent → the default, which is ON
      state.trim = !(stored && stored.on === false);
      const auto = all && all[AUTOPLAY_KEY];
      state.autoplay = !(auto && auto.on === false);
      // absent → the default, which is OFF (natural tempo)
      const ab = all && all[AB_TRIM_KEY];
      state.abTrim = !!(ab && ab.on === true);
    } catch (e) { state.trim = true; state.autoplay = true; state.abTrim = false; }
  }

  // ── autoplay: "Play sentence when opened" (D12) ───────────────────────
  function setAutoplay(on) {
    state.autoplay = !!on;
    if (typeof Study !== 'undefined') Study.paintAuto();
    return persist(AUTOPLAY_KEY, { on: state.autoplay }, 'autoplay');
  }

  // ── "Trim in audiobook mode" (D10) — read when a run starts ───────────
  function setAbTrim(on) {
    state.abTrim = !!on;
    return persist(AB_TRIM_KEY, { on: state.abTrim }, 'audiobook trim');
  }

  // ── theme: a per-DEVICE preference (D168), never stored server-side ───
  // 'system' is the absence of the attribute, so the media query decides.
  const THEME_KEY = 'shadow.theme';
  function storedTheme() {
    try {
      const v = localStorage.getItem(THEME_KEY);
      return v === 'light' || v === 'dark' ? v : 'system';
    } catch (e) { return 'system'; }
  }
  function applyTheme(pref) {
    const r = document.documentElement;
    if (pref === 'light' || pref === 'dark') r.setAttribute('data-theme', pref);
    else r.removeAttribute('data-theme');
  }
  function setTheme(pref) {
    const p = pref === 'light' || pref === 'dark' ? pref : 'system';
    applyTheme(p);
    try {
      if (p === 'system') localStorage.removeItem(THEME_KEY); else localStorage.setItem(THEME_KEY, p);
    } catch (e) { /* private mode: it still applies for this page */ }
    return p;
  }

  /** "Chapter N", or "Chapter N · Title" when the chapter has one (D15). */
  function chapterLabel(ch, ci) {
    if (ci == null || ci < 0) return '';
    return 'Chapter ' + (ci + 1) + (ch && ch.title ? ' · ' + ch.title : '');
  }

  function setContours(on) {
    state.contours = !!on;
    localStorage.setItem('shadow.contours', state.contours ? '1' : '0');
    if (typeof Study !== 'undefined') Study.paintContourState();
  }

  // ── navigation ─────────────────────────────────────────────────────────
  function show(name) {
    if (!screens[name]) return;
    if (!BOOKLESS.has(name) && !state.book) {
      toast('Open a book from the Library first.');
      name = 'library';
    }
    Object.keys(screens).forEach((k) => screens[k].classList.toggle('on', k === name));
    document.querySelectorAll('.nav [data-go]').forEach((b) => {
      b.setAttribute('aria-selected', String(b.dataset.go === name));
    });
    state.screen = name;
    // the phone hides the top navigation while studying (task 6.1)
    document.body.classList.toggle('studying', name === 'study');
    if (name !== 'study') document.body.classList.remove('nav-open');
    // refresh, not render: a book may have entered a working state while
    // another screen was open, and only a fetch can know that (it is also
    // what restarts the progress poll).
    if (name === 'library') Library.refresh();
    if (name === 'explore') Explore.render();
    if (name === 'study') Study.enter();
    if (name === 'prepare') Prepare.render();
    if (name === 'settings') Settings.render();
    // #settings is where the old settings.html lands, and a reload of the
    // Settings screen stays on it; every other screen drops the fragment.
    const want = name === 'settings' ? '#settings' : '';
    if (location.hash !== want) {
      try { history.replaceState(null, '', location.pathname + location.search + want); } catch (e) { /* file:// */ }
    }
    if (name !== 'study') Study.leaveQuietly();
    window.scrollTo({ top: 0, behavior: reduced ? 'auto' : 'smooth' });
  }

  // ── the open book ──────────────────────────────────────────────────────
  function index(book) {
    const segs = (book && book.segments) || [];
    state.sentences = segs.filter((s) => s.kind === 'sentence').sort((a, b) => a.startMs - b.startMs);
    state.chapters = segs.filter((s) => s.kind === 'chapter').sort((a, b) => a.startMs - b.startMs);
    state.byChapter = new Map(state.chapters.map((c) => [c.id, []]));
    for (const s of state.sentences) {
      const list = state.byChapter.get(s.parentId);
      if (list) list.push(s);
      else state.byChapter.set(s.parentId, [s]);
    }
  }

  async function openBook(id, goTo) {
    const detail = await Api.getMedia(id, state.userId);
    if (state.book && state.book.id !== id) ChapterAudio.clear();
    state.book = detail;
    index(detail);
    Explore.reset();
    Study.adopt();
    Prepare.reset();
    if (goTo) show(goTo);
    return detail;
  }

  /** Re-read the open book (after a split, a mark, a config change). */
  async function refreshBook() {
    if (!state.book) return null;
    const detail = await Api.getMedia(state.book.id, state.userId);
    state.book = detail;
    index(detail);
    return detail;
  }

  function chapterIndexOf(chapterId) {
    return state.chapters.findIndex((c) => c.id === chapterId);
  }
  function globalIndexOf(segId) {
    return state.sentences.findIndex((s) => s.id === segId);
  }

  // ── shortcut overlay ───────────────────────────────────────────────────
  const kover = document.getElementById('kover');
  function overlay(on) { kover.classList.toggle('hidden', !on); }

  // ── boot ───────────────────────────────────────────────────────────────
  async function boot() {
    // theme: System (no attribute — the media query decides), Light or
    // Dark, chosen in Settings and stored on this device only
    applyTheme(storedTheme());

    document.addEventListener('click', (e) => {
      const t = e.target.closest && e.target.closest('[data-go]');
      if (t) { e.preventDefault(); show(t.dataset.go); }
    });

    document.getElementById('koverClose').addEventListener('click', () => overlay(false));
    kover.addEventListener('click', (e) => { if (e.target === kover) overlay(false); });

    document.addEventListener('keydown', (e) => {
      if (e.metaKey || e.ctrlKey || e.altKey) return;
      const tag = (e.target && e.target.tagName) || '';
      if (tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT') return;
      const k = e.key.toLowerCase();
      if (k === '?' || (k === '/' && e.shiftKey)) {
        e.preventDefault(); overlay(kover.classList.contains('hidden')); return;
      }
      if (!kover.classList.contains('hidden')) { if (k === 'escape') overlay(false); return; }
      if (state.screen === 'study') Study.key(k, e);
      else if (k === 'escape') show('library');
    });

    // No profile picker (D168): shadow is single-user.
    await loadSettings();

    Library.init();
    Explore.init();
    Study.init();
    Prepare.init();
    Settings.init();

    await Library.refresh();

    const wanted = parseInt(new URLSearchParams(location.search).get('mediaId'), 10);
    if (wanted) {
      try { await openBook(wanted, 'study'); } catch (err) { toast('Could not open that book: ' + err.message, true); }
    }
    if (location.hash === '#settings') show('settings');
  }

  return {
    state, show, toast, openBook, refreshBook, overlay, boot, reduced,
    chapterIndexOf, globalIndexOf, setTrim, setContours, setAutoplay, setAbTrim,
    setTheme, storedTheme, chapterLabel,
    get trim() { return state.trim; },
    get autoplay() { return state.autoplay; },
    get abTrim() { return state.abTrim; },
    get contours() { return state.contours; },
    get userId() { return state.userId; },
    get book() { return state.book; },
    get sentences() { return state.sentences; },
    get chapters() { return state.chapters; },
    sentencesOf(chapterId) { return state.byChapter.get(chapterId) || []; },
  };
})();

document.addEventListener('DOMContentLoaded', () => {
  App.boot().catch((e) => App.toast('Could not start: ' + e.message, true));
});
