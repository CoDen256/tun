# Pitfall register

Severity: **🔴 will bite you** · **🟡 annoying** · **🔵 ops**

## 🔴 Will bite you

| # | Pitfall | Handling |
|---|---|---|
| P01 | Removing a published card leaves a **live but blank** progress record — `if(!N&&!E&&!X) getCard(ID)` finds nothing | Append-only. Retire via a disabled deck. |
| P02 | A bundle that crashes at startup **bricks the install** — device never syncs again, cannot be told to roll back | `boot-ok-<buildId>` marker + native skip after 2 failed attempts (D08) |
| P03 | **Reordering `Cards[]` silently skips cards forever.** `PullCounter` is a block index into the array (5 per pull), stored in synced userdata | Append only, never reorder (D24) |
| P04 | `if (doc.exists)` guard — a **missing server document silently disables every write** | Shim creates on first use; never return `exists:false` for a known device |
| P05 | `accountCreationDate.toDate()` — Firestore `Timestamp`, not `Date` | Shim revives ISO strings into objects exposing `.toDate()` |
| P06 | All writes are awaited network calls; **no offline queue exists today** | Optimistic local doc + flush queue inside the shim |
| P07 | Card ID must be **exactly 6 chars** (`slice(0,6)` in mods 2110/2112/2124/2131) | `C20` + 3 digits; 999/deck; rollover decks |
| P08 | A category's decks must occupy a **contiguous range** of the deck array (`findIndex(first)…findIndex(last)+1`) | Append C20–C29 after C17 as one block; never interleave |
| P09 | **Bundle size → JSC parse time.** 6 MB today; ~10k custom cards with inflection tables adds roughly 5 MB. Gzip fixes transfer, not parse | Keep card HTML lean. **Measure cold start before and after.** This is the scaling ceiling of the regeneration approach (D03) |
| P10 | Publishing a **small batch** puts one card's occurrences in the same pull block | Hold until ≥6 ready per deck; small batches acceptable but cluster on introduction day only (D25) |

## 🟡 Annoying but manageable

| # | Pitfall | Handling |
|---|---|---|
| P11 | `completedSessions == 0` blocks `updateSetting` on a fresh install | Expected behaviour — do not debug it as a bug |
| P12 | `getUserData` runs **only** on Google/Apple sign-in → no restore path exists | Restore = write `persist:primary` into AsyncStorage before rehydration, from a bundle-side startup hook |
| P13 | Legacy `totalCards` read path lz-string-decompresses a base64 string | Keep the branch |
| P14 | Custom audio filenames could collide with `res/raw` | Discriminate on ID prefix; stock path stays byte-identical |
| P15 | YouTube cue timings run 200–400 ms off; sentences split across cues | Capture wide + padded, trim at triage |
| P16 | NAOB has no public API (scraping) and is often unavailable | Cache hard; degrade to ipa-lookup → espeak; always record which provider answered |
| P17 | Norsk ordbank: one surface form, several lemmas (`skinner` = verb or noun pl.) | `/inflect` returns **candidates**; triage picks; never auto-pick |
| P18 | Duplicate captures of the same word | Dedup key (lemma + pos + type); extension shows "already have this" |
| P19 | The extension depending on the server for its core feature | Fast local translator first, smia enriches async (D32) |
| P20 | Editing a grammar rule requires republishing every card carrying it | Builder tracks rule → cards and marks them dirty |
| P21 | Blob refcounting — a re-trimmed clip orphans its old blob | Refcount or periodic GC; never delete a blob referenced by a published build |
| P22 | Non-premium code path filters `Cards[]` to `P === "N"` **before** slicing, so `PullCounter` indexes a different array | The app ships unpatched (D68 — no paywall bypass is planned), so this is the branch every build runs: set `P:"N"` on all custom occurrences, or they are silently invisible to `PullCounter` |

## 🔵 Ops

