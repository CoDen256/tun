## MODIFIED Requirements

### Requirement: Every study action has a keyboard binding
The Study screen SHALL bind: play/restart (`Space`), record/stop (`R`),
compare (`C`), done-and-next (`Enter`), previous and next sentence without
marking (`←`, `→`), **previous and next chapter (`Shift+←`, `Shift+→`)**,
transcribe (`T`), send to Formant Lab (`F`), split here (`X`), merge with
next (`M`), jump to first unfinished (`U`), **show/hide pitch contours
(`P`)**, leave (`Esc`), and a shortcut overlay (`?`). Each visible control
SHALL display its key.

Navigation with `←` and `→` SHALL NOT change any sentence's done state.

**Pressing play while a sentence is already playing SHALL restart that
sentence from its beginning**, returning the playhead to the start. It SHALL
NOT stop playback.

There SHALL be no slow-playback control and no `S` binding.

#### Scenario: Play restarts rather than stops
- **WHEN** play is pressed while the sentence is already playing
- **THEN** the playhead returns to the start and the sentence plays again

#### Scenario: Chapter stepping
- **WHEN** the next-chapter binding is used
- **THEN** the chapter shown changes and the position moves to that
  chapter's first sentence

#### Scenario: Navigating does not mark anything
- **WHEN** the next-sentence binding is used repeatedly
- **THEN** the number of sentences marked done is unchanged

### Requirement: Compare plays both takes and overlays their pitch
Compare SHALL play the reference sentence followed by the learner's take.

The two pitch contours SHALL be drawn **each on its own waveform** — the
reference contour over the sentence's waveform and the take's contour over
the take's waveform. There SHALL be no separate contour panel.

Contours SHALL be hidable by a single control, and that preference SHALL
persist as the operator moves between sentences.

A pitch result SHALL NOT be rendered for a sentence the operator has already
left.

#### Scenario: Contours are drawn on their own waveforms
- **WHEN** compare is invoked after a recording
- **THEN** a contour appears over the sentence's waveform and another over
  the take's waveform, distinguishable in both light and dark themes
- **AND** no standalone contour graph is rendered

#### Scenario: A late result cannot paint onto the wrong sentence
- **WHEN** compare is invoked and the operator moves to another sentence
  before the analysis returns
- **THEN** no contour for the previous sentence appears on the new one

## ADDED Requirements

### Requirement: The sentence and the take are shown as two aligned lanes
The Study screen SHALL show two vertically stacked waveform lanes sharing one
time axis: the sentence above, the learner's take below, with identical
horizontal extent so the two can be compared directly. The take's lane SHALL
use a visually distinct treatment from the sentence's.

The take lane SHALL retain its height when no take exists, so that recording
and stopping does not move the controls beneath it. While recording, the take
lane SHALL show a live waveform occupying the position the finished take will
occupy.

#### Scenario: The layout does not move when a take appears
- **WHEN** a sentence is recorded and recording stops
- **THEN** the vertical position of the control buttons is unchanged

#### Scenario: Recording is shown where the take will be
- **WHEN** recording is in progress
- **THEN** a live waveform is shown between the sentence's lane and the
  control buttons

### Requirement: Done and not-done sentences are unmistakable
In the chapter progress strip, done and not-done sentences SHALL be
distinguished by more than a difference in lightness, and the current
sentence SHALL be distinct from both.

#### Scenario: The distinction does not rely on lightness alone
- **WHEN** a done and a not-done cell are compared
- **THEN** they differ in fill treatment, not only in lightness

### Requirement: The phone omits the chapter progress strip
At phone viewports the chapter progress strip SHALL NOT be rendered. This is
a deliberate reduction — the operator judged it too much information for the
screen — and SHALL NOT be reinstated as a fix.

#### Scenario: No strip on the phone
- **WHEN** the Study screen is shown at a phone viewport
- **THEN** no chapter progress strip is rendered

### Requirement: The phone's controls are equal and its navigation is recoverable
At phone viewports the primary controls SHALL be four buttons of equal
size — play, record, compare, and done-and-next — with no button enlarged
relative to the others and no full-width done action.

The top navigation SHALL be hidden during study and SHALL be revealed by a
deliberate pull from the top edge, hiding again after the next action.

#### Scenario: Four equal controls
- **WHEN** the Study screen is shown at a phone viewport
- **THEN** the four primary controls are the same size as one another

#### Scenario: Navigation is hidden but recoverable
- **WHEN** the Study screen is shown at a phone viewport
- **THEN** the navigation is not visible
- **AND** pulling down from the top edge reveals it
