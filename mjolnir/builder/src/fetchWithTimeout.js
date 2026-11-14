// A BOUNDED outbound HTTP call (P57). There was no bound anywhere before this
// module (2026-11-14):
//
//     grep -n "timeout\|AbortSignal\|AbortController" \
//          mjolnir/builder/src/*.js mjolnir/hub/src/*.js   ->  nothing
//
// WHY A STOPPED DEPENDENCY WAS NOT THE TEST. Every degradation test in this
// repo used `docker compose stop`, which also removes the container's DNS
// record, so the connection fails in milliseconds with ENOTFOUND and
// builder's forecast panel degrades exactly as its spec claims. A HUNG
// dependency — OOM thrash, a lock pile-up, swap — is the real-world case, and
// `docker pause tun-stabbur-backend-1` reproduces it: the socket connects and
// then nothing ever arrives. Measured against the unbounded code:
//
//     builder-baseline          200  0.039s  b=118256
//     builder-stabbur-PAUSED    000  91.8s   b=0   (curl 52, empty reply)
//     builder-stabbur-PAUSED    000  205.7s  b=0
//     builder-stabbur-PAUSED    000  250.0s  b=0   (--max-time, never answered)
//     docker inspect tun-mjolnir-builder-1 -> healthy, FailingStreak 0 THROUGHOUT
//
// A dead socket while Docker reports healthy is worse than a 502: nothing
// anywhere says the service is in trouble.
//
// THE BOUNDS, and why.
//
//   JSON_MS = 10_000. The whole `/builder/` page — forecast pull against the
//     real 16,593-note stabbur database included — renders in 0.039s
//     measured. 10s is ~250x that: no pull that is merely slow can hit it,
//     while an operator (and the 10s healthcheck interval) is still answered
//     inside one page load.
//   BLOB_MS = 60_000. Audio blobs are megabytes and are fetched by the
//     nightly pipeline, not by a page render, so the bound is for a stuck
//     socket rather than for a human's patience. Still finite, which is the
//     whole point.
//
// `AbortSignal.timeout` covers the body read as well as the connect, which is
// what the pause case needs — the connect succeeds there.
export const JSON_MS = Number(process.env.OUTBOUND_HTTP_TIMEOUT_MS || 10_000);
export const BLOB_MS = Number(process.env.OUTBOUND_BLOB_TIMEOUT_MS || 60_000);

export async function fetchWithTimeout(input, { timeoutMs = JSON_MS, label = "upstream", ...init } = {}) {
  try {
    return await fetch(input, { ...init, signal: AbortSignal.timeout(timeoutMs) });
  } catch (err) {
    // Re-label, because the raw message is `This operation was aborted` with
    // no subject — and this string is what the degraded panel shows the
    // operator as the reason the forecast is missing.
    if (err?.name === "TimeoutError" || err?.name === "AbortError") {
      const e = new Error(`${label} timed out after ${timeoutMs}ms (no response — treating as unavailable)`);
      e.code = "ETIMEDOUT";
      e.cause = err;
      throw e;
    }
    throw err;
  }
}
