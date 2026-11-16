## ADDED Requirements

### Requirement: Progress is stored as completed time ranges on the book
A book SHALL own a set of completed time ranges. A sentence, in any split
configuration, SHALL read as done when its entire span is covered by that
set, and as not done otherwise.

Marking a sentence done SHALL add its span to the set; marking it not done
SHALL remove its span. Progress SHALL NOT belong to a split configuration,
so no configuration operation — creating, duplicating, re-analysing or
deleting — SHALL discard it.

`shadowing_segments.done` ceases to be the source of truth. It MAY remain
as a derived value or be removed, but it SHALL NOT be written to as the
authoritative record.

#### Scenario: Progress carries across configurations
- **WHEN** a sentence is marked done in one configuration
- **AND** another configuration with different boundaries is made active
- **THEN** every sentence of that configuration lying entirely inside the
  marked span reads as done

#### Scenario: Merging is conjunctive
- **WHEN** two adjacent sentences, of which only one is done, are merged
- **THEN** the merged sentence reads as not done
- **WHEN** two adjacent sentences, both done, are merged
- **THEN** the merged sentence reads as done

#### Scenario: Splitting preserves doneness
- **WHEN** a done sentence is split
- **THEN** both resulting sentences read as done

#### Scenario: Un-marking removes coverage
- **WHEN** a sentence is marked not done
- **THEN** a sentence of another configuration lying entirely inside that
  span no longer reads as done

### Requirement: Existing done flags migrate losslessly into time ranges
The migration from per-segment booleans to time ranges SHALL preserve the
operator's existing progress exactly. For every segment previously marked
done, its span SHALL be covered after migration; no sentence SHALL become
done that was not, and none SHALL lose its done state.

This is called out as a requirement because the operator is part-way
through a book, and a lossy migration loses his place irrecoverably.

#### Scenario: The done set is identical across the migration
- **WHEN** the migration runs against a database holding segments marked done
- **THEN** reopening the book shows exactly the same set of sentences as done

### Requirement: The reading position is a time position, not a segment
The cursor SHALL be stored as a time position on the book, per user, on the
server. Opening a book SHALL land on the sentence whose span contains that
position, in whatever configuration is active.

The cursor SHALL be updated by navigating to a sentence, whether or not
that sentence is marked done, so that leaving mid-chapter without marking
anything still resumes in the right place. Because it lives on the server,
the position SHALL be shared between devices.

#### Scenario: An unmarked sentence is still resumed
- **WHEN** an operator navigates to a sentence without marking it done
- **AND** reloads and reopens the book
- **THEN** that same sentence is shown

#### Scenario: The position survives a re-split
- **WHEN** the active configuration's boundaries change
- **AND** the book is reopened
- **THEN** the sentence containing the stored time position is shown

#### Scenario: The position is shared across sessions
- **WHEN** the cursor is moved in one browser session
- **AND** a second, independent session opens the same book for the same profile
- **THEN** the second session shows the same sentence
