## ADDED Requirements

### Requirement: A Ship strips page exists in builder and inside hub
Builder SHALL serve a new page, **Ship strips**, alongside (not replacing)
Forecast & publish, and hub SHALL render the same exported body under its
own shell and nav (the D109 mechanism). The stabbur-degraded banner SHALL be
rendered inside the shared body so the two copies cannot diverge.

#### Scenario: both entry points render the same content
- **WHEN** the operator opens the page via builder's own route and via hub's
  Builder nav group
- **THEN** both show the same strips, totals and controls, each inside its
  host's shell

### Requirement: The ship-order strip is the page's backbone
The page SHALL render, per deck, the ship-order strip (shipped → staged →
open, then the projected pending/gap zone, blocks of 5 with batch dividers)
as the primary content, annotated with the deck's live counts
(`N cards · M occ.`), grid status, and this-run deltas. There SHALL be no
separate would-ship/would-hold/would-queue tables on this page.

#### Scenario: forecast is drawn on the strip
- **GIVEN** a deck with newly-eligible occurrences, some of which would
  flush this run and some of which would be held
- **WHEN** the operator views the deck's strip
- **THEN** the newly-eligible occurrences appear as visually distinct cells
  in their would-flush positions, with ship and hold distinguishable from
  each other and from already-staged cells

#### Scenario: strip arithmetic has one source
- **WHEN** the page computes a deck's shipped count for strip layout and the
  flush preview
- **THEN** both derive from the same source, so the strip can never show a
  flush boundary that disagrees with what a real run would do

### Requirement: Every occurrence cell is inspectable
Clicking (or keyboard-activating) a cell SHALL open an inspector showing the
card id, letter, note text, state, and — for shipped cells — the build id
and timestamp that shipped it; for staged cells, that it flushes on the next
qualifying publish; for pending cells, the remaining countdown.

#### Scenario: a shipped cell names its build
- **WHEN** the operator activates a shipped cell
- **THEN** the inspector shows that occurrence's card id, letter, note text,
  and the shipping build id with its built-at timestamp

### Requirement: Publish is available from the page
The page SHALL carry a pinned header with global totals, the active logic
bundle indicator (including the red warning state when none is active), and
a Publish now control accompanied by a one-line forecast summary (how many
occurrences would ship and hold).

#### Scenario: publishing from the strips page
- **WHEN** the operator clicks Publish now and the run succeeds
- **THEN** the page reloads showing the previously ship-marked cells as
  shipped and the header totals advanced accordingly
