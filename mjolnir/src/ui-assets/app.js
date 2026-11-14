const el = (id) => document.getElementById(id);

function stripHtml(html) {
  if (!html) return "";
  return html.replace(/<[^>]*>/g, " ").replace(/\s+/g, " ").trim();
}

async function api(method, path, body) {
  // Relative, not absolute: lets this same bundle of static assets be
  // mounted under any prefix (e.g. hub's `/mjolnir/workbench/`, task: "no
  // npx required") without a basePath threaded through every call site —
  // the browser resolves "api/..." against wherever this page's own URL
  // actually is, standalone root ("/") or a mount prefix alike.
  const res = await fetch(path.replace(/^\//, ""), {
    method,
    headers: body !== undefined ? { "Content-Type": "application/json" } : undefined,
    body: body !== undefined ? JSON.stringify(body) : undefined,
  });
  const data = await res.json();
  if (!res.ok) {
    const err = new Error(data.error || `request failed (${res.status})`);
    err.status = res.status;
    throw err;
  }
  return data;
}

function deckcardPath(sub) {
  return `/api/sessions/${app.activeSessionId}/deckcard${sub}`;
}
function deckcardApi(method, sub, body) {
  return api(method, deckcardPath(sub), body);
}

// --- App shell: sessions + tabs --------------------------------------

const VIEWS = ["explorer", "compare", "editor", "patches", "assemble", "catalogue", "deckcard"];

const app = {
  sessions: [],
  activeSessionId: null,
  currentView: "explorer",
};

function showView(view) {
  app.currentView = view;
  for (const v of VIEWS) {
    el(`view-${v}`).classList.toggle("hidden", v !== view);
  }
  for (const btn of document.querySelectorAll(".tab")) {
    btn.classList.toggle("active", btn.dataset.view === view);
  }
  refreshCurrentView();
}

function activeSession() {
  return app.sessions.find((s) => s.id === app.activeSessionId) || null;
}

function renderSessionBar() {
  const list = el("session-list");
  list.innerHTML = "";
  for (const s of app.sessions) {
    const span = document.createElement("span");
    span.className = "session-chip" + (s.id === app.activeSessionId ? " active" : "");
    // An uploaded session's actual on-disk path is a randomized temp
    // filename (never meant to be shown) — `displayName` carries the
    // operator's original filename instead; a path-opened session has none,
    // so it falls back to the resolved path's own basename, unchanged.
    span.textContent = s.displayName || s.bundlePath.split("/").pop();
    span.title = s.bundlePath;
    span.addEventListener("click", () => setActiveSession(s.id));
    list.appendChild(span);
  }

  const select = el("active-session-select");
  select.innerHTML = "";
  for (const s of app.sessions) {
    const option = document.createElement("option");
    option.value = s.id;
    option.textContent = s.bundlePath;
    select.appendChild(option);
  }
  if (app.activeSessionId) select.value = app.activeSessionId;

  const deckcardTab = document.querySelector('.tab[data-view="deckcard"]');
  const session = activeSession();
  deckcardTab.classList.toggle("hidden", !session || !session.deckCardAvailable);
}

function setActiveSession(id) {
  app.activeSessionId = id;
  renderSessionBar();
  populateComparePickers();
  refreshCurrentView();
}

async function openBundleByPath(p) {
  const errorEl = el("open-path-error");
  errorEl.classList.add("hidden");
  if (!p) return;
  try {
    const session = await api("POST", "/api/sessions", { path: p });
    if (!app.sessions.some((s) => s.id === session.id)) app.sessions.push(session);
    setActiveSession(session.id);
    return session;
  } catch (err) {
    errorEl.textContent = err.message;
    errorEl.classList.remove("hidden");
  }
}

async function openBundlePath() {
  const input = el("open-path-input");
  const p = input.value.trim();
  const session = await openBundleByPath(p);
  if (session) input.value = "";
}

