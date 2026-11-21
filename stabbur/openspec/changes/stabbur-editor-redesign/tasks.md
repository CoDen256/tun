# Tasks — stabbur-editor-redesign

The reference for every UI task is
`mockups/stabbur-editor-redesign.html`. Open it next to the running app
and match it. Acceptance criteria are in `acceptance.md`, and each group
below names the criteria it must turn green.

## 1. Data model and migration (C01–C06)

- [x] 1.1 Alembic migration per design D5: add `notes.examples` (JSONB array, NOT NULL, default `[]`); fill it from `context_text` (split on newlines, trim, drop empty lines, keep order); split translation rows on `" / "` in place; drop `notes.context_text`; drop `settings.translation_merge_mode`. Verify with a pytest that seeds pre-migration rows and asserts the post-migration values from the `notes-schema` scenarios.
- [x] 1.2 Update `db/models.py` (`Note.examples`, no `context_text`; Settings without the merge mode; add `theme`, `value_color`, `value_color_custom`). Verify: model tests pass, and `grep -rn context_text stabbur/` hits only `Capture` and the migration.
- [x] 1.3 Authoring and read APIs (`routes/notes.py`): accept and return `examples` as a list of strings, and validate each element as a non-empty string; the read API returns `examples` in place of `context_text`. Update `tests/test_notes_read_api.py` and the authoring tests.
- [x] 1.4 Capture promotion (`routes/captures.py`): the draft's `examples` is `[context_text]` when the context is non-empty, else `[]`. Ingestion still accepts `context_text`. Update `tests/test_captures.py`.
- [x] 1.5 Import scripts (`scripts/import/*`) and `scripts/seed_p4_notes.py`: write `examples` lists. Update their tests.

## 2. Server behaviour (C07–C12)

- [x] 2.1 Duplicate endpoint per D11: copy every field including audio; status draft; origin manual; no capture or import link. Covered by a pytest.
- [x] 2.2 Merge: add part of speech as a take; examples are additive with de-duplication, replacing the context-text handling; the "absorb this note" direction uses the existing survivor/absorbed API with the roles swapped; a ready note cannot be absorbed (existing rule). Pytest for each take and both directions.
- [x] 2.3 Notes browser API: the filters and sorts from the `notes-browser` delta (PoS multi, origin, audio, missing fields, updated within; sort by updated, created, A–Z, completeness), server-side and paged, with a total. Pytest per filter and sort.
- [x] 2.4 Settings: remove `translation_merge_mode` from the store and routes; add `theme`, `value_color` and `value_color_custom` with validation (enum values; `#rrggbb`). Pytest.
- [x] 2.5 Enrichment (`routes/enrich.py`): pass through each examples candidate's provenance/context so the sheet can show it. No smia change.

## 3. Shell, visual language, appearance (C13–C17)

- [x] 3.1 New design tokens and fonts per the mockup's `:root` (light and dark pair, value-colour presets D12). Apply the theme and value colour before first paint on every page. Verify C13–C15 in the browser.
- [x] 3.2 Custom menu control replacing every native `<select>` (PoS with "custom…", language chip, grammar rule, queue, type pill, filters, sort). Verify: no `<select>` in the DOM on any page (C16).
- [x] 3.3 Settings page in the new language: Appearance section first (theme switch, four swatches plus custom, preview line); provider order lists draggable by mouse, touch and keyboard; merge-mode control removed; number inputs become steppers. Verify C17.

## 4. The one editor (C18–C35)

- [x] 4.1 Replace the three form copies with one editor component used by triage, note and new note (D1). Remove the old `page-note-detail` and `page-new-note` form markup. Verify C18.
- [x] 4.2 Headword band: a wrapping headword textarea with the text-from-audio sparkle; the type pill (on the desktop headword row; on the phone meta line); meta line with status · PoS · "N similar"; no IPA subtitle. Verify C19–C20.
- [x] 4.3 Phone layout: four sticky tabs with live done-markers; Grammar optional styling. Desktop layout: three hairline columns plus a grammar line, no tabs. Choose the breakpoint (tier 2). Verify C21–C23.
- [x] 4.4 Field sections exactly as in the mockup: PoS menu; lemma; inflection grid; audio waveform with draggable ms selection, "Use URL from clipboard" and "Upload file"; IPA; translation rows with a language chip and ✕; example rows with ✕; "+ Add" links. Verify C24–C27.
- [x] 4.5 Suggestion sheet (D8): one sparkle and badge per field; bottom sheet on the phone and right drawer on desktop; shared query and rerun; provider boxes in Settings order, with provider-only query, Reset and rerun; PoS tag instead of groups; audio rows with context and duration only; inflection mini-table; example context line; forvo and filmot as bottom links; animate on open only and keep scroll on re-render. Verify C28–C33.
- [x] 4.6 Use semantics unchanged except translations: an IPA candidate appends with a space, and the assembled row replaces; translations and examples add rows; single-value kinds close the sheet. Verify C34.
- [x] 4.7 Clipboard capture (D9): read the clipboard on click; capture the URL through the existing link route; show an explicit message when unreadable or not a URL. Verify C35.

## 5. Context bars, triage, merge, duplicate (C36–C47)

- [x] 5.1 Pinned bars per context and width, exactly as in the `note-editor-surface` table; ⋯ menus; in-page delete confirmation; desktop key hints and keys D S T R E M L. Verify C36–C39.
- [x] 5.2 Triage belt: queue menu, "n / total" and a 2 px progress line. Duplicate in ⋯ inserts the copy next in the queue. Verify C40.
- [x] 5.3 Merge 404 fix: drop absorbed ids from the in-memory queue after every merge; advance when the current note was absorbed. Verify C41–C42.
- [x] 5.4 Similar-notes sheet: phone chip and desktop "Similar: … · Review & merge" line; Open; Merge… with the direction switch, survivor line, ordered take rows, audio play, disabled empty rows, "Merge N fields · keep '<survivor>'"; the ready note's absorb direction disabled with the reason. Verify C43–C46.
- [x] 5.5 Note-context Duplicate opens the copy labelled "copy of …"; the Save dirty/"Saved" state; the Draft|Ready switch. Verify C47.

## 6. Notes list and grammar (C48–C53)

- [x] 6.1 Notes list: phone stacked rows, Filters sheet with "Show N notes", removable chips and "Clear all", count and sort line; desktop filter bar, sort menu, table with Origin and Complete columns; pager; "Triage these" over the filtered set. Verify C48–C51.
- [x] 6.2 Grammar list and rule page: wrapping title, rendered HTML explanation with the Edit HTML / Show rendered toggle (sanitised), "Used by N notes" chips, no examples section; the editor's grammar line shows the rendered explanation. Verify C52–C53.

## 7. Cross-checks (C54–C56)

- [x] 7.1 Visual pass against the mockup at 390 px and 1440 px in light and dark, for every page and context. Verify C54.
- [x] 7.2 Run the full stabbur pytest suite green. Confirm nothing under the device plane, smia or `mjolnir/` changed in this change's diff. Verify C55–C56.

## Workflow follow-up

- Deploy together with `mjolnir/openspec/changes/projector-examples-column`: stabbur's migration first, then the builder (design D6). The operator checklist must spell out the backup and the verification queries.
