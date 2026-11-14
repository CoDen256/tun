// D-H3: the publish schedule, persisted so it's UI-editable without a
// process restart. `clock.js` reads this fresh on every tick.
const DEFAULT_SCHEDULE = { kind: "daily", at: "02:00" };

export async function getSchedule(pool) {
  const { rows } = await pool.query("SELECT value FROM builder_config WHERE key = 'schedule'");
  return rows.length === 0 ? DEFAULT_SCHEDULE : rows[0].value;
}

export async function setSchedule(pool, schedule) {
  await pool.query(
    "INSERT INTO builder_config (key, value) VALUES ('schedule', $1) ON CONFLICT (key) DO UPDATE SET value = $1",
    [JSON.stringify(schedule)]
  );
}

// Pure — testable without a live clock or database. `manual` never returns
// true regardless of elapsed time (scheduler-config spec). `lastRunAt` is
// `build_jobs`' own most recent `requested_at`, not separate state.
export function shouldRunNow(schedule, lastRunAt, now = new Date()) {
  if (!schedule || schedule.kind === "manual") return false;

  if (schedule.kind === "interval") {
    if (!lastRunAt) return true;
    return (now - lastRunAt) / 3600000 >= schedule.hours;
  }

  if (schedule.kind === "daily") {
    const [h, m] = schedule.at.split(":").map(Number);
    const scheduledToday = new Date(now);
    scheduledToday.setHours(h, m, 0, 0);
    if (now < scheduledToday) return false;
    if (!lastRunAt) return true;
    return lastRunAt < scheduledToday;
  }

  return false;
}
