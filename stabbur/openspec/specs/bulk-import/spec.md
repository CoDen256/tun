# bulk-import Specification

## Purpose
TBD - created by archiving change bulk-import-anki-csv. Update Purpose after archive.
## Requirements
### Requirement: External vocabulary sources are ingested verbatim before any transformation
The system SHALL parse each external source into a per-source raw record
preserving every original field value unchanged, and SHALL keep that raw
record available for the rest of the pipeline, so that a parsing or mapping
error can be corrected without re-reading the source archives.

#### Scenario: Ingesting an Anki archive
- **WHEN** an `.apkg` archive is ingested
- **THEN** every note in it is recorded with its original field values, its
  note type, its tags, and its own source identifier

#### Scenario: Re-running a later stage after a mapping bug
- **WHEN** a field-mapping error is discovered after ingest has completed
- **THEN** the mapping can be corrected and re-applied without re-parsing
  the source archives

#### Scenario: Sources with incompatible field models
- **WHEN** sources with different and incompatible field models are ingested
- **THEN** each is parsed by rules specific to that source, with no
  requirement that they share a field structure

### Requirement: Source-specific notation is parsed before a candidate's shape is determined
The system SHALL interpret each source's own notation conventions for
encoding inflection and gender, and SHALL determine whether a candidate is a
single lexeme or a multiword expression only after that notation has been
removed.

#### Scenario: A noun carrying a gender marker
- **WHEN** a wordlist entry reads `område /et`
- **THEN** it is treated as the single-word lexeme `område` with neuter
  gender recorded, not as a two-word expression

#### Scenario: A verb carrying a past-tense suffix
- **WHEN** a wordlist entry reads `spå /-dde`
- **THEN** it is treated as the single-word lexeme `spå` with its past form
  recorded

#### Scenario: A genuine multiword expression
- **WHEN** an entry reads `være i stand til` and contains no notation markers
- **THEN** it is treated as a multiword expression

### Requirement: A candidate is known only if stock attests it exactly
The system SHALL treat as already-known every word appearing in the existing
learned material's Norwegian text, together with every contiguous sequence of
words attested there, and SHALL NOT treat any unattested sequence as known
regardless of whether its parts are.

#### Scenario: A particle verb attested in the learned material
- **WHEN** the learned material contains `legge til noen i kopi` and the
  candidate is `legge til`
- **THEN** the candidate is known, because that sequence is attested within it

#### Scenario: A particle verb not attested anywhere
- **WHEN** the candidate is `legge an` and no such sequence appears anywhere
  in the learned material, even though `legge` is known
- **THEN** the candidate is imported

#### Scenario: Every subset of an attested sentence is known
- **WHEN** the learned material contains the sentence `Vi bor der`
- **THEN** `vi`, `bor`, `der`, `vi bor`, `bor der` and `vi bor der` are all
  known

#### Scenario: No upper length limit on attestation
- **WHEN** a candidate's surface form is a word sequence longer than a few
  words and that exact sequence appears in the learned material
- **THEN** the candidate is known, with no length threshold above which
  attestation stops being checked

#### Scenario: Inflection closure is expansive
- **WHEN** any inflected form of a lemma appears in the learned material
- **THEN** every inflected form of that lemma is known

### Requirement: Partial, substring and head-only matching is prohibited
The system SHALL NOT discard a candidate on the basis of a substring match,
a prefix match, a match on its head alone, or a match on any subset of its
tokens. Discarding a candidate SHALL require exact attestation of its own
full surface sequence in the learned material.

#### Scenario: A compound word sharing a prefix with a known word
- **WHEN** the candidate `aleneforsørger` is judged against known material
  containing `alene`
- **THEN** the candidate is imported, because a prefix match is not grounds
  for discarding

#### Scenario: A coincidental prefix overlap
- **WHEN** the candidate `allerede` is judged against known material
  containing `alle`
- **THEN** the candidate is imported

