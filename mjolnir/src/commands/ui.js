import crypto from "node:crypto";
import fs from "node:fs";
import http from "node:http";
import os from "node:os";
import path from "node:path";
import { exec } from "node:child_process";
import { fileURLToPath } from "node:url";
import { parse } from "@babel/parser";
import { loadIndex, readModuleSource } from "../parseBundle.js";
import { extractFactoryBody } from "../factory.js";
import { diffModuleFactories, serializeDiffEntries } from "../diff.js";
import { walk } from "./deps.js";
import {
  loadManifest,
  deobfuscateModuleSource,
  ensureModuleDeobfuscated,
  deobfuscatedModulePath,
} from "./deobfuscate.js";
import { runExplode } from "./explode.js";
import { compareSessions, diffChangedModule } from "../compareBundles.js";
import {
  DEFAULT_PATCHES_DIR,
  listPatches,
  loadPatch,
  savePatch,
  previewPatch,
  applyPatch,
  computePatchedModuleSource,
} from "../patches.js";
import { assembleBundle } from "./assemble.js";
import { listCompanions } from "../companions.js";
import { listPatchbackPairs, loadPatchbackPair } from "../patchbackPairs.js";
import { reassembleBundle } from "../reassemble.js";
import {
  loadDeckCardModel,
  saveDeckCardModel,
  deckCategory,
  nextCardId,
  stripHtml,
  cardDirectionsInDeck,
  addOccurrence,
  updateOccurrenceLetter,
  removeOccurrence,
  shuffleOccurrences,
  searchDecks,
  searchCards,
  nextDeckId,
  locateDeckCardModules,
  NEW_CARD_SKELETON,
  NEW_DECK_DEFAULTS,
} from "../deckData.js";

const ASSETS_DIR = path.join(path.dirname(fileURLToPath(import.meta.url)), "../ui-assets");
const DEFAULT_EDITOR_CMD = "code {path}";
const SEARCH_CONTEXT_CHARS = 80;
const SEARCH_RESULT_LIMIT = 50;

const STATIC_FILES = {
  "/": { file: "index.html", contentType: "text/html; charset=utf-8" },
  "/index.html": { file: "index.html", contentType: "text/html; charset=utf-8" },
  "/app.js": { file: "app.js", contentType: "text/javascript; charset=utf-8" },
  "/styles.css": { file: "styles.css", contentType: "text/css; charset=utf-8" },
};

function sendJson(res, status, body) {
  const data = JSON.stringify(body);
  res.writeHead(status, {
    "Content-Type": "application/json; charset=utf-8",
    "Content-Length": Buffer.byteLength(data),
  });
  res.end(data);
}

function sendError(res, status, message) {
  sendJson(res, status, { error: message });
}

const MAX_UPLOAD_BYTES = 67108864; // 64 MiB — same ceiling the publish guards elsewhere already enforce (D48)

// D-C4: raw bytes, not JSON — the generic `readJsonBody` below would try
// (and fail) to `JSON.parse` a binary bundle upload, so the upload route is
// special-cased in `createRequestHandler` to read via this instead, before
// the generic JSON-body branch ever runs.
function readRawBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    let total = 0;
    req.on("data", (chunk) => {
      total += chunk.length;
      if (total > MAX_UPLOAD_BYTES) {
        reject(new Error("upload exceeds 64 MiB"));
        req.destroy();
        return;
      }
      chunks.push(chunk);
    });
    req.on("end", () => resolve(Buffer.concat(chunks)));
    req.on("error", reject);
  });
}

function readJsonBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on("data", (chunk) => chunks.push(chunk));
    req.on("end", () => {
      if (chunks.length === 0) return resolve({});
      try {
        resolve(JSON.parse(Buffer.concat(chunks).toString("utf8")));
      } catch (err) {
        reject(new Error("invalid JSON body"));
      }
    });
    req.on("error", reject);
  });
}

function serveStatic(req, res, pathname) {
  const entry = STATIC_FILES[pathname];
  if (!entry) {
    sendError(res, 404, "not found");
    return;
  }
  const filePath = path.join(ASSETS_DIR, entry.file);
  fs.readFile(filePath, (err, data) => {
    if (err) {
      sendError(res, 404, "not found");
      return;
    }
    res.writeHead(200, { "Content-Type": entry.contentType });
    res.end(data);
  });
}

function parseModuleSource(source) {
  return parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
}

// --- Session store -----------------------------------------------------
//
// A session is an in-memory, server-lifetime-only record of one opened
// bundle, keyed by a deterministic id derived from its resolved absolute
// path — opening the same path twice returns the same session rather than
// creating a duplicate. Everything (Explorer, Compare, Editor, Patches,
// deck/card) resolves its target bundle through a session id instead of a
// server-wide closed-over path, which is what lets more than one bundle be
// open at once.

function sessionIdFor(resolvedPath) {
  return crypto.createHash("sha1").update(resolvedPath).digest("hex").slice(0, 12);
}

