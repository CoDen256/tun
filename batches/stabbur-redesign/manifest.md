# stabbur-redesign

Batch opened 2026-11-20 directly from a `/tun-design` session (no separate
triage pass): the operator asked for a complete redesign of stabbur's
triage / note-editing surfaces, phone-first, and chose in session which
neighbouring backlog items the package absorbs, because each touches exactly
the surfaces being rebuilt.

## Dependencies

Single package. Inside it, the stabbur schema change (examples column) lands
before the mjolnir builder's projector reads it — one build session takes
them in that order.

## Status

| package | status |
|---|---|
| Stabbur editor redesign | pending (design in progress) |

## Packages

### Stabbur editor redesign
projects: stabbur, mjolnir (builder projector only)

Operator request (2026-11-20, verbatim):

> i want to completely redesign the stabbur triage/note editing page and also
> make it more phone friendly as well and make it more modern minimalistic and
> easy to use.

Absorbed backlog items, verbatim:

[bug] stabbur triage: after a merge on the triage belt, the absorbed notes stay in the in-memory `triageQueue`. Similar-note matches are very often other drafts in the same queue, so advancing lands on a row whose note was just hard-deleted and every PATCH/accept against it 404s. PRE-EXISTING (identical before the `stabbur-merge-fixes` change — confirmed at 925386bd), but that change makes merging much more prominent (take text/lemma, operation labels, save-and-merge), so it will be hit more often. Fix: drop the absorbed ids from `triageQueue` in `commitSimilarMerge`'s tail, where it currently only refreshes the survivor.
1. stabbur examples/translations store as separate rows, not joined by "/", just make the ux easier to edit, view those multiple translations
[ux] convenient phone portrait display for stabbur. (full text in BACKLOG.md — designed and deferred 2026-11-16 in `full-sweep`)
[ux] stabbur audio suggestion rehaul, filmot and forvo should be smaller, no input field, url input should be removed and there should be just a button, that says: url from clipboard? forvo and filmot push down
[ux] stabbur duplicate note button
[ux] stabbur provider priority should reflect the same order in the suggestion list, even if no prefill is done

Settled in session before the first mockup (operator answers):
- ONE editor, three contexts (triage card, note detail, new note) — the three
  drifting copies of the form collapse into one.
- Phone: segmented tabs, each carrying a done-marker; the verdict action is
  always available. Tabs: (word / PoS / lemma / inflections) ·
  (audio / pronunciation) · (translation / context) · (grammar, optional).
  Each tab minimal and easy to read.
- Suggest controls: the inline ✨ toggle + query input + ⟳ per field are
  replaced by a bottom sheet per field.
- Surfaces redesigned: triage belt + card, note editor / detail, notes list,
  settings + new note + grammar.
- Desktop: NO tabs — everything in one look, very minimal and "überschaubar",
  not bloated.
- Visual language: push further — a new minimal language, not the warm-paper
  palette retouched.
- Examples become a real column (one value per example); the builder joins
  the values itself. No guessing/replacing of joined strings, and no
  backwards-compatibility shims that are not needed.
- Pinned action bar: context-specific (triage verdicts on the belt; a
  different bar when opened from the Notes list / New note).

Data answers (2026-11-20):
- Translations are always separate rows. The append/separate merge-mode
  setting is removed. Stored rows containing " / " (only the append mode ever
  wrote that separator) are split once, by migration, into separate rows of
  the same lang.
- An example is a plain sentence. `context_text` is split once on its
  newlines into the new list column and then dropped (exact, no guessing).
  The builder joins the values itself. The capture's own `context_text` (the
  hover-translate ingestion contract, D154) is provenance and is untouched.
  Promotion maps it to the first example.
- Duplicate note copies EVERYTHING, the audio reference included (blobs are
  content-addressed, so they are shared rather than copied), and the copy is
  a draft.
