## ADDED Requirements

### Requirement: One navigation, four screens
shadow SHALL present a single navigation offering Library, Explore, Study
and Prepare. No screen SHALL render a second tab row beneath that
navigation.

#### Scenario: There is only one tab row
- **WHEN** any of the four screens is open
- **THEN** exactly one navigation bar is rendered

### Requirement: The library shows every book and where you left off
The Library SHALL list the operator's books with duration, chapter count,
progress, and the current reading position expressed as chapter and
sentence. It SHALL offer upload, and SHALL show a determinate analysing
state while a split is running.

shadow SHALL NOT offer a control for selecting a time range to load; books
are stored whole.

#### Scenario: A book shows its position
- **WHEN** the Library is opened for a profile with a part-read book
- **THEN** that book's row names the chapter and sentence of the cursor

### Requirement: The whole book can be browsed by chapter and sentence
The Explore screen SHALL list chapters collapsed, each with its done count
and progress, and SHALL reveal on expansion the sentences it contains with
their number, done state and duration. Every sentence SHALL offer a preview
that plays only that sentence.

Clicking a sentence SHALL open the Study screen positioned on it.

#### Scenario: A preview plays one sentence
- **WHEN** a sentence's preview is invoked in Explore
- **THEN** only that sentence's audio plays

#### Scenario: Browsing leads into studying
- **WHEN** a sentence is chosen in Explore
- **THEN** Study opens positioned on that sentence

### Requirement: Sentences can be marked done in bulk
Explore SHALL allow selecting a contiguous range of sentences by choosing a
first and then a last, and SHALL allow selecting an entire chapter from its
header. The current selection SHALL be reported by count, and SHALL offer
marking done, marking not done, and clearing.

Bulk marking SHALL write through the same completed-time-ranges record as
single marking, so its effects are visible in every split configuration.

#### Scenario: A range is selected and marked
- **WHEN** a first and then a last sentence are chosen
- **THEN** the contiguous range between them is selected and its count reported
- **AND** marking it done increases the book's done count by the number of
  those sentences that were not already done
- **AND** the change survives a reload

#### Scenario: A chapter is selected from its header
- **WHEN** a chapter's header selection control is used
- **THEN** every sentence in that chapter is selected

#### Scenario: Bulk un-marking is visible in another configuration
- **WHEN** a selection is marked not done
- **THEN** sentences of another configuration lying inside that span no
  longer read as done
