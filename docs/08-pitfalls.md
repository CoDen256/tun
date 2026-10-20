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
| P19 | The extension depending on Strato for its core feature | Fast local translator first, smia enriches async (D32) |
| P20 | Editing a grammar rule requires republishing every card carrying it | Builder tracks rule → cards and marks them dirty |
| P21 | Blob refcounting — a re-trimmed clip orphans its old blob | Refcount or periodic GC; never delete a blob referenced by a published build |
| P22 | Non-premium code path filters `Cards[]` to `P === "N"` **before** slicing, so `PullCounter` indexes a different array | The paywall patch keeps you on the premium branch; still set `P:"N"` on all custom occurrences for consistency |

## 🔵 Ops

| # | Pitfall | Handling |
|---|---|---|
| P23 | The OTA token is baked into the APK and **frozen forever** | Scope it to `GET /ota/*` only. Every other token is carried in the bundle — and is therefore rotatable by republishing |
| P24 | Backups must cover Postgres **and** the blob store | Blobs are content-addressed → incremental sync is trivial. Easy to forget |
| P25 | Strato product type | Docker compose needs a VPS/root server, not shared hosting |
| P26 | Rebasing onto a newer APK's bundle renumbers module ids | bundle-tool already locates modules by shape, not id — preserve that property in every new patch |