// D-C4: no server-side path required — the bytes themselves are uploaded
// and staged, then opened exactly like a path-based session. Uses `fetch`
// directly (not the `api()` JSON helper) since the body here is raw bytes.
//
// Opening a large bundle genuinely takes a few seconds (parsing + exploding
// thousands of modules is synchronous work on the server) — this can't
// honestly report a numeric percentage (there's no streaming progress
// signal to report), but leaving the UI silent during that time reads as
// "frozen." `openStatus` gives immediate, explicit feedback instead, and
// the dropzone/file-input are disabled meanwhile so a second drop can't
// race the first.
async function openBundleFromFile(file) {
  const errorEl = el("open-path-error");
  const statusEl = el("open-status");
  const dz = el("upload-dropzone");
  const fileInput = el("upload-file-input");
  errorEl.classList.add("hidden");
  statusEl.textContent = `Opening ${file.name || "file"}… large bundles can take several seconds to parse.`;
  statusEl.classList.remove("hidden");
  dz.classList.add("busy");
  fileInput.disabled = true;
  try {
    const bytes = await file.arrayBuffer();
    const res = await fetch("api/sessions/upload", {
      method: "POST",
      headers: { "X-Filename": file.name || "upload.bundle" },
      body: bytes,
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || `upload failed (${res.status})`);
    if (!app.sessions.some((s) => s.id === data.id)) app.sessions.push(data);
    setActiveSession(data.id);
    statusEl.classList.add("hidden");
  } catch (err) {
    statusEl.classList.add("hidden");
    errorEl.textContent = err.message;
    errorEl.classList.remove("hidden");
  } finally {
    dz.classList.remove("busy");
    fileInput.disabled = false;
  }
}

// `?open=<path>` (hub's publish-history "inspect" link, and the Assemble
// tab's own result panel) — auto-opens that exact bundle as a session and
// switches straight to Explorer, instead of the operator having to
// copy-paste a server-side path by hand.
async function openFromQueryParam() {
  const openPath = new URLSearchParams(location.search).get("open");
  if (!openPath) return;
  const session = await openBundleByPath(openPath);
  if (session) showView("explorer");
}

function refreshCurrentView() {
  if (app.currentView === "explorer") loadExplorerModules();
  else if (app.currentView === "editor") loadEditorModules();
  else if (app.currentView === "patches") loadPatchesList();
  else if (app.currentView === "assemble") loadAssembleView();
  else if (app.currentView === "catalogue") loadCatalogueView();
  else if (app.currentView === "deckcard") loadDeckCardSidebar();
}

// --- Catalogue (D109) ------------------------------------------------------
//
// Every OTA build + logic bundle, fetched from hub's own `/mjolnir/
// catalogue.json` — a sibling endpoint outside this app's own mount prefix,
// since the workbench itself has no database access by design (D108) and
// this data only exists when running embedded inside a deployed hub. A
// standalone CLI session (or hub simply not reachable) degrades to a plain
// "unavailable" message, not a broken fetch.
async function loadCatalogueView() {
  const unavailableEl = el("catalogue-unavailable");
  const contentEl = el("catalogue-content");
  try {
    const res = await fetch("/mjolnir/catalogue.json");
    if (!res.ok) throw new Error(`catalogue fetch failed (${res.status})`);
    const data = await res.json();
    renderCatalogueLists(data);
    unavailableEl.classList.add("hidden");
    contentEl.classList.remove("hidden");
  } catch {
    contentEl.classList.add("hidden");
    unavailableEl.classList.remove("hidden");
  }
}

function renderCatalogueLists(data) {
  const buildsEl = el("catalogue-builds");
  buildsEl.innerHTML = "";
  for (const b of data.builds || []) {
    const li = document.createElement("li");
    li.style.cursor = "pointer";
    li.innerHTML = `<strong>${b.buildId}</strong>${b.label ? " — " + b.label : ""}`;
    li.addEventListener("click", async () => {
      const session = await openBundleByPath(b.path);
      if (session) showView("explorer");
    });
    buildsEl.appendChild(li);
  }

  const logicEl = el("catalogue-logic-bundles");
  logicEl.innerHTML = "";
  for (const b of data.logicBundles || []) {
    const li = document.createElement("li");
    li.style.cursor = "pointer";
    li.innerHTML = `${b.active ? "● " : ""}<strong>#${b.id}</strong> ${b.baseVersion}${b.label ? " — " + b.label : ""}`;
    li.addEventListener("click", async () => {
      const session = await openBundleByPath(b.path);
      if (session) showView("explorer");
    });
    logicEl.appendChild(li);
  }
}

// --- Explorer ------------------------------------------------------------

let explorerModules = [];
let explorerSearchResults = null;

const EXPLORER_SORTS = {
  id: (a, b) => a.id - b.id,
  "size-desc": (a, b) => b.size - a.size,
  classification: (a, b) => (a.classification || "").localeCompare(b.classification || "") || a.id - b.id,
  verboseName: (a, b) => (a.verboseName || "").localeCompare(b.verboseName || "") || a.id - b.id,
};

async function loadExplorerModules() {
  if (!app.activeSessionId) {
    el("explorer-module-list").innerHTML = "";
    return;
  }
  explorerModules = await api("GET", `/api/sessions/${app.activeSessionId}/modules`);
  renderExplorerList();
}

function renderExplorerList() {
  const list = el("explorer-module-list");
  list.innerHTML = "";

  if (explorerSearchResults) {
    for (const hit of explorerSearchResults) {
      const li = document.createElement("li");
      li.innerHTML = `<span class="mod-id">${hit.moduleId}</span><span class="mod-snippet">...${hit.snippet}...</span>`;
      li.addEventListener("click", () => openExplorerModule(hit.moduleId));
      list.appendChild(li);
    }
    return;
  }

  const sortKey = el("explorer-sort").value;
  const sorted = [...explorerModules].sort(EXPLORER_SORTS[sortKey]);
  for (const m of sorted) {
    const li = document.createElement("li");
    li.innerHTML = `<span class="mod-id">${m.id}</span><span class="mod-class">${m.classification || ""}</span><span class="mod-size">${m.size}b</span><span class="mod-verbose">${m.verboseName || ""}</span>`;
    li.addEventListener("click", () => openExplorerModule(m.id));
    list.appendChild(li);
  }
}

async function runExplorerSearch(query) {
  if (!query.trim()) {
    explorerSearchResults = null;
    renderExplorerList();
    return;
  }
  explorerSearchResults = await api(
    "GET",
    `/api/sessions/${app.activeSessionId}/search?q=${encodeURIComponent(query)}`
  );
  renderExplorerList();
}

let explorerShowingDeobfuscated = false;
let explorerCurrentModuleId = null;

async function openExplorerModule(id) {
  explorerCurrentModuleId = id;
  explorerShowingDeobfuscated = false;
  el("explorer-toggle-deobfuscated").textContent = "Show deobfuscated";
  const detail = await api("GET", `/api/sessions/${app.activeSessionId}/modules/${id}`);
  el("explorer-empty").classList.add("hidden");
  el("explorer-detail").classList.remove("hidden");
  el("explorer-module-title").textContent = `Module ${id}${detail.verboseName ? ` (${detail.verboseName})` : ""}`;
  el("explorer-module-meta").textContent = `size: ${detail.size}b · looksMinified: ${detail.looksMinified}`;
  el("explorer-source").textContent = detail.source;

  const depsList = el("explorer-deps");
  depsList.innerHTML = "";
  for (const depId of detail.deps) {
    const li = document.createElement("li");
    li.textContent = depId;
    li.addEventListener("click", () => openExplorerModule(depId));
    depsList.appendChild(li);
  }
  const dependentsList = el("explorer-dependents");
  dependentsList.innerHTML = "";
  for (const depId of detail.dependents) {
    const li = document.createElement("li");
    li.textContent = depId;
    li.addEventListener("click", () => openExplorerModule(depId));
    dependentsList.appendChild(li);
  }
}

async function toggleExplorerDeobfuscated() {
  if (explorerCurrentModuleId === null) return;
  explorerShowingDeobfuscated = !explorerShowingDeobfuscated;
  el("explorer-toggle-deobfuscated").textContent = explorerShowingDeobfuscated
    ? "Show raw"
    : "Show deobfuscated";
  if (explorerShowingDeobfuscated) {
    const { code } = await api(
      "GET",
      `/api/sessions/${app.activeSessionId}/modules/${explorerCurrentModuleId}/deobfuscated`
    );
    el("explorer-source").textContent = code;
  } else {
    const detail = await api(
      "GET",
      `/api/sessions/${app.activeSessionId}/modules/${explorerCurrentModuleId}`
    );
    el("explorer-source").textContent = detail.source;
  }
}

// --- Diff rendering (shared by Compare/Editor/Patches) --------------------

function renderDiffEntries(entries) {
  const container = document.createElement("div");
  container.className = "diff-entries";
  for (const e of entries || []) {
    const row = document.createElement("div");
    row.className = `diff-row diff-${e.kind}`;
    const label = document.createElement("div");
    label.className = "diff-label";
    label.textContent = e.kind;
    row.appendChild(label);

    if (e.kind === "modified") {
      const r = document.createElement("pre");
      r.className = "diff-code diff-removed-code";
      r.textContent = e.rCode || "";
      const m = document.createElement("pre");
      m.className = "diff-code diff-added-code";
      m.textContent = e.mCode || "";
      row.appendChild(r);
      row.appendChild(m);
    } else if (e.kind === "added") {
      const m = document.createElement("pre");
      m.className = "diff-code diff-added-code";
      m.textContent = e.mCode || "";
      row.appendChild(m);
    } else if (e.kind === "removed") {
      const r = document.createElement("pre");
      r.className = "diff-code diff-removed-code";
      r.textContent = e.rCode || "";
      row.appendChild(r);
    } else {
      const u = document.createElement("pre");
      u.className = "diff-code diff-unchanged-code";
      u.textContent = e.rCode || e.mCode || "";
      row.appendChild(u);
    }
    container.appendChild(row);

    if (e.children) {
      const childWrap = renderDiffEntries(e.children);
      childWrap.classList.add("diff-children");
      container.appendChild(childWrap);
    }
  }
  return container;
}

function renderDiffInto(containerEl, entries) {
  containerEl.innerHTML = "";
  containerEl.appendChild(renderDiffEntries(entries));
}

// --- Compare --------------------------------------------------------------

function populateComparePickers() {
  for (const id of ["compare-a", "compare-b"]) {
    const select = el(id);
    const prev = select.value;
    select.innerHTML = "";
    for (const s of app.sessions) {
      const option = document.createElement("option");
      option.value = s.id;
      option.textContent = s.bundlePath;
      select.appendChild(option);
    }
    if (prev) select.value = prev;
  }
}

async function runCompare() {
  const aId = el("compare-a").value;
  const bId = el("compare-b").value;
  if (!aId || !bId) return;
  const result = await api("GET", `/api/compare?a=${aId}&b=${bId}`);

  const container = el("compare-results");
  container.innerHTML = "";
  el("compare-diff").classList.add("hidden");

  const section = (title, items, render) => {
    const h = document.createElement("h3");
    h.textContent = `${title} (${items.length})`;
    container.appendChild(h);
    const ul = document.createElement("ul");
    ul.className = "id-list";
    for (const item of items) {
      const li = document.createElement("li");
      render(li, item);
      ul.appendChild(li);
    }
    container.appendChild(ul);
  };

  section("Changed", result.changed, (li, item) => {
    li.textContent = `${item.aId} -> ${item.bId}${item.verboseName ? ` (${item.verboseName})` : ""}`;
    li.style.cursor = "pointer";
    li.addEventListener("click", () => showCompareDiff(aId, bId, item.aId, item.bId));
  });
  section("Added", result.added, (li, id) => (li.textContent = id));
  section("Removed", result.removed, (li, id) => (li.textContent = id));
  section("Unchanged", result.unchanged, (li, item) => (li.textContent = `${item.aId} -> ${item.bId}`));
}

async function showCompareDiff(aSessionId, bSessionId, aModuleId, bModuleId) {
  const { diff } = await api(
    "GET",
    `/api/compare/diff?a=${aSessionId}&b=${bSessionId}&aModuleId=${aModuleId}&bModuleId=${bModuleId}`
  );
  const diffEl = el("compare-diff");
  diffEl.classList.remove("hidden");
  renderDiffInto(diffEl, diff);
}

// --- Editor ---------------------------------------------------------------

let editorCurrentModuleId = null;
let editorPollTimer = null;
let editorLatestBaseline = null;
let editorLatestCurrent = null;

async function loadEditorModules() {
  const list = el("editor-module-list");
  list.innerHTML = "";
  if (!app.activeSessionId) return;
  const modules = await api("GET", `/api/sessions/${app.activeSessionId}/modules`);
  for (const m of modules.sort((a, b) => a.id - b.id)) {
    const li = document.createElement("li");
    li.innerHTML = `<span class="mod-id">${m.id}</span><span class="mod-verbose">${m.verboseName || ""}</span>`;
    li.addEventListener("click", () => openEditorModule(m.id));
    list.appendChild(li);
  }
}

function stopEditorPolling() {
  if (editorPollTimer) {
    clearInterval(editorPollTimer);
    editorPollTimer = null;
  }
}

async function openEditorModule(id) {
  stopEditorPolling();
  editorCurrentModuleId = id;
  el("editor-empty").classList.add("hidden");
  el("editor-detail").classList.remove("hidden");
  el("editor-module-title").textContent = `Module ${id}`;
  el("editor-open-error").classList.add("hidden");
  el("editor-save-patch-success").classList.add("hidden");

  const { path } = await api("POST", `/api/sessions/${app.activeSessionId}/modules/${id}/deobfuscate`);
  el("editor-file-path").textContent = path;

  await pollEditorLiveDiff();
  editorPollTimer = setInterval(pollEditorLiveDiff, 1500);
}

async function pollEditorLiveDiff() {
  if (editorCurrentModuleId === null) return;
  try {
    const result = await api(
      "GET",
      `/api/sessions/${app.activeSessionId}/modules/${editorCurrentModuleId}/live-diff`
    );
    editorLatestBaseline = result.baseline;
    editorLatestCurrent = result.current;
    renderDiffInto(el("editor-diff"), result.diff);
  } catch (err) {
    // A transient parse error while mid-edit is expected; just show it inline
    // rather than stopping the poll.
    el("editor-diff").textContent = `(waiting for a parseable edit: ${err.message})`;
  }
}

async function openInEditor() {
  if (editorCurrentModuleId === null) return;
  el("editor-open-error").classList.add("hidden");
  const result = await api(
    "POST",
    `/api/sessions/${app.activeSessionId}/modules/${editorCurrentModuleId}/open-in-editor`
  );
  if (!result.success) {
    el("editor-open-error").textContent = `editor command failed (code ${result.code}): ${result.stderr || "(no output)"}. File path: ${result.path}`;
    el("editor-open-error").classList.remove("hidden");
  }
}

async function saveEditorPatch() {
  const name = el("editor-patch-name").value.trim();
  const description = el("editor-patch-description").value.trim();
  const locator = el("editor-patch-locator").value.trim();
  const errorEl = el("editor-save-patch-error");
  const successEl = el("editor-save-patch-success");
  errorEl.classList.add("hidden");
  successEl.classList.add("hidden");

  if (!name || !locator) {
    errorEl.textContent = "name and locator are required";
    errorEl.classList.remove("hidden");
    return;
  }
  try {
    await api("POST", "/api/patches", {
      name,
      description,
      locator: { contains: locator },
      baseline: editorLatestBaseline,
      modified: editorLatestCurrent,
    });
    successEl.textContent = `Saved patch "${name}"`;
    successEl.classList.remove("hidden");
  } catch (err) {
    errorEl.textContent = err.message;
    errorEl.classList.remove("hidden");
  }
}

// --- Patches ----------------------------------------------------------

let patchesCache = [];

// Shows the server's own resolved absolute directory right next to the
// list — if it's unexpectedly empty, the operator sees exactly where it
// looked instead of just a silent "no patches" with no way to diagnose why
// (the common cause: a `WORKBENCH_PATCHES_DIR` override pointing at a host
// filesystem path that doesn't exist inside the container — see DEPLOY.md).
async function showPatchesDirCaption(elementId) {
  try {
    const { patchesDir } = await api("GET", "/api/patches-dir");
    el(elementId).textContent = `Reading patches from: ${patchesDir}`;
  } catch {
    el(elementId).textContent = "";
  }
}

async function loadPatchesList() {
  showPatchesDirCaption("patches-dir-caption");
  patchesCache = await api("GET", "/api/patches");
  el("patches-empty-note").classList.toggle("hidden", patchesCache.length > 0);
  const list = el("patches-list");
  list.innerHTML = "";
  for (const p of patchesCache) {
    const li = document.createElement("li");
    li.innerHTML = `<strong>${p.name}</strong> — ${p.description || ""} <code>${p.locator.contains}</code>`;
    li.style.cursor = "pointer";
    li.addEventListener("click", () => previewPatchByName("patch", p.name));
    list.appendChild(li);
  }

  await loadPatchbackPairsList();
  await loadPatchesCompanionsList();
}

// Companions have no "before" state to diff against (APPEND-style — new
// top-level code, no existing module touched), so they're listed here
// read-only for inspection: click one to see its raw source in the shared
// preview panel below (no "Apply to active session" — picking a companion
// for a real build happens in the Assemble tab, where buildId/baseVersion/
// patchRev are available to substitute its placeholders).
let patchesCompanionsCache = [];

async function loadPatchesCompanionsList() {
  try {
    const { companionsDir, companions } = await api("GET", "/api/companions");
    el("patches-companions-dir-caption").textContent = `Reading companions from: ${companionsDir}`;
    patchesCompanionsCache = companions;
  } catch {
    el("patches-companions-dir-caption").textContent = "";
    patchesCompanionsCache = [];
  }
  el("patches-companions-empty-note").classList.toggle("hidden", patchesCompanionsCache.length > 0);
  const list = el("patches-companions-list");
  list.innerHTML = "";
  for (const c of patchesCompanionsCache) {
    const li = document.createElement("li");
    li.innerHTML = `<strong>${c.name}</strong>`;
    li.style.cursor = "pointer";
    li.addEventListener("click", () => previewPatchByName("companion", c.name));
    list.appendChild(li);
  }
}

// D111: raw <module-id>-name.baseline.js/.edited.js pairs under
// patches/js — a second REPLACE-style patch kind, located by the module id
// named in the filename rather than a content string. Same preview/apply
// panel as the JSON-store list above, via `previewPatchByName`'s "pair"
// kind.
let patchbackPairsCache = [];

async function loadPatchbackPairsList() {
  try {
    const { patchbackDir, pairs } = await api("GET", "/api/patchback-pairs");
    el("patchback-pairs-dir-caption").textContent = `Reading patch-back pairs from: ${patchbackDir}`;
    patchbackPairsCache = pairs;
  } catch {
    el("patchback-pairs-dir-caption").textContent = "";
    patchbackPairsCache = [];
  }
  el("patchback-pairs-empty-note").classList.toggle("hidden", patchbackPairsCache.length > 0);
  const list = el("patchback-pairs-list");
  list.innerHTML = "";
  for (const p of patchbackPairsCache) {
    const li = document.createElement("li");
    li.innerHTML = `<strong>${p.name}</strong> — module <code>${p.moduleId}</code>`;
    li.style.cursor = "pointer";
    li.addEventListener("click", () => previewPatchByName("pair", p.name));
    list.appendChild(li);
  }
}

let patchesPreviewKind = null; // "patch" | "pair" | "companion"
let patchesPreviewName = null;

function previewApiBase(kind) {
  return kind === "pair" ? "/api/patchback-pairs" : "/api/patches";
}

async function previewPatchByName(kind, name) {
  // Companions have no bundle to locate a target in — they're pure source
  // inspection, so (unlike patch/pair previews) no active session is
  // required.
  if (kind !== "companion" && !app.activeSessionId) {
    alert("Open and select an active session first.");
    return;
  }
  patchesPreviewKind = kind;
  patchesPreviewName = name;
  el("patches-preview").classList.remove("hidden");
  el("patches-apply-result").classList.add("hidden");

  if (kind === "companion") {
    const result = await api("GET", `/api/companions/${encodeURIComponent(name)}/source`);
    el("patches-preview-diff").classList.add("hidden");
    el("patches-apply-btn").classList.add("hidden");
    const sourceEl = el("patches-preview-source");
    sourceEl.textContent = result.source;
    sourceEl.classList.remove("hidden");
    return;
  }

  el("patches-preview-source").classList.add("hidden");
  el("patches-apply-btn").classList.remove("hidden");
  const result = await api("POST", `${previewApiBase(kind)}/${encodeURIComponent(name)}/preview`, {
    sessionId: app.activeSessionId,
  });
  renderDiffInto(el("patches-preview-diff"), result.diff);
  el("patches-preview-diff").classList.remove("hidden");
}

async function applyPreviewedPatch() {
  if (patchesPreviewKind === "companion" || !patchesPreviewName || !app.activeSessionId) return;
  const result = await api(
    "POST",
    `${previewApiBase(patchesPreviewKind)}/${encodeURIComponent(patchesPreviewName)}/apply`,
    { sessionId: app.activeSessionId }
  );
  const resultEl = el("patches-apply-result");
  resultEl.textContent = `Applied to module ${result.targetModuleId}`;
  resultEl.classList.remove("hidden");

  const updated = await api("GET", `/api/sessions/${app.activeSessionId}`);
  const idx = app.sessions.findIndex((s) => s.id === updated.id);
  if (idx !== -1) app.sessions[idx] = updated;
  renderSessionBar();
}

// --- Assemble (multi-patch selection + "Assemble" action, D-L7) ----------
//
// Reuses `patches-list` data (`/api/patches`) and applies them, in the
// operator's chosen order, against a chosen base folder's own bundle via
// `POST /api/assemble` — `src/commands/assemble.js`'s one implementation of
// "locate, apply, in sequence" (never a second one for the UI). Picking is
// two lists rather than drag-and-drop: click an available patch to select
// it (appended to the end of the order), click a selected one to remove it,
// ▲/▼ to reorder — no native drag API needed for an ordered pick of
// typically a handful of patches.

let assembleSelected = [];
let assemblePatchbackPairsCache = [];
let assemblePatchbackPairsSelected = [];
let assembleCompanionsCache = [];
let assembleCompanionsSelected = [];
let companionsDefaultApplied = false;

// D112: running embedded in hub (vs. standalone bundle-tool/bundle-
// workbench, no database, D108) is detected once per load by probing hub's
// own GET /mjolnir/ota/assemble-defaults — an absolute, sibling-of-the-
// mount-point fetch, same pattern loadCatalogueView() already uses for
// /mjolnir/catalogue.json. A 200 means "embedded, use the one-step
// assemble-and-submit flow, no base folder or output path to type"; any
// failure (404 standalone, or genuinely offline) means "standalone, keep
// the original path-based flow."
let assembleEmbedded = false;

// generic-placeholder-substitution (D-G4): one ordered list of {key, value}
// rows, replacing the old fixed set of named fields. Pre-filled on first
// load with the keys this project's own patches already rely on — BUILD_ID
// (blank; moot in embedded mode, where hub always assigns its own build id
// at submit time, but harmless to leave an unused row), SYNC_BASE_URL/
// SYNC_TOKEN/AUDIO_BASE_URL (blank — same "leave blank to use the server's
// own default" behavior the old dedicated fields had). BASE_VERSION is
// never a row here — it's always read from the base folder's own
// apktool.yml (D-G2), never operator-editable.
let assemblePlaceholders = [
  { key: "BUILD_ID", value: "" },
  { key: "SYNC_BASE_URL", value: "" },
  { key: "SYNC_TOKEN", value: "" },
  { key: "AUDIO_BASE_URL", value: "" },
  // boot-companion-label-data-version: LABEL/DATA_VERSION rows, pre-filled
  // once hub's /assemble-defaults responds (loadAssembleView below) — blank
  // here same as the other rows above until that happens.
  { key: "LABEL", value: "" },
  { key: "DATA_VERSION", value: "" },
];
let assemblePlaceholdersInitialized = false;

function renderAssemblePlaceholders() {
  const container = el("assemble-placeholders-list");
  container.innerHTML = "";
  assemblePlaceholders.forEach((row, idx) => {
    const rowEl = document.createElement("div");
    rowEl.className = "field-grid";

    const keyLabel = document.createElement("label");
    keyLabel.textContent = "Key";
    const keyInput = document.createElement("input");
    keyInput.type = "text";
    keyInput.value = row.key;
    keyInput.placeholder = "e.g. LABEL";
    keyInput.addEventListener("input", () => {
      row.key = keyInput.value.trim().toUpperCase();
    });
    keyLabel.appendChild(keyInput);

    const isSecret = /TOKEN|SECRET/.test(row.key);
    const valueLabel = document.createElement("label");
    valueLabel.textContent = "Value";
    const valueInput = document.createElement("input");
    valueInput.type = isSecret ? "password" : "text";
    valueInput.value = row.value;
    valueInput.placeholder = isSecret
      ? "(default from OPERATOR_AUTH_TOKEN, if configured)"
      : row.key.endsWith("_URL")
        ? "(default from TUN_PUBLIC_BASE, if configured)"
        : "";
    valueInput.addEventListener("input", () => {
      row.value = valueInput.value;
    });
    valueLabel.appendChild(valueInput);

    const removeBtn = document.createElement("button");
    removeBtn.type = "button";
    removeBtn.textContent = "Remove";
    removeBtn.addEventListener("click", () => {
      assemblePlaceholders = assemblePlaceholders.filter((r) => r !== row);
      renderAssemblePlaceholders();
    });

    rowEl.append(keyLabel, valueLabel, removeBtn);
    container.appendChild(rowEl);
  });
}

function assemblePlaceholdersAsObject() {
  const out = {};
  for (const { key, value } of assemblePlaceholders) {
    if (key && value.trim()) out[key] = value.trim();
  }
  return out;
}

async function detectAssembleMode() {
  try {
    const res = await fetch("/mjolnir/ota/assemble-defaults");
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  }
}

async function loadAssembleView() {
  const defaults = await detectAssembleMode();
  assembleEmbedded = !!defaults;
  el("assemble-embedded-fields").classList.toggle("hidden", !assembleEmbedded);
  el("assemble-standalone-fields").classList.toggle("hidden", assembleEmbedded);
  el("assemble-run-btn").textContent = assembleEmbedded ? "Assemble & submit logic bundle" : "Assemble";
  if (assembleEmbedded) {
    el("assemble-mode-caption").textContent =
      `Assembling against this repo's own base folder: ${defaults.baseFolderDir} ` +
      `(base_version ${defaults.baseVersion}). Result is submitted straight to hub's logic bundles — ` +
      `activate it from /mjolnir/ota when ready.`;
    el("assemble-patch-rev-hint").textContent =
      `optional — auto-incremented to ${defaults.nextPatchRev} (the next global patch_rev) if left blank`;
    // The hint text alone isn't enough — write the actual suggested value
    // into the field so the operator sees a real, already-filled number
    // they can accept or override, not just a number mentioned in grey text
    // next to an empty box.
    if (!el("assemble-patch-rev").value) el("assemble-patch-rev").value = defaults.nextPatchRev;
    if (!el("assemble-label").value) el("assemble-label").value = `${defaults.baseVersion}-patch${defaults.nextPatchRev}`;
    el("assemble-placeholders-hint").textContent =
      `BUILD_ID is ignored here (hub assigns its own at submit time). SYNC_BASE_URL/SYNC_TOKEN/AUDIO_BASE_URL: ` +
      `${defaults.syncBaseUrlConfigured ? "configured on this server — leave blank to use it" : "not configured (TUN_PUBLIC_BASE unset)"}; ` +
      `${defaults.syncTokenConfigured ? "token configured — leave blank to use it" : "token not configured (OPERATOR_AUTH_TOKEN unset)"}. ` +
      `Leave any row blank to use the server's own default, or fill it to override.`;
  } else {
    el("assemble-mode-caption").textContent =
      "Running standalone (no hub reachable) — base folder and output bundle path are required below.";
    el("assemble-patch-rev-hint").textContent =
      "the operator's responsibility — read the current max off /mjolnir/ota's history";
    el("assemble-placeholders-hint").textContent =
      "BUILD_ID is required if a selected patch/companion bakes __MJOLNIR_BUILD_ID__. SYNC_BASE_URL/SYNC_TOKEN/AUDIO_BASE_URL: " +
      "blank = use this process's own TUN_PUBLIC_BASE/OPERATOR_AUTH_TOKEN env vars, if set — otherwise required if a selected patch/companion bakes the matching placeholder.";
  }
  if (!assemblePlaceholdersInitialized) {
    assemblePlaceholdersInitialized = true;
    // D-L3: pre-fill DATA_VERSION/LABEL from hub's own suggested values —
    // only meaningful in embedded mode, since standalone has no publications
    // table (or dedicated Label field) to read from. LABEL's row mirrors the
    // same suggested default just written into the dedicated Label field
    // above, so the generic placeholder list visibly shows what will
    // actually be baked, not a blank row that silently resolves to
    // something else at submit time.
    if (assembleEmbedded) {
      if (defaults.dataRev !== undefined && defaults.dataRev !== null) {
        const dataVersionRow = assemblePlaceholders.find((r) => r.key === "DATA_VERSION");
        if (dataVersionRow && !dataVersionRow.value) dataVersionRow.value = String(defaults.dataRev);
      }
      const labelRow = assemblePlaceholders.find((r) => r.key === "LABEL");
      if (labelRow && !labelRow.value) labelRow.value = el("assemble-label").value;
    }
    renderAssemblePlaceholders();
  }
  el("assemble-placeholder-add-btn").onclick = () => {
    assemblePlaceholders = [...assemblePlaceholders, { key: "", value: "" }];
    renderAssemblePlaceholders();
  };

  showPatchesDirCaption("assemble-patches-dir-caption");
  patchesCache = await api("GET", "/api/patches");
  assembleSelected = assembleSelected.filter((name) => patchesCache.some((p) => p.name === name));

  const { patchbackDir, pairs } = await api("GET", "/api/patchback-pairs");
  el("assemble-patchback-pairs-dir-caption").textContent = `Reading patch-back pairs from: ${patchbackDir}`;
  assemblePatchbackPairsCache = pairs;
  assemblePatchbackPairsSelected = assemblePatchbackPairsSelected.filter((name) =>
    pairs.some((p) => p.name === name)
  );

  const { companionsDir, companions } = await api("GET", "/api/companions");
  el("assemble-companions-dir-caption").textContent = `Reading companions from: ${companionsDir}`;
  assembleCompanionsCache = companions;
  assembleCompanionsSelected = assembleCompanionsSelected.filter((name) => companions.some((c) => c.name === name));
  // Pre-select boot-ok-companion the first time this view loads, matching
  // the old single-field default — every real assembled bundle needs
  // BUILD_ID baked in, so this saves the obvious, almost-always-wanted
  // click without forcing it (the operator can still remove it).
  if (!companionsDefaultApplied) {
    companionsDefaultApplied = true;
    if (companions.some((c) => c.name === "boot-ok-companion")) {
      assembleCompanionsSelected = ["boot-ok-companion"];
    }
  }

  renderAssemblePickers();
}

// Generic ordered two-list picker (available -> selected, add/remove/▲/▼) —
// shared between the Patches picker (REPLACE-style) and the Companions
// picker (APPEND-style, D110) below, since both are "pick some items from a
// cache, in order" with identical interaction.
function renderOrderedPicker({ cache, selected, availableListEl, selectedListEl, onChange }) {
  availableListEl.innerHTML = "";
  selectedListEl.innerHTML = "";

  const available = cache.filter((item) => !selected.includes(item.name));
  availableListEl.classList.toggle("empty", available.length === 0);
  for (const item of available) {
    const li = document.createElement("li");
    li.innerHTML = `<span class="assemble-pick-name" title="${item.description || ""}">${item.name}</span>
      <span class="assemble-pick-actions"><button type="button" class="small" data-add="${item.name}">add →</button></span>`;
    availableListEl.appendChild(li);
  }

  selectedListEl.classList.toggle("empty", selected.length === 0);
  selected.forEach((name, idx) => {
    const li = document.createElement("li");
    li.innerHTML = `<span class="assemble-pick-name">${idx + 1}. ${name}</span>
      <span class="assemble-pick-actions">
        <button type="button" class="small" data-up="${name}" ${idx === 0 ? "disabled" : ""}>▲</button>
        <button type="button" class="small" data-down="${name}" ${idx === selected.length - 1 ? "disabled" : ""}>▼</button>
        <button type="button" class="small" data-remove="${name}">remove</button>
      </span>`;
    selectedListEl.appendChild(li);
  });

  availableListEl.querySelectorAll("[data-add]").forEach((btn) =>
    btn.addEventListener("click", () => onChange([...selected, btn.dataset.add]))
  );
  selectedListEl.querySelectorAll("[data-remove]").forEach((btn) =>
    btn.addEventListener("click", () => onChange(selected.filter((n) => n !== btn.dataset.remove)))
  );
  selectedListEl.querySelectorAll("[data-up]").forEach((btn) =>
    btn.addEventListener("click", () => {
      const i = selected.indexOf(btn.dataset.up);
      const next = [...selected];
      if (i > 0) [next[i - 1], next[i]] = [next[i], next[i - 1]];
      onChange(next);
    })
  );
  selectedListEl.querySelectorAll("[data-down]").forEach((btn) =>
    btn.addEventListener("click", () => {
      const i = selected.indexOf(btn.dataset.down);
      const next = [...selected];
      if (i !== -1 && i < next.length - 1) [next[i + 1], next[i]] = [next[i], next[i + 1]];
      onChange(next);
    })
  );
}

function renderAssemblePickers() {
  renderOrderedPicker({
    cache: patchesCache,
    selected: assembleSelected,
    availableListEl: el("assemble-available-list"),
    selectedListEl: el("assemble-selected-list"),
    onChange: (next) => {
      assembleSelected = next;
      renderAssemblePickers();
    },
  });
  renderOrderedPicker({
    cache: assemblePatchbackPairsCache,
    selected: assemblePatchbackPairsSelected,
    availableListEl: el("assemble-patchback-pairs-available-list"),
    selectedListEl: el("assemble-patchback-pairs-selected-list"),
    onChange: (next) => {
      assemblePatchbackPairsSelected = next;
      renderAssemblePickers();
    },
  });
  renderOrderedPicker({
    cache: assembleCompanionsCache,
    selected: assembleCompanionsSelected,
    availableListEl: el("assemble-companions-available-list"),
    selectedListEl: el("assemble-companions-selected-list"),
    onChange: (next) => {
      assembleCompanionsSelected = next;
      renderAssemblePickers();
    },
  });
}

async function runAssemble() {
  const errorEl = el("assemble-error");
  const resultEl = el("assemble-result");
  errorEl.classList.add("hidden");
  resultEl.classList.add("hidden");

  const patchRevRaw = el("assemble-patch-rev").value.trim();
  const companionFiles = assembleCompanionsSelected
    .map((name) => assembleCompanionsCache.find((c) => c.name === name)?.path)
    .filter(Boolean);
  // generic-placeholder-substitution: a blank row is simply omitted — the
  // server falls back to its own default for SYNC_BASE_URL/SYNC_TOKEN/
  // AUDIO_BASE_URL when the key is absent, same as before.
  const placeholders = assemblePlaceholdersAsObject();

  if (assembleEmbedded) {
    const labelFieldValue = el("assemble-label").value.trim();
    // D-L3: reuse the Label field's own value for the baked LABEL
    // placeholder too, rather than asking the operator to type it twice —
    // only when the LABEL row was left blank; an explicit row value wins.
    const embeddedPlaceholders = { ...placeholders };
    if (!embeddedPlaceholders.LABEL && labelFieldValue) embeddedPlaceholders.LABEL = labelFieldValue;
    try {
      const res = await fetch("/mjolnir/ota/assemble-submit", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          patchNames: assembleSelected,
          patchbackPairNames: assemblePatchbackPairsSelected,
          companionFiles,
          label: labelFieldValue || undefined,
          patchRev: patchRevRaw ? Number(patchRevRaw) : undefined,
          placeholders: embeddedPlaceholders,
        }),
      });
      const result = await res.json();
      if (!res.ok) throw new Error(result.error || `request failed (${res.status})`);
      resultEl.innerHTML = `Created logic bundle <strong>#${result.id}</strong> — base_version <strong>${result.base_version}</strong>, patch_rev <strong>${result.patch_rev}</strong>${result.label ? `, label <strong>${result.label}</strong>` : ""}.<br>Activate it from <a href="/mjolnir/ota" target="_blank">/mjolnir/ota</a> when ready.`;
      resultEl.classList.remove("hidden");
    } catch (err) {
      errorEl.textContent = err.message;
      errorEl.classList.remove("hidden");
    }
    return;
  }

  const baseFolderPath = el("assemble-base-folder").value.trim();
  const outputPath = el("assemble-output-path").value.trim();
  if (!baseFolderPath || !outputPath) {
    errorEl.textContent = "base folder and output bundle path are both required";
    errorEl.classList.remove("hidden");
    return;
  }

  try {
    // Standalone mode has no hub/database, so unlike embedded mode there's
    // no server-side patch_rev auto-resolution (D108) — PATCH_REV must come
    // through the same generic placeholders map as everything else here,
    // from the dedicated "Patch rev" field above.
    const standalonePlaceholders = { ...placeholders };
    if (patchRevRaw) standalonePlaceholders.PATCH_REV = patchRevRaw;
    const result = await api("POST", "/api/assemble", {
      baseFolderPath,
      patchNames: assembleSelected,
      patchbackPairNames: assemblePatchbackPairsSelected,
      outputPath,
      companionFiles,
      placeholders: standalonePlaceholders,
    });
    resultEl.innerHTML = `Assembled <code>${result.outputPath}</code> — base_version <strong>${result.baseVersion}</strong>, patch_rev <strong>${result.placeholders.PATCH_REV ?? "(not baked)"}</strong>, ${result.appliedPatches.length} patch(es) applied, ${result.appliedPatchbackPairs.length} patch-back pair(s) applied, ${result.appliedCompanions.length} companion(s) appended.<br>Submit it to hub's OTA console (<code>/mjolnir/ota</code>) when ready, or drag-drop it there by hand.`;
    resultEl.classList.remove("hidden");
  } catch (err) {
    errorEl.textContent = err.message;
    errorEl.classList.remove("hidden");
  }
}

