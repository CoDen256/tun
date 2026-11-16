## MODIFIED Requirements

### Requirement: Paradigm shape matches stabbur's storage model
A `/inflections` candidate SHALL carry `lemma`, `pos`, and a `paradigm`
whose keys are exactly the slot names stabbur stores for that part of
speech. A slot the source has no form for SHALL be absent rather than
empty.

Where a source expresses **several forms for one slot** — a Norwegian noun
that takes more than one gender, or a slot with alternative inflected
forms — every form SHALL be preserved in that slot, joined as the source
joined them. A slot SHALL NOT be reduced to one form, and a table SHALL
NOT be split into one candidate per gender.

Where a source marks an article on a slot, the article SHALL be lifted into
the `article` key and SHALL comprise **every** article form that slot
carries, not only the first. When the article forms cannot be told apart
from the inflected form, the whole segment SHALL remain in the inflected
slot and `article` SHALL be absent — a visible gap, never a guessed split.

#### Scenario: A two-gender noun keeps both articles
- **WHEN** dict.cc returns the table `en / et do | doen / doet | doer / do | doene / doa` for the Norwegian noun `do`
- **THEN** exactly one candidate is returned
- **AND** its `paradigm.article` is `en/et`
- **AND** its `paradigm.sg_indef` is `do` — not `/ et do`, and not absent
- **AND** `sg_def`, `pl_indef` and `pl_def` carry `doen / doet`, `doer / do` and `doene / doa` respectively

#### Scenario: A single-gender noun is unaffected
- **WHEN** dict.cc returns a table whose article slot carries one article word
- **THEN** `paradigm.article` is that word
- **AND** the inflected slot carries the rest of the segment, exactly as before this change
