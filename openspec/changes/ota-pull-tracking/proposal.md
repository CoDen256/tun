## Why

There is no record anywhere of a bundle reaching the phone. The operator
publishes a build, and then finds out whether the device picked it up by
opening the app. The backlog item: *"sync — I should track what bundle and when
each bundle was pulled and display it in the UI, if that's not difficult."*

This was attempted once and removed. `device_state` (migration
`014_device_state_uid.sql`) held `active_build_id`, `pending_build_id`,
`audio_cached`, `audio_total` — and `015_drop_device_state.sql` deleted the
table with the reason recorded in its own comment: *"nothing on the device ever
attached activeBuildId/pendingBuildId/audioCached/audioTotal/lastFetchError to
the sync PATCH, so the table stayed permanently empty in practice… not worth
the client-side work to finish."*

So the design question is not "where do we store it" but "who can observe it at
all". The answer this change takes is: **the gateway already sees every bundle
download, and recording what it sees requires no device work, no JS patch, no
publish, and no change to a single byte the device receives.** `/ota/*` is
served off disk by Caddy with no process and no database in the path (D158,
`docs/11-ota-contract.md`), and it stays that way — logging is not in the
request path's contract.

## What Changes

- **The gateway gains a second, named access logger** writing JSON to a file in
  a shared volume, scoped to `/ota/bundle/*` only. Verified live against
  `caddy:2-alpine` v2.11.7 before being written down (see `design.md`): the
  one-subset-to-its-own-file construction works, and it has a trap that silently
  disables the main log if the two `log` blocks are declared in the wrong order.
- **`mjolnir-hub` ingests that file into a new `ota_pulls` table**, deduplicated
  on `(ts, uri, remote_ip)` so re-reading the whole file is idempotent and the
  record survives Caddy's log rotation. The table is the permanent record; the
  log file is a transport.
- **A new Device → Pulls page** at `/mjolnir/device/pulls`: stat tiles, a
  per-published-build table (first pulled / last pulled / count, with
  never-pulled builds visibly flagged), and a reverse-chronological pull log
  including non-200 outcomes.
- **Only bundle downloads are tracked.** Not `current.json` polls, not `/blob/*`,
  not `/audio-manifest/*` — scoped deliberately to the backlog item's literal
  ask, and it keeps the table small and the log file's growth bounded.
- **The UI states what it cannot know.** The gateway sees an IP, not a device;
  the OTA token is shared, so there is no account or handset identity on these
  rows. And a download is **not** an activation — the native boot watchdog (D08)
  can quarantine a bundle that was fetched perfectly. No view may imply a build
  is running on the phone.

## Capabilities

### New Capabilities
- `ota-pull-tracking`: observing, durably recording, and displaying which
  published bundle was downloaded from the gateway and when, without the device
  participating.

### Modified Capabilities
- `device-plane`: its "The device-facing contract does not change" requirement
  gains an explicit scenario that observing the device plane by logging is
  permitted and changes nothing the device receives — so that this change, and
  any future one like it, is measured against a written rule rather than
  argued case by case.

## Impact

- `grind/caddy/Caddyfile` — a named logger and one `log_name` line. **No
  matcher, header, status code, cache directive or body changes.**
- `grind/compose.yaml`, `mjolnir/compose.yaml` — a shared volume for the log
  file, writable by the gateway and read-only to hub.
- `mjolnir/hub/` — one migration, an ingest step, a route, a page.
- **Not touched**: `mjolnir/sync/`, `mjolnir/patches/`, the APK,
  `docs/11-ota-contract.md`'s contract itself, and `/mjolnir/builder/*` (owned
  by the Builder UI rehaul package in this same batch).

## Dependency

The batch manifest records **Builder UI rehaul & data versioning before this
package** — that package rethinks bundle/data versioning and adds a build time
to the human version label. This change is deliberately insulated from it:
`ota_pulls` keys on `build_id` alone, which is a permanent primary key frozen by
the OTA contract (D26, D48), and renders the human label as a secondary line
read from `publications`. Whatever the versioning rethink changes about the
label, the join and the stored rows are unaffected.