// --- Deck/Card editor (relocated, logic unchanged) ------------------------

const deckcardState = {
  currentDeckName: null,
  currentCardId: null,
  currentDeck: null,
  deckViewMode: "card",
  cardSortBy: "id",
  occurrenceSortBy: "position",
  deckFormMode: "create",
};

const DECKCARD_PANELS = ["deck-view", "card-editor", "deck-form"];

function showDeckCardPanel(id) {
  for (const panelId of DECKCARD_PANELS) {
    el(panelId).classList.toggle("hidden", panelId !== id);
  }
  el("empty-state").classList.add("hidden");
}

function showDeckCardEmptyState() {
  for (const panelId of DECKCARD_PANELS) {
    el(panelId).classList.add("hidden");
  }
  el("empty-state").classList.remove("hidden");
}

async function loadDeckCardSidebar() {
  if (!app.activeSessionId || !activeSession()?.deckCardAvailable) {
    el("categories").innerHTML = "";
    return;
  }
  const decks = await deckcardApi("GET", "/decks");
  const byCategory = new Map();
  for (const deck of decks) {
    if (!byCategory.has(deck.category)) byCategory.set(deck.category, []);
    byCategory.get(deck.category).push(deck);
  }

  const container = el("categories");
  container.innerHTML = "";
  for (const [category, categoryDecks] of [...byCategory.entries()].sort()) {
    const section = document.createElement("div");
    section.className = "category";

    const heading = document.createElement("div");
    heading.className = "category-name";
    heading.textContent = `${category} (${categoryDecks.length})`;
    section.appendChild(heading);

    for (const deck of categoryDecks.sort((a, b) => a.Name.localeCompare(b.Name))) {
      const btn = document.createElement("button");
      btn.type = "button";
      btn.className = "deck-item";
      btn.textContent = `${deck.Name} — ${deck.Title || ""} (${deck.cardCount})`;
      btn.dataset.deckName = deck.Name;
      btn.addEventListener("click", () => openDeck(deck.Name));
      section.appendChild(btn);
    }

    container.appendChild(section);
  }
}

