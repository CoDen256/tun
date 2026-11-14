import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { loadDeckCardModel } from "../../src/deckData.js";
import { createServer } from "../../src/commands/ui.js";
import { buildFixtureBundleSource } from "../fixtures/deckCardFixture.js";

function withServer(fn, opts) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-ui-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, buildFixtureBundleSource());

  const server = createServer(opts);
  return new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        await fn({ baseUrl, bundlePath, dir });
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
}

async function api(baseUrl, method, p, body) {
  const res = await fetch(`${baseUrl}${p}`, {
    method,
    headers: body !== undefined ? { "Content-Type": "application/json" } : undefined,
    body: body !== undefined ? JSON.stringify(body) : undefined,
  });
  const data = await res.json();
  return { status: res.status, data };
}

async function openSession(baseUrl, bundlePath) {
  const { data } = await api(baseUrl, "POST", "/api/sessions", { path: bundlePath });
  return data;
}

function flattenDiffEntries(entries) {
  const out = [];
  for (const e of entries || []) {
    out.push(e);
    if (e.children) out.push(...flattenDiffEntries(e.children));
  }
  return out;
}

function deckcard(sessionId, subPath) {
  return `/api/sessions/${sessionId}/deckcard${subPath}`;
}

async function withDeckCardSession(fn) {
  await withServer(async ({ baseUrl, bundlePath }) => {
    const session = await openSession(baseUrl, bundlePath);
    await fn({ baseUrl, bundlePath, sessionId: session.id });
  });
}

// --- Session management ----------------------------------------------

test("opening a valid bundle path creates a session and reports deck/card availability", async () => {
  await withServer(async ({ baseUrl, bundlePath }) => {
    const { status, data } = await api(baseUrl, "POST", "/api/sessions", { path: bundlePath });
    assert.equal(status, 201);
    assert.equal(data.moduleCount, 2);
    assert.equal(data.deckCardAvailable, true);
  });
});

test("opening an invalid path errors without creating a session", async () => {
  await withServer(async ({ baseUrl }) => {
    const { status } = await api(baseUrl, "POST", "/api/sessions", { path: "/no/such/bundle/file" });
    assert.equal(status, 400);
    const { data } = await api(baseUrl, "GET", "/api/sessions");
    assert.deepEqual(data, []);
  });
});

test("a fresh server has no sessions open", async () => {
  await withServer(async ({ baseUrl }) => {
    const { data } = await api(baseUrl, "GET", "/api/sessions");
    assert.deepEqual(data, []);
  });
});

test("two sessions can be open concurrently and are independently addressable", async () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-ui-"));
  const bundleA = path.join(dir, "a.bundle");
  const bundleB = path.join(dir, "b.bundle");
  fs.writeFileSync(bundleA, buildFixtureBundleSource());
  fs.writeFileSync(bundleB, buildFixtureBundleSource());

  const server = createServer({});
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const sessionA = await openSession(baseUrl, bundleA);
        const sessionB = await openSession(baseUrl, bundleB);
        assert.notEqual(sessionA.id, sessionB.id);
        const { data: list } = await api(baseUrl, "GET", "/api/sessions");
        assert.equal(list.length, 2);
        const { status: statusA } = await api(baseUrl, "GET", `/api/sessions/${sessionA.id}`);
        const { status: statusB } = await api(baseUrl, "GET", `/api/sessions/${sessionB.id}`);
        assert.equal(statusA, 200);
        assert.equal(statusB, 200);
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
});

// --- Explorer -----------------------------------------------------------

test("GET /api/sessions/:id/modules lists modules with classification", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "GET", `/api/sessions/${sessionId}/modules`);
    assert.equal(status, 200);
    assert.equal(data.length, 2);
    assert.ok(data.every((m) => m.classification === "data"));
  });
});

test("GET /api/sessions/:id/modules/:id returns module source", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "GET", `/api/sessions/${sessionId}/modules/100`);
    assert.equal(status, 200);
    assert.match(data.source, /A01/);
  });
});

test("GET /api/sessions/:id/search finds a matching module, equivalent to grep", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "GET", `/api/sessions/${sessionId}/search?q=Q2`);
    assert.equal(status, 200);
    assert.equal(data.length, 1);
    assert.equal(data[0].moduleId, 101);
  });
});

test("GET /api/sessions/:id/modules/:id/deps reports dependencies", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(
      baseUrl,
      "GET",
      `/api/sessions/${sessionId}/modules/100/deps?direction=deps`
    );
    assert.equal(status, 200);
    assert.deepEqual(data.modules, []);
  });
});

// --- Compare --------------------------------------------------------------

function compareModuleSource(id, bodySrc, deps = [], verboseName) {
  const vn = verboseName ? `, ${JSON.stringify(verboseName)}` : "";
  return `__d(function (g, r, i, a, m, e, d) { ${bodySrc} }, ${id}, ${JSON.stringify(deps)}${vn});\n`;
}

function buildCompareBundleA() {
  return (
    compareModuleSource(1, "return 1;") + // unchanged (matched by hash, different id on B side)
    compareModuleSource(2, "return 1;", [], "Y.js") + // changed (matched by verboseName)
    compareModuleSource(3, "return 3;", [], "removed.js") + // removed
    compareModuleSource(5, "return 5;", [], "dup.js") + // ambiguous verboseName (A side has 2)
    compareModuleSource(6, "return 6;", [], "dup.js") +
    `__r(1);\n`
  );
}

function buildCompareBundleB() {
  return (
    compareModuleSource(99, "return 1;") + // same content as A's id 1, different id
    compareModuleSource(2, "return 2;", [], "Y.js") + // changed content, same verboseName
    compareModuleSource(4, "return 4;", [], "added.js") + // added
    compareModuleSource(5, "return 99;", [], "dup.js") + // ambiguous on A side -> added, not matched
    `__r(99);\n`
  );
}

