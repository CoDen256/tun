# Spec Delta — operator-settings

## MODIFIED Requirements

### Requirement: Each enrichment kind has an operator-ordered provider preference
Each kind stabbur proxies SHALL carry its own ordered list of providers,
with each provider individually enabled or disabled. The primary provider is
derived as the first enabled provider in the effective order and is never
stored separately.

The **translations** kind SHALL be ordered **per target language**, not once
globally. Its preference is stored under a key per language, and the kinds a
read resolves SHALL be computed from the operator's configured target
languages together with any per-language key already stored — so adding a
language in Settings adds its list.

A per-language translations preference with nothing stored SHALL resolve from
the plain `translations` preference rather than from the raw catalogue, so a
newly added language starts at the order the operator already configured. The
plain key SHALL remain in storage as that seed.

Every other kind SHALL keep one list.

#### Scenario: Reading a per-language order
- **GIVEN** the operator's target languages are en and de
- **WHEN** settings are read
- **THEN** the response carries a translations provider order for en and one for de, each reconciled against the translations catalogue

#### Scenario: A new language inherits the configured order
- **GIVEN** the stored plain translations order is `dictcc, google` and nothing is stored for fr
- **WHEN** the operator adds fr to their target languages and reads settings
- **THEN** fr's translations order is `dictcc, google`

#### Scenario: Orders are independent
- **GIVEN** the operator moves `google` to the top of the de list
- **WHEN** settings are read
- **THEN** de's order begins with `google` and en's order is unchanged

#### Scenario: Other kinds stay single
- **WHEN** settings are read
- **THEN** part of speech, pronunciation, inflections, examples, audio and text-from-audio each carry exactly one order, regardless of how many target languages exist

### Requirement: Preferences are editable from a settings page
The settings page SHALL let the operator edit every preference it stores,
and SHALL persist each change as it is made.

Provider order SHALL be presented as one draggable list per kind, with the
**Translations** kind shown as one list per configured target language,
labelled with its language, and with no generic translations list.

The examples prefill controls SHALL be labelled for what they do:
**Providers to ask** (how many providers, in order) and **Sentences per
provider** (how many from each), with the resulting maximum shown.

#### Scenario: A translations list per language
- **GIVEN** target languages en and de
- **WHEN** the operator opens Settings
- **THEN** Provider order shows "Translations · en" and "Translations · de" as separate draggable lists, and no unlabelled Translations list

#### Scenario: Reordering one language only
- **WHEN** the operator drags a provider to the top of the de list
- **THEN** that order is saved for de and the en list is unchanged

#### Scenario: The examples controls say what they mean
- **WHEN** the operator opens Settings
- **THEN** the examples section reads "Providers to ask" and "Sentences per provider" and states the resulting maximum number of sentences