function markActiveDeck(name) {
  for (const btn of document.querySelectorAll(".deck-item")) {
    btn.classList.toggle("active", btn.dataset.deckName === name);
  }
}

function renderDeckMeta(deck, targetId) {
  const target = el(targetId);
  target.innerHTML = "";
  if (!deck) return;

  if (deck.Description) {
    const p = document.createElement("p");
    p.className = "description";
    p.textContent = deck.Description;
    target.appendChild(p);
  }

  const counters = [deck.Counter1, deck.Counter2].filter(Boolean).map(stripHtml);
  if (counters.length) {
    const p = document.createElement("p");
    p.className = "counters";
    p.textContent = counters.join(" · ");
    target.appendChild(p);
  }

  const stats = [
    ["ID", deck.ID],
    ["PullCounter", deck.PullCounter],
    ["MaxInterval", deck.MaxInterval],
    ["AutoTickStreak", deck.AutoTickStreak],
    ["AutoHammerCount", deck.AutoHammerCount],
  ].filter(([, value]) => value !== undefined);
  if (stats.length) {
    const p = document.createElement("p");
    p.className = "stats";
    p.textContent = stats.map(([label, value]) => `${label}: ${value}`).join(" · ");
    target.appendChild(p);
  }
}

const CARD_SORTS = {
  id: { label: "Sort: Card ID", cmp: (a, b) => a.ID.localeCompare(b.ID) },
  preview: { label: "Sort: Preview (A–Z)", cmp: (a, b) => (a.preview || "").localeCompare(b.preview || "") },
};