async function withCompareSessions(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-compare-"));
  const bundleA = path.join(dir, "a.bundle");
  const bundleB = path.join(dir, "b.bundle");
  fs.writeFileSync(bundleA, buildCompareBundleA());
  fs.writeFileSync(bundleB, buildCompareBundleB());

  const server = createServer({});
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const sessionA = await openSession(baseUrl, bundleA);
        const sessionB = await openSession(baseUrl, bundleB);
        await fn({ baseUrl, sessionA, sessionB });
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
}

test("compare matches unchanged content across differing ids, detects changed/added/removed, and falls back on ambiguous verboseName", async () => {
  await withCompareSessions(async ({ baseUrl, sessionA, sessionB }) => {
    const { status, data } = await api(
      baseUrl,
      "GET",
      `/api/compare?a=${sessionA.id}&b=${sessionB.id}`
    );
    assert.equal(status, 200);

    assert.ok(data.unchanged.some((p) => p.aId === 1 && p.bId === 99));

    const changed = data.changed.find((p) => p.verboseName === "Y.js");
    assert.ok(changed);
    assert.equal(changed.aId, 2);
    assert.equal(changed.bId, 2);

    assert.ok(data.removed.includes(3), "removed.js only in A");
    assert.ok(data.added.includes(4), "added.js only in B");

    // Ambiguous verboseName ("dup.js" appears twice in A) falls back to
    // added+removed rather than a guessed pairing.
    assert.ok(data.removed.includes(5) || data.removed.includes(6));
    assert.ok(data.added.includes(5));
  });
});

test("compare diff endpoint renders a changed module's structural diff", async () => {
  await withCompareSessions(async ({ baseUrl, sessionA, sessionB }) => {
    const { status, data } = await api(
      baseUrl,
      "GET",
      `/api/compare/diff?a=${sessionA.id}&b=${sessionB.id}&aModuleId=2&bModuleId=2`
    );
    assert.equal(status, 200);
    assert.ok(Array.isArray(data.diff));
    assert.ok(data.diff.some((e) => e.kind === "modified"));
  });
});

// --- Patches --------------------------------------------------------------

const PATCH_MARKER = "UNIQUE_UI_PATCH_MARKER";

function patchModuleSource(extraProps) {
  return `__d(function (g, r, i, a, m, e, d) {\n  return Object.assign({}, g, { ${PATCH_MARKER}: 1${extraProps} });\n}, 42, []);\n`;
}

async function withPatchSession(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-patch-"));
  const patchesDir = path.join(dir, "patches");
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, patchModuleSource("") + "__r(42);\n");

  const server = createServer({ patchesDir });
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const session = await openSession(baseUrl, bundlePath);
        await fn({ baseUrl, bundlePath, patchesDir, sessionId: session.id });
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
}

test("saving a patch writes the expected JSON shape", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir }) => {
    const { status, data } = await api(baseUrl, "POST", "/api/patches", {
      name: "add-prop",
      description: "adds a property",
      locator: { contains: PATCH_MARKER },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });
    assert.equal(status, 201);
    const onDisk = JSON.parse(fs.readFileSync(path.join(patchesDir, "add-prop.json"), "utf8"));
    assert.equal(onDisk.name, "add-prop");
    assert.equal(onDisk.description, "adds a property");
    assert.deepEqual(onDisk.locator, { contains: PATCH_MARKER });
    assert.equal(typeof onDisk.baseline, "string");
    assert.equal(typeof onDisk.modified, "string");
    assert.equal(typeof onDisk.createdAt, "string");
    assert.deepEqual(onDisk.verifiedAgainstVersions, []);
  });
});

test("GET /api/patches lists stored patches with name/description/locator", async () => {
  await withPatchSession(async ({ baseUrl }) => {
    await api(baseUrl, "POST", "/api/patches", {
      name: "p1",
      description: "d1",
      locator: { contains: PATCH_MARKER },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });
    const { status, data } = await api(baseUrl, "GET", "/api/patches");
    assert.equal(status, 200);
    assert.equal(data.length, 1);
    assert.equal(data[0].name, "p1");
  });
});

test("previewing a patch shows a diff and never writes to the bundle", async () => {
  await withPatchSession(async ({ baseUrl, bundlePath, sessionId }) => {
    await api(baseUrl, "POST", "/api/patches", {
      name: "p1",
      locator: { contains: PATCH_MARKER },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });
    const before = fs.readFileSync(bundlePath);
    const { status, data } = await api(baseUrl, "POST", "/api/patches/p1/preview", { sessionId });
    assert.equal(status, 200);
    assert.equal(data.targetModuleId, 42);
    assert.ok(flattenDiffEntries(data.diff).some((e) => e.kind === "added"));
    const after = fs.readFileSync(bundlePath);
    assert.ok(before.equals(after));
  });
});

test("applying a patch locates the target by content and writes the change", async () => {
  await withPatchSession(async ({ baseUrl, bundlePath, sessionId }) => {
    await api(baseUrl, "POST", "/api/patches", {
      name: "p1",
      locator: { contains: PATCH_MARKER },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });
    const { status, data } = await api(baseUrl, "POST", "/api/patches/p1/apply", { sessionId });
    assert.equal(status, 200);
    assert.equal(data.targetModuleId, 42);

    const after = fs.readFileSync(bundlePath, "utf8");
    assert.match(after, /added:3/);
  });
});

