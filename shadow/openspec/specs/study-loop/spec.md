# study-loop

## Purpose
The focused single-sentence studying surface: the loop itself, its keyboard bindings, Compare with pitch overlay, on-demand transcription, the hand-off of the book's audio to Formant Lab, and the phone layout.

## Requirements

### Requirement: Studying is a focused single-sentence loop
The Study screen SHALL show one sentence at a time — its waveform, its
position in the book, and its chapter — and SHALL offer exactly four
primary controls, in the order of the operator's real workflow: play the
sentence, record, compare, and mark done then advance.

Playback of a sentence SHALL stop at that sentence's end and SHALL NOT run
on into the next.

No transcript SHALL be shown by default. The operator reads from a paper
book; text appears only when explicitly requested.

#### Scenario: The loop advances
- **WHEN** "done and next" is invoked
- **THEN** the current sentence is marked done, the position counter
  advances by one, and the next sentence is shown
- **AND** the done state survives a reload

#### Scenario: Playback is bounded by the sentence
- **WHEN** a sentence is played
- **THEN** playback ends at that sentence's end

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

There SHALL be no slow-playback control and no `S` binding. The prior 0.7×
feature is removed, not carried forward.

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

#### Scenario: Slow playback is absent
- **WHEN** the Study screen is open and `S` is pressed
- **THEN** nothing changes, and no slow-playback control is rendered

### Requirement: Compare plays both takes and overlays their pitch
Compare SHALL play the reference sentence followed by the learner's take. It
SHALL be a primary control on the phone as well as on the desktop.

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

### Requirement: Transcription is on demand, one sentence at a time
Transcription SHALL be requested per sentence, by explicit action, and
SHALL be fulfilled through shadow's existing smia proxy. The returned text
SHALL be stored against that sentence and shown on return to it, labelled
with its provenance. No sentence other than the one requested SHALL acquire
text, and there SHALL be no transcribe-ahead and no batch transcription.

#### Scenario: Only the requested sentence gains text
- **WHEN** transcription is requested for one sentence
- **THEN** that sentence shows the returned text, labelled as coming from smia
- **AND** the text is present after a reload
- **AND** no other sentence has acquired text

### Requirement: Formant Lab receives the audiobook's audio
Sending a sentence to phonexa's Formant Lab SHALL send the **audiobook's**
audio for that sentence, never the learner's recorded take, because Formant
Lab exists to analyse native vowels. This SHALL hold whether or not a take
is present.

#### Scenario: A take does not change what is sent
- **WHEN** a sentence is recorded and then sent to Formant Lab
- **THEN** the audio sent is the audiobook's sentence, not the recording

### Requirement: The phone runs the same loop with thumb-reachable controls
At phone viewports the Study screen SHALL present play, record, compare and
done-and-next as controls positioned in the lower half of the viewport.
Secondary actions — transcribe, Formant Lab, split, merge — SHALL live
behind a single disclosure whose trigger sits in the **top** region of the
screen, so the bottom remains reserved for the primary loop.

No screen SHALL scroll horizontally at 360 px width.

#### Scenario: The phone layout keeps the loop at the bottom
- **WHEN** the Study screen is shown at a 390×844 viewport
- **THEN** play, record, compare and done-and-next are in the lower half
- **AND** the disclosure for secondary actions is in the top region

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