function renderCardList(deck) {
  const list = el("card-list");
  list.innerHTML = "";
  const cards = [...deck.cards].sort(CARD_SORTS[deckcardState.cardSortBy].cmp);
  for (const card of cards) {
    const li = document.createElement("li");
    const idSpan = document.createElement("span");
    idSpan.className = "card-id";
    idSpan.textContent = card.ID;
    const directionsSpan = document.createElement("span");
    directionsSpan.className = "card-directions";
    directionsSpan.textContent = (card.directions || []).join("");
    directionsSpan.title = `direction letters: ${(card.directions || []).join(", ")}`;
    const previewSpan = document.createElement("span");
    previewSpan.className = "card-preview";
    previewSpan.textContent = card.preview || "";
    li.appendChild(idSpan);
    li.appendChild(directionsSpan);
    li.appendChild(previewSpan);
    li.addEventListener("click", () => openCard(card.ID));
    list.appendChild(li);
  }
}

const ORDER_SORTS = {
  position: { label: "Sort: Position (presentation order)", cmp: (a, b) => a.index - b.index },
  id: { label: "Sort: Card ID", cmp: (a, b) => a.cardId.localeCompare(b.cardId) || a.index - b.index },
  letter: { label: "Sort: Letter", cmp: (a, b) => a.letter.localeCompare(b.letter) || a.index - b.index },
};

