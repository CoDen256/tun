## MODIFIED Requirements

### Requirement: The number of example candidates requested is an operator control
Three operator controls SHALL govern example lookups:

- **Providers to ask** (N): how many of the enabled examples providers, in
  the operator's order, prefill uses.
- **Sentences per provider** (M): how many sentences prefill takes from each
  of them.
- **Sentences in the suggestion sheet** (K, with M ≤ K): how many sentences
  each enabled examples provider is **asked for**.

Every examples lookup, whether started by prefill or by opening the sheet,
SHALL request K from each provider, so one answer serves both and opening
the sheet after a prefill asks no provider again. Prefill SHALL take the
first M of each of the first N enabled providers' answers, in provider
order, de-duplicated across providers. A provider that returns fewer than M
sentences SHALL contribute what it has, and the shortfall SHALL NOT be
backfilled from any other provider. The result is therefore at most N × M
sentences. The sheet SHALL list up to K sentences per provider.

Because the requested count forms part of the lookup's cache identity,
changing K SHALL be treated as a new lookup rather than an expansion of the
previous one.

#### Scenario: A full grid
- **GIVEN** Providers to ask is 2, Sentences per provider is 3, and both of the first two enabled providers return at least three sentences
- **WHEN** the operator prefills a note with no examples
- **THEN** the note has six example rows: three from the first provider, then three from the second, in that order

#### Scenario: A short provider is not backfilled
- **GIVEN** the same settings, and the first provider returns one sentence while the second returns five
- **WHEN** the operator prefills
- **THEN** the note has four example rows: the one from the first provider and three from the second

#### Scenario: Providers beyond N are not used by prefill
- **GIVEN** Providers to ask is 1 and three providers are enabled
- **WHEN** the operator prefills examples
- **THEN** only the first enabled provider's sentences are used

#### Scenario: The sheet shows more than prefill takes
- **GIVEN** Providers to ask 5, Sentences per provider 2, Sentences in the suggestion sheet 5
- **WHEN** the operator prefills a note and then opens the Examples sheet
- **THEN** the note gained at most two sentences per provider, and each provider box in the sheet lists up to five, without any new examples request being made when the sheet opens

#### Scenario: Asking for more
- **WHEN** the operator raises Sentences in the suggestion sheet and opens the sheet on a note again
- **THEN** each provider is queried again for that many candidates, as a fresh lookup

## ADDED Requirements

### Requirement: An examples provider's count can be overridden in the sheet for one note
In the Examples sheet, the per-provider row opened from a provider's query
pill SHALL carry, beside the query input, a **count stepper** (1–10)
starting at the sheet sentence count. Changing it and re-running (the row's
rerun button or Enter) SHALL re-ask **only that provider** for that many
sentences, using that row's query. Other providers' boxes SHALL be
unaffected.

While a provider's count differs from the sheet sentence count, its
collapsed pill SHALL show the count (e.g. `✎ query · 8`, or
`“komme” · 8` alongside a query override). The row's **Reset** SHALL return
both the query and the count to the shared values.

The override is ad hoc: it SHALL NOT be stored in settings, SHALL NOT
affect prefill, and SHALL be forgotten when the note is closed or left.

#### Scenario: Asking one provider for more
- **GIVEN** the sheet sentence count is 5 and the Examples sheet is open
- **WHEN** the operator opens leipzig's query row, raises its count to 8 and presses rerun
- **THEN** leipzig's box lists up to eight sentences, every other box is unchanged, and leipzig's pill shows `· 8`

#### Scenario: Reset
- **WHEN** the operator presses Reset in that row
- **THEN** leipzig's pill no longer shows a count, and its box is asked again with the shared query and the sheet count

#### Scenario: Forgotten with the note
- **GIVEN** leipzig's count was overridden to 8 on one note
- **WHEN** the operator moves to the next note and opens its Examples sheet
- **THEN** leipzig is asked for the sheet sentence count and its pill shows no count

### Requirement: An example candidate already on the note is marked
In the Examples sheet, a candidate that matches a sentence the note already
holds (by the same loose comparison prefill uses) SHALL be shown with a
disabled action reading **On note** instead of Use. Using a candidate SHALL
turn it to On note at once, and removing that example from the note SHALL
make it usable again.

#### Scenario: Marked on open
- **GIVEN** a note holding the example `Hun kom seg ut av sengen.`
- **WHEN** the operator opens the Examples sheet and a provider returns that sentence
- **THEN** its row shows On note, disabled

#### Scenario: Use then remove
- **WHEN** the operator presses Use on a candidate and then deletes that example row from the note
- **THEN** the candidate shows On note after Use, and Use again after the delete
