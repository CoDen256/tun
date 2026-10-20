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

Written and **proven locally against the real image** (2026-10-20); what is
left is provisioning. See `DEPLOY.md`.

- [x] `compose.yaml` (caddy now, postgres behind a profile, the rest commented)
- [x] `caddy/Caddyfile`: `/ota/*` token-gated and GET-only, `current.json`
      `no-store`, bundles and blobs `immutable`, transport gzip only (D49)
- [x] `bin/ota-publish.sh` — publish and rollback, with the guards that matter:
      no buildId reuse for different bytes, filename-safe ids, magic-prefix
      check, https-only
- [x] `bin/ota-verify.sh` — the acceptance test, 16 assertions, all passing
      against `caddy:2-alpine` with the stock 6 MB bundle as `b000001`
- [ ] Provision the Contabo box, point DNS, open 80/443
- [ ] `docker compose up -d`; confirm the certificate is issued
- [ ] Publish the stock bundle as build #1 and run `bin/ota-verify.sh` **on the
      VPS** — it must print 16/16 before any native code depends on this

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

**Q11–Q16 are settled** (2026-10-20) in `11-ota-contract.md` — the wire
contract, on-device layout, the two validity tests, watchdog semantics, the
mandatory config escape hatch and hash-not-signing. ADRs D48–D55.

Next, in order:

1. **Deploy P1 to the Contabo box (~1h).** The stack is written and passes
   locally; `DEPLOY.md` is the procedure. Provision, point DNS, `up -d`,
   publish build #1, run `bin/ota-verify.sh` on the box.
2. **Q17 on the phone.** Log `FileSystem.documentDirectory` from a dev build and
   compare it to `getFilesDir()`. This gates the native patch and nothing else
   can substitute for it — the answer gets frozen into the APK.
3. **Untangle the two patch histories** in `/home/coden/rev/mjolnir/` (below).
4. **Then write smali**, against `11-ota-contract.md` §2–§5.

### Prerequisites still open

- `/home/coden/rev/mjolnir/smali.merged.mjolnir/assets/.git` holds 4 commits
  (`07b26ed`, `101a0be`, `b5cc8df`, `f6c42e7`) whose hashes do **not** match the
  three paywall patches recorded in `mjolnir/docs/findings.md` §7
  (`0f6f580`, `b962691`, `a1f8f1f`). There are two patch histories in that
  workspace. **Untangle which is authoritative before building on either.**
- `stabbur` and `smia` are scaffolded (README + CLAUDE.md only); no
  implementation until P4/P6.
- **Q17** (`documentDirectory` vs `getFilesDir()`) is unanswered and blocks P2.
