const fs = require("fs");
const S = "/tmp/claude-1000/-home-coden-dev-mjolnir/df1a9f28-cfb9-4600-a833-955c3fe64ff1/scratchpad";
const doc = JSON.parse(fs.readFileSync(S + "/real.json", "utf8"));
const bundleDecks = JSON.parse(fs.readFileSync(S + "/decks_bundle.json", "utf8"));
const content = JSON.parse(fs.readFileSync(S + "/cards_bundle.json", "utf8"));
const tc = doc.totalCards;
const DAY = 86400e3;
const NOW = Date.parse("2026-11-07T19:00:00Z");
const trunc = (s, n) => { s = String(s || ""); return s.length > n ? s.slice(0, n - 1) + "…" : s; };

// ---- deck catalogue: stock from the bundle, hub-managed from the DB ----
// The exploded bundle on disk (2026-10-27) predates deck-consolidation, so its
// C21/C22/C26–C29 entries are gone and its C20 is the old substantiv deck.
// Hub-managed decks come from the DB instead: C30 Lexic, C20 Practice.
const STALE = new Set(["C20", "C21", "C22", "C26", "C27", "C28", "C29"]);
const dbDecks = fs.readFileSync(S + "/decks.tsv", "utf8").trim().split("\n").map((l) => l.split("\t"));
const slots = fs.readFileSync(S + "/card_slots.tsv", "utf8").trim().split("\n").map((l) => l.split("\t"));
const HUB_SHIPPED = { C30: 65, C20: 5 };      // occurrence_shipments
const HUB_PENDING = { C30: 11, C20: 1 };      // pending + staged, not yet published

const decks = [];
for (const d of bundleDecks) if (!STALE.has(d.code)) decks.push({ ...d, managed: false });
for (const r of dbDecks) {
  const code = r[0];
  decks.push({
    id: null, code, title: r[1], enabled: r[6] === "t", maxInterval: +r[3],
    autoTickStreak: +r[4], autoHammerCount: +r[5],
    occurrences: HUB_SHIPPED[code] || 0,
    distinctCards: slots.filter((x) => x[1] === code).length,
    pending: HUB_PENDING[code] || 0,
    description: r[7], managed: true,
  });
}
const byId = {}, byCode = {};
for (const d of decks) { if (d.id != null) byId[d.id] = d; byCode[d.code] = d; }

// ---- occurrence rows ----
const rows = tc.map((c, i) => {
  const dk = byCode[c.DECK_ID] || {};
  return {
    i, id: c.ID, s: c.language, a: c.A, dk: c.DECK_ID,
    st: c.Stage, cf: c.CF, mi: dk.maxInterval ?? null,
    dueT: c.Time,                                   // absolute ms — next due
    lrT: c.Time - c.CF * DAY,                       // absolute ms — last review
    due: Math.round((c.Time - NOW) / DAY * 10) / 10,
    lr: Math.round((NOW - (c.Time - c.CF * DAY)) / DAY * 10) / 10,
    hr: new Date(c.Time).getUTCHours(),
    r: c.numberOfReschedulings ?? 0,
    aph: c.AutoParkHit, atg: c.AutoTagHit,
    tag: c.Tag ? 1 : 0, pan: c.Panic !== undefined ? 1 : 0,
    n: trunc(content[c.ID]?.n, 110), e: trunc(content[c.ID]?.e, 80),
  };
});

// ---- deck summaries ----
const deckSum = [];
for (const d of decks) {
  const st = doc.decksStatus.find((x) => x.ID === d.id);
  const mine = rows.filter((r) => r.dk === d.code);
  const act = mine.filter((r) => r.st === 3);
  const drawn = st ? Math.min(st.PullCounter * 5, d.occurrences) : 0;
  deckSum.push({
    id: d.id, code: d.code, title: d.title, fam: d.code[0], managed: !!d.managed,
    mi: d.maxInterval, ats: d.autoTickStreak, ahc: d.autoHammerCount,
    pull: st ? st.PullCounter : 0, drawn, avail: d.occurrences, pending: d.pending || 0,
    held: mine.length, active: act.length,
    t150: mine.filter((r) => r.st === 150).length,
    t100: mine.filter((r) => r.st === 100).length,
    t200: mine.filter((r) => r.st === 200).length,
    meanCf: act.length ? +(act.reduce((a, r) => a + r.cf, 0) / act.length).toFixed(1) : 0,
    atCap: act.filter((r) => r.cf === r.mi).length,
    load: +act.reduce((a, r) => a + 1 / Math.max(1, r.cf), 0).toFixed(2),
    leech: mine.filter((r) => r.r >= 12).length,
    tag: mine.filter((r) => r.tag).length,
    lastSeen: mine.length ? Math.max(...mine.map((r) => r.lrT)) : null,
    firstSeen: mine.length ? Math.min(...mine.map((r) => r.lrT)) : null,
    // interval bands for the heatmap: 0, 1-4, 5-9, 10-14, 15-19, 20-24, 25-29, 30
    bands: [0, 0, 0, 0, 0, 0, 0, 0].map((_, bi) => act.filter((r) => bandOf(r.cf) === bi).length),
  });
}
function bandOf(cf) { if (cf === 0) return 0; if (cf < 5) return 1; if (cf < 10) return 2; if (cf < 15) return 3; if (cf < 20) return 4; if (cf < 25) return 5; if (cf < 30) return 6; return 7; }

