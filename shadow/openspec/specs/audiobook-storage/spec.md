# audiobook-storage

## Purpose
How shadow receives an audiobook and what it keeps. One Opus master per book, uploaded whole in resumable slices, downloaded by the client as chapter chunks; audio stays out of the backup set and the learner's own recordings are never persisted.

## Requirements

### Requirement: An audiobook is uploaded whole and stored as one Opus master
shadow SHALL accept a complete audio file and store, per book, **exactly
one** audio artefact: a mono Opus master transcoded once on receipt. The
uploaded original SHALL be discarded once the transcode succeeds.

This REVERSES the prior rule — recorded in `db/models.py`, `shadowing.py`
and D147 — that shadow stores no audio server-side. The reversal is
deliberate and operator-authorised. What was originally reverted was
server-side *decoding per request*; this requirement forbids that and
permits only a one-time transcode, so the original failure mode cannot
return.

No per-sentence audio artefact SHALL ever be produced or stored. The number
of audio files attributable to a book SHALL NOT scale with its sentence
count.

#### Scenario: A book is uploaded and transcoded
- **WHEN** an operator uploads an audiobook file
- **THEN** one mono Opus file exists for that book
- **AND** no artefact equal to the uploaded original remains
- **AND** the book's reported duration matches the source within one second

#### Scenario: Splitting produces no audio files
- **WHEN** a book of at least fifty sentences is analysed into segments
- **THEN** the count of stored audio files for that book does not increase
  by the number of sentences

### Requirement: Uploads are chunked and resumable
The client SHALL upload in slices and the server SHALL append them to a
temporary file, transcoding only once the final slice has arrived. An
interrupted upload SHALL resume from the last slice the server
acknowledged, NOT from the beginning. The server SHALL stream slices to
disk and SHALL NOT buffer a whole book in memory.

Upload progress SHALL be shown as a determinate bar naming bytes sent and
bytes total.

#### Scenario: An interrupted upload resumes
- **WHEN** an upload is interrupted part-way and the same file is offered again
- **THEN** progress resumes near where it stopped rather than at zero
- **AND** the resulting book's duration matches the source file

### Requirement: The client's unit of audio download is a chapter chunk
A chapter's audio SHALL be cut from the Opus master on demand, cached, and
served as one chunk accompanied by the sentence ranges it contains. A cut
SHALL be a stream copy, not a re-encode. The cache SHALL be derivable, such
that deleting it costs only a re-cut.

Having fetched a chapter chunk, the client SHALL play any sentence in that
chapter without a further audio request.

#### Scenario: Sentences play from an already-fetched chapter
- **WHEN** a chapter has been entered and its chunk fetched
- **AND** five different sentences in that chapter are played
- **THEN** no additional audio request is issued

### Requirement: Stored audiobook audio is excluded from the backup set
The volume holding masters and the chapter-chunk cache SHALL NOT be added
to the backup service's mirror set. Split configs, boundaries, progress,
the cursor and transcripts live in the `shadow` database, which is already
dumped; masters are re-uploadable.

#### Scenario: A backup run does not grow with audiobook content
- **WHEN** a backup run completes after a book has been uploaded
- **THEN** no file in the backup repository contains that book's audio

### Requirement: Recordings of the learner's voice are never persisted
A recorded take SHALL exist only in the browser for the duration of the
session. It SHALL NOT be uploaded, written to disk server-side, or included
in any backup. The UI SHALL NOT present a take as something that survives
the session.

#### Scenario: A take does not survive a reload
- **WHEN** a sentence is recorded and the page is reloaded
- **THEN** no stored take is offered for that sentence
- **AND** no request carrying recorded audio was sent to the server
