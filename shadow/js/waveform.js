// waveform.js — peaks in, SVG out.
//
// Tier-2 decision (design.md "waveform rendering detail"): every waveform on
// this page is drawn from ONE peak envelope per chapter, computed once when
// the chapter's chunk is downloaded. A peak is the maximum absolute sample
// over PEAK_MS of audio, which is why Study's single sentence, Prepare's
// per-row strips and the split scrubber can all be real pictures of the real
// audio without a single extra request. Nothing here decodes on demand.

const Wave = (() => {
  'use strict';

  const PEAK_MS = 10;       // one peak per 10 ms — 400 peaks for a 4 s sentence
  const VIEW_W = 1000, VIEW_H = 120;

  /** Float32Array of per-PEAK_MS maxima for a decoded buffer. */
  function peaksFromBuffer(buffer, peakMs) {
    const step = Math.max(1, Math.round(buffer.sampleRate * (peakMs || PEAK_MS) / 1000));
    const data = buffer.getChannelData(0);
    const n = Math.ceil(data.length / step);
    const out = new Float32Array(n);
    let max = 0;
    for (let i = 0; i < n; i++) {
      const a = i * step, b = Math.min(data.length, a + step);
      let pk = 0;
      for (let k = a; k < b; k++) { const v = data[k] < 0 ? -data[k] : data[k]; if (v > pk) pk = v; }
      out[i] = pk;
      if (pk > max) max = pk;
    }
    if (max > 0) for (let i = 0; i < n; i++) out[i] /= max;   // normalise to the chapter
    return out;
  }

  /**
   * SVG for peaks[fromMs..toMs] of a peak array that starts at 0 ms.
   * `bars` controls density; returns '' when there are no peaks to draw.
   */
  function svg(peaks, fromMs, toMs, bars, peakMs, fill) {
    if (!peaks || !peaks.length) return '';
    const pm = peakMs || PEAK_MS;
    const i0 = Math.max(0, Math.floor(fromMs / pm));
    const i1 = Math.min(peaks.length, Math.ceil(toMs / pm));
    const span = i1 - i0;
    if (span <= 0) return '';
    const n = Math.max(8, Math.min(bars || 180, span));
    const bw = (VIEW_W / n) * 0.62;
    let out = '';
    for (let i = 0; i < n; i++) {
      const a = i0 + Math.floor((i * span) / n), b = i0 + Math.floor(((i + 1) * span) / n);
      let pk = 0;
      for (let k = a; k < Math.max(b, a + 1); k++) if (peaks[k] > pk) pk = peaks[k];
      const hh = Math.max(2, pk * (VIEW_H - 12));
      const x = (i * VIEW_W) / n, y = (VIEW_H - hh) / 2;
      out += `<rect x="${x.toFixed(2)}" y="${y.toFixed(2)}" width="${bw.toFixed(2)}" `
           + `height="${hh.toFixed(2)}" rx="${(bw / 2).toFixed(2)}" fill="${fill || 'var(--wave)'}"/>`;
    }
    return `<svg viewBox="0 0 ${VIEW_W} ${VIEW_H}" preserveAspectRatio="none" aria-hidden="true">${out}</svg>`;
  }

  /**
   * SVG straight from a list of 0..1 magnitudes — the lane drawing that has
   * no chapter peak array behind it: a decoded recording, or the live
   * envelope accumulating while the microphone is open. Same viewBox and
   * same bar geometry as svg(), so the take lane looks like the sentence
   * lane and the two compare bar for bar.
   */
  function barsSvg(values, fill, bars) {
    const src = values || [];
    const n = Math.max(8, Math.min(bars || 180, Math.max(1, src.length)));
    const bw = (VIEW_W / n) * 0.62;
    let max = 0;
    for (let i = 0; i < src.length; i++) if (src[i] > max) max = src[i];
    const norm = max > 0 ? 1 / max : 0;
    let out = '';
    for (let i = 0; i < n; i++) {
      const a = Math.floor((i * src.length) / n), b = Math.floor(((i + 1) * src.length) / n);
      let pk = 0;
      for (let k = a; k < Math.max(b, a + 1); k++) if (src[k] > pk) pk = src[k];
      const hh = Math.max(2, pk * norm * (VIEW_H - 12));
      const x = (i * VIEW_W) / n, y = (VIEW_H - hh) / 2;
      out += `<rect x="${x.toFixed(2)}" y="${y.toFixed(2)}" width="${bw.toFixed(2)}" `
           + `height="${hh.toFixed(2)}" rx="${(bw / 2).toFixed(2)}" fill="${fill || 'var(--wave)'}"/>`;
    }
    return `<svg viewBox="0 0 ${VIEW_W} ${VIEW_H}" preserveAspectRatio="none" aria-hidden="true">${out}</svg>`;
  }

  /** Honest placeholder — this page never draws a waveform it does not have. */
  function placeholder(message) {
    return `<div class="nowave">${message}</div>`;
  }

  return { PEAK_MS, peaksFromBuffer, svg, barsSvg, placeholder };
})();