// ---- daily series, past (observed last-seen) + future (scheduled) ----
const dayKey = (ms) => Math.floor((ms - 4 * 36e5) / DAY);          // 4am rollover
const todayK = dayKey(NOW);
const minK = Math.min(...rows.map((r) => dayKey(r.lrT)));
const maxK = Math.max(...rows.map((r) => dayKey(r.dueT)));
const FAM = ["Z", "A", "B", "C"];
const series = { t: [], pastFam: FAM.map(() => []), futFam: FAM.map(() => []), pastTot: [], futTot: [], parkTot: [] };
const pastIdx = {}, futIdx = {};
for (const r of rows) {
  const pk = dayKey(r.lrT), fk = dayKey(r.dueT);
  (pastIdx[pk] = pastIdx[pk] || []).push(r);
  (futIdx[fk] = futIdx[fk] || []).push(r);
}
for (let k = minK; k <= maxK; k++) {
  series.t.push((k * DAY + 4 * 36e5) / 1000);                      // uPlot wants seconds
  const p = pastIdx[k] || [], f = futIdx[k] || [];
  const isPast = k <= todayK;
  FAM.forEach((fam, fi) => {
    series.pastFam[fi].push(isPast ? p.filter((r) => r.dk[0] === fam).length : null);
    series.futFam[fi].push(!isPast ? f.filter((r) => r.dk[0] === fam && r.st === 3).length : null);
  });
  series.pastTot.push(isPast ? p.length : null);
  series.futTot.push(!isPast ? f.filter((r) => r.st === 3).length : null);
  series.parkTot.push(!isPast ? f.filter((r) => r.st !== 3).length : null);
}

// ---- calendar (one entry per day, past only) ----
const cal = {};
for (const r of rows) { const k = new Date((dayKey(r.lrT) * DAY) + 4 * 36e5).toISOString().slice(0, 10); cal[k] = (cal[k] || 0) + 1; }

// ---- weekday + hour profiles ----
const weekday = new Array(7).fill(0), hours = new Array(24).fill(0);
for (const r of rows) { const d = new Date(r.lrT - 4 * 36e5); weekday[(d.getUTCDay() + 6) % 7]++; hours[new Date(r.dueT).getUTCHours()]++; }

// ---- reschedule histogram ----
const resched = [];
for (let n = 0; n <= 24; n++) resched.push(rows.filter((r) => r.r === n).length);

// ---- interval ladder ----
const ladder = [];
for (let cf = 0; cf <= 30; cf++) { const a = rows.filter((r) => r.st === 3 && r.cf === cf); ladder.push({ cf, n: a.length, capped: a.filter((r) => r.cf === r.mi).length }); }

// ---- asymmetry ----
const perCard = {};
for (const r of rows) (perCard[r.id] = perCard[r.id] || []).push(r);
const asym = { both: 0, bothActive: 0, bothParked: 0, nActive_eParked: 0, eActive_nParked: 0, list: [] };
for (const k in perCard) {
  const n = perCard[k].find((r) => r.s === "N"), e = perCard[k].find((r) => r.s === "E");
  if (!n || !e) continue;
  asym.both++;
  const na = n.st === 3, ea = e.st === 3;
  if (na && ea) asym.bothActive++;
  else if (!na && !ea) asym.bothParked++;
  else if (na && !ea) { asym.nActive_eParked++; asym.list.push({ id: k, dir: "N", dk: n.dk, cfN: n.cf, cfE: e.cf, n: n.n, e: n.e }); }
  else { asym.eActive_nParked++; asym.list.push({ id: k, dir: "E", dk: e.dk, cfN: n.cf, cfE: e.cf, n: e.n, e: e.e }); }
}
asym.list.sort((a, b) => b.cfN + b.cfE - (a.cfN + a.cfE));
asym.list = asym.list.slice(0, 60);