function createSessionStore() {
  const sessions = new Map();

  // `displayName` is purely cosmetic (the session chip/dropdown label) — an
  // upload's actual on-disk path is a randomized, collision-proof temp
  // filename that's unreadable and not meant to be shown (see the upload
  // route below); passing the operator's original filename here keeps the
  // UI showing something sensible instead of that temp path's basename.
  // `null` (the path-opened case) falls back to the resolved path's own
  // basename, unchanged from before.
  function openByPath(bundlePath, { displayName = null } = {}) {
    if (!bundlePath || typeof bundlePath !== "string") {
      throw new Error("a bundle path is required");
    }
    const resolvedPath = path.resolve(bundlePath);
    const id = sessionIdFor(resolvedPath);
    const existing = sessions.get(id);
    if (existing) return existing;

    if (!fs.existsSync(resolvedPath)) {
      throw new Error(`no such file: ${resolvedPath}`);
    }
    let cache;
    try {
      cache = loadIndex(resolvedPath);
    } catch (err) {
      throw new Error(`could not parse bundle at ${resolvedPath}: ${err.message}`);
    }

    const session = {
      id,
      bundlePath: resolvedPath,
      displayName,
      cache,
      explodedReady: false,
      manifest: null,
      deckCardAvailable: undefined,
    };
    sessions.set(id, session);
    return session;
  }

  return { openByPath, get: (id) => sessions.get(id), list: () => [...sessions.values()] };
}

function refreshSessionCache(session) {
  session.cache = loadIndex(session.bundlePath);
}

// Lazily builds/refreshes the exploded-module manifest a session needs for
// classification, deobfuscation, and deck/card access — never required just
// to browse raw module source (Explorer's base list/search/show work off
// the module index cache alone).
function ensureExploded(session) {
  if (session.explodedReady) return session.manifest;
  runExplode(session.bundlePath);
  session.manifest = loadManifest(session.bundlePath);
  session.explodedReady = true;
  return session.manifest;
}

function deckCardAvailable(session) {
  if (session.deckCardAvailable !== undefined) return session.deckCardAvailable;
  try {
    const manifest = ensureExploded(session);
    locateDeckCardModules(session.bundlePath, manifest);
    session.deckCardAvailable = true;
  } catch {
    session.deckCardAvailable = false;
  }
  return session.deckCardAvailable;
}

function sessionSummary(session) {
  return {
    id: session.id,
    bundlePath: session.bundlePath,
    displayName: session.displayName || null,
    moduleCount: session.cache.moduleCount,
    entryId: session.cache.entryId,
    deckCardAvailable: deckCardAvailable(session),
  };
}

// Invalidates everything about a session that's derived from the bundle's
// current on-disk bytes — called after any write (a deck/card save, a
// committed patch) so the next request re-derives from the bundle file
// rather than trusting now-stale offsets, matching the tool's existing
// "never trust stale state" posture.
function invalidateSessionAfterWrite(session) {
  refreshSessionCache(session);
  session.explodedReady = false;
  session.manifest = null;
  session.deckCardAvailable = undefined;
}

function requireSession(sessions, res, id) {
  const session = sessions.get(id);
  if (!session) {
    sendError(res, 404, `no open session "${id}"`);
    return null;
  }
  return session;
}

// --- Explorer ------------------------------------------------------------

function moduleListEntry(session, id, mod) {
  const manifestEntry = session.manifest && session.manifest[id];
  return {
    id: Number(id),
    size: mod.size,
    verboseName: mod.verboseName,
    looksMinified: mod.looksMinified,
    deps: mod.deps.length,
    dependents: mod.dependents.length,
    classification: manifestEntry ? manifestEntry.classification : null,
  };
}

