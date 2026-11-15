// api.js — the only place that knows the server's URL shapes, plus the one
// piece of shared state the four screens read (`App.book`).
//
// Everything goes to API_BASE (shadow's own prefix). PHONEXA_BASE is used
// exactly once, in study.js, for the Formant Lab window a human follows.
//
// `POST /media/find-or-create` and `POST /media/<id>/segment` are gone with
// the browser-side segmentation they served; nothing here calls them.

const Api = (() => {
  'use strict';

  const B = () => API_BASE + '/api/v1/shadowing';

  async function j(url, opts) {
    const res = await fetch(url, opts);
    let data = null;
    try { data = await res.json(); } catch (e) { data = null; }
    if (!res.ok) throw new Error((data && data.error) || ('HTTP ' + res.status));
    return data;
  }
  const json = (body) => ({
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });

  return {
    // ── books
    listMedia: (userId) => j(`${B()}/media?userId=${userId}`),
    getMedia: (id, userId) => j(`${B()}/media/${id}?userId=${userId}`),
    renameMedia: (id, title) => j(`${B()}/media/${id}`, { method: 'PATCH', ...json({ title }) }),
    deleteMedia: (id) => j(`${B()}/media/${id}`, { method: 'DELETE' }),

    // ── resumable upload (design.md §9)
    startUpload: (userId, filename, sizeBytes) =>
      j(`${B()}/uploads`, { method: 'POST', ...json({ userId, filename, sizeBytes }) }),
    getUpload: (id) => j(`${B()}/uploads/${id}`),
    putSlice: async (id, offset, blob) => {
      const res = await fetch(`${B()}/uploads/${id}?offset=${offset}`, {
        method: 'PUT', headers: { 'Content-Type': 'application/octet-stream' }, body: blob,
      });
      const data = await res.json().catch(() => ({}));
      if (res.status === 409) { const e = new Error('offset mismatch'); e.receivedBytes = data.receivedBytes; e.conflict = true; throw e; }
      if (!res.ok) throw new Error(data.error || ('HTTP ' + res.status));
      return data;
    },
    completeUpload: (id) => j(`${B()}/uploads/${id}/complete`, { method: 'POST' }),
    abandonUpload: (id) => j(`${B()}/uploads/${id}`, { method: 'DELETE' }),

    // ── split configs
    createConfig: (mediaId, body) => j(`${B()}/media/${mediaId}/configs`, { method: 'POST', ...json(body) }),
    patchConfig: (id, body) => j(`${B()}/configs/${id}`, { method: 'PATCH', ...json(body) }),
    duplicateConfig: (id) => j(`${B()}/configs/${id}/duplicate`, { method: 'POST' }),
    deleteConfig: (id) => j(`${B()}/configs/${id}`, { method: 'DELETE' }),
    analyzeConfig: (id, body) => j(`${B()}/configs/${id}/analyze`, { method: 'POST', ...json(body || {}) }),

    // ── chapters and segments
    chapterManifest: (segId, userId) => j(`${B()}/chapters/${segId}/manifest?userId=${userId}`),
    chunkUrl: (manifest) => API_BASE + manifest.chunkUrl,
    segmentAudioUrl: (segId, wav) => `${B()}/segments/${segId}/audio` + (wav ? '?format=wav' : ''),
    patchSegmentText: (segId, text) => j(`${B()}/segments/${segId}`, { method: 'PATCH', ...json({ text }) }),
    splitSegment: (segId, atMs) => j(`${B()}/segments/${segId}/split`, { method: 'POST', ...json({ atMs }) }),
    mergeSegments: (a, b) => j(`${B()}/segments/merge`, { method: 'POST', ...json({ segmentIdA: a, segmentIdB: b }) }),

    // ── progress and cursor. ONE endpoint serves single and bulk marking.
    postProgress: (mediaId, body) => j(`${B()}/media/${mediaId}/progress`, { method: 'POST', ...json(body) }),
    putCursor: (mediaId, body) => j(`${B()}/media/${mediaId}/cursor`, { method: 'PUT', ...json(body) }),
  };
})();

// ── small shared formatters ───────────────────────────────────────────────
const Fmt = {
  int(n) { return String(n).replace(/\B(?=(\d{3})+(?!\d))/g, ' '); },
  clock(ms) {
    const s = Math.max(0, Math.round((ms || 0) / 1000));
    const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60), x = s % 60;
    const pad = (v) => (v < 10 ? '0' + v : String(v));
    return h ? `${h}:${pad(m)}:${pad(x)}` : `${m}:${pad(x)}`;
  },
  long(ms) {
    const s = Math.round((ms || 0) / 1000);
    const h = Math.floor(s / 3600), m = Math.round((s % 3600) / 60);
    return h ? `${h} t ${m < 10 ? '0' : ''}${m} min` : `${m} min`;
  },
  secs(ms) { return (Math.max(0, ms || 0) / 1000).toFixed(1) + ' s'; },
  bytes(n) {
    if (n >= 1024 * 1024 * 1024) return (n / 1073741824).toFixed(2) + ' GB';
    if (n >= 1024 * 1024) return (n / 1048576).toFixed(1) + ' MB';
    if (n >= 1024) return (n / 1024).toFixed(0) + ' kB';
    return n + ' B';
  },
};