// ---- streaks from the reconstructed calendar ----
const calKeys = Object.keys(cal).sort();
let bestStreak = 0, cur = 0, prev = null;
for (const k of calKeys) {
  const t = Date.parse(k + "T00:00:00Z");
  cur = (prev !== null && t - prev === DAY) ? cur + 1 : 1;
  prev = t;
  if (cur > bestStreak) bestStreak = cur;
}
const spanDays = Math.round((Date.parse(calKeys[calKeys.length - 1]) - Date.parse(calKeys[0])) / DAY) + 1;

const active = rows.filter((r) => r.st === 3);
const steady = +active.reduce((a, r) => a + 1 / Math.max(1, r.cf), 0).toFixed(1);
const steadyLifted = +active.reduce((a, r) => a + 1 / Math.max(1, r.cf === r.mi ? Math.round(r.cf * 1.5) : r.cf), 0).toFixed(1);

const stockTotal = decks.filter((d) => !d.managed).reduce((a, d) => a + d.occurrences, 0);
const hubTotal = decks.filter((d) => d.managed).reduce((a, d) => a + d.occurrences, 0);
const hubPending = decks.filter((d) => d.managed).reduce((a, d) => a + (d.pending || 0), 0);

const out = {
  meta: {
    uid: "3wEnqPaPO2cSg2WOqNt6FXuZZvC3", now: new Date(NOW).toISOString(),
    occurrences: rows.length, distinctCards: Object.keys(perCard).length,
    sessions: doc.completedSessions, dailyCards: doc.dailyCards,
    archived: rows.length - active.length, activeN: active.length,
    t200: rows.filter((r) => r.st === 200).length,
    t150: rows.filter((r) => r.st === 150).length,
    t100: rows.filter((r) => r.st === 100).length,
    historyRows: 1,
    drawn: deckSum.reduce((a, d) => a + d.drawn, 0),
    stockTotal, hubTotal, hubPending, corpusTotal: stockTotal + hubTotal,
    decksExhausted: deckSum.filter((d) => d.drawn > 0 && d.drawn >= d.avail).length,
    decksPulled: deckSum.filter((d) => d.drawn > 0).length,
    deckCount: deckSum.length,
    steady, steadyLifted, atCap: active.filter((r) => r.cf === r.mi).length,
    dueToday: active.filter((r) => r.due < 1).length,
    overdue: active.filter((r) => r.due < 0).length,
    parkedPast: rows.filter((r) => r.st !== 3 && r.due < 0).length,
    parkedFuture: rows.filter((r) => r.st !== 3 && r.due >= 0).length,
    studyDays: calKeys.length, spanDays, bestStreak,
    firstStudy: calKeys[0], lastStudy: calKeys[calKeys.length - 1],
    tagged: rows.filter((r) => r.tag).length,
    atg1: rows.filter((r) => r.atg >= 1).length,
    panic: rows.filter((r) => r.pan).length,
    leeches: rows.filter((r) => r.r >= 12).length,
    dupOccurrences: 131,
    audio: { N: rows.filter((r) => r.a === "N").length, E: rows.filter((r) => r.a === "E").length, X: rows.filter((r) => r.a === "X").length },
    todayK, minK, maxK,
  },
  rows, deckSum, series, cal, weekday, hours, resched, ladder, asym,
  reminders: doc.reminderSetting,
  dupPairs: { "B02+B14": 32, "B05+B14": 22, "B04+B14": 42, "B07+B14": 5, "B09+B14": 30 },
};
fs.writeFileSync(S + "/dashboard-data.json", JSON.stringify(out));
console.log("wrote", (fs.statSync(S + "/dashboard-data.json").size / 1024).toFixed(0), "KB");
console.log(JSON.stringify(out.meta, null, 1));
console.log("\nseries points:", series.t.length, "from", new Date(series.t[0] * 1000).toISOString().slice(0, 10), "to", new Date(series.t[series.t.length - 1] * 1000).toISOString().slice(0, 10));
console.log("hub decks:", JSON.stringify(deckSum.filter((d) => d.managed)));
console.log("decks total:", deckSum.length, " pulled:", out.meta.decksPulled, " exhausted:", out.meta.decksExhausted);
console.log("weekday:", weekday, " streak:", bestStreak, "of", spanDays, "days");
console.log("resched hist:", resched.join(","));
