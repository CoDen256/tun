# book-browsing

## Purpose
How the operator moves around a book: the four-screen navigation, the library view with its resume points, browsing by chapter and sentence, and bulk marking.

## Requirements

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

#### Scenario: A range is selected and marked
- **WHEN** selection mode is on and a first and then a last sentence are chosen
- **THEN** the contiguous range between them is selected and its count reported
- **AND** marking it done increases the book's done count by the number of
  those sentences that were not already done
- **AND** the change survives a reload

#### Scenario: Bulk un-marking is visible in another configuration
- **WHEN** a selection is marked not done
- **THEN** sentences of another configuration lying inside that span no
  longer read as done

### Requirement: Explore previews play from the chapter's audio
An Explore preview SHALL play from the chapter audio the client already
holds for that chapter, loading it when the chapter is expanded, rather than
requesting a separately cut clip per sentence. A preview whose chapter audio
is not yet available SHALL show a loading state and SHALL NOT play silence
or another sentence's audio. The preview's progress indication SHALL follow
the actual playback position.

#### Scenario: Previews do not request per-sentence clips
- **WHEN** a chapter is expanded and five of its previews are played
- **THEN** no per-sentence audio request is made
- **AND** each preview plays its own sentence audibly

#### Scenario: The live line follows the sound
- **WHEN** a preview is paused halfway
- **THEN** its progress indication stops at about half and stays there

### Requirement: Chapter titles are shown where chapters are named
A chapter that has a title SHALL be shown with its automatic number and its
title in Explore and in Study's chapter label.

#### Scenario: A titled chapter
- **WHEN** chapter 3 is given the title "Første del" in Prepare
- **THEN** Explore and Study show "Chapter 3 · Første del"
