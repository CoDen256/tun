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