test("a locator matching zero modules reports a clear error and applies nothing", async () => {
  await withPatchSession(async ({ baseUrl, bundlePath, sessionId }) => {
    await api(baseUrl, "POST", "/api/patches", {
      name: "p1",
      locator: { contains: "NO_SUCH_MARKER_ANYWHERE" },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });
    const before = fs.readFileSync(bundlePath);
    const { status, data } = await api(baseUrl, "POST", "/api/patches/p1/apply", { sessionId });
    assert.equal(status, 400);
    assert.match(data.error, /matched no modules/);
    const after = fs.readFileSync(bundlePath);
    assert.ok(before.equals(after));
  });
});

// --- Editor -----------------------------------------------------------

async function withEditorSession(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-editor-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, patchModuleSource("") + "__r(42);\n");

  const server = createServer({ editorCmd: `${JSON.stringify(process.execPath)} -e "" {path}` });
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const session = await openSession(baseUrl, bundlePath);
        await fn({ baseUrl, bundlePath, sessionId: session.id });
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
}

test("opening a module without a deobfuscated file creates one; reopening does not regenerate it", async () => {
  await withEditorSession(async ({ baseUrl, sessionId }) => {
    const first = await api(baseUrl, "POST", `/api/sessions/${sessionId}/modules/42/deobfuscate`);
    assert.equal(first.status, 200);
    assert.equal(first.data.created, true);

    fs.writeFileSync(first.data.path, "/* hand edit preserved */\n" + fs.readFileSync(first.data.path, "utf8"));

    const second = await api(baseUrl, "POST", `/api/sessions/${sessionId}/modules/42/deobfuscate`);
    assert.equal(second.data.created, false);
    assert.match(fs.readFileSync(second.data.path, "utf8"), /hand edit preserved/);
  });
});

test("the live-diff endpoint 404s before a module has been opened for editing", async () => {
  await withEditorSession(async ({ baseUrl, sessionId }) => {
    const { status } = await api(baseUrl, "GET", `/api/sessions/${sessionId}/modules/42/live-diff`);
    assert.equal(status, 404);
  });
});

test("the live-diff endpoint reflects an on-disk edit made between two polls", async () => {
  await withEditorSession(async ({ baseUrl, sessionId }) => {
    const { data: opened } = await api(baseUrl, "POST", `/api/sessions/${sessionId}/modules/42/deobfuscate`);

    const first = await api(baseUrl, "GET", `/api/sessions/${sessionId}/modules/42/live-diff`);
    assert.equal(first.status, 200);
    assert.ok(flattenDiffEntries(first.data.diff).every((e) => e.kind === "unchanged"));

    const edited = fs.readFileSync(opened.path, "utf8").replace(
      `${PATCH_MARKER}: 1`,
      `${PATCH_MARKER}: 1, added: 3`
    );
    fs.writeFileSync(opened.path, edited);

    const second = await api(baseUrl, "GET", `/api/sessions/${sessionId}/modules/42/live-diff`);
    assert.equal(second.status, 200);
    assert.ok(flattenDiffEntries(second.data.diff).some((e) => e.kind === "added"));
  });
});

test("open-in-editor runs the configured command and reports success", async () => {
  await withEditorSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", `/api/sessions/${sessionId}/modules/42/open-in-editor`);
    assert.equal(status, 200);
    assert.equal(data.success, true);
    assert.ok(fs.existsSync(data.path));
  });
});

test("an editor-command failure is reported with the file's path still available", async () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-editor-fail-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, patchModuleSource("") + "__r(42);\n");
  const server = createServer({ editorCmd: "no_such_editor_command_xyz {path}" });
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const session = await openSession(baseUrl, bundlePath);
        const { status, data } = await api(
          baseUrl,
          "POST",
          `/api/sessions/${session.id}/modules/42/open-in-editor`
        );
        assert.equal(status, 200);
        assert.equal(data.success, false);
        assert.ok(data.path);
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
});

// --- Deck/card editor, mounted under a session ----------------------------

test("GET /deckcard/decks lists decks grouped by category (via category field)", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "GET", deckcard(sessionId, "/decks"));
    assert.equal(status, 200);
    assert.equal(data.length, 2);
    const a01 = data.find((d) => d.Name === "A01");
    assert.equal(a01.category, "A");
    assert.equal(a01.cardCount, 2);
  });
});

test("GET /deckcard/decks/:name returns deck detail with resolved cards", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "GET", deckcard(sessionId, "/decks/A01"));
    assert.equal(status, 200);
    assert.equal(data.cards.length, 2);
    for (const card of data.cards) {
      assert.ok(card.preview, "each card should have a plain-text preview");
      assert.doesNotMatch(card.preview, /<[^>]+>/);
    }
    assert.equal(data.cards.find((c) => c.ID === "A01001").preview, "Q1");
    assert.deepEqual(data.cards.find((c) => c.ID === "A01001").directions, ["N"]);
  });
});

test("GET /deckcard/decks/:name reports every direction letter a card is referenced with in that deck", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { data } = await api(baseUrl, "GET", deckcard(sessionId, "/decks/B01"));
    assert.deepEqual(data.cards.find((c) => c.ID === "B01001").directions, ["E", "N"]);
  });
});

test("POST /deckcard/cards creates a card, appends an N-direction deck reference, and persists it", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/cards"), { DECK_ID: "A01" });
    assert.equal(status, 201);
    assert.equal(data.ID, "A01003");
    assert.equal(data.N, '<div class="center">...</div>');

    const model = loadDeckCardModel(bundlePath);
    assert.ok(model.cards.some((c) => c.ID === "A01003"));
    const deck = model.decks.find((d) => d.Name === "A01");
    assert.deepEqual(
      deck.Cards.find((ref) => ref.Card === "A01003N"),
      { Card: "A01003N", P: "N" }
    );
  });
});

