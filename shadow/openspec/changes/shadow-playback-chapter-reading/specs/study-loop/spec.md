# Spec Delta

## ADDED Requirements

### Requirement: Every sentence player shares one play/pause model
Every control that plays a sentence — Study's sentence lane, Prepare's row
preview and Explore's cell preview — SHALL follow one model: play starts the
sentence from its beginning, and restarts it from its beginning when it is
playing or paused; a secondary pause control pauses playback with the
playhead frozen, and resumes from that point when pressed again. Starting
any player SHALL stop every other player on the page. The playhead SHALL
track actual playback in every player.

In Study, pause SHALL be a secondary control and SHALL NOT be one of the
four primary controls.

#### Scenario: Pause freezes and resumes
- **WHEN** pause is pressed mid-sentence and pressed again
- **THEN** the playhead stays still while paused and audio resumes from the
  paused point rather than the start

#### Scenario: Play still restarts
- **WHEN** play is pressed while paused
- **THEN** the sentence plays from its beginning

#### Scenario: One player at a time
- **WHEN** a preview is started while another sentence is playing
- **THEN** the first one stops

### Requirement: The microphone is held only while recording
shadow SHALL hold microphone access only between the start and the end of a
recording. When recording stops, is cancelled, or the Study screen is left,
every microphone track SHALL be released.

#### Scenario: The browser's mic indicator goes away
- **WHEN** a take is recorded and recording stops
- **THEN** the browser no longer reports the page as using the microphone

### Requirement: Done-and-next does not wait on the server
Invoking done-and-next SHALL show the next sentence without waiting for the
progress write to complete. If the write fails, the sentence SHALL revert to
not done and a visible error SHALL say so.

#### Scenario: Advancing is immediate
- **WHEN** done-and-next is invoked while the server responds slowly
- **THEN** the next sentence is shown before the progress write completes

#### Scenario: A failed save is not hidden
- **WHEN** the progress write fails
- **THEN** an error is shown and the previous sentence reads as not done

### Requirement: Split is chosen on a line shown only after Split is pressed
Invoking split in Study SHALL stop playback at once and show a split line on
the sentence's waveform — at the playing or paused position when inside the
sentence, otherwise at the middle — that can be dragged, tapped or nudged
with the arrow keys, together with controls to hear the left part, hear the
right part, confirm (Enter) and cancel (Escape). No split line SHALL be
shown before split is invoked, and no split SHALL happen without
confirmation. While splitting, the other study controls SHALL be inert.

#### Scenario: Split stops and waits
- **WHEN** split is invoked while the sentence plays
- **THEN** playback stops, a split line appears, and the sentence count is
  unchanged until confirm

#### Scenario: Cancel leaves the sentence whole
- **WHEN** a split line is moved and cancel is invoked
- **THEN** no split occurred and the line disappears

### Requirement: Moving to a sentence can play it at once
When the "play sentence when opened" setting is on, every operator-initiated
move to a sentence — done-and-next, next/previous, chapter step, choosing a
sentence from the progress strip or from Explore, and jump to first
unfinished — SHALL start that sentence playing without a further action, and
Study SHALL indicate that autoplay is active. When the setting is off, a
moved-to sentence SHALL stay silent until play is pressed. Audiobook mode is
not governed by this setting.

#### Scenario: Autoplay on
- **WHEN** the setting is on and done-and-next is invoked
- **THEN** the next sentence starts playing without pressing play

#### Scenario: Autoplay off
- **WHEN** the setting is off and next is invoked
- **THEN** the next sentence is shown and nothing plays

### Requirement: The phone's study header is two compact lines
At phone viewports the top of Study SHALL consist of a pull grabber and at
most two lines: an exit control, the book name and the secondary-actions
trigger on one; the chapter with previous/next chapter controls, the
sentence position and the audiobook control on the other. Pulling or tapping
the grabber SHALL reveal the navigation.

#### Scenario: Compact header
- **WHEN** Study is shown at a 390×844 viewport
- **THEN** exit, book name, more, chapter navigation, position and the
  audiobook control are all visible within the top two lines

### Requirement: New study bindings
In addition to the existing bindings, Study SHALL bind pause/resume to `K`
and start/resume audiobook mode to `L`; while splitting, `←`/`→` nudge the
split line, `Enter` confirms and `Escape` cancels. The shortcut overlay
SHALL list them.

#### Scenario: Keys reach the new actions
- **WHEN** `K` is pressed during playback and `L` is pressed when idle
- **THEN** playback pauses, and later audiobook mode starts
