## Why

There is no record anywhere of a bundle reaching the phone. The operator
publishes a build and then finds out whether the device took it by opening the
app.

The backlog item: *"sync — i should track what bundle and when each bundle was
pulled and display it in the ui, if that's not difficult."*

This was attempted once and removed, which is the most useful fact available.
`device_state` held `active_build_id`, `pending_build_id`, `audio_cached`,
`audio_total` — and `015_drop_device_state.sql` dropped it because **nothing on
the device ever reported**. D126 records the root cause: the client never
attached those fields to a sync PATCH, so the server's own write path had an
early-return guard that skipped every write, and the table was permanently
empty in production while being correctly implemented and tested.

So the question is not "where do we store it" but **"who can observe it at
all"**. The answer: the gateway already sees every request for a bundle, and
recording what it already sees needs no device work, no JS patch, no publish,
and no change to a single byte the device receives. `/ota/*` is served off disk
by Caddy's `file_server` with no process and no database in the path, and it
stays exactly that way — logging is not part of the request contract.

## What Changes

- **The gateway gains a second, named access logger** writing structured lines
  to a file on a shared volume, scoped to the OTA paths only. Two silent traps
  were verified live against `caddy:2-alpine` v2.11.7 while designing this, and
  both are recorded in `design.md` because either one ships a broken gateway
  that looks healthy.
- **hub ingests that file into a new `ota_pulls` table**, deduplicated so that
  re-reading the file is idempotent and the record survives Caddy's log
  rotation. The table is the permanent record; the log file is a transport.
- **Two event kinds are tracked, and never blurred:**
  - **bundle downloads** — a real "this build was pulled" event, low volume and
    high meaning;
  - **`current.json` polls** — launch-time checks. High volume and noisy, but
    the only device-liveness signal available, precisely because `device_state`
    is gone. Treated as liveness, never as pulls.
- **A new Device → Pulls page** with the full chronological record, filters, and
  an activity strip; runs of polls collapse into one expandable row so the noisy
  kind cannot drown the meaningful one, while non-200 outcomes never collapse.
- **Two columns on Publish history**: times pulled, and last pulled. A published
  build that was **never** pulled is visibly flagged, since that is the state
  the operator most needs to notice — he published and the phone never took it.
  The page distinguishes *current and never fetched* from *superseded before it
  could be*, which mean opposite things.
- **The UI states what it cannot know.** The gateway sees an IP, not a device;
  the OTA token is shared, so these rows carry no account or handset identity.
  And a download is **not** an activation — the native boot watchdog can
  quarantine a bundle that was fetched perfectly. No view may imply a build is
  running on the phone.

## Capabilities

### New Capabilities
- `ota-pull-tracking`: observing, durably recording and displaying which
  published bundle was downloaded from the gateway and when, plus device
  liveness, without the device participating.

### Modified Capabilities
- `device-plane`: its "the device-facing contract does not change" requirement
  gains an explicit scenario that **observing** the device plane by logging is
  permitted and changes nothing the device receives — so that this change, and
  any future one like it, is measured against a written rule rather than argued
  case by case.
- `userdata-console`: a `Pulls` entry joins the Device group in the rail.

## Impact

- `grind/caddy/Caddyfile` — a named logger and a log-name line inside the
  existing OTA handle block. **No matcher, header, status code, cache directive
  or body changes.**
- `grind/compose.yaml`, `mjolnir/compose.yaml` — a shared volume for the log
  file, writable by the gateway and **read-only** to hub.
- `mjolnir/hub/` — one migration, an ingest step, a route, a page, and two
  columns on an existing page.
- **Not touched**: `mjolnir/sync/`, `mjolnir/patches/`, the APK,
  `docs/11-ota-contract.md`'s contract itself, and `/mjolnir/builder/*`.

## Deliberately excluded

`/mjolnir/ota` (Logic bundles) gets **no** pull columns. A pull is recorded
against a published `buildId`, and a `logic_bundles` row is a build *input* the
device never fetches — putting the columns there would invite reading a blank
cell as "never pulled" for something that is not pullable.

`/blob/*` and `/audio-manifest/*` are also out of scope: they are
content-addressed audio fetches, not build adoption, and logging them would
swamp the record.

## Dependency

Independent of `backup-console` and `userdata-git-history`; may be built in
parallel with either. `ota_pulls` keys on `build_id` alone, which is a permanent
primary key frozen by the OTA contract, and renders the human label as a
secondary line — so whatever the versioning work changed about labels, the
stored rows and the join are unaffected.
