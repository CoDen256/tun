## 0. Before you write any code

Read `design.md` D-F1 in full — the choice to trim downstream into a derived
hash rather than destructively in stabbur is deliberate (reversibility), not
an arbitrary pick. Read `tun/docs/07-decisions.md` D45 for why stabbur's
canonical audio must stay untouched by this change.

## 1. Audio trim

- [x] 1.1 Confirm `ffmpeg` availability as a build/runtime dependency of
      `builder`'s deployment (it's present on this dev machine; confirm it
      lands in whatever container image `builder` eventually ships in —
      cross-reference with the `hub-builder-operator-console` proposal's
      Dockerfile task, since both touch `builder`'s image). **Done**: added
      `ffmpeg` to the `apk add` line in the repo's `Dockerfile` (the same
      image `mjolnir-node` already runs, and the one `hub-builder-operator-
      console`'s own builder/hub services will run from too) — confirmed
      `ffmpeg`'s alpine package bundles `ffprobe` as well (needed for 1.2's
      duration clamp).
- [x] 1.2 Write a small wrapper: given a source file + `[startMs, endMs]`,
      produce a trimmed file via `ffmpeg -ss -to`, clamping bounds to
      `[0, duration]` so a stale/out-of-range selection can't fail the whole
      publish. **Done**: `trimToRange` in `audioSnapshot.js`, using
      `execFileSync` (no new npm dependency, per design.md). Probes duration
      via `ffprobe`; if clamping collapses the range to nothing (a selection
      entirely past the clip's actual duration), copies the untrimmed
      original through rather than producing an empty/invalid file.
- [x] 1.3 Wire it into `ensureBlobsPresent`: after fetching+verifying the
      original blob, if the card's note has `audio_sel_ms`, trim, hash the
      result, store under the derived hash (idempotent — skip if already
      present), and use that hash in the manifest instead of the original.
      **Done**. `ensureBlobsPresent` now takes an optional `selMsByCardId`
      (`{cardId: [startMs, endMs]}`, only ever populated for cards whose
      note is present in the current pull — a tombstoned note's selection
      isn't known any more, same permanence rule as its content) and
      returns `{cardId: finalSha256}` instead of the void it returned
      before. `pipeline.js` builds `selMsByCardId` from `note.audio_sel_ms`
      in both the `alreadyMinted` regen loop and the newly-minted mint loop,
      and uses the *returned* map for `writeAudioManifest` — `card_slots
      .audio_sha256` itself still stores the original, stabbur-known hash,
      unchanged, matching design.md's own pseudocode and its explicit "no
      schema change" Migration Plan.
- [x] 1.4 `writeAudioManifest` needs no change in shape — it already just
      takes `{cardId: sha256}`; the sha256 it receives is now sometimes a
      derived one. Confirm this doesn't require changing its signature.
      **Confirmed** — zero changes to `writeAudioManifest` itself; only its
      caller now passes the trimmed map.
- [x] 1.5 Tests: a note with `audio_sel_ms` produces a manifest entry whose
      hash differs from the original blob's hash and whose duration matches
      the selection; a note with `audio_sel_ms: null` produces the unchanged
      original-hash path; an out-of-range selection is clamped, not thrown.
      **Done**: new `builder/test/audioSnapshot.test.js` (real,
      ffmpeg-generated 2s sine-wave clip, not a text fixture — skips
      gracefully if `ffmpeg`/`ffprobe` aren't on `PATH`) covers all of the
      above plus the fully-past-duration collapse case. Also added a
      pipeline-level end-to-end case in `pipeline.test.js` ("D-F1: a real
      publish trims a note's audio to its audio_sel_ms, end to end") proving
      the trim reaches the actual `audio.json` manifest through a real
      `runPublish` call, not just the unit. This suite's existing fixture
      notes (`wordNote()`) use plain-text fake "audio" that isn't
      ffmpeg-decodable — their default `audio_sel_ms` was `[0, 100]`, which
      would now hit the real trim path and fail; changed the default to
      `null` (nothing in the existing suite asserted on it) so only the new,
      real-audio test exercises trimming.

## 2. Drain order

- [x] 2.1 Add `ORDER BY id ASC` to the `SELECT` in
      `drainPendingOccurrences` (`pendingOccurrences.js`).
- [x] 2.2 Test: insert multiple pending rows for one deck out of id order,
      decrement past zero for more than one, confirm they drain (and get
      appended to `Cards[]`) in ascending `id` order every time. **Done**:
      new `builder/test/pendingOccurrences.test.js`, against a real
      postgres (skips without `DATABASE_URL`, matching this suite's existing
      convention) — queues three cards' rows in an order independent of
      their card id (`C20002`, then `C20001`, then `C20003`), drains all
      three past zero in one call, confirms the returned order is exactly
      insertion order. A second case confirms a row that hasn't crossed
      zero is excluded and left with its decremented `remaining` intact.

## 3. Sign-off

- [x] 3.1 Re-run the existing `pipeline.test.js` suite in full — this change
      touches two functions several other tests already exercise; confirm
      nothing else regressed. **Done** — all tests pass (13/13 in
      `pipeline.test.js`, 35/36 across `builder`'s full suite — the one
      skip is the pre-existing opt-in live-stabbur test, unrelated to this
      change), plus the main repo's 129 and `hub`'s 6.
- [x] 3.2 If anything here contradicts or refines `design.md`'s D-F1 choice
      during implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md` — this project's established practice, not
      a suggestion. **Checked, nothing to record**: the implementation
      matches D-F1's own pseudocode exactly, including trimming downstream
      into a derived hash without any schema change. The one
      implementation-level detail worth noting here (not ADR-worthy, just a
      gotcha): `ffmpeg` can't infer an output container from an
      extensionless filename (blobs are stored by hash, no extension), so
      the trim command needs an explicit `-f mp3` — every blob in this
      system is mp3 regardless, so this isn't a real constraint, just
      something `ffmpeg` needed told to it.