#### Scenario: An idiom whose words are known but which is not itself attested
- **WHEN** the candidate `bli klar over` is judged, every one of its tokens
  appears in the learned material, but that sequence does not
- **THEN** the candidate is imported, not discarded

### Requirement: Norwegian text is identified by corpus scoring, not by card structure
The system SHALL decide whether a line of the learned material is Norwegian
by scoring its words against a Norwegian lexicon, and SHALL NOT decide it
from the card's deck, its field names, or any other structural property of
the card.

#### Scenario: A Norwegian-English homograph appearing in English prose
- **WHEN** a Norwegian candidate coincides with an English word that appears
  in the learned material's explanatory prose
- **THEN** the candidate is not discarded on the basis of those prose
  occurrences

#### Scenario: No deck or field is excluded wholesale
- **WHEN** a deck contains a mixture of vocabulary cards and
  grammar-explanation cards
- **THEN** its vocabulary cards still contribute to the known-set, with no
  deck or field excluded in its entirety

#### Scenario: Inline markup does not fragment a line
- **WHEN** a line of explanatory prose contains inline emphasis markup
- **THEN** the line is scored as a whole rather than split into fragments at
  the markup boundaries

#### Scenario: Stabbur's own previously-published content is excluded
- **WHEN** the known-set is extracted from a bundle that also contains cards
  previously generated from stabbur's own notes
- **THEN** those cards are excluded, so the import does not treat its own
  prior output as pre-existing knowledge

### Requirement: A deny-list vetoes weak evidence only
The system SHALL maintain a reviewable list of words that must not be
discarded on weak evidence, and SHALL NOT allow that list to override direct
evidence that the learned material teaches the word as its own subject.

#### Scenario: A listed word that the learned material teaches directly
- **WHEN** a listed word appears in the learned material as a dedicated
  vocabulary entry with its own gloss
- **THEN** it is known, and its presence on the list does not prevent that

#### Scenario: A listed word appearing only in foreign-language prose
- **WHEN** a listed word appears in the learned material only inside
  explanatory prose in another language
- **THEN** it is imported, not discarded

### Requirement: Uncertainty always resolves toward importing
The system SHALL import and flag a candidate whenever any step of its
judgement is uncertain, and SHALL NOT discard a candidate on uncertain
evidence.

#### Scenario: Lemma resolution fails for a candidate
- **WHEN** a candidate's lemma cannot be resolved from the available
  inflection data
- **THEN** the candidate is imported and flagged, not discarded

#### Scenario: A candidate's head is known but its full form is not
- **WHEN** a candidate shares a head with known material but differs in
  particles or reflexivity
- **THEN** the candidate is imported, carrying a reference to the known
  related form so the operator can judge it

### Requirement: Every judgement records the evidence that produced it
The system SHALL record, for each candidate, the verdict reached and the
evidence it rests on, including which known material it matched and which
rule applied.

#### Scenario: Reviewing why a candidate was flagged
- **WHEN** the operator examines a flagged candidate
- **THEN** the specific rule that flagged it and the known material it
  relates to are both visible

#### Scenario: Auditing what was discarded
- **WHEN** an import run completes
- **THEN** every discarded candidate is recorded with its evidence and is
  reviewable, so a wrongly discarded lexeme can be found and recovered

### Requirement: One candidate per lexeme, merged by fixed source priority
The system SHALL produce exactly one candidate per lexeme signature,
populating each field from the highest-priority source that supplies a
non-empty value, according to a fixed source priority order.

#### Scenario: A lexeme present in four sources
- **WHEN** a lexeme appears in four sources with differing field coverage
- **THEN** one candidate is produced, each of its fields taken from the
  highest-priority source that supplies that field

#### Scenario: A higher-priority source lacking a field
- **WHEN** the highest-priority source has no value for a field but a
  lower-priority source does
- **THEN** the lower-priority source's value is used