function searchModules(session, { query, regex = false, limit = SEARCH_RESULT_LIMIT }) {
  if (!query || !query.trim()) return [];
  const source = fs.readFileSync(session.bundlePath, "utf8");
  const re = regex
    ? new RegExp(query, "g")
    : new RegExp(query.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"), "g");

  const results = [];
  const ids = Object.keys(session.cache.modules).map(Number).sort((a, b) => a - b);
  outer: for (const id of ids) {
    const mod = session.cache.modules[id];
    const body = source.slice(mod.start, mod.end);
    re.lastIndex = 0;
    let match;
    while ((match = re.exec(body))) {
      const from = Math.max(0, match.index - SEARCH_CONTEXT_CHARS);
      const to = Math.min(body.length, match.index + match[0].length + SEARCH_CONTEXT_CHARS);
      results.push({ moduleId: id, snippet: body.slice(from, to).replace(/\s+/g, " ") });
      if (results.length >= limit) break outer;
      if (re.lastIndex === match.index) re.lastIndex++;
    }
  }
  return results;
}

// --- Editor ---------------------------------------------------------------

function runEditorCommand(commandTemplate, filePath) {
  const cmd = commandTemplate.replace("{path}", JSON.stringify(filePath));
  return new Promise((resolve) => {
    exec(cmd, (error, stdout, stderr) => {
      resolve({
        success: !error,
        code: error ? (typeof error.code === "number" ? error.code : 1) : 0,
        stderr: stderr ? stderr.toString() : error ? error.message : "",
      });
    });
  });
}

// --- Deck/Card editor (mounted, not rewritten) ----------------------------
//
// The deck/card API is reused verbatim from the pre-workbench `ui <bundle>`
// server, parameterized only by which bundle path it closes over — unchanged
// from before except that the bundle path now comes from a resolved session
// instead of a single server-wide argument.

function deckSummaries(decks, cards) {
  const cardCountByDeck = new Map();
  for (const card of cards) {
    cardCountByDeck.set(card.DECK_ID, (cardCountByDeck.get(card.DECK_ID) || 0) + 1);
  }
  return decks.map((deck) => ({
    Name: deck.Name,
    Title: deck.Title,
    category: deckCategory(deck),
    cardCount: cardCountByDeck.get(deck.Name) || 0,
  }));
}

function findDeck(decks, name) {
  return decks.find((d) => d.Name === name);
}

function findCard(cards, id) {
  return cards.find((c) => c.ID === id);
}

const PREVIEW_MAX_LENGTH = 80;

function previewText(card) {
  const plainText = stripHtml(card.N);
  return plainText.length > PREVIEW_MAX_LENGTH
    ? `${plainText.slice(0, PREVIEW_MAX_LENGTH - 1)}…`
    : plainText;
}

function cardSummary(card, directions = []) {
  return { ID: card.ID, DECK_ID: card.DECK_ID, N: card.N, preview: previewText(card), directions };
}

function occurrenceSummaries(deck, cardsById) {
  return deck.Cards.map((ref, index) => {
    const cardId = ref.Card.slice(0, -1);
    const letter = ref.Card.slice(-1);
    const card = cardsById.get(cardId);
    return { index, cardId, letter, preview: card ? previewText(card) : null };
  });
}

function createDeckCardRoutes(bundlePath) {
  return [
    {
      method: "GET",
      pattern: /^\/api\/decks$/,
      handler: () => {
        const { decks, cards } = loadDeckCardModel(bundlePath);
        return { status: 200, body: deckSummaries(decks, cards) };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/decks\/([^/]+)$/,
      handler: (match) => {
        const name = decodeURIComponent(match[1]);
        const { decks, cards } = loadDeckCardModel(bundlePath);
        const deck = findDeck(decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };
        const directions = cardDirectionsInDeck(deck);
        const deckCards = cards
          .filter((c) => c.DECK_ID === name)
          .map((c) => cardSummary(c, [...(directions.get(c.ID) || [])].sort()));
        const cardsById = new Map(cards.map((c) => [c.ID, c]));
        return {
          status: 200,
          body: {
            ...deck,
            category: deckCategory(deck),
            cards: deckCards,
            occurrences: occurrenceSummaries(deck, cardsById),
          },
        };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/decks$/,
      handler: (match, body) => {
        if (!body || typeof body.Name !== "string" || !body.Name) {
          return { status: 400, body: { error: "Name is required" } };
        }
        const model = loadDeckCardModel(bundlePath);
        if (findDeck(model.decks, body.Name)) {
          return { status: 400, body: { error: `deck "${body.Name}" already exists` } };
        }
        const deck = { ID: nextDeckId(model.decks), Name: body.Name, Title: body.Title || "" };
        for (const [key, defaultValue] of Object.entries(NEW_DECK_DEFAULTS)) {
          deck[key] = body[key] !== undefined && body[key] !== "" ? body[key] : defaultValue;
        }
        deck.Cards = [];
        model.decks.push(deck);
        saveDeckCardModel(bundlePath, model);
        return { status: 201, body: deck };
      },
    },
    {
      method: "PUT",
      pattern: /^\/api\/decks\/([^/]+)$/,
      handler: (match, body) => {
        const name = decodeURIComponent(match[1]);
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };
        Object.assign(deck, body, { Name: deck.Name });
        saveDeckCardModel(bundlePath, model);
        return { status: 200, body: deck };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/cards\/([^/]+)$/,
      handler: (match) => {
        const id = decodeURIComponent(match[1]);
        const { cards } = loadDeckCardModel(bundlePath);
        const card = findCard(cards, id);
        if (!card) return { status: 404, body: { error: `no card with id "${id}"` } };
        return { status: 200, body: card };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/cards$/,
      handler: (match, body) => {
        if (!body || typeof body.DECK_ID !== "string" || !body.DECK_ID) {
          return { status: 400, body: { error: "DECK_ID is required" } };
        }
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, body.DECK_ID);
        if (!deck) return { status: 400, body: { error: `no deck named "${body.DECK_ID}"` } };

        const id = nextCardId(deck.Name, model.cards);
        const card = {
          DECK_ID: deck.Name,
          ID: id,
          N: body.N ?? NEW_CARD_SKELETON.N,
          E: body.E ?? NEW_CARD_SKELETON.E,
          D: body.D ?? deck.Title ?? "",
          X: body.X ?? NEW_CARD_SKELETON.X,
          A: body.A ?? "X",
        };
        model.cards.push(card);
        addOccurrence(deck, id, "N");
        addOccurrence(deck, id, "E");

        saveDeckCardModel(bundlePath, model);
        return { status: 201, body: card };
      },
    },
    {
      method: "PUT",
      pattern: /^\/api\/cards\/([^/]+)$/,
      handler: (match, body) => {
        const id = decodeURIComponent(match[1]);
        const model = loadDeckCardModel(bundlePath);
        const card = findCard(model.cards, id);
        if (!card) return { status: 404, body: { error: `no card with id "${id}"` } };
        Object.assign(card, body, { ID: card.ID });
        saveDeckCardModel(bundlePath, model);
        return { status: 200, body: card };
      },
    },
    {
      method: "DELETE",
      pattern: /^\/api\/cards\/([^/]+)$/,
      handler: (match) => {
        const id = decodeURIComponent(match[1]);
        const model = loadDeckCardModel(bundlePath);
        const card = findCard(model.cards, id);
        if (!card) return { status: 404, body: { error: `no card with id "${id}"` } };

        model.cards = model.cards.filter((c) => c.ID !== id);
        for (const deck of model.decks) {
          deck.Cards = deck.Cards.filter((ref) => ref.Card.slice(0, -1) !== id);
        }

        saveDeckCardModel(bundlePath, model);
        return { status: 200, body: { deleted: id } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/decks\/([^/]+)\/occurrences$/,
      handler: (match, body) => {
        const name = decodeURIComponent(match[1]);
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };

        const cardId = body && body.cardId;
        const letter = body && body.letter;
        if (!cardId) return { status: 400, body: { error: "cardId is required" } };
        const card = findCard(model.cards, cardId);
        if (!card) return { status: 400, body: { error: `no card with id "${cardId}"` } };
        if (card.DECK_ID !== deck.Name) {
          return {
            status: 400,
            body: { error: `card "${cardId}" belongs to deck "${card.DECK_ID}", not "${deck.Name}"` },
          };
        }

        addOccurrence(deck, cardId, letter);
        saveDeckCardModel(bundlePath, model);
        return { status: 201, body: { index: deck.Cards.length - 1, cardId, letter } };
      },
    },
    {
      method: "PUT",
      pattern: /^\/api\/decks\/([^/]+)\/occurrences\/(\d+)$/,
      handler: (match, body) => {
        const name = decodeURIComponent(match[1]);
        const index = Number(match[2]);
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };

        updateOccurrenceLetter(deck, index, body && body.letter);
        saveDeckCardModel(bundlePath, model);
        const ref = deck.Cards[index];
        return { status: 200, body: { index, cardId: ref.Card.slice(0, -1), letter: ref.Card.slice(-1) } };
      },
    },
    {
      method: "DELETE",
      pattern: /^\/api\/decks\/([^/]+)\/occurrences\/(\d+)$/,
      handler: (match) => {
        const name = decodeURIComponent(match[1]);
        const index = Number(match[2]);
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };

        removeOccurrence(deck, index);
        saveDeckCardModel(bundlePath, model);
        return { status: 200, body: { deleted: index } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/decks\/([^/]+)\/shuffle$/,
      handler: (match) => {
        const name = decodeURIComponent(match[1]);
        const model = loadDeckCardModel(bundlePath);
        const deck = findDeck(model.decks, name);
        if (!deck) return { status: 404, body: { error: `no deck named "${name}"` } };

        shuffleOccurrences(deck);
        saveDeckCardModel(bundlePath, model);
        const cardsById = new Map(model.cards.map((c) => [c.ID, c]));
        return { status: 200, body: { occurrences: occurrenceSummaries(deck, cardsById) } };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/search$/,
      handler: (match, body, url) => {
        const q = url.searchParams.get("q") || "";
        if (!q.trim()) return { status: 200, body: { decks: [], cards: [], cardsTotal: 0 } };

        const { decks, cards } = loadDeckCardModel(bundlePath);
        const deckMatches = searchDecks(decks, q).map((d) => ({
          Name: d.Name,
          Title: d.Title,
          category: deckCategory(d),
        }));
        const cardMatches = searchCards(cards, q);
        return {
          status: 200,
          body: {
            decks: deckMatches,
            cards: cardMatches.slice(0, SEARCH_RESULT_LIMIT).map((c) => cardSummary(c)),
            cardsTotal: cardMatches.length,
          },
        };
      },
    },
  ];
}

const DECKCARD_PREFIX_PATTERN = /^\/api\/sessions\/([^/]+)\/deckcard(\/.*)?$/;

// progress-sync-shim's shim/restore-companion fetch against
// `${SYNC_BASE_URL}/<id>` directly (confirmed: `patches/js/
// 2080-progress-sync-shim.edited.js` and `progress-sync-restore-
// companion.js` both do `fetch(SYNC_BASE_URL + '/' + encodeURIComponent(id), ...)`)
// — so the default needs the full `/mjolnir/userdata` path, not just the
// host `TUN_PUBLIC_BASE` already configures.
function defaultSyncBaseUrl() {
  const base = process.env.TUN_PUBLIC_BASE;
  if (!base) return undefined;
  return `${base.replace(/\/+$/, "")}/mjolnir/userdata`;
}

// audio-cache-prefetch: the prefetcher companion and the rewritten mod 1440
// patch both build their own `/audio-manifest/...` and `/blob/...` paths
// off this one base — a single fixed sub-path default no longer makes
// sense now that the device resolves cardId → sha256 itself (D-P6 retires
// `/audio-by-card/*`), so this defaults to the bare `TUN_PUBLIC_BASE`.
function defaultAudioBaseUrl() {
  const base = process.env.TUN_PUBLIC_BASE;
  if (!base) return undefined;
  return base.replace(/\/+$/, "");
}

// --- Route table ------------------------------------------------------

function createRoutes(sessions, { patchesDir, companionsDir, editorCmd }) {
  return [
    {
      method: "GET",
      pattern: /^\/api\/sessions$/,
      handler: () => ({ status: 200, body: sessions.list().map(sessionSummary) }),
    },
    {
      method: "POST",
      pattern: /^\/api\/sessions$/,
      handler: (match, body) => {
        const session = sessions.openByPath(body && body.path);
        return { status: 201, body: sessionSummary(session) };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        return { status: 200, body: sessionSummary(session) };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/modules$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        ensureExploded(session);
        const modules = Object.entries(session.cache.modules).map(([id, mod]) =>
          moduleListEntry(session, id, mod)
        );
        return { status: 200, body: modules };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/search$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        const query = url.searchParams.get("q") || "";
        const regex = url.searchParams.get("regex") === "true";
        const limit = Number(url.searchParams.get("limit")) || SEARCH_RESULT_LIMIT;
        return { status: 200, body: searchModules(session, { query, regex, limit }) };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        const id = Number(match[2]);
        const mod = session.cache.modules[id];
        if (!mod) return { status: 404, body: { error: `module ${id} not found` } };
        const source = readModuleSource(session.bundlePath, mod);
        return {
          status: 200,
          body: {
            id,
            verboseName: mod.verboseName,
            size: mod.size,
            looksMinified: mod.looksMinified,
            deps: mod.deps,
            dependents: mod.dependents,
            source,
          },
        };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)\/deobfuscated$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        const id = Number(match[2]);
        const mod = session.cache.modules[id];
        if (!mod) return { status: 404, body: { error: `module ${id} not found` } };
        const source = readModuleSource(session.bundlePath, mod);
        return { status: 200, body: { code: deobfuscateModuleSource(source) } };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)\/deps$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        const id = Number(match[2]);
        const mod = session.cache.modules[id];
        if (!mod) return { status: 404, body: { error: `module ${id} not found` } };
        const direction = url.searchParams.get("direction") === "dependents" ? "dependents" : "deps";
        const depth = Number(url.searchParams.get("depth")) || 1;
        const visited = walk(session.cache, id, direction, depth);
        return { status: 200, body: { direction, depth, modules: [...visited.entries()].map(([nid, d]) => ({ id: nid, depth: d })) } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)\/deobfuscate$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        ensureExploded(session);
        const id = Number(match[2]);
        const result = ensureModuleDeobfuscated(session.bundlePath, id);
        return { status: 200, body: result };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)\/open-in-editor$/,
      handler: async (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        ensureExploded(session);
        const id = Number(match[2]);
        const { path: filePath } = ensureModuleDeobfuscated(session.bundlePath, id);
        const result = await runEditorCommand(editorCmd, filePath);
        return { status: 200, body: { path: filePath, ...result } };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/sessions\/([^/]+)\/modules\/(\d+)\/live-diff$/,
      handler: (match, body, url, res) => {
        const session = requireSession(sessions, res, match[1]);
        if (!session) return null;
        const id = Number(match[2]);
        const mod = session.cache.modules[id];
        if (!mod) return { status: 404, body: { error: `module ${id} not found` } };

        const filePath = deobfuscatedModulePath(session.bundlePath, id);
        if (!fs.existsSync(filePath)) {
          return { status: 404, body: { error: "module has not been opened for editing yet" } };
        }

        const originalSource = readModuleSource(session.bundlePath, mod);
        const baseline = deobfuscateModuleSource(originalSource);
        const current = fs.readFileSync(filePath, "utf8");

        try {
          const rFactory = extractFactoryBody(parseModuleSource(baseline)).factory;
          const mFactory = extractFactoryBody(parseModuleSource(current)).factory;
          const diff = serializeDiffEntries(diffModuleFactories(rFactory, mFactory));
          return { status: 200, body: { path: filePath, baseline, current, diff } };
        } catch (err) {
          return { status: 400, body: { error: `could not parse current edit: ${err.message}`, path: filePath, baseline, current } };
        }
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/compare$/,
      handler: (match, body, url, res) => {
        const a = requireSession(sessions, res, url.searchParams.get("a"));
        if (!a) return null;
        const b = requireSession(sessions, res, url.searchParams.get("b"));
        if (!b) return null;
        return { status: 200, body: compareSessions(a.bundlePath, a.cache, b.bundlePath, b.cache) };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/compare\/diff$/,
      handler: (match, body, url, res) => {
        const a = requireSession(sessions, res, url.searchParams.get("a"));
        if (!a) return null;
        const b = requireSession(sessions, res, url.searchParams.get("b"));
        if (!b) return null;
        const aModuleId = Number(url.searchParams.get("aModuleId"));
        const bModuleId = Number(url.searchParams.get("bModuleId"));
        const aMod = a.cache.modules[aModuleId];
        const bMod = b.cache.modules[bModuleId];
        if (!aMod || !bMod) return { status: 404, body: { error: "module not found in one of the two sessions" } };
        return { status: 200, body: { diff: diffChangedModule(a.bundlePath, aMod, b.bundlePath, bMod) } };
      },
    },
    {
      method: "GET",
      pattern: /^\/api\/patches$/,
      handler: () => ({ status: 200, body: listPatches(patchesDir) }),
    },
    // Diagnostic: the Patches/Assemble tabs show this resolved absolute
    // path next to their list so "why is this empty" has an immediate,
    // visible answer (a wrong `WORKBENCH_PATCHES_DIR` override, most
    // commonly a host filesystem path that doesn't exist inside the
    // container — see DEPLOY.md) instead of a silent empty list.
    {
      method: "GET",
      pattern: /^\/api\/patches-dir$/,
      handler: () => ({ status: 200, body: { patchesDir: path.resolve(patchesDir) } }),
    },
    // D110: companions (append-only, `bundle-tool companion`) are a
    // genuinely different kind of "patch" from the JSON-store ones above
    // (replace-in-place) — listed separately, from `patchesDir/js` (this
    // repo's own convention, `patches/README.md`), excluding raw
    // `.baseline.js`/`.edited.js` pair members, which are replace-patch
    // source material, not standalone scripts.
    {
      method: "GET",
      pattern: /^\/api\/companions$/,
      handler: () => ({ status: 200, body: { companionsDir: path.resolve(companionsDir), companions: listCompanions(companionsDir) } }),
    },
    // Companions have no "before" state to diff against — they add new
    // code, they don't modify any existing module — so their "preview" is
    // just their own raw source (placeholders shown unsubstituted; actual
    // values are only known at assembly time). Session-free, unlike the
    // patch/pair preview routes above, since it's not located against any
    // particular bundle at all.
    {
      method: "GET",
      pattern: /^\/api\/companions\/([^/]+)\/source$/,
      handler: (match) => {
        const name = decodeURIComponent(match[1]);
        const companion = listCompanions(companionsDir).find((c) => c.name === name);
        if (!companion) throw new Error(`no such companion: ${name}`);
        return { status: 200, body: { name, source: fs.readFileSync(companion.path, "utf8") } };
      },
    },
    // D111: raw `<id>-name.baseline.js`/`.edited.js` pairs (also REPLACE-
    // style, same reconciliation algorithm as the JSON-store patches above,
    // just module-id addressed instead of content-located) — e.g. this
    // repo's own `2176-my-account-build-id`. Listed from the same directory
    // companions live in (`patches/js`), since `listCompanions` already
    // excludes pair members from its own list.
    {
      method: "GET",
      pattern: /^\/api\/patchback-pairs$/,
      handler: () => ({
        status: 200,
        body: { patchbackDir: path.resolve(companionsDir), pairs: listPatchbackPairs(companionsDir) },
      }),
    },
    {
      method: "POST",
      pattern: /^\/api\/patchback-pairs\/([^/]+)\/preview$/,
      handler: async (match, body, url, res) => {
        const session = requireSession(sessions, res, body && body.sessionId);
        if (!session) return null;
        const pair = loadPatchbackPair(companionsDir, decodeURIComponent(match[1]));
        if (!session.cache.modules[pair.moduleId]) {
          throw new Error(`module ${pair.moduleId} not found in this session's bundle`);
        }
        const currentSource = readModuleSource(session.bundlePath, session.cache.modules[pair.moduleId]);
        const patch = {
          baseline: fs.readFileSync(pair.baselinePath, "utf8"),
          modified: fs.readFileSync(pair.editedPath, "utf8"),
        };
        const newSource = await computePatchedModuleSource({
          bundlePath: session.bundlePath,
          cache: session.cache,
          targetModuleId: pair.moduleId,
          patch,
        });
        const rFactory = extractFactoryBody(parseModuleSource(currentSource)).factory;
        const mFactory = extractFactoryBody(parseModuleSource(newSource)).factory;
        const diff = serializeDiffEntries(diffModuleFactories(rFactory, mFactory));
        return { status: 200, body: { targetModuleId: pair.moduleId, diff } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/patchback-pairs\/([^/]+)\/apply$/,
      handler: async (match, body, url, res) => {
        const session = requireSession(sessions, res, body && body.sessionId);
        if (!session) return null;
        const pair = loadPatchbackPair(companionsDir, decodeURIComponent(match[1]));
        if (!session.cache.modules[pair.moduleId]) {
          throw new Error(`module ${pair.moduleId} not found in this session's bundle`);
        }
        const patch = {
          baseline: fs.readFileSync(pair.baselinePath, "utf8"),
          modified: fs.readFileSync(pair.editedPath, "utf8"),
        };
        const newSource = await computePatchedModuleSource({
          bundlePath: session.bundlePath,
          cache: session.cache,
          targetModuleId: pair.moduleId,
          patch,
        });
        const outBuffer = reassembleBundle(session.bundlePath, session.cache.modules, [
          { moduleId: pair.moduleId, newSource },
        ]);
        fs.writeFileSync(session.bundlePath, outBuffer);
        invalidateSessionAfterWrite(session);
        return { status: 200, body: { targetModuleId: pair.moduleId } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/patches$/,
      handler: (match, body) => {
        const patch = savePatch(patchesDir, body || {});
        return { status: 201, body: patch };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/patches\/([^/]+)\/preview$/,
      handler: async (match, body, url, res) => {
        const session = requireSession(sessions, res, body && body.sessionId);
        if (!session) return null;
        const patch = loadPatch(patchesDir, decodeURIComponent(match[1]));
        const { targetModuleId, currentSource, newSource } = await previewPatch({
          bundlePath: session.bundlePath,
          cache: session.cache,
          patch,
        });
        const rFactory = extractFactoryBody(parseModuleSource(currentSource)).factory;
        const mFactory = extractFactoryBody(parseModuleSource(newSource)).factory;
        const diff = serializeDiffEntries(diffModuleFactories(rFactory, mFactory));
        return { status: 200, body: { targetModuleId, diff } };
      },
    },
    {
      method: "POST",
      pattern: /^\/api\/patches\/([^/]+)\/apply$/,
      handler: async (match, body, url, res) => {
        const session = requireSession(sessions, res, body && body.sessionId);
        if (!session) return null;
        const patch = loadPatch(patchesDir, decodeURIComponent(match[1]));
        const result = await applyPatch({ bundlePath: session.bundlePath, cache: session.cache, patch });
        invalidateSessionAfterWrite(session);
        return { status: 200, body: result };
      },
    },
    // D-L7/task 5.2: the "Assemble" action — applies an ordered list of
    // stored patches (this server's own `patchesDir`) against a chosen base
    // APK folder's own bundle, stamps BUILD_ID/base_version/patch_rev via
    // the companion mechanism, and writes one output bundle. Session-free:
    // it reads the base folder directly rather than requiring it be opened
    // as a session first, since it never mutates the base in place.
    {
      method: "POST",
      pattern: /^\/api\/assemble$/,
      handler: async (match, body) => {
        const { baseFolderPath, patchNames, patchbackPairNames, outputPath, companionFiles, placeholders } = body || {};
        if (!baseFolderPath) throw new Error("baseFolderPath is required");
        if (!outputPath) throw new Error("outputPath is required");
        // generic-placeholder-substitution: SYNC_BASE_URL/SYNC_TOKEN/
        // AUDIO_BASE_URL are the only three keys this server knows how to
        // default (the same values it already configures for the
        // device-facing `/mjolnir/userdata/*` routes, per task 4.2's
        // decision) — so assembling via the workbench doesn't require
        // retyping values this process already has configured. An explicit
        // request value (even falsy/empty) still falls back to the default,
        // matching this route's own prior behavior exactly.
        const finalPlaceholders = {
          ...placeholders,
          SYNC_BASE_URL: placeholders?.SYNC_BASE_URL || defaultSyncBaseUrl(),
          SYNC_TOKEN: placeholders?.SYNC_TOKEN || process.env.OPERATOR_AUTH_TOKEN || undefined,
          AUDIO_BASE_URL: placeholders?.AUDIO_BASE_URL || defaultAudioBaseUrl(),
        };
        const result = await assembleBundle({
          baseFolderPath,
          patchNames: patchNames || [],
          patchesDir,
          patchbackPairNames: patchbackPairNames || [],
          patchbackDir: companionsDir,
          outputPath,
          companionFiles: companionFiles || [],
          placeholders: finalPlaceholders,
        });
        return { status: 201, body: result };
      },
    },
  ];
}

function dispatchDeckCard(session, subPath, req, res, url, body) {
  // The reused deck/card route table's patterns (`/^\/api\/decks$/`, etc.)
  // were written for the pre-workbench server's top-level paths; re-add the
  // `/api` prefix stripped off by the session/deckcard mount point so they
  // match unmodified.
  const fullPath = `/api${subPath}`;
  const routes = createDeckCardRoutes(session.bundlePath);
  const route = routes.find((r) => r.method === req.method && r.pattern.test(fullPath));
  if (!route) {
    sendError(res, 404, "no such route");
    return;
  }
  const match = fullPath.match(route.pattern);
  const { status, body: resBody } = route.handler(match, body, url);
  if (["POST", "PUT", "DELETE"].includes(req.method)) invalidateSessionAfterWrite(session);
  sendJson(res, status, resBody);
}

// The actual request-handling logic, factored out from `http.createServer`
// so it can be mounted inside another service's own HTTP server (hub's
// `/mjolnir/workbench/*`, bundle-session-management's "reachable with no
// local invocation" requirement) as well as run standalone. Every internal
// path here (`/api/...`, `/`, `/app.js`, `/styles.css`) is relative to
// wherever this handler is itself mounted — a caller mounting it under a
// prefix is responsible for stripping that prefix off `req.url` first (see
// `hub/src/server.js`'s mount point), exactly the contract `app.js`'s own
// relative `fetch()` calls and `index.html`'s relative asset links assume.
export function createRequestHandler({ patchesDir = DEFAULT_PATCHES_DIR, companionsDir, editorCmd = DEFAULT_EDITOR_CMD } = {}) {
  const sessions = createSessionStore();
  // Defaults to `<patchesDir>/js` (this repo's own convention,
  // `patches/README.md`) rather than a hardcoded literal, so overriding
  // `patchesDir` (e.g. `WORKBENCH_PATCHES_DIR`) relocates companions too.
  const resolvedCompanionsDir = companionsDir || path.join(patchesDir, "js");
  const routes = createRoutes(sessions, { patchesDir, companionsDir: resolvedCompanionsDir, editorCmd });

  return async (req, res) => {
    const url = new URL(req.url, "http://127.0.0.1");

    if (!url.pathname.startsWith("/api/")) {
      serveStatic(req, res, url.pathname);
      return;
    }

    // D-C4: staged to a temp file, then opened exactly like a path-based
    // session — zero duplicated session logic. Handled before the generic
    // JSON-body branch below, since this body is raw bundle bytes, not JSON.
    if (req.method === "POST" && url.pathname === "/api/sessions/upload") {
      try {
        const bytes = await readRawBody(req);
        const rawFilename = req.headers["x-filename"] || "upload.bundle";
        // The on-disk temp filename stays a randomized, collision-proof
        // string (never shown) — only the *session's displayed name* uses
        // the operator's original filename, sanitized for display but not
        // otherwise mangled with a timestamp/hex prefix.
        const safeName = path.basename(rawFilename).replace(/[^A-Za-z0-9._-]/g, "_") || "upload.bundle";
        const tempPath = path.join(os.tmpdir(), `bundle-tool-upload-${crypto.randomBytes(8).toString("hex")}`);
        fs.writeFileSync(tempPath, bytes);
        const session = sessions.openByPath(tempPath, { displayName: safeName });
        return sendJson(res, 201, sessionSummary(session));
      } catch (err) {
        return sendError(res, 400, err.message);
      }
    }

    const deckCardMatch = url.pathname.match(DECKCARD_PREFIX_PATTERN);
    try {
      const body = ["POST", "PUT", "DELETE"].includes(req.method) ? await readJsonBody(req) : undefined;

      if (deckCardMatch) {
        const session = sessions.get(deckCardMatch[1]);
        if (!session) {
          sendError(res, 404, `no open session "${deckCardMatch[1]}"`);
          return;
        }
        if (!deckCardAvailable(session)) {
          sendError(res, 404, "this bundle has no deck/card module pair");
          return;
        }
        dispatchDeckCard(session, deckCardMatch[2] || "/", req, res, url, body);
        return;
      }

      const route = routes.find((r) => r.method === req.method && r.pattern.test(url.pathname));
      if (!route) {
        sendError(res, 404, "no such route");
        return;
      }
      const match = url.pathname.match(route.pattern);
      const result = await route.handler(match, body, url, res);
      if (result === null) return; // handler already sent an error response
      sendJson(res, result.status, result.body);
    } catch (err) {
      sendError(res, 400, err.message);
    }
  };
}

export function createServer(opts = {}) {
  return http.createServer(createRequestHandler(opts));
}

export function runUi({ port = 0, patchesDir = DEFAULT_PATCHES_DIR, editorCmd = DEFAULT_EDITOR_CMD } = {}) {
  const server = createServer({ patchesDir, editorCmd });
  server.listen(port, "127.0.0.1", () => {
    const { port: boundPort } = server.address();
    console.log(`bundle-tool ui listening at http://127.0.0.1:${boundPort}`);
  });
  return server;
}
