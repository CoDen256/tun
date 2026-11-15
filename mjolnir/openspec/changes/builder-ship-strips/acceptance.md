# Acceptance criteria — builder-ship-strips

Falsifiable, UI/device-observable end states. Every criterion is testable in
dev compose with claude-in-chrome, or on a device/emulator with adb. A
criterion passes only when the described end state was actually observed by
an agent that did not write the code — never by reading code or trusting a
log line.

Several criteria below need a deck in a specific shape. Seed it: a deck with
`shipped ≡ 0 (mod 5)` and enough staged rows to carry it past the next
multiple of 5 is the case the open-slot bug needs (e.g. 245 shipped, 9
staged). Record the seeding used.

## Item 1 — the ship-strips console

### A1. The forecast page is gone and the strip page is served in its place
Opening `/builder` shows a page titled for ship strips whose deck strips are
all visible without clicking anything. The page contains **no** 5-stage
pipeline rail (no Pulled/Minted/Staged/Flushed/Published stage row) and
**no** past-batches section. The active-logic-bundle banner and a Publish
action are both present.

### A2. The same page renders inside hub's shell
Opening hub's Builder nav entry for the console renders the same strip
content inside hub's own shell, with hub's rail present and builder's own
chrome absent. The deck strips and totals are identical between the two
routes.

### A3. The strip's cell grid contains no text
In the rendered DOM, every descendant of a strip row's cell grid is either a
cell or a block divider; the only text content inside a cell is a single
occurrence letter or a single placeholder character. No label, no tier
caption, no publish-line text appears between cells. Row-number labels exist
but sit outside the cell grid, and removing them would not change any cell's
position.

### A4. Cells wrap in aligned rows of a fixed count with a divider every 5
A deck with at least 80 occurrences renders rows of exactly the configured
cell count, with a divider after every 5th cell throughout both the real and
the projected zones, and the row labels' ranges are contiguous and
non-overlapping across the whole strip.

### A5. Flushing and held staged occurrences are visually distinct
For the seeded deck where some staged occurrences reach the next multiple of
5 and some do not, the flushing staged cells and the held staged cells
resolve to different computed styles, and the count of each matches the
forecast's own flush count for that deck.

### A6. New-this-run cells carry the ring on both lifecycle states
After a note becomes newly eligible, both the newly-staged occurrence cell
and the newly-queued pending occurrence cell carry the same new-this-run
outline treatment, and a cell that is both newly staged and held shows the
held fill *and* the outline simultaneously.

### A7. A shipped occurrence whose card's content changes carries the marker
After editing a note whose card already has a shipped occurrence, reloading
the page shows the content-change marker on that card's shipped cell(s), and
on no cell belonging to a card whose content did not change.

### A8. A pending tier's countdown is rendered as that many filler cells
For a deck with pending occurrences at more than one countdown value, each
tier's own cells are immediately followed by exactly `remaining` filler
cells, tiers appear in ascending countdown order, and no caption states the
number.

### A9. A single-occurrence deck shows no pending zone
A deck whose family mints one occurrence per card renders no pending cells
and no filler cells, even if stray pending rows exist for it in the database.

### A10. Hover names the specific changed faces
Hovering a cell whose card's projection differs in exactly one face shows a
readout naming that face and not the unchanged faces. Hovering a cell whose
card is unchanged shows the unchanged wording. Hovering an open or filler
cell states that the slot holds no card, and shows no card id.

### A11. Hover kin-highlights the card's other occurrence
Hovering an occurrence of a card that has a second occurrence elsewhere in
the same strip changes the computed style of that second cell while the
hover lasts, and restores it on leave. The highlighted cell's card id equals
the hovered cell's card id.

### A12. Clicking opens a detail view and the strip stays visible
Clicking a shipped cell opens a detail view naming the build that shipped it
and the timestamp, while the strip remains visible on screen (not covered).
Clicking a pending cell shows its remaining countdown expressed in cards.

### A13. The detail view renders the card through the shared style values
The detail view renders the card's faces using the style values emitted by
the extractor, and the rendered card's measured width and face proportions
match those values rather than independently chosen numbers.

### A14. A rewritten card's preview is labelled as showing new content
Clicking a cell whose card's content this publish rewrites shows, in the
detail view, a statement that the rendered card is the new content and not
what is installed on the device.

### A15. Countdown wording says cards everywhere
No user-visible string on the page describes the pending countdown in
occurrences or in batches; every one expresses it as new cards into that
deck. The legend's info affordance states that several tiers can drain in
one publish.

