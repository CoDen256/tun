import { query } from "./db.js";
import { userdataDoc, STATE_STAGE } from "./userdata.js";
import { cardIndex } from "./cardText.js";
import { stripHtml } from "../../src/deckData.js";
import { DECK_FAMILIES } from "../../builder/src/deckFamilies.js";

const DAY = 86400e3;

function trunc(s, n) {
  s = stripHtml(s || "");
  return s.length > n ? `${s.slice(0, n - 1)}…` : s;
}

// R2's observed interval bands, used by the heatmap (same edges as the
// mockup's reference implementation).
function bandOf(cf) {
  if (cf === 0) return 0;
  if (cf < 5) return 1;
  if (cf < 10) return 2;
  if (cf < 15) return 3;
  if (cf < 20) return 4;
  if (cf < 25) return 5;
  if (cf < 30) return 6;
  return 7;
}

// 4am rollover, per findings.md §6's own dueness test.
function dayKey(ms) {
  return Math.floor((ms - 4 * 36e5) / DAY);
}

// D-IN4: codes inside a hub deck family's reserved range (lexic C30-C39,
// practice C20-C29) are governed by the `decks` table. Present in the
// bundle but absent from `decks` means the bundle is stale for that code
// (predates a consolidation/rollover) — it must not be reported as a real
// deck at all, stock or otherwise.
const RESERVED_CODES = new Set(Object.values(DECK_FAMILIES).flatMap((f) => f.codes));

async function deckCatalogue(index) {
  const { rows: dbRows } = await query(
    "SELECT code, title, description, max_interval, auto_tick_streak, auto_hammer_count, enabled FROM decks ORDER BY code"
  );
  const managedCodes = new Set(dbRows.map((r) => r.code));

  const { rows: shipped } = await query(
    `SELECT cs.deck_code AS code, count(*) AS n
     FROM occurrence_shipments os JOIN card_slots cs ON cs.id = os.card_id
     GROUP BY cs.deck_code`
  );
  const { rows: pending } = await query(
    "SELECT deck_code AS code, count(*) AS n FROM pending_occurrences GROUP BY deck_code"
  );
  const { rows: staged } = await query(
    "SELECT deck_code AS code, count(*) AS n FROM staged_occurrences GROUP BY deck_code"
  );
  const { rows: slots } = await query("SELECT deck_code AS code, count(*) AS n FROM card_slots GROUP BY deck_code");
  const shippedByCode = new Map(shipped.map((r) => [r.code, Number(r.n)]));
  const pendingByCode = new Map(pending.map((r) => [r.code, Number(r.n)]));
  const stagedByCode = new Map(staged.map((r) => [r.code, Number(r.n)]));
  const slotsByCode = new Map(slots.map((r) => [r.code, Number(r.n)]));

  const decks = [];
  for (const d of index.deckByCode.values()) {
    if (RESERVED_CODES.has(d.Name) && !managedCodes.has(d.Name)) continue; // D-IN4: stale bundle artifact
    if (managedCodes.has(d.Name)) continue; // hub-managed, handled below from `decks`
    decks.push({
      bundleId: d.ID,
      code: d.Name,
      title: d.Title,
      managed: false,
      maxInterval: d.MaxInterval ?? null,
      autoTickStreak: d.AutoTickStreak ?? null,
      autoHammerCount: d.AutoHammerCount ?? null,
      occurrences: (d.Cards || []).length,
      pending: 0,
      distinctCards: null,
    });
  }
  for (const r of dbRows) {
    const bundleDeck = index.deckByCode.get(r.code);
    decks.push({
      bundleId: bundleDeck?.ID ?? null,
      code: r.code,
      title: r.title,
      managed: true,
      maxInterval: r.max_interval,
      autoTickStreak: r.auto_tick_streak,
      autoHammerCount: r.auto_hammer_count,
      occurrences: shippedByCode.get(r.code) || 0,
      pending: (pendingByCode.get(r.code) || 0) + (stagedByCode.get(r.code) || 0),
      distinctCards: slotsByCode.get(r.code) || 0,
    });
  }
  return decks;
}

async function resolveContent(ids) {
  if (ids.length === 0) return new Map();
  const { rows } = await query("SELECT card_id, n, e FROM card_content WHERE card_id = ANY($1)", [ids]);
  return new Map(rows.map((r) => [r.card_id, { n: r.n, e: r.e }]));
}