function renderOccurrences(deck) {
  const list = el("occurrence-list");
  list.innerHTML = "";
  const occurrences = [...(deck.occurrences || [])].sort(ORDER_SORTS[deckcardState.occurrenceSortBy].cmp);
  for (const occ of occurrences) {
    const li = document.createElement("li");

    const posSpan = document.createElement("span");
    posSpan.className = "occurrence-pos";
    posSpan.textContent = `#${occ.index + 1}`;

    const idSpan = document.createElement("span");
    idSpan.className = "card-id";
    idSpan.textContent = occ.cardId;

    const letterSelect = document.createElement("select");
    for (const letter of ["N", "E", "A"]) {
      const option = document.createElement("option");
      option.value = letter;
      option.textContent = letter;
      letterSelect.appendChild(option);
    }
    letterSelect.value = occ.letter;
    letterSelect.addEventListener("change", () =>
      updateOccurrenceLetter(deck.Name, occ.index, letterSelect.value)
    );

    const previewSpan = document.createElement("span");
    previewSpan.className = "card-preview";
    previewSpan.textContent = occ.preview || "";

    const deleteBtn = document.createElement("button");
    deleteBtn.type = "button";
    deleteBtn.className = "danger small";
    deleteBtn.textContent = "×";
    deleteBtn.addEventListener("click", () => deleteOccurrence(deck.Name, occ.index));

    li.appendChild(posSpan);
    li.appendChild(idSpan);
    li.appendChild(letterSelect);
    li.appendChild(previewSpan);
    li.appendChild(deleteBtn);
    list.appendChild(li);
  }
}

