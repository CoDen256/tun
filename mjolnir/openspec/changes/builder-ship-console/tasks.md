## 1. Publish-time restamp & versioning (D-SC4)

- [ ] 1.1 Add `BUILT_AT` to `patches/js/boot-ok-companion.js`
      (`'__MJOLNIR_BUILT_AT__'` → `globalThis.MJOLNIR_BUILT_AT`), with a
      source comment splitting the constants into publish-stamped
      (`BUILD_ID`, `LABEL`, `DATA_VERSION`, `BUILT_AT`) and assemble-stamped
      (`BASE_VERSION`, `PATCH_REV`).
- [ ] 1.2 Add `BUILT_AT` validation (ISO-8601) to
      `src/commands/companion.js`'s placeholder rules; assemble defaults may
      bake a placeholder-ish value since publish corrects it.
- [ ] 1.3 Generalize `restampCompanionBuildId` (`tool/src/otaPublish.js`)
      into a restamp of all four publish-stamped constants, keyed on
      constant names via regex, erroring if a constant is missing. Keep the
      old name as a wrapper or update the callers.
- [ ] 1.4 `pipeline.js`: compute one publish timestamp, pass it to the
      restamp AND to `writePublication` so `publications.created_at` equals
      `BUILT_AT` exactly. Restamp before `bundleSha` is computed.
- [ ] 1.5 Tests: a double-publish off one logic bundle carries second-publish
      label/data/built-at; restamp works regardless of assemble-baked values.

## 2. My-account single version row (D-SC5)

- [ ] 2.1 Rework `patches/js/2176-my-account-build-id.edited.js`: one App
      version row `b… · base … · logic … · data … · built YYYY-MM-DD HH:mm`,
      Label and Data version rows removed, `embedded` fallback fixed (the
      `&&`/`+` precedence bug).
- [ ] 2.2 Unit test the row-string builder: full globals, missing globals
      (`embedded`), timestamp formatting from ISO.

## 3. On-device deck counts (D-SC3)

- [ ] 3.1 Move/repeat the description sync so it runs AFTER `flushDeck`
      appends — counts computed from the post-flush in-memory model
      (distinct card ids, `Cards.length`).
- [ ] 3.2 Format `"<prose> · <N> cards · <M> occurrences"` into the bundle
      deck entry only; `decks.description` in the database stays pure prose.
- [ ] 3.3 Test: publish → bundle deck Description carries post-flush counts;
      editing prose in the console changes only the prose half next publish.

## 4. Ship strips page (D-SC1/D-SC2) — layout per the accepted mockup

- [ ] 4.1 New exported body in `builder/src/server.js` (`buildShipStripsBody`
      or similar) + builder route; hub route + nav entry in
      `hub/src/server.js`/`hub/src/layout.js` (D109 mechanism, degraded
      banner inside the shared body).
- [ ] 4.2 Implement the accepted mockup's layout (see `design.md` layout
      subsection and `mockups/`), strip rendering reusing/refactoring
      `shipOrderForDeck` + `renderShipOrderStrip` foundations.
- [ ] 4.3 Forecast-on-strip: newly-eligible occurrences as distinct cells in
      would-flush position, ship vs hold distinguishable; no separate
      would-ship/hold/queue tables on this page.
- [ ] 4.4 Occurrence inspector (click/keyboard): card id, letter, note text,
      state, shipping build + built-at for shipped cells.
- [ ] 4.5 Pinned header: global totals, active-logic-bundle chip (red
      warning when none), Publish now + one-line forecast summary; reload
      shows post-publish state.
- [ ] 4.6 Fix the single-source divergence: strip layout and flush preview
      must derive `alreadyShipped` from one source (today: forecast counts
      `occurrence_shipments` while the real flush uses `deck.Cards.length`);
      clean up `byDeck`'s `stagedTotal` naming collision on the way.
- [ ] 4.7 Page-level tests for the body function (shape, zero-deck, degraded
      stabbur) mirroring the existing forecast-body tests.
