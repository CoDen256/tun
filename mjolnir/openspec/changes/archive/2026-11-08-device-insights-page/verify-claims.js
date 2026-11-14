// Reference check for every figure asserted in docs/findings.md's R-section
// and in this change's proposal/design/tasks. Prototyped against the restored
// snapshot while the mockup was built; tasks.md 5.5 and 6.2 are this file.
//
// Expects the mockup dataset (built by mockup-dataset.js from the `userdata`
// row for 3wEnqPaPO2cSg2WOqNt6FXuZZvC3 in tun/tun-backup/mjolnir.sql) at
// ./dashboard-data.json, and the raw document at ./real.json. Adjust `S`.
//
// All 65 assertions passed as of 2026-11-07. The R4/R5 set identities are the
// load-bearing ones: if either ever fails, the Insights glossary is wrong.

const fs = require("fs");
const S = "/tmp/claude-1000/-home-coden-dev-mjolnir/df1a9f28-cfb9-4600-a833-955c3fe64ff1/scratchpad";
const D = JSON.parse(fs.readFileSync(S + "/dashboard-data.json", "utf8"));
const M = D.meta, R = D.rows;
const raw = JSON.parse(fs.readFileSync(S + "/real.json", "utf8"));
const tc = raw.totalCards;

let fail = 0;
const ck = (label, got, want) => {
  const ok = String(got) === String(want);
  if (!ok) fail++;
  console.log(`  ${ok ? "ok  " : "FAIL"} ${label.padEnd(46)} ${got}${ok ? "" : "   (claimed " + want + ")"}`);
};

console.log("findings R-section:");
ck("occurrences", R.length, 4510);
ck("distinct cards", M.distinctCards, 2575);
ck("decks in progress", new Set(R.map((r) => r.dk)).size, 37);
ck("archived", M.archived, 3597);
ck("future-dated records (R1)", R.filter((r) => r.due > 0).length, 1397);
ck("max due offset, in rotation (R1)", Math.max(...R.filter((r) => r.st === 3).map((r) => r.due)).toFixed(0), 30);
ck("CF > ceiling violations (R2)", R.filter((r) => r.st === 3 && r.cf > r.mi).length, 0);
ck("CF == ceiling, in rotation (R2)", R.filter((r) => r.st === 3 && r.cf === r.mi).length, 492);
ck("max CF/ceiling below cap (R2)", Math.max(...R.filter((r) => r.st === 3 && r.cf !== r.mi).map((r) => r.cf / r.mi)).toFixed(2), 0.97);
ck("distinct Stage values (R3)", [...new Set(R.map((r) => r.st))].sort((a, b) => a - b).join("/"), "3/100/150/200");
ck("stage 3 / 200 / 150 / 100 (R3)", `${M.activeN}/${M.t200}/${M.t150}/${M.t100}`, "913/3015/327/255");
ck("Park === (Stage!==3) (R3)", tc.every((c) => !!c.Park === (c.Stage !== 3)), true);
ck("Graduated true on all rows (R3)", tc.filter((c) => c.Graduated).length, 4510);
ck("Postponed true count (R3)", tc.filter((c) => c.Postponed).length, 4509);
ck("Stage 100 with CF=0 (R3)", R.filter((r) => r.st === 100 && r.cf === 0).length, 255);
ck("distinct MaxInterval values (R2)", new Set(D.deckSum.filter((d) => d.held).map((d) => d.mi)).size, 6);

// R4 set identity
const a1 = R.filter((r) => r.st === 3 && r.aph === 1).map((r) => r.i).sort((x, y) => x - y);
const a2 = R.filter((r) => r.st === 3 && r.cf === r.mi).map((r) => r.i).sort((x, y) => x - y);
ck("R4 identity |{rot,aph=1}| = |{rot,cf=cap}|", `${a1.length}=${a2.length}`, "492=492");
ck("R4 identity sets equal", JSON.stringify(a1) === JSON.stringify(a2), true);
ck("R4 aph=0 all strictly below cap", R.filter((r) => r.st === 3 && r.aph === 0).every((r) => r.cf < r.mi), true);
ck("R4 stage200 all at cap with aph=2", R.filter((r) => r.st === 200).every((r) => r.cf === r.mi && r.aph === 2), true);
ck("R4 AutoHammerCount=2 in every deck", D.deckSum.every((d) => d.ahc === 2), true);

