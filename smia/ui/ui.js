// ui/ui.js — vanilla JS, no build step (matches phonexa's plain HTML/JS
// pattern). There is no token to paste since unified-auth 4.5: the
// operator authenticates once at the gateway (Basic, username `operator`)
// and the browser attaches that credential to every same-origin request
// this page makes.

// Empty at the domain root (local dev); the mount prefix (e.g. "/smia")
// once reverse-proxied — set by app.py's ui_index() templating in
// index.html from the proxy's X-Forwarded-Prefix header (mirrors
// stabbur's ui.js exactly, D46).
const API_BASE = window.SMIA_PREFIX || "";

// One ready-to-send example body per kind, prefilled into the try-it form
// whenever the kind selector changes. /stt gets its own audio-upload/
// recording UI instead (see tryBodyAudio in index.html) — its request body
// is multipart audio, not JSON.
const EXAMPLE_BODIES = {
  inflections: { word: "hus", lang: "nb" },
  ipa: { text: "hus", lang: "nb" },
  tts: { text: "hus", lang: "nb" },
  translations: { text: "hus", from: "nb", to: "en" },
  examples: { text: "kalv", lang: "nb", limit: 3 },
};

// The in-browser MediaRecorder result, when the operator records instead
// of uploading a file — takes priority over the file input on submit.
let recordedAudioBlob = null;
let mediaRecorder = null;

// Kept as a function returning {} rather than deleted at ~15 call sites, so
// any future header is one edit. The credential itself is the browser's.
function authHeaders() {
  return {};
}

async function refreshAll() {
  const [providersResp, healthResp] = await Promise.all([
    fetch(`${API_BASE}/providers`, { headers: authHeaders() }),
    fetch(`${API_BASE}/health`, { headers: authHeaders() }),
  ]);
  const providers = await providersResp.json();
  const healthRows = await healthResp.json();

  // A bad/expired token (or any other non-2xx) returns {"error": "..."},
  // not the {kind: [provider, ...]} shape renderCatalog/health expect —
  // rendering that unchecked throws (names.join on a string) and takes
  // down the rest of refreshAll with it, including the try-it form's
  // provider list. Surface it plainly instead.
  if (!providersResp.ok || !healthResp.ok) {
    document.getElementById("catalog").innerHTML =
      `<tr><td colspan="2" class="bad">${providers.error || healthRows.error || "request failed"}</td></tr>`;
    document.getElementById("health").innerHTML = "";
    return;
  }

  renderCatalog(providers);
  renderHealth(healthRows);
  populateTryItSelectors(providers);
}

function renderCatalog(providers) {
  const el = document.getElementById("catalog");
  const countsByKind = providers.counts || {};
  el.innerHTML = Object.entries(providers)
    .filter(([kind]) => kind !== "counts")
    .map(([kind, names]) => {
      const counts = countsByKind[kind] || {};
      const cells = names.map((name) => {
        // Only table-backed providers carry a count (registry.py's `count`
        // source is opt-in per provider) — live/API/manual-link providers
        // have no entry here at all and render plainly, same as before.
        if (!(name in counts)) return name;
        const count = counts[name];
        return count === 0
          ? `<span class="provider-empty" title="configured but not yet imported">${name} (0)</span>`
          : `${name} (${count})`;
      });
      return `<tr><td>${kind}</td><td>${cells.join(", ") || "<span class=muted>none configured</span>"}</td></tr>`;
    })
    .join("");
}

function renderHealth(rows) {
  const el = document.getElementById("health");
  if (!rows.length) {
    el.innerHTML = `<tr><td colspan="6" class="muted">No requests yet</td></tr>`;
    return;
  }
  el.innerHTML = rows
    .map((r) => {
      const total = r.requestsCount || 1;
      const hitRate = ((r.hitCount / total) * 100).toFixed(0);
      const lastFail = r.lastFailureAt
        ? `<span class="bad" title="${r.lastFailureMessage || ""}">${r.lastFailureAt}</span>`
        : `<span class="muted">—</span>`;
      return `<tr>
        <td>${r.kind}</td><td>${r.provider}</td>
        <td>${r.requestsCount}</td><td>${hitRate}% (${r.hitCount}/${r.requestsCount})</td>
        <td class="ok">${r.lastSuccessAt || "—"}</td>
        <td>${lastFail}</td>
      </tr>`;
    })
    .join("");
}

