## 1. The gateway's pull log

- [ ] 1.1 In `grind/caddy/Caddyfile`, add a named logger `otapulls` writing
      `format json` to a file in a mounted volume. **Declare it BEFORE the
      existing site `log` block** — the last-declared named logger becomes the
      site default, and getting this backwards silently routes every request in
      all seven zones into the pull log while stdout goes dark (verified; see
      `design.md`).
- [ ] 1.2 Give the existing stdout logger an explicit name that is **not**
      `default` — `log default` alongside a second named logger fails at
      startup with an include/exclude error, after printing what looks like a
      successful boot.
- [ ] 1.3 Add a comment next to both blocks stating the ordering rule and why,
      so the next person to edit this file cannot reintroduce the trap.
- [ ] 1.4 Add `log_name otapulls` inside the existing `handle /ota/*` block,
      matched to `/ota/bundle/*` only. Change nothing else in that block: not
      the token gate, not the GET-only gate, not either `Cache-Control` header,
      not the absence of `precompressed` (D49).
- [ ] 1.5 Set `roll_size`, `roll_keep` and `roll_keep_for` explicitly rather
      than inheriting Caddy's defaults — the durability argument depends on
      knowing the bound.
- [ ] 1.6 Add the volume: writable in `grind/compose.yaml`, mounted
      **read-only** into hub in `mjolnir/compose.yaml`.
- [ ] 1.7 Verify with `caddy adapt --adapter caddyfile` that
      `srv0.logs.default_logger_name` is the stdout logger's name, NOT
      `otapulls`. Then verify live with real requests — never by reading the
      file top to bottom (P56).

## 2. Ingest into ota_pulls

- [ ] 2.1 New hub migration creating `ota_pulls` (`build_id`, `at`,
      `remote_ip`, `status`, `bytes`) with `UNIQUE (at, build_id, remote_ip)`.
      No foreign key to `publications` — a pull naming an unknown build must be
      a visible row, not an ingest failure.
- [ ] 2.2 Write the ingester: read the current log file(s), parse each JSON
      line, insert `ON CONFLICT DO NOTHING`. No byte-offset bookkeeping — the
      unique constraint is what makes re-reading safe across rotation.
- [ ] 2.3 Parse `build_id` from `/ota/bundle/<buildId>.js` and validate it
      against `^[A-Za-z0-9._-]{1,64}$` (D48). A non-matching URI is a skipped,
      counted line, never a row.
- [ ] 2.4 Convert Caddy's float-epoch `ts` to a real timestamp on the way in.
      Never store the raw float.
- [ ] 2.5 Skip and count unparseable lines; surface the count rather than
      failing the ingest or hiding it.
- [ ] 2.6 Trigger ingestion on a request to the Pulls page, skipped if it ran
      within the last minute. No scheduler, no background loop.
- [ ] 2.7 Distinguish "no log file found" from "log file present, no pulls
      recorded" — they are different states and the page reports each.

## 3. The Pulls page

- [ ] 3.1 Add "Pulls" to the Device group in `mjolnir/hub/src/layout.js`'s
      `NAV`, after Sync and Insights.
- [ ] 3.2 Route `GET /mjolnir/device/pulls`, rendering through the shared
      shell like every other hub page. Build it from `mockups/`.
- [ ] 3.3 Stat tiles in the existing `.snap-grid`/`.snap-item` style: latest
      pull, currently published build, distinct builds ever pulled, pulls in
      the last 30 days.
- [ ] 3.4 Per-build table, LEFT JOIN from `publications` so a published build
      with no pulls still gets a row: build id (primary, mono) with the human
      label secondary, published time, first pulled, last pulled, count.
- [ ] 3.5 Flag never-pulled builds visibly — a muted pill, not an empty cell.
- [ ] 3.6 Pull log timeline, reverse-chronological, reusing the real timeline
      markup. Non-200 and short responses get a warning pill.
- [ ] 3.7 State the two limits on the page itself: a download is not an
      activation, and the recorded address is an address, not a device or
      account.
- [ ] 3.8 Handle the pre-recording boundary: a build published before the
      earliest record cannot be known to be unpulled. Either distinguish it
      from a genuine never-pulled build or state plainly that no data exists
      before that point — do not render it as never pulled.
- [ ] 3.9 A pull row whose `build_id` has no `publications` row still renders,
      marked as an unknown build.

## 4. Verify the device plane is untouched

- [ ] 4.1 Capture a bundle response (status, all headers, body sha256) from the
      dev stack BEFORE the Caddyfile change.
- [ ] 4.2 Capture it again after, and diff: byte-identical, header-identical,
      status-identical. This is the one check that must not be skipped.
- [ ] 4.3 Confirm a non-bundle request still appears in the stdout log and does
      not appear in `pulls.log`.
- [ ] 4.4 Confirm bundle serving still works with the log destination
      unwritable (mount it read-only or fill it), and that the failure is
      visible to the operator and invisible to the client.

## 5. Record the decisions

- [ ] 5.1 ADR row in `docs/07-decisions.md`: pull tracking is observed at the
      gateway, not reported by the device — with `015_drop_device_state.sql`'s
      reasoning cited as what this supersedes and what it does NOT revive.
- [ ] 5.2 Record the two verified Caddy traps (logger declaration order,
      reserved `default` name) where this ecosystem keeps its pitfalls, so they
      survive outside this change folder.
- [ ] 5.3 Note in `docs/11-ota-contract.md` that bundle downloads are logged at
      the gateway and that this is passive observation, not a contract change —
      without altering any contract clause.