test("creating a card adds both an N and an E occurrence, each with P:N", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/cards"), { DECK_ID: "B01" });
    assert.equal(status, 201);

    const model = loadDeckCardModel(bundlePath);
    const deck = model.decks.find((d) => d.Name === "B01");
    const refsForNewCard = deck.Cards.filter((ref) => ref.Card.startsWith(data.ID));
    assert.deepEqual(
      refsForNewCard.map((r) => r.Card.slice(-1)).sort(),
      ["E", "N"]
    );
    assert.ok(refsForNewCard.every((r) => r.P === "N"));
  });
});

test("PUT /deckcard/cards/:id edits a card and the edit is reflected on reload", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "PUT", deckcard(sessionId, "/cards/A01001"), {
      N: "<div>updated</div>",
    });
    assert.equal(status, 200);
    assert.equal(data.N, "<div>updated</div>");

    const model = loadDeckCardModel(bundlePath);
    assert.equal(model.cards.find((c) => c.ID === "A01001").N, "<div>updated</div>");
  });
});

test("DELETE /deckcard/cards/:id removes the card and its deck references", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status } = await api(baseUrl, "DELETE", deckcard(sessionId, "/cards/A01001"));
    assert.equal(status, 200);

    const model = loadDeckCardModel(bundlePath);
    assert.ok(!model.cards.some((c) => c.ID === "A01001"));
    const deck = model.decks.find((d) => d.Name === "A01");
    assert.ok(!deck.Cards.some((ref) => ref.Card.startsWith("A01001")));
  });
});

test("an edit that would orphan a reference is rejected and the bundle is left unchanged", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const before = fs.readFileSync(bundlePath);

    const { status, data } = await api(baseUrl, "PUT", deckcard(sessionId, "/cards/A01001"), {
      DECK_ID: "NO_SUCH_DECK",
    });
    assert.equal(status, 400);
    assert.match(data.error, /NO_SUCH_DECK/);

    const after = fs.readFileSync(bundlePath);
    assert.ok(before.equals(after));

    const model = loadDeckCardModel(bundlePath);
    assert.equal(model.cards.find((c) => c.ID === "A01001").DECK_ID, "A01");
  });
});

test("POST /deckcard/decks creates a new empty deck with sensible defaults and an auto-assigned ID", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks"), {
      Name: "C01",
      Title: "Deck C1",
    });
    assert.equal(status, 201);
    assert.deepEqual(data.Cards, []);
    assert.equal(data.ID, 2, "next id after the fixture's existing 0 and 1");
    assert.equal(data.PullCounter, 0);
    assert.equal(data.Enabled, true);
    assert.equal(data.MaxInterval, 10);
    assert.equal(data.AutoTickStreak, 1);
    assert.equal(data.AutoHammerCount, 2);

    const model = loadDeckCardModel(bundlePath);
    assert.ok(model.decks.some((d) => d.Name === "C01"));
  });
});

test("POST /deckcard/decks lets the request override individual defaults", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks"), {
      Name: "C02",
      Title: "Deck C2",
      MaxInterval: 5,
      Code: "02",
    });
    assert.equal(data.MaxInterval, 5);
    assert.equal(data.Code, "02");
    assert.equal(data.PullCounter, 0, "fields not overridden still get their default");
  });
});

test("POST /deckcard/decks ignores a client-supplied ID and assigns its own", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks"), { Name: "C03", ID: 9999 });
    assert.notEqual(data.ID, 9999);
    assert.equal(data.ID, 2);
  });
});

test("POST /deckcard/decks/:name/shuffle reorders Cards[] but keeps the same occurrences", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    for (let i = 0; i < 10; i++) {
      await api(baseUrl, "POST", deckcard(sessionId, "/decks/A01/occurrences"), {
        cardId: "A01001",
        letter: "N",
      });
    }
    const before = loadDeckCardModel(bundlePath).decks.find((d) => d.Name === "A01").Cards;

    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks/A01/shuffle"), {});
    assert.equal(status, 200);

    const after = loadDeckCardModel(bundlePath).decks.find((d) => d.Name === "A01").Cards;
    assert.equal(after.length, before.length);
    assert.deepEqual(
      [...after].sort((a, b) => a.Card.localeCompare(b.Card)),
      [...before].sort((a, b) => a.Card.localeCompare(b.Card)),
      "same multiset of occurrences, just reordered"
    );
    assert.notDeepEqual(after.map((r) => r.Card), before.map((r) => r.Card));
    assert.deepEqual(
      data.occurrences.map((o) => o.cardId + o.letter),
      after.map((r) => r.Card)
    );
  });
});

test("POST /deckcard/decks/:name/shuffle on an unknown deck 404s", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status } = await api(baseUrl, "POST", deckcard(sessionId, "/decks/NOPE/shuffle"), {});
    assert.equal(status, 404);
  });
});

test("GET /deckcard/decks/:name includes occurrences in Cards[] array order", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { data } = await api(baseUrl, "GET", deckcard(sessionId, "/decks/B01"));
    assert.deepEqual(
      data.occurrences.map((o) => ({ cardId: o.cardId, letter: o.letter })),
      [
        { cardId: "B01001", letter: "N" },
        { cardId: "B01001", letter: "E" },
      ]
    );
    assert.equal(data.occurrences[0].preview, "Q3");
  });
});

test("POST /deckcard/decks/:name/occurrences appends a new occurrence and persists it", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks/A01/occurrences"), {
      cardId: "A01001",
      letter: "A",
    });
    assert.equal(status, 201);
    assert.deepEqual(data, { index: 2, cardId: "A01001", letter: "A" });

    const model = loadDeckCardModel(bundlePath);
    const deck = model.decks.find((d) => d.Name === "A01");
    assert.deepEqual(deck.Cards[2], { Card: "A01001A", P: "N" });
  });
});

