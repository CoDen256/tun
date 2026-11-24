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
