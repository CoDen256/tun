# Tasks — ota-pull-tracking

## 1. The gateway logger (read `design.md` §2 first — both traps are silent)
- [x] 1.1 Add a named access logger scoped to the OTA paths, writing structured
      lines to a file on a named volume.
- [x] 1.2 Declare it **before** the general site logger. The last-declared named
      logger becomes the site default, and the wrong order sends all seven
      zones' traffic to the pull log while stdout goes dark.
- [x] 1.3 Do **not** name the general logger `default` — it is reserved, and the
      container exits 1 right after printing what looks like a successful boot.
- [x] 1.4 Put the log-name directive **inside** the existing `handle /ota/*`
      block. Change no matcher, header, status code, cache directive, `root` or
      `file_server` line in it.
- [x] 1.5 Leave `precompressed` absent (D49) — the body native hashes must stay
      uncompressed.
- [x] 1.6 Comment the declaration order and why it is load-bearing.
- [x] 1.7 Verify with `caddy adapt --adapter caddyfile` **and** a live request —
      never by reading the file top to bottom (P56).
- [x] 1.8 Set `roll_size`/`roll_keep`/`roll_keep_for` (tier 2).

## 2. Volume wiring
- [x] 2.1 Named volume, **writable** at the gateway, **read-only** into hub.
- [x] 2.2 Confirm the device plane does not depend on it: with the volume
      unwritable or absent, bundle requests are still served normally.

## 3. Ingest and the table
- [ ] 3.1 Migration for `ota_pulls`, owned by hub (it owns the mjolnir schema).
- [ ] 3.2 Record both kinds, distinguished: bundle downloads and current-pointer
      polls. Store the status and the source address for both.
- [ ] 3.3 Key on `build_id` alone for bundles — a permanent key frozen by the
      OTA contract. Render the human label as a secondary line from
      `publications`; never key on it.
- [ ] 3.4 Make ingest **idempotent** via a dedup key over the event's
      identifying fields, so re-reading the whole file inserts nothing twice and
      the record survives rotation.
- [ ] 3.5 Make it resumable across restarts without duplicating or losing
      events.
- [ ] 3.6 Choose the ingest trigger and cooldown (tier 2).
- [ ] 3.7 Do **not** exclude `ota_pulls` from the backup dump — see
      `design.md` §9.

## 4. The Pulls page
- [ ] 4.1 Add `Pulls` to the rail's Device group and the route.
- [ ] 4.2 Stat row: total downloads, distinct builds, most recent download,
      most recent liveness.
- [ ] 4.3 Inline-SVG activity strip over time, making a silent period apparent.
- [ ] 4.4 Table with timestamp, kind, build, status, bytes, source; sortable and
      paginated.
- [ ] 4.5 Filters: kind, build, time window.
- [ ] 4.6 Bundle rows dominant, poll rows quiet; consecutive **successful** polls
      collapse into one expandable row.
- [ ] 4.7 **Never** collapse a non-200 — a 401 scan or a 404 for a deleted build
      must stay individually visible.
- [ ] 4.8 State the limits in the UI: a download is not an activation, a poll
      carries no build id, and a source address is not a device identity.

## 5. Publish history columns
- [ ] 5.1 Add `Pulls` and `Last pulled`, keeping every existing column.
- [ ] 5.2 Flag **current and never downloaded** prominently.
- [ ] 5.3 Render **superseded before any download** quietly — these two mean
      opposite things and must not be collapsed into one state.
- [ ] 5.4 Link a pull count through to the Pulls page filtered to that build.
- [ ] 5.5 Add **no** columns to `/mjolnir/ota` — see `design.md` §7.

## 6. Verification
- [ ] 6.1 Walk `acceptance.md` top to bottom against the running stack,
      producing events with real requests through the gateway and never by
      inserting rows.
- [ ] 6.2 Run the byte-for-byte device-facing comparisons (criteria 1–5) and
      **diff** them rather than eyeballing.
- [ ] 6.3 Confirm the diff touches no file under `mjolnir/sync/`,
      `mjolnir/patches/`, `mjolnir/base/`, `mjolnir/builder/`, and does not
      modify `docs/11-ota-contract.md`.
- [ ] 6.4 `bin/check-standards.sh` passes.
- [ ] 6.5 Add an ADR row to `docs/07-decisions.md` recording that the device
      plane may be **observed** but not altered, and that pull tracking is done
      at the gateway because the device-reporting approach was already built and
      removed (D126).
