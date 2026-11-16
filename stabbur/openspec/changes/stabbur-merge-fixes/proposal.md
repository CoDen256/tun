# stabbur-merge-fixes

Batch `full-sweep`, package **Stabbur merging & dict.cc translations**
(D161 workflow, `docs/15-agentic-workflow.md`). Two backlog items about
the similar-notes merge.

Backlog items, verbatim:

> [ux] merging removes everything not saved even if i didn't tell to merge
> those fields, should not remove,also merging should add context add
> translation always, not replace them. it should replace the audio and
> ipa if said so, inflections should be merged as tranlsations and context

> [ux] stabbur similar notes i should be able to go to that note

## Why

### 1. Merge is blind to the open form

Root-caused during design, not inferred from the report.
`commitSimilarMerge` (`ui/ui.js`) POSTs only
`{survivor_id, absorbed_ids, take}`. The server then reads the survivor
**from the database** (`db.get(Note, survivor_id)`), applies the takes to
that row, and returns it; the UI re-renders from the response.

So everything the operator typed into the open editor or triage card and
had not saved is overwritten by the stored row. The data was never
"removed" by the merge — the merge simply never knew it existed. The
operator's reading of the symptom ("removes everything not saved even if I
didn't tell to merge those fields") is exactly right about the effect.

This is destructive and silent: the absorbed note is hard-deleted in the
same transaction, so there is nothing to recover the lost edits from.

### 2. Taking a field replaces it, when for two fields it should add

`merge_notes` does `setattr(survivor, field, value)` for every taken field.
`translations` is the one exception, already merged per language by
`_merge_translation_lists`. For `context_text` the wholesale replace loses
the survivor's own example sentence — and combining two drafts' knowledge
is the entire point of a merge.

### 3. A related note cannot be opened

The similar-notes panel previews a match's fields and offers to take them,
but offers no way to go look at the note itself. This matters most for a
`ready` match, which cannot be absorbed at all and whose row is therefore
a dead end today.

## What changes

- **Save-then-merge.** The merge request carries the open form's current
  values as the survivor's state. Edits are committed first, takes apply on
  top, in one operator action and one transaction. Nothing unsaved is lost.
- **Context becomes additive**, appended on a single newline, identical
  text skipped. Translations stay additive as they already are.
- **Everything else stays replacive, explicitly:** inflections (dragging
  the source's part of speech with them), IPA, audio, text, lemma.
- **New take buttons for `text` and `lemma`**, which the server already
  permits and the UI never offered.
- **Each take button states its operation** — *adds* or *replaces* — on the
  button itself and in the merge bar's summary, so the asymmetry is read
  rather than remembered.
- **Every similar-note row links to that note, opening in a new tab**,
  including rows that cannot be absorbed.

## What does NOT change

- Merge stays many-to-one, explicit, and never automatic.
- Only a `draft` may be absorbed. A `ready` note's fields still cannot be
  taken — but its row now links out.
- Absorbed notes are still hard-deleted, never tombstoned.
- `status`, `origin` and `import_ref` remain untakeable.
- `translations` keeps its existing per-language merge and the
  `translation_merge_mode` setting that governs it.
- No change to the notes read API mjolnir pulls from.

## Deliberate asymmetry, recorded so it is not "fixed"

Merge's **Take IPA replaces**. The enrichment panel's **Use on an IPA
candidate appends** (`stabbur-triage-queues`). Same column, two gestures,
two intents: taking a field from another note is a swap; using a suggestion
is assembly. Both are the operator's explicit choice, made in the same
session. A build agent finding one and "making them consistent" would be
undoing a decision.
