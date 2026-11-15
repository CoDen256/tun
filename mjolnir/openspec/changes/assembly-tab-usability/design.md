# Design — assembly-tab-usability

Settled with the operator in the `/tun-design` session for batch
`full-sweep`, 2026-11-15. The accepted mockup is `mockups/`.

## Item 1 — one list, really prefilled

**Decision.** The Assemble tab's dedicated `Label` and `Patch rev` fields
are deleted. The Placeholders list is the only place a baked value is
typed, in the order `PATCH_REV, LABEL, DATA_VERSION, BUILD_ID,
SYNC_BASE_URL, SYNC_TOKEN, AUDIO_BASE_URL`.

This removes a real duplication, not just a cosmetic one: `LABEL` existed
both as a field and as a row, reconciled by a client-side "copy the field
into the row if the row is blank" rule, while `PATCH_REV` — which
`patches/js/boot-ok-companion.js` genuinely bakes — had no row at all.

The `PATCH_REV` row must drive hub's `patch_rev` column, not only the
substitution. `assembleAndSubmit` currently force-overrides
`placeholders.PATCH_REV` from its own `patchRev` argument; after this
change the row *is* that argument, so the override becomes identity rather
than a silent discard of what the operator typed.

**Prefill reverses a prior choice, deliberately.**
`hub/src/ota.js` returns `syncTokenConfigured: true/false` with the
comment "Booleans only — never the token value itself." The operator chose
to return the real value. The reasoning recorded at the time of the
decision: the value is `OPERATOR_AUTH_TOKEN`, the browser already holds it
to reach any operator-plane page, the route is operator-plane only and
unreachable from the device plane, and a box that claims "configured" but
shows nothing is exactly the complaint this item was filed about. The
field is masked with a reveal toggle so the value is not shoulder-visible
by default.

Standalone mode has no hub to ask, so `PATCH_REV`/`LABEL`/`DATA_VERSION`
stay blank there with a hint that says why — not a silent empty box, which
is the status quo being fixed.

**Out of scope.** What these numbers *mean* is the `full-sweep` package
"Builder UI rehaul & data versioning". This item fixes the form only.

## Item 2 — Explorer finds a module by its number

**The defect is structural.** `runExplorerSearch` sends every query to the
server-side full-text *source* search. A module's own id never appears in
its own body, so no amount of grepping finds module 2110 by typing 2110 —
it finds the modules that `require` it.

**Decision.** One box, no mode toggle. A numeric query gains two id-based
groups above the existing source hits: an exact-id jump row, then ids
containing the query. Non-numeric queries are untouched. Rejected: a
mode switch (a toggle the operator must remember to flip is the same bug
with an extra click) and silently replacing source search with id search
(it would break finding call sites, which is what the box is good at).

## Item 3 — a preview faithful enough to replace a publish

**Decision: extract, do not transcribe.** A re-runnable extractor reads
the stock bundle and the fonts beside it and emits what hub renders with.
The current CSS was hand-copied once; its own design doc flagged the
approximation as an open question, and this item is that question coming
back. Hand-transcription would drift again at the next APK rebase.

Values confirmed against `base/smali.mjolnir.merged/assets/
index.android.bundle` during this session:

| what | value |
|---|---|
| card | `width normalize(342)`, `radius normalize(20)`, `border normalize(1)` in `borderColor` |
| card height | `C = screenHeight − (iOS inset; 0 on Android) − normalize(200)` |
| faces | `0.28 C` (N), `0.28 C` (E), `0.44 C` (X) |
| divider | `textDivider`: width 60%, centred, `normalize(1)`, `borderColor` |
| scrolling | E and X are `ScrollView`s; N is a plain touchable |
| tap | all three faces are `TouchableOpacity` with `onPress: Z(letter)` |
| scale | `normalize(t) = round(t × width / 375 × (isTablet ? 0.7 : 1))` |
| sup | `supWrap` is `flexDirection row, alignItems flex-start, justifyContent center, marginHorizontal normalize(4)`; `sup` is `fontSize normalize(11)` |
| IPA | `arialFont`/`arialFontNormal` select the bundled `arial.ttf`, because Poppins has no IPA glyphs; content carries them as numeric entities |
| dark theme | cardText `#fff`, studyCardHeading `#737B95`, headingAccent `#3F8CFF`, headingGray `#7C8296`, green `#5DD8D0`, borderColor `#7C8296` |
| light theme | cardText `#16215B`, studyCardHeading `#ACB1C0`, headingAccent `#246BFD`, headingGray `#16215B`, cardBackground `#FAFAFA`, borderColor `#DADFF2` |

**The one value that is a mapping, not an extraction.** The dark theme has
no `cardBackground` key. `#1B1D21` comes from `archivedBackground` /
`navigationRoot`. It must be labelled as mapped wherever it is surfaced,
so a future reader does not take it for an extracted constant.

**Centring must not clip.** A scrollable face centres its content when it
fits and top-aligns it when it does not. Naive centring in a scroll
container makes the overflowing top unreachable — caught in the mockup.
Note for the backlog, *not* for this change: the app's own
`contentContainerStyle: { justifyContent: 'center' }` has the same shape,
so the device may clip long X faces the same way.

**Throwaway editor.** Live-editable N/E/X HTML with click-to-insert
snippets, never persisted and never sent to the builder. Its purpose is to
find what is wrong with a minted card here, then fix it in the builder —
so it must be loud about saving nothing, and must offer a reset.

## Risks

- The extractor parses a minified, reverse-engineered bundle. It must fail
  loudly if a style map it expects is not found, rather than emitting a
  partial map that looks complete. A silently-shrunk catalogue is the
  failure mode that would reintroduce exactly this bug.
- `base/` is read-only input (D04) — the extractor reads it and never
  writes to it.
