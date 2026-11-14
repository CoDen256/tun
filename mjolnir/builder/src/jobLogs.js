// D-H4: not a real log shipper — just the run's own narration checkpoints,
// persisted against the job that produced them so a failed run's log
// survives past the failure, not just the terminal error in `build_jobs.error`.
export async function logLine(pool, buildJobId, line) {
  await pool.query("INSERT INTO job_logs (build_job_id, line) VALUES ($1, $2)", [buildJobId, line]);
}

export async function jobLogLines(pool, buildJobId) {
  const { rows } = await pool.query("SELECT at, line FROM job_logs WHERE build_job_id = $1 ORDER BY id ASC", [buildJobId]);
  return rows;
}

// `runPublish`'s `log(buildJobId, line)` callback — inserts a row, and
// optionally also prints to stdout so a scheduled run's output isn't lost
// for an operator tailing a container's logs directly (D-H4).
export function makeDbLogger(pool, { alsoConsole = false } = {}) {
  return async (buildJobId, line) => {
    await logLine(pool, buildJobId, line);
    if (alsoConsole) console.log(line);
  };
}
