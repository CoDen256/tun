// library.js — the shelf, and the only place that writes audio to the server.
//
// Upload is chunked and resumable (design.md §9): the browser offers the
// file, the server answers how much of it it already has, and the browser
// sends the rest in slices of the size the server asked for. Re-offering a
// file after a dead tab therefore starts where it stopped, not at zero.
//
// Removed with this change: the time-range selector and the client-side
// decode/VAD segmentation it fed (task 8.3). Nothing in this file decodes
// audio; the book is bytes on their way to the server.

const Library = (() => {
  'use strict';

  const list = document.getElementById('bookList');
  const drop = document.getElementById('dropZone');
  const input = document.getElementById('fileInput');
  const box = document.getElementById('uplBox');
  const nameEl = document.getElementById('uplName');
  const bytesEl = document.getElementById('uplBytes');
  const barEl = document.getElementById('uplBar');
  const stateEl = document.getElementById('uplState');
  const cancelBtn = document.getElementById('uplCancel');

  let upload = null;          // {id, file, sent, size, cancelled}
  let poll = 0;

  // ── the determinate "working" states ──────────────────────────────────
  // The server exposes no percentage for a transcode or an analysis — both
  // are one ffmpeg pass with no progress channel. So this estimates from
  // the work's own size (bytes to transcode, playing time to scan), and
  // says it is an estimate; it never reaches 100% on a guess — the real
  // state change does that.
  //
  // The clock it estimates against is the server's own `since` for the
  // CURRENT operation, not when this page first laid eyes on the book. The
  // first version kept one start time per book, so a book that transcoded
  // minutes ago showed "97% · ~0 s left" the instant a LATER analysis
  // began. If the server gives no `since` — or the browser clock disagrees
  // with the server's by more than the work could plausibly take — we say
  // so and print no number at all. An honest "analysing…" beats a
  // confident lie. Tier-2 decision, recorded in DECISIONS-MADE.md.
  const WORK = {
    transcoding: { label: 'transcoding', since: (b) => b.audioStateSince },
    uploading: { label: 'uploading', since: (b) => b.audioStateSince },
    analysing: { label: 'analysing', since: (b) => b.analysisSince },
  };

  function estimateSec(book, kind) {
    if (kind === 'transcoding') {
      return Math.min(1800, Math.max(8, (book.fileSizeBytes || 50e6) / (8 * 1024 * 1024)));
    }
    if (kind === 'analysing') {
      return Math.min(1200, Math.max(8, (book.durationMs || 600000) / 1000 / 60));
    }
    return 0;  // an upload's bytes are counted by the uploader, not guessed here
  }

  function working(book) {
    if (book.audioState === 'transcoding') return 'transcoding';
    if (book.audioState === 'uploading') return 'uploading';
    if (book.analysisState === 'running') return 'analysing';
    return null;
  }

  function progressOf(book, kind) {
    const label = WORK[kind].label;
    const sinceTxt = WORK[kind].since(book);
    const est = estimateSec(book, kind);
    const t0 = sinceTxt ? Date.parse(sinceTxt) : NaN;
    if (!est || !Number.isFinite(t0)) return { pct: null, text: `${label}…` };
    const elapsed = (Date.now() - t0) / 1000;
    // Negative means the browser clock is behind the server's; far past the
    // estimate means the operation is simply taking longer than guessed.
    // Both make a percentage dishonest.
    if (elapsed < 0 || elapsed > est * 3) return { pct: null, text: `${label}…` };
    const pct = Math.min(97, Math.round((elapsed / est) * 100));
    const left = Math.max(0, Math.round(est - elapsed));
    const leftTxt = left > 90 ? `~${Math.ceil(left / 60)} min left` : `~${left} s left`;
    return { pct, text: `${label} — ${pct}% (estimated) · ${leftTxt}` };
  }

  // ── rendering ─────────────────────────────────────────────────────────
  function cursorLine(b) {
    if (b.cursorSentenceIndex == null) return '';
    const ch = b.cursorChapterIndex == null ? '' : `Chapter ${b.cursorChapterIndex + 1} · `;
    return `▸ ${ch}sentence ${b.cursorSentenceIndex + 1} of ${Fmt.int(b.sentenceCount)}`;
  }

  function render() {
    const books = App.state.books;
    list.innerHTML = '';
    if (!books.length) {
      list.innerHTML = '<div class="empty">No books yet. Drop an audiobook below — it is transcoded once and then lives on the server.</div>';
      return;
    }
    for (const b of books) {
      const pct = b.sentenceCount ? Math.round((100 * b.doneCount) / b.sentenceCount) : 0;
      const el = document.createElement('div');
      el.className = 'book';

      const busy = working(b);
      const prog = busy ? progressOf(b, busy) : null;

      const main = document.createElement('button');
      main.type = 'button';
      main.className = 'book-main';
      main.innerHTML =
        '<div class="book-title"></div>' +
        `<div class="book-meta num">${Fmt.long(b.durationMs)} · ${b.chapterCount} chapter${b.chapterCount === 1 ? '' : 's'} · ${Fmt.int(b.sentenceCount)} sentences${b.configCount > 1 ? ` · ${b.configCount} split configs` : ''}</div>` +
        `<div class="bar" style="margin-top:.6rem"><i style="width:${pct}%"></i></div>` +
        (busy
          ? `<div class="book-cursor"><span class="chip"><span class="dot pulse"></span> <span class="js-busy">${prog.text}</span></span></div>`
          : `<div class="book-cursor num">${cursorLine(b)}</div>`);
      main.querySelector('.book-title').textContent = b.title || b.originalFilename || '(unnamed)';
      if (b.audioState !== 'ready' && !busy) {
        const warn = document.createElement('div');
        warn.className = 'book-cursor quiet';
        warn.textContent = b.audioState === 'failed'
          ? 'transcode failed: ' + (b.audioError || 'unknown')
          : 'no stored audio — playback and analysis are unavailable for this book';
        main.appendChild(warn);
      } else if (b.analysisState === 'failed') {
        // The automatic analysis after an upload can fail too, and a book
        // left reading "0 chapters" with no reason given is the stuck-
        // forever state this row must never show.
        const warn = document.createElement('div');
        warn.className = 'book-cursor quiet';
        warn.textContent = 'analysis failed: ' + (b.analysisError || 'unknown')
          + ' — adjust the thresholds in Prepare and re-analyse';
        main.appendChild(warn);
      }
      main.addEventListener('click', () => open(b.id, 'study'));

      const right = document.createElement('div');
      right.className = 'book-right';
      right.innerHTML = `<div class="pct num">${pct}%</div><div>${b.doneCount}/${Fmt.int(b.sentenceCount)} done</div>`;

      const acts = document.createElement('div');
      acts.className = 'row-actions';
      acts.style.gridColumn = '1 / -1';
      acts.innerHTML =
        '<button class="mini go" data-a="explore" type="button">Explore</button>' +
        '<button class="mini" data-a="prepare" type="button">Prepare / split</button>' +
        '<button class="mini" data-a="rename" type="button">Rename</button>' +
        '<button class="mini" data-a="delete" type="button">Delete</button>';

      const extra = document.createElement('div');
      extra.className = 'cfg-extra hidden';
      extra.style.gridColumn = '1 / -1';

      acts.addEventListener('click', async (e) => {
        const btn = e.target.closest('button');
        if (!btn) return;
        const a = btn.dataset.a;
        if (a === 'explore' || a === 'prepare') { open(b.id, a); return; }
        if (a === 'rename') {
          extra.classList.remove('hidden');
          extra.innerHTML =
            '<div class="box" style="margin-top:.7rem;padding:.85rem .9rem;border:1px dashed var(--line-strong);border-radius:var(--radius-sm)">' +
            '<div class="quiet" style="font-size:.82rem;margin-bottom:.4rem">Rename this book</div>' +
            '<div class="row-actions" style="margin-top:0"><input type="text" class="nm-in">' +
            '<button class="mini go" data-x="ok" type="button">Save</button>' +
            '<button class="mini" data-x="no" type="button">Cancel</button></div></div>';
          const inp = extra.querySelector('.nm-in');
          inp.value = b.title || b.originalFilename || '';
          inp.focus();
          extra.onclick = async (ev) => {
            const t = ev.target.closest('button');
            if (!t) return;
            if (t.dataset.x === 'ok') {
              try { await Api.renameMedia(b.id, inp.value.trim()); await refresh(); }
              catch (err) { App.toast(err.message, true); }
            } else { extra.classList.add('hidden'); extra.innerHTML = ''; }
          };
          return;
        }
        if (a === 'delete') {
          extra.classList.remove('hidden');
          extra.innerHTML =
            '<div class="warn" style="margin-top:.6rem"><b>Delete this book?</b>' +
            '<div class="quiet" style="margin-top:.3rem">Its stored Opus master, every split config and all of your progress on it go with it. This cannot be undone.</div>' +
            '<div class="acts"><button class="danger" data-x="go" type="button">Delete the book</button>' +
            '<button class="mini" data-x="no" type="button">Cancel</button></div></div>';
          extra.onclick = async (ev) => {
            const t = ev.target.closest('button');
            if (!t) return;
            if (t.dataset.x === 'go') {
              try {
                await Api.deleteMedia(b.id);
                if (App.state.book && App.state.book.id === b.id) { App.state.book = null; ChapterAudio.clear(); }
                await refresh();
              } catch (err) { App.toast(err.message, true); }
            } else { extra.classList.add('hidden'); extra.innerHTML = ''; }
          };
        }
      });

      el.appendChild(main);
      el.appendChild(right);
      el.appendChild(acts);
      el.appendChild(extra);
      list.appendChild(el);
    }
  }

  async function open(id, goTo) {
    try { await App.openBook(id, goTo); }
    catch (e) { App.toast('Could not open that book: ' + e.message, true); }
  }

  async function refresh() {
    try {
      App.state.books = await Api.listMedia(App.userId);
    } catch (e) {
      App.state.books = [];
      App.toast('Library unavailable: ' + e.message, true);
    }
    render();
    schedulePoll();
  }

  function schedulePoll() {
    clearTimeout(poll);
    if (App.state.books.some(working)) poll = setTimeout(refresh, 2500);
  }

  // `refresh` — and so `schedulePoll` — is also called whenever the Library
  // is shown and whenever another screen starts work on a book (app.js,
  // prepare.js). The poll loop used to start only for a book that was
  // already working the last time THIS screen fetched, so an analysis begun
  // from Prepare normally finished before the Library ever polled.

  // ── upload ────────────────────────────────────────────────────────────
  function showUpload(on) { box.classList.toggle('hidden', !on); }

  function paintUpload(sent, size, text) {
    barEl.style.width = (size ? (100 * sent) / size : 0).toFixed(1) + '%';
    bytesEl.textContent = `${Fmt.bytes(sent)} / ${Fmt.bytes(size)} · ${(size ? (100 * sent) / size : 0).toFixed(1)}%`;
    stateEl.textContent = text || '';
  }

  async function startUpload(file) {
    if (upload) { App.toast('An upload is already running.'); return; }
    showUpload(true);
    nameEl.textContent = file.name;
    paintUpload(0, file.size, 'asking the server what it already has…');
    let begin;
    try {
      begin = await Api.startUpload(App.userId, file.name, file.size);
    } catch (e) { App.toast('Upload refused: ' + e.message, true); showUpload(false); return; }

    if (begin.alreadyExists) {
      showUpload(false);
      App.toast('That file is already on the server — opening it.');
      await refresh();
      open(begin.mediaId, 'study');
      return;
    }

    upload = { id: begin.uploadId, file, sent: begin.receivedBytes || 0, size: file.size, cancelled: false };
    const chunk = begin.chunkBytes || 8 * 1024 * 1024;
    if (upload.sent > 0) App.toast(`Resuming at ${Fmt.bytes(upload.sent)} — the server already had that much.`);

    try {
      while (upload.sent < upload.size) {
        if (upload.cancelled) return;
        const slice = file.slice(upload.sent, Math.min(upload.size, upload.sent + chunk));
        paintUpload(upload.sent, upload.size, 'sending…');
        try {
          const out = await Api.putSlice(upload.id, upload.sent, slice);
          upload.sent = out.receivedBytes;
        } catch (e) {
          if (e.conflict && typeof e.receivedBytes === 'number') { upload.sent = e.receivedBytes; continue; }
          throw e;
        }
        paintUpload(upload.sent, upload.size, 'sending…');
      }
      paintUpload(upload.sent, upload.size, 'transcoding to mono Opus…');
      await Api.completeUpload(upload.id);
      upload = null;
      showUpload(false);
      App.toast('Upload complete — transcoding, then analysing, on the server.');
      await refresh();
    } catch (e) {
      if (upload && upload.cancelled) return;
      upload = null;
      stateEl.textContent = 'failed: ' + e.message;
      App.toast('Upload failed: ' + e.message, true);
    }
  }

  function init() {
    drop.addEventListener('click', () => input.click());
    input.addEventListener('change', () => {
      if (input.files && input.files[0]) startUpload(input.files[0]);
      input.value = '';
    });
    ['dragenter', 'dragover'].forEach((ev) => drop.addEventListener(ev, (e) => {
      e.preventDefault(); drop.classList.add('over');
    }));
    ['dragleave', 'drop'].forEach((ev) => drop.addEventListener(ev, (e) => {
      e.preventDefault(); drop.classList.remove('over');
    }));
    drop.addEventListener('drop', (e) => {
      const f = e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files[0];
      if (f) startUpload(f);
    });
    // The YouTube extractor survives this rewrite: /api/v1/youtube-extract
    // hands back a WAV, and that WAV goes through the same chunked upload as
    // a dropped file. Nothing else in the old client-side path survives.
    const ytUrl = document.getElementById('ytUrl');
    const ytBtn = document.getElementById('ytBtn');
    ytBtn.addEventListener('click', async () => {
      const url = ytUrl.value.trim();
      if (!url) { App.toast('Paste a video URL first.'); return; }
      ytBtn.disabled = true;
      const prev = ytBtn.textContent;
      ytBtn.textContent = 'extracting…';
      try {
        const res = await fetch(API_BASE + '/api/v1/youtube-extract', {
          method: 'POST', headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ url }), signal: AbortSignal.timeout(620000),
        });
        if (!res.ok) throw new Error(((await res.json().catch(() => ({}))).error) || ('HTTP ' + res.status));
        const blob = await res.blob();
        const name = 'youtube-' + (url.match(/[?&]v=([\w-]+)/) || [])[1] + '.wav';
        ytUrl.value = '';
        await startUpload(new File([blob], name, { type: 'audio/wav' }));
      } catch (e) { App.toast('Extraction failed: ' + e.message, true); }
      ytBtn.disabled = false;
      ytBtn.textContent = prev;
    });

    cancelBtn.addEventListener('click', async () => {
      if (!upload) { showUpload(false); return; }
      upload.cancelled = true;
      const id = upload.id;
      upload = null;
      showUpload(false);
      try { await Api.abandonUpload(id); } catch (e) { /* the sweeper will get it */ }
      App.toast('Upload cancelled.');
    });
  }

  return { init, refresh, render };
})();
