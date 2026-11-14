import { query, getPool } from "./db.js";
import { stripHtml } from "../../src/deckData.js";

// D-S2: the shim's `.get()` must never report a document as not existing —
// every write method in mod 2080 is unconditionally gated on `doc.exists`
// with no `else`, so a false negative here silently and permanently blocks
// every future sync. `getOrCreate` is the one place that guarantee lives:
// auto-creates a row with factory defaults on first touch and always
// returns a document, never "missing".
//
// Copied literally from mod 2080's own `S()` (base/smali.mjolnir.merged/
// assets/index.android.bundle.exploded/2080.js) — not paraphrased, per
// task 1.3. `accountCreationDate`/`lastCompletedSession` are ISO strings
// here (JSON has no Date type); the shim's `data()` wraps them back into
// `.toDate()`-bearing objects client-side (D-S3).
export function factoryDefaults() {
  const now = new Date().toISOString();
  return {
    completedSessions: 0,
    totalCards: [],
    gameDecks: [],
    lastDeckPulled: -1,
    restDays: [],
    dailyCards: 15,
    reminderSetting: [
      { days: ["Mo", "Tu", "We", "Th", "Fr"], hour: "08", minute: "00" },
      { days: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"], hour: "16", minute: "30" },
    ],
    decksStatus: [],
    selectedApproach: [],
    hasSeenMjolnirWay: { firstPage: false, lastPage: false },
    surveyAnswers: [],
    accountCreationDate: now,
    archivedCards: 0,
    inProgressCards: 0,
    hasSeenPaywall: false,
    firstSessionsCompleted: [],
    lastCompletedSession: now,
    acquisitionSource: null,
    marketingSurveySeen: false,
  };
}

// Returns `{ doc, created }` — `created` is true only the very first time a
// given device id is seen, for callers (the GET route) that want to report
// it; the document itself is identical either way.
export async function getOrCreate(deviceId) {
  const { rows } = await query("SELECT doc FROM userdata WHERE device_id = $1", [deviceId]);
  if (rows.length > 0) return { doc: rows[0].doc, created: false };

  const doc = factoryDefaults();
  await query(
    `INSERT INTO userdata (device_id, doc) VALUES ($1, $2)
     ON CONFLICT (device_id) DO NOTHING`,
    [deviceId, doc]
  );
  // A concurrent first-touch could have beaten this insert (ON CONFLICT DO
  // NOTHING) — re-read rather than assume this call's own doc won, so two
  // racing requests always agree on the same stored document.
  const { rows: after } = await query("SELECT doc FROM userdata WHERE device_id = $1", [deviceId]);
  return { doc: after[0].doc, created: true };
}

async function writeHistory(client, deviceId, doc) {
  await client.query("INSERT INTO userdata_history (device_id, doc) VALUES ($1, $2)", [deviceId, doc]);
}

// `.ref.update(patch)` — field-merge, not replace (D-S3). Auto-creates via
// `getOrCreate` first, matching every mod 2080 write method's own
// `.get()`-then-write ordering (D-S2's "no ordering gap to protect
// against" reasoning).
export async function merge(deviceId, patch) {
  const client = await getPool().connect();
  try {
    await client.query("BEGIN");
    const { rows } = await client.query("SELECT doc FROM userdata WHERE device_id = $1 FOR UPDATE", [deviceId]);
    const current = rows.length > 0 ? rows[0].doc : factoryDefaults();
    const next = { ...current, ...patch };
    await client.query(
      `INSERT INTO userdata (device_id, doc, updated_at) VALUES ($1, $2, now())
       ON CONFLICT (device_id) DO UPDATE SET doc = $2, updated_at = now()`,
      [deviceId, next]
    );
    await writeHistory(client, deviceId, next);
    await client.query("COMMIT");
    return next;
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

// `.ref.set(doc)` — full create/overwrite (D-S3). Rarely reached now that
// GET auto-creates, but `initUserData()` can still take this path.
export async function replace(deviceId, doc) {
  const client = await getPool().connect();
  try {
    await client.query("BEGIN");
    await client.query(
      `INSERT INTO userdata (device_id, doc, updated_at) VALUES ($1, $2, now())
       ON CONFLICT (device_id) DO UPDATE SET doc = $2, updated_at = now()`,
      [deviceId, doc]
    );
    await writeHistory(client, deviceId, doc);
    await client.query("COMMIT");
    return doc;
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

// `.ref.delete()` — still writes a final `userdata_history` row (D-S5:
// "last-write-wins storage is not a backup" extends to deletion too).
export async function remove(deviceId) {
  const client = await getPool().connect();
  try {
    await client.query("BEGIN");
    await client.query("DELETE FROM userdata WHERE device_id = $1", [deviceId]);
    await writeHistory(client, deviceId, null);
    await client.query("COMMIT");
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  } finally {
    client.release();
  }
}

// ---- userdata-console: read-only queries for the Device sync page ----

// Every distinct account (uid) ever seen — `userdata.device_id` is the uid
// column despite its name (D-S1; never renamed, D-C1's smaller-diff
// reasoning extends to this pre-existing column too).
export async function listAccounts() {
  const { rows } = await query("SELECT device_id AS uid FROM userdata ORDER BY device_id");
  return rows.map((r) => r.uid);
}

// Every distinct `D` (deck title) value appearing in this account's own
// `totalCards` — the toolbar's deck filter is populated from this, not
// from the `decks` table (D-UP3). Same lateral-join shape as
// `perCardProgress`, with no filters applied.
export async function distinctDeckTitles(uid) {
  const { rows } = await query(
    `SELECT DISTINCT t.card->>'D' AS deck
     FROM userdata u, jsonb_array_elements(u.doc->'totalCards') WITH ORDINALITY AS t(card, idx)
     WHERE u.device_id = $1 AND t.card->>'D' IS NOT NULL
     ORDER BY deck`,
    [uid]
  );
  return rows.map((r) => r.deck);
}

// D-UP5: `Stage` is a four-valued retirement tier (findings.md R3), not a
// climbing ladder — these are the only two places that mapping is spelled
// out, shared between the SQL filter below and server.js's status pill so
// neither can drift from the other.
export const STATE_STAGE = { inRotation: 3, retiredCeiling: 200, parkedEarly: 150, parkedDormant: 100 };
export const STATE_LABELS = {
  inRotation: "in rotation",
  retiredCeiling: "retired at ceiling",
  parkedEarly: "parked early",
  parkedDormant: "parked early, dormant",
};
const STAGE_TO_STATE = new Map(Object.entries(STATE_STAGE).map(([state, stage]) => [stage, state]));
export function stateForStage(stage) {
  return STAGE_TO_STATE.get(stage) || null;
}

// D-UP1: columns a sort/filter is allowed to touch — a closed enumeration
// of SQL expressions over the jsonb element, never a caller-supplied
// column name. Deliberately excludes bundle-derived columns (content, the
// deck's display title, the status pill) since those aren't stored scalars
// the lateral join can sort on.
const SORT_COLUMNS = {
  id: "t.card->>'ID'",
  side: "t.card->>'language'",
  deck: "t.card->>'D'",
  stage: "(t.card->>'Stage')::numeric",
  interval: "(t.card->>'CF')::numeric",
  nextDue: "(t.card->>'Time')::numeric",
  reschedules: "(t.card->>'numberOfReschedulings')::numeric",
};

export const PAGE_SIZES = [25, 50, 100, 200];

// Finds every card id in `index.cardById` whose bundle-derived N content
// (HTML stripped) contains `needle` — the bundle-side half of the `q`
// filter's two-pronged search (D-UP6); the id-substring half is a plain
// SQL predicate applied alongside this in `perCardProgress`.
function matchCardIdsByContent(index, needle) {
  if (!index) return [];
  const lower = needle.toLowerCase();
  const ids = [];
  for (const card of index.cardById.values()) {
    if (stripHtml(card.N || "").toLowerCase().includes(lower)) ids.push(card.ID);
  }
  return ids;
}

// D-UP1: pages, sorts and filters `totalCards` in SQL via
// `jsonb_array_elements(...) WITH ORDINALITY`, rather than reading the
// whole array into Node — the same query shape (minus LIMIT) is also the
// COUNT(*), so paging and the reported total can never drift from one
// another. `opts.cardIndex` (from `cardText.js`'s `cardIndex()`) supplies
// the published bundle's card/deck text for stock cards and for the
// bundle-side half of `q`; omitting it degrades Content/Deck gracefully,
// it never throws.
export async function perCardProgress(uid, opts = {}) {
  const {
    page = 1,
    size = 50,
    sort = "",
    dir = "asc",
    deck = "",
    side = "",
    state = "",
    flag = "",
    q = "",
    cardIndex = null,
  } = opts;

  const conditions = ["u.device_id = $1"];
  const params = [uid];

  if (deck) {
    params.push(deck);
    conditions.push(`t.card->>'D' = $${params.length}`);
  }
  // D-UP6: an unrecognised filter value is ignored, never an error.
  if (["N", "E", "A"].includes(side)) {
    params.push(side);
    conditions.push(`t.card->>'language' = $${params.length}`);
  }
  if (Object.prototype.hasOwnProperty.call(STATE_STAGE, state)) {
    params.push(STATE_STAGE[state]);
    conditions.push(`(t.card->>'Stage')::numeric = $${params.length}`);
  }
  if (flag === "tag") {
    conditions.push(`(t.card->>'Tag')::boolean = true`);
  } else if (flag === "panic") {
    // R6: `Panic`'s presence, not its value (it's always 0), is the signal.
    conditions.push(`t.card ? 'Panic'`);
  }
  if (q && q.trim()) {
    const needle = q.trim();
    const contentMatchedIds = matchCardIdsByContent(cardIndex, needle);
    params.push(`%${needle}%`);
    const idLikeParam = params.length;
    params.push(contentMatchedIds);
    const idsParam = params.length;
    conditions.push(`(t.card->>'ID' ILIKE $${idLikeParam} OR t.card->>'ID' = ANY($${idsParam}))`);
  }

  const whereSql = conditions.join(" AND ");

  // Default sort is the array's own ordinality — the device's own
  // presentation order — and every other sort appends it as a tiebreaker
  // so paging stays stable across a column with repeated values.
  const sortExpr = SORT_COLUMNS[sort] || null;
  const dirSql = dir === "desc" ? "DESC" : "ASC";
  const orderSql = sortExpr ? `${sortExpr} ${dirSql}, t.idx ASC` : `t.idx ASC`;

  // `PAGE_SIZES` is only the toolbar's own preset list (enforced by the
  // route, for a consistent <select>) — the query itself accepts any
  // reasonable size, just clamped to a sane range.
  const sizeNum = Math.min(500, Math.max(1, Math.trunc(Number(size)) || 50));
  const pageNum = Math.max(1, Math.trunc(Number(page)) || 1);
  const offset = (pageNum - 1) * sizeNum;

  const fromSql = `FROM userdata u, jsonb_array_elements(u.doc->'totalCards') WITH ORDINALITY AS t(card, idx) WHERE ${whereSql}`;

  const { rows: countRows } = await query(`SELECT count(*) ${fromSql}`, params);
  const total = Number(countRows[0].count);

  const { rows } = await query(
    `SELECT t.card ${fromSql} ORDER BY ${orderSql} LIMIT $${params.length + 1} OFFSET $${params.length + 2}`,
    [...params, sizeNum, offset]
  );
  const records = rows.map((r) => r.card);

  const idsOnPage = records.map((c) => c.ID);
  let dbContentById = new Map();
  if (idsOnPage.length > 0) {
    // D-UP2: `card_content` (hub-minted cards) wins over the bundle for any
    // id present in both — it may be newer than the last publish.
    const { rows: contentRows } = await query("SELECT card_id, n FROM card_content WHERE card_id = ANY($1)", [idsOnPage]);
    dbContentById = new Map(contentRows.map((r) => [r.card_id, r.n]));
  }

  const resultRows = records.map((c) => {
    const dbContent = dbContentById.get(c.ID);
    const bundleCard = cardIndex ? cardIndex.cardById.get(c.ID) : undefined;
    const content = dbContent ?? bundleCard?.N ?? null;
    const contentSource = dbContent != null ? "db" : bundleCard ? "bundle" : null;
    const deckTitleUpper = c.D ?? null;
    const deckTitle = (deckTitleUpper && cardIndex?.deckTitleByUpper.get(deckTitleUpper)) || deckTitleUpper;
    return {
      id: c.ID,
      content,
      contentSource,
      side: c.language, // the stored direction letter (N/E/A) — findings.md C1
      deckTitle,
      stage: c.Stage,
      state: stateForStage(c.Stage),
      interval: typeof c.CF === "number" ? c.CF : null, // R2: days, not a percentage
      nextDueAt: c.Time ? new Date(c.Time) : null, // R1: next-due, not last-touched
      reschedules: c.numberOfReschedulings ?? null,
      tag: !!c.Tag,
      panic: Object.prototype.hasOwnProperty.call(c, "Panic"),
      autoParkHit: c.AutoParkHit ?? null,
      type: c.Type,
    };
  });

  return { rows: resultRows, total };
}

// Reads the account's current document in full — only called on demand
// (D-UP4) by the `/mjolnir/device/doc` route, never inlined into the page.
export async function userdataDoc(uid) {
  const { rows } = await query("SELECT doc FROM userdata WHERE device_id = $1", [uid]);
  return rows.length ? rows[0].doc : null;
}

// Same, for one `userdata_history` row — `historyId` must belong to `uid`,
// matching the route's uid-restricted posture. Returns `undefined` (not
// `null`) when no such row exists, since a deletion's history row
// legitimately stores `doc: null` (D-S5) and the two must stay
// distinguishable to the caller.
export async function historyDoc(uid, historyId) {
  const { rows } = await query("SELECT doc FROM userdata_history WHERE id = $1 AND device_id = $2", [historyId, uid]);
  return rows.length ? rows[0].doc : undefined;
}

// Summarizes one `userdata_history` row against its predecessor — session-
// count delta, totalCards-length delta, or (when neither changed) which
// other top-level fields differ. There is no stored event-type/provenance
// tag (D-S5 only ever records the resulting document, not which mod 2080
// method produced it), so the title is inferred from what actually changed,
// not a literal replay of which screen caused it.
function summarizeDelta(doc, prevDoc) {
  if (doc === null) return { title: "Account deleted", detail: [] };
  const prev = prevDoc || {};
  const detail = [];

  const sessionsChanged = prev.completedSessions !== doc.completedSessions;
  const cardsDelta = (doc.totalCards?.length ?? 0) - (prev.totalCards?.length ?? 0);

  if (sessionsChanged) {
    detail.push({
      label: "completedSessions",
      text: `${prev.completedSessions ?? "—"} → ${doc.completedSessions}`,
      up: (doc.completedSessions ?? 0) > (prev.completedSessions ?? 0),
    });
  }
  if (cardsDelta !== 0) {
    detail.push({ label: "totalCards", text: `${cardsDelta > 0 ? "+" : ""}${cardsDelta}`, up: cardsDelta > 0 });
  }

  if (sessionsChanged && cardsDelta !== 0) return { title: "Session completed", detail };
  if (sessionsChanged) return { title: "Progress updated", detail };
  if (cardsDelta !== 0) return { title: "Cards updated", detail };

  const changedKeys = Object.keys(doc).filter((k) => JSON.stringify(doc[k]) !== JSON.stringify(prev[k]));
  if (changedKeys.length > 0) {
    return {
      title: "Settings updated",
      detail: changedKeys.slice(0, 4).map((k) => ({ label: k, text: "changed", up: null })),
    };
  }
  return { title: "Synced", detail: [] };
}

// `limit + 1` rows are fetched so the oldest row returned still has a real
// predecessor to diff against; that extra row is used only for the diff,
// never returned itself.
export async function historyDeltas(uid, { limit = 20 } = {}) {
  const { rows } = await query(
    "SELECT id, doc, at FROM userdata_history WHERE device_id = $1 ORDER BY at DESC LIMIT $2",
    [uid, limit + 1]
  );
  // D-UP4: the diff still needs each row's full doc, but the full doc
  // itself is never part of the returned object — the raw document is
  // fetched separately, on demand, via `historyDoc`.
  return rows.slice(0, limit).map((row, i) => ({
    id: row.id,
    at: row.at,
    ...summarizeDelta(row.doc, rows[i + 1]?.doc),
  }));
}