test("POST /deckcard/decks/:name/occurrences rejects a card that belongs to a different deck", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks/A01/occurrences"), {
      cardId: "B01001",
      letter: "N",
    });
    assert.equal(status, 400);
    assert.match(data.error, /belongs to deck "B01"/);
  });
});

test("POST /deckcard/decks/:name/occurrences rejects an invalid letter", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { status, data } = await api(baseUrl, "POST", deckcard(sessionId, "/decks/A01/occurrences"), {
      cardId: "A01001",
      letter: "Z",
    });
    assert.equal(status, 400);
    assert.match(data.error, /invalid occurrence letter/);
  });
});

test("PUT /deckcard/decks/:name/occurrences/:index changes that occurrence's letter", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status, data } = await api(baseUrl, "PUT", deckcard(sessionId, "/decks/B01/occurrences/1"), {
      letter: "A",
    });
    assert.equal(status, 200);
    assert.deepEqual(data, { index: 1, cardId: "B01001", letter: "A" });

    const model = loadDeckCardModel(bundlePath);
    const deck = model.decks.find((d) => d.Name === "B01");
    assert.deepEqual(deck.Cards[1], { Card: "B01001A", P: "N" });
    assert.equal(deck.Cards[0].Card, "B01001N", "the other occurrence is untouched");
  });
});

test("DELETE /deckcard/decks/:name/occurrences/:index removes only that occurrence", async () => {
  await withDeckCardSession(async ({ baseUrl, bundlePath, sessionId }) => {
    const { status } = await api(baseUrl, "DELETE", deckcard(sessionId, "/decks/B01/occurrences/0"));
    assert.equal(status, 200);

    const model = loadDeckCardModel(bundlePath);
    const deck = model.decks.find((d) => d.Name === "B01");
    assert.equal(deck.Cards.length, 1);
    assert.equal(deck.Cards[0].Card, "B01001E");
  });
});

test("GET /deckcard/search finds decks by title and cards by content, case-insensitively", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const byDeckTitle = await api(baseUrl, "GET", deckcard(sessionId, "/search?q=deck+b1"));
    assert.equal(byDeckTitle.data.decks.length, 1);
    assert.equal(byDeckTitle.data.decks[0].Name, "B01");

    const byCardContent = await api(baseUrl, "GET", deckcard(sessionId, "/search?q=Q2"));
    assert.equal(byCardContent.data.cards.length, 1);
    assert.equal(byCardContent.data.cards[0].ID, "A01002");
  });
});

test("GET /deckcard/search with an empty query returns no results", async () => {
  await withDeckCardSession(async ({ baseUrl, sessionId }) => {
    const { data } = await api(baseUrl, "GET", deckcard(sessionId, "/search?q="));
    assert.deepEqual(data, { decks: [], cards: [], cardsTotal: 0 });
  });
});

test("the deck/card routes 404 for a bundle session without a deck/card module pair", async () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-nodeckcard-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, patchModuleSource("") + "__r(42);\n");
  const server = createServer({});
  await new Promise((resolve, reject) => {
    server.listen(0, "127.0.0.1", async () => {
      const { port } = server.address();
      const baseUrl = `http://127.0.0.1:${port}`;
      try {
        const session = await openSession(baseUrl, bundlePath);
        assert.equal(session.deckCardAvailable, false);
        const { status } = await api(baseUrl, "GET", deckcard(session.id, "/decks"));
        assert.equal(status, 404);
        resolve();
      } catch (err) {
        reject(err);
      } finally {
        server.close();
        fs.rmSync(dir, { recursive: true, force: true });
      }
    });
  });
});

// --- Assemble (task 5) ------------------------------------------------

test("POST /api/assemble applies an ordered patch list against a base folder and writes one output bundle", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir, bundlePath }) => {
    const dir = path.dirname(bundlePath);
    const baseFolder = path.join(dir, "base-folder");
    fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
    fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
    fs.writeFileSync(
      path.join(baseFolder, "apktool.yml"),
      "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
    );

    await api(baseUrl, "POST", "/api/patches", {
      name: "p1",
      locator: { contains: PATCH_MARKER },
      baseline: patchModuleSource(""),
      modified: patchModuleSource(", added: 3"),
    });

    const outputPath = path.join(dir, "out", "assembled.bundle");
    const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
      baseFolderPath: baseFolder,
      patchNames: ["p1"],
      outputPath,
    });
    assert.equal(status, 201);
    assert.equal(data.baseVersion, "1.5.12");
    assert.deepEqual(data.appliedPatches, ["p1"]);

    const outSource = fs.readFileSync(outputPath, "utf8");
    assert.match(outSource, /added:\s*3/);

    // The base folder's own bundle must never be touched.
    const baseSource = fs.readFileSync(path.join(baseFolder, "assets", "index.android.bundle"), "utf8");
    assert.doesNotMatch(baseSource, /added:\s*3/);
  });
});

test("POST /api/assemble rejects an unknown patch name with no output written", async () => {
  await withPatchSession(async ({ baseUrl, bundlePath }) => {
    const dir = path.dirname(bundlePath);
    const baseFolder = path.join(dir, "base-folder-2");
    fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
    fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
    fs.writeFileSync(
      path.join(baseFolder, "apktool.yml"),
      "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
    );

    const outputPath = path.join(dir, "out2", "assembled.bundle");
    const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
      baseFolderPath: baseFolder,
      patchNames: ["nope"],
      outputPath,
    });
    assert.equal(status, 400);
    assert.match(data.error, /no such patch/);
    assert.equal(fs.existsSync(outputPath), false);
  });
});

