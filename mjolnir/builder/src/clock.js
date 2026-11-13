import { runPublish } from "./pipeline.js";
import { buildGrammarRuleLookup } from "./stabburClient.js";
import { getSchedule, shouldRunNow } from "./schedulerConfig.js";
import { recentBuildJobs } from "./buildJobs.js";
import { makeDbLogger } from "./jobLogs.js";

// D-H3: the schedule now lives in `builder_config`, read fresh on every
// tick — a process restart is never required to change it. This timer
// itself polls frequently (every few minutes) regardless of the configured
// schedule; what changes per tick is only whether `shouldRunNow` says yes.
const POLL_INTERVAL_MS = 5 * 60 * 1000;

export function startNightlyClock(pool, config, { pollIntervalMs = POLL_INTERVAL_MS } = {}) {
  // D-H4: scheduled runs persist to job_logs the same as a manual publish,
  // and also print to stdout — nothing is lost for an operator tailing the
  // container directly instead of using the Run log page.
  const log = makeDbLogger(pool, { alsoConsole: true });

  const tick = async () => {
    try {
      const schedule = await getSchedule(pool);
      const [lastJob] = await recentBuildJobs(pool, 1);
      const lastRunAt = lastJob ? new Date(lastJob.requested_at) : null;
      if (!shouldRunNow(schedule, lastRunAt)) return;

      // D89: fetch stabbur's grammar rules once per run, not once per note.
      const grammarRuleLookup = await buildGrammarRuleLookup({ baseUrl: config.stabburBaseUrl, authToken: config.stabburAuthToken });
      const result = await runPublish(pool, { ...config, grammarRuleLookup, log });
      if (result.published) {
        console.log(`nightly run published ${result.buildId}: ${JSON.stringify(result.decksMinted)}`);
      } else {
        console.log("nightly run: no newly-eligible notes, nothing published");
      }
    } catch (err) {
      console.error("nightly run failed:", err);
    }
  };
  const timer = setInterval(tick, pollIntervalMs);
  return { stop: () => clearInterval(timer), runNow: tick };
}
