// settings.js — the Settings screen (D9, mockups/settings-prepare.html A).
//
// A fifth screen of the one page, opened from ⚙ in the nav. It replaces the
// separate settings.html page, which now only redirects here.
//
//   Appearance    theme System / Light / Dark — THIS DEVICE ONLY (browser
//                 storage); System is the absence of a choice.
//   Playback      trim silence · play sentence when opened · trim in
//                 audiobook mode — shadow's own settings store (D168).
//   Transcription the STT provider; the list comes from smia, and when smia
//                 cannot be reached only the saved choice is offered.
//   Books         a read-only overview, collapsed by default.
//
// Every change saves the moment it is made and acknowledges on its own row
// ("✓ saved"). There is no Save button and no browser dialog.

const Settings = (() => {
  'use strict';

  const root = document.getElementById('s-settings');
  const q = (s) => root.querySelector(s);
  const qa = (s) => Array.prototype.slice.call(root.querySelectorAll(s));

  const DEFAULT_PROVIDER = 'hf_whisper';
  let provider = DEFAULT_PROVIDER;

  function esc(t) {
    return String(t).replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  }

  // ── "✓ saved", on the row that changed ────────────────────────────────
  const savedT = {};
  function flashSaved(key) {
    const el = q('[data-saved="' + key + '"]');
    if (!el) return;
    el.classList.add('on');
    clearTimeout(savedT[key]);
    savedT[key] = setTimeout(() => el.classList.remove('on'), 1600);
  }

  // ── Appearance ─────────────────────────────────────────────────────────
  function paintTheme(pref) {
    qa('#themeSeg button').forEach((b) => b.setAttribute('aria-checked', String(b.dataset.v === pref)));
  }

  // ── Playback ───────────────────────────────────────────────────────────
  const ECHO = {
    trim: ['On — waveforms show the speech-only window.', 'Off — sentences and takes play with their full silence.'],
    autoplay: ['On — ← / → / Done & next start the new sentence playing.', 'Off — a new sentence waits for ▶ / space.'],
    abtrim: ['On — audiobook mode skips the pauses between sentences.', 'Off — natural tempo, every pause exactly as recorded.'],
  };
  const VALUE = { trim: () => App.trim, autoplay: () => App.autoplay, abtrim: () => App.abTrim };
  const SETTER = { trim: (v) => App.setTrim(v), autoplay: (v) => App.setAutoplay(v), abtrim: (v) => App.setAbTrim(v) };

  function paintSwitches() {
    qa('[data-sw]').forEach((row) => {
      const k = row.dataset.sw, on = !!VALUE[k]();
      row.querySelector('.switch').setAttribute('aria-checked', String(on));
      q('[data-echo="' + k + '"]').textContent = ECHO[k][on ? 0 : 1];
    });
  }

  // ── Transcription ──────────────────────────────────────────────────────
  async function renderStt() {
    const sel = q('#sttSel'), reach = q('#reach'), txt = q('#reachTxt');
    reach.classList.remove('bad');
    reach.classList.add('wait');
    txt.textContent = 'asking smia…';
    try {
      const all = await Api.getSettings();
      const stored = (all && all.transcribeBackend) || {};
      provider = (typeof stored.provider === 'string' && stored.provider) || DEFAULT_PROVIDER;
    } catch (e) { /* keep what we had */ }
    let list = null;
    try {
      const r = await fetch(API_BASE + '/transcribe/providers', { signal: AbortSignal.timeout(6000) });
      const data = await r.json().catch(() => ({}));
      if (r.ok && Array.isArray(data.providers)) list = data.providers;
    } catch (e) { list = null; }
    reach.classList.remove('wait');
    if (list) {
      const n = list.length;
      if (!list.includes(provider)) list = [provider].concat(list);
      txt.textContent = 'smia reachable ✓ · ' + n + ' provider' + (n === 1 ? '' : 's');
    } else {
      // smia down: the saved choice is all there is to show
      list = [provider];
      reach.classList.add('bad');
      txt.textContent = 'smia unreachable ⚠ — showing your saved choice only';
    }
    sel.innerHTML = list.map((p) => '<option value="' + esc(p) + '">' + esc(p) + '</option>').join('');
    sel.value = provider;
  }

  // ── Books (read-only) ──────────────────────────────────────────────────
  async function renderBooks() {
    let books = App.state.books || [];
    try { books = await Api.listMedia(); } catch (e) { /* the Library's copy will do */ }
    q('#setBooksCt').textContent = books.length + ' book' + (books.length === 1 ? '' : 's');
    q('#setBooks').innerHTML = books.map((b) => {
      const n = b.sentenceCount || 0, done = b.doneCount || 0;
      const p = n ? Math.round((100 * done) / n) : 0;
      return '<div class="brow"><span class="t">' + esc(b.title || b.originalFilename || '(unnamed)') + '</span>'
        + '<span class="r num"><b style="font-weight:560">' + (n ? p + '%' : '—') + '</b></span>'
        + '<span class="m num">' + Fmt.clock(b.durationMs) + ' · '
        + (n ? Fmt.int(done) + ' / ' + Fmt.int(n) + ' sentences' : 'not split yet') + '</span>'
        + '<span class="m"></span>'
        + '<div class="bar"><i style="width:' + p + '%"></i></div></div>';
    }).join('') || '<div class="brow"><span class="m">No books yet.</span></div>';
  }

  function render() {
    paintTheme(App.storedTheme());
    paintSwitches();
    renderStt();
    renderBooks();
  }

  function init() {
    qa('#themeSeg button').forEach((b) => b.addEventListener('click', () => {
      paintTheme(App.setTheme(b.dataset.v));
      flashSaved('theme');
    }));
    qa('[data-sw]').forEach((row) => row.addEventListener('click', () => {
      const k = row.dataset.sw;
      const save = SETTER[k](!VALUE[k]());
      paintSwitches();
      save.then(() => flashSaved(k)).catch(() => { /* App toasted it */ });
    }));
    q('#sttSel').addEventListener('change', (e) => {
      const p = e.target.value || DEFAULT_PROVIDER;
      Api.putSetting('transcribeBackend', { provider: p }).then(() => {
        provider = p;
        if (typeof Study !== 'undefined' && Study.forgetProvider) Study.forgetProvider();
        flashSaved('stt');
      }).catch((err) => App.toast('Could not save the provider: ' + err.message, true));
    });
    paintSwitches();
  }

  return { init, render };
})();