// R5 set identity
const t1 = R.filter((r) => r.atg >= 2).map((r) => r.i).sort((x, y) => x - y);
const t2 = R.filter((r) => r.tag).map((r) => r.i).sort((x, y) => x - y);
ck("R5 identity |{atg>=2}| = |{Tag}|", `${t1.length}=${t2.length}`, "40=40");
ck("R5 identity sets equal", JSON.stringify(t1) === JSON.stringify(t2), true);
const atgDist = {};
for (const r of R) if (r.atg) atgDist[r.atg] = (atgDist[r.atg] || 0) + 1;
ck("R5 atg>=1 total / distribution", `${M.atg1} ${JSON.stringify(atgDist)}`, '276 {"1":236,"2":33,"3":6,"4":1}');
const med = (a) => a.slice().sort((x, y) => x - y)[a.length >> 1];
ck("R5 median reschedules, tagged", med(R.filter((r) => r.tag).map((r) => r.r)), 14);
ck("R5 median reschedules, library", med(R.map((r) => r.r)), 6);

// R6
ck("R6 Panic present count", M.panic, 128);
ck("R6 Panic always 0", tc.filter((c) => c.Panic !== undefined).every((c) => c.Panic === 0), true);
ck("R6 Panic with atg=0", R.filter((r) => r.pan && !r.atg).length, 0);
ck("R6 median reschedules, panic", med(R.filter((r) => r.pan).map((r) => r.r)), 11);

// R7
ck("R7 audio split N/E/X", `${M.audio.N}/${M.audio.E}/${M.audio.X}`, "3630/826/54");
ck("R7 A differs from language somewhere", R.some((r) => r.a !== r.s), true);
ck("R7 every record carries D", tc.every((c) => typeof c.D === "string"), true);

// R8
ck("R8 study days", M.studyDays, 135);
ck("R8 span", `${M.firstStudy} -> ${M.lastStudy}`, "2026-04-13 -> 2026-11-07");
ck("R8 future-dated last-reviews", R.filter((r) => r.lr < 0).length, 0);
ck("R8 silent hours 22-05", [22, 23, 0, 1, 2, 3, 4].filter((h) => D.hours[h] > 0).map((h) => `${h}:${D.hours[h]}`).join(",") || "none", "0:15,1:47");

// R9 / R10
ck("R9 parked-early with aph=0", R.filter((r) => r.st !== 3 && r.st !== 200 && r.aph === 0).length, 582);
ck("R9 completedSessions", M.sessions, 65);
ck("R9 consistencyRate absent", raw.consistencyRate === undefined, true);
ck("R10 cross-deck duplicate occurrences", M.dupOccurrences, 131);
ck("R10 all duplicates involve B14", Object.keys(D.dupPairs).every((k) => k.includes("B14")), true);

// C4 / C5 confirmations
ck("C4 sum PullCounter*5 == occurrences", raw.decksStatus.reduce((a, x) => a + x.PullCounter, 0) * 5, 4510);
ck("C5 stock corpus total", M.stockTotal, 4895);

console.log("\nproposal + tasks figures:");
ck("due today", M.dueToday, 76);
ck("overdue", M.overdue, 1);
ck("steady-state load", M.steady, 73.9);
ck("lifted-ceiling counterfactual", M.steadyLifted, 65.7);
ck("longest streak", M.bestStreak, 23);
ck("span days", M.spanDays, 209);
ck("busiest day count", Math.max(...Object.values(D.cal)), 311);
ck("busiest day date", Object.entries(D.cal).sort((a, b) => b[1] - a[1])[0][0], "2026-11-07");
ck("leeches >=12", M.leeches, 100);
ck("decks shown / pulled / drawn", `${M.deckCount}/${M.decksPulled}/${M.decksExhausted}`, "39/37/31");
ck("hub-managed decks", D.deckSum.filter((d) => d.managed).map((d) => d.code + " " + d.title).join(", "), "C30 Lexic, C20 Practice");
ck("stock drawn", `${M.drawn} of ${M.stockTotal}`, "4510 of 4895");
ck("side split N/E/A", ["N", "E", "A"].map((s) => R.filter((r) => r.s === s).length).join("/"), "2331/1439/740");
ck("asymmetry E-live vs N-live", `${D.asym.eActive_nParked} vs ${D.asym.nActive_eParked}`, "164 vs 14");
ck("B04 held / in rotation", (() => { const d = D.deckSum.find((x) => x.code === "B04"); return `${d.held}/${d.active}`; })(), "445/327");
ck("B04 mean interval / ceiling / on cap", (() => { const d = D.deckSum.find((x) => x.code === "B04"); return `${d.meanCf}/${d.mi}/${d.atCap}`; })(), "27.7/30/160");
ck("parked future-dated (forecast regression)", M.parkedFuture, 485);
ck("parked past-dated (the 3112 bug)", M.parkedPast, 3112);
ck("decks with any in-rotation cards", D.deckSum.filter((d) => d.active > 0).length, 21);
ck("timeseries point count", D.series.t.length, 239);

console.log(fail ? `\n${fail} CLAIM(S) WRONG` : "\nevery claim checks out");
process.exit(fail ? 1 : 0);
