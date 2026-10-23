# Roadmap

The project is large. This file exists so that "what do I do next?" always has a
one-line answer.

## Shape of the dependency graph

Ordering revised by **D40**: the native patch comes first. It does not depend on
the cold-start answer, and once OTA works, testing a padded bundle is a file copy
to the VPS instead of a full APK rebuild — so doing it first makes P0 *cheaper*.

```
  P1 ✅ ──► P2 ✅ ──► P3 ✅ ──► P0 (open) ──► P4 content ──► usable
  OTA     native OTA    first         cold-start     spine       with
  server  + watchdog   payoff         (cheap now:                manual
                       (UI patch)     file copy)                 cards
                                            │
                              P5 sync swap ◄┘
                                   │
                              P6 smia ──► P7 capture ──► P8 triage UI ──► the full loop
```

**P1–P3 are done** (2026-10-20 → 2026-10-22). Everything before P4 was
**infrastructure with no visible payoff** — P4 is the first moment you put
your own card on your phone. That's next.

---

## P0 — Verify (open; not blocking P4)

Genuinely unmeasured — nothing here has been run. Doesn't block starting P4,
but should land before C20–C29 grows the deck enough to matter.

- [ ] **Q07 Cold-start parse time.** Push a bundle padded with synthetic cards
      (+5 MB) via OTA, measure launch time on the real phone — now a file copy,
      not a rebuild. If bad, D03 (bundle regeneration) has a ceiling.
- [ ] **Runtime check of `ExponentFileSystem` + `playUrl("file://…")`** — both
      confirmed present statically only; P4's audio delivery depends on this.
- [ ] **Q06 Type (d) behaviour.** Find one of the 58 stock `E`-only cards, run
      it, confirm front/flip/audio behaves as the type (d) design assumes.

## ~~P1 — Server skeleton~~ ✅ DONE (2026-10-20)

Minimum for the device to have something to talk to. **No application code**
(D55) — every device-facing path is a static file served by Caddy. Postgres and
`hub` arrive with P4/P5. Deployed and verified on the Contabo VPS; the
original `b000001` placeholder-without-companion issue (D60) was superseded
once the companion pipeline existed — every build since `b000002` carries one.
See `DEPLOY.md`.

## ~~P2 — The one APK build~~ ✅ DONE, proven on device (2026-10-22)

**Was irreversible; now shipped.** Implements the contract frozen in
**`11-ota-contract.md`**. Full acceptance gate (happy path + watchdog positive
+ rollback + config rotation, both halves) proven with device logcat traces —
see `12-p2-results.md` and **D73**. Two real bugs found and fixed along the
way (**D71/P30**, **D65**), neither a contract defect. Archived OpenSpec
change: `mjolnir/openspec/changes/archive/2026-10-22-p2-native-ota/`.

**Every future change is now a file on the server.**

## ~~P3 — first OTA-shipped payoff~~ ✅ DONE (2026-10-22)

The original plan here (mod 1440 audio resolver, a prefetcher module) needs
real audio content to test against, which doesn't exist until P4 builds
`stabbur`. **D68** replaced it with a cheaper, more useful proof: a UI patch on
the "My account" screen showing the running `buildId`, shipped with zero APK
rebuild. Proves the whole premise — a bundle-only content change reaching the
device — and the observability it adds (`MJOLNIR_BUILD_ID` + the My-account
row) is reused by every OTA bundle from here on, not a one-off.

The deferred audio-resolver/prefetcher work resurfaces naturally once P4 has
real audio blobs to serve — not scheduled as its own phase.

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

**P1–P3 are all done.** The server is live, the native OTA patch is live and
its entire acceptance gate (happy path + all recovery paths) is proven on
device, and the first real content payoff shipped as a file with no APK
rebuild. See `12-p2-results.md` for the full trace, D73 for the closing record.

**Designing P4 — the content spine**, the first moment content is published
through a real pipeline rather than a hand-built test bundle. Not yet an
OpenSpec change — still working out the data model and what `builder` actually
does before writing a proposal:

1. `stabbur` schema: items, decks, `card_slots`, publications, `build_jobs`.
2. Projector: item → `{N,E,X,D,A}` + occurrences, per the five card types.
3. `builder` worker invoking `bundle-tool` as a library.
4. Hand-write 10 cards, publish, study them on the phone.

### Standing operational rule (D72/P31)

Never let the baked-in OTA token go stale relative to the server. If you ever
rotate it again, rebuild with the new value as the baked-in default in the
same sitting — don't leave a window where the only fallback is already dead.
