## ADDED Requirements

### Requirement: Every audio cut begins at the millisecond requested
A cut taken from a book's Opus master SHALL begin at the requested position
and end at the requested position, within the tolerance of one decoded
frame — whether it is a chapter chunk or a single sentence. A cut SHALL NOT
begin at an earlier container boundary.

This supersedes the stream-copy cut, whose input seeking landed on the
enclosing Ogg page. That inaccuracy produced two user-visible defects: a
sentence preview that began with the previous sentence's audio, and a
playhead whose drawn window was shifted relative to the sound, because
manifest offsets assume the chunk starts exactly at the chapter's start.

#### Scenario: A sentence clip contains no neighbouring audio
- **WHEN** a sentence is cut from a book whose neighbouring sentences are
  audibly distinct
- **THEN** the clip contains no content belonging to the preceding sentence
- **AND** its duration matches the sentence's stored span

#### Scenario: A chapter chunk starts where the chapter starts
- **WHEN** a chapter chunk is produced
- **THEN** its first audio content corresponds to the chapter's start
  position in the master

### Requirement: Chapter chunks are prepared before they are needed
Chapter chunks SHALL be produced in the background once a split
configuration has been analysed, so that entering a chapter does not wait on
work that could have been done earlier. Entering a chapter whose chunk is not
yet prepared SHALL still succeed, more slowly, and SHALL NOT serve incorrect
audio.

#### Scenario: Chunks exist before any chapter is opened
- **WHEN** analysis of a newly uploaded book completes
- **THEN** chapter chunks exist on disk without any chapter having been opened

### Requirement: The playhead corresponds to what is heard
The playhead's position within a sentence's drawn waveform SHALL correspond
to the audio being heard, throughout playback.

#### Scenario: The drawn waveform and the sound coincide
- **WHEN** a sentence is played
- **THEN** the playhead's proportional position tracks elapsed playback time
- **AND** the audible content corresponds to the waveform under the playhead