// D-IN3: the full payload for one account — occurrence rows (trimmed) plus
// every precomputed series/aggregate the page's panels need. Mirrors
// `openspec/changes/device-insights-page/mockup-dataset.js` exactly; see
// that file for the reference definition of each aggregate.
export async function buildInsights(uid, { dataDir, now = Date.now() } = {}) {
  const doc = await userdataDoc(uid);
  if (!doc) return null;

  const totalCards = doc.totalCards || [];
  const index = cardIndex(dataDir);
  const decks = await deckCatalogue(index);
  const byCode = new Map(decks.map((d) => [d.code, d]));

  const ids = [...new Set(totalCards.map((c) => c.ID))];
  const dbContent = await resolveContent(ids);

  const rows = totalCards.map((c, i) => {
    const dk = byCode.get(c.DECK_ID) || {};
    const db = dbContent.get(c.ID);
    const bundleCard = index.cardById.get(c.ID);
    const n = db?.n ?? bundleCard?.N ?? null;
    const e = db?.e ?? bundleCard?.E ?? null;
    const dueT = c.Time;
    const lrT = c.Time - c.CF * DAY;
    return {
      i,
      id: c.ID,
      s: c.language,
      a: c.A,
      dk: c.DECK_ID,
      st: c.Stage,
      cf: c.CF,
      mi: dk.maxInterval ?? null,
      dueT,
      lrT,
      due: Math.round(((dueT - now) / DAY) * 10) / 10,
      lr: Math.round(((now - lrT) / DAY) * 10) / 10,
      hr: new Date(dueT).getUTCHours(),
      r: c.numberOfReschedulings ?? 0,
      aph: c.AutoParkHit,
      atg: c.AutoTagHit,
      tag: c.Tag ? 1 : 0,
      pan: Object.prototype.hasOwnProperty.call(c, "Panic") ? 1 : 0,
      n: trunc(n, 110),
      e: trunc(e, 80),
    };
  });

  // ---- deck summaries ----
  const deckSum = decks.map((d) => {
    const st = (doc.decksStatus || []).find((x) => x.ID === d.bundleId);
    const mine = rows.filter((r) => r.dk === d.code);
    const act = mine.filter((r) => r.st === STATE_STAGE.inRotation);
    const drawn = st ? Math.min(st.PullCounter * 5, d.occurrences) : 0;
    return {
      code: d.code,
      title: d.title,
      fam: d.code[0],
      managed: d.managed,
      mi: d.maxInterval,
      ats: d.autoTickStreak,
      ahc: d.autoHammerCount,
      pull: st ? st.PullCounter : 0,
      drawn,
      avail: d.occurrences,
      pending: d.pending || 0,
      held: mine.length,
      active: act.length,
      t150: mine.filter((r) => r.st === STATE_STAGE.parkedEarly).length,
      t100: mine.filter((r) => r.st === STATE_STAGE.parkedDormant).length,
      t200: mine.filter((r) => r.st === STATE_STAGE.retiredCeiling).length,
      meanCf: act.length ? Number((act.reduce((a, r) => a + r.cf, 0) / act.length).toFixed(1)) : 0,
      atCap: act.filter((r) => r.cf === r.mi).length,
      load: Number(act.reduce((a, r) => a + 1 / Math.max(1, r.cf), 0).toFixed(2)),
      leech: mine.filter((r) => r.r >= 12).length,
      tag: mine.filter((r) => r.tag).length,
      lastSeen: mine.length ? Math.max(...mine.map((r) => r.lrT)) : null,
      firstSeen: mine.length ? Math.min(...mine.map((r) => r.lrT)) : null,
      bands: [0, 0, 0, 0, 0, 0, 0, 0].map((_, bi) => act.filter((r) => bandOf(r.cf) === bi).length),
    };
  });

  // ---- daily series: past (observed last-seen) + future (scheduled) ----
  // D-IN requirement "forecast excludes retired occurrences": the future
  // side only ever counts in-rotation rows, never an archived occurrence's
  // stale stored Time.
  const FAM = [...new Set(decks.map((d) => d.code[0]))].sort();
  let series = { t: [], pastFam: FAM.map(() => []), futFam: FAM.map(() => []), pastTot: [], futTot: [], parkTot: [] };
  let cal = {};
  let weekday = new Array(7).fill(0);
  let hours = new Array(24).fill(0);
  let resched = [];
  let ladder = [];
  let calKeys = [];
  let bestStreak = 0;
  let spanDays = 0;

  if (rows.length > 0) {
    const todayK = dayKey(now);
    const minK = Math.min(...rows.map((r) => dayKey(r.lrT)));
    const maxK = Math.max(...rows.map((r) => dayKey(r.dueT)));
    const pastIdx = {};
    const futIdx = {};
    for (const r of rows) {
      const pk = dayKey(r.lrT);
      const fk = dayKey(r.dueT);
      (pastIdx[pk] = pastIdx[pk] || []).push(r);
      (futIdx[fk] = futIdx[fk] || []).push(r);
    }
    for (let k = minK; k <= maxK; k++) {
      series.t.push((k * DAY + 4 * 36e5) / 1000); // uPlot wants seconds
      const p = pastIdx[k] || [];
      const f = futIdx[k] || [];
      const isPast = k <= todayK;
      FAM.forEach((fam, fi) => {
        series.pastFam[fi].push(isPast ? p.filter((r) => r.dk[0] === fam).length : null);
        series.futFam[fi].push(!isPast ? f.filter((r) => r.dk[0] === fam && r.st === STATE_STAGE.inRotation).length : null);
      });
      series.pastTot.push(isPast ? p.length : null);
      series.futTot.push(!isPast ? f.filter((r) => r.st === STATE_STAGE.inRotation).length : null);
      series.parkTot.push(!isPast ? f.filter((r) => r.st !== STATE_STAGE.inRotation).length : null);
    }

    for (const r of rows) {
      const k = new Date(dayKey(r.lrT) * DAY + 4 * 36e5).toISOString().slice(0, 10);
      cal[k] = (cal[k] || 0) + 1;
    }

    for (const r of rows) {
      const d = new Date(r.lrT - 4 * 36e5);
      weekday[(d.getUTCDay() + 6) % 7]++;
      hours[new Date(r.dueT).getUTCHours()]++;
    }

    const maxResched = Math.max(24, ...rows.map((r) => r.r));
    for (let n = 0; n <= maxResched; n++) resched.push(rows.filter((r) => r.r === n).length);

    for (let cf = 0; cf <= 30; cf++) {
      const a = rows.filter((r) => r.st === STATE_STAGE.inRotation && r.cf === cf);
      ladder.push({ cf, n: a.length, capped: a.filter((r) => r.cf === r.mi).length });
    }

    calKeys = Object.keys(cal).sort();
    let cur = 0;
    let prev = null;
    for (const k of calKeys) {
      const t = Date.parse(`${k}T00:00:00Z`);
      cur = prev !== null && t - prev === DAY ? cur + 1 : 1;
      prev = t;
      if (cur > bestStreak) bestStreak = cur;
    }
    spanDays = calKeys.length ? Math.round((Date.parse(calKeys[calKeys.length - 1]) - Date.parse(calKeys[0])) / DAY) + 1 : 0;
  }

  // ---- asymmetry: the same card's N/E sides scheduled independently ----
  const perCard = new Map();
  for (const r of rows) {
    if (!perCard.has(r.id)) perCard.set(r.id, []);
    perCard.get(r.id).push(r);
  }
  const asym = { both: 0, bothActive: 0, bothParked: 0, nActive_eParked: 0, eActive_nParked: 0, list: [] };
  for (const group of perCard.values()) {
    const n = group.find((r) => r.s === "N");
    const e = group.find((r) => r.s === "E");
    if (!n || !e) continue;
    asym.both++;
    const na = n.st === STATE_STAGE.inRotation;
    const ea = e.st === STATE_STAGE.inRotation;
    if (na && ea) asym.bothActive++;
    else if (!na && !ea) asym.bothParked++;
    else if (na && !ea) {
      asym.nActive_eParked++;
      asym.list.push({ id: n.id, dir: "N", dk: n.dk, cfN: n.cf, cfE: e.cf, n: n.n, e: n.e });
    } else {
      asym.eActive_nParked++;
      asym.list.push({ id: e.id, dir: "E", dk: e.dk, cfN: n.cf, cfE: e.cf, n: e.n, e: e.e });
    }
  }
  asym.list.sort((a, b) => b.cfN + b.cfE - (a.cfN + a.cfE));
  asym.list = asym.list.slice(0, 60);

  // ---- R10: the same {ID, language} pair living in more than one deck ----
  const byIdLang = new Map();
  for (const r of rows) {
    const key = `${r.id}|${r.s}`;
    if (!byIdLang.has(key)) byIdLang.set(key, []);
    byIdLang.get(key).push(r.dk);
  }
  let dupOccurrences = 0;
  const dupPairCounts = new Map();
  for (const dks of byIdLang.values()) {
    const uniq = [...new Set(dks)];
    if (uniq.length < 2) continue;
    dupOccurrences += dks.length - 1;
    for (let a = 0; a < uniq.length; a++) {
      for (let b = a + 1; b < uniq.length; b++) {
        const key = [uniq[a], uniq[b]].sort().join("+");
        dupPairCounts.set(key, (dupPairCounts.get(key) || 0) + 1);
      }
    }
  }
  const dupPairs = Object.fromEntries(dupPairCounts);

  const active = rows.filter((r) => r.st === STATE_STAGE.inRotation);
  const steady = Number(active.reduce((a, r) => a + 1 / Math.max(1, r.cf), 0).toFixed(1));
  const steadyLifted = Number(
    active.reduce((a, r) => a + 1 / Math.max(1, r.cf === r.mi ? Math.round(r.cf * 1.5) : r.cf), 0).toFixed(1)
  );

  const stockTotal = decks.filter((d) => !d.managed).reduce((a, d) => a + d.occurrences, 0);
  const hubTotal = decks.filter((d) => d.managed).reduce((a, d) => a + d.occurrences, 0);
  const hubPending = decks.filter((d) => d.managed).reduce((a, d) => a + (d.pending || 0), 0);

  const meta = {
    uid,
    now: new Date(now).toISOString(),
    occurrences: rows.length,
    distinctCards: perCard.size,
    sessions: doc.completedSessions,
    dailyCards: doc.dailyCards,
    archived: rows.length - active.length,
    activeN: active.length,
    t200: rows.filter((r) => r.st === STATE_STAGE.retiredCeiling).length,
    t150: rows.filter((r) => r.st === STATE_STAGE.parkedEarly).length,
    t100: rows.filter((r) => r.st === STATE_STAGE.parkedDormant).length,
    historyRows: (await query("SELECT count(*) FROM userdata_history WHERE device_id = $1", [uid])).rows[0].count,
    drawn: deckSum.reduce((a, d) => a + d.drawn, 0),
    stockTotal,
    hubTotal,
    hubPending,
    corpusTotal: stockTotal + hubTotal,
    decksExhausted: deckSum.filter((d) => d.drawn > 0 && d.drawn >= d.avail).length,
    decksPulled: deckSum.filter((d) => d.drawn > 0).length,
    deckCount: deckSum.length,
    steady,
    steadyLifted,
    atCap: active.filter((r) => r.cf === r.mi).length,
    dueToday: active.filter((r) => r.due < 1).length,
    overdue: active.filter((r) => r.due < 0).length,
    parkedPast: rows.filter((r) => r.st !== STATE_STAGE.inRotation && r.due < 0).length,
    parkedFuture: rows.filter((r) => r.st !== STATE_STAGE.inRotation && r.due >= 0).length,
    studyDays: calKeys.length,
    spanDays,
    bestStreak,
    firstStudy: calKeys[0] || null,
    lastStudy: calKeys[calKeys.length - 1] || null,
    tagged: rows.filter((r) => r.tag).length,
    atg1: rows.filter((r) => r.atg >= 1).length,
    panic: rows.filter((r) => r.pan).length,
    leeches: rows.filter((r) => r.r >= 12).length,
    dupOccurrences,
    audio: {
      N: rows.filter((r) => r.a === "N").length,
      E: rows.filter((r) => r.a === "E").length,
      X: rows.filter((r) => r.a === "X").length,
    },
    todayK: rows.length ? dayKey(now) : null,
    cardIndexReason: index.reason,
  };

  return { meta, rows, deckSum, series, cal, weekday, hours, resched, ladder, asym, reminders: doc.reminderSetting, dupPairs };
}
