# Mjølnir reverse-engineering notes

> **Read the "Corrections and additional findings (2026-10-20)" section at the
> end before trusting §2 and §6** -- two statements there are wrong.
> Ecosystem design built on this document: `tun/docs/README.md`.

App: `com.lightblitzlearning.mjolnir` (Expo + React Native, JSC bundle — not Hermes
bytecode). Decompiled APK: `/home/coden/rev/mjolnir/0306.orig/orig/smali.merged.mjolnir`.

## 1. Deck/card data model

Two `data`-classified modules in `index.android.bundle`, located by element shape
(not a fixed id — survives renumbering across builds):

- **Deck catalog** (`2111` in the build we've been editing) — array of decks.
  Elements have a `Cards` property.
- **Card content** (`2113`) — array of cards. Elements have a `DECK_ID` property.

**Deck shape:**
```js
{
  ID: 42, PullCounter: 0, Name: "C16", Code: "16", Enabled: true,
  Title: "Current Affairs & Society",
  Description: "...",
  Counter1: "50 cards",                    // display string
  Counter2: "<b>×2</b> (front, back)",      // display string, contains HTML
  MaxInterval: 10, AutoTickStreak: 1, AutoHammerCount: 2,  // SRS pacing knobs (deck-level)
  Cards: [ { Card: "C16001N", P: "N" }, ... ]  // occurrences, see §2
}
```

**Card shape:**
```js
{
  DECK_ID: "C16", ID: "C16001",
  N: "<div>...</div>",   // front (question)
  E: "<div>...</div>",   // back (answer)
  D: "...",               // deck title, redundant copy
  X: "<div>...</div>",   // extra/example content
  A: "N" | "E" | "X",     // which of the above fields the audio is attached to
}
```

Category = `deck.Name[0]` (first letter: `Z`/`A`/`B`/`C` observed).

## 2. What N / E / X / A actually mean

- **N** — front of the card (question side).
- **E** — back of the card (answer side).
- **X** — extra/example content (a third, optional side).
- **D** — just the deck title again, redundant, not shown as a "side."
- **A** — *not* audio content. It's a pointer: which of N/E/X the card's audio
  clip is attached to. Confirmed domain across the whole bundle: only `N`, `E`,
  `X` ever appear (2790 cards: ~1914 `N`, ~822 `E`, ~54 `X`).

## 3. Card "occurrence" — what the deck.Cards[] entries mean

A deck's `Cards[]` array is **not** a simple list of its cards — it's the actual
**presentation sequence**. A card can appear more than once, once per side it's
quizzed on. Each entry:

```js
{ Card: "<cardId><letter>", P: "N" }   // e.g. "A03005E"
```

- The **trailing letter of `Card`** (`N` / `E` / `A`) is the real direction —
  which side gets shown when that occurrence comes up: `N` = front presented,
  `E` = back presented, `A` = audio-only presented (full info "covered" by the
  clip, nothing shown visually).
- **`P` does *not* correlate with the direction letter** — it's an independent
  per-occurrence flag (observed values `N`/`Y`). We confirmed this directly:
  deck `A03` has `P:"Y"` entries whose `Card` suffix is `N`, `E`, *and* `A` —
  all three. **`P` is the free/premium gate**: `P:"N"` = included in the free
  tier, `P:"Y"` = premium-only (gated behind the paywall/subscription). This
  is orthogonal to the direction letter, which lives purely in `Card`'s last
  character. **Any tooling that edits `Cards[]` should set `P` deliberately
  for that reason** — it controls monetization, not presentation — and derive
  direction purely from the `Card` string's last character, independent of it.
- Most cards have a single occurrence (`N` only). Some decks are genuinely
  multi-occurrence — e.g. deck `A03` has cards with `N`+`E`, or all of `N`+`E`+`A`.
- Order inside `Cards[]` *is* the presentation order for that deck.

## 4. How the JS bundle gets loaded (and how to make it self-updating)

Stock behavior: `ReactNativeHost.getJSBundleFile()` always returns null →
Android loads `assets://index.android.bundle`, baked into the APK at build
time. **No OTA/self-update mechanism exists in this app today** (no CodePush,
no expo-updates, no custom downloader — checked, confirmed absent).

But the app is built on Expo, and Expo's own plumbing already has an unused
hook for exactly this:

```
ReactNativeHostWrapperBase.getJSBundleFile()
      │  lazy sequence over reactNativeHostHandlers, first non-null wins
      ▼
reactNativeHostHandlers  ←  built from a hardcoded array in
                             ExpoModulesPackageList$LazyHolder's <clinit>
                             (currently 5 Package instances, none of which
                             implement a real getJSBundleFile — all fall
                             through to Kotlin's default-interface no-op)
      │
      ▼  (if every handler returns null)
falls back to assets://index.android.bundle
```

To make the app fetch-then-fallback, the smali patch needed is small:

1. One new class implementing `Package`, whose `createReactNativeHostHandlers()`
   returns one object implementing `ReactNativeHostHandler`. Only
   `getJSBundleFile(useDeveloperSupport)` needs a real body (return `null` when
   `useDeveloperSupport` is true — never interfere with Metro/dev reload).
2. Bump `ExpoModulesPackageList$LazyHolder`'s package array from 5 → 6 entries.
3. The handler's logic: do the network fetch on a worker thread with a hard
   wall-clock timeout (so a slow/unreachable server never risks an ANR),
   validate the response (size + `starts with "var __BUNDLE_START_TIME__"`)
   before trusting it, write to a `.tmp` file and atomically rename over the
   real destination on success. Any failure path just returns `null`, which
   transparently falls back to the embedded asset — the app can never end up
   in a broken state from a bad fetch.
4. Permissions already granted (`INTERNET`, `WRITE_EXTERNAL_STORAGE`,
   `RECEIVE_BOOT_COMPLETED`, `FOREGROUND_SERVICE`) — nothing new to declare.

One decompile → patch → rebuild → re-sign (the merge/align/sign pipeline
already exists in `0306.orig/`) → reinstall. Breaks Play Store updates for
this install permanently (expected, given it's a resigned sideload). After
that one patch, every future bundle change is just a file swap on the server
— no more APK rebuilds.

### 4a. The JS-side companion (boot-ok marker, config rotation, debug reporter)

The native loader (P2) depends on a JS half that writes the `boot-ok-<buildId>`
watchdog marker (D52). It is **redeployable JS**, and three facts let it attach
to the bundle without touching a single existing module byte:

- The bundle is **not IIFE-wrapped** — it opens `var __BUNDLE_START_TIME__=…`
  and `__r` is a genuine global. It ends with the entry calls
  `__r(160);\n__r(0);` followed by `//# sourceMappingURL` / `//# debugId`
  comments. So **top-level code appended after the entry call runs at startup**,
  right after module 0 registers the root component
  (`AppRegistry.registerComponent(<cfg>.name, () => App.default)`).
- A native module is reachable two ways. `requireNativeModule(name)` (module
  2150) is `ensureNativeModulesAreInstalled(); globalThis.expo?.modules?.[name]
  ?? NativeModulesProxy.default[name] ?? null`. The bare
  `globalThis.expo.modules.<Name>` path is **not** equivalent — it skips the
  install call and the proxy fallback. The companions therefore try
  `__r(2150).requireNativeModule('ExponentFileSystem')` first and keep the bare
  path only as a fallback: if that shortcut ever yielded `undefined`, no
  `boot-ok` would be written and **every** build would be quarantined on its
  third launch, silently, looking like a native bug. Either way gives
  `documentDirectory`, `writeAsStringAsync`, `makeDirectoryAsync`,
  `readDirectoryAsync` with **no dep-array edit** — `__r` is keyed by absolute
  module id, so no dependency entry is required. (The patch system's `patchback`
  rewrites only a module's factory *body* and re-emits the original
  `__d(…, id, [deps])` tail — it *cannot* add a dependency — which is exactly
  why the dep-free `globalThis.expo.modules` route matters.)
- `documentDirectory` is the `file://…/files/` URI form **with a trailing
  slash**; native addresses the same markers via the bare `getFilesDir()` path
  (D56). Both resolve to the same file — the scheme asymmetry is correct, not a
  bug to "fix."

Mechanism: `bundle-tool companion <in> <out> <companion.js> [--build-id <id>]`
(`src/commands/companion.js`) substitutes `__MJOLNIR_BUILD_ID__` and splices the
snippet in **before the sourcemap comments, after `__r(0);`**, modifying zero
module bytes. The companions live in `patches/js/`:
`boot-ok-companion.js` (the marker writer; a 3 s timer that fires only if the
process survives, with a bounded retry while expo modules finish installing),
`config-rotate.js` (exposes `globalThis.__mjolnirRotateOtaConfig(url, token)`,
https-only — D39/D53), and `ota-debug-report.js` (debug-only; logs the
`mjolnir-ota/` state to logcat under `ReactNativeJS`, corroborating native's
D63 breadcrumb). The buildId is substituted at build time because the publish
pipeline that would bake it does not exist in `mjolnir` yet (publishing today is
`tun/bin/ota-publish.sh`); pass the **same** id to that script so the marker
pairs with `bundle-<id>.js`.

## 5. Audio: no native patching needed at all

Audio files live in `res/raw/` (e.g. `a01001.mp3`), one per card id, 2870
files / 52MB, baked into the APK. Playback goes through
`react-native-sound-player` (`com.johnsonsu.rnsoundplayer`), whose native
module **already exposes `playUrl(url)`** alongside the local
`playSoundFile(name, ext)` — no smali changes required.

Every audio call in the app funnels through one JS wrapper, module `1440`:
```js
playSoundFile: function (n, o) { s.playSoundFile(n, o); }   // s = NativeModules.RNSoundPlayer
```
Patching this single function (not the many scattered call sites in modules
like `2013`/`1439`) covers every play-call in the app:
```
if audio server reachable (checked once per session, cached):
    s.playUrl(`${AUDIO_BASE_URL}/${name}.${ext}`)
else:
    s.playSoundFile(name, ext)      // unchanged original behavior
```
This is a pure JS-bundle edit — it ships the same way as any other bundle
change (no separate native patch), and is independently deployable today via
the existing `deobfuscate` → edit → `patch-back` pipeline, even before any OTA
mechanism exists.

## 6. How card/progress data is synced ("backup")

Backend: **Firebase** — Firestore (`@react-native-firebase/firestore`) +
Firebase Auth + one Cloud Function (`deleteUser`). Not a custom server.

```
Collection: "userData"
Document:   userData/{uid}        — one per Firebase Auth user
```
Sync logic lives entirely in module `2080` (`initUserData`, `updateUserData`,
`updateSessionUserData`, `getUserData`, `deleteUserData`). Every op refreshes
`currentUser.getIdToken()` first; several writes silently no-op if there's no
signed-in user (guest/offline installs never sync).

Document shape (defaults in `S()`, module 2080):
```js
{
  completedSessions, totalCards: [...],      // see below
  gameDecks, lastDeckPulled, restDays, dailyCards: 15,
  reminderSetting: [{days, hour, minute}, ...],
  decksStatus, selectedApproach, hasSeenMjolnirWay: {firstPage, lastPage},
  surveyAnswers, accountCreationDate,
  archivedCards, inProgressCards,            // derived counts, not source of truth
  firstSessionsCompleted, lastCompletedSession,
  consistencyRate,                           // sessions / days-since-signup, capped at 1
  acquisitionSource, marketingSurveySeen, hasSeenPaywall,
}
```

`totalCards` is the actual per-card SRS state. On write, each card's `N`/`E`/`X`
HTML is stripped before upload (`{N,E,X,...rest} → rest` — no point syncing
content that already lives in the bundle; it's re-fetched locally via
`getCard(ID)` on read). On read there's a legacy fallback: if `totalCards` is a
string, it's `lz-string`-decompressed from base64 + `JSON.parse`'d — an older
storage format; current writes store it as a plain array.

`decksStatus` restore (`decksLogic.initDecksStatus`, module 2110 — stock app
code, patched by `2110-decks-logic`, OpenSpec `pull-decks-status-replace`) is
a full replace built from the incoming array, same as `totalCards`: any local
deck whose ID is absent from the server's `decksStatus` ends up absent from
the restored result too (falling back to the static per-deck default only
for fields the incoming `{ID, PullCounter}` entry doesn't carry), not left at
its pre-restore value. The stock version upserted by ID instead, silently
leaving unmatched local entries untouched — both the manual-pull companion
and mod 2205's sign-in restore call this same function and rely on the fix.

**Per-card progress record** (from the actual scheduler, module `2119`):
```js
{
  ID, language, DECK_ID,   // !! `language` is the DIRECTION letter N/E/A -- see C1
  Stage: number,       // 0 = brand new, climbs with successful reviews (200+ = graduated)
  Park: boolean,        // true = archived — this is the "archived cards" flag
  Postponed, Graduated: boolean,
  Type: "brand" | "same" | "prev",   // brand=new today, prev=due again
  Time: epoch-ms,       // last-touched — "next due" is derived from this, not stored
  CF: number,            // unclear exact meaning (some correctness/confidence factor)
  AutoParkHit, AutoTagHit, numberOfReschedulings: number,
}
```

**No explicit next-review-date field exists.** Due-ness is derived at
day-granularity:
```js
Bt(dayjs(card.Time).subtract(4,'h'), dayjs().subtract(4,'h')) <= 0   // due
```
`Bt` just diffs two dates as `YYYYMMDD` integers. The `subtract(4h)` everywhere
means the app's "day" rolls over at **4am local time**, not midnight. This
isn't a classic SM-2 algorithm (no `easeFactor`/variable `interval` per card)
— it's a simpler staged/box system.  **[WRONG — see C2. `CF` *is* an ease factor
and mod 2133 holds the interval tables.]** The deck-level `MaxInterval` /
`AutoTickStreak` / `AutoHammerCount` fields (§1) are almost certainly the
coarser pacing knobs (new cards/day, how forgiving a miss is), separate from
per-card `Stage`. Exactly how `Stage` maps to day-gaps wasn't fully traced —
would need a deeper read of `drawNewCards`/session-building logic in module
`2119` to pin down.

---

# Corrections and additional findings (2026-10-20)

Two statements above are **wrong**; several gaps are now filled. This section
supersedes anything that contradicts it.

## C1. `language` is not a language — it is the direction letter ⚠️ CORRECTION

§6's progress record lists a `language` field without explanation. It holds the
**occurrence direction letter** (`"N"` / `"E"` / `"A"`), taken from the last
character of the occurrence string:

```js
// mod 2110, drawNewCards
k.language = p.card.substr(p.card.length - 1);   // "A05001E" → "E"
k.DECK_ID  = p.deck;
```

Every progress lookup keys on the **triple** `{ID, language, DECK_ID}`
(mods 2110, 2124, 2131):

```js
t.ID === e.card.slice(0,6) && t.language === e.card.substr(e.card.length-1) && t.DECK_ID === e.deck
```

**Therefore each occurrence of a card is scheduled independently.** A card with
occurrences `A`, `E`, `N` holds three separate SRS states, not one.

## C2. It *is* SM-2-shaped — `CF` is the ease factor ⚠️ CORRECTION

§6 says "This isn't a classic SM-2 algorithm (no `easeFactor`/variable `interval`
per card)". Mod **2133** holds the tables, in **minutes**:

```js
GraduationStage: [                       // pre-graduation learning steps
  {Hard: 1,   OK: 2,    Easy: 5},
  {Panic: 1,  Hard: 2,  OK: 5,    Easy: 10},
  {Panic: 1,  Hard: 3,  OK: 10,   Easy: 2880},
  {Panic: 1,  Hard: 5,  OK: 1440, Easy: 2880},
]
CFStage: [                               // post-graduation
  {Panic: 1, VeryHard: 5,  Hard: 15,   OK: 2880, Easy: 4320},
  {Panic: 1, VeryHard: 5,  Hard: 1440, OK: 4320, Easy: 7200},
  {Panic: 1, VeryHard: 10, Hard: 2880, OK: 5760, Easy: 8640},
]
CF4: { Hard: {min:25,  max:80,  value:50},     // percentages — an EASE FACTOR
       OK:   {min:110, max:200, value:137.5},
       Easy: {min:150, max:500, value:180} }
```

1440 = 1 day, 2880 = 2 d, 8640 = 6 d. Minute-granularity learning steps
graduating into day-granularity — which is why the 4 am rollover only appears in
the dueness check. `CF` is an ease factor in percent. The exact transition logic
in mod 2119 is still not fully traced.

Mod 2133 also holds `globalOptions` (tutorial flags, study schedule, `AutoPark`,
`AutoTag`, `FreshPark`, font/skin) and `options.newDailyCards: 5`.

## C3. Card IDs are exactly 6 characters — hard-coded

```js
// mod 2112 — the card index
getCard(t) { return 6 == t.length ? this.cards[t] : this.cards[t.substr(0, 6)]; }
```

plus `card.slice(0, 6)` in mods **2110, 2124, 2131**. Occurrence strings are
therefore exactly 7. Any generated card id must be 6 chars.

## C4. `PullCounter` is a block index — 5 occurrences per pull

```js
// mod 2110, drawNewCards
var v = 5 * PullCounter;
var u = premium ? deck.Cards.slice(v, v+5)
                : deck.Cards.filter(n => "N" === n.P).slice(v, v+5);
… deck.PullCounter++;
```

`PullCounter` lives in synced userdata (`decksInfo`). Consequences:

- **Appending to `Cards[]` is safe** — new entries land beyond the counter.
- **Reordering is catastrophic** — the counter then points at different cards and
  you silently, permanently *skip* some. (Duplicates would be caught by the
  `{ID, language, DECK_ID}` dedup at 2119:314; skips would not.)
- The non-premium branch filters to `P === "N"` **before** slicing, so the free
  tier indexes a different array entirely.

## C5. Occurrence statistics across all 2790 stock cards

| set | count |
|---|---|
| `EN` | 1124 |
| `N` | 987 |
| `AEN` | 376 |
| `A` | 278 |
| `AE` | 98 |
| `E` | 58 |

`A`-only and `E`-only are both well-used, so audio-only and answer-side-audio
cards are supported paths, not edge cases.

## C6. `Cards[]` ordering is minimum-lag re-insertion, not shuffling

```
C16 (50 cards × NE):
NNNNNNNNNNN ENENNENENNENENNENEN… EEEEEEEEEEEEEEEEEEEEEEEE
└─ 11 new ─┘ └ each E lands 11 behind its own N ┘ └ tail ┘
```

Measured minimum lags per deck do **not** correlate with `MaxInterval`,
`AutoTickStreak` or `AutoHammerCount` — C13–C17 are structurally identical and
all use 11, while A08 and B08 use 1. Different authoring batches, different
recipes. C13–C17 is the cleanest, clearly machine-generated family.

A lag of 11 is meaningful given C4: with 5 occurrences per pull, lag ≥ 11 puts a
card's occurrences at least two pull-blocks apart.

## C7. The deck-list screen groups by `Name.charAt(0)` and needs contiguity

```js
// mod 2119
switch (I.default[l].Name.charAt(0)) { case "Z": … case "A": … case "B": … case "C": }   // no default
… findIndex(first of group) … findIndex(last of group) + 1
```

Four `useState` pairs hold the per-category index ranges (`Be/Ue`, `Le/tt`,
`Me/ot`, `qe/st`), plus a second `switch (F)` on the selected approach. So:

- A deck whose name starts with anything else is **invisible** in the UI.
- Each category's decks must be a **contiguous range** of the deck array.

Existing deck names (37): `Z01–Z02, A01–A11, B01–B14, C01, C03, C10–C17` —
note the gaps at C02 and C04–C09, and nothing after C17.

## C8. Sync semantics (mod 2080) and local persistence

- Every op is `.get()` then `.update()` → **read-then-field-merge**, not replace.
- `if (doc.exists)` guards mean a **missing document silently disables all writes**.
- `updateSetting` additionally returns early while `completedSessions == 0`.
- `accountCreationDate` is a Firestore **`Timestamp`** (`.toDate()`), not a `Date`.
- `getUserData()` is called from **exactly two places** — the Google and Apple
  sign-in success handlers (mods 2205, 2114). Nothing reads the server at startup.
- The Redux store is
  `createStore(persistReducer({key:"primary", storage: AsyncStorage, stateReconciler}, …))`
  (mod **953**) → local state lives under the AsyncStorage key **`persist:primary`**.

**Therefore: local is the working copy and Firestore is pure backup.** A restore
can be performed by writing `persist:primary` before redux-persist rehydrates.

## C9. Nothing native is needed for audio or file storage

- `expo/modules/filesystem/FileSystemPackage` is **one of the five packages
  registered** in `ExpoModulesPackageList$LazyHolder`, exposing `downloadAsync`,
  `getInfoAsync`, `makeDirectoryAsync`, `moveAsync`, `deleteAsync`,
  `readAsStringAsync`, `writeAsStringAsync`, `documentDirectory`, `cacheDirectory`
  under the native module name **`ExponentFileSystem`**.
- The JS bundle contains `requireNativeModule` / `NativeModulesProxy` /
  `expo-modules-core` (mods 2143, 2148–2150, 2171), so that module is reachable
  from a patched bundle with no native work.
- `RNSoundPlayerModule.playUrl` → `prepareUrl` →
  `MediaPlayer.setDataSource(Context, Uri)` — which accepts `file:///…`.
- Audio playback call site: `playSoundFile(r.ID.toLowerCase(), 'mp3')` (mod 2124),
  gated on the shown side matching the card's `A` pointer.

## C11. `drawNewCards` round-robins across every *selected* deck, not just one

C4 documented the single-deck slice (`deck.Cards.slice(5*PullCounter, +5)`).
The full picture, confirmed reading mod 2110 directly (2026-10-25): that slice
sits inside `drawNewCards(n, l, o, f, c, s)`, where `n` is the learner's
*selected* decks and `o` is the last deck drawn. The function round-robins
through `n` starting after `o`, pulling one ≤5-occurrence block from a deck
before advancing to the next, continuing until the session's target count
`l` is reached or every selected deck is exhausted. Studying with several
decks enabled therefore interleaves *across* decks within a session, for
free — real spacing, but probabilistic: it depends entirely on which decks
are selected and how much content each has, and provides nothing if the
learner studies one deck alone. `tun/docs/03-data-model.md`'s own
within-deck lag-11 guarantee (D91) does not rely on this; it's a bonus on
top, not a substitute — the stock C13–C17 decks encode their own guaranteed
spacing regardless of what else might be selected, which is the stronger
property to replicate.

---

# Corrections from real device data (2026-11-07)

Everything above was derived by **reading the bundle**. This section was derived
by **reading a real synced account**, and it contradicts §6 and C2 in three
places. Where they disagree, this section wins — it is measured, not inferred.

**Source.** The `userdata` row for account `3wEnqPaPO2cSg2WOqNt6FXuZZvC3` in
`tun/tun-backup/mjolnir.sql`, snapshot 2026-11-07T18:47Z: **4,510 occurrence
records** over 2,575 distinct cards and 37 decks, 3,597 of them archived. Large
enough that the identities below are not coincidences — several are exact set
equalities across thousands of rows, with zero exceptions.

Two things above are confirmed exactly by it, which is worth stating because it
calibrates everything else: `Σ PullCounter × 5` over all 37 decks equals **4,510**,
precisely the occurrence count (**C4** holds), and the stock corpus totals
**4,895 occurrences** (**C5** holds).

## R1. `Time` is the **next-due** timestamp, not last-touched ⚠️ CORRECTION

§6 states: *"`Time`: epoch-ms, last-touched — 'next due' is derived from this,
not stored"*, and then *"No explicit next-review-date field exists."* Both are
wrong. It is the other way around: the next-review date **is** stored, and the
last-touched date is what has to be derived.

- 1,397 of the 4,510 records carry timestamps in the **future**.
- No in-rotation occurrence is ever dated beyond **+30 days**, which is the
  largest `MaxInterval` any deck uses.
- §6's own quoted dueness test, `Bt(dayjs(card.Time).subtract(4,'h'),
  dayjs().subtract(4,'h')) <= 0`, is only coherent this way. Read as
  "last-touched", it marks every card ever reviewed before today as due.

## R2. `CF` is the **interval in days**, not an ease factor in percent ⚠️ CORRECTION

C2 corrected §6 by identifying mod 2133's `CF4` table as an ease factor in
percent (25–500%) and concluding *"`CF` is an ease factor in percent"*. The
table is an ease factor; the **stored field is not**. It holds the resulting
interval, in days:

- Observed range is **0–30**, never a percentage-shaped value.
- Across all 913 in-rotation occurrences, **`CF` never once exceeds its deck's
  `MaxInterval`** — 0 violations. 492 sit exactly on it, and every occurrence
  below the cap is strictly below (max observed ratio 0.97).
- Per-deck: `CF ≤ 10` in every `MaxInterval: 10` deck, `≤ 30` in every
  `MaxInterval: 30` deck, and so on for all six distinct cap values.

`CF4`'s percentages are the multipliers **applied** to `CF`; `CF` is the result.

## R3. `Stage` is a retirement tier, not a climbing ladder ⚠️ CORRECTION

§6 states: *"`Stage`: number, 0 = brand new, climbs with successful reviews
(200+ = graduated)"*. It takes exactly **four** values, and they are states, not
rungs:

| `Stage` | count | meaning |
|---|---|---|
| 3 | 913 | in rotation — the app will show this again |
| 200 | 3,015 | auto-retired at the ceiling (see R4) |
| 150 | 327 | parked before reaching a ceiling, interval retained (`CF` 0–29) |
| 100 | 255 | parked before reaching a ceiling, `CF` = 0 on **all** 255 |

And two fields carry less information than §6 implies:

- `Park` is true for **precisely** `Stage ≠ 3` — it is redundant with `Stage`.
- `Graduated` is `true` on **all 4,510 rows**. It distinguishes nothing. Any
  code branching on it is branching on a constant.
- `Postponed` is `true` on 4,509 of 4,510 — effectively a constant too.

## R4. The auto-park rule, pinned down ✅ CLOSES AN OPEN QUESTION

§6 ends: *"Exactly how `Stage` maps to day-gaps wasn't fully traced — would need
a deeper read of `drawNewCards`/session-building logic in module 2119."* The
snapshot answers it without reading 2119 at all:

> **`AutoParkHit` counts reviews survived *at* the deck's `MaxInterval`. On
> reaching the deck's `AutoHammerCount` (2 in every deck), the occurrence is
> retired to `Stage 200`.**

Proven as set equalities, not correlations:

- `{in rotation, AutoParkHit = 1}` and `{in rotation, CF = MaxInterval}` are the
  **same 492 records**. Neither set has a single member the other lacks.
- Every in-rotation occurrence with `AutoParkHit = 0` is strictly below its cap.
- All **3,015** `Stage 200` records sit at exactly `CF = MaxInterval` with
  `AutoParkHit = 2`. None above, none below, no exceptions.

This is why the archive is 79.8% of the library: it is the rule firing, not
neglect. It also means `decks.max_interval` and `decks.auto_hammer_count` —
two columns hub already owns and ships in every bundle — are the real controls
over how fast a learner's library empties out.

## R5. The auto-tag rule — `Tag` is the app's judgement, not the user's

Same shape, different counter:

> **`AutoTagHit` counts bad reviews. On reaching 2, the app sets `Tag: true`.**

- `{AutoTagHit ≥ 2}` and `{Tag = true}` are the **same 40 records**, zero
  exceptions in either direction.
- 276 occurrences have `AutoTagHit ≥ 1`; the distribution is 1:236, 2:33, 3:6, 4:1.
- The flag is earned: median `numberOfReschedulings` among tagged occurrences is
  **14**, against a library median of **6**.

`AutoTag` appears alongside `AutoPark` and `FreshPark` in mod 2133's
`globalOptions` (§C2), consistent with both rules being switchable.

## R6. `Panic` — an undocumented field marking cards you have panicked on

Not in §6's record shape. Present on **128** records, always reading `0`.
`Panic` is the hardest grade button in mod 2133's own interval tables (a
1-minute step, see C2). Every one of the 128 also carries `AutoTagHit ≥ 1` —
there is no record with `Panic` and `AutoTagHit = 0`. Median reschedule count
among them is 11 against the library's 6. So the field is a counter that comes
into existence once the grade is used and is cleared on recovery; its presence,
not its value, is the signal.

## R7. `A` is a separate field from `language`, and is undocumented

§6's record shape lists neither. Every record carries both:

- `language` — the occurrence direction letter `N`/`E`/`A` (**C1**).
- `A` — which side of the card the **audio** belongs to: `N` 3,630 (80.5%),
  `E` 826 (18.3%), `X` 54 (1.2%).

These are independent: an `E`-direction occurrence can have `A: "N"`. C9's
playback call site is *"gated on the shown side matching the card's `A`
pointer"*, which is exactly this field. The 54 `X` records point at a third
asset again, which matters to audio-cache prefetch.

Records also carry a redundant `D` (deck title, denormalised) — useful in
practice, since it means a progress row names its deck without any join.

## R8. One snapshot contains ~7 months of history — recoverable, with a caveat

R1 and R2 together give `last review = Time − CF days`. Applied to all 4,510
records this yields **135 distinct study days from 2026-04-13 to 2026-11-07**,
with zero future-dated results (the arithmetic self-checks). Hour-of-day
survives intact, because intervals are whole days: a clear bimodal 07:00–09:00
and 12:00–17:00 pattern, with 22:00, 23:00 and 02:00–04:00 completely empty
(00:00 and 01:00 hold a thin 15 and 47).

**The caveat is structural and must travel with any chart built on this.** A
snapshot retains only each occurrence's *most recent* review, so the reconstruction
thins toward the past — a card studied in May and again in October appears only
in October, and a blank day is not evidence of a rest day. The early months
survive at all only because retired cards stopped being reviewed, freezing their
last-review date. Treat the result as a **floor** on activity, never a count.

A genuine day-by-day log needs `userdata_history`, which for this account holds
**exactly one row** (the 2026-11-07 manual push).

## R9. What the snapshot cannot tell you

- **What parked the 582 `Stage 100`/`150` occurrences.** `AutoParkHit = 0` on
  every one, so neither R4 nor R5 touched them. Either the learner archived them
  by hand or mod 2133's `FreshPark` did. Nothing in the record distinguishes the
  two. Do not label these "manually archived" without new evidence.
- **Several doc-level fields are destroyed by a restore.**
  `accountCreationDate` and `lastCompletedSession` both read the restore's own
  timestamp (2026-11-07T18:20Z); `consistencyRate` is absent entirely; and
  `completedSessions` reads 65 against 135 reconstructed study days, so it was
  reset too. Derive account age and activity from the occurrence records, never
  from these.

## R10. The same card and side can live in two decks at once

131 occurrences share a `{ID, language}` pair with another record under a
different `DECK_ID` — all of them B14 (*Intermediate listening*) reusing cards
from B02/B04/B05/B07/B09. This is legal and intended: the scheduler keys on the
**triple** `{ID, language, DECK_ID}` (**C1**), so each copy holds its own
independent SRS state. Any per-card aggregation must group on the triple, or on
`{ID, language}` deliberately — grouping on `ID` alone silently merges them.

## C12. Related documentation

Ecosystem design built on these findings lives in `tun/docs/`.
Start at `tun/docs/README.md`.
