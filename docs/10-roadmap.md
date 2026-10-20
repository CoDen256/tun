# Roadmap

The project is large. This file exists so that "what do I do next?" always has a
one-line answer.

## Shape of the dependency graph

Ordering revised by **D40**: the native patch comes first. It does not depend on
the cold-start answer, and once OTA works, testing a padded bundle is a file copy
to the VPS instead of a full APK rebuild — so doing it first makes P0 *cheaper*.

```
  P1 minimal OTA ──► P2 APK (ONCE) ──► P0 cold-start ──► P3 JS ──► P4 content ──► usable
     endpoint          native OTA       (now a file        patches     spine       with
     + /ota static     + watchdog        copy)                                     manual
                                                             │                     cards
                              P5 sync swap ◄─────────────────┘
                                   │
                              P6 smia ──► P7 capture ──► P8 triage UI ──► the full loop
```

Everything before P4 is **infrastructure with no visible payoff**. P4 is the
first moment you can put your own card on your phone. Push through to there.

---

## P0 — Verify (after P2, because OTA makes it cheap)

- [ ] **Q07 Cold-start parse time.** Push a bundle padded with synthetic cards
      (+5 MB) via OTA, measure launch time on the real phone. If this is bad,
      D03 (bundle regeneration) has a ceiling and needs rethinking.
- [ ] **Runtime check of `ExponentFileSystem` + `playUrl("file://…")`** in a dev
      build. Both are confirmed present statically; confirm they work at runtime
      before freezing the native patch.
- [ ] **Q06 Type (d) behaviour.** Find one of the 58 stock `E`-only cards, run it,
      confirm front/flip/audio behaves as the type (d) design assumes.

## P1 — Server skeleton

Minimum for the device to have something to talk to.

- [ ] Caddy + Postgres + `mjolnir-hub` on the Contabo VPS, HTTPS working
- [ ] `/ota/current.json`, static bundle + `/blob/<sha256>` serving, gzip
- [ ] Token gate on `/ota/*`
- [ ] Publish the *current unmodified* bundle as build #1 — proves the path

## P2 — The one APK build

**Irreversible. Everything that will ever need native must be in this build.**

- [ ] 6th `Package` in `ExpoModulesPackageList$LazyHolder` →
      `ReactNativeHostHandler.getJSBundleFile()`
- [ ] Stale-while-revalidate fetch, `.tmp` → verify → atomic rename
- [ ] Three-tier fallback: fetched → cached → `assets://index.android.bundle`
- [ ] Boot watchdog (`boot-ok-<buildId>`, skip after 2 failed attempts)
- [ ] Rebuild / re-sign / install via the existing `0306.orig/` pipeline
- [ ] Verify rollback works by pointing `current.json` at an older build

After this: **every future change is a file on the server.**

## P3 — JS patches

- [ ] mod 1440 audio resolver (cached → stream → `res/raw`), stock path untouched
- [ ] New prefetcher module (manifest diff → `downloadAsync` → verify → rename)
- [ ] New boot-ok marker module
- [ ] Verify by serving a replacement clip for one stock card

## P4 — Content spine *(first visible payoff)*

- [ ] `stabbur` schema: items, decks, `card_slots`, publications, `build_jobs`
- [ ] Projector: item → `{N,E,X,D,A}` + occurrences, per the five types
- [ ] Interleaver: append-only, min lag 11
- [ ] `builder` worker invoking bundle-tool as a library
- [ ] C20–C29 decks appended after C17
- [ ] **Hand-write 10 cards, publish, study them on the phone**

## P5 — Sync swap

- [ ] `hub.userdata` + `userdata_history` + `device_state`
- [ ] Firestore shim (optimistic local doc, flush queue, Timestamp revival,
      create-on-first-use)
- [ ] Swap the handle in mod 2080; strip `getIdToken` / `currentUser` guards
- [ ] Device status piggybacked on the sync PATCH; status panel in stabbur
- [ ] Restore hook (write `persist:primary` pre-rehydration)

## P6 — smia

- [ ] Service skeleton + `lookup_cache` + declarative provider chains + `/ui`
- [ ] `/inflect` (Norsk ordbank import — returns candidates)
- [ ] `/ipa` (naob → ipa-lookup → espeak)
- [ ] `/tts` (Forvo → dict.cc → cloud → piper) writing into the blob store
- [ ] `/translate` (lifted from hover-translate) and `/stt` (cloud)

## P7 — Capture

- [ ] `POST /capture`; yt-dlp whole-video cache per `videoId`; ffmpeg padded slice
- [ ] Extension: save action on subtitle selection **and arbitrary page text**
- [ ] Fast-local translation first, async smia enrichment
- [ ] Dedup feedback ("already have this")

## P8 — Triage UI

- [ ] Inbox list; pick type; prefill from smia; edit translations/inflections/IPA
- [ ] Trim audio; mark ready
- [ ] Publish button (+ nightly auto-if-dirty); shows which IDs would be minted
- [ ] Progress dashboard over `userdata` JSONB

## Later / optional

- Migrate phonexa sample audio onto the blob store (D09)
- Promote capture clips into phonexa `Sample`s for formant work
- Promote `ShadowingSegment`s into items
- Revisit D14 (linking recall and pronunciation progress)

---

## Right now

**P1 → P2.** Stand up a minimal `/ota/current.json` + bundle on the Contabo box
(~1h), then design and ship the native patch.

Before writing any smali, settle **Q11–Q16** in `09-open-questions.md` — the
`current.json` contract, on-device layout, validity test, watchdog semantics,
the `ota-config.json` escape hatch (D39) and hash-not-signing (D47). Every one
of them is frozen forever once the APK ships.

### Prerequisites still open

- `/home/coden/rev/mjolnir/smali.merged.mjolnir/assets/.git` holds 4 commits
  (`07b26ed`, `101a0be`, `b5cc8df`, `f6c42e7`) whose hashes do **not** match the
  three paywall patches recorded in `mjolnir/docs/findings.md` §7
  (`0f6f580`, `b962691`, `a1f8f1f`). There are two patch histories in that
  workspace. **Untangle which is authoritative before building on either.**
- `stabbur` and `smia` are scaffolded (README + CLAUDE.md only); no
  implementation until P4/P6.
