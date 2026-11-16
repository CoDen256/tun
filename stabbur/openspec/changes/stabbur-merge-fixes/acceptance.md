# Acceptance criteria — stabbur-merge-fixes

The review contract for the build phase. Every criterion is an observable
end state, confirmed by driving the running UI in dev compose with
claude-in-chrome, or by reading the resulting row in stabbur's database —
never by reading code or trusting a log line. An agent that did not write
the code verifies these.

Dev setup assumed: `cd stabbur && docker compose up` (which publishes its
port), with at least two **draft** notes whose texts are similar enough to
surface each other in the related-notes panel, and one **ready** note that
also surfaces. At least one pair must differ in context, inflections,
translations and IPA, so each take can be observed independently.

---

## Item — unsaved edits survive a merge

1. With note A open in the editor, type a new IPA value into the
   transcription field and do **not** press Save. Absorb related draft B
   with no take staged. After the merge, note A's transcription field shows
   the value that was typed, and reloading the page still shows it.
2. Same flow in the **triage** card rather than the editor: a typed context
   sentence survives absorbing a related draft.
3. With note A open, type into the context field, then stage "take context"
   from B and commit. Note A's context contains the typed sentence **and**
   B's sentence on the line below — the take added to the edited value, not
   to the stored one.
4. With note A open, type into the IPA field, then stage "take IPA" from B
   and commit. Note A's IPA is **B's** value — a replacive take wins over
   the unsaved edit.
5. Submitting a merge whose form values are invalid (clear the required
   `text` field, then merge) leaves note A unchanged **and** leaves the
   absorbed note B still present in the notes list. Nothing is partially
   applied.
6. The confirmation dialog shown before committing a merge names both that
   the absorbed notes will be permanently deleted and that unsaved edits
   will be saved first.
7. While the form is dirty, a visible marker appears above the merge bar
   naming that there are unsaved edits. It disappears after saving.

## Item — additive context, replacive everything else

8. Survivor has context `Han gikk på doen.`; related draft has
   `Døra var låst.` After "take context" and merge, the survivor's
   `context_text` column contains both sentences separated by exactly one
   newline, survivor's first.
9. Survivor and related draft have **identical** context text. After "take
   context" and merge, the survivor's `context_text` holds that sentence
   exactly once.
10. Survivor has a filled `substantiv` paradigm and `pos=substantiv`;
    related draft has a `verb` paradigm and `pos=verb`. After "take
    inflections" and merge, the survivor's `inflections` column contains
    **only** the verb paradigm's slots — no slot of the survivor's own
    survives — and its `pos` is `verb`.
11. The inflection fields rendered on the surviving note after criterion 10
    are the verb shape, and they are populated — not an empty set of
    substantiv fields.
12. Survivor has `en: house`; related draft has `en: home`. After "take
    translations" and merge with `translation_merge_mode=append`, the
    survivor's EN translation reads `house / home`. This is unchanged
    behaviour and must still hold.
13. "Take audio" on a related draft with a recording leaves the survivor's
    `audio_blob` equal to the related note's hash, and playing the
    survivor's audio control plays that recording.

## Item — take text and lemma

14. A related note with a `lemma` shows a "Take lemma" control; one without
    a lemma shows none.
15. Staging "Take text" from a related draft and committing leaves the
    survivor's `text` equal to that related note's text, and the notes list
    shows the survivor under the new text.

## Item — operation labelling

16. In the related-notes panel, the controls for translations and context
    visibly read as adding, and the controls for inflections, IPA, audio,
    text and lemma visibly read as replacing. The inflections control also
    indicates that the part of speech comes with it.
17. With two takes staged — one additive, one replacive — the merge bar's
    summary names each one and what it will do, before anything is
    committed.
18. The operation labels remain readable once a take control is active
    (pressed state), not only in its resting state.

## Item — open a related note

19. Every row in the related-notes panel carries a link to that note.
    Activating it opens that note's editor in a **new** browser tab; the
    original tab still shows the original note with its unsaved edits
    intact.
20. A related note whose status is `ready` has its absorb checkbox and take
    controls disabled, **and** a working link. Its accompanying note no
    longer reads as though nothing can be done with the row.

## Regression

21. Absorbing a `ready` note is still rejected by the server with the
    existing error, and the UI still disables the control.
22. An absorbed draft is hard-deleted: its id returns 404 from the
    authoring API and no tombstone row exists for it.
23. A merge that takes zero fields and changes no form value still bumps
    the survivor's `updated_at` (D82).
24. `pytest` passes in `stabbur/` with no previously-passing test skipped
    or deleted.
25. Nothing outside `stabbur/` is modified by this change.
