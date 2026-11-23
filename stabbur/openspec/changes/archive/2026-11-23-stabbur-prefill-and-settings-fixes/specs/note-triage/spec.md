## MODIFIED Requirements

### Requirement: Empty fields are prefilled from the operator's primary providers
An empty field SHALL be filled from the first configured, enabled provider
that answers, walking the operator's order. A field that already holds a
value SHALL NOT be overwritten. The examples field is the one exception: it
is extended rather than skipped, as described in "Example prefill adds new
sentences to the ones already there".

The walk SHALL respect the operator's order **strictly**: a field SHALL NOT
take a lower provider's answer while any provider above it is still
pending, even when the lower one answered first. A lower provider's answer
is used only once every provider above it has failed or answered with
nothing usable.

Fields SHALL be filled **progressively and independently**: each field
SHALL be written as soon as the provider it will use has answered, without
waiting for providers it will not use and without waiting for other fields.
The one ordering dependency is part of speech, because inflections need its
shape and translations and audio are ordered by it. Those fields SHALL
start once part of speech has settled. All other fields SHALL NOT wait for
it.

A lookup that fails SHALL affect only its own field. Every other field
SHALL still be filled.

Where the note has a part of speech, candidates SHALL be **ordered** so
that those matching it come first, and the value taken SHALL be the first
candidate after that ordering. Candidates SHALL NOT be filtered or
withheld on the basis of part of speech. Where the note has no part of
speech, or no candidate matches it, the provider's own order SHALL be used
unchanged.

For a multiword transcription, when the enrichment service supplies no
assembled whole-phrase value, stabbur SHALL assemble one from each token's
first candidate, joined with a single space, in the service's token order.
A token with no candidate SHALL leave a visible gap in the assembled value
rather than being silently omitted. The field's provenance SHALL record
that the value was assembled rather than looked up.

This supersedes `smia-ipa-multiword-response` decision D2, which forbade
any stabbur-side join. Decision D3 of that change — that an assembled
string is never presented as a real phrase lookup — remains in force and
extends to a prefilled value.

#### Scenario: The right sense is prefilled
- **GIVEN** a note whose part of speech is `substantiv`
- **AND** a translation provider returning a verb candidate first and a noun candidate second
- **WHEN** prefill runs
- **THEN** the noun candidate's text is what lands in the translation field
- **AND** the verb candidate is still present in the suggestion panel

#### Scenario: A multiword transcription is assembled
- **GIVEN** a two-token expression where one token has two IPA candidates, so the service supplies no assembled value
- **WHEN** prefill runs
- **THEN** the transcription field holds both tokens' first candidates joined by a single space
- **AND** the field's provenance indicates the value was assembled, not looked up

#### Scenario: A gap is visible
- **GIVEN** a two-token expression where one token has no candidate at all
- **WHEN** prefill runs
- **THEN** the assembled value shows a gap marker in that token's position

#### Scenario: A slow unused provider does not hold up a field
- **GIVEN** the first enabled translations provider answers quickly and the third takes ten seconds
- **WHEN** prefill runs
- **THEN** the translation field is filled from the first provider before the third has answered

#### Scenario: A slow field does not hold up other fields
- **GIVEN** every enabled audio provider takes ten seconds
- **WHEN** prefill runs
- **THEN** transcription, translations and examples are filled before audio is

#### Scenario: The top provider wins even when it is slower
- **GIVEN** the first enabled translations provider answers after three seconds and the second answers immediately, both with a value
- **WHEN** prefill runs
- **THEN** the translation field stays empty until the first provider answers, and then holds the first provider's value

#### Scenario: A failing lookup costs only its own field
- **GIVEN** every IPA provider's lookup fails with a server error
- **WHEN** prefill runs on a note with empty transcription, translations and examples
- **THEN** translations and examples are filled, and the transcription field is left empty

## ADDED Requirements

### Requirement: Example prefill adds new sentences to the ones already there
Prefill SHALL NOT skip the examples field because it already holds
sentences. It SHALL take up to N × M sentences as configured (Providers to
ask × Sentences per provider, counted before de-duplication) and **append**
each one the note does not already hold, after the existing rows, in
provider order. Existing rows SHALL NOT be changed or reordered.

Two sentences SHALL be treated as the same when they are equal after
trimming, collapsing internal whitespace, lower-casing, and removing
trailing terminal punctuation and closing quotes.

The examples field SHALL count as filled, and SHALL show provenance for this
run's providers, only when at least one sentence was added.

Force prefill SHALL continue to replace the field's sentences with a fresh
set rather than append.

#### Scenario: Appending to an existing example
- **GIVEN** a note with one example the operator typed, and Providers to ask 1 × Sentences per provider 2, whose provider returns two other sentences
- **WHEN** the operator presses Prefill
- **THEN** the note has three example rows: the typed one first and unchanged, then the two new ones

#### Scenario: Nothing is repeated
- **GIVEN** a note whose examples were filled by an earlier prefill
- **WHEN** Prefill runs again with the same settings
- **THEN** no example row is added, and the toast does not count examples as filled

#### Scenario: A differently-cased or punctuated copy is a duplicate
- **GIVEN** a note holding the example `komme seg opp`
- **WHEN** a provider returns `Komme seg opp.` and Prefill runs
- **THEN** no new row is added for it

#### Scenario: Force prefill still replaces
- **GIVEN** a note with three examples
- **WHEN** the operator chooses Force prefill
- **THEN** the examples field holds only the freshly fetched sentences
