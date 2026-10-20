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

Minimum for the device to have something to talk to. **No application code**
(D55) — every device-facing path is a static file served by Caddy. Postgres and
`hub` arrive with P4/P5.

**DONE — deployed and verified on the Contabo VPS, 2026-10-20.**
`bin/ota-verify.sh` printed 16/16 against the live host. See `DEPLOY.md`.

- [x] `compose.yaml` (caddy now, postgres behind a profile, the rest commented)
- [x] `caddy/Caddyfile`: `/ota/*` token-gated and GET-only, `current.json`
      `no-store`, bundles and blobs `immutable`, transport gzip only (D49)
- [x] `bin/ota-publish.sh` — publish and rollback, with the guards that matter:
      no buildId reuse for different bytes, filename-safe ids, magic-prefix
      check, https-only
- [x] `bin/ota-verify.sh` — the acceptance test, 16 assertions, all passing
      against `caddy:2-alpine` with the stock 6 MB bundle as `b000001`
- [x] Provision the Contabo box, point DNS (**grey cloud / DNS-only — D57**),
      open 80/443
- [x] `docker compose up -d`; certificate issued
- [x] Published build #1 and `bin/ota-verify.sh` printed **16 passed, 0 failed
      on the VPS**. Re-published 2026-10-20 from the **v1.5.12 base**
      (`sha256 b3ad6aee…5741`, 6 003 611 B) after the earlier artifact was
      found to be the v1.5.10 patched bundle — wrong app version for the APK
      being built (D60)
- [ ] ⚠️ `b000001` is a **placeholder**: the plain base bundle with **no JS
      companion**, so once the native patch exists it writes no
      `boot-ok-<buildId>` and is quarantined on its third launch. It must be
      replaced by *base bundle + companion* under a **new** buildId before the
      patched APK is installed
- [x] Hardened the test itself: it no longer reports PASS on empty values
      (P27) and warns when a proxying CDN answers (P28)

## P2 — The one APK build

**Irreversible. Everything that will ever need native must be in this build.**
The contract it implements is frozen in **`11-ota-contract.md`** — Q11–Q16 are
settled there. Build against that document, not against memory.

- [x] **Q17 resolved statically (D56)** — `documentDirectory` *is*
      `getFilesDir()`; no device check needed. Native uses `getFilesDir()`
- [ ] 6th `Package` in `ExpoModulesPackageList$LazyHolder` →
      `ReactNativeHostHandler.getJSBundleFile()`
- [ ] Stale-while-revalidate fetch, `.tmp` → verify → atomic rename, all on a
      background thread; `getJSBundleFile()` does zero network I/O
- [ ] Three-tier fallback: fetched → cached → `assets://index.android.bundle`
- [ ] Boot watchdog per §4: attempt marker written before handover, `bad-<id>`
      never auto-cleared, `active` rewritten whenever a tier is skipped (D54)
- [ ] `config.json` escape hatch (D39) and `https`-only enforcement (D53)
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

**P1 is live.** The device-facing path is deployed on the Contabo VPS and
verified 16/16 (2026-10-20). **Q11–Q17 are all settled** — the wire contract,
on-device layout, both validity tests, watchdog semantics, the config escape
hatch, hash-not-signing (D48–D57) and `documentDirectory` == `getFilesDir()`
(D56, resolved statically).

**Nothing blocks P2 except one housekeeping item.**

1. **Untangle the two patch histories** in `/home/coden/rev/mjolnir/` (below).
   Ten minutes, and the native patch is applied on top of whichever is
   authoritative — getting this wrong means building the frozen APK on the
   wrong base.
2. **Open `p2-native-ota` as an OpenSpec change in the `mjolnir` repo**, built
   against `11-ota-contract.md` §2–§5 — not against memory. The contract is
   frozen; implement it, do not relitigate it.
3. **Write, build, sign, install.** Then verify all three fallback tiers, the
   watchdog, and rollback by repointing `current.json` at an older buildId.

⚠️ P2 is the only irreversible step in the project. Everything else is fixed by
redeploying a file. Do not ship the APK the same day you write it.

### Prerequisites still open

- `/home/coden/rev/mjolnir/smali.merged.mjolnir/assets/.git` holds 4 commits
  (`07b26ed`, `101a0be`, `b5cc8df`, `f6c42e7`) whose hashes do **not** match the
  three paywall patches recorded in `mjolnir/docs/findings.md` §7
  (`0f6f580`, `b962691`, `a1f8f1f`). There are two patch histories in that
  workspace. **Untangle which is authoritative before building on either.**
- `stabbur` and `smia` are scaffolded (README + CLAUDE.md only); no
  implementation until P4/P6.