### Requirement: Conflicting values between sources are recorded, not silently dropped
The system SHALL retain the losing value when two sources supply different
non-empty values for the same field, and SHALL flag the candidate as
conflicted.

#### Scenario: Two sources gloss a word differently
- **WHEN** two sources supply different translations for the same lexeme
- **THEN** the candidate is flagged as conflicted and both values are
  visible to the operator

### Requirement: Candidates are reviewed in usefulness order
The system SHALL order the review queue by the usefulness signals available
in the sources — frequency ranking first, then proficiency band, then
position in a textbook progression — so that stopping review at any point
has yielded the most useful candidates. The system SHALL use every frequency
ranking a source actually carries, including rankings stored outside a
source's note fields, and SHALL keep rankings from different sources as
distinct signals rather than merging them into a single cross-source rank.

#### Scenario: Stopping review early
- **WHEN** the operator reviews part of the queue and stops
- **THEN** the candidates reviewed are the highest-ranked ones, and the
  remainder stay queued with their judgements and merges intact

#### Scenario: A source whose frequency rank is not a note field
- **WHEN** a source orders its own material by frequency somewhere other
  than in its note fields
- **THEN** that ordering is captured at ingest and used for its candidates

#### Scenario: Two sources with independent frequency rankings
- **WHEN** two sources each supply a frequency ranking over different corpora
- **THEN** they are retained as separate signals, and no combined
  cross-source rank is fabricated from them

#### Scenario: A candidate with no ranking signal
- **WHEN** a candidate comes only from sources that supply no frequency or
  proficiency signal
- **THEN** it is still queued, ordered after those that have one

### Requirement: The pipeline is stage-wise, resumable, and separately re-runnable
The system SHALL organise the import as discrete stages, each reading the
previous stage's output and writing its own, such that any stage can be
re-run without repeating the others and without discarding the operator's
review decisions.

#### Scenario: Interrupting an import
- **WHEN** an import is interrupted partway through any stage
- **THEN** it can be resumed without repeating already-completed stages

#### Scenario: Correcting the known-set after review has begun
- **WHEN** the known-set extraction is corrected after the operator has
  already reviewed some candidates
- **THEN** judgements can be recomputed while the existing review decisions
  are preserved

#### Scenario: Observing progress
- **WHEN** an import runs
- **THEN** each stage logs what it processed, what it produced, and what it
  discarded, identified by run

### Requirement: Accepted candidates enter stabbur as drafts, never as ready
The system SHALL create each accepted candidate as a note with
`status=draft`, `origin=import`, and an `import_ref` identifying its source,
and SHALL NOT create any note with `status=ready`.

#### Scenario: Pushing an accepted candidate
- **WHEN** the operator accepts a candidate and it is pushed to stabbur
- **THEN** a note is created with `status=draft` and `origin=import`,
  carrying an `import_ref` naming its source, source note, and run

#### Scenario: Review in the import tool does not substitute for stabbur's review
- **WHEN** a candidate has been accepted during import review
- **THEN** the resulting note still requires stabbur's own draft-to-ready
  review before it is considered correct

### Requirement: Pushing is idempotent and traceable back to the created note
The system SHALL record the created note's id on the candidate once pushed,
SHALL skip candidates that already carry one, and SHALL therefore allow an
interrupted push to resume without creating duplicates.

#### Scenario: Resuming an interrupted push
- **WHEN** a push is interrupted after creating some notes and is re-run
- **THEN** only candidates without a recorded note id are pushed

#### Scenario: Undoing an unwanted import
- **WHEN** the operator determines after the fact that a pushed candidate
  should not have been imported
- **THEN** the candidate's recorded note id identifies exactly which note to
  remove

### Requirement: Only human audio is imported
The system SHALL import audio only from sources whose recordings are human,
SHALL NOT import machine-synthesised audio, and SHALL import a candidate
with no audio rather than substituting synthesised audio for it. The system
SHALL apply this when selecting a candidate's audio, not only when creating
the note, so that a candidate's recorded audio is the audio it will actually
receive.

