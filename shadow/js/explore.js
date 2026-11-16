// explore.js — the whole book at a glance, and bulk marking.
//
// Done-ness here is exactly what Study shows, because both read the same
// derived `done` the server computes from the book's completed time ranges.
// Marking writes through POST /media/<id>/progress — the one endpoint that
// serves a single sentence and a 200-sentence selection identically, which
// is why a bulk mark is instantly true in every other split config too.
//
// Tier-2 decision (how many sentences before virtualising): a chapter's grid
// is built only when that chapter is expanded, and collapsed again on
// re-render. A chapter is a hundred-odd cells, so no windowing is needed —
// what had to be avoided was laying out 1 500 cells for a book nobody has
// expanded yet.

const Explore = (() => {
  'use strict';

  const host = document.getElementById('exChapters');
  const totalsEl = document.getElementById('exTotals');
  const bookEl = document.getElementById('exBook');
  const selbar = document.getElementById('selbar');
  const selCountEl = document.getElementById('selCount');
  const selExtendBtn = document.getElementById('selExtend');
  const selModeBtn = document.getElementById('selModeBtn');
  const hintEl = document.getElementById('exHint');

  let sel = new Set();
  let anchor = null;
  let extendArmed = false;
  // Task 5.2: selection lives behind an explicit mode. With it off a tap
  // anywhere on a cell opens Study (task 5.1) and can never start a
  // selection; the chapter-header checkboxes select in EITHER mode.
  let selectMode = false;
  const openChapters = new Set();
  let busy = false;

  function reset() { sel = new Set(); anchor = null; extendArmed = false; openChapters.clear(); }

  function paintSelMode() {
    if (selModeBtn) {
      selModeBtn.classList.toggle('on', selectMode);
      selModeBtn.setAttribute('aria-pressed', String(selectMode));
      selModeBtn.textContent = selectMode ? '☑ Select mode — on' : '☑ Select mode';
    }
    host.classList.toggle('selmode', selectMode);
    if (hintEl) {
      hintEl.innerHTML = selectMode
        ? 'Select mode is <b>on</b> — a tap selects. Shift-click (or <b>“select to…”</b>) takes a range. '
          + 'Turn it off to open sentences in Study again.'
        : 'Tap <b>anywhere on a sentence</b> to open it in Study · tap <b>▶</b> to hear it without leaving · '
          + 'turn on <b>Select mode</b> to tap-to-select instead. Chapter checkboxes always select.';
    }
  }

  function paintSelbar() {
    selbar.classList.toggle('hidden', sel.size === 0);
    selCountEl.textContent = sel.size + ' selected';
    selExtendBtn.classList.toggle('on', extendArmed);
    selExtendBtn.textContent = extendArmed ? '⇥ tap the end sentence' : '⇥ select to…';
  }

  function selectRange(aId, bId) {
    const all = App.sentences;
    const i = all.findIndex((s) => s.id === aId), j = all.findIndex((s) => s.id === bId);
    if (i < 0 || j < 0) return;
    for (let k = Math.min(i, j); k <= Math.max(i, j); k++) sel.add(all[k].id);
  }

  function cellClick(segId, shift) {
    if ((shift || extendArmed) && anchor !== null) {
      selectRange(anchor, segId);
      extendArmed = false;
    } else if (sel.has(segId) && sel.size === 1) {
      sel = new Set(); anchor = null;
    } else {
      sel = new Set([segId]); anchor = segId;
    }
    render();
  }

  async function mark(done) {
    if (busy || !sel.size) return;
    busy = true;
    const ids = Array.from(sel);
    try {
      await Api.postProgress(App.book.id, {
        userId: App.userId,
        [done ? 'doneSegmentIds' : 'notDoneSegmentIds']: ids,
      });
      await App.refreshBook();
      render();
      Study.adopt();
      App.toast(`${ids.length} sentence${ids.length === 1 ? '' : 's'} marked ${done ? 'done' : 'not done'}.`);
    } catch (e) {
      App.toast('Could not save: ' + e.message, true);
    } finally { busy = false; }
  }

  function render() {
    const book = App.book;
    if (!book) { host.innerHTML = ''; return; }
    bookEl.textContent = book.title || book.originalFilename || '';
    const sentences = App.sentences;
    const doneTotal = sentences.filter((s) => s.done).length;
    totalsEl.textContent =
      `${App.chapters.length} chapters · ${Fmt.int(sentences.length)} sentences · ${Fmt.int(doneTotal)} done`;

    host.innerHTML = '';
    App.chapters.forEach((ch, ci) => {
      const kids = App.sentencesOf(ch.id);
      const done = kids.filter((s) => s.done).length;
      const isOpen = openChapters.has(ch.id);
      const anySel = kids.some((s) => sel.has(s.id));
      const allSel = kids.length > 0 && kids.every((s) => sel.has(s.id));

      const wrap = document.createElement('div');
      wrap.className = 'exch';
      wrap.setAttribute('data-open', isOpen ? '1' : '0');

      const head = document.createElement('div');
      head.className = 'exch-head';

      const cbx = document.createElement('button');
      cbx.type = 'button';
      cbx.className = 'cbx';
      cbx.title = 'select the whole chapter';
      cbx.setAttribute('aria-checked', allSel ? 'true' : (anySel ? 'mixed' : 'false'));
      cbx.textContent = allSel ? '✓' : (anySel ? '–' : '');
      cbx.addEventListener('click', () => {
        if (allSel) kids.forEach((s) => sel.delete(s.id));
        else kids.forEach((s) => sel.add(s.id));
        anchor = allSel ? null : (kids[0] && kids[0].id);
        render();
      });

      const toggle = document.createElement('button');
      toggle.type = 'button';
      toggle.className = 'exch-toggle';
      toggle.innerHTML = '<span class="caret">▸</span><span class="exch-name"></span>'
        + `<span class="exch-meta num">${Fmt.clock(ch.endMs - ch.startMs)}</span>`;
      toggle.querySelector('.exch-name').textContent = `Chapter ${ci + 1}`;
      toggle.addEventListener('click', () => {
        if (openChapters.has(ch.id)) openChapters.delete(ch.id); else openChapters.add(ch.id);
        render();
      });

      const count = document.createElement('div');
      count.className = 'exch-count';
      count.innerHTML = `<div class="cnt num">${done} / ${kids.length} done</div>`
        + `<div class="bar"><i style="width:${kids.length ? (100 * done) / kids.length : 0}%"></i></div>`;

      head.appendChild(cbx); head.appendChild(toggle); head.appendChild(count);
      wrap.appendChild(head);

      const body = document.createElement('div');
      body.className = 'exbody';
      if (isOpen) {
        const grid = document.createElement('div');
        grid.className = 'sgrid';
        kids.forEach((s) => {
          const gi = App.globalIndexOf(s.id);
          const cell = document.createElement('div');
          cell.className = 'scell' + (s.done ? ' done' : '') + (sel.has(s.id) ? ' sel' : '');
          cell.tabIndex = 0;
          cell.setAttribute('role', 'button');
          cell.title = 'open this sentence in Study';
          cell.innerHTML =
            '<button class="sprev" type="button" title="preview this sentence">▶</button>'
            + '<span class="snum num"></span>'
            + '<span class="tickmark">✓</span>'
            + `<span class="sdur num">${Fmt.secs(s.durationMs)}</span>`;
          cell.querySelector('.snum').textContent = gi + 1;
          const activate = (shift) => {
            if (selectMode) { cellClick(s.id, shift); return; }
            Study.openAt(s.id);
          };
          cell.addEventListener('click', (e) => {
            if (e.target.closest('.sprev')) return;   // the preview is its own target
            activate(e.shiftKey);
          });
          cell.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); activate(e.shiftKey); }
          });
          cell.querySelector('.sprev').addEventListener('click', (e) => {
            e.stopPropagation();
            if (App.book.audioState !== 'ready') { App.toast('This book has no stored audio.'); return; }
            cell.classList.add('playing');
            cell.style.setProperty('--pdur', Math.max(300, s.durationMs) + 'ms');
            Preview.play(s.id, () => cell.classList.remove('playing'));
            setTimeout(() => cell.classList.remove('playing'), s.durationMs + 400);
          });
          grid.appendChild(cell);
        });
        body.appendChild(grid);
      }
      wrap.appendChild(body);
      host.appendChild(wrap);
    });

    paintSelbar();
    paintSelMode();
  }

  function init() {
    if (selModeBtn) {
      selModeBtn.addEventListener('click', () => {
        selectMode = !selectMode;
        if (!selectMode) extendArmed = false;
        paintSelMode();
        paintSelbar();
      });
    }
    document.getElementById('selDone').addEventListener('click', () => mark(true));
    document.getElementById('selUndone').addEventListener('click', () => mark(false));
    document.getElementById('selClear').addEventListener('click', () => {
      sel = new Set(); anchor = null; extendArmed = false; render();
    });
    selExtendBtn.addEventListener('click', () => { extendArmed = !extendArmed; paintSelbar(); });
  }

  /** Open Explore scrolled to a chapter (used when leaving Study). */
  function expand(chapterId) { if (chapterId) openChapters.add(chapterId); }

  return { init, render, reset, expand };
})();
