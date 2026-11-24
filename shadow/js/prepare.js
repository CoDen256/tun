// prepare.js — split configs, and hearing the boundary you are editing.
//
// A config is thresholds plus boundary rows. Creating, duplicating,
// renaming, deleting or re-analysing one never touches the stored master
// and never touches progress, because progress is completed time ranges on
// the BOOK — which is also why a brand-new config opens with sentences
// already ticked. The one-line explainer at the top of the screen says so.
//
// Every destructive action confirms in-page. There is no confirm() here.
//
// Chapter editing (D15, mockups/settings-prepare.html screen B): inside an
// open chapter, the seam between two sentences offers "⤒ Start new chapter
// here" on hover (or pinned, for touch, by "⤒ Show chapter breaks"); each
// chapter header but the last offers "⇣ Merge with next chapter"; "✎ Title"
// names a chapter inline. Each confirms in the page, and the toast after it
// offers Undo — the inverse server call, flagged `undo` so the config's
// manual-edit count goes back down. These are edits of the ACTIVE config
// only; sentence spans and progress never change.

const Prepare = (() => {
  'use strict';

  const cfgList = document.getElementById('cfgList');
  const chBox = document.getElementById('prepChapters');
  const bookEl = document.getElementById('prBook');
  const activeNameEl = document.getElementById('activeCfgName');
  const newPanel = document.getElementById('newCfgPanel');
  const r1 = document.getElementById('r1'), r2 = document.getElementById('r2');

  const openChapters = new Set();
  let poll = 0;
  // the one in-page chapter confirm open: {kind:'gap', ch, sid} |
  // {kind:'mergech', ch} | {kind:'rename', ch}
  let pending = null;
  let gapsPinned = false;
  let flashId = null;
  let busy = false;

  function reset() { openChapters.clear(); pending = null; }

  function esc(t) {
    return String(t == null ? '' : t).replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  }
  /** m:ss.s — the confirm names the new chapter's start to a tenth. */
  function clockDec(ms) {
    const t = Math.max(0, ms || 0) / 1000;
    const h = Math.floor(t / 3600), m = Math.floor((t % 3600) / 60), sec = t % 60;
    const ss = sec.toFixed(1).padStart(4, '0');
    return h ? h + ':' + String(m).padStart(2, '0') + ':' + ss : m + ':' + ss;
  }

  function activeConfig() {
    const book = App.book;
    if (!book) return null;
    return (book.configs || []).find((c) => c.isActive) || (book.configs || [])[0] || null;
  }

  async function reload() {
    await App.refreshBook();
    render();
    Study.adopt();
    Explore.render();
    Library.refresh();
  }

  // ── the config cards ───────────────────────────────────────────────────
  function renderConfigs() {
    const book = App.book;
    cfgList.innerHTML = '';
    (book.configs || []).forEach((cfg) => {
      const el = document.createElement('div');
      el.className = 'cfg' + (cfg.isActive ? ' active' : '');

      const main = document.createElement('div');
      main.className = 'cfg-main';
      main.innerHTML =
        '<div class="cfg-name"><span class="nm"></span>'
        + (cfg.isActive ? '<span class="badge">active</span>' : '')
        + (cfg.analysisState === 'running' ? '<span class="chip"><span class="dot pulse"></span> analysing…</span>' : '')
        + (cfg.analysisState === 'failed' ? '<span class="chip">analysis failed</span>' : '')
        + '</div>'
        + `<div class="cfg-meta num">${cfg.sentenceSilenceMs} ms sentence · ${cfg.chapterSilenceMs} ms chapter`
        + ` &nbsp;·&nbsp; ${cfg.chapterCount} chapters · ${Fmt.int(cfg.sentenceCount)} sentences`
        + ` &nbsp;·&nbsp; <span class="done-n">${Fmt.int(cfg.doneCount)} done</span>`
        + (cfg.manualEditCount
          ? ` &nbsp;·&nbsp; <span class="ed">✎ ${cfg.manualEditCount} manual edit${cfg.manualEditCount === 1 ? '' : 's'}</span>`
          : '')
        + '</div>'
        + (cfg.analysisError ? `<div class="quiet" style="font-size:.8rem">${cfg.analysisError}</div>` : '');
      main.querySelector('.nm').textContent = cfg.name;

      const acts = document.createElement('div');
      acts.className = 'cfg-acts';
      acts.innerHTML =
        (cfg.isActive ? '' : '<button class="mini go" data-a="activate" type="button">Make active</button>')
        + '<button class="mini" data-a="adjust" type="button">Adjust &amp; re-analyse</button>'
        + '<button class="mini" data-a="rename" type="button">Rename</button>'
        + '<button class="mini" data-a="dup" type="button">Duplicate</button>'
        + '<button class="mini" data-a="del" type="button">Delete</button>';

      let extra = document.createElement('div');
      extra.className = 'cfg-extra hidden';

      el.appendChild(main); el.appendChild(acts); el.appendChild(extra);
      cfgList.appendChild(el);

      function freshExtra() {
        const n = extra.cloneNode(false);
        extra.parentNode.replaceChild(n, extra);
        extra = n;
        extra.classList.remove('hidden');
        return extra;
      }
      function closeExtra() { extra.classList.add('hidden'); extra.innerHTML = ''; }

      acts.addEventListener('click', async (e) => {
        const b = e.target.closest('button');
        if (!b) return;
        const a = b.dataset.a;

        if (a === 'activate') {
          try { await Api.patchConfig(cfg.id, { isActive: true }); ChapterAudio.clear(); await reload(); }
          catch (err) { App.toast(err.message, true); }
          return;
        }
        if (a === 'dup') {
          try { await Api.duplicateConfig(cfg.id); await reload(); App.toast('Duplicated — the copy carries the same boundaries.'); }
          catch (err) { App.toast(err.message, true); }
          return;
        }
        if (a === 'rename') {
          freshExtra().innerHTML =
            '<div class="box"><div class="quiet" style="font-size:.82rem;margin-bottom:.4rem">Rename this config</div>'
            + '<div class="row-actions" style="margin-top:0"><input type="text" class="nm-in">'
            + '<button class="mini go" data-x="ok" type="button">Save</button>'
            + '<button class="mini" data-x="no" type="button">Cancel</button></div></div>';
          const inp = extra.querySelector('.nm-in');
          inp.value = cfg.name; inp.focus();
          extra.addEventListener('click', async (ev) => {
            const t = ev.target.closest('button');
            if (!t) return;
            if (t.dataset.x === 'ok') {
              try { await Api.patchConfig(cfg.id, { name: inp.value.trim() }); await reload(); }
              catch (err) { App.toast(err.message, true); }
            } else closeExtra();
          });
          return;
        }
        if (a === 'del') {
          freshExtra().innerHTML =
            `<div class="warn" style="margin-top:.6rem"><b>Delete “${cfg.name}”?</b>`
            + '<div class="quiet" style="margin-top:.3rem">Its boundaries and manual edits go. Your completed time '
            + 'ranges stay on the book, so every other config keeps its done count.</div>'
            + '<div class="acts"><button class="danger" data-x="go" type="button">Delete config</button>'
            + '<button class="mini" data-x="no" type="button">Cancel</button></div></div>';
          extra.addEventListener('click', async (ev) => {
            const t = ev.target.closest('button');
            if (!t) return;
            if (t.dataset.x === 'go') {
              try { await Api.deleteConfig(cfg.id); ChapterAudio.clear(); await reload(); }
              catch (err) { App.toast(err.message, true); }
            } else closeExtra();
          });
          return;
        }
        if (a === 'adjust') {
          freshExtra().innerHTML =
            '<div class="box"><div class="params">'
            + '<div class="param"><label>Sentence silence <b><span class="o1">' + cfg.sentenceSilenceMs + '</span> ms</b></label>'
            + `<input type="range" class="i1" min="100" max="1200" step="20" value="${cfg.sentenceSilenceMs}"></div>`
            + '<div class="param"><label>Chapter silence <b><span class="o2">' + cfg.chapterSilenceMs + '</span> ms</b></label>'
            + `<input type="range" class="i2" min="1200" max="15000" step="100" value="${cfg.chapterSilenceMs}"></div>`
            + '</div>'
            + '<div class="row-actions"><button class="mini go" data-x="run" type="button">Re-analyse</button>'
            + '<button class="mini" data-x="no" type="button">Cancel</button></div>'
            + `<div class="warn hidden"><b>Re-analysing rebuilds every boundary in “${esc(cfg.name)}” — any manual `
            + 'splits, merges, <u>chapter breaks, chapter merges and chapter titles</u> you made in THIS config are discarded'
            + (cfg.manualEditCount ? ` (${cfg.manualEditCount} edit${cfg.manualEditCount === 1 ? '' : 's'})` : '') + '.</b>'
            + '<div class="quiet" style="margin-top:.3rem">Other configs are untouched, and your completed time ranges '
            + 'stay on the book.</div>'
            + '<div class="acts"><button class="danger" data-x="confirm" type="button">Re-analyse anyway</button>'
            + '<button class="mini" data-x="no" type="button">Cancel</button></div></div></div>';
          const i1 = extra.querySelector('.i1'), i2 = extra.querySelector('.i2');
          const o1 = extra.querySelector('.o1'), o2 = extra.querySelector('.o2');
          const warnEl = extra.querySelector('.warn');
          i1.addEventListener('input', () => { o1.textContent = i1.value; });
          i2.addEventListener('input', () => { o2.textContent = i2.value; });
          extra.addEventListener('click', async (ev) => {
            const t = ev.target.closest('button');
            if (!t) return;
            if (t.dataset.x === 'run') { warnEl.classList.remove('hidden'); return; }
            if (t.dataset.x === 'confirm') {
              try {
                await Api.analyzeConfig(cfg.id, {
                  sentenceSilenceMs: +i1.value, chapterSilenceMs: +i2.value,
                });
                ChapterAudio.clear();
                await reload();
                Library.refresh();  // start the Library's progress poll now,
                                    // not when the operator happens to look
                App.toast('Analysing — the sentence list refreshes when it finishes.');
              } catch (err) { App.toast(err.message, true); }
              return;
            }
            closeExtra();
          });
        }
      });
    });

    const act = activeConfig();
    activeNameEl.textContent = act ? act.name : '—';
    document.querySelectorAll('#s-prepare .js-actname2').forEach((e) => { e.textContent = act ? act.name : '—'; });
  }

  // ── the sentence rows ──────────────────────────────────────────────────
  function rowWave(entry, chapter, s) {
    if (!entry || !entry.peaks) return '<span class="nope"></span>';
    const from = s.startMs - chapter.startMs;
    return Wave.svg(entry.peaks, from, from + s.durationMs, 46);
  }

  // segId -> the CURRENT row's preview adapter. Rows are rebuilt by every
  // render (chapter toggle, chunk loaded, edits), so the Player talks to the
  // map, never to one render's nodes — as Explore does.
  const rowUis = new Map();

  function renderRows(body, chapter, ci) {
    const entry = ChapterAudio.peek(chapter.id);
    const kids = App.sentencesOf(chapter.id);
    body.innerHTML = '';
    kids.forEach((s, ri) => {
      // the seam BEFORE this sentence: a possible chapter break (D15)
      if (ri > 0) body.appendChild(gapEl(chapter, ci, kids, ri));
      const el = document.createElement('div');
      el.className = 'prow' + (s.done ? ' done' : '');
      el.innerHTML =
        `<span class="pnum num">${ri + 1}</span>`
        + '<button class="sprev" type="button" title="play just this sentence (restarts if playing)">▶</button>'
        + '<button class="spause" type="button" title="pause / resume this preview">❚❚</button>'
        + `<span class="pw"><span class="ph"></span>${rowWave(entry, chapter, s)}</span>`
        + `<span class="ptime num">${Fmt.clock(s.startMs)} → ${Fmt.clock(s.endMs)} · ${Fmt.secs(s.durationMs)}</span>`
        + '<span class="pdone" title="covered by a completed time range">✓</span>'
        + '<span class="pacts"><button class="mini" data-a="split" type="button">✂ Split</button>'
        + '<button class="mini" data-a="merge" type="button">⇣ Merge</button></span>';

      // The row preview is the shared player model (D4): ▶ restarts, ❚❚
      // pauses/resumes, the playhead is the element's real position.
      const pw = el.querySelector('.pw');
      const ph = el.querySelector('.ph');
      const prevBtn = el.querySelector('.sprev');
      const pauseBtn = el.querySelector('.spause');
      rowUis.set(s.id, {
        onState(x) {
          el.classList.toggle('loading', x === 'loading');
          el.classList.toggle('playing', x === 'playing' || x === 'paused');
          el.classList.toggle('paused', x === 'paused');
          pw.classList.toggle('playing', x === 'playing' || x === 'paused');
          prevBtn.innerHTML = x === 'loading' ? '<span class="spin"></span>' : (x === 'playing' ? '↺' : '▶');
          pauseBtn.textContent = x === 'paused' ? '▶' : '❚❚';
          if (x === 'stopped') ph.style.left = '0%';
        },
        onFrame(f) { ph.style.left = 'calc(' + (f * 100).toFixed(2) + '% - ' + (f * 2).toFixed(2) + 'px)'; },
      });
      const ui = {
        onState: (x) => { const u = rowUis.get(s.id); if (u) u.onState(x); },
        onFrame: (f) => { const u = rowUis.get(s.id); if (u) u.onFrame(f); },
      };
      const live = Player.owned('preview:' + s.id);
      if (live) {
        ui.onState(live.paused ? 'paused' : 'playing');
        if (live.fraction) ui.onFrame(live.fraction());
      }
      prevBtn.addEventListener('click', () => {
        if (App.book.audioState !== 'ready') { App.toast('This book has no stored audio.'); return; }
        Player.preview(chapter, s, ui);
      });
      pauseBtn.addEventListener('click', () => {
        const hd = Player.owned('preview:' + s.id);
        if (hd) hd.togglePause();
      });

      el.querySelector('.pacts').addEventListener('click', async (e) => {
        const b = e.target.closest('button');
        if (!b) return;
        if (b.dataset.a === 'merge') {
          const next = kids[ri + 1];
          if (!next) {
            // a sentence merge never crosses a chapter boundary (D15)
            App.toast(ci < App.chapters.length - 1
              ? 'Last sentence of this chapter — merge the chapters first.'
              : 'Last sentence of the book — there is nothing after it to merge.');
            return;
          }
          try { await Api.mergeSegments(s.id, next.id); await afterEdit(chapter.id); }
          catch (err) { App.toast('Could not merge: ' + err.message, true); }
          return;
        }
        const existing = el.querySelector('.scrub');
        if (existing) { existing.remove(); return; }
        const sc = document.createElement('div');
        sc.className = 'scrub';
        const entry2 = ChapterAudio.peek(chapter.id);
        sc.innerHTML =
          '<div class="lbl">Click the waveform to set the split point</div>'
          + '<div class="sw">'
          + (entry2 && entry2.peaks
            ? Wave.svg(entry2.peaks, s.startMs - chapter.startMs, s.endMs - chapter.startMs, 160)
            : '<span class="nope" style="height:64px"></span>')
          + '<span class="mark"></span></div>'
          + '<div class="row-actions"><button class="mini go" data-x="ok" type="button">Split here</button>'
          + '<button class="mini" data-x="no" type="button">Cancel</button>'
          + `<span class="quiet num" style="font-size:.8rem">at <span class="at">${(s.durationMs / 2000).toFixed(2)}</span> s into the sentence</span></div>`;
        el.appendChild(sc);
        const sw = sc.querySelector('.sw'), mark = sc.querySelector('.mark'), at = sc.querySelector('.at');
        let frac = 0.5;
        sw.addEventListener('click', (ev) => {
          const rect = sw.getBoundingClientRect();
          frac = Math.max(0.02, Math.min(0.98, (ev.clientX - rect.left) / rect.width));
          mark.style.left = (frac * 100).toFixed(1) + '%';
          at.textContent = ((s.durationMs * frac) / 1000).toFixed(2);
        });
        sc.addEventListener('click', async (ev) => {
          const b2 = ev.target.closest('button');
          if (!b2) return;
          if (b2.dataset.x === 'ok') {
            try {
              await Api.splitSegment(s.id, Math.round(s.startMs + frac * s.durationMs));
              await afterEdit(chapter.id);
            } catch (err) { App.toast('Could not split: ' + err.message, true); }
          } else sc.remove();
        });
      });

      body.appendChild(el);
    });
    if (!kids.length) body.innerHTML = '<div class="prow"><span class="quiet">no sentences in this chapter</span></div>';
  }

  async function afterEdit(chapterId) {
    await App.refreshBook();
    await ChapterAudio.refreshManifest(chapterId, App.userId).catch(() => {});
    render();
    Study.adopt();
    Explore.render();
  }

  // ── chapter editing (D15) ───────────────────────────────────────────────
  /** The seam before sentence `ri`: hover/pinned "⤒ Start new chapter here",
      or, once pressed, the in-page confirm. */
  function gapEl(ch, ci, kids, ri) {
    const s = kids[ri];
    const wrap = document.createElement('div');
    if (pending && pending.kind === 'gap' && pending.ch === ch.id && pending.sid === s.id) {
      const n = App.chapters.length;
      const left = kids.length - ri;
      wrap.className = 'gap-confirm';
      wrap.innerHTML = '<div class="confirm"><b class="h">Start a new chapter at sentence ' + (ri + 1) + '?</b><ul>'
        + '<li>Chapter ' + (ci + 1) + ' keeps sentences <b>1–' + ri + '</b> · ' + Fmt.clock(s.startMs - ch.startMs) + '</li>'
        + '<li>New <b>Chapter ' + (ci + 2) + '</b> starts at <b class="num">' + clockDec(s.startMs) + '</b> with '
        + left + ' sentence' + (left === 1 ? '' : 's') + ' · ' + Fmt.clock(ch.endMs - s.startMs) + '</li>'
        + (ci + 2 <= n ? '<li>Chapters ' + (ci + 2) + '–' + n + ' become ' + (ci + 3) + '–' + (n + 1) + '.</li>' : '')
        + '</ul><div class="acts"><button class="btn-go" type="button" data-x="gap-ok">Start new chapter</button>'
        + '<button class="mini" type="button" data-x="cancel">Cancel</button>'
        + '<button class="sprev hear" type="button" data-x="hear" title="hear the boundary: end of one, start of the next">▶ hear the boundary</button>'
        + '</div></div>';
      wrap.addEventListener('click', (e) => {
        const t = e.target.closest('[data-x]');
        if (!t) return;
        if (t.dataset.x === 'cancel') { pending = null; renderChapters(); return; }
        if (t.dataset.x === 'hear') { hearBoundary(ch, s, t); return; }
        if (t.dataset.x === 'gap-ok') doBreak(ch, ci, s, ri, t);
      });
      return wrap;
    }
    wrap.className = 'gap';
    wrap.innerHTML = '<span class="hit" data-g="1"></span><span class="line"></span>'
      + '<button class="gbtn" type="button" data-g="1">⤒ Start new chapter here</button>';
    wrap.addEventListener('click', (e) => {
      if (!e.target.closest('[data-g]')) return;
      pending = { kind: 'gap', ch: ch.id, sid: s.id };
      renderChapters();
    });
    return wrap;
  }

  /** ~2 s either side of the seam, through the shared player. */
  function hearBoundary(ch, s, btn) {
    const go = (entry) => {
      const off = Player.offsetOf(entry, ch, s);
      btn.textContent = '▶ …playing 2 s either side';
      Player.chapter(entry, Math.max(0, off - 2000), off + 2000, {
        owner: 'boundary:' + s.id,
        onEnd: () => { btn.textContent = '▶ hear the boundary'; },
        onError: (e) => App.toast('Playback failed: ' + (e.message || e), true),
      });
    };
    if (App.book.audioState !== 'ready') { App.toast('This book has no stored audio.'); return; }
    const ready = ChapterAudio.peek(ch.id);
    if (ready) { go(ready); return; }
    btn.textContent = '▶ loading…';
    ChapterAudio.ensure(ch.id, App.userId).then(go).catch((e) => {
      btn.textContent = '▶ hear the boundary';
      App.toast('Chapter audio unavailable: ' + e.message, true);
    });
  }

  /** Run one chapter edit; boundary edits invalidate the cached chunks
      (they are keyed by boundaries), a title does not. */
  async function chapterEdit(btn, call, boundaries) {
    if (busy) return null;
    busy = true;
    if (btn) btn.disabled = true;
    try {
      const res = await call();
      pending = null;
      if (boundaries) { Player.stopAll(); ChapterAudio.clear(); }
      await App.refreshBook();
      render();
      Study.adopt();
      Explore.render();
      if (boundaries) loadOpenChapters();
      return res;
    } catch (e) {
      App.toast(e.message, true);
      if (btn) btn.disabled = false;
      return null;
    } finally { busy = false; }
  }

  function loadOpenChapters() {
    if (!App.book || App.book.audioState !== 'ready') return;
    App.chapters.filter((c) => openChapters.has(c.id) && !ChapterAudio.peek(c.id)).forEach((c) => {
      ChapterAudio.ensure(c.id, App.userId).then(() => { if (App.state.screen === 'prepare') renderChapters(); })
        .catch(() => { /* the rows say "no waveform"; ▶ will retry */ });
    });
  }

  function undone(res) { if (res) App.toast('Undone.'); }

  async function doBreak(ch, ci, s, ri, btn) {
    const n = App.chapters.length;
    const res = await chapterEdit(btn, () => Api.breakChapter(ch.id, { sentenceId: s.id }), true);
    if (!res) return;
    openChapters.add(ch.id);
    openChapters.add(res.second.id);
    flashId = res.second.id;
    renderChapters();
    App.toast(`Chapter ${ci + 1} divided — Chapter ${ci + 2} starts at its sentence ${ri + 1}. ${n + 1} chapters now.`, false, {
      undo: async () => {
        const r = await chapterEdit(null, () => Api.mergeChapterNext(ch.id, { undo: true }), true);
        undone(r);
      },
    });
  }

  async function doMergeChapters(ch, ci, btn) {
    const n = App.chapters.length;
    const res = await chapterEdit(btn, () => Api.mergeChapterNext(ch.id), true);
    if (!res) return;
    openChapters.add(res.merged.id);
    flashId = res.merged.id;
    renderChapters();
    const back = res.boundarySentenceId;
    App.toast(`Chapters ${ci + 1} and ${ci + 2} merged. ${n - 1} chapters now.`, false, back ? {
      undo: async () => {
        const r = await chapterEdit(null, () => Api.breakChapter(res.merged.id, {
          sentenceId: back, firstTitle: res.firstTitle, title: res.secondTitle, undo: true,
        }), true);
        undone(r);
      },
    } : null);
  }

  async function doTitle(ch, ci, raw, btn) {
    const val = (raw || '').trim();
    if (val === (ch.title || '')) { pending = null; renderChapters(); return; }
    const res = await chapterEdit(btn, () => Api.setChapterTitle(ch.id, val || null), false);
    if (!res) return;
    const prev = res.previousTitle == null ? null : res.previousTitle;
    App.toast(val ? `Chapter ${ci + 1} titled “${val}”.` : 'Title removed.', false, {
      undo: async () => {
        const r = await chapterEdit(null, () => Api.setChapterTitle(ch.id, prev, true), false);
        undone(r);
      },
    });
  }

  function renderChapters() {
    chBox.innerHTML = '';
    chBox.classList.toggle('show-gaps', gapsPinned);
    const n = App.chapters.length;
    App.chapters.forEach((ch, ci) => {
      const kids = App.sentencesOf(ch.id);
      const done = kids.filter((s) => s.done).length;
      const isOpen = openChapters.has(ch.id);
      const last = ci === n - 1;

      const chap = document.createElement('div');
      chap.className = 'chap' + (isOpen ? ' open' : '') + (flashId === ch.id ? ' flash' : '');
      chap.innerHTML = '<div class="chead">'
        + `<button class="ch-toggle" type="button" data-a="toggle" aria-expanded="${isOpen}"><span class="caret">▸</span>`
        + `<span class="nm">Chapter ${ci + 1}</span>${ch.title ? '<span class="ttl">' + esc(ch.title) + '</span>' : ''}</button>`
        + `<span class="st num">${kids.length} sentences · ${done} done · ${Fmt.clock(ch.endMs - ch.startMs)}</span>`
        + '<span class="ch-acts"><button class="mini" type="button" data-a="rename">✎ Title</button>'
        + (last ? '' : '<button class="mini" type="button" data-a="mergech">⇣ Merge with next chapter</button>')
        + '</span></div><div class="ch-extra"></div>';

      const extra = chap.querySelector('.ch-extra');
      const p = pending && pending.ch === ch.id ? pending : null;
      if (p && p.kind === 'rename') {
        extra.innerHTML = '<div class="confirm"><b class="h">Title for Chapter ' + (ci + 1) + '</b>'
          + '<div class="row-actions" style="margin-top:.2rem"><input type="text" class="js-title-in" placeholder="e.g. Første del" style="flex:1 1 180px">'
          + '<button class="btn-go" type="button" data-x="rn-ok">Save</button>'
          + (ch.title ? '<button class="mini" type="button" data-x="rn-clear">Remove title</button>' : '')
          + '<button class="mini" type="button" data-x="cancel">Cancel</button></div>'
          + '<div class="quiet" style="font-size:.78rem;margin-top:.45rem">The number stays automatic (“Chapter ' + (ci + 1)
          + '”) and renumbers with breaks; the title travels with the chapter. Shown in Study’s top bar and in Explore.</div></div>';
      } else if (p && p.kind === 'mergech' && !last) {
        const nx = App.chapters[ci + 1];
        const total = kids.length + App.sentencesOf(nx.id).length;
        const keep = ch.title || nx.title;
        extra.innerHTML = '<div class="confirm"><b class="h">Merge Chapter ' + (ci + 1) + ' with Chapter ' + (ci + 2) + '?</b><ul>'
          + '<li>One chapter of <b>' + total + ' sentences</b> · ' + Fmt.clock(nx.endMs - ch.startMs) + '</li>'
          + (ci + 3 <= n ? '<li>Chapters ' + (ci + 3) + '–' + n + ' become ' + (ci + 2) + '–' + (n - 1) + '.</li>' : '')
          + (keep ? '<li>Keeps the title “' + esc(keep) + '”.</li>' : '')
          + '<li>Sentences and progress are untouched — only the chapter boundary goes.</li></ul>'
          + '<div class="acts"><button class="btn-go" type="button" data-x="mc-ok">Merge chapters</button>'
          + '<button class="mini" type="button" data-x="cancel">Cancel</button></div></div>';
      }

      chap.querySelector('.chead').addEventListener('click', async (e) => {
        const t = e.target.closest('[data-a]');
        if (!t) return;
        const a = t.dataset.a;
        if (a === 'toggle') {
          if (openChapters.has(ch.id)) { openChapters.delete(ch.id); renderChapters(); return; }
          openChapters.add(ch.id);
          renderChapters();
          if (App.book.audioState === 'ready' && !ChapterAudio.peek(ch.id)) {
            try { await ChapterAudio.ensure(ch.id, App.userId); renderChapters(); }
            catch (err) { App.toast('Chapter audio unavailable: ' + err.message, true); }
          }
          return;
        }
        const same = pending && pending.kind === a && pending.ch === ch.id;
        pending = same ? null : { kind: a, ch: ch.id };
        renderChapters();
      });
      extra.addEventListener('click', (e) => {
        const t = e.target.closest('[data-x]');
        if (!t) return;
        const x = t.dataset.x;
        if (x === 'cancel') { pending = null; renderChapters(); return; }
        if (x === 'rn-ok') { doTitle(ch, ci, extra.querySelector('.js-title-in').value, t); return; }
        if (x === 'rn-clear') { doTitle(ch, ci, '', t); return; }
        if (x === 'mc-ok') doMergeChapters(ch, ci, t);
      });
      chBox.appendChild(chap);

      const inp = extra.querySelector('.js-title-in');
      if (inp) {
        inp.value = ch.title || '';
        inp.focus();
        inp.select();
        inp.addEventListener('keydown', (e) => {
          if (e.key === 'Enter') { e.preventDefault(); doTitle(ch, ci, inp.value, extra.querySelector('[data-x="rn-ok"]')); }
          if (e.key === 'Escape') { e.preventDefault(); pending = null; renderChapters(); }
        });
      }

      if (isOpen) {
        const body = document.createElement('div');
        body.className = 'prows';
        renderRows(body, ch, ci);
        chap.appendChild(body);
      }
    });
    flashId = null;
    if (!n) chBox.innerHTML = '<div class="empty">No boundaries yet — create a split config and analyse.</div>';
  }

  function render() {
    const book = App.book;
    if (!book) return;
    bookEl.textContent = book.title || book.originalFilename || '';
    renderConfigs();
    renderChapters();
    schedulePoll();
  }

  function schedulePoll() {
    clearTimeout(poll);
    const running = (App.book.configs || []).some((c) => c.analysisState === 'running');
    if (running) poll = setTimeout(async () => { await App.refreshBook(); Study.adopt(); render(); }, 2500);
  }

  function init() {
    const gt = document.getElementById('gapToggle');
    gt.addEventListener('click', () => {
      gapsPinned = !gapsPinned;
      gt.setAttribute('aria-pressed', String(gapsPinned));
      gt.textContent = gapsPinned ? '⤒ Hide chapter breaks' : '⤒ Show chapter breaks';
      renderChapters();
    });
    const upd = () => {
      document.getElementById('p1').textContent = r1.value;
      document.getElementById('p2').textContent = r2.value;
    };
    r1.addEventListener('input', upd);
    r2.addEventListener('input', upd);
    upd();
    document.getElementById('newCfgBtn').addEventListener('click', () => newPanel.classList.toggle('hidden'));
    document.getElementById('newCfgCancel').addEventListener('click', () => newPanel.classList.add('hidden'));
    document.getElementById('analyseBtn').addEventListener('click', async () => {
      const btn = document.getElementById('analyseBtn');
      btn.disabled = true;
      try {
        await Api.createConfig(App.book.id, {
          name: document.getElementById('newCfgName').value.trim() || 'Nytt oppsett',
          sentenceSilenceMs: +r1.value,
          chapterSilenceMs: +r2.value,
          analyze: true,
        });
        newPanel.classList.add('hidden');
        await reload();
        Library.refresh();
        App.toast('Analysing — the new config fills in when it finishes.');
      } catch (e) { App.toast(e.message, true); }
      btn.disabled = false;
    });
  }

  return { init, render, reset };
})();
