// prepare.js — split configs, and hearing the boundary you are editing.
//
// A config is thresholds plus boundary rows. Creating, duplicating,
// renaming, deleting or re-analysing one never touches the stored master
// and never touches progress, because progress is completed time ranges on
// the BOOK — which is also why a brand-new config opens with sentences
// already ticked. The one-line explainer at the top of the screen says so.
//
// Every destructive action confirms in-page. There is no confirm() here.

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

  function reset() { openChapters.clear(); }

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
        + ` &nbsp;·&nbsp; <span class="done-n">${Fmt.int(cfg.doneCount)} done</span></div>`
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
            + `<div class="warn hidden"><b>Re-analysing rebuilds every boundary in “${cfg.name}” — any manual `
            + 'splits and merges you made in THIS config are discarded.</b>'
            + '<div class="quiet" style="margin-top:.3rem">Other configs are untouched, and your completed time ranges '
            + 'stay on the book — the new boundaries inherit them straight away.</div>'
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
  }

  // ── the sentence rows ──────────────────────────────────────────────────
  function rowWave(entry, chapter, s) {
    if (!entry || !entry.peaks) return '<span class="nope"></span>';
    const from = s.startMs - chapter.startMs;
    return Wave.svg(entry.peaks, from, from + s.durationMs, 46);
  }

  function renderRows(body, chapter) {
    const entry = ChapterAudio.peek(chapter.id);
    const kids = App.sentencesOf(chapter.id);
    body.innerHTML = '';
    kids.forEach((s, ri) => {
      const el = document.createElement('div');
      el.className = 'prow' + (s.done ? ' done' : '');
      el.innerHTML =
        `<span class="pnum num">${ri + 1}</span>`
        + '<button class="sprev" type="button" title="play just this sentence">▶</button>'
        + `<span class="pw"><span class="ph"></span>${rowWave(entry, chapter, s)}</span>`
        + `<span class="ptime num">${Fmt.clock(s.startMs)} → ${Fmt.clock(s.endMs)} · ${Fmt.secs(s.durationMs)}</span>`
        + '<span class="pdone" title="covered by a completed time range">✓</span>'
        + '<span class="pacts"><button class="mini" data-a="split" type="button">✂ Split</button>'
        + '<button class="mini" data-a="merge" type="button">⇣ Merge</button></span>';

      const pw = el.querySelector('.pw');
      el.querySelector('.sprev').addEventListener('click', () => {
        const e = ChapterAudio.peek(chapter.id);
        if (!e) { Preview.play(s.id); return; }
        pw.classList.add('playing');
        pw.style.setProperty('--pdur', s.durationMs + 'ms');
        ChapterAudio.play(e, s.startMs - chapter.startMs, s.durationMs, {
          onEnd: () => pw.classList.remove('playing'),
        });
      });

      el.querySelector('.pacts').addEventListener('click', async (e) => {
        const b = e.target.closest('button');
        if (!b) return;
        if (b.dataset.a === 'merge') {
          const next = kids[ri + 1];
          if (!next) { App.toast('Nothing after this one in this chapter.'); return; }
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

  function renderChapters() {
    chBox.innerHTML = '';
    App.chapters.forEach((ch, ci) => {
      const kids = App.sentencesOf(ch.id);
      const done = kids.filter((s) => s.done).length;
      const isOpen = openChapters.has(ch.id);

      const row = document.createElement('button');
      row.type = 'button';
      row.className = 'chapter-row';
      row.setAttribute('aria-expanded', String(isOpen));
      row.innerHTML = '<span class="caret">▸</span><span class="nm"></span>'
        + `<span class="st num">${kids.length} sentences · ${done} done · ${Fmt.clock(ch.endMs - ch.startMs)}</span>`;
      row.querySelector('.nm').textContent = `Chapter ${ci + 1}`;

      const body = document.createElement('div');
      body.className = 'prows' + (isOpen ? '' : ' hidden');

      row.addEventListener('click', async () => {
        if (openChapters.has(ch.id)) { openChapters.delete(ch.id); render(); return; }
        openChapters.add(ch.id);
        render();
        if (App.book.audioState === 'ready' && !ChapterAudio.peek(ch.id)) {
          try { await ChapterAudio.ensure(ch.id, App.userId); render(); }
          catch (e) { App.toast('Chapter audio unavailable: ' + e.message, true); }
        }
      });

      if (isOpen) renderRows(body, ch);

      chBox.appendChild(row);
      chBox.appendChild(body);
    });
    if (!App.chapters.length) chBox.innerHTML = '<div class="empty">No boundaries yet — create a split config and analyse.</div>';
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
        App.toast('Analysing — the new config fills in when it finishes.');
      } catch (e) { App.toast(e.message, true); }
      btn.disabled = false;
    });
  }

  return { init, render, reset };
})();
