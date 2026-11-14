## Context

- `tun/docs/03-data-model.md` — `audio_blob` is "WIDE clip (padded)";
  `audio_sel_ms` is "selection range inside that clip." The trim is always
  meant to be applied downstream of the stored blob, not baked into it at
  capture time.
- `tun/docs/07-decisions.md`, D45 — stabbur owns the *canonical* audio.
  Whatever this change does with trimming must not require stabbur to
  destructively rewrite that canonical blob — the original, untrimmed clip
  should stay reconstructable, in case a trim ever needs revisiting.
- `builder/src/audioSnapshot.js` — `ensureBlobsPresent` fetches a blob by
  its sha256, verifies the hash, and stores it at `blobDir/<sha256>`,
  untouched. `writeAudioManifest` keys `audio.json` by card id → that same
  sha256. The device fetches `/blob/<sha256>` directly. Nowhere in this path
  is `audio_sel_ms` read.

## Goals / Non-Goals

**Goals:**
- Every card's audio manifest entry points at bytes trimmed to
  `audio_sel_ms`, when the note has one.
- The original, untrimmed blob stays available and unmodified in stabbur —
  trimming is a `hub`-side derivation, not a destructive edit.
- Deterministic, reproducible drain order.

**Non-Goals:**
- Re-encoding/normalizing audio beyond trimming (volume, format conversion)
  — out of scope, not requested.
- Changing stabbur's `audio_blob`/`audio_sel_ms` schema or authoring UI —
  that's `stabbur`'s own UI proposal's territory if the trim-adjustment flow
  itself needs work; this change only makes `builder` *respect* whatever
  `audio_sel_ms` stabbur already returns.

## Decisions

### D-F1 — trim downstream, at snapshot time, into a derived hash

A trimmed clip has different bytes than the original, hence a different
sha256. Two ways to handle that:

- **(a) Trim in `builder`, at snapshot time.** Fetch the original blob (as
  today), run it through `ffmpeg` to cut to `audio_sel_ms`, hash the
  *trimmed* result, store that derived hash in hub's own blob cache
  alongside (not replacing) the original, and point `audio.json` at the
  derived hash instead of stabbur's `audio_blob` value.
- **(b) Trim in `stabbur`, destructively, at authoring time.** Re-encode and
  re-hash the moment a trim is set, overwrite `audio_blob` with the new
  hash. Rejected: this permanently discards the original wide clip, making a
  trim mistake unrecoverable, and contradicts "stabbur owns the canonical
  audio" by having that canonical copy silently mutate underneath a stored
  reference.

**(a), chosen.** `ffmpeg` is already present on the system (confirmed via
`which ffmpeg`); no new dependency to add beyond invoking it as a
subprocess — a small wrapper in `audioSnapshot.js`, not a new npm package.

```
ensureBlobsPresent(cardAudio, …):
  for each card's {sha256, selMs}:
    fetch + verify original blob at hub's blob cache, as today
    if selMs is null: manifest entry = original sha256 (unchanged path)
    else:
      trimmedPath = ffmpeg -i <original> -ss <start> -to <end> <tmp>
      trimmedSha = sha256(trimmedPath)
      move into blobDir/<trimmedSha> if not already present (idempotent,
        same pattern as the original fetch-and-verify step)
      manifest entry = trimmedSha
```

### D-F2 — drain order

`ORDER BY id ASC` on the drain query. `id` is a serial primary key, so this
is insertion order — the row queued longest ago (lowest `id`) drains first
when multiple rows cross `remaining <= 0` in the same run. No schema change.

## Risks / Trade-offs

- **`ffmpeg` as a subprocess dependency inside `builder`.** It's already on
  the host (confirmed), but this is the first place `builder` shells out to
  anything. Keep the wrapper narrow (one function, one invocation shape) so
  it's easy to swap later if that ever becomes a problem.
- **Derived-hash blobs living only in `hub`'s cache, never in `stabbur`'s
  canonical store.** This is intentional (D-F1), but worth a one-line
  comment at the call site so a future reader doesn't mistake it for a
  content-addressing violation — it's a legitimate downstream derivative,
  the canonical original is still exactly where D45 says it should be.
- **A note with `audio_sel_ms` set but pointing outside the clip's actual
  duration** (stale metadata, or a clip replaced without clearing the
  selection) → `ffmpeg` should be given bounds-checked start/end (clamp to
  `[0, duration]`) rather than erroring the whole publish over one bad note's
  selection.

## Migration Plan

No schema change, no data migration. Existing manifests continue working
(any note with `audio_sel_ms: null` takes the unchanged path). Safe to ship
independently of every other proposal from this session.