// --- Upload (task 3, D-C4) ----------------------------------------------

test("POST /api/sessions/upload opens a session from raw bytes, no server-side path required", async () => {
  await withServer(async ({ baseUrl, bundlePath }) => {
    const bytes = fs.readFileSync(bundlePath);
    const res = await fetch(`${baseUrl}/api/sessions/upload`, {
      method: "POST",
      headers: { "X-Filename": "my-weird name!.bundle" },
      body: bytes,
    });
    assert.equal(res.status, 201);
    const session = await res.json();
    assert.ok(session.id);
    assert.equal(session.moduleCount > 0, true);

    // The uploaded session is indistinguishable from a path-opened one —
    // same session list, same summary shape.
    const list = await api(baseUrl, "GET", "/api/sessions");
    assert.ok(list.data.some((s) => s.id === session.id));
  });
});

test("POST /api/sessions/upload rejects unparseable bytes with a clear error, no session created", async () => {
  await withServer(async ({ baseUrl }) => {
    const res = await fetch(`${baseUrl}/api/sessions/upload`, {
      method: "POST",
      headers: { "X-Filename": "not-a-bundle.js" },
      body: Buffer.from("this is not a metro bundle"),
    });
    assert.equal(res.status, 400);
    const body = await res.json();
    assert.match(body.error, /could not parse/);
  });
});

test("POST /api/sessions/upload reports a sensible displayName, not the internal temp filename", async () => {
  await withServer(async ({ baseUrl, bundlePath }) => {
    const bytes = fs.readFileSync(bundlePath);
    const res = await fetch(`${baseUrl}/api/sessions/upload`, {
      method: "POST",
      headers: { "X-Filename": "my cool bundle.bundle" },
      body: bytes,
    });
    const session = await res.json();
    assert.equal(session.displayName, "my_cool_bundle.bundle");
    // The actual resolved path is a short, random temp filename — not the
    // uploaded name re-embedded into a long, unreadable string.
    assert.doesNotMatch(session.bundlePath, /my_cool_bundle/);
  });
});

test("a path-opened session has no displayName (falls back to the path's own basename client-side)", async () => {
  await withServer(async ({ baseUrl, bundlePath }) => {
    const session = await openSession(baseUrl, bundlePath);
    assert.equal(session.displayName, null);
  });
});

// --- Patches directory diagnostic -----------------------------------------

test("GET /api/patches-dir reports the resolved absolute patches directory", async () => {
  await withServer(async ({ baseUrl }) => {
    const { data, status } = await api(baseUrl, "GET", "/api/patches-dir");
    assert.equal(status, 200);
    assert.ok(path.isAbsolute(data.patchesDir));
  }, { patchesDir: "patches" });
});

test("GET /api/companions lists companion scripts from <patchesDir>/js, excluding replace-patch pairs", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir }) => {
    const companionsDir = path.join(patchesDir, "js");
    fs.mkdirSync(companionsDir, { recursive: true });
    fs.writeFileSync(path.join(companionsDir, "boot-ok-companion.js"), "// companion\n");
    fs.writeFileSync(path.join(companionsDir, "2176-x.baseline.js"), "// not a companion\n");
    fs.writeFileSync(path.join(companionsDir, "2176-x.edited.js"), "// not a companion\n");

    const { status, data } = await api(baseUrl, "GET", "/api/companions");
    assert.equal(status, 200);
    assert.deepEqual(data.companions.map((c) => c.name), ["boot-ok-companion"]);
    assert.ok(path.isAbsolute(data.companionsDir));
  });
});

test("GET /api/companions/:name/source returns the companion's raw source, unsubstituted placeholders and all", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir }) => {
    const companionsDir = path.join(patchesDir, "js");
    fs.mkdirSync(companionsDir, { recursive: true });
    fs.writeFileSync(
      path.join(companionsDir, "boot-ok-companion.js"),
      "globalThis.__BUILD_ID__ = '__MJOLNIR_BUILD_ID__';\n"
    );

    const { status, data } = await api(baseUrl, "GET", "/api/companions/boot-ok-companion/source");
    assert.equal(status, 200);
    assert.equal(data.name, "boot-ok-companion");
    assert.match(data.source, /__MJOLNIR_BUILD_ID__/);
  });
});

test("GET /api/companions/:name/source 400s with a clear error for an unknown name", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir }) => {
    fs.mkdirSync(path.join(patchesDir, "js"), { recursive: true });
    const { data } = await api(baseUrl, "GET", "/api/companions/nope/source");
    assert.match(data.error, /no such companion/);
  });
});

test("POST /api/assemble applies multiple companions in order", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir, bundlePath }) => {
    const dir = path.dirname(bundlePath);
    const baseFolder = path.join(dir, "base-folder-3");
    fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
    fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
    fs.writeFileSync(
      path.join(baseFolder, "apktool.yml"),
      "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
    );

    const companion1 = path.join(dir, "companion1.js");
    const companion2 = path.join(dir, "companion2.js");
    fs.writeFileSync(companion1, "globalThis.__C1__ = 1;\n");
    fs.writeFileSync(companion2, "globalThis.__C2__ = 2;\n");

    const outputPath = path.join(dir, "out3", "assembled.bundle");
    const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
      baseFolderPath: baseFolder,
      patchNames: [],
      outputPath,
      companionFiles: [companion1, companion2],
    });
    assert.equal(status, 201);
    assert.deepEqual(data.appliedCompanions, ["companion1", "companion2"]);

    const outSource = fs.readFileSync(outputPath, "utf8");
    assert.match(outSource, /__C1__ = 1/);
    assert.match(outSource, /__C2__ = 2/);
  });
});

