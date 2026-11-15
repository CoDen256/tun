# Acceptance criteria — builder-ship-console

Review contract for the build phase (D161). Observable end states, testable
in dev compose with claude-in-chrome (console) and adb (device/emulator, or
the bundle's rendered constants where no device is available — grep of the
published bundle file counts as device-observable for baked constants).

## A. Publish-time restamp & versioning (items: build time / versioning)

1. Assemble a logic bundle, then publish twice off it with new content in
   between. Grep the two published bundle files under `data/ota/bundle/`:
   each carries its own publish's `BUILD_ID`, `DATA_VERSION` and `BUILT_AT`,
   and the second file's values differ from the first's — no assemble-time
   staleness.
2. For any publish, the `BUILT_AT` string in the published bundle equals the
   publication's `created_at` shown in the console's publish history
   (to-the-second ISO match).
3. The restamp happens before hashing: `sha256(data/ota/bundle/<id>.js)`
   equals the `sha256` field in `current.json` after every publish
   (`bin/ota-verify.sh` passes).

## B. My-account display (item: time of build in app version)

4. On a device/emulator running a freshly published bundle, the My account
   screen shows ONE App version row reading
   `<buildId> · base <ver> · logic <rev> · data <rev> · built <YYYY-MM-DD HH:mm>`
   matching that publish, and no separate Label or Data version rows exist.
5. Running the stock embedded asset (no companion), the App version row
   shows exactly `embedded` — the string `undefined` appears nowhere on the
   screen.

## C. On-device deck counts (item: counts in deck descriptions)

6. After a publish that flushes occurrences into a deck, the deck's
   description in the app (and in the published bundle's deck entry) reads
   `<operator prose> · <N> cards · <M> occurrences` where N and M match the
   just-published bundle's `Cards[]` (post-flush, not pre-flush).
7. Editing the deck's description in the console and publishing again
   changes only the prose half; `SELECT description FROM decks` contains no
   counts.

## D. Ship strips page (item: builder UI rehaul)

Layout LOCKED: deck rails, per design.md's layout subsection; the accepted
mockup `mockups/mockup-deck-rails.html` is the visual contract.

8. A "Ship strips" page is reachable from builder's own UI and from hub's
   Builder nav group; both render the same strips and controls inside their
   host shells.
9. Each deck renders its ship-order strip with shipped, staged, and open
   cells in blocks of 5 (dividers every 5), the deck's live counts
   (`N cards · M occ.`), and its grid-status chip. There are NO separate
   would-ship/would-hold/would-queue tables on this page.
10. With newly-eligible notes present in stabbur, the strip shows them as
    visually distinct this-run cells in would-flush position, with ship vs
    hold distinguishable (hold cells appear when the staged total is short
    of the next multiple of 5).
11. Clicking a shipped cell opens an inspector naming that occurrence's card
    id, letter, note text, and the shipping build id with its built-at
    timestamp. Clicking a staged cell says it flushes on the next qualifying
    publish; a pending cell shows its remaining countdown.
12. The pinned header shows global totals, the active-logic-bundle indicator
    (red warning state when none is active), and a Publish now control with
    a one-line would-ship/would-hold summary. Clicking Publish now completes
    a real dev publish and the reloaded page shows the previously
    ship-marked cells as shipped and the totals advanced.
13. With stabbur stopped, the page still renders strips from the database
    with the degraded banner (identical in builder's and hub's rendering);
    with the database stopped, the page answers the D157 degraded response,
    not a crash.
14. The strip's flush boundary agrees with reality: for a deck where the
    forecast and the strip are both visible, the number of cells marked
    as shipping equals what the subsequent real publish actually flushes
    (single-source `alreadyShipped`, task 4.6).
15. Rails-specific (per the accepted mockup): hovering or focusing an
    occurrence cell of a card whose other side is on the strip visibly
    highlights that other cell; occurrence cells are reachable and
    activatable by keyboard (Tab + Enter opens the inspector, Esc closes
    it); a stalled deck's rail carries the stalled chip and distinct border.
