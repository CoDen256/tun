# Spec Delta

## ADDED Requirements

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