// ── pitch contours, for Compare (task 5.4) ───────────────────────────────
// Both curves are drawn against each clip's OWN duration, so the shapes are
// comparable without time-aligning two takes of different length.
const Pitch = (() => {
  'use strict';
  const FLOOR = 60, CEIL = 400, W = 600, H = 110;

  /** WAV bytes in, {pitch:[{t_ms,f0}]} out, via shadow's /analyze-praat proxy. */
  async function analyse(blob) {
    const form = new FormData();
    form.append('file', blob, 'clip.wav');
    form.append('config', JSON.stringify({}));
    const res = await fetch(API_BASE + '/analyze-praat', {
      method: 'POST', body: form, signal: AbortSignal.timeout(40000),
    });
    const data = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(data.error || ('HTTP ' + res.status));
    return data;
  }

  function path(result, durationMs) {
    if (!result || !durationMs) return '';
    let d = '', drawing = false;
    for (const row of result.pitch || []) {
      if (row.f0 == null) { drawing = false; continue; }
      const frac = row.t_ms / durationMs;
      if (frac < 0 || frac > 1) continue;
      const x = frac * W;
      const f0 = Math.max(FLOOR, Math.min(CEIL, row.f0));
      const y = H * (1 - (f0 - FLOOR) / (CEIL - FLOOR));
      d += (drawing ? ' L' : ' M') + x.toFixed(1) + ',' + y.toFixed(1);
      drawing = true;
    }
    return d.trim();
  }

  /**
   * ONE contour onto ONE lane's overlay (task 3.4). There is no shared
   * contour panel any more: the reference is drawn over the sentence lane
   * and the take's over the take lane, each against its own duration, in
   * the lane's own hue so the two stay distinguishable in both themes.
   */
  function renderOne(svgEl, result, durationMs, stroke, dashed) {
    if (!svgEl) return false;
    const d = path(result, durationMs);
    svgEl.innerHTML = d
      ? `<path d="${d}" fill="none" stroke="${stroke}" stroke-width="2.5" `
        + `stroke-linejoin="round" stroke-linecap="round"${dashed ? ' stroke-dasharray="5 4"' : ''}/>`
      : '';
    return !!d;
  }

  function clear(svgEl) { if (svgEl) svgEl.innerHTML = ''; }

  return { analyse, path, renderOne, clear };
})();

// ── WAV encoding, needed only to hand a recorded take to Praat ────────────
// (the book's own audio arrives as WAV from the server already).
function encodeWavBlob(samples, sr) {
  const buf = new ArrayBuffer(44 + samples.length * 2);
  const v = new DataView(buf);
  const w16 = (o, x) => v.setInt16(o, x, true);
  const w32 = (o, x) => v.setUint32(o, x, true);
  const wr = (o, s) => { for (let i = 0; i < s.length; i++) v.setUint8(o + i, s.charCodeAt(i)); };
  wr(0, 'RIFF'); w32(4, 36 + samples.length * 2); wr(8, 'WAVE');
  wr(12, 'fmt '); w32(16, 16); w16(20, 1); w16(22, 1);
  w32(24, sr); w32(28, sr * 2); w16(32, 2); w16(34, 16);
  wr(36, 'data'); w32(40, samples.length * 2);
  let o = 44;
  for (let i = 0; i < samples.length; i++) {
    v.setInt16(o, Math.max(-32768, Math.min(32767, samples[i] * 32768)), true);
    o += 2;
  }
  return new Blob([buf], { type: 'audio/wav' });
}

function pickRecorderMime() {
  for (const m of ['audio/webm;codecs=opus', 'audio/webm', 'audio/ogg;codecs=opus', '']) {
    if (!m || MediaRecorder.isTypeSupported(m)) return m;
  }
  return '';
}
