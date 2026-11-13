## Why

`progress-sync-shim` (shipped) gives `hub` a real progress/device backend,
but no way to look at it except `psql`. A static mockup was built and
approved for a read-only operator page over that data. Building the mockup
surfaced a real gap in the shipped schema, not just a missing UI: `hub
/migrations/013_userdata.sql`'s own comment confirms `device_state.device_id`
holds the same value as `userdata.device_id` — the real Firebase uid, not a
per-device identifier. Two devices signed into one account would silently
overwrite each other's OTA/audio state, and a retired device's last-known
state wouldn't survive a newer device's next sync — which defeats this
page's own Device ID selector before it's built. This change fixes that key
and builds the page on top of it, kept separate from `progress-sync-shim`
since that change is already implemented and signed off.

## What Changes

- **`device_state` gets a real per-device key**, independent of the uid
  `userdata`/`userdata_history` are keyed by. A new always-run startup
  companion mints a local device id once (separate from, and never derived
  from, the Firebase uid) and includes it in the piggybacked `PATCH` body;
  `hub` stores `device_state` by that id, with the uid kept alongside it
  (not as the key) so the console can list every device seen for an
  account.
- **New read-only `hub` operator page** showing progress and device/OTA
  state, with two independent selectors — "Account (uid)" and "Device ID" —
  rather than one combined picker, since one account can carry several
  devices and a retired device should stay inspectable.
- **The per-card progress table always shows the card's `N` field**, never
  `E` — `N` identifies what the card is (the word, phrase, or question)
  regardless of which side was actually reviewed; `E` is only ever the
  answer, and showing it in a summary table would mislabel some rows (e.g.
  a pronunciation card's `E` is a transcription, not a question — `N` is
  the one field that's a stable identifier for every card type per
  `03-data-model.md`'s type table).
- Sync history rendered as deltas against the previous entry, not raw JSON
  per row — full document available on demand.

Mockup (approved before writing this down):
**https://claude.ai/code/artifact/12b08e2e-0eba-4990-8125-584a71c7046a**

## Capabilities

### New Capabilities
- `userdata-console`: the operator-facing progress/device-state page.

### Modified Capabilities
- `userdata-api` (from `progress-sync-shim`): `device_state`'s key changes
  from the uid to a separate, locally-generated device id; the piggybacked
  `PATCH` payload gains a `deviceId` field.

## Impact

- `hub/migrations/` — new migration adding `device_state.uid` (backfilled
  from the existing `device_id` column) and establishing that `device_id`'s
  values must be real per-device ids going forward.
- `hub/src/userdata.js`, `hub/src/server.js` — device-status write path
  takes `deviceId` from the request body instead of reusing the path's uid;
  new read functions for the console (per-account devices list, per-card
  progress joined with `card_content`, history deltas).
- `patches/js/progress-sync-restore-companion.js` — gains minting/
  persisting a local device id on first launch, sent on every sync.
- `hub/src/layout.js` — new nav entry.
- No changes to `stabbur`, `smia`, `builder`'s pipeline, or the native
  patch. Independent of `builder-logic-bundle-store` and
  `audio-link-playback-minimal`; depends on `progress-sync-shim` (shipped).
