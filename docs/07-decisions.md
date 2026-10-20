# Decision log (ADR)

All decisions made during design. **Read this before changing anything.**
If you reverse a decision, do not delete the row — add a new one and mark the
old `SUPERSEDED`, so the reasoning survives.

Date of this batch: **2026-10-20**.

| # | Decision | Why | Status |
|---|---|---|---|
| D01 | Host publicly on Strato; auth is a long random shared token, not an identity system | Single user; the phone must reach the server from anywhere | accepted |
| D02 | Drop Anki entirely; no migration | phonexa/stabbur replaces it; nothing worth migrating | accepted |
| D03 | New cards ship by **regenerating the whole bundle**, not by runtime card fetching | The deck/card modules are read synchronously at import; making them async has unknown blast radius inside a reverse-engineered bundle. Regeneration is a build-step problem, already solved by bundle-tool | accepted |
| D04 | **One APK build, forever.** The native patch does the smallest possible job | Native is frozen and unfixable after shipping; JS is redeployable. Anything that could need a bug fix must live in JS | accepted |
| D05 | Audio download/cache/playback is a **pure JS patch** — no native work | Verified: `ExponentFileSystem` is already registered in the APK and reachable from the bundle; `playUrl` → `MediaPlayer.setDataSource(Context, Uri)` accepts `file://` | accepted |
| D06 | Bundle activation is **stale-while-revalidate** | Startup never slower than stock; a slow/unreachable server cannot affect UX; the irreversible component stays boring. Cost: new cards land one launch later | accepted |
| D07 | **Tolerate** missing audio rather than gating bundle activation on a complete audio set | A temporarily silent card is recoverable; a bundle that never activates because one blob 404'd is not | accepted |
| D08 | Native carries a **boot watchdog** (skip a bundle with ≥2 attempts and no `boot-ok` marker) | Without it, a bundle that crashes at startup bricks the install — the device can never sync again to be told to roll back. Only code running before JS can do this | accepted |
| D09 | All audio becomes **content-addressed blobs** (`blob/<sha256>`) | Dedup, immutable URLs, trivial manifest diffing on the device, incremental backups, re-cutting one clip invalidates nothing else. phonexa's `file://<storage_key>` indirection already exists | accepted |
| D10 | **No Firebase.** Own server, mirroring the Firestore document shape | Keeps the app-side diff minimal; progress lands somewhere you can inspect and edit | accepted |
| D11 | Replace the Firestore **handle with a shim**, don't rewrite mod 2080 | Minimal diff against a module likely to shift on APK rebase; gives one natural home for offline queue, retries, Timestamp revival | accepted |
| D12 | Device identity is a locally-generated **device id**; no accounts | Single user, no sign-in wall exists, nothing needs identity | accepted |
| D13 | **No new UI inside Mjølnir** | Patching app screens is the highest-risk, least-rebasable work | accepted |
| D14 | Recall progress and pronunciation progress stay **unlinked** | Explicit scope decision; revisit later if desired | accepted |
| D15 | Services: `mjolnir-hub` separate from everything else; `stabbur` as a blueprint beside phonexa; `smia` separate; `builder` as a worker | Cut by blast radius and change cadence: the device-facing contract must stay up and stable while stabbur churns daily | accepted |
| D16 | Extract **smia** — one service for inflect / ipa / tts / stt / translate | All five share a shape (providers + fallback + cache); removes duplication from hover-translate and phonexa | accepted |
| D17 | Drop self-hosted Whisper; **cloud STT only**, interface left open | Too heavy for the box | accepted |
| D18 | Five fixed card types (a word, b expression, c listening, d pronunciation, e grammar) with computed `A` and occurrence lists | Projection stays pure; all five shapes are attested in stock data | accepted |
| D19 | One deck per type / part-of-speech | Decks are Mjølnir's pacing unit (`MaxInterval`, `AutoTickStreak`, `AutoHammerCount`) | accepted |
| D35 | Hosting: **Contabo VPS, 8 GB RAM, 100 GB disk** (2026-10-20) | Above the 4 GB floor; Docker-capable | accepted |
| D36 | ~~Services grouped with phonexa as the server monorepo~~ | — | **SUPERSEDED by D37** |
| D37 | **Mjølnir is a self-contained repo**: tool + JS patches + native patch source + apk pipeline + builder + hub + findings. Zero phonexa dependency | Everything that only exists to serve the device shares one body of knowledge (the bundle format). Coupling it to phonexa mixes two unrelated change cadences | accepted |
| D38 | ~~content owns `card_slots`; contract is a JSON build payload~~ | — | **SUPERSEDED by D43** |
| D41 | The ecosystem is named **Tun** (the farmyard — the shared centre every building faces). Services: **smia** (forge/linguistics), **stabbur** (storehouse/content), **mjolnir**, **phonexa** | A coherent metaphor family aids recall for a solo dev holding a large system | accepted |
| D42 | **Six repos**: `tun` (deployment + ecosystem docs + shared UI shell), `mjolnir` (tool + patches + native + apk + builder + hub + findings), `stabbur`, `smia`, `phonexa`, `hover-translate`. Separate logical databases per service; **no cross-service FKs** | Independence must be structural, not nominal. `tun` is the entry point and the home for cross-repo docs; `findings.md` stays with mjolnir | accepted |
| D43 | **stabbur is Mjølnir-independent.** It knows text/translations/context/audio/pos/inflections/transcription/kind/status. **hub** owns `card_slots` (permanent ids), deck assignment, card types a–e, projection to N/E/X/A, interleave | The card ledger belongs to whoever knows the format. stabbur survives switching SRS apps entirely | accepted |
| D44 | hub **pulls** from stabbur (`GET /api/items?status=ready&since=…`); stabbur does not know hub exists | One-directional dependency | accepted |
| D45 | **Audio: stabbur owns the canonical learning audio** (capture clips, TTS/Forvo results). smia is stateless and returns bytes. hub keeps a **per-build snapshot** of exactly what the device needs. phonexa keeps its own sample audio and may import by hash | Content-addressing is a *convention*, not a central service — a central blob service would make studying depend on stabbur being up. Duplication costs ~30 KB/clip, i.e. nothing | accepted |
| D46 | Every service ships its own UI with database exploration, served under one domain by path with a shared header/nav (vendored CSS, not a package) | Four UIs must feel like one system | accepted |
| D47 | Bundle validation uses **sha256 over TLS**, not signing | Adequate for a single user on their own VPS; signing is unfixable-later complexity for a threat model that does not apply | accepted |
| D39 | Native patch reads `ota-config.json` (url + token) from `documentDirectory` if present, else baked-in defaults | The server URL and token would otherwise be frozen forever; a domain or token change would require a reinstall. Makes the only truly irreversible choice reversible | accepted |
| D40 | Sequence starts with the **native patch**, not the cold-start measurement | The native patch does not depend on the cold-start answer, and once OTA works, testing a padded bundle is a file copy instead of an APK rebuild | accepted |
| D20 | ~~Custom decks use a new `P` category with a UI patch~~ | — | **SUPERSEDED by D21** |
| D21 | Custom decks continue the **`C` category, `C20`–`C29`** | The `P` patch needs 2 extra `useState` pairs, 5th cases in two switches, section headers, scroll offsets and the approach selector, all inside mod 2119 — the largest, most rebase-fragile UI module. Not worth it for a cosmetic grouping | accepted |
| D22 | Card IDs are **exactly 6 chars**, minted at publish, **permanent**, never reused | Hard-coded `slice(0,6)` in mods 2110/2112/2124/2131; SRS progress records point at them | forced |
| D23 | Published cards are **append-only**; retire via a disabled deck | A removed card leaves a live progress record rendering blank | forced |
| D24 | **Never reorder a published deck's `Cards[]`**; only append | `PullCounter` is a block index (5 occurrences per pull) stored in synced userdata; reordering silently and permanently skips cards | forced |
| D25 | Interleave with **minimum lag 11**; hold items until a deck has ≥6 ready | Mechanically justified: the app pulls 5 occurrences per block, so lag 11 guarantees ≥2 blocks of separation. Lag does **not** correlate with any deck property — stock decks used different authoring recipes; C13–C17 (lag 11) is the cleanest machine-generated family | accepted |
| D26 | Wire protocol compares **buildId identity, never version ordering** | Ordering logic in frozen native code is a permanent mistake risk; also means no version ordering is needed on the server, and rollback is just pointing `current.json` elsewhere | accepted |
| D27 | Three version axes (`base`, `patches`, `data`); the **patch manifest is the truth**, the integer is a label | "logic v3" alone loses which of the ~6 patches are in. Human label `base 6.0.3 · logic 3 · data 247` is display-only | accepted |
| D28 | **capture** is its own entity — NOT a phonexa `Sample`/`Token` | A `Token` is a phoneme instance feeding formant analysis; a capture is a lexical intent. Different lifecycle and cardinality. Promoting a clip into a Sample is an optional explicit action | accepted |
| D29 | Capture is **raw and unclassified**; typing/enrichment/trimming happen later in a triage UI | One keystroke mid-video; classification mid-video is hostile | accepted |
| D30 | Publishing is **manual (a button) + nightly auto-if-dirty** | A publish is a release and the irreversible moment card IDs are minted. Never on capture | accepted |
| D31 | Device status **piggybacks** on the existing sync PATCH; version selection is a **server-side** control | No new Mjølnir UI needed; rollback works from your laptop | accepted |
| D32 | Extension translates **fast-local first, then async-enriches from smia** | Hover must be instant; also means the extension keeps working when Strato is down | accepted |
| D33 | Grammar rule HTML is **duplicated into every card** that uses it; editing a rule republishes those cards | `X` is a per-card string in the bundle; there is no shared-reference mechanism | accepted |
| D34 | Sources: Norsk ordbank (inflections), naob → ipa-lookup/nb → espeak (IPA), Forvo → dict.cc → cloud TTS → piper (audio) | Named by the user; ordbank is freely licensed and exhaustive | accepted |
