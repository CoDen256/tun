# Acceptance — stabbur-editor-fixes

Every criterion is verified by **observing the running system** in a browser
against the dev stack. Code reading, a 200 response, or "the function is
called" is not a pass. Each criterion names the operator finding it answers.

## Pickers (finding 1, 8)

- **F01** On the triage belt, scroll the editor down until the part-of-speech
  control is in the lower half of the viewport. Click it. **The dropdown is
  visible and still open a second later**, and choosing a value sets it.
- **F02** With the page scrolled, each of these opens and stays open: the
  type pill, a translation row's language, the grammar rule link, the triage
  queue selector, the Notes list's sort and one of its filters.
- **F03** With a dropdown open, scrolling the page closes it; clicking
  outside closes it; Escape closes it.

## Lemma on open (finding 2)

- **F04** Open a note from the **Notes list** whose text is two words and
  whose lemma is empty. **The lemma field shows the first word** before
  anything is typed, and the Save button reads unsaved.
- **F05** On that same note, press **Prefill** without touching any field.
  It runs and fills fields — it does not report that there is nothing to
  query with.
- **F06** Open a note whose lemma was set by hand and differs from its text.
  The lemma is unchanged and Save reads "Saved".

## Examples N × M (finding 3)

- **F07** Set Providers to ask = 2, Sentences per provider = 3. Prefill a
  note with no examples whose first two providers both answer richly.
  **Six example rows appear**, the first three from provider 1 and the next
  three from provider 2 (check the provenance tag / the sheet's boxes).
- **F08** With the same settings on a word whose first provider has one
  sentence and whose second has several: **four rows**, not six — the
  shortfall is not backfilled.
- **F09** Set Providers to ask = 1. Prefill. Only the first enabled
  provider's sentences appear.

## Per-language provider order (finding 4)

- **F10** Settings → Provider order shows **"Translations · en" and
  "Translations · de"** (for target languages en, de) as separate draggable
  lists, and no unlabelled Translations list.
- **F11** Drag a provider to the top of the **de** list. Reload. The de list
  kept the new order and the **en list is unchanged**.
- **F12** Open a note's translations sheet. It is **grouped by language**,
  each group's boxes in that language's order — matching F11.
- **F13** Add a third language in Settings → Translation languages. Its new
  list appears, seeded with the order the other lists started from.

## Dropping audio (finding 5)

- **F14** Drag an mp3 from the file manager over the editor: **a drop
  indicator appears**. Drop it: the file uploads and **the waveform shows
  that recording**, which plays.
- **F15** Do the same on a note opened from the Notes list and on New note —
  both attach.
- **F16** Drop a non-audio file: a message says it is not audio and the
  note's audio is unchanged (the previous waveform is still there).

## Similar notes (finding 7)

- **F17** Open a note with at least one similar note. **A filled,
  accent-coloured badge** reading "N similar" is visible without scrolling,
  on both phone and desktop widths, and opens the similar sheet.
- **F18** Open a note with no similar notes: no badge is rendered.

## Force prefill (finding 10)

- **F19** On a note whose IPA and translation already hold values, choose
  **⋯ → Force prefill**. Those fields now hold the providers' values and show
  the provider as provenance.
- **F20** On the same kind of note, press plain **Prefill**: the filled
  fields are untouched.
- **F21** Force prefill after a plain prefill in the same session visibly
  re-runs the providers (the sheet's boxes show a fresh run / the spinner
  runs) rather than returning instantly from cache.

## Previous (finding 11)

- **F22** With prefill timing = **On open**, triage forward past two notes,
  then press **Previous**. The note comes back with its stored values and
  **no prefill runs** (no provenance tags appear that were not there, no
  spinner).
- **F23** On that same note, pressing Prefill by hand still fills its empty
  fields.

## Slash alternatives (findings 12, 13)

- **F24** Open the translations sheet on a word whose provider answers with a
  slash. **A value like "hurry/rush" is offered as two candidates**, "hurry"
  and "rush"; no candidate shows the slash.
- **F25** The same holds for "hurry / rush".
- **F26** After the migration, open a note that previously had a slashed
  translation. **It shows separate rows**, one per alternative, same
  language, in order.
- **F27** The note count before and after the migration is identical, and no
  note that had a translation has none (SQL check from the checklist).

## C28 (finding 6)

- **F28** Open a note from the Notes list. **No ✨ control shows a count
  badge.** Press Prefill: badges appear on the fields whose providers
  answered. On another fresh note, open one field's sheet, close it: only
  that field's control shows a badge.
