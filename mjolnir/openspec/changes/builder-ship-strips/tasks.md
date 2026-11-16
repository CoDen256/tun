## 1. Correctness fixes the UI depends on

- [ ] 1.1 Fix `shipOrderForDeck`'s open-slot expression in `builder/src/cardFlow.js` to `nextMultipleOf5(shipped + staged) - (shipped + staged)`, and remove the negative-value branch and its "data-integrity signal" `console.error` — the expression can no longer go negative
- [ ] 1.2 Update the `card-flow-view` tests that encoded the old expectations (including the "staged zero, shipped on grid → open 0" case) to the corrected values; add a case for a deck whose staged rows carry it past the next multiple of 5
- [ ] 1.3 Widen the content-change detection behind `runForecast`'s `wouldUpdate` so each entry reports which content faces differ, keeping the existing comparison as the single source of the decision
- [ ] 1.4 Move `syncDeckDescription` in `pipeline.js`'s `flushDeck` to after the `addOccurrence` loop, so anything it formats reflects this run's flush
- [ ] 1.5 Format `<operator prose> · <N> cards · <M> occ` into the bundle's deck entry from the post-flush in-memory model (distinct card ids and `deck.Cards.length`), writing nothing back to `decks.description`
- [ ] 1.6 Verify a deck that flushes nothing in a run still gets a correct description (the sync must run on the held path too, not only when `shippable` is non-empty)

## 2. Publish-time version stamping

- [ ] 2.1 Add the build-timestamp placeholder and constant to `patches/js/boot-ok-companion.js`, exposed on `globalThis` beside the existing version globals, substituted at assemble by the generic placeholder mechanism
- [ ] 2.2 Generalize `restampCompanionBuildId` in `tool/src/otaPublish.js` to restamp build identity, data revision and build timestamp, keyed on constant names rather than previously baked literals
- [ ] 2.3 Call the generalized restamp from `pipeline.js`'s publish path before the bundle hash is computed, passing one timestamp that is also used for the `publications` insert
- [ ] 2.4 Confirm base version and patch revision are not restamped and still come from the active logic bundle
- [ ] 2.5 Collapse `patches/js/2176-my-account-build-id.edited.js`'s three version rows into one App version row carrying build identity, base version, patch revision, data revision and build time, formatting the UTC constant to device-local time
- [ ] 2.6 Fix that row's no-companion fallback so it renders `embedded` rather than a string containing "undefined" (the `&&`/`+` precedence defect)
- [ ] 2.7 Update the companion and account-screen unit tests for the new constant and the single row
- [ ] 2.8 Supply the build-timestamp placeholder from the assemble path so the companion's substitution succeeds, relying on D-G1's generic mechanism rather than adding a per-key branch
- [ ] 2.9 Add the read-only, auto-filled build-timestamp row to the Assemble tab beside the other placeholder fields, labelled as assemble time and noting that publish replaces it; confirm it is not editable and is stored as no configuration value

## 3. The ship-strips page

- [ ] 3.1 Replace builder's primary page renderer with the ship-strips body, keeping the exported-body mechanism so hub renders the same markup in its own shell
- [ ] 3.2 Carry over the active-logic-bundle banner, the degraded-dependency banner, the global totals and the publish action; remove the pipeline-stage rail and the past-batches section from this page
- [ ] 3.3 Implement the cell vocabulary: lifecycle fills including the staged-flushing / staged-held split, the new-this-run outline, the content-change marker, and the letter glyph
- [ ] 3.4 Render the strip with no text inside the cell grid — rows of a fixed cell count, a divider every 5 throughout, row labels outside the grid
- [ ] 3.5 Render each pending tier's countdown as that many filler cells, in ascending tier order, with no caption; render no pending zone at all for single-occurrence families
- [ ] 3.6 Build the deck rail header: code, title, and the six-figure readout in the shared order with inline deltas (absent at zero); no grid chip when the deck is on grid
- [ ] 3.6a Render the edited figure (already-minted cards this publish rewrites) beside minted in both the rail header and the global totals, with no delta and an explicit zero
- [ ] 3.6b Render a prominent off-the-5-grid fault element only for a deck whose shipped count is not a multiple of 5, naming the grid fault rather than staleness; drop the "Stalled" label's conflation of the two
- [ ] 3.7 Make the global totals use the same order, labels and icons as the rail readout, with the delta inline and smaller beside each figure, and no per-deck breakdown sub-lines
- [ ] 3.8 Implement hover: index, card id, letter, and the changed-face readout from 1.3, with the no-card wording for open and filler cells
- [ ] 3.9 Implement kin-highlight of the same card's other occurrence on hover and on focus
- [ ] 3.10 Implement the detail view as a pushing panel that keeps the strip visible, carrying shipping build and timestamp, flush-or-hold, tier countdown, and the sibling occurrence's position
- [ ] 3.11 Render the card in the detail view through the `card-preview` capability using the extracted style map produced by `assembly-tab-usability`; fail loudly if that style map is absent rather than silently falling back to invented values
- [ ] 3.12 Label the preview as showing new content whenever the cell's card is being rewritten by this publish
- [ ] 3.13 Place the single legend at the bottom of the page, below the last rail, carrying the staged split and the info affordance with the cards-not-occurrences countdown fact
- [ ] 3.13a Remove the per-strip heading and the header's condensed run-summary line; verify no "on hold" counter is re-homed anywhere, since the held fill and the staged figure already carry it
- [ ] 3.14 Audit every user-visible string on the page for "occurrences"/"batches" phrasing of the countdown and change it to cards
- [ ] 3.15 Make cells keyboard-walkable with a visible focus ring, and suppress any motion under `prefers-reduced-motion`
- [ ] 3.16 Update the Builder nav entry's label in `hub/src/layout.js` and `builder/src/layout.js` to match the new page

## 4. Publish progress and result

The accepted mockup carries all six states (idle, publishing, succeeded,
failed, stalled, no-op) behind a mockup-only switcher — build each against
its drawn state.

- [ ] 4.1 Add a progress endpoint returning the most recent run's state and its narration lines
- [ ] 4.2 Keep the publish POST synchronous and authoritative; drive the in-progress indication from the click and the narration tail from concurrent polling
- [ ] 4.3 Report a no-op publish (no run recorded, nothing newly eligible) as a completed no-op and stop polling
- [ ] 4.4 Render the last run's result at the top of the page, derived from stored run state so it survives a reload and reports a run nobody watched
- [ ] 4.5 Show the recorded error and a route to that run's full log on failure
- [ ] 4.6 Present a run that is recorded running but has stopped producing narration as stalled rather than as ongoing progress
- [ ] 4.7 Put the page into the in-progress state on plain load when a run is already executing, with no POST

## 5. Verification

- [ ] 5.1 Seed the deck shapes the acceptance criteria need (a deck carried past its next multiple of 5 by staged rows; a deck on the grid with nothing staged; a deck deliberately off the 5-grid, to prove the fault element renders) and record the seeding
- [ ] 5.2 Capture a device-plane response (`current.json` and a bundle fetch) before and after the change and diff them byte for byte
- [ ] 5.3 Run the full `mjolnir` test suite and `bin/check-standards.sh`
- [ ] 5.4 Walk `acceptance.md` in the running UI and on a device/emulator, recording the observed end state per criterion