test("POST /api/assemble defaults syncBaseUrl/syncToken from TUN_PUBLIC_BASE/OPERATOR_AUTH_TOKEN when the request omits them", async () => {
  const prevBase = process.env.TUN_PUBLIC_BASE;
  const prevToken = process.env.OPERATOR_AUTH_TOKEN;
  process.env.TUN_PUBLIC_BASE = "https://example.test";
  process.env.OPERATOR_AUTH_TOKEN = "s3cret-op-token";
  try {
    await withPatchSession(async ({ baseUrl, bundlePath }) => {
      const dir = path.dirname(bundlePath);
      const baseFolder = path.join(dir, "base-folder-sync");
      fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
      fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
      fs.writeFileSync(
        path.join(baseFolder, "apktool.yml"),
        "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
      );

      const companion = path.join(dir, "sync-companion.js");
      fs.writeFileSync(
        companion,
        "globalThis.__SYNC_URL__ = '__MJOLNIR_SYNC_BASE_URL__'; globalThis.__SYNC_TOKEN__ = '__MJOLNIR_SYNC_TOKEN__';\n"
      );

      const outputPath = path.join(dir, "out-sync", "assembled.bundle");
      const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
        baseFolderPath: baseFolder,
        patchNames: [],
        outputPath,
        companionFiles: [companion],
        // syncBaseUrl/syncToken deliberately omitted — must fall back to env
      });
      assert.equal(status, 201);
      assert.deepEqual(data.appliedCompanions, ["sync-companion"]);

      const outSource = fs.readFileSync(outputPath, "utf8");
      assert.match(outSource, /__SYNC_URL__ = 'https:\/\/example\.test\/mjolnir\/userdata'/);
      assert.match(outSource, /__SYNC_TOKEN__ = 's3cret-op-token'/);
    });
  } finally {
    if (prevBase === undefined) delete process.env.TUN_PUBLIC_BASE;
    else process.env.TUN_PUBLIC_BASE = prevBase;
    if (prevToken === undefined) delete process.env.OPERATOR_AUTH_TOKEN;
    else process.env.OPERATOR_AUTH_TOKEN = prevToken;
  }
});

test("POST /api/assemble prefers an explicit syncBaseUrl/syncToken over the env default", async () => {
  const prevBase = process.env.TUN_PUBLIC_BASE;
  process.env.TUN_PUBLIC_BASE = "https://should-not-be-used.test";
  try {
    await withPatchSession(async ({ baseUrl, bundlePath }) => {
      const dir = path.dirname(bundlePath);
      const baseFolder = path.join(dir, "base-folder-sync-override");
      fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
      fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
      fs.writeFileSync(
        path.join(baseFolder, "apktool.yml"),
        "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
      );

      const companion = path.join(dir, "sync-companion-2.js");
      fs.writeFileSync(companion, "globalThis.__SYNC_URL__ = '__MJOLNIR_SYNC_BASE_URL__';\n");

      const outputPath = path.join(dir, "out-sync-override", "assembled.bundle");
      const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
        baseFolderPath: baseFolder,
        patchNames: [],
        outputPath,
        companionFiles: [companion],
        placeholders: { SYNC_BASE_URL: "https://explicit.test/mjolnir/userdata" },
      });
      assert.equal(status, 201);
      assert.deepEqual(data.appliedCompanions, ["sync-companion-2"]);

      const outSource = fs.readFileSync(outputPath, "utf8");
      assert.match(outSource, /__SYNC_URL__ = 'https:\/\/explicit\.test\/mjolnir\/userdata'/);
    });
  } finally {
    if (prevBase === undefined) delete process.env.TUN_PUBLIC_BASE;
    else process.env.TUN_PUBLIC_BASE = prevBase;
  }
});

test("POST /api/assemble defaults audioBaseUrl from TUN_PUBLIC_BASE when the request omits it (D120)", async () => {
  const prevBase = process.env.TUN_PUBLIC_BASE;
  process.env.TUN_PUBLIC_BASE = "https://example.test";
  try {
    await withPatchSession(async ({ baseUrl, bundlePath }) => {
      const dir = path.dirname(bundlePath);
      const baseFolder = path.join(dir, "base-folder-audio");
      fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
      fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
      fs.writeFileSync(
        path.join(baseFolder, "apktool.yml"),
        "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
      );

      const companion = path.join(dir, "audio-companion.js");
      fs.writeFileSync(companion, "globalThis.__AUDIO_URL__ = '__MJOLNIR_AUDIO_BASE_URL__';\n");

      const outputPath = path.join(dir, "out-audio", "assembled.bundle");
      const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
        baseFolderPath: baseFolder,
        patchNames: [],
        outputPath,
        companionFiles: [companion],
        // audioBaseUrl deliberately omitted — must fall back to env
      });
      assert.equal(status, 201);
      assert.deepEqual(data.appliedCompanions, ["audio-companion"]);

      // audio-cache-prefetch: defaults to the bare public base, not a
      // `/audio-by-card`-suffixed one — the device builds its own
      // `/audio-manifest/...`/`/blob/...` paths off this now.
      const outSource = fs.readFileSync(outputPath, "utf8");
      assert.match(outSource, /__AUDIO_URL__ = 'https:\/\/example\.test'/);
    });
  } finally {
    if (prevBase === undefined) delete process.env.TUN_PUBLIC_BASE;
    else process.env.TUN_PUBLIC_BASE = prevBase;
  }
});

