// ui.js — stabbur's operator console (vanilla JS, no framework, no build
// step — D46).
//
// stabbur-editor-redesign: ONE editor serves the triage belt, a note opened
// from the Notes list, and New note (design D1). Its look and interaction are
// the locked reference, openspec/changes/stabbur-editor-redesign/mockups/
// stabbur-editor-redesign.html (D2), and this file is deliberately shaped like
// that mockup: the whole app is rendered from state into #app, every click
// re-renders, and typing only updates values, done-markers and the Save state.
//
// State lives in five objects:
//   S — shell: page, layout, open sheet/menu/popover, cached settings
//   E — the editor session for the note on screen (null when none)
//   T — the triage belt: queues, the in-memory queue, the undo history
//   N — the Notes list: filters, sort, page, rows
//   G — the grammar pages
//
// Hash routes: #/triage, #/notes, #/notes/:id, #/new-note, #/grammar,
// #/grammar/:id, #/grammar/new, #/settings.

'use strict';

(() => {
  // Empty at the domain root (local dev); the mount prefix (e.g. "/stabbur")
  // behind the gateway — substituted into index.html by app.py from the
  // proxy's X-Forwarded-Prefix header.
  const API_BASE = window.STABBUR_PREFIX || '';
  const app = document.getElementById('app');

  /* ------------------------------------------------------------- icons -- */
  const P = {
    spark: '<path d="M12 3.5l1.6 4.9 4.9 1.6-4.9 1.6L12 16.5l-1.6-4.9L5.5 10l4.9-1.6z"/><path d="M18.5 15.5l.6 1.9 1.9.6-1.9.6-.6 1.9-.6-1.9-1.9-.6 1.9-.6z"/>',
    trash: '<path d="M4.5 7h15M9.5 7V4.8h5V7M6.5 7l.8 12.2h9.4L17.5 7"/>',
    skip: '<path d="M6 6l6 6-6 6M13 6l6 6-6 6"/>',
    prev: '<path d="M9 14.5L4.5 10 9 5.5"/><path d="M4.5 10h10a5 5 0 010 10H12"/>',
    more: '<circle cx="5.5" cy="12" r="1.1"/><circle cx="12" cy="12" r="1.1"/><circle cx="18.5" cy="12" r="1.1"/>',
    play: '<path d="M8 5.5v13l10.5-6.5z"/>',
    pause: '<path d="M7 5h3.5v14H7zM13.5 5H17v14h-3.5z"/>',
    x: '<path d="M6 6l12 12M18 6L6 18"/>',
    rerun: '<path d="M19.5 12a7.5 7.5 0 11-2.2-5.3"/><path d="M19.5 4.5v4h-4"/>',
    back: '<path d="M14.5 5.5L8 12l6.5 6.5"/>',
    dup: '<rect x="8.5" y="8.5" width="11" height="11" rx="1.5"/><path d="M15.5 8.5V5.5a1 1 0 00-1-1h-9a1 1 0 00-1 1v9a1 1 0 001 1h3"/>',
    up: '<path d="M12 15.5V4.5M7.5 9L12 4.5 16.5 9"/><path d="M4.5 15v4.5h15V15"/>',
    clip: '<rect x="6" y="5" width="12" height="15.5" rx="1.5"/><path d="M9.5 5V3.5h5V5"/><path d="M9 11h6M9 14.5h4"/>',
    ext: '<path d="M10 5H5.5v13.5H19V14"/><path d="M13.5 4.5h6v6M19.5 4.5l-8 8"/>',
    drag: '<circle cx="9" cy="7" r=".9"/><circle cx="15" cy="7" r=".9"/><circle cx="9" cy="12" r=".9"/><circle cx="15" cy="12" r=".9"/><circle cx="9" cy="17" r=".9"/><circle cx="15" cy="17" r=".9"/>',
    search: '<circle cx="11" cy="11" r="6"/><path d="M20 20l-4.6-4.6"/>',
    filter: '<path d="M4 6.5h16M7 12h10M10 17.5h4"/>',
    snd: '<path d="M4.5 9.5h3l4.5-4v13l-4.5-4h-3z"/><path d="M15.5 9a4 4 0 010 6M18 6.5a7.5 7.5 0 010 11"/>',
    plus: '<path d="M12 5v14M5 12h14"/>',
    merge: '<path d="M6 4.5v4.5a4 4 0 004 4h8"/><path d="M14.5 9.5L18 13l-3.5 3.5"/><path d="M6 19.5v-6"/>',
    caret: '<path d="M7 10l5 5 5-5"/>',
    check: '<path d="M5 12.5l4.5 4.5L19 7.5"/>',
    pen: '<path d="M15 5l4 4L8.5 19.5H4.5v-4z"/>',
    sort: '<path d="M8 5v14M4.5 15.5L8 19l3.5-3.5M16 19V5M12.5 8.5L16 5l3.5 3.5"/>',
  };
  const ic = (n, c = '') => `<svg class="i ${c}" viewBox="0 0 24 24" aria-hidden="true">${P[n]}</svg>`;
  const esc = (s) => String(s ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

  /* ------------------------------------------------------------ domain -- */
  const TYPES = ['word', 'expression', 'listening', 'pronunciation', 'grammar'];
  const POS = ['substantiv', 'adjektiv', 'verb', 'adverb', 'preposisjon', 'konjunksjon'];
  const POSAB = { substantiv: 'subst', adjektiv: 'adj', verb: 'verb', adverb: 'adv', preposisjon: 'prep', konjunksjon: 'konj' };

  // The stored inflection keys per part of speech, with the label the editor
  // shows for each. The keys are the data model's (unchanged); the labels are
  // the mockup's. `article` is the noun's own field (the indefinite form is
  // stored without it), shown first so the row reads "en | bil".
  const SHAPES = {
    substantiv: [['article', 'artikkel'], ['sg_indef', 'ubestemt entall'], ['sg_def', 'bestemt entall'], ['pl_indef', 'ubestemt flertall'], ['pl_def', 'bestemt flertall']],
    adjektiv: [['positiv', 'hankjønn / hunkjønn'], ['nøytrum', 'intetkjønn'], ['flertall', 'flertall / bestemt'], ['komparativ', 'komparativ'], ['superlativ', 'superlativ']],
    verb: [['infinitiv', 'infinitiv'], ['presens', 'presens'], ['preteritum', 'preteritum'], ['perfektum', 'perfektum']],
    adverb: [['form', 'form']],
  };
  // Inflections count toward the done-markers only for these — the same
  // three routes/notes.py's completeness (and so the list's Complete column
  // and its least-complete sort) counts, so the marker and the column agree.
  const PARADIGM_POS = ['substantiv', 'adjektiv', 'verb'];
  const shapeKeys = (pos) => (SHAPES[pos] || []).map(([k]) => k);
  const shapeLabel = (key) => {
    for (const shape of Object.values(SHAPES)) for (const [k, l] of shape) if (k === key) return l;
    return key.replace(/_/g, ' ');
  };

  const KINDS = { pos: 'Part of speech', ipa: 'Pronunciation', translations: 'Translations', inflections: 'Inflections', examples: 'Examples', audio: 'Audio', stt: 'Text from audio' };
  // Which smia endpoint (and which Settings provider list) a sheet reads.
  // Part of speech has no endpoint of its own: it reads the inflections
  // lookup's reported `pos` (smia-enrichment-panel design D5).
  const API_KIND = { pos: 'inflections', inflections: 'inflections', ipa: 'ipa', translations: 'translations', examples: 'examples', audio: 'tts' };
  // forvo/filmot have no API — smia answers `{candidates: [], url}` — so they
  // are links at the bottom of the audio sheet, never boxes (design D9).
  const LINKP = ['forvo', 'filmot'];
  // Settings lists, in the reference's order. `pos` is its own list (served
  // from the inflections lookup, ordered independently); `stt` is smia's.
  // The Settings lists, in the reference's order, with the translations
  // entry expanded to one list per target language (design D4) — the
  // generic translations list is not shown, it is only the seed a new
  // language's list resolves from.
  const settingsKinds = () => [
    ['pos', 'Part of speech'],
    ['ipa', 'Pronunciation'],
    ...targetLangs().map((lang) => [trKey(lang), `Translations · ${lang}`]),
    ['inflections', 'Inflections'],
    ['examples', 'Examples'],
    ['tts', 'Audio'],
    ['stt', 'Text from audio'],
  ];
  // Which Settings provider list a sheet follows (the endpoint is API_KIND).
  const PREF_KIND = { pos: 'pos', inflections: 'inflections', ipa: 'ipa', translations: 'translations', examples: 'examples', audio: 'tts', stt: 'stt' };
  const LANG_FALLBACK = ['en', 'de', 'fr', 'sv', 'es'];
  const NAV = [['triage', 'Triage'], ['notes', 'Notes'], ['grammar', 'Grammar'], ['settings', 'Settings']];

  // design D9, the one slash rule, shared by the candidate normaliser here
  // and by the migration that split the stored rows: a translation value is
  // split on EVERY "/", spaces or no spaces; each part is trimmed; an empty
  // part is dropped; a value that yields no part is kept as it was.
  function splitAlternatives(text) {
    const raw = String(text == null ? '' : text);
    if (!raw.includes('/')) return [raw];
    const parts = raw.split('/').map((x) => x.trim()).filter(Boolean);
    return parts.length ? parts : [raw];
  }

  // smia's `_pos_for()` fallback tokens, mapped onto the canonical six.
  const POS_FALLBACK_MAP = { prep: 'preposisjon', konj: 'konjunksjon', sbu: 'konjunksjon', subst: 'substantiv' };
  function canonicalPos(raw) {
    if (!raw) return null;
    return POS.includes(raw) ? raw : (POS_FALLBACK_MAP[raw] || null);
  }

  // stabbur-triage-queues D5: part of speech ORDERS candidates, it never
  // filters them. Only a LEADING BRACKETED tag counts ("[verb] å komme i
  // vei"); dictcc_static's unbracketed "noun Br." is deliberately untagged.
  // Tags are normalised on both sides — dict.cc is English, stabbur Norwegian.
  const POS_TAG_ALIASES = {
    noun: 'substantiv', substantiv: 'substantiv', verb: 'verb', adj: 'adjektiv', adjective: 'adjektiv', adjektiv: 'adjektiv',
    adv: 'adverb', adverb: 'adverb', prep: 'preposisjon', preposisjon: 'preposisjon', conj: 'konjunksjon', konjunksjon: 'konjunksjon',
  };
  function normalizePosTag(raw) {
    if (!raw) return null;
    const key = String(raw).trim().toLowerCase().replace(/\.$/, '');
    return POS_TAG_ALIASES[key] || key || null;
  }
  function contextPosTag(context) {
    const m = context ? /^\s*\[([^\]]+)\]/.exec(context) : null;
    return m ? normalizePosTag(m[1]) : null;
  }
  // A stable partition: candidates matching the note's part of speech first.
  // With no part of speech, or no match, the provider's order is untouched.
  function orderByPos(list, notePos) {
    const wanted = normalizePosTag(notePos);
    if (!wanted) return list.slice();
    const match = list.filter((c) => c.tag === wanted);
    if (!match.length) return list.slice();
    return match.concat(list.filter((c) => c.tag !== wanted));
  }

  // Norwegian paradigm forms carry their grammatical marker in running text
  // (å ringe, har ringt, en ring); once filed under their own labelled field
  // the marker is stripped. A superlativ "strengest/strengeste" keeps the
  // first form.
  const INFL_PREFIX_STOPWORDS = { infinitiv: ['å'], perfektum: ['har', 'er'], sg_indef: ['en', 'et', 'ei'], sg_def: ['en', 'et', 'ei'] };
  function normalizeInflectionValue(field, value) {
    if (typeof value !== 'string') return value;
    let out = value;
    if (field === 'superlativ' && out.includes('/')) out = out.split('/')[0].trim();
    const stop = INFL_PREFIX_STOPWORDS[field];
    if (stop) {
      const tokens = out.trim().split(/\s+/);
      if (tokens.length > 1 && stop.includes(tokens[0].toLowerCase())) out = tokens.slice(1).join(' ');
    }
    return out;
  }
  // The article cut off sg_indef/sg_def is the noun's own `article` field.
  function deriveArticleToken(paradigm) {
    const source = paradigm && (paradigm.sg_indef || paradigm.sg_def);
    if (typeof source !== 'string') return null;
    const tokens = source.trim().split(/\s+/);
    return tokens.length > 1 && INFL_PREFIX_STOPWORDS.sg_indef.includes(tokens[0].toLowerCase()) ? tokens[0].toLowerCase() : null;
  }

  // Lemma follows a guess derived from the text until it is edited directly:
  // a leading article / infinitive marker and a trailing particle are
  // stripped ("å legge til" -> "legge").
  const LEMMA_PREFIX_STOPWORDS = new Set(['en', 'ei', 'et', 'å']);
  const LEMMA_SUFFIX_STOPWORDS = new Set(['til', 'ut', 'inn', 'opp', 'ned', 'av', 'på', 'i', 'om', 'for', 'fra', 'med', 'etter', 'over', 'under', 'sammen']);
  function deriveLemmaGuess(text) {
    const tokens = (text || '').trim().split(/\s+/).filter(Boolean);
    if (tokens.length <= 1) return tokens[0] || '';
    let start = 0;
    let end = tokens.length - 1;
    while (start < end && LEMMA_PREFIX_STOPWORDS.has(tokens[start].toLowerCase())) start += 1;
    while (end > start && LEMMA_SUFFIX_STOPWORDS.has(tokens[end].toLowerCase())) end -= 1;
    return tokens.slice(start, end + 1).join(' ');
  }
  // Examples and audio search the whole phrase, only a leading article or
  // infinitive marker stripped.
  function deriveExamplesQuery(text) {
    const tokens = (text || '').trim().split(/\s+/).filter(Boolean);
    if (tokens.length <= 1) return tokens[0] || '';
    let start = 0;
    while (start < tokens.length - 1 && LEMMA_PREFIX_STOPWORDS.has(tokens[start].toLowerCase())) start += 1;
    return tokens.slice(start).join(' ');
  }

  // stabbur stores the macro-language "no"; smia's providers want "nb".
  const smiaLang = (sourceLang) => (sourceLang === 'no' ? 'nb' : (sourceLang || 'nb'));

  // The gap marker for a token smia resolved nothing for — an assembled
  // transcription with a hole in it must LOOK like one.
  const TRANSCRIPTION_GAP = '…';

  /* --------------------------------------------------------------- api -- */
  async function api(path, options = {}) {
    let resp;
    try {
      resp = await fetch(`${API_BASE}${path}`, options);
    } catch (err) {
      return { status: 0, body: { error: `network error: ${err.message}` } };
    }
    const text = await resp.text();
    let body;
    try { body = JSON.parse(text); } catch { body = text; }
    return { status: resp.status, body };
  }
  const jsonReq = (method, body) => ({ method, headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) });
  const errMsg = (r, fallback = 'Something went wrong') => (r && r.body && r.body.error) || (r && r.status ? `${fallback} (${r.status})` : fallback);
  function qs(params) {
    const usp = new URLSearchParams();
    Object.entries(params).forEach(([k, v]) => { if (v !== null && v !== undefined && v !== '') usp.set(k, v); });
    const s = usp.toString();
    return s ? `?${s}` : '';
  }
  const blobUrl = (sha) => `${API_BASE}/blob/${sha}`;
  const previewUrl = (sha) => `${API_BASE}/api/enrich/tts/preview/${sha}`;

  /* ------------------------------------------------------------- state -- */
  const mq = window.matchMedia('(min-width: 960px)');
  const S = {
    page: 'notes', id: null, vp: mq.matches ? 'desktop' : 'phone',
    settings: null, catalog: null, rules: null,
    tab: 'word', sheet: null, menu: null, confirm: null, pick: null,
    playKey: null, clipBusy: false,
    copyOf: {}, // note id -> the text of the note it was duplicated from (this session)
  };
  let E = null;
  const T = {
    queues: [], selectedId: null, adhoc: null, counts: {},
    queue: [], index: 0, history: [], loading: false, truncated: false, busy: false,
  };
  const N = {
    F: blankFilters(), sort: 'updated', q: '', limit: 50, offset: 0,
    rows: [], total: 0, all: null, loading: false, seq: 0, error: null,
  };
  const G = { list: null, rule: null, used: [], edit: false, title: '', html: '', isNew: false, loading: false };

  function blankFilters() { return { status: 'any', type: [], pos: [], origin: [], audio: 'any', missing: [], within: 'any' }; }

  /* -------------------------------------------------- settings + look -- */
  const DEFAULT_SETTINGS = {
    default_target_langs: ['en', 'de'], providers: {}, prefill_timing: 'on_open', triage_navigate_save: 'autosave',
    examples_count: 3, examples_max_providers: 1, override_prefill: true, theme: 'auto', value_color: 'blue', value_color_custom: null,
  };
  const settings = () => S.settings || DEFAULT_SETTINGS;

  // Theme + value colour (D12). The same three attributes index.html's
  // inline script sets before first paint; cached for that script's
  // fallback when the server cannot read them.
  function applyLook(s) {
    const r = document.documentElement;
    if (s.theme === 'light' || s.theme === 'dark') r.dataset.theme = s.theme; else delete r.dataset.theme;
    r.dataset.val = s.value_color || 'blue';
    if (s.value_color === 'custom' && s.value_color_custom) r.style.setProperty('--val', s.value_color_custom);
    else r.style.removeProperty('--val');
    try {
      localStorage.setItem('stabbur_look', JSON.stringify({ theme: s.theme, value_color: s.value_color, value_color_custom: s.value_color_custom }));
    } catch { /* private mode */ }
  }
  async function loadSettings() {
    const r = await api('/api/settings');
    if (r.status === 200) { S.settings = r.body; applyLook(r.body); }
    return settings();
  }
  async function patchSettings(updates, okMsg = 'Saved') {
    const r = await api('/api/settings', jsonReq('PATCH', updates));
    if (r.status === 200) { S.settings = r.body; applyLook(r.body); if (okMsg) toast(okMsg); } else toast(errMsg(r, 'Could not save'));
    render();
    return r.status === 200;
  }
  async function loadCatalog() {
    if (S.catalog) return S.catalog;
    const r = await api('/api/enrich/providers');
    if (r.status === 200) S.catalog = r.body;
    return S.catalog || {};
  }
  async function loadRules(force) {
    if (S.rules && !force) return S.rules;
    const r = await api('/api/grammar_rules?sort=title_asc');
    S.rules = r.status === 200 ? r.body : (S.rules || []);
    return S.rules;
  }
  const ruleById = (id) => (S.rules || []).find((r) => r.id === id) || null;

  // Grammar HTML is operator content behind auth, but it is rendered, so
  // scripts and handlers must not run (design D13): drop executable and
  // embedding elements, every on* attribute, and javascript:/data: URLs.
  // SVG's SMIL elements (animate, set, …) can rewrite an href to a
  // javascript: URL, so they go too (both spellings: SVG names are
  // case-sensitive to selectors).
  const UNSAFE_TAGS = 'script,style,iframe,frame,frameset,object,embed,link,meta,base,form,noscript,template,'
    + 'animate,animateMotion,animatemotion,animateTransform,animatetransform,set,handler,listener';
  function sanitizeHtml(html) {
    const doc = new DOMParser().parseFromString(`<body>${html || ''}</body>`, 'text/html');
    doc.body.querySelectorAll(UNSAFE_TAGS).forEach((el) => el.remove());
    doc.body.querySelectorAll('*').forEach((el) => {
      Array.from(el.attributes).forEach((a) => {
        const name = a.name.toLowerCase();
        const val = a.value.replace(/[\s\u0000-\u001f]/g, '').toLowerCase();
        if (name.startsWith('on') || name === 'srcdoc'
          || (['href', 'src', 'xlink:href', 'action', 'formaction', 'background', 'poster'].includes(name)
            && (val.startsWith('javascript:') || val.startsWith('vbscript:') || val.startsWith('data:text')))
          || (['values', 'to', 'from', 'by'].includes(name) && (val.includes('javascript:') || val.includes('vbscript:')))) {
          el.removeAttribute(a.name);
        }
      });
    });
    return doc.body.innerHTML;
  }

  /* -------------------------------------------------------------- toast -- */
  const toastEl = document.createElement('div');
  toastEl.className = 'toast';
  toastEl.id = 'toast';
  toastEl.setAttribute('role', 'status');
  let toastTimer;
  function toast(m) {
    toastEl.textContent = m;
    toastEl.classList.add('on');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => toastEl.classList.remove('on'), 2400);
  }

  /* ------------------------------------------------------------- audio -- */
  // One player for the editor's selection, one for previews (candidates,
  // merge takes, reuse rows). Kept outside the DOM so a re-render never
  // interrupts playback.
  const PLAYER = new Audio();
  const PREVIEW = new Audio();
  PREVIEW.preload = 'none';
  let playRaf = null;
  const waveCache = {}; // sha -> 'loading' | { dur, peaks|null }
  const durCache = {}; // url -> seconds | 'loading'

  function stopAudio() {
    PLAYER.pause();
    PREVIEW.pause();
    if (playRaf) cancelAnimationFrame(playRaf);
    playRaf = null;
    S.playKey = null;
  }
  function metaDuration(url) {
    return new Promise((resolve) => {
      const a = new Audio();
      a.preload = 'metadata';
      const done = (v) => { a.src = ''; resolve(v); };
      a.addEventListener('loadedmetadata', () => done(Number.isFinite(a.duration) ? a.duration : 0), { once: true });
      a.addEventListener('error', () => done(0), { once: true });
      setTimeout(() => done(0), 15000);
      a.src = url;
    });
  }
  function durationOf(url) {
    const d = durCache[url];
    if (d === undefined) {
      durCache[url] = 'loading';
      metaDuration(url).then((v) => { durCache[url] = v; scheduleRender(); });
      return null;
    }
    return d === 'loading' ? null : d;
  }
  async function loadWave(sha) {
    if (!sha || waveCache[sha]) return;
    waveCache[sha] = 'loading';
    try {
      const buf = await (await fetch(blobUrl(sha))).arrayBuffer();
      const AC = window.AudioContext || window.webkitAudioContext;
      const ctx = new AC();
      const dec = await ctx.decodeAudioData(buf);
      if (ctx.close) ctx.close();
      const data = dec.getChannelData(0);
      const bars = 64;
      const step = Math.max(1, Math.floor(data.length / bars));
      const peaks = [];
      for (let i = 0; i < bars; i += 1) {
        let m = 0;
        for (let j = 0; j < step; j += 1) { const v = Math.abs(data[i * step + j] || 0); if (v > m) m = v; }
        peaks.push(m);
      }
      const mx = Math.max(...peaks) || 1;
      waveCache[sha] = { dur: dec.duration, peaks: peaks.map((p) => p / mx) };
    } catch {
      // A file the browser cannot decode still plays and trims: fall back to
      // the element's own metadata for the duration, with a flat waveform.
      waveCache[sha] = { dur: await metaDuration(blobUrl(sha)), peaks: null };
    }
    scheduleRender();
  }
  function previewToggle(key, url) {
    if (S.playKey === key) { stopAudio(); render(); return; }
    stopAudio();
    PREVIEW.src = url;
    S.playKey = key;
    PREVIEW.play().catch(() => { S.playKey = null; toast('Could not play that recording'); render(); });
    render();
  }
  PREVIEW.addEventListener('ended', () => { S.playKey = null; scheduleRender(); });

  /* ----------------------------------------------------------- the form -- */
  function normInfl(infl) {
    const out = {};
    Object.entries(infl || {}).forEach(([k, v]) => { out[k] = normalizeInflectionValue(k, v == null ? '' : String(v)); });
    return out;
  }
  function formFrom(n) {
    return {
      text: n.text || '', type: n.type || 'word', pos: n.pos || '', lemma: n.lemma || '',
      inflections: normInfl(n.inflections), audio_blob: n.audio_blob || null, audio_sel_ms: n.audio_sel_ms || null,
      transcription: n.transcription || '',
      translations: (n.translations || []).map((t) => ({ lang: t.lang || '', text: t.text || '' })),
      examples: (n.examples || []).slice(), grammar_rule_id: n.grammar_rule_id ?? null,
      status: n.status || 'draft', source_lang: n.source_lang || 'no',
    };
  }
  // What a save sends. Translations and examples are separate values end to
  // end; blank rows are simply not values. Inflections carry only the
  // current part of speech's fields — or, for a part of speech without a
  // paradigm, whatever was stored, untouched. So does a paradigm part of
  // speech typed into the custom field whose slots were never on screen
  // (`shapeSeen`): building the paradigm from those empty slots would wipe
  // the stored inflections on Save.
  function payload(f, withStatus) {
    let inflections;
    const unseen = E && E.shapeSeen !== f.pos;
    if (SHAPES[f.pos] && !unseen) {
      inflections = {};
      shapeKeys(f.pos).forEach((k) => {
        const v = normalizeInflectionValue(k, (f.inflections[k] || '').trim());
        if (v) inflections[k] = v;
      });
    } else {
      inflections = (E && E.stored && E.stored.inflections) || {};
    }
    const p = {
      text: f.text.trim(), type: f.type, pos: f.pos.trim() || null, lemma: f.lemma.trim() || null, inflections,
      audio_blob: f.audio_blob || null, audio_sel_ms: f.audio_blob ? (f.audio_sel_ms || null) : null,
      transcription: f.transcription.trim() || null,
      translations: f.translations.filter((t) => t.text.trim()).map((t) => ({ lang: (t.lang || '').trim(), text: t.text.trim() })),
      examples: f.examples.map((e) => e.trim()).filter(Boolean),
      grammar_rule_id: f.grammar_rule_id ?? null, source_lang: f.source_lang || 'no',
    };
    if (withStatus) p.status = f.status;
    return p;
  }
  const snapshot = (f, ctx) => JSON.stringify(payload(f, ctx === 'note'));

  function newEditor(ctx, note) {
    E = {
      ctx, id: note && note.id ? note.id : null, stored: note && note.id ? note : null,
      f: formFrom(note || {}), base: '', sim: [], simLoaded: false,
      cands: {}, prov: {}, audioFrom: note && note.audio_blob ? 'stored' : '',
      lemmaDirty: false, customPos: false, prefilling: false, seq: (E ? E.seq : 0) + 1,
    };
    E.customPos = !!(E.f.pos && !POS.includes(E.f.pos));
    E.shapeSeen = E.f.pos; // the form's inflections are the stored ones
    E.base = snapshot(E.f, ctx);
    // AFTER the baseline, deliberately: a derived lemma has to count as an
    // unsaved edit, or Save would read "Saved" and the value would never
    // reach the database (design D2).
    deriveLemmaOnOpen();
    if (E.f.audio_blob) loadWave(E.f.audio_blob);
    S.tab = 'word';
    return E;
  }
  // The lemma leads every lemma-queried lookup (inflections, part of
  // speech), so it is derived when a note is OPENED — in all three contexts,
  // not only on the belt, where Prefill used to be the only way to reach a
  // lemma-less note. A lemma the operator has actually set (one that differs
  // from the raw text) is never touched.
  function deriveLemmaOnOpen() {
    if (!E) return;
    const raw = E.f.text;
    if (E.f.lemma.trim() && E.f.lemma.trim() !== raw.trim()) return;
    const guess = deriveLemmaGuess(raw);
    if (guess && guess !== E.f.lemma.trim()) { E.f.lemma = guess; E.prov.lemma = 'derived from text'; }
  }
  // After a save or a merge: the stored row is the new baseline; everything
  // the session learned (candidates, provenance) stays.
  function rebase(note) {
    E.stored = note;
    E.id = note.id;
    E.f = formFrom(note);
    E.customPos = !!(E.f.pos && !POS.includes(E.f.pos));
    E.shapeSeen = E.f.pos;
    E.base = snapshot(E.f, E.ctx);
    if (E.f.audio_blob) loadWave(E.f.audio_blob);
  }
  const isDirty = () => !!E && snapshot(E.f, E.ctx) !== E.base;

  async function loadSimilar() {
    if (!E || !E.id) return;
    const e0 = E;
    const r = await api(`/api/notes/${E.id}/similar`);
    if (E !== e0) return;
    E.sim = r.status === 200 ? r.body : [];
    E.simLoaded = true;
    scheduleRender();
  }

  /* --------------------------------------------------------- markers -- */
  const hasText = (s) => !!(s && String(s).trim());
  function groups(f) {
    const w = [hasText(f.text), hasText(f.type), hasText(f.pos), hasText(f.lemma)];
    if (PARADIGM_POS.includes(f.pos)) w.push(shapeKeys(f.pos).every((k) => hasText(f.inflections[k])));
    const s = [!!f.audio_blob, hasText(f.transcription)];
    const m = [f.translations.some((t) => hasText(t.text)), f.examples.some(hasText)];
    const g = f.type === 'grammar' ? [f.grammar_rule_id != null] : [];
    const c = (a) => [a.filter(Boolean).length, a.length];
    return { word: c(w), sound: c(s), meaning: c(m), grammar: g.length ? c(g) : [f.grammar_rule_id != null ? 1 : 0, 0] };
  }
  function mkr(gk, f) {
    const [d, t] = groups(f)[gk];
    if (gk === 'grammar' && t === 0) return f.grammar_rule_id != null ? '<span class="mk full" title="linked"></span>' : '<span class="mk opt" title="optional"></span>';
    return d === t ? '<span class="mk full" title="complete"></span>' : `<span class="mk" title="missing something">${d}/${t}</span>`;
  }
  function refreshMarkers() {
    if (!E) return;
    app.querySelectorAll('[data-mk]').forEach((el) => { el.innerHTML = mkr(el.dataset.mk, E.f); });
  }
  function refreshSave() {
    if (!E || E.ctx !== 'note') return;
    const b = app.querySelector('#savebtn');
    if (!b) return;
    const d = isDirty();
    b.classList.toggle('clean', !d);
    b.innerHTML = d ? '<span class="dirty"></span>Save' : 'Saved';
  }
  function afterEdit() { refreshMarkers(); refreshSave(); }

  /* ------------------------------------------------------ suggestions -- */
  // The operator's target languages, with the same fallback the lookups and
  // the prefill walk use, so "which languages" is answered in one place.
  const targetLangs = () => {
    const l = settings().default_target_langs || [];
    return l.length ? l : ['en', 'de'];
  };
  // design D4: translations are ordered per target language, under
  // "translations:<lang>". Every other kind keeps one list.
  const trKey = (lang) => `translations:${lang}`;
  function kindProviders(kind, lang) {
    const prefs = settings().providers || {};
    if (kind === 'stt' && !prefs.stt) {
      const list = (S.catalog && S.catalog.stt) || [];
      return { enabled: list, off: 0, links: [] };
    }
    const key = kind === 'translations' ? trKey(lang || targetLangs()[0]) : PREF_KIND[kind];
    // The plain `translations` preference is the seed the server resolves a
    // language's list from; falling back to it here too keeps the sheet
    // sane in the one frame before the first settings read lands.
    const info = prefs[key] || prefs[PREF_KIND[kind]] || { order: [], disabled: [] };
    const dis = new Set(info.disabled || []);
    const order = info.order || [];
    let enabled = order.filter((p) => !dis.has(p));
    let links = [];
    if (kind === 'audio') {
      links = enabled.filter((p) => LINKP.includes(p));
      enabled = enabled.filter((p) => !LINKP.includes(p));
    }
    return { enabled, off: order.filter((p) => dis.has(p)).length, links };
  }
  // The providers a KIND needs boxes and answers for. Translations are the
  // union across the target languages, in first-appearance order: one box
  // per provider, asked once, rendered under every language that enables it.
  function enabledFor(kind) {
    if (kind !== 'translations') return kindProviders(kind).enabled;
    const out = [];
    targetLangs().forEach((lang) => kindProviders('translations', lang).enabled.forEach((p) => { if (!out.includes(p)) out.push(p); }));
    return out;
  }
  // Which of the target languages this provider is enabled for.
  const langsFor = (p) => targetLangs().filter((lang) => kindProviders('translations', lang).enabled.includes(p));
  // editor-session-hygiene D1: each kind queries from one named field.
  function defaultQuery(kind) {
    const f = E.f;
    if (kind === 'inflections') return f.lemma.trim();
    if (kind === 'examples') return deriveExamplesQuery(f.text);
    if (kind === 'pos') return f.lemma.trim() || f.text.trim();
    if (kind === 'audio') return deriveExamplesQuery(f.lemma.trim() || f.text.trim());
    if (kind === 'stt') return 'current audio';
    return f.text.trim();
  }

  // Identical lookups are shared (part of speech and inflections ask the
  // same question), and a sheet reopened for an unchanged query answers from
  // here. `force` is the operator's explicit rerun, which also tells smia
  // to bypass its cache (design D5 of lemma-first-suggestions).
  const lookupCache = new Map();
  function enrich(apiKind, provider, fields, force) {
    const key = JSON.stringify([apiKind, provider, fields]);
    if (!force && lookupCache.has(key)) return lookupCache.get(key);
    const p = api(`/api/enrich/${apiKind}`, jsonReq('POST', { ...fields, provider, ...(force ? { forceRefresh: true } : {}) }));
    lookupCache.set(key, p);
    p.then((r) => { if (r.status !== 200) lookupCache.delete(key); });
    return p;
  }

  // One provider's answer for one kind, normalised to a list of candidate
  // objects with a display value `v`.
  async function providerLookup(kind, p, q, force) {
    const lang = smiaLang(E.f.source_lang);
    if (kind === 'stt') {
      if (!E.f.audio_blob) return { list: [], note: 'No audio to transcribe yet' };
      const r = await api('/api/enrich/stt', jsonReq('POST', { provider: p, audio_blob: E.f.audio_blob, lang }));
      if (r.status !== 200 || typeof (r.body && r.body.text) !== 'string') return { list: [], error: errMsg(r, 'Transcription failed') };
      return { list: r.body.text.trim() ? [{ v: r.body.text.trim(), ctx: 'from current audio' }] : [] };
    }
    if (!q) return { list: [] };
    if (kind === 'translations') {
      // Only the languages whose own order enables this provider (D4).
      const langs = langsFor(p);
      if (!langs.length) return { list: [] };
      const answers = await Promise.all(langs.map((to) => enrich('translations', p, { text: q, from: lang, to }, force)));
      const list = [];
      // Per language, so that a 502 on de alone is reported in the de group
      // rather than showing there as "nothing for this word".
      const errs = {};
      let failed = 0;
      answers.forEach((r, i) => {
        if (r.status !== 200 || !r.body || !Array.isArray(r.body.candidates)) {
          failed += 1;
          errs[langs[i]] = errMsg(r, 'Lookup failed');
          return;
        }
        const seen = new Set();
        r.body.candidates.forEach((c) => {
          // design D9: a provider answering "hurry/rush" is offering two
          // alternatives, not one value — with or without spaces round the
          // slash. Each becomes its own candidate, so using one can never
          // write a joined string into a row.
          splitAlternatives(c.text || '').forEach((v) => {
            if (!v || seen.has(v)) return;
            seen.add(v);
            list.push({ lang: langs[i], v, ctx: c.context || '', tag: contextPosTag(c.context) });
          });
        });
      });
      if (failed === langs.length) return { list: [], errs, error: errMsg(answers[0], 'Lookup failed') };
      return { list, errs };
    }
    const fields = kind === 'ipa' ? { text: q, lang }
      : (kind === 'pos' || kind === 'inflections') ? { word: q, lang }
          // `examples_count` is M, the PER-PROVIDER number of sentences
          // (design D3) — so it is exactly this provider's limit.
        : kind === 'examples' ? { text: q, lang, limit: Math.min(10, Math.max(1, settings().examples_count || 3)) }
          : { text: q, lang };
    const r = await enrich(API_KIND[kind], p, fields, force);
    if (r.status !== 200 || !r.body) return { list: [], error: errMsg(r, 'Lookup failed') };
    const b = r.body;
    if (kind === 'audio' && Array.isArray(b.candidates) && !b.candidates.length && b.url) return { list: [], url: b.url };
    if (kind === 'ipa' && b.mode === 'per_word') {
      const list = [];
      if (b.joined) list.push({ asm: true, v: b.joined, ctx: 'assembled from single words' });
      (b.tokens || []).forEach((t) => {
        const cs = Array.isArray(t.candidates) ? t.candidates : [];
        if (!cs.length) list.push({ gap: true, token: t.text });
        cs.forEach((c) => list.push({ v: c.ipa || c.phonemic || c.phonetic || '', ctx: [t.text, c.variety].filter(Boolean).join(' · ') }));
      });
      return { list, tokens: b.tokens || [], joined: b.joined || null, perWord: true };
    }
    const cs = Array.isArray(b.candidates) ? b.candidates : [];
    if (kind === 'ipa') return { list: cs.map((c) => ({ v: c.ipa || c.phonemic || c.phonetic || '', ctx: c.variety || '' })) };
    if (kind === 'inflections') return { list: cs.map((c) => ({ v: c.paradigm || {}, pos: c.pos, lemma: c.lemma, ctx: [c.lemma, c.pos].filter(Boolean).join(' · ') })) };
    if (kind === 'pos') {
      const seen = new Set();
      const list = [];
      cs.forEach((c) => {
        const mapped = canonicalPos(c.pos);
        const key = mapped || `raw:${c.pos}`;
        if (seen.has(key)) return;
        seen.add(key);
        list.push({ v: mapped, raw: c.pos, ctx: mapped ? [c.lemma, c.pos].filter(Boolean).join(' · ') : `${c.pos || '—'} · no canonical part of speech` });
      });
      return { list };
    }
    if (kind === 'examples') {
      return {
        list: cs.filter((c) => c.text).map((c) => ({ v: c.text, ctx: [p, c.sense, c.source].filter(Boolean).join(' · ') })),
      };
    }
    if (kind === 'audio') return { list: cs.map((c) => ({ sha: c.sha256, v: c.context || q, tag: contextPosTag(c.context) })) };
    return { list: [] };
  }

  // Runs a kind's providers (all, or one) into E.cands[kind]. Every box
  // renders as its answer arrives.
  async function fetchKind(kind, opts = {}) {
    if (!E) return null;
    const e0 = E;
    if (kind === 'stt') await loadCatalog();
    const st = E.cands[kind] || (E.cands[kind] = { q: defaultQuery(kind), pq: {}, pqOpen: {}, P: {}, edited: false });
    if (opts.q !== undefined) st.q = opts.q;
    const { links } = kindProviders(kind);
    const targets = opts.only ? [opts.only] : enabledFor(kind).concat(links);
    if (!opts.only) st.fetched = true;
    await Promise.all(targets.map(async (p) => {
      const own = st.pq[p] !== undefined && st.pq[p].trim() ? st.pq[p].trim() : null;
      const q = own || st.q.trim();
      st.P[p] = { ...(st.P[p] || {}), loading: true, query: q };
      scheduleRender();
      let res;
      try { res = await providerLookup(kind, p, q, !!opts.force); } catch (err) { res = { list: [], error: err.message }; }
      if (E !== e0) return;
      st.P[p] = { ...res, loading: false, query: q };
      scheduleRender();
    }));
    return st;
  }
  // The answers a prefill or a reopened sheet can use as they stand: fetched
  // for the field's current default query, and not mid-flight.
  async function ensureKind(kind, force) {
    const st = E.cands[kind];
    const q = defaultQuery(kind);
    const enabled = enabledFor(kind);
    // A forced prefill is a genuine re-ask, never a replay of what is
    // already held: it always refetches, and `force` makes the lookup
    // bypass both this session's cache and smia's (design D7).
    const ready = !force && st && st.fetched && st.q === q && enabled.every((p) => st.P[p] && !st.P[p].loading && st.P[p].query === q);
    if (ready) return st;
    if (st) { st.pq = {}; st.pqOpen = {}; st.edited = false; }
    return fetchKind(kind, { q, force: !!force });
  }
  function ccount(kind) {
    const st = E && E.cands[kind];
    if (!st) return 0;
    return enabledFor(kind).reduce((a, p) => a + ((st.P[p] && st.P[p].list) || []).filter((c) => !c.gap).length, 0);
  }

  /* ------------------------------------------------------- render util -- */
  const sgb = (kind) => {
    const c = ccount(kind);
    return `<button class="sg" data-act="sheet" data-kind="${kind}" aria-label="Suggest ${KINDS[kind]}" title="Suggest ${KINDS[kind].toLowerCase()}">${ic('spark')}${c ? `<b>${c}</b>` : ''}</button>`;
  };
  const provTag = (k) => (E.prov[k] ? `<span class="prov" title="prefilled by ${esc(E.prov[k])}">${esc(E.prov[k])}</span>` : '');
  const lab = (txt, kind, forId, extra = '') => `<div class="fl"><label ${forId ? `for="${forId}"` : ''}>${txt}</label>${kind ? provTag(kind) : ''}${extra}<span class="grow"></span>${kind ? sgb(kind) : ''}</div>`;
  const pickBtn = (k, label, cls, extra = '') => `<button class="${cls}" data-act="pick" data-pick="${esc(k)}" ${extra} aria-haspopup="listbox">${label}</button>`;

  /* ------------------------------------------------------------ editor -- */
  function secWord() {
    const f = E.f;
    const shape = SHAPES[f.pos];
    const custom = E.customPos;
    if (shape) E.shapeSeen = f.pos; // its slots are rendered below
    return `
    <div class="f">${lab('Part of speech', 'pos')}
      ${custom ? `<input class="in" id="f_posc" data-f="posc" value="${esc(f.pos)}" placeholder="custom part of speech" aria-label="Custom part of speech">`
    : pickBtn('pos', `<span>${f.pos ? esc(f.pos) : '—'}</span>${ic('caret')}`, `selbtn${f.pos ? '' : ' none'}`)}</div>
    <div class="f">${lab('Lemma', null, 'f_lemma')}<input class="in" id="f_lemma" data-f="lemma" value="${esc(f.lemma)}" placeholder="dictionary form"></div>
    <div class="f">${lab('Inflections', shape ? 'inflections' : null)}
      ${shape ? `<div class="para">${shape.map(([k, l], i) => `<div class="f"><span class="k">${esc(l)}</span><input class="in" id="f_inf${i}" aria-label="${esc(l)}" data-f="infl" data-k="${esc(k)}" value="${esc(f.inflections[k] || '')}"></div>`).join('')}</div>`
    : `<div class="nopara">${f.pos ? `No paradigm for ${esc(f.pos)}` : 'Choose a part of speech to see its paradigm'}</div>`}</div>`;
  }
  function selection() {
    const f = E.f;
    const w = f.audio_blob ? waveCache[f.audio_blob] : null;
    const dur = w && w !== 'loading' ? w.dur || 0 : 0;
    const sel = f.audio_sel_ms;
    const a = dur && sel ? Math.max(0, Math.min(1, sel[0] / (dur * 1000))) : 0;
    const b = dur && sel ? Math.max(0, Math.min(1, sel[1] / (dur * 1000))) : 1;
    return { dur, a, b, peaks: w && w !== 'loading' ? w.peaks : null, loading: !w || w === 'loading' };
  }
  function wave(s) {
    const n = 64; const W = 640; const H = 56;
    let bars = '';
    for (let i = 0; i < n; i += 1) {
      const p = s.peaks ? s.peaks[i] || 0 : 0.12;
      const h = Math.max(3, (0.06 + 0.94 * p) * (H - 8));
      const x = i * (W / n) + 2; const fr = (i + 0.5) / n; const inS = fr >= s.a && fr <= s.b;
      bars += `<rect x="${x.toFixed(1)}" y="${((H - h) / 2).toFixed(1)}" width="5" height="${h.toFixed(1)}" rx="2" fill="${inS ? 'var(--accent)' : 'var(--wave)'}"/>`;
    }
    const ax = s.a * W; const bx = s.b * W;
    return `<svg viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" aria-label="Waveform with selection">
      <rect x="${ax}" y="0" width="${Math.max(0, bx - ax)}" height="${H}" fill="var(--accent-soft)"/>${bars}
      <rect x="${ax - 1}" y="0" width="2" height="${H}" fill="var(--accent)"/><rect x="${bx - 1}" y="0" width="2" height="${H}" fill="var(--accent)"/>
      <rect id="phd" x="-10" y="0" width="2" height="${H}" fill="var(--ink)"/></svg>`;
  }
  const msRange = (s) => `${Math.round(s.a * s.dur * 1000)}–${Math.round(s.b * s.dur * 1000)} ms`;
  const audioActions = () => `<div class="aacts"><button class="lnk" data-act="clip" ${S.clipBusy ? 'disabled' : ''}>${ic('clip')} ${S.clipBusy ? 'Fetching…' : 'Use URL from clipboard'}</button><button class="lnk" data-act="upload">${ic('up')} Upload file</button></div>`;
  function secSound() {
    const f = E.f;
    const s = f.audio_blob ? selection() : null;
    return `
    <div class="f">${lab('Audio', 'audio')}
      ${s ? `<div class="player"><button class="play" data-act="play" aria-label="Play selection">${ic(S.playKey === 'sel' ? 'pause' : 'play')}</button><div class="wv" id="wv">${wave(s)}</div></div>
      <div class="arange"><span id="arng">${s.loading ? 'loading…' : msRange(s)}</span>${s.loading ? '' : `<span>of ${s.dur.toFixed(2)} s</span>`}<span>· ${esc(E.audioFrom || 'stored')}</span></div>`
    : `<div class="noaudio">${ic('snd')} No audio yet</div>`}
      ${audioActions()}
    </div>
    <div class="f">${lab('Pronunciation · IPA', 'ipa', 'f_ipa')}<input class="in ipa" id="f_ipa" data-f="ipa" value="${esc(f.transcription)}" placeholder="/ … /" spellcheck="false"></div>`;
  }
  function secMeaning() {
    const f = E.f;
    return `
    <div class="f">${lab('Translations', 'translations')}
      <div class="rows">${f.translations.map((t, i) => `<div class="row">${pickBtn(`trl:${i}`, esc(t.lang || '—'), 'lang', `aria-label="Language ${esc(t.lang)}"`)}<input class="in" data-f="trt" data-i="${i}" value="${esc(t.text)}" aria-label="Translation"><button class="x" data-act="trdel" data-i="${i}" aria-label="Remove translation">${ic('x')}</button></div>`).join('') || '<div class="empty">No translations</div>'}</div>
      <button class="add" data-act="tradd">+ Add translation</button></div>
    <div class="f ex">${lab('Examples', 'examples')}
      <div class="rows">${f.examples.map((e, i) => `<div class="row"><textarea class="in" rows="1" data-f="ex" data-i="${i}" aria-label="Example ${i + 1}">${esc(e)}</textarea><button class="x" data-act="exdel" data-i="${i}" aria-label="Remove example">${ic('x')}</button></div>`).join('') || '<div class="empty">No examples</div>'}</div>
      <button class="add" data-act="exadd">+ Add example</button></div>`;
  }
  function ruleBtn() {
    const r = ruleById(E.f.grammar_rule_id);
    return pickBtn('rule', `<span>${r ? esc(r.title) : (E.f.grammar_rule_id != null ? `Rule #${E.f.grammar_rule_id}` : 'No rule linked')}</span>${ic('caret')}`, `selbtn${r || E.f.grammar_rule_id != null ? '' : ' none'}`);
  }
  function secGrammar() {
    const r = ruleById(E.f.grammar_rule_id);
    return `<div class="f"><div class="fl"><label>Grammar rule</label>${E.f.type === 'grammar' ? '' : '<span class="opt-tag">optional</span>'}</div>${ruleBtn()}
      ${r ? `<div class="rule rhtml-inline">${sanitizeHtml(r.html)}</div><a class="add" href="#/grammar/${r.id}">Open rule</a>` : ''}</div>`;
  }

  function queueLabel(q) {
    if (!q) return 'No queue';
    if (q.adhoc) return q.name || 'These results';
    if (q.builtin) return { capture: 'Drafts · captures', import: 'Drafts · imports', manual: 'Drafts · manual' }[q.name] || `Drafts · ${q.name}`;
    return q.name;
  }
  function activeQueue() {
    if (T.adhoc) return T.adhoc;
    return T.queues.find((q) => q.id === T.selectedId) || null;
  }
  function headBelt() {
    const tot = T.queue.length;
    const pos = tot ? Math.min(T.index + 1, tot) : 0;
    return `<div class="belt">${pickBtn('queue', `${esc(queueLabel(activeQueue()))} ${ic('caret')}`, 'qbtn')}
      <span class="pos"><b>${pos}</b> / ${tot}</span></div><div class="track"><span style="width:${tot ? (pos / tot * 100).toFixed(1) : 0}%"></span></div>`;
  }
  const typePill = () => pickBtn('type', `${esc(E.f.type)} ${ic('caret')}`, 'tpill', 'title="Type"');
  const prefillBtn = () => `<button class="pfb ${E.prefilling ? 'spin' : ''}" data-act="prefill" aria-label="Prefill" title="Prefill: fill every empty field from the first provider">${ic('spark')}${S.vp === 'phone' ? '' : 'Prefill'}${S.vp === 'desktop' && E.ctx === 'triage' ? ' <kbd>L</kbd>' : ''}</button>`;
  function metaBits() {
    const bits = [];
    if (E.ctx === 'new') bits.push('New note');
    else {
      const st = E.ctx === 'note' ? E.f.status : (E.stored ? E.stored.status : 'draft');
      bits.push(`<span class="st ${st}">${st}</span>`);
    }
    if (E.f.pos) bits.push(esc(E.f.pos));
    if (E.id && S.copyOf[E.id]) bits.push(`copy of ${esc(S.copyOf[E.id])}`);
    return bits.join('<span class="dot"></span>');
  }
  function editor() {
    const desk = S.vp === 'desktop';
    const sim = E.sim;
    const hwIn = `<textarea class="hw" id="f_text" data-f="text" rows="1" placeholder="Norwegian text" aria-label="Text" spellcheck="false">${esc(E.f.text)}</textarea>${sgb('stt')}`;
    const belt = E.ctx === 'triage' ? headBelt() : '';
    if (!desk) {
      // design D6: a filled accent badge, not a quiet outline chip — the
      // operator was missing these. Rendered only when there is a match.
      const chip = sim.length ? `<button class="chip simbadge" data-act="similar">${ic('merge', 's')} ${sim.length} similar</button>` : '';
      const tabs = [['word', 'Word'], ['sound', 'Sound'], ['meaning', 'Meaning'], ['grammar', 'Grammar']];
      const body = { word: secWord, sound: secSound, meaning: secMeaning, grammar: secGrammar }[S.tab]();
      return `<div class="wrap">${belt}
        <div class="eh"><div class="meta">${typePill()}${metaBits()}${chip}</div>
        <div class="hwrow">${hwIn}</div></div></div>
        <div class="tabs wrap" role="tablist">${tabs.map(([k, l]) => `<button role="tab" class="${k === 'grammar' && E.f.type !== 'grammar' ? 'opt' : ''}" aria-selected="${S.tab === k}" data-act="tab" data-v="${k}">${l}<span data-mk="${k}">${mkr(k, E.f)}</span></button>`).join('')}</div>
        <div class="wrap"><div class="pane" role="tabpanel">${body}</div></div>`;
    }
    const r = ruleById(E.f.grammar_rule_id);
    const simline = sim.length
      ? `<button class="simbadge" data-act="similar">${ic('merge', 's')} ${sim.length} similar</button> ${sim.map((s) => `<button class="nm" data-act="similar" data-v="${esc(s.id)}">${esc(s.text)}</button>`).join('<span class="dotsep"></span>')} <button class="lnk" data-act="similar" style="margin-left:6px">${ic('merge')} Review &amp; merge</button>`
      : '<span style="color:var(--faint)">No similar notes</span>';
    return `<div class="wrap">${belt}
      <div class="dmeta"><div class="meta">${metaBits()}</div><div class="simline">${simline}</div></div>
      <div class="hwrow">${hwIn}${typePill()}</div>
      <div class="zones">
        <section class="zone"><div class="zh">Word <span data-mk="word">${mkr('word', E.f)}</span></div>${secWord()}</section>
        <section class="zone"><div class="zh">Sound <span data-mk="sound">${mkr('sound', E.f)}</span></div>${secSound()}</section>
        <section class="zone"><div class="zh">Meaning <span data-mk="meaning">${mkr('meaning', E.f)}</span></div>${secMeaning()}</section>
      </div>
      <div class="gline"><span class="zh">Grammar <span data-mk="grammar">${mkr('grammar', E.f)}</span></span>${E.f.type === 'grammar' ? '' : '<span class="opt-tag">optional</span>'}${ruleBtn()}${r ? `<a class="add" style="padding:0" href="#/grammar/${r.id}">Open rule</a>` : ''}</div>
      ${r ? `<div class="gbody"><div class="rule">${sanitizeHtml(r.html)}</div></div>` : ''}
    </div>`;
  }
  function editorPage(ctx) {
    if (ctx === 'triage' && !E) {
      const belt = T.queues.length || T.adhoc ? headBelt() : '';
      if (T.loading) return `<div class="wrap">${belt}<div class="loading">Loading the queue…</div></div>`;
      const q = activeQueue();
      const reviewed = T.history.length;
      return `<div class="wrap">${belt}<div class="done-state"><h2>${T.queue.length ? 'End of this queue' : 'Nothing in this queue'}</h2>
        <p>${q ? `“${esc(queueLabel(q))}” has ${T.queue.length ? 'no more notes after this one' : 'no notes matching it right now'}.` : 'There is no queue to work.'}${reviewed ? ` ${reviewed} reviewed this pass — Previous takes you back.` : ''}</p>
        <div style="display:flex;gap:8px;flex-wrap:wrap">${reviewed ? '<button class="btn-s" data-act="t-prev">Previous</button>' : ''}${pickBtn('queue', `Pick a queue ${ic('caret')}`, 'btn-s')}<a class="btn-p" href="#/new-note">${ic('plus')} New note</a></div></div></div>`;
    }
    if (!E) return `<div class="wrap"><div class="loading">${S.notFound ? 'This note does not exist (any more).' : 'Loading…'}</div></div>`;
    return editor();
  }

  /* -------------------------------------------------------------- bars -- */
  function bar(ctx) {
    const d = S.vp === 'desktop';
    if (ctx === 'triage') {
      return `<div class="bar"><div class="bari">
      <button class="ib del" data-act="t-del" aria-label="Delete">${ic('trash')}${d ? 'Delete <kbd>D</kbd>' : ''}</button>
      ${d ? `<button class="ib" data-act="t-skip" aria-label="Skip">${ic('skip')}Skip <kbd>S</kbd></button>` : ''}
      <button class="ib" data-act="t-prev" aria-label="Previous">${ic('prev')}${d ? 'Previous <kbd>T</kbd>' : ''}</button>
      ${d ? '<span class="sp"></span>' : ''}
      <button class="ib" data-act="menu" aria-label="More actions">${ic('more')}</button>
      ${prefillBtn()}
      <button class="pri" data-act="t-ready">Ready &amp; next <kbd>R</kbd></button></div></div>`;
    }
    if (ctx === 'note') {
      const dirty = isDirty();
      return `<div class="bar"><div class="bari">
      <button class="ib" data-act="go" data-v="notes" aria-label="Back to notes">${ic('back')}${d ? 'Notes' : ''}</button>
      <div class="stseg" role="group" aria-label="Status"><button data-act="status" data-v="draft" aria-pressed="${E.f.status === 'draft'}">Draft</button><button data-act="status" data-v="ready" aria-pressed="${E.f.status === 'ready'}">Ready</button></div>
      ${d ? `<button class="ib" data-act="dup" aria-label="Duplicate note">${ic('dup')}Duplicate</button>` : ''}
      ${d ? '<span class="sp"></span>' : ''}
      <button class="ib" data-act="menu" aria-label="More actions">${ic('more')}</button>
      ${prefillBtn()}
      <button class="pri ${dirty ? '' : 'clean'}" data-act="save" id="savebtn">${dirty ? '<span class="dirty"></span>Save' : 'Saved'}</button></div></div>`;
    }
    return `<div class="bar"><div class="bari">${prefillBtn()}${d ? '<span class="sp"></span>' : ''}
      <button class="sec" data-act="new-save" data-v="draft">Save draft</button>
      <button class="pri" data-act="new-save" data-v="ready">Save as ready</button></div></div>`;
  }
  function pop() {
    if (S.confirm === 'delete' && E) {
      const hard = !E.stored || E.stored.status === 'draft';
      return `<div class="pop" role="dialog"><div class="q">Delete “${esc(E.f.text || (E.stored && E.stored.text) || '')}”?<small>${hard ? 'The note and its audio are removed. This cannot be undone.' : 'It is ready, so it may already have been pulled: the id is kept as a tombstone, the note leaves every list.'}</small></div><div class="two"><button data-act="cancel">Cancel</button><button class="danger" data-act="del-yes">Delete</button></div></div>`;
    }
    if (S.confirm === 'rule' && G.rule) {
      return `<div class="pop" role="dialog"><div class="q">Delete “${esc(G.rule.title)}”?<small>${G.rule.usage_count ? `${G.rule.usage_count} note${G.rule.usage_count === 1 ? '' : 's'} still use it — unlink them first.` : 'The rule is removed. This cannot be undone.'}</small></div><div class="two"><button data-act="cancel">Cancel</button><button class="danger" data-act="grdel-yes" ${G.rule.usage_count ? 'disabled' : ''}>Delete</button></div></div>`;
    }
    const forceItem = '<button data-act="prefill-force">Force prefill<small>re-asks and replaces what is already filled</small></button>';
    if (S.menu === 'triage') return `<div class="pop" role="menu">${S.vp === 'phone' ? '<button data-act="t-skip">Skip<span class="sp"></span><kbd>S</kbd></button>' : ''}${forceItem}<button data-act="tdup">Duplicate note</button><button data-act="t-back">Send to back<span class="sp"></span><kbd>E</kbd></button><button data-act="t-save">Save<span class="sp"></span><kbd>M</kbd></button></div>`;
    if (S.menu === 'note') return `<div class="pop" role="menu">${forceItem}<button data-act="dup">Duplicate note</button><button class="danger" data-act="n-del">Delete note</button></div>`;
    return '';
  }

  /* ----------------------------------------------------- picker menus -- */
  const FDEF = {
    status: { l: 'Status', single: 1, o: [['any', 'Any'], ['draft', 'Draft'], ['ready', 'Ready']] },
    type: { l: 'Type', o: TYPES.map((t) => [t, t]) },
    pos: { l: 'Part of speech', o: POS.map((t) => [t, t]) },
    origin: { l: 'Origin', o: [['manual', 'Manual'], ['capture', 'Capture'], ['import', 'Import']] },
    audio: { l: 'Audio', single: 1, o: [['any', 'Any'], ['has', 'Has audio'], ['none', 'No audio']] },
    missing: { l: 'Missing', o: [['ipa', 'No IPA'], ['translations', 'No translation'], ['examples', 'No examples'], ['lemma', 'No lemma']] },
    within: { l: 'Updated', single: 1, o: [['any', 'Any time'], ['today', 'Today'], ['week', 'This week'], ['month', 'This month']] },
  };
  const SORTS = [['updated', 'Recently updated'], ['created', 'Recently created'], ['az', 'Text A–Z'], ['complete', 'Least complete first']];
  const SORT_API = { updated: 'updated_desc', created: 'created_desc', az: 'text_asc', complete: 'complete_asc' };

  function langOptions(current) {
    const out = [];
    [...(settings().default_target_langs || []), ...LANG_FALLBACK, current].forEach((l) => { if (l && !out.includes(l)) out.push(l); });
    return out.map((l) => [l, l]);
  }
  function pickDef(k) {
    if (k === 'pos') return { h: 'Part of speech', o: [['', '—'], ...POS.map((t) => [t, t]), ['__c', 'custom…']], get: () => E.f.pos, set: (v) => { if (v === '__c') { E.customPos = true; return; } setPos(v); } };
    if (k === 'type') return { h: 'Type', o: TYPES.map((t) => [t, t]), get: () => E.f.type, set: (v) => { E.f.type = v; } };
    if (k.startsWith('trl:')) {
      const i = +k.slice(4);
      return { h: 'Language', o: langOptions(E.f.translations[i] && E.f.translations[i].lang), get: () => E.f.translations[i].lang, set: (v) => { E.f.translations[i].lang = v; } };
    }
    if (k === 'rule') return { h: 'Grammar rule', o: [['', 'No rule linked'], ...(S.rules || []).map((r) => [String(r.id), r.title])], get: () => (E.f.grammar_rule_id == null ? '' : String(E.f.grammar_rule_id)), set: (v) => { E.f.grammar_rule_id = v ? Number(v) : null; } };
    if (k === 'queue') {
      const o = T.queues.map((q) => [q.id, `${queueLabel(q)}${T.counts[q.id] !== undefined ? ` · ${T.counts[q.id]}` : ''}`]);
      if (T.adhoc) o.push(['__adhoc', `${queueLabel(T.adhoc)} · unsaved`]);
      return {
        h: 'Queue', o, acts: [['__edit', 'Edit queue…'], ['__savenew', 'Save as new queue…']],
        get: () => (T.adhoc ? '__adhoc' : T.selectedId),
        set: (v) => {
          if (v === '__edit') { openQueueEditor(false); return; }
          if (v === '__savenew') { openQueueEditor(true); return; }
          if (v === '__adhoc') return;
          T.adhoc = null; T.selectedId = v;
          try { localStorage.setItem('stabbur_triage_queue_id', v); } catch { /* ignore */ }
          loadQueue().then(() => toast(`Queue: ${queueLabel(activeQueue())}`));
        },
      };
    }
    if (k === 'sort') return { h: 'Sort by', o: SORTS, get: () => N.sort, set: (v) => { N.sort = v; N.offset = 0; fetchNotes(); } };
    if (k.startsWith('f:')) {
      const f = k.slice(2); const D = FDEF[f];
      return { h: D.l, o: D.o, multi: !D.single, get: () => N.F[f], set: (v) => { fToggle(f, v); N.offset = 0; fetchNotes(); } };
    }
    return null;
  }
  function menuHtml() {
    if (!S.pick) return '';
    const D = pickDef(S.pick.k);
    if (!D) return '';
    const val = D.get();
    const on = (v) => (D.multi ? val.includes(v) : val === v);
    return `<div class="menu ${S.pick.up ? 'up' : ''}" role="listbox" style="left:${S.pick.x}px;top:${S.pick.y}px">${D.h ? `<div class="mh">${D.h}</div>` : ''}${D.o.map(([v, l]) => `<button class="mi" role="option" data-act="pickv" data-v="${esc(v)}" aria-checked="${on(v)}"><span class="ck">${on(v) ? ic('check', 's') : ''}</span>${esc(l)}</button>`).join('')}${D.acts ? `<div class="sep"></div>${D.acts.map(([v, l]) => `<button class="mi act" data-act="pickv" data-v="${esc(v)}"><span class="ck"></span>${esc(l)}</button>`).join('')}` : ''}</div>`;
  }
  const scroller = () => app.querySelector('.scroll');
  function openPick(btn) {
    const r = btn.getBoundingClientRect(); const d = app.getBoundingClientRect();
    const x = Math.max(8, Math.min(r.left - d.left, d.width - 232));
    const below = d.bottom - r.bottom; const up = below < 260 && (r.top - d.top) > below;
    // `sc` is what tells a real scroll apart from a re-render's restore of
    // the position the page already had (design D1).
    const sc = scroller();
    S.pick = { k: btn.dataset.pick, x, y: up ? r.top - d.top - 4 : r.bottom - d.top + 4, up, sc: sc ? sc.scrollTop : 0 };
  }

  /* ------------------------------------------------------------ sheets -- */
  function sheetShell(label, title, inner, foot = '') {
    const a = S.sheet.anim ? 'anim' : '';
    return `<div class="sheetwrap ${a}"><div class="scrim" data-act="close"></div><div class="sheet" role="dialog" aria-label="${esc(label)}">
      <div class="grab"></div><div class="sh"><h3>${title}</h3><span class="sp"></span><button class="ib" data-act="close" aria-label="Close">${ic('x')}</button></div>${inner}${foot}</div></div>`;
  }
  function sheet() {
    if (!S.sheet) return '';
    const k = S.sheet.kind;
    if (k === 'filters') return filterSheet();
    if (k === 'queue') return queueSheet();
    if (!E) return '';
    if (k === 'similar') return simSheet();
    return suggestSheet(k);
  }
  function used(k, c) {
    const f = E.f;
    if (k === 'translations') return f.translations.some((t) => t.text === c.v && t.lang === c.lang);
    if (k === 'examples') return f.examples.includes(c.v);
    if (k === 'pos') return !!c.v && f.pos === c.v;
    if (k === 'ipa') return c.asm ? f.transcription.trim() === c.v : ` ${f.transcription.trim()} `.includes(` ${c.v} `);
    if (k === 'inflections') {
      const keys = shapeKeys(f.pos).filter((x) => x in c.v);
      return keys.length > 0 && keys.every((x) => (f.inflections[x] || '') === normalizeInflectionValue(x, c.v[x]));
    }
    if (k === 'stt') return f.text.trim() === c.v;
    if (k === 'audio') return !!E.usedSha && E.usedSha === c.sha && f.audio_blob === E.usedBlob;
    return false;
  }
  function candRow(k, p, c, i) {
    if (c.gap) return `<div class="none">No entry for “${esc(c.token)}”</div>`;
    const u = used(k, c);
    const pm = (E.f.pos && c.tag && c.tag === normalizePosTag(E.f.pos) && (k === 'translations' || k === 'audio')) ? `<span class="pm" title="matches ${esc(E.f.pos)}">${esc(POSAB[E.f.pos] || E.f.pos)}</span>` : '';
    const busy = S.sheet.busy === `${p}:${i}`;
    const confirmStt = k === 'stt' && S.sheet.confirmStt === `${p}:${i}`;
    let label = u ? 'Used' : (k === 'ipa' && c.asm ? 'Replace' : 'Use');
    if (busy) label = '…';
    if (confirmStt) label = 'Replace?';
    const disabled = (k === 'pos' && !c.v) || busy;
    const btn = (k === 'pos' && !c.v) ? '' : `<button class="use ${u ? 'done' : ''}" data-act="use" data-p="${esc(p)}" data-i="${i}" ${disabled ? 'disabled' : ''}>${label}</button>`;
    if (k === 'inflections') {
      const order = shapeKeys(c.pos);
      const entries = Object.entries(c.v).sort((a, b) => {
        const ia = order.indexOf(a[0]); const ib = order.indexOf(b[0]);
        return (ia < 0 ? 99 : ia) - (ib < 0 ? 99 : ib);
      });
      return `<div class="cd inf"><div class="v"><table class="mt">${entries.map(([a, b]) => `<tr><th>${esc(shapeLabel(a))}</th><td>${esc(b)}</td></tr>`).join('')}</table>${c.ctx ? `<small>${esc(c.ctx)}</small>` : ''}</div>${btn}</div>`;
    }
    if (k === 'audio') {
      const key = `cand:${c.sha}`;
      const dur = c.sha ? durationOf(previewUrl(c.sha)) : null;
      return `<div class="cd"><button class="pl" data-act="cplay" data-key="${esc(key)}" data-url="${esc(previewUrl(c.sha))}" aria-label="Play">${ic(S.playKey === key ? 'pause' : 'play')}</button><div class="v"><b>${esc(c.v || p)}</b>${pm}<small>${dur ? `${dur.toFixed(2)} s` : (dur === 0 ? '—' : '… s')}</small></div>${btn}</div>`;
    }
    const v = k === 'ipa' ? `<b class="ipa">${esc(c.v)}</b>` : `<b>${esc(c.v || c.raw || '')}</b>`;
    const lead = k === 'translations' ? `<span class="lg">${esc(c.lang)}</span>` : '';
    return `<div class="cd ${c.asm ? 'asm' : ''}">${lead}<div class="v">${v}${pm}${c.ctx ? `<small>${esc(c.ctx)}</small>` : ''}</div>${btn}</div>`;
  }
  function orderedList(k, list) {
    if (k === 'translations' || k === 'audio') return orderByPos(list, E.f.pos);
    if (k === 'pos' && E.f.pos) {
      const m = list.filter((c) => c.v === E.f.pos);
      return m.length ? m.concat(list.filter((c) => c.v !== E.f.pos)) : list.slice();
    }
    return list;
  }
  // One provider's box. `onlyLang`, used by the translations sheet, narrows
  // what the box LISTS without changing what was asked or the indices the
  // Use buttons carry — `data-i` always indexes the provider's own answer.
  function provBox(k, p, pi, st, q, onlyLang) {
    const R = st.P[p] || { loading: true, list: [] };
    const over = st.pq[p] !== undefined && st.pq[p].trim() && st.pq[p].trim() !== q.trim();
    const pqv = over ? st.pq[p].trim() : q;
    const all = R.list || [];
    const list = onlyLang ? all.filter((c) => c.lang === onlyLang) : all;
    const n = list.filter((c) => !c.gap).length;
    let body = `<div class="prv"><div class="prvh"><span class="n">${pi + 1}</span>${esc(p)}
        ${k === 'stt' ? '' : `<button class="pqb ${over ? 'over' : ''}" data-act="pqedit" data-p="${esc(p)}" title="Query for ${esc(p)} only">${over ? `“${esc(pqv)}”` : `${ic('pen', 's')} query`}</button>`}
        <span class="sp"></span><span class="c">${R.loading ? '…' : `${n || 'no'} result${n === 1 ? '' : 's'}`}</span></div>`;
    if (st.pqOpen[p]) body += `<div class="pqrow"><input class="in" data-f="pq" data-p="${esc(p)}" value="${esc(st.pq[p] !== undefined ? st.pq[p] : '')}" aria-label="Query for ${esc(p)}" spellcheck="false" placeholder="${esc(q)}"><button class="ib" data-act="pqreset" data-p="${esc(p)}" title="Back to the shared query">Reset</button><button class="ib ${R.loading && S.sheet.pspin === p ? 'spin' : ''}" data-act="prerun" data-p="${esc(p)}" aria-label="Run ${esc(p)} again">${ic('rerun')}</button></div>`;
    const langErr = onlyLang && R.errs ? R.errs[onlyLang] : null;
    if (R.loading) body += '<div class="skel"></div>';
    else if (R.error || langErr) body += `<div class="err">${esc(langErr || R.error)}</div>`;
    else if (R.note) body += `<div class="none">${esc(R.note)}</div>`;
    else if (!n && !list.length) body += `<div class="none">Nothing for “${esc(R.query !== undefined ? R.query : pqv)}”</div>`;
    if (!R.loading) orderedList(k, list).forEach((c) => { body += candRow(k, p, c, all.indexOf(c)); });
    return `${body}</div>`;
  }
  function suggestSheet(k) {
    const st = E.cands[k] || { q: defaultQuery(k), pq: {}, pqOpen: {}, P: {} };
    const q = st.q;
    const { off, links } = kindProviders(k);
    const enabled = enabledFor(k);
    let body = '';
    if (!enabled.length) body += `<div class="none" style="margin-top:14px">No providers answer ${esc(KINDS[k].toLowerCase())} right now${k === 'stt' ? '' : ' — check Settings → Provider order, or whether smia is reachable'}.</div>`;
    if (k === 'translations') {
      // design D4: grouped by language, each group in ITS OWN provider
      // order, so the sheet says the same thing Settings does.
      targetLangs().forEach((lang) => {
        const own = kindProviders('translations', lang).enabled;
        body += `<div class="lgrp" data-lang="${esc(lang)}"><div class="lgh"><span class="lg">${esc(lang)}</span><span class="sp"></span><span class="c">${own.length} provider${own.length === 1 ? '' : 's'}</span></div>`;
        if (!own.length) body += `<div class="none">No provider is enabled for ${esc(lang)} — Settings → Provider order.</div>`;
        own.forEach((p, pi) => { body += provBox(k, p, pi, st, q, lang); });
        body += '</div>';
      });
    } else {
      enabled.forEach((p, pi) => { body += provBox(k, p, pi, st, q); });
    }
    if (k === 'audio') {
      body += reuseBox();
      if (links.length) {
        body += `<div class="ext"><span class="t">Open elsewhere</span>${links.map((p) => {
          const R = st.P[p];
          const url = (R && R.url) || (p === 'forvo' ? `https://forvo.com/search/${encodeURIComponent(q)}/no/` : `https://filmot.com/search/${encodeURIComponent(q)}/1?lang=no`);
          return `<a href="${esc(url)}" target="_blank" rel="noopener noreferrer">${esc(p)}<span class="sp"></span>${ic('ext')}</a>`;
        }).join('')}</div>`;
      }
      body += audioActions();
    }
    // Per language for translations, so the count is not just en's.
    const offCount = k === 'translations'
      ? targetLangs().reduce((a, lang) => a + kindProviders('translations', lang).off, 0)
      : off;
    body += `<div class="shf">Order follows Settings · <button data-act="go" data-v="settings">Provider order</button>${offCount ? ` · ${offCount} switched off` : ''}</div>`;
    const spinning = S.sheet.spin && enabled.some((p) => st.P[p] && st.P[p].loading);
    return sheetShell(`${KINDS[k]} suggestions`, KINDS[k], `<div class="shq"><input class="in" id="shq" data-f="q" value="${esc(q)}" aria-label="Shared query" spellcheck="false" ${k === 'stt' ? 'readonly' : ''}><button class="ib ${spinning ? 'spin' : ''}" data-act="rerun" aria-label="Run all providers again">${ic('rerun')}</button></div><div class="shb">${body}</div>`);
  }
  // stabbur-triage-queues D9: a recording already stored on another note can
  // be attached to this one — found through the notes that reference it.
  function reuseBox() {
    const R = S.sheet.reuse || { q: '', rows: null };
    let rows = '';
    if (R.loading) rows = '<div class="skel"></div>';
    else if (R.rows && !R.rows.length) rows = `<div class="none">No note with a recording matches “${esc(R.q)}”</div>`;
    else if (R.rows) {
      rows = R.rows.map((n) => {
        const key = `reuse:${n.id}`;
        const tr = n.translations && n.translations[0] ? n.translations[0].text : '';
        return `<div class="cd"><button class="pl" data-act="cplay" data-key="${esc(key)}" data-url="${esc(blobUrl(n.audio_blob))}" aria-label="Play">${ic(S.playKey === key ? 'pause' : 'play')}</button><div class="v"><b>${esc(n.text)}</b><small>${esc([n.status, n.origin, tr].filter(Boolean).join(' · '))}</small></div><button class="use" data-act="rattach" data-v="${esc(n.id)}">${E.f.audio_blob === n.audio_blob ? 'Used' : 'Attach'}</button></div>`;
      }).join('');
    }
    return `<div class="reuse"><span class="t">Reuse from another note</span><div class="srch"><label class="box">${ic('search')}<input class="in" data-f="reuseq" placeholder="Text, lemma or translation" value="${esc(R.q)}" aria-label="Search your notes' audio"></label><button class="btn-s" data-act="rsearch">Search</button></div>${rows}</div>`;
  }

  /* --------------------------------------------------- similar / merge -- */
  const TAKES = [['text', 'Text'], ['lemma', 'Lemma'], ['pos', 'Part of speech'], ['infl', 'Inflections'], ['audio', 'Audio'], ['ipa', 'IPA'], ['tr', 'Translations'], ['ex', 'Examples']];
  const TAKE_FIELDS = { text: ['text'], lemma: ['lemma'], pos: ['pos'], infl: ['inflections'], audio: ['audio_blob', 'audio_sel_ms'], ipa: ['transcription'], tr: ['translations'], ex: ['examples'] };
  function valsOfMatch(m) {
    return { text: m.text || '', lemma: m.lemma || '', pos: m.pos || '', infl: m.inflections || {}, audio: m.audio_blob || null, ipa: m.transcription || '', tr: m.translations || [], ex: m.examples || [] };
  }
  function valsOfForm() {
    const p = payload(E.f, false);
    return { text: p.text, lemma: p.lemma || '', pos: p.pos || '', infl: p.inflections || {}, audio: p.audio_blob, ipa: p.transcription || '', tr: p.translations, ex: p.examples };
  }
  function tval(o, k) {
    if (k === 'tr') return o.tr.map((t) => `${t.lang} ${t.text}`).join(', ');
    if (k === 'ex') return o.ex.join(' · ');
    if (k === 'infl') return Object.values(o.infl).filter(Boolean).join(' · ');
    if (k === 'audio') {
      if (!o.audio) return '';
      const d = durationOf(blobUrl(o.audio));
      return `recording${d ? ` · ${d.toFixed(2)} s` : ''}`;
    }
    if (k === 'ipa') return o.ipa ? `/${o.ipa}/` : '';
    return o[k] || '';
  }
  function mergeSides(m) {
    const into = S.sheet.dir !== 'out';
    const from = into ? valsOfMatch(m) : valsOfForm();
    const keep = into ? valsOfForm() : valsOfMatch(m);
    return { into, from, keep };
  }
  const openIsReady = () => (E.stored && E.stored.status === 'ready') || (E.ctx === 'note' && E.f.status === 'ready');
  function preTake(m) {
    const { from, keep } = mergeSides(m);
    const t = {};
    TAKES.forEach(([k]) => {
      const mine = tval(keep, k); const theirs = tval(from, k);
      t[k] = !!theirs && (!mine || k === 'tr' || k === 'ex') && mine !== theirs;
    });
    S.sheet.take = t;
  }
  function defaultDir(m) {
    if (m.status !== 'draft' && !openIsReady()) return 'out';
    return 'in';
  }
  function simSheet() {
    const sh = S.sheet;
    const body = E.sim.map((o) => {
      const open = sh.open === o.id; const tk = sh.take || {};
      let html = `<div class="sim"><div class="simt"><b>${esc(o.text)}</b><small><span class="st ${o.status}">${o.status}</span> · ${esc(o.type)}${o.pos ? ` · ${esc(o.pos)}` : ''}</small></div>
        <div class="sima">${E.ctx === 'triage' ? `<a class="lnk" href="#/notes/${esc(o.id)}" target="_blank" rel="noopener">${ic('ext')} Open</a>` : `<button class="lnk" data-act="simopen" data-v="${esc(o.id)}">${ic('ext')} Open</button>`}<button class="lnk" data-act="mergeopen" data-v="${esc(o.id)}" aria-expanded="${open}">${ic('merge')} ${open ? 'Hide merge' : 'Merge…'}</button></div>`;
      if (open) {
        const inBlocked = o.status !== 'draft';
        const outBlocked = openIsReady();
        const { into, from, keep } = mergeSides(o);
        const blocked = into ? inBlocked : outBlocked;
        const cnt = TAKES.filter(([k]) => tk[k] && tval(from, k)).length;
        const fromAudio = from.audio;
        html += `<div class="dir" role="group" aria-label="Merge direction"><button data-act="mdir" data-v="in" aria-pressed="${into}" ${inBlocked ? `disabled title="Only a draft can be merged away — “${esc(o.text)}” is ready"` : ''}>Into this note</button><button data-act="mdir" data-v="out" aria-pressed="${!into}" ${outBlocked ? 'disabled title="Only a draft can be merged away — this note is ready"' : ''}>This note into “${esc(o.text)}”</button></div>
          ${outBlocked ? '<div class="dirwhy">Only a draft can be merged away — this note is ready, so it can only absorb.</div>' : ''}
          ${inBlocked ? `<div class="dirwhy">Only a draft can be merged away — “${esc(o.text)}” is ready, so it can only absorb this note.</div>` : ''}
          <div class="dirnote">${into ? `<b>${esc(keep.text)}</b> survives. Take from <b>${esc(o.text)}</b>, which is then deleted.` : `<b>${esc(o.text)}</b> survives. Take from <b>${esc(from.text)}</b> (this note), which is then deleted.`}</div>
          <div class="takes">${TAKES.map(([k, l]) => {
    const v = tval(from, k); const on = !!tk[k] && !!v;
    const key = `take:${o.id}`;
    return `<div class="take ${v ? '' : 'dis'}"><span class="k">${l}</span>${k === 'audio' && v ? `<button class="pl" data-act="cplay" data-key="${key}" data-url="${esc(blobUrl(fromAudio))}" aria-label="Play ${esc(from.text)} audio">${ic(S.playKey === key ? 'pause' : 'play')}</button>` : ''}<span class="v ${k === 'ipa' ? 'ipa' : ''}" ${v ? `data-act="take" data-v="${k}"` : ''}>${v ? esc(v) : '<span style="color:var(--faint)">empty</span>'}</span><button class="tg" ${v ? `data-act="take" data-v="${k}"` : 'disabled'} aria-pressed="${on}" aria-label="Take ${l}"></button></div>`;
  }).join('')}
          <button class="pri mergebtn" data-act="merge" data-v="${esc(o.id)}" ${blocked || sh.busy ? 'disabled' : ''}>${sh.busy ? 'Merging…' : `Merge ${cnt} field${cnt === 1 ? '' : 's'} · keep “${esc(keep.text)}”`}</button></div>`;
      }
      return `${html}</div>`;
    }).join('');
    return sheetShell('Similar notes', 'Similar notes', `<div class="shb">${body || '<div class="none">No similar notes</div>'}<div class="shf">Taking IPA replaces the survivor's transcription. Translations and examples are added.</div></div>`);
  }

  /* ----------------------------------------------- notes list + filters -- */
  function fToggle(f, v) {
    const D = FDEF[f];
    if (D.single) N.F[f] = (N.F[f] === v && v !== 'any') ? 'any' : v;
    else { const a = N.F[f]; const i = a.indexOf(v); if (i < 0) a.push(v); else a.splice(i, 1); }
  }
  function activeChips() {
    const out = [];
    Object.keys(FDEF).forEach((f) => {
      const D = FDEF[f];
      if (D.single) { if (N.F[f] !== 'any') out.push([f, N.F[f], D.o.find((o) => o[0] === N.F[f])[1].toLowerCase()]); } else N.F[f].forEach((v) => out.push([f, v, D.o.find((o) => o[0] === v)[1].toLowerCase()]));
    });
    return out;
  }
  function notesFilterParams() {
    const F = N.F; const p = {};
    if (F.status !== 'any') p.status = F.status;
    if (F.type.length) p.type = F.type.join(',');
    if (F.pos.length) p.pos = F.pos.join(',');
    if (F.origin.length) p.origin = F.origin.join(',');
    if (F.audio !== 'any') p.audio = F.audio;
    if (F.missing.length) p.missing = F.missing.join(',');
    if (F.within !== 'any') p.updated_within = F.within;
    if (N.q.trim()) p.q = N.q.trim();
    return p;
  }
  let notesTimer;
  function fetchNotesSoon() { clearTimeout(notesTimer); notesTimer = setTimeout(fetchNotes, 250); }
  async function fetchNotes() {
    const seq = ++N.seq;
    N.loading = true;
    scheduleRender();
    const r = await api(`/api/notes/authoring${qs({ ...notesFilterParams(), sort: SORT_API[N.sort], limit: N.limit, offset: N.offset })}`);
    if (seq !== N.seq) return;
    N.loading = false;
    if (r.status === 200) { N.rows = r.body.notes || []; N.total = r.body.total || 0; N.error = null; } else { N.rows = []; N.total = 0; N.error = errMsg(r, 'Could not load notes'); }
    scheduleRender();
  }
  function rel(iso) {
    if (!iso) return '';
    const m = (Date.now() - new Date(iso).getTime()) / 60000;
    if (m < 1) return 'now';
    if (m < 60) return `${Math.round(m)} min`;
    const h = m / 60;
    if (h < 24) return `${Math.round(h)} h`;
    const d = h / 24;
    if (d < 7) return `${Math.round(d)} d`;
    if (d < 30) return `${Math.round(d / 7)} w`;
    if (d < 365) return `${Math.round(d / 30)} mo`;
    return `${Math.round(d / 365)} y`;
  }
  function filterSheet() {
    const sec = (f) => {
      const D = FDEF[f];
      return `<div class="fsec"><span class="lb">${D.l}</span><div class="chips">${D.o.map(([v, l]) => { const on = D.single ? N.F[f] === v : N.F[f].includes(v); return `<button class="fc" data-act="fset" data-k="${f}" data-v="${v}" aria-pressed="${on}">${l}</button>`; }).join('')}</div></div>`;
    };
    const inner = `<div class="shb">${Object.keys(FDEF).map(sec).join('')}
      <div class="fsec"><span class="lb">Sort by</span><div class="chips">${SORTS.map(([v, l]) => `<button class="fc" data-act="sortset" data-v="${v}" aria-pressed="${N.sort === v}">${l}</button>`).join('')}</div></div></div>`;
    const n = N.total;
    return sheetShell('Filters', 'Filters', inner, `<div class="shfoot"><button class="sec" data-act="freset">Reset</button><button class="pri" data-act="close">${N.loading ? 'Counting…' : `Show ${n} note${n === 1 ? '' : 's'}`}</button></div>`);
  }
  function notesPage() {
    const d = S.vp === 'desktop'; const L = N.rows; const A = activeChips();
    const sortL = SORTS.find((s) => s[0] === N.sort)[1];
    const chips = A.length ? `<div class="achips">${A.map(([f, v, l]) => `<button class="ac" data-act="frm" data-k="${f}" data-v="${v}" aria-label="Remove filter ${esc(l)}">${esc(l)} ${ic('x')}</button>`).join('')}<button class="clr" data-act="freset">Clear all</button></div>` : '';
    const sub = (n) => [n.type, n.pos, n.translations && n.translations[0] && n.translations[0].text, rel(n.updated_at)].filter(Boolean).map(esc).join(' · ');
    const pct = (n) => (n.completeness && n.completeness.applicable ? Math.round(n.completeness.filled / n.completeness.applicable * 100) : 0);
    let rows;
    if (N.error) rows = `<div class="nores">${esc(N.error)}</div>`;
    else if (!L.length) rows = `<div class="nores">${N.loading ? 'Loading…' : (N.total ? 'No notes on this page — the filters changed under it.' : 'No notes match these filters.')}</div>`;
    else if (d) {
      rows = `<div class="tblw"><table class="tbl"><thead><tr><th>Text</th><th>Type</th><th>Part of speech</th><th>Translation</th><th>Origin</th><th>Status</th><th>Audio</th><th>Complete</th><th>Updated</th></tr></thead><tbody>
      ${L.map((n) => `<tr data-act="open" data-v="${esc(n.id)}" tabindex="0"><td>${esc(n.text)}</td><td>${esc(n.type)}</td><td>${n.pos ? esc(n.pos) : '<span style="color:var(--faint)">—</span>'}</td><td>${esc(n.translations && n.translations[0] ? n.translations[0].text : '')}</td><td>${esc(n.origin)}</td><td><span class="st ${n.status}">${n.status}</span></td><td style="color:var(--faint)">${n.audio_blob ? ic('snd', 's') : '—'}</td><td><span class="cbar" title="${n.completeness ? `${n.completeness.filled}/${n.completeness.applicable}` : ''}"><i style="width:${pct(n)}%"></i></span></td><td class="num">${esc(rel(n.updated_at))}</td></tr>`).join('')}</tbody></table></div>`;
    } else {
      rows = `<div class="nlist">${L.map((n) => `<button class="nrow" data-act="open" data-v="${esc(n.id)}"><div class="ntop"><span class="nhw">${esc(n.text)}</span><span class="ngl"><span class="${n.audio_blob ? '' : 'off'}" title="${n.audio_blob ? 'has audio' : 'no audio'}">${ic('snd')}</span><span class="sdot ${n.status}" title="${n.status}"></span></span></div><div class="nsub">${sub(n)}</div></button>`).join('')}</div>`;
    }
    const fb = d ? `<div class="fbar">${Object.keys(FDEF).map((f) => { const D = FDEF[f]; const c = D.single ? (N.F[f] !== 'any' ? 1 : 0) : N.F[f].length; return pickBtn(`f:${f}`, `${D.l}${c ? ` <b>${D.single ? D.o.find((o) => o[0] === N.F[f])[1] : c}</b>` : ''} ${ic('caret')}`, `fbx${c ? ' on' : ''}`); }).join('')}<span class="sp"></span>${pickBtn('sort', `${ic('sort')} ${sortL} ${ic('caret')}`, 'fbx')}</div>` : '';
    const from = N.total ? N.offset + 1 : 0; const to = Math.min(N.offset + N.limit, N.total);
    const page = Math.floor(N.offset / N.limit) + 1; const pages = Math.max(1, Math.ceil(N.total / N.limit));
    return `<div class="wrap"><div class="ph"><h1>Notes</h1><span class="n">${N.total}${N.all !== null ? ` of ${N.all}` : ''}</span><span class="sp"></span>
      ${d ? '<button class="btn-s" data-act="triage-these">Triage these</button>' : ''}<a class="btn-p" href="#/new-note">${ic('plus')} New note</a></div>
      <div class="srch"><label class="box">${ic('search')}<input class="in" id="srch" data-f="search" placeholder="Search text or translation" value="${esc(N.q)}"></label>
        ${d ? '' : `<button class="fbtn" data-act="fsheet">${ic('filter')} Filters ${A.length ? `<b>${A.length}</b>` : ''}</button>`}</div>
      ${fb}${chips}
      ${d ? '' : `<div class="lmeta"><span>${N.total} note${N.total === 1 ? '' : 's'}</span><span class="sp"></span>${pickBtn('sort', `${ic('sort')} ${sortL} ${ic('caret')}`, 'sortb')}</div>`}
      ${rows}
      ${!d && (A.length || N.q.trim()) ? `<div style="padding-top:12px"><button class="btn-s" data-act="triage-these">Triage these ${N.total}</button></div>` : ''}
      <div class="pager"><button data-act="page" data-v="-1" aria-label="Previous page" ${page <= 1 ? 'disabled' : ''}>‹</button><span class="pg">${page}</span><button data-act="page" data-v="1" aria-label="Next page" ${page >= pages ? 'disabled' : ''}>›</button><span>${from}–${to} of ${N.total}</span></div></div>`;
  }

  /* ---------------------------------------------------------- settings -- */
  function settingsPage() {
    const s = settings();
    if (!S.settings) return '<div class="wrap"><div class="ph"><h1>Settings</h1></div><div class="loading">Loading…</div></div>';
    const seg = (key, opts) => `<div class="seg">${opts.map(([v, l]) => `<button data-act="set" data-k="${key}" data-v="${v}" aria-pressed="${s[key] === v}">${l}</button>`).join('')}</div>`;
    const step = (key) => `<div class="stepper"><button data-act="step" data-k="${key}" data-v="-1" aria-label="Fewer">−</button><span>${s[key]}</span><button data-act="step" data-k="${key}" data-v="1" aria-label="More">+</button></div>`;
    const custom = s.value_color_custom || '#c2185b';
    const providers = s.providers || {};
    return `<div class="wrap"><div class="ph"><h1>Settings</h1></div><div class="sets">
      <section class="sg2"><h2>Appearance</h2>
        <div class="si"><div class="t">Theme<small>Auto follows the device</small></div>${seg('theme', [['auto', 'Auto'], ['light', 'Light'], ['dark', 'Dark']])}</div>
        <div class="si"><div class="t">Value colour<small>the colour of everything you type</small></div><div class="swr">${[['blue', '#0b5cff'], ['teal', '#00897b'], ['violet', '#7c3aed'], ['orange', '#d9480f']].map(([k, c]) => `<button class="sw" data-act="set" data-k="value_color" data-v="${k}" aria-pressed="${s.value_color === k}" aria-label="${k}" title="${k}" style="--c:${c}"></button>`).join('')}<label class="sw swc" title="Custom" aria-pressed="${s.value_color === 'custom'}" style="--c:${esc(custom)}"><input type="color" id="s_valc" data-f="valc" value="${esc(custom)}" aria-label="Custom value colour"></label></div></div>
        <div class="si"><div class="t" style="flex:1 1 100%"><small>Preview</small><span style="color:var(--val);font-size:16px">komme i vei · get going</span></div></div></section>
      <section class="sg2"><h2>Triage prefilling</h2>
        <div class="si"><div class="t">Run providers<small>for every empty field</small></div>${seg('prefill_timing', [['on_open', 'On open'], ['on_demand', 'On Prefill']])}</div>
        <div class="si"><div class="t">Leaving a note<small>Send to back, Skip, Previous</small></div>${seg('triage_navigate_save', [['autosave', 'Autosave'], ['manual', 'Manual']])}</div></section>
      <section class="sg2"><h2>Provider order</h2><p class="hint">Drag to reorder. The first enabled provider prefills; suggestion sheets list them in this order.</p>
        ${settingsKinds().map(([k, label]) => {
    const info = providers[k] || { order: [], disabled: [] };
    const hint = k === 'tts' ? '<small>forvo and filmot open externally</small>' : '';
    return `<div class="pk"><div class="kh">${label}${hint}</div>
          ${info.order.length ? `<ul class="plist" data-kind="${k}">${info.order.map((p, i) => { const off = (info.disabled || []).includes(p); return `<li data-p="${esc(p)}" class="${off ? 'off' : ''}"><span class="h" tabindex="0" role="button" aria-label="Move ${esc(p)}">${ic('drag')}</span><span class="o">${i + 1}</span><span class="nm">${esc(p)}</span>${LINKP.includes(p) ? '<span class="lk">link</span>' : ''}<button class="tg" data-act="poff" data-k="${k}" data-v="${esc(p)}" aria-pressed="${!off}" aria-label="Enable ${esc(p)}"></button></li>`; }).join('')}</ul>` : '<div class="nopara">No providers — smia did not list any for this kind.</div>'}</div>`;
  }).join('')}</section>
      <section class="sg2"><h2>Lookups</h2>
        <div class="si"><div class="t">Query starts prefilled<small>per-provider queries start from the shared one</small></div><button class="tg" data-act="qpre" aria-pressed="${s.override_prefill !== false}" aria-label="Query starts prefilled"></button></div>
        <div class="si"><div class="t">Translation languages</div><input class="txt-in" id="s_langs" data-f="langs" value="${esc((s.default_target_langs || []).join(', '))}" aria-label="Translation languages"></div></section>
      <section class="sg2"><h2>Examples prefill</h2>
        <div class="si"><div class="t">Providers to ask<small>the first N in the Examples order</small></div>${step('examples_max_providers')}</div>
        <div class="si"><div class="t">Sentences per provider<small>taken from each of them</small></div>${step('examples_count')}</div>
        <div class="si"><div class="t" style="flex:1 1 100%"><small>Prefill takes at most ${(s.examples_max_providers || 1) * (s.examples_count || 3)} sentences — ${s.examples_max_providers || 1} × ${s.examples_count || 3}. A provider with fewer contributes what it has.</small></div></div></section>
    </div></div>`;
  }

  /* ----------------------------------------------------------- grammar -- */
  function grammarPage() {
    if (S.id) {
      if (G.loading || (!G.rule && !G.isNew)) return `<div class="wrap"><a class="back" href="#/grammar">${ic('back')} Grammar</a><div class="loading">${G.loading ? 'Loading…' : 'This rule does not exist.'}</div></div>`;
      const usedBy = G.used;
      return `<div class="wrap"><a class="back" href="#/grammar">${ic('back')} Grammar</a><div class="gdet" style="padding-top:10px">
        <textarea class="ttl" id="g_t" data-f="gtitle" rows="1" aria-label="Title" placeholder="Rule title">${esc(G.title)}</textarea>
        <div class="f"><div class="fl"><label for="g_b">Explanation</label><span class="grow"></span><button class="pqb" data-act="gedit">${G.edit ? 'Show rendered' : `${ic('pen', 's')} Edit HTML`}</button></div>${G.edit ? `<textarea class="in htmlsrc" id="g_b" rows="8" data-f="ghtml" placeholder="<p>…</p>">${esc(G.html)}</textarea>` : `<div class="rhtml">${sanitizeHtml(G.html) || '<span class="nopara">No explanation yet</span>'}</div>`}</div>
        ${G.isNew ? '' : `<div class="f"><div class="fl"><span class="lb">Used by ${usedBy.length} note${usedBy.length === 1 ? '' : 's'}</span></div><div class="linked">${usedBy.map((n) => `<a class="chip" href="#/notes/${esc(n.id)}">${esc(n.text)}</a>`).join('') || '<span class="nopara">No notes yet</span>'}</div></div>`}
        <div style="display:flex;gap:10px;padding-top:8px">${G.isNew ? '' : '<button class="btn-s" data-act="grdel" style="color:var(--danger)">Delete</button>'}<span style="flex:1"></span><button class="btn-p" data-act="grsave">${G.isNew ? 'Create rule' : 'Save rule'}</button></div></div></div>`;
    }
    const list = G.list;
    return `<div class="wrap"><div class="ph"><h1>Grammar</h1><span class="n">${list ? `${list.length} rule${list.length === 1 ? '' : 's'}` : ''}</span><span class="sp"></span><a class="btn-p" href="#/grammar/new">${ic('plus')} New rule</a></div>
      <div class="glist">${list ? (list.map((r) => `<a class="grow2" href="#/grammar/${r.id}" style="color:inherit;text-decoration:none"><b>${esc(r.title)}</b><small>${r.usage_count} note${r.usage_count === 1 ? '' : 's'}</small></a>`).join('') || '<div class="nores">No grammar rules yet.</div>') : '<div class="loading">Loading…</div>'}</div></div>`;
  }

  /* -------------------------------------------------------- queue sheet -- */
  const QUEUE_SORT_LABELS = [['updated_asc', 'Oldest updated'], ['updated_desc', 'Newest updated'], ['created_asc', 'Oldest created'], ['created_desc', 'Newest created'], ['text_asc', 'A–Z'], ['text_desc', 'Z–A'], ['complete_asc', 'Least complete'], ['complete_desc', 'Most complete']];
  const PRESENCE_FIELDS = [['audio_blob', 'Audio'], ['transcription', 'IPA'], ['inflections', 'Inflections'], ['examples', 'Examples'], ['translations', 'Translations'], ['lemma', 'Lemma']];
  function openQueueEditor(asNew) {
    const q = activeQueue();
    const isNew = asNew || !q || q.builtin || q.adhoc;
    S.sheet = {
      kind: 'queue', anim: true,
      qe: { id: q && !isNew ? q.id : null, isNew, builtin: !!(q && q.builtin), name: q && !q.builtin ? (q.name || '') : '', filters: { ...((q && q.filters) || {}) }, sort: (q && q.sort) || 'updated_asc' },
    };
  }
  function queueSheet() {
    const qe = S.sheet.qe; const f = qe.filters;
    const multi = (key) => String(f[key] || '').split(',').map((x) => x.trim()).filter(Boolean);
    const chips = (key, opts, single) => `<div class="chips">${opts.map(([v, l]) => {
      const on = single ? String(f[key] || '') === v : multi(key).includes(v);
      return `<button class="fc" data-act="qset" data-k="${key}" data-v="${esc(v)}" data-single="${single ? 1 : ''}" aria-pressed="${on}">${esc(l)}</button>`;
    }).join('')}</div>`;
    const sec = (label, html) => `<div class="fsec"><span class="lb">${label}</span>${html}</div>`;
    const inner = `<div class="shb">
      ${sec('Name', `<input class="in qname" data-f="qname" value="${esc(qe.name)}" placeholder="Name this queue" aria-label="Queue name">`)}
      ${qe.builtin && !qe.isNew ? '' : ''}
      ${sec('Status', chips('status', [['', 'Any'], ['draft', 'Draft'], ['ready', 'Ready']], true))}
      ${sec('Type', chips('type', TYPES.map((t) => [t, t])))}
      ${sec('Origin', chips('origin', [['manual', 'Manual'], ['capture', 'Capture'], ['import', 'Import']]))}
      ${sec('Part of speech', chips('pos', POS.map((t) => [t, t])))}
      ${sec('Source language', chips('source_lang', [['', 'Any'], ['no', 'no'], ['de', 'de'], ['en', 'en']], true))}
      ${sec('Updated since', chips('updated_since', [['', 'Any time'], ['24h', '24 hours'], ['7d', '7 days'], ['30d', '30 days']], true))}
      ${PRESENCE_FIELDS.map(([key, label]) => sec(label, chips(`${key}_presence`, [['', 'Any'], ['missing', 'Missing'], ['has', 'Has']], true))).join('')}
      ${sec('Text search', `<input class="in" data-f="qq" value="${esc(f.q || '')}" placeholder="Text, lemma or translation" aria-label="Text search">`)}
      ${sec('Order the belt by', `<div class="chips">${QUEUE_SORT_LABELS.map(([v, l]) => `<button class="fc" data-act="qsort" data-v="${v}" aria-pressed="${qe.sort === v}">${l}</button>`).join('')}</div>`)}
      <div class="shf">${qe.isNew ? (activeQueue() && activeQueue().builtin ? 'A built-in queue cannot be edited — this saves a new queue.' : 'Saved as a new queue.') : 'The order is stored with the queue, not globally.'}</div></div>`;
    const foot = `<div class="shfoot">${qe.isNew ? '<button class="sec" data-act="close">Cancel</button>' : '<button class="sec" data-act="qdel" style="color:var(--danger)">Delete queue</button>'}<button class="pri" data-act="qsave">${qe.isNew ? 'Save as new queue' : 'Save queue'}</button></div>`;
    return sheetShell('Queue', qe.isNew ? 'New queue' : 'Edit queue', inner, foot);
  }

  /* ------------------------------------------------------- main render -- */
  const editorCtx = () => (['triage', 'note', 'new'].includes(S.page) ? S.page : null);
  function captureFocus() {
    const el = document.activeElement;
    if (!el || !app.contains(el) || !['INPUT', 'TEXTAREA'].includes(el.tagName)) return null;
    let sel = null;
    if (el.id) sel = `#${CSS.escape(el.id)}`;
    else if (el.dataset.f) {
      sel = `[data-f="${el.dataset.f}"]`;
      ['i', 'k', 'p'].forEach((a) => { if (el.dataset[a] !== undefined) sel += `[data-${a}="${CSS.escape(el.dataset[a])}"]`; });
      // The translations sheet renders one box per provider PER LANGUAGE
      // group, so a per-provider query input exists more than once and the
      // bare selector would restore focus to the wrong group's copy.
      const grp = el.closest('.lgrp[data-lang]');
      if (grp) sel = `.lgrp[data-lang="${CSS.escape(grp.dataset.lang)}"] ${sel}`;
    }
    if (!sel) return null;
    let start = null; let end = null;
    try { start = el.selectionStart; end = el.selectionEnd; } catch { /* color inputs */ }
    return { sel, start, end };
  }
  function restoreFocus(fc) {
    if (!fc) return;
    const el = app.querySelector(fc.sel);
    if (!el) return;
    el.focus({ preventScroll: true });
    try { if (fc.start !== null) el.setSelectionRange(fc.start, fc.end); } catch { /* ignore */ }
  }
  let renderQueued = false;
  function scheduleRender() {
    if (renderQueued) return;
    renderQueued = true;
    requestAnimationFrame(() => { renderQueued = false; render(); });
  }
  function render(opts = {}) {
    document.documentElement.classList.toggle('vp-phone', S.vp === 'phone');
    document.documentElement.classList.toggle('vp-desktop', S.vp === 'desktop');
    const sc = app.querySelector('.scroll'); const st = (!opts.top && sc) ? sc.scrollTop : 0;
    const shb = app.querySelector('.shb'); const shst = shb ? shb.scrollTop : 0;
    const fc = opts.top ? null : captureFocus();
    const ctx = editorCtx();
    const navAt = { triage: 'triage', note: 'notes', new: 'notes', notes: 'notes', settings: 'settings', grammar: 'grammar' }[S.page];
    const top = `<div class="wrap"><div class="top"><a class="wm" href="#/notes">stabbur<i>.</i></a><nav class="nav">${NAV.map(([k, l]) => `<a href="#/${k}" ${navAt === k ? 'aria-current="page"' : ''}>${l}</a>`).join('')}</nav></div></div>`;
    const main = ctx ? editorPage(ctx) : S.page === 'notes' ? notesPage() : S.page === 'settings' ? settingsPage() : grammarPage();
    app.innerHTML = `<div class="scroll" id="scroll">${top}${main}</div>${ctx && E ? bar(ctx) : ''}${pop()}${sheet()}${menuHtml()}`;
    app.appendChild(toastEl);
    app.querySelector('.scroll').scrollTop = st;
    const nb = app.querySelector('.shb');
    if (nb && S.sheet && !S.sheet.anim) nb.scrollTop = shst;
    if (S.sheet) S.sheet.anim = false; // the open animation runs once, on the first render only
    autosize(); bindDrag(); bindWave(); restoreFocus(fc);
    document.title = ctx && E ? `${E.f.text || 'New note'} — stabbur` : `${({ notes: 'Notes', settings: 'Settings', grammar: 'Grammar', triage: 'Triage', note: 'Note', new: 'New note' })[S.page] || 'stabbur'} — stabbur`;
  }
  function autosize() {
    app.querySelectorAll('textarea.in,textarea.ttl').forEach((t) => { t.style.height = 'auto'; t.style.height = `${t.scrollHeight}px`; });
    if (!CSS.supports('field-sizing', 'content')) app.querySelectorAll('textarea.hw').forEach((t) => { t.style.height = 'auto'; t.style.height = `${t.scrollHeight}px`; });
  }

  /* ----------------------------------------------------- editor actions -- */
  // A part-of-speech change keeps what was typed into fields both shapes
  // share; with nothing typed, a return to the stored part of speech brings
  // the stored paradigm back.
  function setPos(v, fromPrefill) {
    const old = E.f.pos;
    E.f.pos = v;
    E.customPos = false;
    E.shapeSeen = v; // menu, sheet and prefill reshape the form's paradigm themselves
    const typed = shapeKeys(v).some((k) => hasText(E.f.inflections[k]));
    if (!typed && E.stored && E.stored.pos === v) E.f.inflections = { ...E.f.inflections, ...normInfl(E.stored.inflections) };
    if (!fromPrefill) delete E.prov.pos;
    // note-triage: a changed part of speech reshapes the paradigm to a fresh
    // set of gaps, so the triage belt re-runs the inflections walk at once.
    if (E.ctx === 'triage' && v && v !== old && SHAPES[v]) prefillInflectionsOnly();
  }
  function appendTranscription(value) {
    const current = E.f.transcription.trim();
    if (!current) { E.f.transcription = value; return; }
    // Already present anywhere as a contiguous run of tokens: not again.
    const parts = current.split(/\s+/); const wanted = value.trim().split(/\s+/);
    if (parts.some((_, i) => wanted.every((w, j) => parts[i + j] === w))) return;
    E.f.transcription = `${current} ${value}`;
  }
  // The inflections "Use" is the paradigm apply: it sets the part of speech
  // only when the note has none, then fills every field the resulting shape
  // has (and the noun's article from its indefinite form).
  function applyParadigm(c) {
    const mapped = canonicalPos(c.pos);
    if (!E.f.pos && mapped) setPos(mapped, true);
    const keys = shapeKeys(E.f.pos);
    if (keys.length) E.shapeSeen = E.f.pos; // the paradigm is now the form's own
    let filled = 0;
    keys.forEach((k) => { if (c.v[k] !== undefined) { E.f.inflections[k] = normalizeInflectionValue(k, String(c.v[k])); filled += 1; } });
    if (keys.includes('article') && !hasText(E.f.inflections.article)) {
      const art = deriveArticleToken(c.v);
      if (art) { E.f.inflections.article = art; filled += 1; }
    }
    return filled;
  }
  function setAudio(sha, from, provName) {
    E.f.audio_blob = sha;
    E.f.audio_sel_ms = null;
    E.audioFrom = from;
    if (provName) E.prov.audio = provName;
    loadWave(sha);
  }
  async function useCand(p, i) {
    const k = S.sheet.kind; const st = E.cands[k];
    const c = st && st.P[p] && st.P[p].list[i];
    if (!c) return;
    let msg = `Used from ${p}`;
    if (k === 'pos') { setPos(c.v); }
    else if (k === 'ipa') { if (c.asm) E.f.transcription = c.v; else { appendTranscription(c.v); msg = `Appended from ${p}`; } }
    else if (k === 'translations') { E.f.translations.push({ lang: c.lang, text: c.v }); msg = `Added ${c.lang.toUpperCase()} translation from ${p}`; }
    else if (k === 'examples') { E.f.examples.push(c.v); }
    else if (k === 'inflections') { const n = applyParadigm(c); msg = n ? `${n} form${n === 1 ? '' : 's'} filled from ${p}` : `Nothing to apply from ${p}`; }
    else if (k === 'stt') {
      // `text` is the note's primary content: replacing a different text
      // asks once, in place (stt-text-suggest D5), never through a dialog.
      const key = `${p}:${i}`;
      if (E.f.text.trim() && E.f.text.trim() !== c.v && S.sheet.confirmStt !== key) { S.sheet.confirmStt = key; render(); return; }
      E.f.text = c.v;
      if (!E.lemmaDirty) E.f.lemma = deriveLemmaGuess(c.v);
    } else if (k === 'audio') {
      S.sheet.busy = `${p}:${i}`; render();
      const r = await api('/api/enrich/tts/use', jsonReq('POST', { sha256: c.sha }));
      if (!S.sheet) return;
      S.sheet.busy = null;
      if (r.status !== 200 || !r.body || !r.body.sha256) { render(); toast(errMsg(r, 'Could not fetch that candidate’s audio')); return; }
      setAudio(r.body.sha256, p, p);
      E.usedSha = c.sha; E.usedBlob = r.body.sha256;
    }
    E.prov[k === 'stt' ? 'stt' : k] = p;
    if (['pos', 'inflections', 'audio', 'stt'].includes(k)) S.sheet = null;
    render();
    toast(msg);
  }

  /* ----------------------------------------------------------- prefill -- */
  // Fills gaps, never opinions (note-triage D5), walking the operator's
  // provider order (D4): pos first (inflections need a shape, translations
  // and audio are ordered by it), then IPA, translations, inflections,
  // examples, audio — each step on its own, so one failing provider cannot
  // take the rest down.
  function firstWith(kind, pred = (P) => (P.list || []).filter((c) => !c.gap).length > 0, lang) {
    const st = E.cands[kind];
    for (const p of kindProviders(kind, lang).enabled) {
      const P = st && st.P[p];
      if (P && !P.error && pred(P)) return { p, P };
    }
    return null;
  }
  function assembleFromTokens(tokens) {
    if (!Array.isArray(tokens) || !tokens.length) return null;
    const parts = tokens.map((t) => {
      const first = Array.isArray(t.candidates) && t.candidates.length ? t.candidates[0] : null;
      return first ? (first.ipa || first.phonemic || first.phonetic || TRANSCRIPTION_GAP) : TRANSCRIPTION_GAP;
    });
    return parts.every((x) => x === TRANSCRIPTION_GAP) ? null : parts.join(' ');
  }
  // Every step takes `force`: the gap-filling Prefill passes it falsy and
  // keeps its "already has a value" guards; Force prefill passes it true,
  // which skips exactly those guards and nothing else (design D7).
  const PREFILL_STEPS = {
    async pos(force) {
      if ((E.f.pos && !force) || !defaultQuery('pos')) return false;
      await ensureKind('pos', force);
      const hit = firstWith('pos');
      const mapped = hit && hit.P.list.map((c) => c.v).find(Boolean);
      if (!mapped) return false;
      setPos(mapped, true);
      E.prov.pos = hit.p;
      return true;
    },
    async ipa(force) {
      if ((E.f.transcription.trim() && !force) || !defaultQuery('ipa')) return false;
      await ensureKind('ipa', force);
      const st = E.cands.ipa;
      for (const p of kindProviders('ipa').enabled) {
        const P = st.P[p];
        if (!P || P.error) continue;
        let value = null; let assembled = false;
        if (P.perWord) { value = P.joined || assembleFromTokens(P.tokens); assembled = !P.joined && !!value; } else if (P.list.length) value = P.list[0].v;
        if (value) {
          E.f.transcription = value;
          E.prov.ipa = assembled ? `${p} (assembled)` : p;
          return true;
        }
      }
      return false;
    },
    // Each language is walked in ITS OWN provider order (design D4).
    async translations(force) {
      if (!defaultQuery('translations')) return false;
      const langs = targetLangs();
      const have = new Set(E.f.translations.filter((t) => hasText(t.text)).map((t) => (t.lang || '').toLowerCase()));
      const missing = force ? langs.slice() : langs.filter((l) => !have.has(l.toLowerCase()));
      if (!missing.length) return false;
      await ensureKind('translations', force);
      let any = false;
      missing.forEach((lang) => {
        const hit = firstWith('translations', (P) => (P.list || []).some((c) => c.lang === lang), lang);
        if (!hit) return;
        const c = orderByPos(hit.P.list.filter((x) => x.lang === lang), E.f.pos)[0];
        if (!c || !c.v) return;
        // A language's old rows go ONLY once a replacement is in hand.
        // Clearing first and discovering afterwards that no provider
        // answered would delete the operator's translations and then report
        // that nothing was filled — this house's defining defect.
        E.f.translations = E.f.translations.filter((t) => hasText(t.text)
          && !(force && (t.lang || '').toLowerCase() === lang.toLowerCase()));
        E.f.translations.push({ lang, text: c.v });
        E.prov.translations = hit.p;
        any = true;
      });
      return any;
    },
    async inflections(force) {
      if (!SHAPES[E.f.pos] || !E.f.lemma.trim()) return false;
      await ensureKind('inflections', force);
      const hit = firstWith('inflections');
      const c = hit && hit.P.list[0];
      if (!c || !c.v) return false;
      let any = false;
      shapeKeys(E.f.pos).forEach((k) => {
        if ((force || !hasText(E.f.inflections[k])) && c.v[k]) { E.f.inflections[k] = normalizeInflectionValue(k, String(c.v[k])); any = true; }
      });
      if (shapeKeys(E.f.pos).includes('article') && (force || !hasText(E.f.inflections.article))) {
        const art = deriveArticleToken(c.v);
        if (art) { E.f.inflections.article = art; any = true; }
      }
      if (any) { E.prov.inflections = hit.p; E.shapeSeen = E.f.pos; }
      return any;
    },
    // A grid, not a pool (design D3): the first N = `examples_max_providers`
    // enabled providers are asked, and up to M = `examples_count` sentences
    // are taken from EACH of them, so a full answer is N x M. A provider
    // with fewer than M contributes what it has and is not backfilled from
    // the others — the operator's ruling — so each provider's share stays
    // its own.
    async examples(force) {
      if ((E.f.examples.some(hasText) && !force) || !defaultQuery('examples')) return false;
      await ensureKind('examples', force);
      const per = settings().examples_count || 3;
      const maxP = settings().examples_max_providers || 1;
      const texts = []; const usedP = [];
      kindProviders('examples').enabled.slice(0, maxP).forEach((p) => {
        const P = E.cands.examples.P[p];
        const add = ((P && !P.error && P.list) || [])
          .map((c) => c.v)
          .filter((t) => t && !texts.includes(t))
          .slice(0, per);
        if (!add.length) return;
        texts.push(...add);
        usedP.push(p);
      });
      if (!texts.length) return false;
      E.f.examples = texts;
      E.prov.examples = usedP.join(', ');
      return true;
    },
    // Only a real recording (a sha256) auto-attaches; manual-link providers
    // answer nothing and are walked past.
    async audio(force) {
      if ((E.f.audio_blob && !force) || !defaultQuery('audio')) return false;
      await ensureKind('audio', force);
      const hit = firstWith('audio');
      const c = hit && orderByPos(hit.P.list, E.f.pos)[0];
      if (!c || !c.sha) return false;
      const e0 = E;
      const before = E.f.audio_blob;
      const r = await api('/api/enrich/tts/use', jsonReq('POST', { sha256: c.sha }));
      if (E !== e0 || r.status !== 200 || !r.body || !r.body.sha256) return false;
      // Unconditional, force included: "replace what was there" is about the
      // value this walk started from, never about a recording the operator
      // attached (or dropped) WHILE it was running.
      if (E.f.audio_blob !== before) return false;
      setAudio(r.body.sha256, hit.p, hit.p);
      E.usedSha = c.sha; E.usedBlob = r.body.sha256;
      return true;
    },
  };
  const PREFILL_ORDER = ['pos', 'ipa', 'translations', 'inflections', 'examples', 'audio'];
  async function prefill(force) {
    if (!E || E.prefilling) return;
    const e0 = E;
    E.prefilling = true; S.menu = null;
    // The lemma is what the inflections and part-of-speech lookups query
    // from, so Prefill derives it itself rather than refusing for want of
    // one (design D2) — a note whose lemma the operator cleared still
    // prefills.
    if (!E.f.lemma.trim()) {
      const guess = deriveLemmaGuess(E.f.text);
      if (guess) { E.f.lemma = guess; E.prov.lemma = 'derived from text'; }
    }
    render();
    // Fetch every kind in parallel up front (badges fill in as answers
    // land); the fills then run in their fixed order. Skipped under force,
    // where `ensureKind` never considers an answer ready: the warm-up and
    // the step's own fetch would then both be in flight, asking every
    // provider twice with the cache bypassed on both.
    if (!force) PREFILL_ORDER.forEach((k) => { if (defaultQuery(k)) ensureKind(k); });
    let filled = 0;
    for (const name of PREFILL_ORDER) {
      if (E !== e0) return;
      try { if (await PREFILL_STEPS[name](force)) filled += 1; } catch (err) { console.error('prefill step failed:', name, err); }
    }
    if (E !== e0) return;
    E.prefilling = false;
    render();
    if (force) toast(filled ? `Force-filled ${filled} field${filled > 1 ? 's' : ''}, replacing what was there` : 'No provider answered for this note');
    else toast(filled ? `Prefilled ${filled} empty field${filled > 1 ? 's' : ''}` : 'Nothing empty to prefill');
  }
  async function prefillInflectionsOnly() {
    const e0 = E;
    try { if (await PREFILL_STEPS.inflections() && E === e0) render(); } catch (err) { console.error(err); }
  }

  /* -------------------------------------------------------------- triage -- */
  const TRIAGE_QUEUE_PAGE = 200;
  const TRIAGE_QUEUE_MAX = 5000;
  function queueParams(queue) {
    const params = { limit: TRIAGE_QUEUE_PAGE, sort: (queue && queue.sort) || 'updated_asc' };
    Object.entries((queue && queue.filters) || {}).forEach(([k, v]) => {
      if (v === '' || v === null || v === undefined || v === 'any') return;
      params[k] = Array.isArray(v) ? v.join(',') : v;
    });
    return params;
  }
  async function loadQueues() {
    const r = await api('/api/settings/triage_queues');
    T.queues = r.status === 200 ? r.body : [];
    if (!T.selectedId || !T.queues.some((q) => q.id === T.selectedId)) {
      let saved = null;
      try {
        saved = localStorage.getItem('stabbur_triage_queue_id')
          || (localStorage.getItem('stabbur_triage_origin') ? `builtin:${localStorage.getItem('stabbur_triage_origin')}` : null);
      } catch { /* ignore */ }
      T.selectedId = T.queues.some((q) => q.id === saved) ? saved : (T.queues[0] || {}).id || null;
    }
  }
  async function refreshQueueCounts() {
    await Promise.all(T.queues.map(async (q) => {
      const r = await api(`/api/notes/authoring${qs({ ...queueParams(q), limit: 1 })}`);
      if (r.status === 200 && typeof r.body.total === 'number') T.counts[q.id] = r.body.total;
    }));
    scheduleRender();
  }
  // The belt is a queue the operator works to the end, so every page is
  // fetched; the backstop is reported, never silent.
  async function loadQueue() {
    T.loading = true; E = null; S.sheet = null;
    render();
    const queue = activeQueue();
    const collected = []; let total = 0; let ok = true; let truncated = false;
    if (queue) {
      const base = queueParams(queue);
      for (let offset = 0; offset < TRIAGE_QUEUE_MAX; offset += TRIAGE_QUEUE_PAGE) {
        const r = await api(`/api/notes/authoring${qs({ ...base, offset })}`);
        if (r.status !== 200) { ok = false; toast(errMsg(r, 'Could not load the queue')); break; }
        collected.push(...(r.body.notes || []));
        total = r.body.total || 0;
        if (collected.length >= total || !(r.body.notes || []).length) break;
        if (offset + TRIAGE_QUEUE_PAGE >= TRIAGE_QUEUE_MAX) truncated = true;
      }
    }
    T.queue = ok ? collected : [];
    T.index = 0; T.history = []; T.truncated = truncated; T.loading = false;
    if (queue && ok && !queue.adhoc) T.counts[queue.id] = total || T.queue.length;
    if (truncated) toast(`This queue has more than ${TRIAGE_QUEUE_MAX} notes — only the first ${TRIAGE_QUEUE_MAX} are on the belt`);
    await showTriageNote();
  }
  // `opts.prefill === false` is Previous (design D8): a note reached by
  // going back has already been reviewed, so the automatic setting does not
  // re-run providers over it. The Prefill control still works by hand.
  async function showTriageNote(opts = {}) {
    stopAudio();
    if (T.index >= T.queue.length) { E = null; render(); return; }
    const note = T.queue[T.index];
    // The lemma lands inside newEditor, before any provider is asked — the
    // inflections walk queries on it (design D2).
    newEditor('triage', note);
    render();
    loadSimilar();
    if (opts.prefill !== false && (settings().prefill_timing || 'on_open') === 'on_open') prefill();
  }
  const autosaveOnNavigate = () => (settings().triage_navigate_save || 'autosave') !== 'manual';
  async function saveTriage() {
    if (!E || !E.id) return null;
    const r = await api(`/api/notes/${E.id}`, jsonReq('PATCH', payload(E.f, false)));
    if (r.status !== 200) { toast(errMsg(r, 'Could not save')); return null; }
    T.queue[T.index] = r.body;
    return r.body;
  }
  async function triageAction(fn) {
    if (T.busy || !E) return;
    T.busy = true;
    try { await fn(); } catch (err) { console.error(err); toast(err.message); } finally { T.busy = false; }
  }
  const tActions = {
    async ready() {
      const p = payload(E.f, false); p.status = 'ready';
      const r = await api(`/api/notes/${E.id}`, jsonReq('PATCH', p));
      if (r.status !== 200) { toast(errMsg(r, 'Could not save')); return; }
      const text = E.f.text;
      T.queue[T.index] = r.body;
      T.history.push({ type: 'accept', index: T.index, noteId: E.id });
      T.index += 1;
      await showTriageNote();
      toast(`“${text}” is ready`);
    },
    async skip() {
      if (autosaveOnNavigate() && !(await saveTriage())) return;
      T.history.push({ type: 'skip', index: T.index });
      T.index += 1;
      await showTriageNote();
      toast('Skipped');
    },
    async back() {
      const saved = autosaveOnNavigate() ? await saveTriage() : E.stored;
      if (!saved) return;
      T.history.push({ type: 'sendback', index: T.index, noteId: E.id });
      T.queue.splice(T.index, 1);
      T.queue.push(saved);
      await showTriageNote();
      toast('Sent to the back of the queue');
    },
    async save() {
      const saved = await saveTriage();
      if (saved) { rebase(saved); render(); toast('Saved'); }
    },
    async del() {
      const id = E.id; const text = E.f.text;
      const r = await api(`/api/notes/${id}`, { method: 'DELETE' });
      if (r.status !== 204 && r.status !== 200) { toast(errMsg(r, 'Delete failed')); return; }
      dropFromQueue([id]);
      await showTriageNote();
      toast(`Deleted “${text}”`);
    },
    async dup() {
      const saved = isDirty() ? await saveTriage() : E.stored;
      if (!saved) return;
      const r = await api(`/api/notes/${saved.id}/duplicate`, { method: 'POST' });
      if (r.status !== 201) { toast(errMsg(r, 'Could not duplicate')); return; }
      S.copyOf[r.body.id] = saved.text;
      T.queue.splice(T.index + 1, 0, r.body);
      rebase(saved);
      render();
      toast('Duplicated — the copy is next in the queue');
    },
  };
  // Reverses the most recent accept / skip / send-to-back (delete is not
  // undoable). The card being left is autosaved first when the setting says so.
  async function goPrevious() {
    const entry = T.history.pop();
    if (!entry) { toast('Nothing to go back to'); return; }
    if (E && autosaveOnNavigate()) await saveTriage();
    if (entry.type === 'sendback') {
      const idx = T.queue.findIndex((n) => n.id === entry.noteId);
      if (idx !== -1) { const [n] = T.queue.splice(idx, 1); T.queue.splice(entry.index, 0, n); }
    } else if (entry.type === 'accept') {
      const r = await api(`/api/notes/${entry.noteId}`, jsonReq('PATCH', { status: 'draft' }));
      if (r.status === 200) { const idx = T.queue.findIndex((n) => n.id === entry.noteId); if (idx !== -1) T.queue[idx] = r.body; }
      T.index = entry.index;
    } else {
      T.index = entry.index;
    }
    T.index = Math.min(T.index, Math.max(0, T.queue.length - 1));
    await showTriageNote({ prefill: false });
    toast('Back to previous');
  }
  // The merge 404 fix (D10): a note that no longer exists leaves the
  // in-memory queue, and so does any history entry that points at it.
  function dropFromQueue(ids) {
    ids.forEach((id) => {
      const idx = T.queue.findIndex((n) => n.id === id);
      if (idx === -1) return;
      T.queue.splice(idx, 1);
      if (idx < T.index) T.index -= 1;
      T.history = T.history.filter((h) => h.noteId !== id).map((h) => (h.index > idx ? { ...h, index: h.index - 1 } : h));
    });
  }
  async function saveQueueFromSheet() {
    const qe = S.sheet.qe;
    if (!qe.name.trim()) { toast('A queue needs a name'); return; }
    const filters = {};
    Object.entries(qe.filters).forEach(([k, v]) => { if (v !== '' && v !== null && v !== undefined) filters[k] = v; });
    const body = { name: qe.name.trim(), filters, sort: qe.sort };
    const r = qe.isNew ? await api('/api/settings/triage_queues', jsonReq('POST', body)) : await api(`/api/settings/triage_queues/${qe.id}`, jsonReq('PATCH', body));
    if (r.status !== 200 && r.status !== 201) { toast(errMsg(r, 'Could not save the queue')); return; }
    T.queues = r.body; T.adhoc = null;
    if (qe.isNew) { const saved = r.body.filter((q) => !q.builtin).slice(-1)[0]; if (saved) T.selectedId = saved.id; }
    try { localStorage.setItem('stabbur_triage_queue_id', T.selectedId); } catch { /* ignore */ }
    S.sheet = null;
    await loadQueue();
    refreshQueueCounts();
    toast('Queue saved');
  }

  /* ------------------------------------------------------ note actions -- */
  async function saveNote() {
    if (!isDirty()) { toast('Saved'); return; }
    const r = await api(`/api/notes/${E.id}`, jsonReq('PATCH', payload(E.f, true)));
    if (r.status !== 200) { toast(errMsg(r, 'Could not save')); return; }
    rebase(r.body);
    render();
    toast('Saved');
  }
  async function duplicateNote() {
    if (isDirty()) {
      const r = await api(`/api/notes/${E.id}`, jsonReq('PATCH', payload(E.f, true)));
      if (r.status !== 200) { toast(errMsg(r, 'Could not save before duplicating')); return; }
      rebase(r.body);
    }
    const r = await api(`/api/notes/${E.id}/duplicate`, { method: 'POST' });
    if (r.status !== 201) { toast(errMsg(r, 'Could not duplicate')); return; }
    S.copyOf[r.body.id] = E.f.text;
    S.pendingToast = 'Duplicated — opened copy';
    location.hash = `#/notes/${r.body.id}`;
  }
  async function deleteNote() {
    const text = E.f.text;
    const r = await api(`/api/notes/${E.id}`, { method: 'DELETE' });
    if (r.status !== 204 && r.status !== 200) { toast(errMsg(r, 'Delete failed')); return; }
    S.pendingToast = `Deleted “${text}”`;
    location.hash = '#/notes';
  }
  async function createNote(status) {
    const p = payload(E.f, false);
    p.status = status;
    const r = await api('/api/notes', jsonReq('POST', p));
    if (r.status !== 201) { toast(errMsg(r, 'Could not create the note')); return; }
    S.pendingToast = status === 'ready' ? 'Saved as ready' : 'Saved as draft';
    location.hash = `#/notes/${r.body.id}`;
  }
  async function doMerge(otherId) {
    const o = E.sim.find((m) => m.id === otherId);
    if (!o || S.sheet.busy) return;
    const into = S.sheet.dir !== 'out';
    const tk = S.sheet.take || {};
    const sourceId = into ? o.id : E.id;
    const fromVals = into ? valsOfMatch(o) : valsOfForm();
    const take = {};
    TAKES.forEach(([k]) => { if (tk[k] && tval(fromVals, k)) TAKE_FIELDS[k].forEach((field) => { take[field] = sourceId; }); });
    const n = TAKES.filter(([k]) => tk[k] && tval(fromVals, k)).length;
    const body = into
      ? { survivor_id: E.id, absorbed_ids: [o.id], take, survivor_values: payload(E.f, E.ctx === 'note') }
      : { survivor_id: o.id, absorbed_ids: [E.id], take, absorbed_values: { [E.id]: payload(E.f, E.ctx === 'note') } };
    S.sheet.busy = true; render();
    const r = await api('/api/notes/merge', jsonReq('POST', body));
    if (!S.sheet) return;
    S.sheet.busy = false;
    if (r.status !== 200) { render(); toast(errMsg(r, 'Merge failed')); return; }
    const absorbed = r.body.absorbed_ids || body.absorbed_ids;
    S.sheet = null;
    if (into) {
      if (E.ctx === 'triage') { T.queue[T.index] = r.body; dropFromQueue(absorbed); }
      rebase(r.body);
      E.sim = E.sim.filter((m) => !absorbed.includes(m.id));
      render();
      loadSimilar();
      toast(`Merged ${n} field${n === 1 ? '' : 's'} · “${o.text}” removed`);
      return;
    }
    if (E.ctx === 'triage') {
      // The survivor may be further along the belt: its queue entry must be
      // the merged row, or reaching it would show (and a verdict would save
      // back) the pre-merge copy, silently undoing the merge.
      const si = T.queue.findIndex((n) => n.id === r.body.id);
      if (si !== -1) T.queue[si] = r.body;
      dropFromQueue(absorbed);
      await showTriageNote();
      toast(`Merged into “${o.text}” · this note removed`);
      return;
    }
    S.pendingToast = `Merged into “${o.text}” · opened it`;
    location.hash = `#/notes/${o.id}`;
  }

  /* ------------------------------------------------------ page entries -- */
  async function enterTriage() {
    T.loading = true; E = null;
    render();
    await Promise.all([loadQueues(), S.settings ? null : loadSettings(), loadRules()]);
    if (S.page !== 'triage') return;
    await loadQueue();
    refreshQueueCounts();
  }
  async function enterNote(id) {
    E = null; S.notFound = false;
    render();
    const [r] = await Promise.all([api(`/api/notes/${id}`), loadRules(), S.settings ? null : loadSettings()]);
    if (S.page !== 'note' || S.id !== id) return;
    if (r.status !== 200 || r.body.deleted_at) { S.notFound = true; render(); return; }
    newEditor('note', r.body);
    render({ top: true });
    loadSimilar();
  }
  async function enterNew() {
    await Promise.all([loadRules(), S.settings ? null : loadSettings()]);
    if (S.page !== 'new') return;
    newEditor('new', { type: 'word', source_lang: 'no', status: 'draft' });
    E.simLoaded = true;
    render({ top: true });
  }
  async function enterNotes() {
    N.offset = Math.min(N.offset, N.offset);
    render();
    fetchNotes();
    const r = await api('/api/notes/authoring?limit=1');
    if (r.status === 200) { N.all = r.body.total; scheduleRender(); }
  }
  async function enterSettings() {
    render();
    await loadSettings();
    render();
  }
  async function enterGrammar(id) {
    G.edit = false; G.isNew = false; G.rule = null;
    if (!id) {
      G.list = null; render();
      const r = await api('/api/grammar_rules?sort=title_asc');
      G.list = r.status === 200 ? r.body : [];
      render();
      return;
    }
    if (id === 'new') {
      G.isNew = true; G.edit = true; G.title = ''; G.html = ''; G.used = [];
      render({ top: true });
      return;
    }
    G.loading = true; render();
    const [r, u] = await Promise.all([api(`/api/grammar_rules/${id}`), api(`/api/notes/authoring${qs({ grammar_rule_id: id, limit: 200 })}`)]);
    G.loading = false;
    if (S.page !== 'grammar' || S.id !== id) return;
    if (r.status === 200) { G.rule = r.body; G.title = r.body.title; G.html = r.body.html; }
    G.used = u.status === 200 ? u.body.notes || [] : [];
    render({ top: true });
  }
  async function saveRule() {
    if (!G.title.trim() || !G.html.trim()) { toast('A rule needs a title and an explanation'); return; }
    if (G.isNew) {
      const r = await api('/api/grammar_rules', jsonReq('POST', { title: G.title.trim(), html: G.html }));
      if (r.status !== 201) { toast(errMsg(r, 'Could not create the rule')); return; }
      S.rules = null;
      S.pendingToast = 'Rule created';
      location.hash = `#/grammar/${r.body.id}`;
      return;
    }
    const r = await api(`/api/grammar_rules/${G.rule.id}`, jsonReq('PATCH', { title: G.title.trim(), html: G.html }));
    if (r.status !== 200) { toast(errMsg(r, 'Could not save the rule')); return; }
    G.rule = r.body; G.title = r.body.title; G.html = r.body.html;
    S.rules = null;
    render();
    toast('Rule saved');
  }
  async function deleteRule() {
    const r = await api(`/api/grammar_rules/${G.rule.id}`, { method: 'DELETE' });
    if (r.status !== 204) { toast(r.status === 409 ? `${r.body.reference_count} note(s) still use this rule` : errMsg(r, 'Delete failed')); return; }
    S.rules = null;
    S.pendingToast = 'Rule deleted';
    location.hash = '#/grammar';
  }

  function parseHash() {
    const parts = location.hash.replace(/^#\/?/, '').split('/').filter(Boolean);
    if (!parts.length) return { page: 'notes' };
    if (parts[0] === 'notes' && parts[1]) return { page: 'note', id: decodeURIComponent(parts[1]) };
    if (parts[0] === 'new-note') return { page: 'new' };
    if (parts[0] === 'new-grammar') return { page: 'grammar', id: 'new' };
    if (parts[0] === 'grammar') return { page: 'grammar', id: parts[1] || null };
    if (['triage', 'notes', 'settings'].includes(parts[0])) return { page: parts[0] };
    return { page: 'notes' };
  }
  async function router() {
    const r = parseHash();
    stopAudio();
    S.page = r.page; S.id = r.id || null;
    S.sheet = null; S.menu = null; S.confirm = null; S.pick = null; S.tab = 'word';
    if (!editorCtx()) E = null;
    if (S.pendingToast) { toast(S.pendingToast); S.pendingToast = null; }
    render({ top: true });
    try {
      if (r.page === 'triage') await enterTriage();
      else if (r.page === 'note') await enterNote(r.id);
      else if (r.page === 'new') await enterNew();
      else if (r.page === 'notes') await enterNotes();
      else if (r.page === 'settings') await enterSettings();
      else await enterGrammar(r.id);
    } catch (err) {
      console.error(err);
      toast(`Something went wrong: ${err.message}`);
    }
  }
  const go = (v) => { location.hash = `#/${v === 'new' ? 'new-note' : v}`; };

  /* --------------------------------------------------- pointer binding -- */
  function bindWave() {
    const w = app.querySelector('#wv');
    if (!w || !E || !E.f.audio_blob) return;
    let h = null;
    const frac = (e) => { const r = w.getBoundingClientRect(); return Math.max(0, Math.min(1, (e.clientX - r.left) / r.width)); };
    const move = (e) => {
      if (!h) return;
      const s = selection();
      if (!s.dur) return;
      let { a, b } = s;
      const fr = frac(e);
      if (h === 'a') a = Math.min(fr, b - 0.05); else b = Math.max(fr, a + 0.05);
      a = Math.max(0, a); b = Math.min(1, b);
      E.f.audio_sel_ms = [Math.round(a * s.dur * 1000), Math.round(b * s.dur * 1000)];
      const ns = selection();
      w.innerHTML = wave(ns);
      const rg = app.querySelector('#arng'); if (rg) rg.textContent = msRange(ns);
      afterEdit();
    };
    w.addEventListener('pointerdown', (e) => {
      const s = selection();
      if (!s.dur) return;
      const fr = frac(e);
      h = Math.abs(fr - s.a) < Math.abs(fr - s.b) ? 'a' : 'b';
      w.setPointerCapture(e.pointerId);
      move(e);
    });
    w.addEventListener('pointermove', move);
    w.addEventListener('pointerup', () => { h = null; });
  }
  function playSelection() {
    if (!E || !E.f.audio_blob) return;
    if (S.playKey === 'sel') { stopAudio(); render(); return; }
    stopAudio();
    const s = selection();
    PLAYER.src = blobUrl(E.f.audio_blob);
    const start = s.dur ? s.a * s.dur : 0; const end = s.dur ? s.b * s.dur : Infinity;
    S.playKey = 'sel';
    const startPlay = () => {
      PLAYER.currentTime = start;
      PLAYER.play().catch(() => { S.playKey = null; render(); toast('Could not play the audio'); });
      const step = () => {
        const p = app.querySelector('#phd');
        if (S.playKey !== 'sel') return;
        const t = PLAYER.currentTime;
        if (p && s.dur) p.setAttribute('x', (t / s.dur) * 640 - 1);
        if (t >= end || PLAYER.ended) { stopAudio(); render(); return; }
        playRaf = requestAnimationFrame(step);
      };
      playRaf = requestAnimationFrame(step);
    };
    if (PLAYER.readyState >= 1) startPlay(); else PLAYER.addEventListener('loadedmetadata', startPlay, { once: true });
    render();
  }
  // Provider order: drag by mouse or touch on the handle, or move with the
  // arrow keys when the handle has focus. Every change is saved.
  function saveProviderList(ul) {
    const kind = ul.dataset.kind;
    const items = [...ul.children];
    const order = items.map((li) => li.dataset.p);
    const disabled = items.filter((li) => li.classList.contains('off')).map((li) => li.dataset.p);
    patchSettings({ providers: { [kind]: { order, disabled } } }, 'Order saved');
  }
  function bindDrag() {
    app.querySelectorAll('.plist').forEach((ul) => {
      const renumber = () => [...ul.children].forEach((li, i) => { li.querySelector('.o').textContent = i + 1; });
      ul.querySelectorAll('.h').forEach((h) => {
        const li = h.parentElement;
        h.addEventListener('pointerdown', (e) => {
          e.preventDefault();
          h.setPointerCapture(e.pointerId);
          li.classList.add('drag');
          const before = [...ul.children].map((x) => x.dataset.p).join();
          const mv = (ev) => {
            const sibs = [...ul.children].filter((x) => x !== li);
            const after = sibs.find((s) => { const r = s.getBoundingClientRect(); return ev.clientY < r.top + r.height / 2; });
            ul.insertBefore(li, after || null);
            renumber();
          };
          const up = () => {
            li.classList.remove('drag');
            h.removeEventListener('pointermove', mv); h.removeEventListener('pointerup', up); h.removeEventListener('pointercancel', up);
            if ([...ul.children].map((x) => x.dataset.p).join() !== before) saveProviderList(ul);
          };
          h.addEventListener('pointermove', mv); h.addEventListener('pointerup', up); h.addEventListener('pointercancel', up);
        });
        h.addEventListener('keydown', (e) => {
          if (e.key === 'ArrowUp' && li.previousElementSibling) { ul.insertBefore(li, li.previousElementSibling); }
          else if (e.key === 'ArrowDown' && li.nextElementSibling) { ul.insertBefore(li.nextElementSibling, li); }
          else return;
          e.preventDefault();
          renumber();
          h.focus();
          S.refocusHandle = `${ul.dataset.kind}:${li.dataset.p}`;
          saveProviderList(ul);
        });
      });
    });
    if (S.refocusHandle) {
      // Split on the LAST colon: a kind key can contain one of its own
      // ("translations:en"), which an unlimited split would tear in half.
      const cut = S.refocusHandle.lastIndexOf(':');
      const kind = S.refocusHandle.slice(0, cut); const p = S.refocusHandle.slice(cut + 1);
      const h = app.querySelector(`.plist[data-kind="${CSS.escape(kind)}"] li[data-p="${CSS.escape(p)}"] .h`);
      if (h && document.activeElement !== h) h.focus({ preventScroll: true });
    }
  }

  /* ------------------------------------------------------------ events -- */
  async function openSuggest(kind) {
    S.sheet = { kind, anim: true }; S.pick = null; S.menu = null;
    const st = E.cands[kind];
    const q = defaultQuery(kind);
    if (!st || !st.fetched || (st.q !== q && !st.edited)) {
      if (st) { st.pq = {}; st.pqOpen = {}; }
      fetchKind(kind, { q });
    }
    render();
  }
  async function runReuse() {
    const R = S.sheet.reuse || (S.sheet.reuse = { q: '' });
    if (!R.q.trim()) { R.rows = null; render(); return; }
    R.loading = true; render();
    const r = await api(`/api/notes/authoring${qs({ q: R.q.trim(), audio_blob_presence: 'has', limit: 20, sort: 'updated_desc' })}`);
    if (!S.sheet || S.sheet.reuse !== R) return;
    R.loading = false;
    R.rows = r.status === 200 ? (r.body.notes || []).filter((n) => !E || n.id !== E.id) : [];
    render();
  }
  // One upload path, used by the Upload file control and by a file dropped
  // onto the editor (design D5). A dropped recording replaces the current
  // one exactly as an upload does.
  const AUDIO_EXT = /\.(mp3|m4a|aac|ogg|oga|opus|wav|flac|webm|weba|mp4|3gp|amr)$/i;
  const isAudioFile = (f) => !!f && (/^audio\//i.test(f.type || '') || AUDIO_EXT.test(f.name || ''));
  async function uploadAudioFile(file) {
    if (!file || !E) return false;
    if (!isAudioFile(file)) { toast(`“${file.name}” is not an audio file`); return false; }
    const form = new FormData();
    form.append('audio', file);
    const e0 = E;
    toast(`Uploading ${file.name}…`);
    let r;
    try {
      const resp = await fetch(`${API_BASE}/blobs`, { method: 'POST', body: form });
      r = { status: resp.status, body: await resp.json().catch(() => ({})) };
    } catch (err) { r = { status: 0, body: { error: err.message } }; }
    if (E !== e0) return false;
    if (r.status !== 200 || !r.body.sha256) { toast(errMsg(r, 'Upload failed')); return false; }
    setAudio(r.body.sha256, `upload · ${file.name}`, 'upload');
    S.sheet = null;
    render();
    toast(`Uploaded ${file.name}`);
    return true;
  }

  // The drag counter, not a boolean: dragenter/dragleave fire for every
  // child the pointer crosses, and a boolean flickers the overlay off the
  // moment the pointer enters a field inside it.
  let dragDepth = 0;
  const dragHasFiles = (e) => !!(e.dataTransfer && [...(e.dataTransfer.types || [])].includes('Files'));
  function setDropOverlay(on) {
    const el = app.querySelector('.dropz');
    if (on === !!el) return;
    if (!on) { el.remove(); return; }
    const d = document.createElement('div');
    d.className = 'dropz';
    d.innerHTML = `<div class="dropzi">${ic('snd')}<b>Drop an audio file</b><small>it replaces this note's recording</small></div>`;
    app.appendChild(d);
  }
  document.addEventListener('dragenter', (e) => {
    if (!E || !dragHasFiles(e)) return;
    dragDepth += 1;
    setDropOverlay(true);
  });
  document.addEventListener('dragover', (e) => {
    if (!E || !dragHasFiles(e)) return;
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
    // A render during the drag (an in-flight lookup answering, say)
    // replaces #app's contents and takes the overlay with it. dragover
    // keeps firing, so it is the one place that can put it back.
    if (dragDepth) setDropOverlay(true);
  });
  document.addEventListener('dragleave', (e) => {
    if (!E || !dragHasFiles(e)) return;
    dragDepth = Math.max(0, dragDepth - 1);
    if (!dragDepth) setDropOverlay(false);
  });
  document.addEventListener('drop', (e) => {
    if (!E || !dragHasFiles(e)) return;
    e.preventDefault();
    dragDepth = 0;
    setDropOverlay(false);
    const file = (e.dataTransfer.files || [])[0];
    if (file) uploadAudioFile(file);
  });

  async function clipCapture() {
    if (!E || S.clipBusy) return;
    let text;
    try {
      if (!navigator.clipboard || !navigator.clipboard.readText) throw new Error('unsupported');
      text = await navigator.clipboard.readText();
    } catch {
      toast('Can’t read the clipboard — allow clipboard access, or use Upload file');
      return;
    }
    const url = (text || '').trim();
    if (!/^https?:\/\/\S+$/i.test(url)) { toast('Clipboard holds no URL'); return; }
    S.clipBusy = true; render();
    const e0 = E;
    const r = await api('/api/enrich/manual-link', jsonReq('POST', { url }));
    S.clipBusy = false;
    if (E !== e0) return;
    if (r.status !== 200 || !r.body || !r.body.sha256) { render(); toast(errMsg(r, 'Capture failed')); return; }
    let short = url;
    try { const u = new URL(url); short = `${u.host}/…/${u.pathname.split('/').filter(Boolean).pop() || ''}`; } catch { /* keep */ }
    setAudio(r.body.sha256, `url · ${short}`, 'clipboard');
    S.sheet = null;
    render();
    toast('Captured from clipboard');
  }

  document.addEventListener('click', (e) => {
    if (!app.contains(e.target)) return;
    const b = e.target.closest('[data-act]');
    if (!b) {
      if (e.target.closest('a[href]')) { S.menu = S.confirm = S.pick = null; return; }
      if (S.menu || S.confirm || S.pick) { S.menu = S.confirm = S.pick = null; render(); }
      return;
    }
    if (b.disabled) return;
    const a = b.dataset.act; const v = b.dataset.v;
    if ((S.menu || S.confirm) && !b.closest('.pop') && !['menu', 't-del', 'n-del', 'grdel'].includes(a)) { S.menu = S.confirm = null; }
    if (S.pick && a !== 'pickv' && a !== 'pick') S.pick = null;
    const st = E && S.sheet && E.cands[S.sheet.kind];
    switch (a) {
      case 'go': go(v); break;
      case 'tab': S.tab = v; render(); break;
      case 'pick': if (S.pick && S.pick.k === b.dataset.pick) S.pick = null; else openPick(b); render(); break;
      case 'pickv': {
        const D = pickDef(S.pick.k);
        if (D) D.set(v);
        if (!D || !D.multi) S.pick = null;
        render();
        if (E && D && S.pick === null && E.customPos) app.querySelector('#f_posc')?.focus();
        break;
      }
      case 'sheet': openSuggest(b.dataset.kind); break;
      case 'close': S.sheet = null; render(); break;
      case 'rerun': if (st) { S.sheet.spin = true; st.edited = st.q !== defaultQuery(S.sheet.kind); fetchKind(S.sheet.kind, { force: true }).then(() => { if (S.sheet) { S.sheet.spin = false; const ov = Object.keys(st.pq).filter((p) => st.pq[p] && st.pq[p].trim() && st.pq[p].trim() !== st.q).length; toast(`Ran ${enabledFor(S.sheet.kind).length} providers${ov ? ` · ${ov} with its own query` : ''}`); } }); render(); } break;
      case 'pqedit': {
        if (!st) break;
        const p = b.dataset.p;
        st.pqOpen[p] = !st.pqOpen[p];
        if (st.pqOpen[p] && st.pq[p] === undefined && settings().override_prefill !== false) st.pq[p] = st.q;
        // The translations sheet shows one box per provider PER LANGUAGE
        // group, so the same provider's query row exists more than once.
        // Focus the one in the group whose control was pressed, not the
        // first in the sheet.
        const grp = b.closest('.lgrp');
        render();
        if (st.pqOpen[p]) {
          const sel = `[data-f="pq"][data-p="${CSS.escape(p)}"]`;
          const within = grp && grp.dataset.lang ? app.querySelector(`.lgrp[data-lang="${CSS.escape(grp.dataset.lang)}"] ${sel}`) : null;
          (within || app.querySelector(sel))?.focus();
        }
        break;
      }
      case 'pqreset': { if (!st) break; const p = b.dataset.p; delete st.pq[p]; st.pqOpen[p] = false; fetchKind(S.sheet.kind, { only: p }); render(); toast(`${p} uses the shared query again`); break; }
      case 'prerun': { if (!st) break; const p = b.dataset.p; S.sheet.pspin = p; fetchKind(S.sheet.kind, { only: p, force: true }).then(() => { if (S.sheet) { S.sheet.pspin = null; toast(`Ran ${p} with “${(st.P[p] && st.P[p].query) || st.q}”`); } }); render(); break; }
      case 'use': useCand(b.dataset.p, +b.dataset.i); break;
      case 'cplay': previewToggle(b.dataset.key, b.dataset.url); break;
      case 'play': playSelection(); break;
      case 'tradd': E.f.translations.push({ lang: (settings().default_target_langs || [])[0] || 'en', text: '' }); render(); { const A = app.querySelectorAll('[data-f="trt"]'); A[A.length - 1]?.focus(); } afterEdit(); break;
      case 'trdel': E.f.translations.splice(+b.dataset.i, 1); render(); break;
      case 'exadd': E.f.examples.push(''); render(); { const A = app.querySelectorAll('[data-f="ex"]'); A[A.length - 1]?.focus(); } break;
      case 'exdel': E.f.examples.splice(+b.dataset.i, 1); render(); break;
      case 'clip': clipCapture(); break;
      case 'upload': document.getElementById('fileIn').click(); break;
      case 'rsearch': runReuse(); break;
      case 'rattach': {
        const n = S.sheet && S.sheet.reuse && (S.sheet.reuse.rows || []).find((x) => x.id === v);
        if (!n) break;
        setAudio(n.audio_blob, `note · ${n.text}`, `note “${n.text}”`);
        S.sheet = null; render(); toast(`Attached the recording from “${n.text}”`);
        break;
      }
      case 'similar': {
        S.sheet = { kind: 'similar', anim: true, open: v || null, take: {}, dir: 'in' };
        const m = v && E.sim.find((x) => x.id === v);
        if (m) { S.sheet.dir = defaultDir(m); preTake(m); }
        render();
        break;
      }
      case 'mergeopen': {
        if (S.sheet.open === v) S.sheet.open = null;
        else { S.sheet.open = v; const m = E.sim.find((x) => x.id === v); S.sheet.dir = defaultDir(m); preTake(m); }
        render();
        break;
      }
      case 'mdir': S.sheet.dir = v; preTake(E.sim.find((x) => x.id === S.sheet.open)); render(); break;
      case 'take': S.sheet.take[v] = !S.sheet.take[v]; render(); break;
      case 'merge': doMerge(v); break;
      case 'simopen': go(`notes/${v}`); break;
      case 'menu': S.menu = S.menu ? null : (S.page === 'triage' ? 'triage' : 'note'); S.confirm = null; render(); break;
      case 't-del': case 'n-del': S.menu = null; S.confirm = 'delete'; render(); break;
      case 'grdel': S.confirm = 'rule'; render(); break;
      case 'cancel': S.confirm = null; render(); break;
      case 'del-yes': S.confirm = null; render(); if (S.page === 'triage') triageAction(tActions.del); else deleteNote(); break;
      case 'grdel-yes': S.confirm = null; deleteRule(); break;
      case 't-ready': triageAction(tActions.ready); break;
      case 't-skip': S.menu = null; triageAction(tActions.skip); break;
      case 't-prev': S.menu = null; if (!T.busy) { T.busy = true; goPrevious().finally(() => { T.busy = false; }); } break;
      case 't-back': S.menu = null; triageAction(tActions.back); break;
      case 't-save': S.menu = null; render(); triageAction(tActions.save); break;
      case 'tdup': S.menu = null; render(); triageAction(tActions.dup); break;
      case 'prefill': prefill(); break;
      case 'prefill-force': S.menu = null; render(); prefill(true); break;
      case 'status': E.f.status = v; render(); break;
      case 'save': saveNote(); break;
      case 'dup': S.menu = null; render(); duplicateNote(); break;
      case 'new-save': createNote(v); break;
      case 'open': go(`notes/${v}`); break;
      case 'fsheet': S.sheet = { kind: 'filters', anim: true }; render(); break;
      case 'fset': fToggle(b.dataset.k, v); N.offset = 0; fetchNotes(); render(); break;
      case 'sortset': N.sort = v; N.offset = 0; fetchNotes(); render(); break;
      case 'frm': { const f = b.dataset.k; if (FDEF[f].single) N.F[f] = 'any'; else N.F[f] = N.F[f].filter((x) => x !== v); N.offset = 0; fetchNotes(); render(); break; }
      case 'freset': N.F = blankFilters(); N.sort = 'updated'; N.offset = 0; fetchNotes(); render(); break;
      case 'page': N.offset = Math.max(0, N.offset + Number(v) * N.limit); fetchNotes(); app.querySelector('.scroll').scrollTop = 0; break;
      case 'triage-these': {
        const filters = notesFilterParams();
        T.adhoc = { adhoc: true, name: 'These results', filters, sort: SORT_API[N.sort] };
        go('triage');
        S.pendingToast = 'Triaging the current filter';
        break;
      }
      case 'set': patchSettings({ [b.dataset.k]: v }); break;
      case 'step': { const k = b.dataset.k; const cur = settings()[k] || 1; const next = Math.max(1, Math.min(10, cur + Number(v))); if (next !== cur) patchSettings({ [k]: next }); break; }
      case 'qpre': patchSettings({ override_prefill: !(settings().override_prefill !== false) }); break;
      case 'poff': {
        const li = b.closest('li'); li.classList.toggle('off');
        saveProviderList(li.parentElement);
        break;
      }
      case 'gedit': G.edit = !G.edit; render(); break;
      case 'grsave': saveRule(); break;
      case 'qset': {
        const qe = S.sheet.qe; const k = b.dataset.k;
        if (b.dataset.single) qe.filters[k] = v;
        else {
          const cur = String(qe.filters[k] || '').split(',').map((x) => x.trim()).filter(Boolean);
          const i = cur.indexOf(v); if (i < 0) cur.push(v); else cur.splice(i, 1);
          qe.filters[k] = cur.join(',');
        }
        render();
        break;
      }
      case 'qsort': S.sheet.qe.sort = v; render(); break;
      case 'qsave': saveQueueFromSheet(); break;
      case 'qdel': {
        const qe = S.sheet.qe;
        if (S.sheet.confirmDel !== qe.id) { S.sheet.confirmDel = qe.id; toast('Press Delete queue again to delete it — the notes are not affected'); break; }
        api(`/api/settings/triage_queues/${qe.id}`, { method: 'DELETE' }).then(async (r) => {
          if (r.status !== 200) { toast(errMsg(r, 'Could not delete')); return; }
          T.queues = r.body; T.selectedId = (r.body[0] || {}).id || null;
          try { localStorage.setItem('stabbur_triage_queue_id', T.selectedId); } catch { /* ignore */ }
          S.sheet = null; await loadQueue(); toast('Queue deleted');
        });
        break;
      }
      default: break;
    }
  });

  document.addEventListener('input', (e) => {
    const el = e.target; const f = el.dataset && el.dataset.f;
    if (!f) return;
    if (f === 'search') { N.q = el.value; N.offset = 0; fetchNotesSoon(); return; }
    if (f === 'q') { const st = E && S.sheet && E.cands[S.sheet.kind]; if (st) { st.q = el.value; st.edited = true; } return; }
    if (f === 'pq') { const st = E && S.sheet && E.cands[S.sheet.kind]; if (st) st.pq[el.dataset.p] = el.value; return; }
    if (f === 'reuseq') { if (S.sheet) (S.sheet.reuse || (S.sheet.reuse = {})).q = el.value; return; }
    if (f === 'valc') {
      applyLook({ ...settings(), value_color: 'custom', value_color_custom: el.value });
      el.parentElement.style.setProperty('--c', el.value);
      app.querySelectorAll('.sw').forEach((x) => x.setAttribute('aria-pressed', x.classList.contains('swc')));
      return;
    }
    if (f === 'ghtml') { G.html = el.value; return; }
    if (f === 'gtitle') { G.title = el.value.replace(/\n/g, ' '); el.style.height = 'auto'; el.style.height = `${el.scrollHeight}px`; return; }
    if (f === 'qname') { if (S.sheet && S.sheet.qe) S.sheet.qe.name = el.value; return; }
    if (f === 'qq') { if (S.sheet && S.sheet.qe) S.sheet.qe.filters.q = el.value; return; }
    if (f === 'langs') return;
    if (!E) return;
    const F = E.f;
    if (f === 'text') {
      F.text = el.value.replace(/\n/g, ' ');
      if (el.value !== F.text) el.value = F.text;
      if (!E.lemmaDirty) { F.lemma = deriveLemmaGuess(F.text); const l = app.querySelector('#f_lemma'); if (l) l.value = F.lemma; }
      if (!CSS.supports('field-sizing', 'content')) { el.style.height = 'auto'; el.style.height = `${el.scrollHeight}px`; }
    } else if (f === 'lemma') { F.lemma = el.value; E.lemmaDirty = true; delete E.prov.lemma; }
    else if (f === 'ipa') { F.transcription = el.value; delete E.prov.ipa; }
    else if (f === 'posc') {
      F.pos = el.value.trim(); delete E.prov.pos;
      const np = app.querySelector('.nopara');
      if (np && !SHAPES[F.pos]) np.textContent = F.pos ? `No paradigm for ${F.pos}` : 'Choose a part of speech to see its paradigm';
    }
    else if (f === 'infl') { F.inflections[el.dataset.k] = el.value; delete E.prov.inflections; }
    else if (f === 'trt') { F.translations[+el.dataset.i].text = el.value; delete E.prov.translations; }
    else if (f === 'ex') { F.examples[+el.dataset.i] = el.value; el.style.height = 'auto'; el.style.height = `${el.scrollHeight}px`; delete E.prov.examples; }
    afterEdit();
  });

  document.addEventListener('change', async (e) => {
    const el = e.target;
    if (el.id === 'fileIn') {
      const file = el.files[0];
      el.value = '';
      await uploadAudioFile(file);
      return;
    }
    const f = el.dataset && el.dataset.f;
    // A paradigm part of speech typed into the custom field: show its slots
    // (and leave custom mode for one of the six). Deferred past a click in
    // progress, so the Save it was blurred for still lands (C24).
    if (f === 'posc' && E && SHAPES[E.f.pos]) {
      if (POS.includes(E.f.pos)) E.customPos = false;
      const typed = shapeKeys(E.f.pos).some((k) => hasText(E.f.inflections[k]));
      if (!typed && E.stored && E.stored.pos === E.f.pos) E.f.inflections = { ...E.f.inflections, ...normInfl(E.stored.inflections) };
      renderAfterClick();
    }
    if (f === 'valc') patchSettings({ value_color: 'custom', value_color_custom: el.value });
    if (f === 'langs') {
      const langs = el.value.split(',').map((s) => s.trim().toLowerCase()).filter(Boolean);
      patchSettings({ default_target_langs: langs });
    }
  });

  document.addEventListener('keydown', (e) => {
    const t = e.target;
    if (e.key === 'Enter' && t.classList && (t.classList.contains('hw') || t.classList.contains('ttl'))) { e.preventDefault(); return; }
    if (e.key === 'Enter' && t.dataset) {
      if (t.dataset.f === 'q') { e.preventDefault(); app.querySelector('[data-act="rerun"]')?.click(); return; }
      if (t.dataset.f === 'pq') { e.preventDefault(); app.querySelector(`[data-act="prerun"][data-p="${CSS.escape(t.dataset.p)}"]`)?.click(); return; }
      if (t.dataset.f === 'reuseq') { e.preventDefault(); runReuse(); return; }
    }
    if (e.key === 'Enter' && t.tagName === 'TR' && t.dataset.act === 'open') { go(`notes/${t.dataset.v}`); return; }
    if (e.key === 'Escape' && (S.sheet || S.menu || S.confirm || S.pick)) { S.sheet = S.menu = S.confirm = S.pick = null; render(); return; }
    // Triage keys (desktop hints, but they work wherever a keyboard is):
    // never while typing, never under a sheet or a confirmation.
    if (S.page !== 'triage' || !E || S.sheet || S.confirm || e.metaKey || e.ctrlKey || e.altKey) return;
    if (/INPUT|TEXTAREA|SELECT/.test(document.activeElement && document.activeElement.tagName)) return;
    const map = { d: 't-del', s: 't-skip', t: 't-prev', r: 't-ready', e: 't-back', m: 't-save', l: 'prefill' };
    const act = map[e.key.toLowerCase()];
    if (!act) return;
    e.preventDefault();
    const fake = document.createElement('button');
    fake.dataset.act = act; fake.hidden = true;
    app.appendChild(fake); fake.click(); fake.remove();
  });

  // A re-render while a pointer is down would replace the element under it
  // and swallow the click, so it waits until that click has been handled.
  let pointerDown = false;
  let renderPending = false;
  function renderAfterClick() {
    if (!pointerDown) { render(); return; }
    renderPending = true;
  }
  document.addEventListener('pointerdown', () => { pointerDown = true; }, true);
  document.addEventListener('pointerup', () => {
    pointerDown = false;
    if (renderPending) { renderPending = false; setTimeout(render, 0); }
  }, true);

  // A scroll that MOVES the page closes an open picker, as in the reference.
  //
  // Not every scroll event is such a move. `render()` replaces #app's
  // innerHTML, which resets .scroll's scrollTop to 0, and then restores it —
  // and that restore dispatches a scroll event which lands here in the
  // capture phase. Closing on it meant that OPENING a picker closed it
  // again, since opening one renders; and only on a scrolled page, which is
  // exactly the operator's "sometimes I can't open them at all" (design D1).
  // So the position is compared against the one recorded when the picker
  // opened: restoring to it is not a scroll by the operator.
  app.addEventListener('scroll', (e) => {
    if (!S.pick) return;
    // Scrolling the menu's own list is using it, not scrolling away from
    // it: a picker with more entries than fit (the grammar rules, the
    // languages) overflows and must survive a wheel inside itself.
    if (e.target && e.target.closest && e.target.closest('.menu')) return;
    const sc = scroller();
    if (e.target === sc && sc.scrollTop === S.pick.sc) return;
    S.pick = null;
    app.querySelector('.menu')?.remove();
  }, true);
  mq.addEventListener('change', () => { S.vp = mq.matches ? 'desktop' : 'phone'; S.pick = null; render(); });
  window.addEventListener('hashchange', router);
  window.addEventListener('beforeunload', (e) => { if (E && E.ctx !== 'triage' && isDirty()) { e.preventDefault(); e.returnValue = ''; } });

  /* -------------------------------------------------------------- boot -- */
  loadSettings().then(router);
})();