| # | Pitfall | Handling |
|---|---|---|
| P23 | ~~The OTA token is baked into the APK and **frozen forever**~~ ⚠️ **CORRECTED 2026-10-20** — the baked-in pair is only the *bootstrap*. Because a JS bundle can write `config.json` (D39), the OTA URL **and** token are rotatable by publishing, as long as one good bundle is live | Scope the token to `GET /ota/*` only. Rotation procedure: publish a bundle that writes the new `config.json`, confirm the device picked it up via the heartbeat, *then* retire the old token |
| P24 | Backups must cover Postgres **and** the blob store | Blobs are content-addressed → incremental sync is trivial. Easy to forget |
| ~~P25~~ | ~~Hosting product type~~ | **RESOLVED: Contabo VPS, 8 GB / 100 GB** — Docker-capable |
| P26 | Rebasing onto a newer APK's bundle renumbers module ids | bundle-tool already locates modules by shape, not id — preserve that property in every new patch |
| P27 | **An assertion comparing two empty strings reports PASS.** `ota-verify.sh` once reported *5 passed* on a run where nothing downloaded at all — including the D49 gzip check that is unfixable after the APK ships | Fixed 2026-10-20: `eq()` rejects empty operands, `body()` requires a non-empty download, and the script aborts before the bundle section if `current.json` is unusable. **Any future assertion must fail closed on missing data** |
| P28 | **A proxying CDN in front of `/ota/*` breaks D49.** Cloudflare's orange cloud re-encodes bodies (Brotli, content modification on some plans), so the sha256 native computes would differ from the published one — permanently rejecting every build. It also intercepts the HTTP-01 challenge, so Caddy can never issue a certificate | The DNS record must be **grey-clouded (DNS only)**. `ota-verify.sh` now WARNs when an intermediary answers |
| P29 | **Expo constructs `Package`s from the Application constructor, before `attachBaseContext()`.** Any `Context` *method call* at registration time NPEs and kills the process before launch — and it happens outside the native patch's own try/catch, so the embedded-asset fallback never runs | Store the `Context`, call nothing on it until `getJSBundleFile`/daemon time (D69). The fallback tiers protect against a bad *bundle*, never against a bad *registration* |
| P30 | **GC's own retention policy can silently defeat rollback.** Rollback relies on `bundle-<id>.js` still existing for an older build (D26); GC keeps "the two newest boot-ok'd" ones on purpose (D65) — so a rollback target one GC cycle stale would have no file, while one still in the keep-set does. The refresh code's existing-file check didn't distinguish "already fetching/active" from "on disk but unpromoted", so the second case silently never wrote `pending` | Fixed by D71. **The lesson for any future on-device state machine here: an early-return guarded only by "does the file exist" is never enough — always ask whether the *token* (`active`/`pending`) already reflects that fact before treating file-presence as "nothing to do"** |
| P31 | **Rotating `config.json`'s token away from the baked-in default, then separately testing malformed-config fallback, can brick the OTA channel with no software-only recovery.** Malformed config correctly falls back to the *compiled-in* token (D39) — but if that token is already dead server-side from an earlier rotation, the fallback has nothing to land on. No `run-as`/root means nothing already running on-device can repair `config.json` without a fetch, and the fetch is exactly what's broken | Found and recovered 2026-10-22 (D72). Fixed by rebuilding with the current token as the new baked-in default (D66: cheap for this operator) and reinstalling (same signing key, upgrade in place, no data loss). **Rule going forward: never let the baked-in token go stale relative to the server without an immediate rebuild** — test malformed-config fallback while the baked-in token is still valid, not after a rotation |
| P32 | **A `BEGIN…COMMIT` around one step of a multi-step write (mint, then save, then publish) doesn't protect the whole operation — it just moves where a partial failure leaves a permanent trace.** `builder`'s `mintCardSlots` correctly transactions *itself*, but that's not the same as the overall mint→save→publish sequence being atomic | Found 2026-10-25 (D86), independent review, not yet fixed. **The lesson for any future multi-step write across a durable ledger and a derived artifact: the transaction boundary has to match the unit that must succeed or fail together, not just the one step that happens to touch a database** |
| P33 | **A threshold justified by one property (here: lag-11 needs room to separate a card's own occurrences) can get applied uniformly to cases where that property doesn't hold (single-occurrence note types, which have nothing to separate).** The data model's own table said as much ("n/a — no intra-card lag needed") but the implementation didn't carry the exception through | Found 2026-10-25 (D87). **The lesson: when a rule's justification is conditional, check that the code's application of the rule carries the same condition — don't let "when in doubt, apply the stricter rule everywhere" silently cost something real (publish latency) where the stricter rule was never justified** |
| P34 | **Checking a sibling repo's documented contract instead of its actual shipped code can make a recorded gap wrong the moment it's written**, if the sibling implementation already moved past its own spec. D83 called an endpoint "not existing" 24 minutes after it was added, because the check was against stabbur's `design.md`, not `stabbur`'s `routes/notes.py` | Found 2026-10-25 (D89). **The lesson: for a fast-moving cross-repo dependency, grep the other repo's actual routes/code before recording a gap as unresolved — the contract document is a lower bound on what exists, not an upper one** |

