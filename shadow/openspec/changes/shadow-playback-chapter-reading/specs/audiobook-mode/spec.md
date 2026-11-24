# Spec Delta

## Purpose
Hands-free reading of a chapter the way the audiobook was recorded: shadow
advances sentence by sentence by itself, the operator can stop at any
sentence to study it in the normal loop, and then resume.

## ADDED Requirements

### Requirement: Audiobook mode reads the chapter from the current sentence
Study SHALL offer an audiobook control beside the chapter name (key `L`)
that plays the current chapter from the start of the current sentence
onward, advancing the shown sentence, position counter, waveform and live
playhead automatically as playback crosses each sentence boundary, and
saving the reading position as it goes. Audiobook mode SHALL NOT mark any
sentence done.

#### Scenario: It advances by itself
- **WHEN** audiobook mode is started on sentence 12
- **THEN** sentences 12, 13, 14… are shown in turn without any further input
- **AND** the number of done sentences is unchanged

### Requirement: Tempo follows the audiobook trim setting
With "trim in audiobook mode" off (the default), audiobook mode SHALL play
the chapter audio continuously, including the original pauses between
sentences, without gaps introduced between sentences. With it on, it SHALL
play each sentence's speech window back to back.

#### Scenario: Natural tempo is continuous
- **WHEN** audiobook mode runs with the setting off
- **THEN** the audio heard equals the chapter recording from the start
  sentence onward, with its pauses and without added silence

### Requirement: Audiobook mode is unmistakable while it runs
While audiobook mode runs, a banner SHALL state that the chapter is being
read automatically, name the chapter and position, show whether the tempo
is natural or trimmed, and offer a large Stop. On the phone the four primary
controls SHALL be replaced by a full-width stop control, and the screen
SHALL be kept awake for as long as the mode runs.

#### Scenario: The banner is shown
- **WHEN** audiobook mode is started
- **THEN** the banner with Stop is visible until the mode ends

#### Scenario: The phone screen stays on
- **WHEN** audiobook mode runs on a phone
- **THEN** the screen does not dim or lock until the mode stops

### Requirement: Any interaction stops on the sentence being heard
The banner's Stop, Space, Escape, a tap on the sentence waveform, and any
study action SHALL stop audiobook mode, leaving Study on the sentence that
was playing, in the normal study loop. The press that stops SHALL NOT also
perform its action.

#### Scenario: A study action stops without acting
- **WHEN** record is pressed while audiobook mode runs
- **THEN** audiobook mode stops on the current sentence and no recording starts

### Requirement: Resuming continues from the next sentence
After a stop, the audiobook control SHALL offer to resume from the sentence
after the one it stopped on, and resuming SHALL start there.

#### Scenario: Resume after studying
- **WHEN** audiobook mode is stopped on sentence 20, the sentence is studied,
  and resume is invoked
- **THEN** reading continues from the start of sentence 21

### Requirement: Audiobook mode ends at the end of the chapter
Audiobook mode SHALL stop after the chapter's last sentence, say so, and
offer the next chapter. It SHALL NOT continue into the next chapter.

#### Scenario: Chapter end
- **WHEN** audiobook mode reaches the end of the chapter's last sentence
- **THEN** playback stops, an end-of-chapter message is shown, and the next
  chapter is not playing