// Rebuilds the kind/provider <option> lists from the current catalog
// without losing whatever the operator already had selected — refreshAll()
// runs after every try-it submission, and resetting the selectors each
// time made every submission feel like it forgot what you'd just picked.
function populateTryItSelectors(providers) {
  const kindSel = document.getElementById("tryKind");
  const prevKind = kindSel.value;
  const firstLoad = !kindSel.dataset.initialized;
  kindSel.dataset.initialized = "1";

  const kinds = Object.keys(providers).filter((k) => k !== "counts");
  kindSel.innerHTML = kinds.map((k) => `<option value="${k}">${k}</option>`).join("");
  if (kinds.includes(prevKind)) kindSel.value = prevKind;

  updateProviderSelector(providers);
  kindSel.onchange = () => {
    updateProviderSelector(providers);
    prefillBody(kindSel.value);
  };

  if (firstLoad) prefillBody(kindSel.value);
}

function updateProviderSelector(providers) {
  const kind = document.getElementById("tryKind").value;
  const provSel = document.getElementById("tryProvider");
  const prevProvider = provSel.value;
  const available = providers[kind] || [];
  provSel.innerHTML = available.map((p) => `<option value="${p}">${p}</option>`).join("");
  if (available.includes(prevProvider)) provSel.value = prevProvider;
}

function prefillBody(kind) {
  const isAudio = kind === "stt";
  document.getElementById("tryBodyJson").style.display = isAudio ? "none" : "block";
  document.getElementById("tryBodyAudio").style.display = isAudio ? "block" : "none";
  if (!isAudio) {
    document.getElementById("tryBody").value = JSON.stringify(EXAMPLE_BODIES[kind] || {}, null, 2);
  }
}

// ── /stt: file upload or in-browser microphone recording ────────────────

async function toggleRecording() {
  const btn = document.getElementById("tryRecordBtn");
  const status = document.getElementById("tryRecordStatus");

  if (mediaRecorder && mediaRecorder.state === "recording") {
    mediaRecorder.stop();
    return;
  }

  let stream;
  try {
    stream = await navigator.mediaDevices.getUserMedia({ audio: true });
  } catch (e) {
    status.textContent = `Microphone access failed: ${e.message}`;
    return;
  }

  const chunks = [];
  mediaRecorder = new MediaRecorder(stream);
  mediaRecorder.ondataavailable = (e) => chunks.push(e.data);
  mediaRecorder.onstop = () => {
    stream.getTracks().forEach((t) => t.stop());
    recordedAudioBlob = new Blob(chunks, { type: mediaRecorder.mimeType || "audio/webm" });
    document.getElementById("tryAudioFile").value = ""; // recording takes priority
    const preview = document.getElementById("tryAudioPreview");
    preview.src = URL.createObjectURL(recordedAudioBlob);
    preview.style.display = "block";
    btn.textContent = "● Record from microphone";
    btn.classList.remove("recording");
    status.textContent = "Recorded — ready to send";
  };

  mediaRecorder.start();
  btn.textContent = "■ Stop recording";
  btn.classList.add("recording");
  status.textContent = "Recording…";
}

document.getElementById("tryAudioFile")?.addEventListener("change", (e) => {
  recordedAudioBlob = null; // an explicit file pick overrides any earlier recording
  const file = e.target.files[0];
  if (!file) return;
  const preview = document.getElementById("tryAudioPreview");
  preview.src = URL.createObjectURL(file);
  preview.style.display = "block";
  document.getElementById("tryRecordStatus").textContent = "";
});

// ── /tts: inline play controls in the try-it result (smia-ui-tts-polish) ─
//
// The tts result is the same pretty-printed JSON, rendered one <div> per
// line. Every line carrying a `"sha256": "<64 hex>"` gets a control in a
// left gutter. The control is an empty element whose glyph is drawn by CSS
// ::before (and user-select:none), so selecting/copying the result yields
// clean JSON. States: loading (fetching GET /tts/{sha256}) → ready ▶ →
// playing ■ with a progress bar under the line → ready; a failed fetch
// shows ⚠ with the HTTP status and URL as its tooltip and cannot be played.
// At most one candidate plays at a time.

const escHtml = (s) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

