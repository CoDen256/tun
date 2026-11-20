# Acceptance criteria — ota-pull-tracking

Observable in **dev compose**, via claude-in-chrome for the UI and `curl` plus
shell for the gateway and the database. No VPS, no real phone, no real TLS.

Events are produced by issuing **real requests through the gateway** with the
OTA bearer token — never by inserting rows by hand. A criterion satisfied by a
hand-inserted row proves nothing about the observation path, which is the whole
change.

## The gateway's device-facing behaviour is unchanged

1. Capture a bundle response through the gateway **before and after** the
   change and diff them: status code, every response header (including
   `Cache-Control: public, max-age=31536000, immutable`) and the body bytes are
   **identical**.
2. Same byte-for-byte comparison for `/ota/current.json`, including
   `Cache-Control: no-store`.
3. A request with a wrong or missing OTA bearer token still returns `401` with
   the same body as before.
4. A non-GET/HEAD method against `/ota/*` still returns `405` with the same
   body as before.
5. The served bundle body is still **uncompressed** at rest — no
   `precompressed` behaviour was introduced, so the bytes the native code
   hashes are unchanged.
6. The diff for this change makes no edit to any matcher, header directive,
   status code, cache directive, `root` or `file_server` line inside the
   `/ota/*` handle block.

## The two Caddy traps (verify both; either one ships a broken gateway that looks healthy)

7. `caddy adapt --adapter caddyfile` on the new config reports
   `srv0.logs.default_logger_name` as the **general site logger**, not the OTA
   logger. This is the trap that silently routes all seven zones' traffic into
   the pull log.
8. With the stack up, a request to a **non-OTA** zone appears in the gateway's
   stdout log and **not** in the pull log file.
9. A bundle request appears in the pull log file.
10. The gateway container **starts and stays up**, and its log goes beyond
    "adapted config to JSON" to actually serving — confirming no reserved
    logger name was used. Check `docker compose ps` reports it running, not
    exited.
11. The Caddyfile carries a comment at the logger declarations explaining that
    the order is load-bearing and why.

## Ingest

12. After bundle and `current.json` requests, rows appear in `ota_pulls` with
    the correct kind, time, build id (for bundles), status and source address.
13. Ingesting the same log content **twice** inserts nothing the second time —
    verify by counting rows, re-running ingest, and counting again.
14. Truncate the log file (simulating rotation), then ingest: previously
    recorded rows are **still present**.
15. Restart hub: ingest resumes without duplicating or losing events. Issue a
    request before and after the restart and confirm both are recorded exactly
    once.
16. A request for a bundle that does not exist is recorded with its `404`
    status and is **not** counted as a successful pull anywhere on the UI.
17. A request with a bad token is recorded with its `401` status.
18. Hub's mount of the log volume is **read-only** — confirm hub cannot write
    to it.
19. With the log volume unwritable or absent, bundle requests are **still
    served normally** — observation is not a dependency of the device plane.

## The Pulls page

20. `Pulls` appears in the rail's Device group alongside Sync and Insights, and
    the route is reachable.
21. The stat row shows total bundle downloads, distinct builds downloaded, the
    most recent download, and the most recent liveness event.
22. The main table lists events newest first with timestamp, kind, build id,
    status, bytes and source address, and pages.
23. Filtering by kind shows only that kind; filtering by build id shows only
    that build's events; filtering by time window excludes events outside it.
24. Bundle rows are visually dominant and poll rows quiet — distinguishable at
    a glance without reading the kind column.
25. Consecutive **successful** polls collapse into one expandable row stating
    how many, and expanding it reveals the individual events.
26. A **non-200** poll or bundle request is **never** collapsed into a group
    and remains individually visible. Produce one with a bad token among a run
    of good polls and confirm it stands alone.
27. An extended period with no events is apparent from the activity strip
    rather than only inferable from absent rows.
28. The page never describes a download as a build running, active or installed
    on a device.
29. The source address is presented as a network address, with no claim of
    device, account or handset identity.

## Publish history columns

30. Publish history shows `Pulls` and `Last pulled` **in addition to** every
    column it had before — no existing column was removed or reordered away.
31. Download a published build through the gateway and the count increments and
    the last-pulled time updates.
32. A build that is **current and has never been downloaded** is visibly
    flagged as needing attention.
33. A build that was **superseded before any download** shows its zero quietly,
    presented as expected rather than as a fault — visibly different from 32.
34. `/mjolnir/ota` (Logic bundles) has **no** pull columns.
35. Clicking a pull count leads to the Pulls page filtered to that build.

## Scope and standards

36. No row is recorded for `/blob/*` or `/audio-manifest/*` requests. Issue one
    of each and confirm.
37. `git diff` for this change touches no file under `mjolnir/sync/`,
    `mjolnir/patches/` or `mjolnir/base/`, does not modify
    `docs/11-ota-contract.md`, and touches nothing under
    `mjolnir/builder/`.
38. `bin/check-standards.sh` passes.
39. The pages render correctly in both light and dark theme, and no table
    causes the page body to scroll horizontally.
40. The accepted mockup's Pulls and Publish-history surfaces are reproduced:
    stat row, activity strip, collapsing poll runs, the filter bar, and the
    two-state treatment of never-pulled.