#### Scenario: A source containing synthesised audio
- **WHEN** a source's audio is machine-synthesised
- **THEN** none of its audio is imported, while its text content still is

#### Scenario: Selecting audio across sources
- **WHEN** a candidate's highest-priority source for audio offers only
  synthesised audio and no human recording exists in any source
- **THEN** the candidate is recorded as having no audio, rather than
  carrying a synthesised reference that is discarded later

#### Scenario: A candidate with no human audio available
- **WHEN** no accepted source supplies human audio for a candidate
- **THEN** the candidate is imported with no audio, to be voiced later
  during authoring

#### Scenario: The same recording present in two sources
- **WHEN** two accepted sources supply byte-identical recordings for a
  lexeme
- **THEN** one content-addressed blob results, not two

### Requirement: Imported note types are determined per candidate, not per source
The system SHALL determine each candidate's note type from the candidate
itself, and SHALL NOT assume that all candidates from one source share a
type.

#### Scenario: A source mixing single words and full sentences
- **WHEN** a source's primary field contains single lexemes for some notes
  and full sentences for others
- **THEN** each is typed individually, with sentences typed as listening and
  lexemes as word or expression

#### Scenario: Grammar material is not imported
- **WHEN** a source contains grammar exercise material
- **THEN** no note of type grammar and no grammar rule is created from it

### Requirement: Part of speech is written in the canonical vocabulary
The system SHALL write a note's part of speech using only the canonical
values the rest of the ecosystem recognises, and SHALL NOT pass a source's
own part-of-speech vocabulary through unchanged.

#### Scenario: A source labelling parts of speech in another language
- **WHEN** a source labels a word with a part-of-speech term from a
  different vocabulary than the canonical one
- **THEN** the note is written with the canonical equivalent, not the
  source's term

#### Scenario: A source term that coincides with a canonical one
- **WHEN** a source's term happens to be spelled identically to a canonical
  value
- **THEN** it is still resolved through the mapping rather than relied upon
  to coincide

### Requirement: A source part-of-speech value with no canonical equivalent resolves to none
The system SHALL leave the part of speech unset when a source's value has no
canonical equivalent, and SHALL NOT substitute the closest-looking canonical
value.

#### Scenario: A source category outside the canonical set
- **WHEN** a source labels a word with a category that has no canonical
  equivalent
- **THEN** that label contributes no part of speech, and the remaining
  signals are used instead

#### Scenario: No signal resolves a part of speech
- **WHEN** no available signal resolves a word note's part of speech
- **THEN** it is left unset and reported as unresolved, rather than being
  given a default

### Requirement: Part of speech is inferred from the inflection shape in preference to any other signal
The system SHALL infer a word note's part of speech from the shape of its
inflection data where that data is present, in preference to the source's
own label, the note's text, or its translations.

#### Scenario: Inflection data identifying a noun
- **WHEN** a note's inflection data carries keys belonging only to the noun
  shape
- **THEN** its part of speech is the noun value, regardless of what the
  source labelled it

#### Scenario: Inflection shape disagreeing with the source label
- **WHEN** the inflection shape and the source's own label imply different
  parts of speech
- **THEN** the inflection shape decides

#### Scenario: No inflection data present
- **WHEN** a note has no inflection data
- **THEN** the remaining signals are consulted in order of decreasing
  reliability

### Requirement: Disagreeing part-of-speech signals are recorded as a conflict
The system SHALL record a conflict when two signals imply different parts of
speech, alongside the value it selected, using the same mechanism as
cross-source field conflicts.

#### Scenario: Two signals disagreeing
- **WHEN** one signal implies a verb and another implies a noun for the same
  note
- **THEN** the higher-precedence signal's value is applied and the
  disagreement is recorded so the operator sees it during review