function populateAddOccurrenceCardOptions(deck) {
  const select = el("add-occurrence-card");
  select.innerHTML = "";
  for (const card of deck.cards || []) {
    const option = document.createElement("option");
    option.value = card.ID;
    option.textContent = `${card.ID} — ${card.preview || ""}`;
    select.appendChild(option);
  }
}

function populateSortSelect() {
  const sorts = deckcardState.deckViewMode === "order" ? ORDER_SORTS : CARD_SORTS;
  const currentKey = deckcardState.deckViewMode === "order" ? deckcardState.occurrenceSortBy : deckcardState.cardSortBy;
  const select = el("sort-select");
  select.innerHTML = "";
  for (const [key, { label }] of Object.entries(sorts)) {
    const option = document.createElement("option");
    option.value = key;
    option.textContent = label;
    select.appendChild(option);
  }
  select.value = currentKey;
}

function handleSortChange() {
  const value = el("sort-select").value;
  if (deckcardState.deckViewMode === "order") {
    deckcardState.occurrenceSortBy = value;
    renderOccurrences(deckcardState.currentDeck);
  } else {
    deckcardState.cardSortBy = value;
    renderCardList(deckcardState.currentDeck);
  }
}

async function updateOccurrenceLetter(deckName, index, letter) {
  try {
    await deckcardApi("PUT", `/decks/${encodeURIComponent(deckName)}/occurrences/${index}`, { letter });
  } catch (err) {
    alert(err.message);
  }
  await openDeck(deckName);
  showOrderView();
}

async function deleteOccurrence(deckName, index) {
  await deckcardApi("DELETE", `/decks/${encodeURIComponent(deckName)}/occurrences/${index}`);
  await openDeck(deckName);
  showOrderView();
}

async function addOccurrenceToDeck() {
  const cardId = el("add-occurrence-card").value;
  const letter = el("add-occurrence-letter").value;
  if (!cardId) return;
  await deckcardApi("POST", `/decks/${encodeURIComponent(deckcardState.currentDeckName)}/occurrences`, {
    cardId,
    letter,
  });
  await openDeck(deckcardState.currentDeckName);
  showOrderView();
}

function toggleAddOccurrenceBar() {
  el("add-occurrence").classList.toggle("hidden");
}

async function shuffleDeck() {
  if (!deckcardState.currentDeckName) return;
  await deckcardApi("POST", `/decks/${encodeURIComponent(deckcardState.currentDeckName)}/shuffle`, {});
  await openDeck(deckcardState.currentDeckName);
  showOrderView();
}

function showCardListView() {
  deckcardState.deckViewMode = "card";
  el("view-by-card-btn").classList.add("active");
  el("view-by-order-btn").classList.remove("active");
  el("shuffle-btn").classList.add("hidden");
  el("card-list").classList.remove("hidden");
  el("order-view").classList.add("hidden");
  populateSortSelect();
  if (deckcardState.currentDeck) renderCardList(deckcardState.currentDeck);
}

function showOrderView() {
  deckcardState.deckViewMode = "order";
  el("view-by-order-btn").classList.add("active");
  el("view-by-card-btn").classList.remove("active");
  el("shuffle-btn").classList.remove("hidden");
  el("card-list").classList.add("hidden");
  el("order-view").classList.remove("hidden");
  populateSortSelect();
  if (deckcardState.currentDeck) renderOccurrences(deckcardState.currentDeck);
}

async function openDeck(name) {
  deckcardState.currentDeckName = name;
  deckcardState.currentCardId = null;
  markActiveDeck(name);

  const deck = await deckcardApi("GET", `/decks/${encodeURIComponent(name)}`);
  deckcardState.currentDeck = deck;
  el("deck-title").textContent = `${deck.Name} — ${deck.Title || ""}`;
  renderDeckMeta(deck, "deck-meta");

  populateAddOccurrenceCardOptions(deck);
  el("add-occurrence").classList.add("hidden");

  if (deckcardState.deckViewMode === "order") {
    showOrderView();
  } else {
    showCardListView();
  }

  showDeckCardPanel("deck-view");
}

function setPreview(fieldId, previewId) {
  el(previewId).innerHTML = el(fieldId).value;
}

function wireLivePreview() {
  for (const field of ["N", "E", "X"]) {
    el(`field-${field}`).addEventListener("input", () => setPreview(`field-${field}`, `preview-${field}`));
  }
}

async function openCard(id) {
  const card = await deckcardApi("GET", `/cards/${encodeURIComponent(id)}`);
  deckcardState.currentCardId = card.ID;
  const owningDeck =
    deckcardState.currentDeck && deckcardState.currentDeck.Name === card.DECK_ID ? deckcardState.currentDeck : null;
  el("card-editor-title").textContent = owningDeck ? `${card.ID} — ${owningDeck.Title || ""}` : card.ID;
  el("card-error").classList.add("hidden");
  renderDeckMeta(owningDeck, "card-deck-meta");

  for (const field of ["N", "E", "D", "X", "A"]) {
    el(`field-${field}`).value = card[field] || "";
  }
  for (const field of ["N", "E", "X"]) {
    setPreview(`field-${field}`, `preview-${field}`);
  }

  showDeckCardPanel("card-editor");
}

async function saveCard() {
  const body = {};
  for (const field of ["N", "E", "D", "X", "A"]) {
    body[field] = el(`field-${field}`).value;
  }
  try {
    await deckcardApi("PUT", `/cards/${encodeURIComponent(deckcardState.currentCardId)}`, body);
    el("card-error").classList.add("hidden");
    await openDeck(deckcardState.currentDeckName);
    await openCard(deckcardState.currentCardId);
  } catch (err) {
    el("card-error").textContent = err.message;
    el("card-error").classList.remove("hidden");
  }
}

async function deleteCard() {
  if (!confirm(`Delete card ${deckcardState.currentCardId}?`)) return;
  await deckcardApi("DELETE", `/cards/${encodeURIComponent(deckcardState.currentCardId)}`);
  await openDeck(deckcardState.currentDeckName);
  showDeckCardPanel("deck-view");
}

async function createCard() {
  if (!deckcardState.currentDeckName) return;
  const card = await deckcardApi("POST", "/cards", { DECK_ID: deckcardState.currentDeckName });
  await loadDeckCardSidebar();
  await openDeck(deckcardState.currentDeckName);
  await openCard(card.ID);
}

const NEW_DECK_FORM_DEFAULTS = {
  Enabled: true,
  PullCounter: 0,
  MaxInterval: 10,
  AutoTickStreak: 1,
  AutoHammerCount: 2,
};

