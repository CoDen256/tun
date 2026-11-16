# Tasks — stabbur-merge-fixes

Order matters in one place: **task 1 (carrying the form's values) must land
and be verified before task 2 changes what takes do**, so that no interim
state both loses unsaved edits and alters merge semantics at once.

## 1. Save-then-merge

- [x] 1.1 `POST /api/notes/merge` accepts the survivor's field values
      alongside `survivor_id`, `absorbed_ids` and `take`. Absent values
      mean "unchanged", so an older client keeps working.
- [x] 1.2 Apply the submitted values to the survivor **before** the takes,
      inside the existing transaction, subject to the same validation the
      authoring PATCH applies. `origin` and `import_ref` stay immutable.
- [x] 1.3 Reject a merge whose submitted values fail validation with the
      same error shape the PATCH route returns — never partially apply.
- [x] 1.4 `commitSimilarMerge` sends the current form values, from the
      editor (`e`) and the triage card (`t`) alike.
- [x] 1.5 The confirm text states that unsaved edits will be saved first.
- [x] 1.6 Show a visible marker above the merge bar while the form is
      dirty, naming what will be saved.
- [x] 1.7 Keep D82's explicit `updated_at` bump.
- [x] 1.8 Tests: unsaved edit survives a merge taking nothing; a take of
      the same field wins over the submitted value; an invalid submitted
      value rolls the whole merge back and the absorbed note still exists.

## 2. Additive vs replacive takes

- [ ] 2.1 `context_text` merges instead of replacing: append on a single
      newline, skip an exact (trimmed) duplicate.
- [ ] 2.2 `inflections` always carries the source's `pos` across. Remove
      the conditional auto-pair and its `_autoPosFor` bookkeeping from the
      client — the pairing is now unconditional and belongs server-side.
- [ ] 2.3 Leave `translations` merging exactly as it is.
- [ ] 2.4 Tests: context append, context duplicate skipped, inflections
      replace wholesale, pos follows inflections even when the survivor
      already had one.

## 3. Take buttons for text and lemma

- [ ] 3.1 Add "Take text" and "Take lemma" controls to the similar-note
      row, shown only when the match has a value for that field.
- [ ] 3.2 Both behave as replacive takes; no server change is needed, both
      are already in `MERGE_TAKE_FIELDS`.

## 4. Operation labelling

- [ ] 4.1 Each take control carries its operation inline — *adds* for
      translations and context, *replaces* for the rest, *replaces + PoS*
      for inflections.
- [ ] 4.2 The merge bar's summary names, per staged take, what it will do.
- [ ] 4.3 Keep the labels legible when a control is active/pressed.

## 5. Open a related note

- [ ] 5.1 Each similar-note row gets a link to that note's editor opening
      in a new tab, with `rel="noopener"`.
- [ ] 5.2 Present on every row, including `ready` matches whose other
      controls are disabled. Update the "ready — cannot be absorbed" note
      so it no longer reads as a dead end.

## 6. Specs

- [ ] 6.1 Record the deliberate asymmetry — merge's Take IPA replaces while
      the enrichment panel's Use appends — where a later reader meets it,
      so it is not "made consistent" by a future change.