### Requirement: Only lexical-item notes carry a part of speech
The system SHALL NOT assign a part of speech to notes that are not single
lexical items, because those are routed by note type rather than by part of
speech.

#### Scenario: A sentence-shaped note
- **WHEN** a note's type is the sentence-shaped type
- **THEN** no part of speech is written for it, and this is correct rather
  than incomplete

#### Scenario: A multiword expression note
- **WHEN** a note's type is the expression type
- **THEN** no part of speech is written for it

### Requirement: Lemma is derived consistently with the authoring UI
The system SHALL derive a lemma for lexical-item notes by removing any
leading indefinite article or infinitive marker from the headword, using the
same rule the authoring interface uses for the same purpose.

#### Scenario: A verb headword
- **WHEN** a word note's text is an infinitive carrying its marker
- **THEN** its lemma is the text with that marker removed

#### Scenario: A noun headword with an article
- **WHEN** a word note's text carries a leading indefinite article
- **THEN** its lemma is the text with that article removed

#### Scenario: The same note derived by either side
- **WHEN** the authoring interface derives a lemma for a note the import
  already derived one for
- **THEN** both produce the same value

#### Scenario: A note that is not a single lexical item
- **WHEN** a note is an expression rather than a single lexical item
- **THEN** no lemma is derived for it

### Requirement: Imported text carries no invisible or non-printing characters
The system SHALL normalise non-breaking and zero-width characters in text
destined for stabbur, at the point the text is normalised rather than at the
point it is displayed, so that no invisible character reaches a note.

#### Scenario: A source using a non-breaking space
- **WHEN** a source's entry separates an article from its word with a
  non-breaking space
- **THEN** the stored text contains an ordinary space

#### Scenario: Normalisation covers the character class, not one character
- **WHEN** a source introduces a non-breaking or zero-width character other
  than the ones currently observed
- **THEN** it is normalised by the same rule, without that rule needing to
  enumerate it individually

### Requirement: A candidate whose every word is known is skipped only when it is compositional
The system SHALL skip a candidate all of whose words are already known only
when that candidate is sentence-shaped, and SHALL NOT skip a lexical item or
multiword expression on the grounds that all of its words are known.

#### Scenario: A sentence made entirely of known words
- **WHEN** every word of a sentence-shaped candidate is already known
- **THEN** the candidate is skipped

#### Scenario: An idiom made entirely of known words
- **WHEN** every word of a multiword expression is already known but the
  expression itself is not attested
- **THEN** the candidate is still presented for review, because its meaning
  does not follow from its parts

#### Scenario: A single lexical item that is already known as a word
- **WHEN** a single-word candidate's own form is known
- **THEN** it is handled by the existing attestation rule, not by this one

### Requirement: Initial capitalisation gates the fully-known skip
The system SHALL treat an initial capital as a precondition of the
fully-known skip, and SHALL NOT skip any candidate lacking one on the
grounds that its words are known, regardless of its note type, word count, or
how many of its words are known.

#### Scenario: A lowercase expression whose words are all known
- **WHEN** a lowercase candidate's every word is known
- **THEN** it is presented for review

#### Scenario: A lowercase sentence-length candidate
- **WHEN** a candidate is lowercase and several words long, and all its words
  are known
- **THEN** it is still presented for review

#### Scenario: A capitalised candidate with an unknown word
- **WHEN** a capital-initial sentence contains a word that is not known
- **THEN** it is presented for review

### Requirement: The fully-known skip does not depend on whether audio exists
The system SHALL decide the fully-known skip from word knowledge alone, and
SHALL NOT require the absence of audio as a condition, while allowing that
condition to be enabled for comparison.

#### Scenario: A fully-known sentence that has a recording
- **WHEN** a capital-initial sentence whose words are all known also has
  audio
- **THEN** it is skipped

#### Scenario: Reporting the alternative
- **WHEN** the eligibility report is produced
- **THEN** it shows the queue totals both with and without the audio
  condition applied

