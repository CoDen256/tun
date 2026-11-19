// card-preview-popup task group 6 — "Operator settings" (design.md §6,
// tasks 6.1-6.3, acceptance C37-C39).
//
// One hub table, `operator_settings` (migrations/020_operator_settings.sql):
// key -> JSONB value, no user column (one operator, D159/D160). It holds
// two logical groups, neither of which this file knows or cares about —
// the Cards-page view state (source/filters/sort/page size/page, task
// group 5's to populate) and the popup preferences (device/theme/font
// size/default direction/drawer width+height/active tab/tools open, wired
// end-to-end by this task group in cardPreviewPopup.js). Every key below
// is just a string; nothing here is specific to either group.
//
// D157 ("every service serves before it migrates") applied to a READ, not
// just a boot-time gate: every function here catches its own database
// error and answers with the caller's default instead of throwing, so a
// stopped/unreachable postgres costs the Cards page its persisted
// preferences for that one request, never the page itself (C39). This is
// deliberately a SEPARATE degrade path from server.js's `isDatabaseBacked`
// boot-readiness gate (zone-isolation 1.5): that gate 503s a whole page
// before its handler runs, which is correct for /mjolnir/cards itself but
// wrong for a settings read that is supposed to silently fall back to
// defaults instead of surfacing an error at all. The settings route this
// file backs is NOT in server.js's DB_BACKED list for exactly that reason
// — see the carve-out note there.
//
// A missing or unparsable stored value degrades to the caller's default
// the same way a database error does (C38 "stale settings degrade") —
// this file never throws out of a bad row, because the row was written by
// an earlier, possibly now-invalid, version of whatever the caller
// expects (e.g. a saved Cards-page source naming a build that
// `publications` no longer has). Deciding whether a value is STILL valid
// (e.g. "does this build id still exist") is the caller's job — task
// group 5's, for the Cards-view keys — since only the caller knows what
// "valid" means for its own key. This file only guarantees that a row
// which fails to even LOAD (DB error, corrupt JSON) never reaches the
// caller as an exception.

// Keys are free-form strings chosen by callers (e.g.
// "cardPreviewPopup.device", "cardsPage.filters"); this just keeps a
// future malformed `key` (unbounded length, SQL-hostile characters) from
// reaching the query — not a real injection risk with parameterized
// queries, but a cheap, loud 400 beats a silently-created junk row.
const KEY_PATTERN = /^[a-zA-Z0-9][a-zA-Z0-9_.:-]{0,199}$/;

export function isValidSettingKey(key) {
  return typeof key === "string" && KEY_PATTERN.test(key);
}

// Reads one key. Returns `{ value, found, degraded }` — `found` is false
// both when the key was never written and when the read degraded, so a
// caller that only cares about "do I have a real value" can check `found`
// alone; `degraded` is there for a caller (or a test) that wants to tell
// "never set" apart from "could not ask".
export async function getSetting(pool, key, defaultValue) {
  try {
    const { rows } = await pool.query("SELECT value FROM operator_settings WHERE key = $1", [key]);
    if (rows.length === 0) return { value: defaultValue, found: false, degraded: false };
    return { value: rows[0].value, found: true, degraded: false };
  } catch (err) {
    console.error(`[operatorSettings] getSetting(${key}) degraded to default: ${err.message}`);
    return { value: defaultValue, found: false, degraded: true };
  }
}

// Reads every stored key in one round trip (the Cards page load reads a
// handful of keys at once; one query beats one per key). Returns
// `{ values, degraded }` where `values` is a plain object keyed by the
// stored `key` column — empty on any failure, never thrown.
export async function getAllSettings(pool) {
  try {
    const { rows } = await pool.query("SELECT key, value FROM operator_settings");
    const values = {};
    for (const row of rows) values[row.key] = row.value;
    return { values, degraded: false };
  } catch (err) {
    console.error(`[operatorSettings] getAllSettings degraded to empty: ${err.message}`);
    return { values: {}, degraded: true };
  }
}

// Upserts one key. Returns `{ ok, degraded }` rather than throwing on a
// database failure — a write that cannot land degrades the SAME way a
// read does (the operator's change just doesn't stick this time), not a
// 500 that would make a debounced client-side autosave noisy.
export async function setSetting(pool, key, value) {
  try {
    await pool.query(
      `INSERT INTO operator_settings (key, value, updated_at) VALUES ($1, $2::jsonb, now())
       ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value, updated_at = now()`,
      [key, JSON.stringify(value === undefined ? null : value)]
    );
    return { ok: true, degraded: false };
  } catch (err) {
    console.error(`[operatorSettings] setSetting(${key}) degraded (not persisted): ${err.message}`);
    return { ok: false, degraded: true };
  }
}
