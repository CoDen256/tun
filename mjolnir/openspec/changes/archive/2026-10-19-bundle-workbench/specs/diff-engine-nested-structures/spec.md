## ADDED Requirements

### Requirement: Diffing switch-statement cases
The system SHALL diff a matched pair of `switch` statements case-by-case,
matching each case by the hash of its test expression (or by being a
`default` case), rather than treating the entire `switch` statement as a
single unit of change.

#### Scenario: One case in a switch statement changes
- **WHEN** two matched `switch` statements are identical except that one
  case's body differs
- **THEN** the system reports only that case as modified, with every other
  case reported as unchanged

#### Scenario: A case is added to a switch statement
- **WHEN** a `switch` statement in the modified version has a case (matched
  by test expression) absent from the baseline version
- **THEN** the system reports that case as added, not folded into a
  whole-statement replacement that would discard it if reapplied elsewhere

#### Scenario: A case is removed from a switch statement
- **WHEN** a `switch` statement in the baseline version has a case absent
  from the modified version
- **THEN** the system reports that case as removed

### Requirement: Diffing Object.assign-shaped return values by property
The system SHALL, when two matched statements are both a `return` of an
`Object.assign({}, <identifier>, {...})` call (or an equivalent object-spread
return of the same shape), diff the trailing object literal's properties
individually — added, removed, or changed by key — rather than treating the
entire `return` statement as a single unit of change.

#### Scenario: A property is added to the returned object
- **WHEN** two matched `Object.assign({}, state, {...})`-shaped return
  statements differ only by the modified version's trailing object literal
  having an additional property
- **THEN** the system reports that property as added, and every other
  property as unchanged

#### Scenario: A property's value changes
- **WHEN** two matched `Object.assign({}, state, {...})`-shaped return
  statements have the same property keys but one property's value differs
- **THEN** the system reports that property as modified

#### Scenario: The statement does not match the recognized shape
- **WHEN** two matched statements' shapes do not match the recognized
  `Object.assign({}, <identifier>, {...})` (or equivalent spread) pattern
- **THEN** the system falls back to treating the statement as a single unit
  of change, rather than guessing at an unrecognized structure

### Requirement: Reapplying a nested-structure diff preserves unrelated content
The system SHALL, when reapplying a diff computed via switch-case or
Object.assign-property recursion to a target that itself differs from the
original baseline within the same statement, preserve the target's own
unrelated cases or properties rather than discarding them.

#### Scenario: The reapplication target has an unrelated new switch case
- **WHEN** a diff recorded against a baseline switch statement is reapplied
  to a target switch statement that has an additional case not present in
  either the baseline or the modified version
- **THEN** the system's reapplied result still contains that additional case
