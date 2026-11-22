# Tasks — stabbur-editor-fixes

Acceptance criteria are in `acceptance.md`; each group names the criteria it
must turn green. The design decisions are `design.md` D1–D11.

## 1. Picker reliability (F01–F03)

- [ ] 1.1 `ui/ui.js`: per D1, make the picker's scroll-close rule positional.
  `openPick` records `app.querySelector('.scroll').scrollTop`; the capture
  `scroll` listener closes the picker only when the live scrollTop differs
  from the recorded one, and re-records when it does not close. Verify by
  opening every picker with the page scrolled.
- [ ] 1.2 Confirm the translation-row language picker works from the same fix
  (finding 8); only if it does not, find and fix its own cause.

## 2. Lemma on open (F04–F06)

- [ ] 2.1 `ui/ui.js`: move the derive-from-text guess out of
  `showTriageNote` into `newEditor`, after `E.base` is taken, per D2. Remove
  the duplicated block from `showTriageNote`.
- [ ] 2.2 `prefill()` derives the lemma as its first step when the field is
  empty, before any `ensureKind`.

## 3. Examples prefill is N × M (F07–F09)

- [ ] 3.1 `ui/ui.js`: `PREFILL_STEPS.examples` asks the first
  `examples_max_providers` enabled providers and takes up to
  `examples_count` from each, de-duplicated, no backfill, no overall
  truncation (D3).
- [ ] 3.2 `providerLookup` sends `limit = examples_count` as the per-provider
  limit (it is the same key; confirm nothing else reads it as a total).
- [ ] 3.3 Settings labels: "Providers to ask" and "Sentences per provider",
  with the resulting maximum shown under them.

## 4. Per-language translations provider order (F10–F13)

- [ ] 4.1 `routes/settings.py`: resolve `translations:<lang>` kinds computed
  from `default_target_langs` plus stored `translations:*` keys, against the
  translations catalogue (`CATALOGUE_SOURCE`). Accept them in the PATCH
  validator with a language-shaped key check. Pytest.
- [ ] 4.2 `settings_store.py`: a `translations:<lang>` key with nothing
  stored resolves from the stored plain `translations` preference (D4).
  Pytest for the seed, for independence between languages, and for other
  kinds staying single.
- [ ] 4.3 `ui/ui.js`: `kindProviders('translations', lang)`; a lookup for a
  provider asks only the languages that enable it; the translations sheet is
  grouped by language with each group in its own order; `ccount` unchanged.
- [ ] 4.4 `ui/ui.js`: prefill walks each missing language's own order.
- [ ] 4.5 Settings page: one Translations list per target language, labelled,
  with no generic list; dragging one saves only that language's key.

## 5. Dropping an audio file (F14–F16)

- [ ] 5.1 `ui/ui.js`: extract `uploadAudioFile(file)` from the `fileIn`
  change handler and use it for both paths.
- [ ] 5.2 `dragover`/`dragleave`/`drop` on the editor in all three contexts,
  with a drop overlay while a file drag is over it; audio files attach,
  non-audio is refused with a toast and changes nothing (D5).
- [ ] 5.3 `ui/ui.css`: the overlay.

## 6. Similar notes highlight (F17–F18)

- [ ] 6.1 `ui/ui.js` + `ui/ui.css`: the phone chip and the head of the
  desktop similar line become one filled accent badge, rendered only when
  `E.sim.length` (D6).

## 7. Force prefill (F19–F21)

- [ ] 7.1 `ui/ui.js`: `prefill({ force })` skips each step's has-a-value
  guard and passes `force` through `ensureKind`/`fetchKind` so the lookup
  cache is bypassed (D7).
- [ ] 7.2 "Force prefill" in the ⋯ tray of the triage and note contexts, with
  its consequence in the label; toast reports what was replaced.

## 8. Previous does not prefill (F22–F23)

- [ ] 8.1 `ui/ui.js`: `showTriageNote({ prefill: false })` from `goPrevious`
  only (D8).

## 9. Splitting alternatives on `/` (F24–F27)

- [ ] 9.1 `ui/ui.js`: one `splitAlternatives(text)` helper per D9, applied
  where a translations answer is normalised in `providerLookup`, before
  de-duplication. Candidates keep their language and context.
- [ ] 9.2 Alembic migration: split every stored translation row on `/` into
  separate rows of the same language, keeping position, collapsing
  `(lang, text)` duplicates within a note; `downgrade` raises. Pytest that
  seeds pre-migration rows and asserts every `notes-schema` scenario,
  including the note count.

## 10. C28 (F28)

- [ ] 10.1 No code change. Confirm by observation that no ✨ badge appears on
  a freshly opened note and that one appears after Prefill and after opening
  a sheet. The spec delta already states it.

## 11. Close

- [ ] 11.1 `pytest` green in `stabbur/`.
- [ ] 11.2 Tester agent verifies `acceptance.md` against the running dev
  stack; reviewer agent reviews the diff.
- [ ] 11.3 Archive both changes, append the operator checklist section with
  the migration spelled out, update the batch manifest.