### A16. One stat order in both places, with deltas and silent zeros
The global totals and every deck header present minted, eventual, shipped,
staged, pending in that order with the same labels. A deck with activity
shows a delta on each figure that changed; a deck with no activity shows the
same five figures with no delta annotation and no explicit zero. Each deck
header's five absolute figures equal that deck's values in the forecast.

### A17. The open-slot count is correct for a deck carried past its multiple
For the seeded deck at 245 shipped and 9 staged, the strip renders exactly
**1** open cell, and that cell's detail view names 255 as the target. The
container logs produced while loading the page contain no "open-slot count
computed negative" line.

### A18. A deck on the grid with nothing staged awaits a whole batch
For a deck whose shipped count is a multiple of 5 with zero staged, the strip
renders exactly **5** open cells — not zero.

## Item 2 — publish progress and result

### A19. A publish in flight shows progress and the run's own narration
Triggering a publish that does real work shows an in-progress indication, and
at least one of the run's narration lines appears on the page while the run
is still running (before any result is shown).

### A20. A no-op publish ends in a reported no-op, not perpetual progress
Triggering a publish while nothing is newly eligible ends with the page
stating that nothing needed publishing. The in-progress indication is gone
within the page's own polling interval, and no run appears in the run log for
it.

### A21. The result survives a reload
After a publish completes, reloading the page still shows that run's result
at the top, including the published build identity on success.

### A22. A run nobody watched is reported on next load
With the page closed, trigger a publish by the scheduled path (or simulate a
completed run), then load the page: that run's result is shown at the top.

### A23. A failed run shows its error and a route to its log
After a publish that fails, the page shows the recorded error text at the top
and a link that opens that run's full log.

### A24. A stalled run is not displayed as healthy progress
With a run row left in the running state and no new narration being written,
loading the page presents it as stalled rather than as normal ongoing
progress.

## Item 3 — on-device deck descriptions

### A25. The published deck description carries the bundle's own counts
After a publish in which a deck flushes occurrences, that deck's description
in the published bundle equals the operator's stored description text
followed by the card count and occurrence count **including** the
just-flushed occurrences. Verified by reading the deck entry out of the
published bundle and comparing against `occurrence_shipments` for that deck
after the run.

### A26. The counts are the bundle's, not the eventual totals
For a deck holding cards whose further occurrences are still staged or
queued, the published description's occurrence count equals the number of
occurrences in that deck's `Cards` in the bundle, and is strictly less than
that deck's eventual-occurrence figure shown in the console.

### A27. The database stores only the operator's text
After the publish, that deck's `decks.description` row contains the operator
prose alone, with no counts appended.

### A28. The counts are visible on the device
On a device or emulator running the published bundle, the deck list shows
that deck's description with the card and occurrence counts.

## Item 4 — versioning and build time

### A29. One App version row with build time on the device
On a device running a bundle published by this change, the account screen
shows a single App version row containing the build identity, base version,
patch revision, data revision and build time. No separate Label row and no
separate Data version row appear.

### A30. Publish-time facts are correct on a republish of the same logic bundle
Publish twice from one logic bundle. On the second build, the device's row
shows the second publish's build identity, data revision and build time —
none of them equal to the first publish's or to what assemble baked. The base
version and patch revision are unchanged between the two.

### A31. Build time matches the publication record exactly
The build timestamp read out of the published bundle equals that publish's
`publications.created_at` to the second.

### A32. Build time displays in local time from a UTC constant
The constant baked in the bundle is an ISO-8601 UTC instant; the account
screen renders it in the device's local time. Changing the device timezone
and reopening the screen changes the displayed time, while the baked constant
is unchanged.

### A33. The no-companion fallback says "embedded"
On a build with no companion (the embedded asset), the App version row reads
`embedded`. The string "undefined" appears nowhere in that row.

### A34. The restamp works regardless of what assemble baked
Assemble a bundle with deliberately wrong placeholder values for the
publish-time constants, publish it, and confirm the published bundle carries
the correct publish-time values — demonstrating the restamp keys on constant
names, not on the previously baked literals.

### A35. The published hash covers the restamped bundle
The hash recorded for the publish equals the hash of the published bundle
file as it contains the restamped values — recomputing the file's hash after
the run matches the recorded value.

## Cross-cutting

### A36. The device-facing contract is byte-identical
For an unchanged published build, a device-facing response on the device
plane — `current.json` and a bundle fetch — is byte-for-byte identical before
and after this change. Captured and diffed, not reasoned about.

### A37. No configuration value gained a second home
`bin/check-standards.sh` passes.

### A38. The existing test suite passes
`mjolnir`'s test suite passes, including the `card-flow-view` and companion
tests, with any test that encoded the old open-slot expectation updated to
the corrected one rather than deleted.