test("POST /api/assemble prefers an explicit audioBaseUrl over the env default (D120)", async () => {
  const prevBase = process.env.TUN_PUBLIC_BASE;
  process.env.TUN_PUBLIC_BASE = "https://should-not-be-used.test";
  try {
    await withPatchSession(async ({ baseUrl, bundlePath }) => {
      const dir = path.dirname(bundlePath);
      const baseFolder = path.join(dir, "base-folder-audio-override");
      fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
      fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
      fs.writeFileSync(
        path.join(baseFolder, "apktool.yml"),
        "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
      );

      const companion = path.join(dir, "audio-companion-2.js");
      fs.writeFileSync(companion, "globalThis.__AUDIO_URL__ = '__MJOLNIR_AUDIO_BASE_URL__';\n");

      const outputPath = path.join(dir, "out-audio-override", "assembled.bundle");
      const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
        baseFolderPath: baseFolder,
        patchNames: [],
        outputPath,
        companionFiles: [companion],
        placeholders: { AUDIO_BASE_URL: "https://explicit.test" },
      });
      assert.equal(status, 201);
      assert.deepEqual(data.appliedCompanions, ["audio-companion-2"]);

      const outSource = fs.readFileSync(outputPath, "utf8");
      assert.match(outSource, /__AUDIO_URL__ = 'https:\/\/explicit\.test'/);
    });
  } finally {
    if (prevBase === undefined) delete process.env.TUN_PUBLIC_BASE;
    else process.env.TUN_PUBLIC_BASE = prevBase;
  }
});

// D111: a third real patch kind — raw <id>-name.baseline.js/.edited.js
// pairs, module-id addressed, same reconciliation algorithm as JSON-store
// patches (not content-located). Lives alongside companions in the same
// <patchesDir>/js directory.
test("GET /api/patchback-pairs lists baseline/edited pairs, excluding standalone companion scripts", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir }) => {
    const pairsDir = path.join(patchesDir, "js");
    fs.mkdirSync(pairsDir, { recursive: true });
    fs.writeFileSync(path.join(pairsDir, "boot-ok-companion.js"), "// companion, not a pair\n");
    fs.writeFileSync(path.join(pairsDir, "42-bump-version.baseline.js"), "// baseline\n");
    fs.writeFileSync(path.join(pairsDir, "42-bump-version.edited.js"), "// edited\n");

    const { status, data } = await api(baseUrl, "GET", "/api/patchback-pairs");
    assert.equal(status, 200);
    assert.deepEqual(data.pairs.map((p) => p.name), ["42-bump-version"]);
    assert.equal(data.pairs[0].moduleId, 42);
    assert.ok(path.isAbsolute(data.patchbackDir));
  });
});

test("previewing a patch-back pair shows a diff, located by module id, and never writes to the bundle", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir, bundlePath, sessionId }) => {
    const pairsDir = path.join(patchesDir, "js");
    fs.mkdirSync(pairsDir, { recursive: true });
    fs.writeFileSync(path.join(pairsDir, "42-bump.baseline.js"), patchModuleSource(""));
    fs.writeFileSync(path.join(pairsDir, "42-bump.edited.js"), patchModuleSource(", added: 3"));

    const before = fs.readFileSync(bundlePath);
    const { status, data } = await api(baseUrl, "POST", "/api/patchback-pairs/42-bump/preview", { sessionId });
    assert.equal(status, 200);
    assert.equal(data.targetModuleId, 42);
    assert.ok(flattenDiffEntries(data.diff).some((e) => e.kind === "added"));
    const after = fs.readFileSync(bundlePath);
    assert.ok(before.equals(after));
  });
});

test("applying a patch-back pair locates the target by its filename's module id and writes the change", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir, bundlePath, sessionId }) => {
    const pairsDir = path.join(patchesDir, "js");
    fs.mkdirSync(pairsDir, { recursive: true });
    fs.writeFileSync(path.join(pairsDir, "42-bump.baseline.js"), patchModuleSource(""));
    fs.writeFileSync(path.join(pairsDir, "42-bump.edited.js"), patchModuleSource(", added: 3"));

    const { status, data } = await api(baseUrl, "POST", "/api/patchback-pairs/42-bump/apply", { sessionId });
    assert.equal(status, 200);
    assert.equal(data.targetModuleId, 42);

    const after = fs.readFileSync(bundlePath, "utf8");
    assert.match(after, /added:3/);
  });
});

test("POST /api/assemble applies a patch-back pair alongside JSON patches and companions", async () => {
  await withPatchSession(async ({ baseUrl, patchesDir, bundlePath }) => {
    const dir = path.dirname(bundlePath);
    const baseFolder = path.join(dir, "base-folder-4");
    fs.mkdirSync(path.join(baseFolder, "assets"), { recursive: true });
    fs.copyFileSync(bundlePath, path.join(baseFolder, "assets", "index.android.bundle"));
    fs.writeFileSync(
      path.join(baseFolder, "apktool.yml"),
      "version: 2.12.1\nversionInfo:\n  versionCode: 1\n  versionName: 1.5.12\n"
    );

    const pairsDir = path.join(patchesDir, "js");
    fs.mkdirSync(pairsDir, { recursive: true });
    fs.writeFileSync(path.join(pairsDir, "42-bump.baseline.js"), patchModuleSource(""));
    fs.writeFileSync(path.join(pairsDir, "42-bump.edited.js"), patchModuleSource(", added: 3"));

    const outputPath = path.join(dir, "out4", "assembled.bundle");
    const { status, data } = await api(baseUrl, "POST", "/api/assemble", {
      baseFolderPath: baseFolder,
      patchNames: [],
      patchbackPairNames: ["42-bump"],
      outputPath,
    });
    assert.equal(status, 201);
    assert.deepEqual(data.appliedPatchbackPairs, ["42-bump"]);

    const outSource = fs.readFileSync(outputPath, "utf8");
    assert.match(outSource, /added:3/);
  });
});
