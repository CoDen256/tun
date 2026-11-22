# Spec Delta — note-editor

## MODIFIED Requirements

### Requirement: A word note's lemma follows its text until the operator edits it
The system SHALL keep a word note's `lemma` synchronised with its `text` as
the operator types, without requiring any explicit action. The derivation
strips a leading article or infinitive marker (`en`, `ei`, `et`, `å`) and a
trailing particle (`til`, `ut`, `opp`, `i`, …) and keeps what is between:
`"å legge til"` gives `"legge"`, and `"skynde seg"` gives `"skynde seg"`,
because `seg` is not a particle.

CORRECTION, 2026-11-22: this requirement used to say "the first
whitespace-separated token", which was never what the code did — the
stopword derivation shipped with `lemma-first-suggestions` and the sentence
was not updated with it. Found by the tester for this change, on a note
whose text is `"skynde seg"`. The behaviour is right; only the sentence was
wrong, so the sentence changed. Once the operator edits `lemma` directly,
the system SHALL stop synchronising it for that note and SHALL preserve the
operator's value. Loading a different note SHALL clear that state, so the
next note begins synchronised again.

The same derivation SHALL run when a note is **opened**, in every editor
context — the triage belt, a note opened from the Notes list, and New note —
whenever the stored lemma is empty or still equal to the raw text. A derived
lemma SHALL count as an unsaved edit, so that saving the note persists it.

Prefill SHALL derive the lemma itself, as its first step, when the lemma is
still empty — so that pressing Prefill is never refused for want of a lemma.

#### Scenario: Typing a multi-word text
- **WHEN** the operator types `"legge til"` into `text` on a word note whose
  lemma they have not edited
- **THEN** `lemma` reads `"legge"`

#### Scenario: A multi-word text with nothing to strip
- **WHEN** the operator types `"skynde seg"` into `text` on a word note whose
  lemma they have not edited
- **THEN** `lemma` reads `"skynde seg"` — the whole phrase, not its first word

#### Scenario: The operator overrides the lemma
- **WHEN** the operator edits `lemma` by hand and then continues editing
  `text`
- **THEN** `lemma` keeps the operator's value and is no longer changed by
  `text`

#### Scenario: A new note starts synchronised again
- **WHEN** the operator has overridden `lemma` on one note and then loads or
  begins a different note
- **THEN** that note's `lemma` synchronises from its own `text` as normal

#### Scenario: Opening a stored note without a lemma
- **GIVEN** a stored note with `text = "legge til"` and `lemma` empty
- **WHEN** the operator opens it from the Notes list
- **THEN** `lemma` reads `"legge"` immediately, and Save is offered as an unsaved change

#### Scenario: An operator-set lemma survives opening
- **GIVEN** a stored note with `text = "legge til"` and `lemma = "å legge"`
- **WHEN** the operator opens it from the Notes list
- **THEN** `lemma` still reads `"å legge"` and nothing is marked unsaved

#### Scenario: Prefill with an empty lemma
- **GIVEN** a note whose lemma field has been cleared by the operator
- **WHEN** they press Prefill
- **THEN** the lemma is derived from the text first, and the inflection and part-of-speech lookups run with it

### Requirement: The number of example candidates requested is an operator control
Two operator controls SHALL govern example prefilling:

- **Providers to ask** (N): how many of the enabled examples providers, in
  the operator's order, are asked.
- **Sentences per provider** (M): how many sentences are requested from, and
  taken from, each of them.

Prefilling examples SHALL ask the first N enabled providers and take up to M
sentences from each, in provider order, de-duplicated across providers. A
provider that returns fewer than M sentences SHALL contribute what it has,
and the shortfall SHALL NOT be backfilled from any other provider. The result
is therefore at most N × M sentences.

M SHALL be the per-provider limit sent with the lookup. Because the requested
count forms part of the lookup's cache identity, changing it SHALL be treated
as a new lookup rather than an expansion of the previous one.

#### Scenario: A full grid
- **GIVEN** Providers to ask is 2, Sentences per provider is 3, and both of the first two enabled providers return at least three sentences
- **WHEN** the operator prefills a note with no examples
- **THEN** the note has six example rows: three from the first provider, then three from the second, in that order

#### Scenario: A short provider is not backfilled
- **GIVEN** the same settings, and the first provider returns one sentence while the second returns five
- **WHEN** the operator prefills
- **THEN** the note has four example rows: the one from the first provider and three from the second

#### Scenario: Providers beyond N are not asked
- **GIVEN** Providers to ask is 1 and three providers are enabled
- **WHEN** the operator prefills examples
- **THEN** only the first enabled provider's sentences are used

#### Scenario: Asking for more
- **WHEN** the operator raises Sentences per provider and re-runs
- **THEN** each provider is queried again for that many candidates, as a fresh lookup

### Requirement: Translation candidates are tagged by language and always add a row
The system SHALL query each of the operator's configured target languages
using **that language's own provider order**. The translations sheet SHALL be
grouped by language: one group per target language, inside it one box per
provider in that language's order, listing only that language's candidates.
Every candidate SHALL carry a tag naming its language. Target languages come
only from Settings. The sheet SHALL NOT offer its own control for adding a
language.

A provider value containing `/` SHALL be offered as separate alternative
candidates, one per part, whether or not the slash has spaces around it. Each
part SHALL be trimmed; a part that is empty after trimming SHALL be dropped,
and a value that yields no part SHALL be offered unchanged. Duplicate parts
within one provider's answer SHALL collapse to one candidate.

Using a translation candidate SHALL always add a new translation row with
that candidate's language and text. It SHALL NEVER extend an existing row's
text. No merge-mode preference exists.

#### Scenario: Candidates carry their language
- **GIVEN** Settings lists target languages en and de
- **WHEN** the operator opens the translations sheet
- **THEN** the sheet has an en group and a de group, each listing its providers' candidates tagged with its language

#### Scenario: Each language uses its own provider order
- **GIVEN** en lists `dictcc` before `google`, and de lists `google` before `dictcc`
- **WHEN** the operator opens the translations sheet
- **THEN** the en group's first box is `dictcc` and the de group's first box is `google`

#### Scenario: A slash without spaces is two candidates
- **WHEN** a provider answers `"hurry/rush"` for English
- **THEN** the sheet offers `"hurry"` and `"rush"` as two separate English candidates, and offers no candidate reading `"hurry/rush"`

#### Scenario: A slash with spaces is two candidates
- **WHEN** a provider answers `"hurry / rush"` for English
- **THEN** the sheet offers `"hurry"` and `"rush"` as two separate English candidates

#### Scenario: Using a second translation for the same language
- **WHEN** the note already has the English translation "get going" and the operator uses the English candidate "get under way"
- **THEN** a second English row "get under way" is added and the first row still reads exactly "get going"

#### Scenario: No slash-joined text is ever produced
- **WHEN** the operator uses any number of translation candidates
- **THEN** no translation row's text contains a slash that the operator did not type
