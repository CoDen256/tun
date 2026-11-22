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
| Stabbur editor redesign | archived 2026-11-21. C28 was BLOCKED on an operator ruling; the ruling arrived 2026-11-22 (finding 6: badges only after Prefill or opening a sheet — the shipped behaviour), so C28 is **PASS** and the block is lifted. The rule is written down in the `stabbur-editor-fixes` `note-editor-surface` delta. |
| Stabbur editor fixes | building |

## Packages

### Stabbur editor redesign
projects: stabbur, mjolnir (builder projector only)
status: archived 2026-11-21 with one BLOCKED criterion (C28, operator ruling) —
stabbur `archive/2026-11-21-stabbur-editor-redesign`, mjolnir
`archive/2026-11-21-projector-examples-column`. Deploy together, stabbur first
(OPERATOR-CHECKLIST.md). Not verifiable in the build sandbox, so first checked
live: C35 (clipboard URL with real DNS) and mjolnir C05 (forecast on the hub stack).

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

Locked 2026-11-20 after six mockup iterations. The operator's words: *"this
is exactly perfect as it is now"*, to be implemented **1:1**. Accepted mockup:
`stabbur/openspec/changes/stabbur-editor-redesign/mockups/stabbur-editor-redesign.html`.
That page is the look-and-interaction reference, and its rows are sample data.

What the iterations changed (so the build does not "simplify" them back):
1. **Labels vs values.** Labels are small uppercase grey. Values use a distinct
   value colour, which the operator can configure in **Settings → Appearance**
   (theme Auto/Light/Dark; blue, teal, violet or orange, or a custom colour).
   This was added at lock time.
2. **Two-way merge.**
   - Merge works in both directions; a ready note cannot be absorbed (existing
     rule kept).
   - Take order: text → lemma → PoS → inflections → audio → IPA →
     translations → examples, with no section headers.
   - PoS is a new take, and audio can be played before it is taken.
3. **Sheets.** A sheet animates only when it opens; that fixes the "drawer
   reopens on every click" bug the operator found.
4. **Type and headword.** The type is a small pill beside the headword, and
   the IPA subtitle is removed.
5. **Provider queries.** Each provider can override the query in a sheet.
6. **No native selects anywhere.** Part of speech is a dropdown with
   "custom…".
7. **Candidate presentation.**
   - The "matching / other" headers are replaced by a PoS tag per row.
   - Audio rows show context and duration only.
   - Inflection candidates are a mini-table.
   - Example candidates show a context line.
   - Providers are visibly separate boxes.
8. **Notes list.** Rich filters and sort.
9. **Prefill.** Prefill sits in the pinned bar of every context. On the phone
   it is icon-only, and Skip moves to the ⋯ tray.
10. **Duplicate.**
    - Duplicate is also in triage (the copy goes next in the queue).
    - On the phone, the Note context's Duplicate is in ⋯.
11. **Grammar.** The explanation is rendered HTML with an Edit-HTML toggle.
    The rule page has no examples section.

Dropped by the operator (recorded in design D14):
- the raw-JSON record view
- the in-panel "add target language" control (languages come from Settings)
- the free-text audio-link input (replaced by "Use URL from clipboard")
- the translation append/separate merge mode

No ADR conflict. Nothing touches the device plane. The hover-translate
capture contract is unchanged (D154). Read-API contract D-N4 is amended:
`examples: string[]` replaces `context_text`, and its only consumer (the
builder) changes in the same package.

Deferred to the builder's judgement (tier 2, not guesses):
- the phone/desktop width breakpoint, provided the three desktop columns never
  drop below about 280 px
- how the theme and value colour apply before first paint (no flash of the
  other theme is the requirement)
- self-hosting the four fonts vs Google Fonts, provided the faces match and
  IPA renders
- the HTML sanitiser for grammar explanations, provided scripts and
  event-handler attributes never execute
- the exact wording of the clipboard error messages
- the duplicate endpoint's route shape
- the filter query-parameter names

### Stabbur editor fixes
projects: stabbur, mjolnir (builder projector only)
status: building — stabbur `stabbur-editor-fixes`, mjolnir
`projector-translation-langs`. Deploy together, stabbur first.

The return leg of D161: the operator deployed the redesign, tested it live,
and filed thirteen findings on 2026-11-22. They are quoted verbatim in
`stabbur/openspec/changes/stabbur-editor-fixes/proposal.md`. Finding 9 does
not exist in the operator's list; finding 6 is the C28 ruling above.

Readings settled with the operator before the change was written:
- finding 5 is **dropping an audio file onto the editor** (a new feature),
  not the waveform trim handles and not the Settings drag handle
- finding 4 is the **Translations** provider list only — the other six ask
  Norwegian-side questions that do not vary by target language
- finding 3 does **not** backfill a short provider from the others

Operator feedback outranks specs (D161): three requirements this amends were
archived five days ago, and they are amended, not worked around.