function highlightJsonLine(line) {
  return escHtml(line)
    .replace(/^(\s*)("[^"]*")(:)/, '$1<span class="k">$2</span>$3')
    .replace(/(: )("(?:[^"\\]|\\.)*")/, '$1<span class="s">$2</span>')
    .replace(/(: )(true|false|null|-?\d[\d.eE+-]*)/, '$1<span class="n">$2</span>');
}

// Bumped on every new submission so late audio fetches from an earlier
// result never touch the current one.
let ttsRenderToken = 0;
let ttsObjectUrls = [];
let ttsPlaying = null; // { ln, btn, audio, prog, raf }

function stopTtsPlayback() {
  if (!ttsPlaying) return;
  const p = ttsPlaying;
  ttsPlaying = null;
  cancelAnimationFrame(p.raf);
  p.audio.onended = null;
  p.audio.pause();
  p.audio.currentTime = 0;
  p.btn.classList.remove("playing");
  p.btn.setAttribute("aria-label", "play candidate");
  p.ln.classList.remove("playing");
  p.prog.style.width = "0";
}

// Returns the new render token: the caller owns the result area until a
// later submission bumps it again.
function resetTryResult() {
  stopTtsPlayback();
  const token = ++ttsRenderToken;
  ttsObjectUrls.forEach((u) => URL.revokeObjectURL(u));
  ttsObjectUrls = [];
  hideTip();
  const el = document.getElementById("tryResult");
  el.classList.remove("lines");
  el.textContent = "";
  return token;
}

function renderTtsResult(status, data, token) {
  const el = document.getElementById("tryResult");
  el.classList.add("lines");
  const lines = [`HTTP ${status}`, ...JSON.stringify(data, null, 2).split("\n")];
  el.innerHTML = lines
    .map((l, i) => {
      const m = l.match(/"sha256": "([0-9a-f]{64})"/);
      if (!m) return `<div class="ln${i === 0 ? " status" : ""}">${i === 0 ? escHtml(l) : highlightJsonLine(l)}</div>`;
      return `<div class="ln sha" data-sha="${m[1]}"><span class="play loading" role="button" tabindex="-1" aria-label="loading audio"></span>${highlightJsonLine(l)}<span class="prog"></span></div>`;
    })
    .join("");

  el.querySelectorAll(".ln.sha").forEach(async (ln) => {
    const btn = ln.querySelector(".play");
    const url = `${API_BASE}/tts/${ln.dataset.sha}`;
    let errorText = null;
    let objectUrl = null;
    try {
      const resp = await fetch(url, { headers: authHeaders() });
      if (!resp.ok) errorText = `${resp.status} from ${url}`;
      else objectUrl = URL.createObjectURL(await resp.blob());
    } catch (e) {
      errorText = `request failed (${e.message}) for ${url}`;
    }
    if (token !== ttsRenderToken) {
      if (objectUrl) URL.revokeObjectURL(objectUrl);
      return;
    }
    btn.classList.remove("loading");
    btn.tabIndex = 0;
    if (errorText) {
      btn.classList.add("error");
      btn.title = errorText;
      btn.setAttribute("aria-label", errorText);
      return;
    }
    ttsObjectUrls.push(objectUrl);
    btn.dataset.src = objectUrl;
    btn.setAttribute("aria-label", "play candidate");
  });
}

function playTtsLine(ln) {
  const btn = ln.querySelector(".play");
  const prog = ln.querySelector(".prog");
  const audio = new Audio(btn.dataset.src);
  const p = { ln, btn, audio, prog, raf: 0 };
  audio.onended = () => { if (ttsPlaying === p) stopTtsPlayback(); };
  btn.classList.add("playing");
  btn.setAttribute("aria-label", "stop");
  ln.classList.add("playing");
  const tick = () => {
    if (ttsPlaying !== p) return;
    const frac = audio.duration > 0 && isFinite(audio.duration)
      ? Math.min(1, audio.currentTime / audio.duration) : 0;
    prog.style.width = `calc((100% - 28px) * ${frac})`;
    p.raf = requestAnimationFrame(tick);
  };
  ttsPlaying = p;
  audio.play().catch((e) => {
    if (ttsPlaying !== p) return;
    stopTtsPlayback();
    btn.classList.add("error");
    btn.title = `playback failed: ${e.message}`;
    btn.setAttribute("aria-label", btn.title);
  });
  tick();
}

function activateTtsControl(btn) {
  if (btn.classList.contains("loading") || btn.classList.contains("error")) return;
  const ln = btn.closest(".ln");
  const wasThis = ttsPlaying && ttsPlaying.ln === ln;
  stopTtsPlayback();
  if (!wasThis) playTtsLine(ln);
}

// Error tooltip: hover on desktop, tap on touch (title= is set as well).
function showTip(btn) {
  const tip = document.getElementById("tip");
  const r = btn.getBoundingClientRect();
  tip.textContent = btn.title;
  tip.style.display = "block";
  tip.style.left = Math.max(16, Math.min(r.left, window.innerWidth - tip.offsetWidth - 16)) + "px";
  tip.style.top = (r.top - tip.offsetHeight - 6) + "px";
}

function hideTip() {
  const tip = document.getElementById("tip");
  if (tip) tip.style.display = "none";
}

function wireTryResult() {
  const result = document.getElementById("tryResult");
  result.addEventListener("click", (e) => {
    const btn = e.target.closest(".play");
    if (btn) activateTtsControl(btn);
  });
  result.addEventListener("keydown", (e) => {
    const btn = e.target.closest(".play");
    if (btn && (e.key === "Enter" || e.key === " ")) {
      e.preventDefault();
      activateTtsControl(btn);
    }
  });
  result.addEventListener("mouseover", (e) => {
    const b = e.target.closest(".play.error");
    if (b) showTip(b);
  });
  result.addEventListener("mouseout", (e) => {
    if (e.target.closest(".play.error")) hideTip();
  });
  result.addEventListener("touchstart", (e) => {
    const b = e.target.closest(".play.error");
    if (b) { showTip(b); setTimeout(hideTip, 2500); }
  }, { passive: true });
  result.addEventListener("focusin", (e) => {
    const b = e.target.closest(".play.error");
    if (b) showTip(b);
  });
  result.addEventListener("focusout", (e) => {
    if (e.target.closest(".play.error")) hideTip();
  });
  result.addEventListener("scroll", hideTip);
  window.addEventListener("scroll", hideTip, { passive: true });
}

async function submitTryIt(event) {
  event.preventDefault();
  const kind = document.getElementById("tryKind").value;
  const provider = document.getElementById("tryProvider").value;
  const forceRefresh = document.getElementById("tryForceRefresh").checked;
  const resultEl = document.getElementById("tryResult");
  const myToken = resetTryResult();
  const showPlain = (text) => {
    if (myToken !== ttsRenderToken) return; // a newer submission owns the result
    resultEl.classList.remove("lines");
    resultEl.textContent = text;
  };
  if (kind === "tts") {
    resultEl.classList.add("lines");
    resultEl.innerHTML = `<div class="ln status"><span class="spin-inline"></span>POST /tts …</div>`;
  }

  let resp;
  if (kind === "stt") {
    const audioBlob = recordedAudioBlob || document.getElementById("tryAudioFile").files[0];
    if (!audioBlob) {
      showPlain("Pick an audio file or record one first.");
      return;
    }
    const form = new FormData();
    form.append("audio", audioBlob, audioBlob.name || "recording.webm");
    form.append("provider", provider);
    const lang = document.getElementById("tryAudioLang").value.trim();
    if (lang) form.append("lang", lang);
    // No Content-Type header: the browser sets the multipart boundary.
    try {
      resp = await fetch(`${API_BASE}/stt`, { method: "POST", headers: authHeaders(), body: form });
    } catch (e) {
      showPlain(`Request failed: ${e.message}`);
      return;
    }
  } else {
    let body;
    try {
      body = JSON.parse(document.getElementById("tryBody").value || "{}");
    } catch (e) {
      showPlain(`Invalid JSON body: ${e.message}`);
      return;
    }
    body.provider = provider;
    if (forceRefresh) body.forceRefresh = true;
    try {
      resp = await fetch(`${API_BASE}/${kind}`, {
        method: "POST",
        headers: { ...authHeaders(), "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });
    } catch (e) {
      showPlain(`Request failed: ${e.message}`);
      return;
    }
  }

  // Read the body once as text, then parse-and-restringify for two reasons
  // at once: pretty-printed indentation, and literal Unicode (IPA/Norwegian
  // characters) instead of however the wire bytes happened to be escaped.
  // A non-JSON body (e.g. an HTML error page) is shown verbatim.
  let raw;
  try {
    raw = await resp.text();
  } catch (e) {
    showPlain(`HTTP ${resp.status}\nReading the response failed: ${e.message}`);
    return;
  }
  let data = null;
  let display = raw;
  try {
    data = JSON.parse(raw);
    display = JSON.stringify(data, null, 2);
  } catch (e) {
    data = null;
  }
  if (myToken !== ttsRenderToken) return; // a newer submission owns the result
  if (kind === "tts" && data) renderTtsResult(resp.status, data, myToken);
  else showPlain(`HTTP ${resp.status}\n${display}`);
  refreshAll();
}

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("tryForm").addEventListener("submit", submitTryIt);
  document.getElementById("refreshBtn").addEventListener("click", refreshAll);
  document.getElementById("tryRecordBtn").addEventListener("click", toggleRecording);
  wireTryResult();
  refreshAll();
});
