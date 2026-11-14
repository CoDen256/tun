## REMOVED Requirements

### Requirement: Any non-stock card plays via URL
**Reason**: Confirmed broken on a real device (`tun/docs/07-decisions.md`
D122) — `RNSoundPlayerModule`'s `playUrl`/`loadUrl` cannot play a remote
`https://` URL at all; this was never a working mechanism, not a
performance gap.
**Migration**: Replaced by `audio-cache-prefetch`'s cache-then-play
requirement — a card plays only from a locally-cached `file://` path,
never via a direct URL.

### Requirement: No reachability check or fallback in this version
**Reason**: Predicated on direct URL playback being a working fallback
path, which D122 disproved entirely.
**Migration**: Superseded by `audio-cache-prefetch`'s silent-skip-on-miss
requirement, which has no reachability check for the same reason this one
didn't — but for a cache-presence check, not a network reachability check.

### Requirement: Every published card's audio is also available at a predictable, card-id-keyed static URL
**Reason**: Existed only to give the broken direct-URL mechanism a
name-based address. With the device resolving `cardId → sha256` itself
from a manifest (`audio-cache-prefetch`), this duplicate static file has no
remaining consumer.
**Migration**: `builder/src/audioSnapshot.js`'s `writeAudioByCardFiles` and
the `/audio-by-card/*` Caddy block are removed; replaced by the
`/audio-manifest/<buildId>.json` manifest endpoint.

### Requirement: The card-id-keyed audio path requires no authentication
**Reason**: Applied to the now-removed `/audio-by-card/*` path specifically.
**Migration**: The same "content is the capability, not a secret"
reasoning is carried forward onto the new `/audio-manifest/*` path instead
— see `audio-cache-prefetch`'s own requirements.
