## 1. Investigate stock module 2110

- [x] 1.1 Confirm `initDecksStatus`'s exact current source in the real
      exploded bundle (`index.android.bundle.exploded/2110.js`) matches
      what's quoted in design.md — re-pull if the base bundle has moved.
- [x] 1.2 Grep the full bundle for all call sites of `initDecksStatus`
      (not just the manual-pull companion) and confirm none of them rely
      on the old upsert-preserving-unmatched-entries behavior — in
      particular check module 2205's sign-in restore path.
- [x] 1.3 Identify the exact static deck-defs module reference (`t` in
      the quoted source) so the replacement implementation can reference
      it correctly.

## 2. Author the patch pair

- [x] 2.1 Create `patches/js/2110-decks-logic.baseline.js` capturing the
      stock `initDecksStatus` (and surrounding module structure) verbatim.
- [x] 2.2 Create `patches/js/2110-decks-logic.edited.js` with
      `initDecksStatus` changed to the full-replace implementation from
      design.md's D1 (build result from `incoming`, falling back to
      static per-deck defaults; `currentDecksInfo` param no longer used).
- [x] 2.3 Resolve the Open Question from design.md: decide how to handle
      an `incoming` entry whose ID has no matching static def (explicit
      fallback vs. filtering it out) and implement accordingly.

## 3. Verify

- [x] 3.1 Rebuild/reassemble the patched APK via the existing
      `bundle-tool assemble` pipeline with the new patch pair included.
- [x] 3.2 Reproduce the original bug scenario: manually clear
      `decksStatus` entries in the live userdata document for a test
      account, press "Pull cloud progress," and confirm the
      corresponding local `PullCounter` resets rather than persisting.
- [x] 3.3 Confirm `total_cards`/card-level restore and the push direction
      (`pushCloudProgress`/`getDecksStatus`) are unaffected.
- [x] 3.4 Confirm the deck-list screen shows correct percentages after a
      relaunch following the pull (no fix needed for in-place staleness,
      per design.md's Non-Goals — relaunch is the accepted workaround).

## 4. Document

- [x] 4.1 Update `docs/findings.md` if it describes `decks_info`/
      `PullCounter` restore behavior anywhere, so it reflects the new
      replace semantics.
- [x] 4.2 Note the new patch pair (module 2110) in whatever manifest or
      README lists which modules this project patches, if one exists.
