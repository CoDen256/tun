# Spec Delta — operator-settings

## ADDED Requirements

### Requirement: Theme and value colour are operator preferences
The system SHALL store, with the other operator preferences:
- a **theme**: Auto (follow the device), Light or Dark; default Auto
- a **value colour**: one of the presets blue, teal, violet and orange, or a
  custom colour the operator picks; default blue

Each preset SHALL have a light and a dark shade:

| preset | light | dark |
|---|---|---|
| blue | #0b5cff | #82adff |
| teal | #00897b | #4fd1c0 |
| violet | #7c3aed | #b79cff |
| orange | #d9480f | #ff9b5e |

A custom colour SHALL be used as chosen in both themes.

The Settings page SHALL show an Appearance section first, containing:
- a three-way theme switch
- the four preset swatches plus a custom-colour swatch
- a preview line drawn in the value colour

Both preferences SHALL apply to every stabbur page, from first paint.

#### Scenario: Choosing dark and teal
- **WHEN** the operator selects Dark and the teal swatch in Settings → Appearance
- **THEN** every stabbur page renders dark with operator-entered values in #4fd1c0, and after a reload and on another device the same holds

#### Scenario: A custom colour
- **WHEN** the operator picks #c2185b with the custom swatch
- **THEN** values render in #c2185b in both light and dark themes

#### Scenario: Auto follows the device
- **GIVEN** the theme is Auto
- **WHEN** the device switches to dark mode
- **THEN** stabbur renders dark without a reload of the settings


### Requirement: Part of speech and text-from-audio have their own provider order
Besides the existing enrichment kinds, the system SHALL store an operator
provider order for **part of speech** and for **text from audio**. Each is
editable as its own list on the Settings page, in this order: Part of speech,
Pronunciation, Translations, Inflections, Examples, Audio, Text from audio.

The candidate providers for part of speech SHALL be those smia offers for
inflections, because smia has no separate part-of-speech provider set. Its
order and on/off state SHALL be stored separately, so reordering one list
never reorders the other.

The part-of-speech sheet and prefill SHALL follow the part-of-speech list.
The text-from-audio sheet SHALL follow the text-from-audio list.

#### Scenario: Reordering part of speech leaves inflections alone
- **GIVEN** the inflections order is ordbank, dictcc_api
- **WHEN** the operator moves dictcc_api above ordbank in the Part of speech list
- **THEN** the part-of-speech sheet and prefill use dictcc_api first, and the Inflections list and sheet still start with ordbank
