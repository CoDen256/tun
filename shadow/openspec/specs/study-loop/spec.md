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
The Study screen SHALL bind: play (`Space`), record/stop (`R`), compare
(`C`), done-and-next (`Enter`), previous and next without marking (`←`,
`→`), transcribe (`T`), send to Formant Lab (`F`), split here (`X`), merge
with next (`M`), jump to first unfinished (`U`), leave (`Esc`), and a
shortcut overlay (`?`). Each visible control SHALL display its key.

Navigation with `←` and `→` SHALL NOT change any sentence's done state.

There SHALL be no slow-playback control and no `S` binding. The prior 0.7×
feature is removed, not carried forward.

#### Scenario: Navigating does not mark anything
- **WHEN** `→` is pressed five times
- **THEN** the number of sentences marked done is unchanged

#### Scenario: Slow playback is absent
- **WHEN** the Study screen is open and `S` is pressed
- **THEN** nothing changes, and no slow-playback control is rendered

### Requirement: Compare plays both takes and overlays their pitch
Compare SHALL play the reference sentence followed by the learner's take,
and SHALL render the two pitch contours overlaid with a legend
distinguishing them. It SHALL be a primary control on the phone as well as
on the desktop.

#### Scenario: Compare renders both contours
- **WHEN** compare is invoked after a recording
- **THEN** reference and take play in sequence and two distinguishable
  pitch contours are drawn with a legend

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
At phone viewports the Study screen SHALL present record, play and compare
as large controls plus a full-width done-and-next action, positioned in the
lower half of the viewport. Secondary actions — transcribe, Formant Lab,
split, merge — SHALL live behind a single disclosure whose trigger sits in
the **top** region of the screen, so the bottom remains reserved for the
primary loop.

No screen SHALL scroll horizontally at 360 px width.

#### Scenario: The phone layout keeps the loop at the bottom
- **WHEN** the Study screen is shown at a 390×844 viewport
- **THEN** record, play, compare and the done bar are in the lower half
- **AND** the disclosure for secondary actions is in the top region