### Requirement: Proper nouns, derived nationality words and numerals are skipped
The system SHALL skip lexical-item candidates that are proper nouns, words
derived from proper nouns, or wholly numeric expressions.

#### Scenario: A place or personal name
- **WHEN** a single-token candidate's own text and its translation are both
  capitalised
- **THEN** it is skipped as a proper noun

#### Scenario: A word derived from a proper noun
- **WHEN** a candidate's text is lowercase and its translation is
  capitalised
- **THEN** it is skipped as derived from a proper noun

#### Scenario: A number word
- **WHEN** a candidate's entire text is a number expression
- **THEN** it is skipped as a numeral

#### Scenario: A word that merely contains a number
- **WHEN** a candidate's text contains a number word as part of a longer
  phrase
- **THEN** it is not skipped as a numeral

#### Scenario: A sentence whose translation begins with a capital
- **WHEN** a sentence-shaped candidate's translation begins with a capital
  because it is a sentence
- **THEN** it is not skipped as a proper noun

### Requirement: Sentences mistyped as lexical items are re-typed where types are assigned
The system SHALL detect a candidate whose source placed sentence content in a
single-word field and assign it the sentence-shaped note type, at the stage
where note types are determined rather than in each rule that consumes them.

#### Scenario: A source field holding a sentence
- **WHEN** a source's single-word field contains a full sentence
- **THEN** that candidate is typed as sentence-shaped

#### Scenario: Downstream consumers see the corrected type
- **WHEN** any later stage reads such a candidate's note type
- **THEN** it reads the corrected type, with no rule needing to re-detect it

### Requirement: Candidates are pushed in review order
The system SHALL create notes in the same order the review queue presented
them, so that the ordering the operator reviewed in is the ordering recorded
downstream.

#### Scenario: Pushing accepted candidates
- **WHEN** accepted candidates are pushed
- **THEN** they are created in the review queue's ordering, not in an
  arbitrary or storage-dependent order

#### Scenario: An interrupted push resumed
- **WHEN** a push is interrupted and resumed
- **THEN** the remaining candidates are still created in review order

### Requirement: A recorded decision outranks a later skip rule
The system SHALL keep a candidate that already carries an operator decision
eligible and decided, and SHALL NOT allow a newly-introduced skip rule to
remove it from the operator's record.

#### Scenario: A new rule contradicting an accepted candidate
- **WHEN** a newly-introduced rule would skip a candidate the operator has
  already accepted
- **THEN** the candidate remains accepted and eligible for pushing

#### Scenario: New rules apply to undecided candidates
- **WHEN** a newly-introduced rule matches a candidate with no decision
- **THEN** it is skipped as the rule dictates

#### Scenario: Disagreements are reported
- **WHEN** a new rule's verdict contradicts a recorded decision
- **THEN** the disagreement appears in the eligibility report without
  changing the decision

### Requirement: Changes to review eligibility are reported for verification
The system SHALL produce a report comparing review eligibility before and
after a change to the rules, listing every candidate whose eligibility
changed, grouped by the rule responsible, with the evidence behind each — so
that the operator can confirm the filtering was correct and recover anything
wrongly removed.

#### Scenario: Verifying what a new filter removed
- **WHEN** the operator reads the report after new rules are applied
- **THEN** they can see the eligible totals before and after, and the
  contribution of each rule to the difference

#### Scenario: Inspecting a specific rule's effect
- **WHEN** the operator examines one rule in the report
- **THEN** every candidate that rule newly skipped is listed with enough
  content to judge whether the skip was right

#### Scenario: Recovering a wrongly skipped candidate
- **WHEN** the operator finds a candidate that should not have been skipped
- **THEN** it can be returned to the review queue without re-running earlier
  stages or discarding existing decisions

#### Scenario: The report is readable rather than exhaustive output
- **WHEN** the report is produced
- **THEN** it is grouped and summarised such that an incorrect skip is
  noticeable, rather than being an undifferentiated dump

