// app.js — the shell: one navigation, one open book, one keyboard.
//
// Four screens (Library · Explore · Study · Prepare) live under the single
// nav at the top and nowhere else — no screen renders a second tab row
// (task 8.1). Explore, Study and Prepare all read the SAME loaded book and
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
  };
  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  const state = {
    userId: null,
    books: [],
    book: null,          // the loaded detail, or null
    sentences: [],       // active config, sorted by time
    chapters: [],
    byChapter: new Map(),// chapterId -> sentences
    screen: 'library',
  };

  // ── toast, standing in for the alerts this page may not use ────────────
  let toastTimer = 0;
  function toast(msg, bad) {
    const el = document.getElementById('toast');
    el.textContent = msg;
    el.classList.toggle('bad', !!bad);
    el.classList.remove('hidden');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => el.classList.add('hidden'), bad ? 7000 : 3500);
  }

  // ── navigation ─────────────────────────────────────────────────────────
  function show(name) {
    if (!screens[name]) return;
    if (name !== 'library' && !state.book) {
      toast('Open a book from the Library first.');
      name = 'library';
    }
    Object.keys(screens).forEach((k) => screens[k].classList.toggle('on', k === name));
    document.querySelectorAll('#navLinks button').forEach((b) => {
      b.setAttribute('aria-selected', String(b.dataset.go === name));
    });
    state.screen = name;
    if (name === 'library') Library.render();
    if (name === 'explore') Explore.render();
    if (name === 'study') Study.enter();
    if (name === 'prepare') Prepare.render();
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
    // theme: the media query is the default, the stored choice wins both ways
    const stored = localStorage.getItem('shadow.theme');
    if (stored) document.documentElement.setAttribute('data-theme', stored);
    document.getElementById('themeBtn').addEventListener('click', () => {
      const r = document.documentElement;
      let cur = r.getAttribute('data-theme');
      if (!cur) cur = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
      const next = cur === 'dark' ? 'light' : 'dark';
      r.setAttribute('data-theme', next);
      localStorage.setItem('shadow.theme', next);
    });

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

    await UserLib.mountPicker('userPicker');
    state.userId = await UserLib.getCurrentUserId();
    window.addEventListener('phonexa:user-changed', async (e) => {
      state.userId = (e.detail && e.detail.userId) || await UserLib.getCurrentUserId();
      state.book = null;
      ChapterAudio.clear();
      await Library.refresh();
      show('library');
    });

    Library.init();
    Explore.init();
    Study.init();
    Prepare.init();

    await Library.refresh();

    const wanted = parseInt(new URLSearchParams(location.search).get('mediaId'), 10);
    if (wanted) {
      try { await openBook(wanted, 'study'); } catch (err) { toast('Could not open that book: ' + err.message, true); }
    }
  }

  return {
    state, show, toast, openBook, refreshBook, overlay, boot, reduced,
    chapterIndexOf, globalIndexOf,
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
