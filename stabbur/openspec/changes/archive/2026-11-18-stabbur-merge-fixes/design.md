# Design — stabbur-merge-fixes

## D1 — The merge request carries the survivor's state

Three options were considered for the unsaved-edits bug. The operator chose
the first.

- **Chosen: save, then merge.** The client sends the form's current values
  alongside `survivor_id`; the server applies them to the survivor, then
  applies the takes on top, then deletes the absorbed notes — all inside
  the existing transaction. One operator action, one atomic result.
- Rejected: disabling the merge button while the form is dirty. Correct but
  adds a step to every merge, and merges happen mid-triage where steps cost
  most.
- Rejected: a confirm dialog offering save/discard/cancel. A third
  destructive choice at the moment the operator is already confirming a
  deletion.

Ordering inside the transaction matters and is not free to choose: **form
values first, takes second.** A take is the operator saying "and also bring
this across", which must win over what the form happened to hold. For the
two additive fields this ordering is also what makes the result correct —
the taken context appends to the *edited* context, not to the stored one.

The existing explicit `updated_at` bump (D82) stays: a merge that takes
zero fields and changes no form value still counts as a change the
builder's `since` pull sees.

## D2 — Only translations and context add; everything else replaces

The operator's backlog text reads "inflections should be merged as
tranlsations and context", and in session he reversed exactly that half:
**inflections replace wholesale**, and the source's part of speech comes
with them.

The reason that reversal is right: an inflection paradigm is one coherent
object. Unioning it slot-by-slot across two notes produces a table that
describes no actual word — a masculine singular beside a neuter plural —
and the operator would have to inspect every slot to notice. Replacing
swaps one real paradigm for another real paradigm.

The part of speech riding along is not a convenience. `INFLECTION_SHAPES`
is keyed by part of speech; a paradigm taken onto a note whose part of
speech implies a different shape renders into fields that do not exist, and
the take looks like it did nothing. The UI already auto-pairs a `pos` take
in the one case where the survivor has none — this generalises it to
always, which also makes the pairing's existing `_autoPosFor` bookkeeping
unnecessary.

Final table, which the UI must state on the buttons themselves:

| field | operation |
|---|---|
| `translations` | **adds** — merged per language, per `translation_merge_mode` |
| `context_text` | **adds** — appended on a single newline |
| `inflections` | **replaces**, and carries the source's `pos` with it |
| `transcription` | replaces |
| `audio_blob` / `audio_sel_ms` | replaces |
| `text`, `lemma` | replaces |

## D3 — Context joins on a single newline

The operator chose a single newline over a blank line and over `" / "`.
Context is sentence-length; `" / "` would build one unreadable line, and a
blank line wastes vertical space in a field that is already the tallest on
the card.

Identical text is skipped — an exact match after trimming adds nothing and
appending it twice is pure noise. Near-duplicates are left alone: deciding
two sentences are "the same enough" is a judgement this change has no
business making silently.

## D4 — Operation labels are part of the design, not polish

Additive and replacive takes sit in the same row of buttons and look
identical today. With the two behaviours now deliberately different per
field, a button that does not say which it is makes the operator memorise a
table to use a destructive control safely.

So each take button carries its operation inline (*adds* / *replaces*, and
*replaces + PoS* for inflections), and the merge bar's summary spells out
what each staged take will do before the operator commits. The confirm text
changes from "Absorb X" to naming that edits will be saved first.

## D5 — Going to a note opens a new tab

The operator chose a new tab over navigating in place. In place would lose
his position in the triage queue and, in the manual navigate-save mode, his
unsaved edits — for an action whose whole purpose is "let me go look at
that one".

The link is present on **every** row, including `ready` matches that cannot
be absorbed. Those rows are otherwise dead ends: the panel says what they
contain and then offers nothing to do about it.

## The mockup is a concept reference, NOT a layout specification

Operator, during the build (2026-11-16): *"the mock you presented should
only be used as a reference not a truth, because it didn't match the actual
layout of the stabbur editing anyway, just the concepts that used there,
not 1-1 layout."*

So: take from `mockups/stabbur-merge-dictcc.html` **what things are and how
they behave** — that a take button states adds/replaces, that PoS groups
carry a heading with the note's own first, that variety is hover-only, that
the pager shows a slice of a total, that a dirty form warns before a merge.

Do **not** reproduce its layout, its DOM structure, its class names, or its
arrangement of panels. The real editor's existing structure and `ui/ui.css`
classes win every time they disagree with the mockup. A diff that
restructures a working panel to look like the mockup is wrong even if it
renders correctly.
