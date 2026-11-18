## MODIFIED Requirements

### Requirement: The whole book can be browsed by chapter and sentence
The Explore screen SHALL list chapters collapsed, each with its done count
and progress, and SHALL reveal on expansion the sentences it contains with
their number, done state and duration. Every sentence SHALL offer a preview
that plays only that sentence.

**Activating a sentence anywhere on its cell** SHALL open the Study screen
positioned on it — the target SHALL NOT be restricted to the sentence's
number. The preview control SHALL be its own distinct target within the cell
and SHALL NOT open Study.

#### Scenario: The whole cell opens the sentence
- **WHEN** a sentence's cell is activated anywhere other than its preview control
- **THEN** Study opens positioned on that sentence

#### Scenario: The preview does not navigate
- **WHEN** a sentence's preview control is activated
- **THEN** only that sentence's audio plays and Study does not open

### Requirement: Sentences can be marked done in bulk
Explore SHALL allow selecting a contiguous range of sentences and an entire
chapter from its header. The current selection SHALL be reported by count and
SHALL offer marking done, marking not done, and clearing.

Selection by activating a cell SHALL require an explicit selection mode, so
that activating a cell in the default mode opens the sentence rather than
selecting it. Chapter-header selection SHALL remain available regardless of
mode.

Bulk marking SHALL write through the same completed-time-ranges record as
single marking, so its effects are visible in every split configuration.

#### Scenario: Default mode does not select
- **WHEN** selection mode is off and a sentence cell is activated
- **THEN** Study opens and no selection is started

#### Scenario: Selection mode selects
- **WHEN** selection mode is on and sentence cells are activated
- **THEN** they are selected and the count is reported

#### Scenario: Chapter selection is always available
- **WHEN** a chapter header's selection control is used
- **THEN** every sentence in that chapter is selected, in either mode