function setDeckFormValues(deck) {
  el("df-Name").value = deck.Name || "";
  el("df-Title").value = deck.Title || "";
  el("df-ID").value = deck.ID ?? "";
  el("df-Code").value = deck.Code || "";
  el("df-Enabled").checked = deck.Enabled !== false;
  el("df-PullCounter").value = deck.PullCounter ?? "";
  el("df-MaxInterval").value = deck.MaxInterval ?? "";
  el("df-AutoTickStreak").value = deck.AutoTickStreak ?? "";
  el("df-AutoHammerCount").value = deck.AutoHammerCount ?? "";
  el("df-Counter1").value = deck.Counter1 || "";
  el("df-Counter2").value = deck.Counter2 || "";
  el("df-Description").value = deck.Description || "";
}

function readDeckFormValues() {
  const numberOrUndefined = (value) => (value === "" ? undefined : Number(value));
  return {
    Name: el("df-Name").value.trim(),
    Title: el("df-Title").value.trim(),
    ID: numberOrUndefined(el("df-ID").value),
    Code: el("df-Code").value.trim(),
    Enabled: el("df-Enabled").checked,
    PullCounter: numberOrUndefined(el("df-PullCounter").value),
    MaxInterval: numberOrUndefined(el("df-MaxInterval").value),
    AutoTickStreak: numberOrUndefined(el("df-AutoTickStreak").value),
    AutoHammerCount: numberOrUndefined(el("df-AutoHammerCount").value),
    Counter1: el("df-Counter1").value.trim(),
    Counter2: el("df-Counter2").value.trim(),
    Description: el("df-Description").value.trim(),
  };
}

function openNewDeckForm() {
  deckcardState.deckFormMode = "create";
  el("deck-form-title").textContent = "New deck";
  el("deck-form-submit-btn").textContent = "Create";
  el("df-Name").disabled = false;
  setDeckFormValues(NEW_DECK_FORM_DEFAULTS);
  el("df-ID").placeholder = "(auto-assigned)";
  el("deck-form-error").classList.add("hidden");
  showDeckCardPanel("deck-form");
}

function openEditDeckForm() {
  if (!deckcardState.currentDeck) return;
  deckcardState.deckFormMode = "edit";
  el("deck-form-title").textContent = `Edit ${deckcardState.currentDeck.Name}`;
  el("deck-form-submit-btn").textContent = "Save";
  el("df-Name").disabled = true;
  el("df-ID").placeholder = "";
  setDeckFormValues(deckcardState.currentDeck);
  el("deck-form-error").classList.add("hidden");
  showDeckCardPanel("deck-form");
}

async function submitDeckForm() {
  const values = readDeckFormValues();
  if (deckcardState.deckFormMode === "create" && !values.Name) return;

  try {
    if (deckcardState.deckFormMode === "create") {
      const deck = await deckcardApi("POST", "/decks", values);
      await loadDeckCardSidebar();
      await openDeck(deck.Name);
    } else {
      await deckcardApi("PUT", `/decks/${encodeURIComponent(deckcardState.currentDeck.Name)}`, values);
      await loadDeckCardSidebar();
      await openDeck(deckcardState.currentDeck.Name);
    }
    el("deck-form-error").classList.add("hidden");
  } catch (err) {
    el("deck-form-error").textContent = err.message;
    el("deck-form-error").classList.remove("hidden");
  }
}

let deckcardSearchDebounceTimer = null;

function renderDeckCardSearchResults(results) {
  const container = el("search-results");
  container.innerHTML = "";
  const hasResults = results.decks.length > 0 || results.cards.length > 0;
  container.classList.toggle("hidden", !hasResults);
  if (!hasResults) return;

  for (const deck of results.decks) {
    const item = document.createElement("div");
    item.className = "search-result";
    item.textContent = `Deck: ${deck.Name} — ${deck.Title || ""}`;
    item.addEventListener("click", () => {
      el("search-input").value = "";
      container.classList.add("hidden");
      openDeck(deck.Name);
    });
    container.appendChild(item);
  }

  for (const card of results.cards) {
    const item = document.createElement("div");
    item.className = "search-result";
    item.textContent = `Card ${card.ID} (${card.DECK_ID}): ${card.preview}`;
    item.addEventListener("click", async () => {
      el("search-input").value = "";
      container.classList.add("hidden");
      await openDeck(card.DECK_ID);
      await openCard(card.ID);
    });
    container.appendChild(item);
  }

  if (results.cardsTotal > results.cards.length) {
    const more = document.createElement("div");
    more.className = "search-result-more";
    more.textContent = `+ ${results.cardsTotal - results.cards.length} more cards — refine your search`;
    container.appendChild(more);
  }
}

async function runDeckCardSearch(query) {
  if (!query.trim()) {
    el("search-results").classList.add("hidden");
    return;
  }
  const results = await deckcardApi("GET", `/search?q=${encodeURIComponent(query)}`);
  renderDeckCardSearchResults(results);
}

function wireDeckCardSearch() {
  el("search-input").addEventListener("input", (e) => {
    clearTimeout(deckcardSearchDebounceTimer);
    const query = e.target.value;
    deckcardSearchDebounceTimer = setTimeout(() => runDeckCardSearch(query), 200);
  });
}

// --- Init -------------------------------------------------------------

function init() {
  for (const btn of document.querySelectorAll(".tab")) {
    btn.addEventListener("click", () => showView(btn.dataset.view));
  }
  el("open-path-btn").addEventListener("click", openBundlePath);
  el("open-path-input").addEventListener("keydown", (e) => {
    if (e.key === "Enter") openBundlePath();
  });

  const uploadDz = el("upload-dropzone");
  const uploadFileInput = el("upload-file-input");
  uploadDz.addEventListener("dragover", (e) => { e.preventDefault(); uploadDz.classList.add("dragover"); });
  uploadDz.addEventListener("dragleave", () => uploadDz.classList.remove("dragover"));
  uploadDz.addEventListener("drop", (e) => {
    e.preventDefault();
    uploadDz.classList.remove("dragover");
    if (e.dataTransfer.files[0]) openBundleFromFile(e.dataTransfer.files[0]);
  });
  uploadFileInput.addEventListener("change", () => {
    if (uploadFileInput.files[0]) openBundleFromFile(uploadFileInput.files[0]);
    uploadFileInput.value = "";
  });
  el("active-session-select").addEventListener("change", (e) => setActiveSession(e.target.value));

  el("explorer-search").addEventListener("input", (e) => {
    clearTimeout(init._explorerSearchTimer);
    init._explorerSearchTimer = setTimeout(() => runExplorerSearch(e.target.value), 200);
  });
  el("explorer-sort").addEventListener("change", renderExplorerList);
  el("explorer-toggle-deobfuscated").addEventListener("click", toggleExplorerDeobfuscated);

  el("compare-run-btn").addEventListener("click", runCompare);

  el("editor-open-btn").addEventListener("click", openInEditor);
  el("editor-save-patch-btn").addEventListener("click", saveEditorPatch);

  el("patches-apply-btn").addEventListener("click", applyPreviewedPatch);

  el("assemble-run-btn").addEventListener("click", runAssemble);

  wireLivePreview();
  wireDeckCardSearch();
  el("new-card-btn").addEventListener("click", createCard);
  el("save-card-btn").addEventListener("click", saveCard);
  el("delete-card-btn").addEventListener("click", deleteCard);
  el("new-deck-btn").addEventListener("click", openNewDeckForm);
  el("edit-deck-btn").addEventListener("click", openEditDeckForm);
  el("deck-form-submit-btn").addEventListener("click", submitDeckForm);
  el("view-by-card-btn").addEventListener("click", showCardListView);
  el("view-by-order-btn").addEventListener("click", showOrderView);
  el("shuffle-btn").addEventListener("click", shuffleDeck);
  el("sort-select").addEventListener("change", handleSortChange);
  el("add-occurrence-toggle-btn").addEventListener("click", toggleAddOccurrenceBar);
  el("add-occurrence-btn").addEventListener("click", addOccurrenceToDeck);

  showDeckCardEmptyState();
  renderSessionBar();
  loadExistingSessions();
}

async function loadExistingSessions() {
  app.sessions = await api("GET", "/api/sessions");
  if (app.sessions.length && !app.activeSessionId) app.activeSessionId = app.sessions[0].id;
  renderSessionBar();
  populateComparePickers();
  refreshCurrentView();
  await openFromQueryParam();
}

init();
