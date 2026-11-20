# Acceptance criteria — stabbur-editor-redesign

The review contract for `/tun-build`. Every criterion is checked by
observing the running dev compose stack in a browser (claude-in-chrome or
Playwright) at **390 px** ("phone") and **1440 px** ("desktop") wide, or by
querying the dev database where it says so. **Reference:**
`mockups/stabbur-editor-redesign.html`. The operator locked it to be built
1:1, so "as in the mockup" is a pass/fail comparison of layout, controls and
copy, not of sample data.

Seed for the UI checks: at least four drafts in one triage queue. At least
one of them must have a similar note, one must have audio, one must have
part of speech adjektiv with dict_cc candidates for both [adj] and [verb],
and there must be one ready note.

## Data and migration

- **C01** — Before migrating, insert note X with context_text `"A.\n\nB."` and translations `[{en,"toilet / loo"},{de,"Klo"}]`. After the migration, the DB shows X.examples = `["A.","B."]` and X.translations = `[{en,"toilet"},{en,"loo"},{de,"Klo"}]`.
- **C02** — After the migration, `SELECT count(*) FROM notes WHERE translations::text LIKE '% / %'` returns 0. `\d notes` shows no `context_text` column, and `\d settings` shows no `translation_merge_mode`.
- **C03** — `GET` on the public read API returns every note with an `examples` array of strings and no `context_text` key.
- **C04** — `POST /api/captures` with `context_text: "Vi må komme i vei nå."` creates a draft whose examples are exactly `["Vi må komme i vei nå."]`. The capture row still has that context_text.
- **C05** — Saving a note with examples `["Hvor er doen?","Doet er opptatt."]` from the editor stores exactly that array (DB check).
- **C06** — `grep -rn "context_text" stabbur/` lists only the Capture model, capture ingestion, and the migration file.

## Server behaviour

- **C07** — Duplicating a ready captured note with audio creates a new row that is status draft, origin manual, with capture_id null and the same audio_blob, translations, examples and inflections (DB check). The original row is unchanged.
- **C08** — Merging with only "part of speech" taken changes the survivor's PoS and leaves its inflections unchanged (DB check).
- **C09** — Merging with "examples" taken when both notes share one sentence leaves the survivor with the union and no duplicate (DB check).
- **C10** — The notes API with `pos=adjektiv&audio=none` returns only adjectives without audio, with a correct total.
- **C11** — The notes API sorted by completeness returns a note missing IPA, translations and examples before a complete note.
- **C12** — `PATCH /api/settings` with `value_color: "pink"` or `value_color_custom: "red"` is rejected. `theme: "dark"`, `value_color: "teal"` is stored.

## Shell, look, appearance

- **C13** — Every stabbur page uses the new language: cool neutral background, hairline separators, underlined inputs, uppercase grey labels, cobalt primary buttons. The old warm palette (`#f5f3ef`, `#b35a2d`) appears nowhere in the served CSS.
- **C14** — Choose Settings → Appearance → Dark + teal, then reload. Every page is dark, and lemma, IPA, translation and example values compute to `rgb(79, 209, 192)`. The same holds in a second browser profile (server-side preference).
- **C15** — Picking a custom colour `#c2185b` makes the values compute to that colour in both the Light and Dark themes. With Auto selected, toggling the OS/emulated colour scheme switches the theme with no reload. On a hard reload there is no visible flash of the other theme.
- **C16** — On every page and in every context, `document.querySelectorAll('select').length === 0`.
- **C17** — Settings shows Appearance first, then Triage prefilling, Provider order (one draggable list per kind, reorderable by keyboard as well), Lookups, Examples prefill. There is no translation merge-mode control anywhere.

## The one editor

- **C18** — Open the same note in triage, from the Notes list, and as a duplicate. The field set, order and section layout are identical. New note shows the same fields, empty.
- **C19** — The headword is large and wraps for a long expression. No IPA line is under it. The type pill opens a menu with the five types, and choosing one updates the pill. There is no type field inside any section.
- **C20** — The phone meta line shows type pill · status · PoS · "N similar". The desktop line above the headword shows status · PoS and "Similar: … · Review & merge".
- **C21** — Phone: four sticky tabs (Word, Sound, Meaning, Grammar), each with a marker. Adding the missing example flips Meaning from `1/2` to a filled dot live. On a non-grammar note without a rule, Grammar is greyed with a dashed-ring marker.
- **C22** — Desktop: no tab elements. Word | Sound | Meaning columns are separated by vertical hairlines, each headed by its name and marker. Grammar is one line below them.
- **C23** — Desktop with a linked rule: the rule's explanation is shown rendered under the grammar line.
- **C24** — Part of speech is a dropdown listing —, the six classes and "custom…". "custom…" turns it into a text input, and the typed value is what gets saved.
- **C25** — Audio shows the play button and waveform. Dragging a selection edge updates the "x–y ms" readout, and Save stores matching `audio_sel_ms`. There is no free-text URL input anywhere in the editor or the audio sheet.
- **C26** — Translations are separate rows, each with a language chip (opening a menu of languages) and ✕. "+ Add translation" adds an empty row.
- **C27** — Examples are separate auto-growing rows with ✕. "+ Add example" adds a row.
- **C28** — Every field with providers has exactly one sparkle button with a count badge. No inline query input or ⟳ button exists under any field.
- **C29** — Phone: a sparkle opens a bottom sheet. Desktop: it opens a right-hand drawer. Both have a shared query input and rerun.
- **C30** — In the translations sheet, the provider boxes appear in the Settings order, numbered 1…n, with prefill set to on demand and no prefill run. Reorder in Settings, reopen, and the order follows. A provider with no candidates shows "Nothing for '<query>'".
- **C31** — Opening dict_cc's "query" control, typing a different query and rerunning makes dict_cc's header show the custom query, and only dict_cc's box changes. Reset returns it to the shared query.
- **C32** — Scroll a sheet halfway, then click Use on a list kind, a provider query control, and a merge take toggle. The sheet does not replay its slide-in animation and stays at the same scroll position.
- **C33** — On the adjektiv seed note:
  - audio sheet: the [adj] candidate is above the [verb] one and carries an "adj" tag. No "matching" or "other" heading exists, and no voice or speaker name is shown, only the context and the duration.
  - inflections sheet: candidates render as form → value tables.
  - examples sheet: every candidate shows a context line.
  - audio sheet: forvo and filmot appear only as links at the bottom, with no inputs.
- **C34** — Using an IPA token appends it after a space, and using the assembled row replaces. Using a translation adds a new row and leaves the existing rows' text unchanged. Using part of speech, inflections or audio closes the sheet. Using a translation, example or IPA token leaves it open.
- **C35** — With a direct mp3 URL on the clipboard, "Use URL from clipboard" attaches that audio. With non-URL text on the clipboard, a message says it holds no URL and the audio is unchanged.

## Bars, triage, merge, duplicate

- **C36** — Triage bar:
  - desktop: Delete D, Skip S, Previous T, ⋯, "Prefill L", "Ready & next R"
  - phone: Delete, Previous, ⋯, an icon-only Prefill, "Ready & next", with the label fully visible
  - the phone ⋯ menu holds Skip, Duplicate note, Send to back and Save; on desktop it holds Duplicate note, Send to back and Save
- **C37** — Note bar:
  - desktop: Back, Draft|Ready, Duplicate, ⋯ (Duplicate note, Delete note), Prefill, Save
  - phone: Back, Draft|Ready, ⋯, Prefill icon, Save
  - Save reads "Saved" until an edit, then shows a dirty dot and "Save"
- **C38** — The New note bar shows Prefill, "Save draft" and "Save as ready".
- **C39** — On desktop triage with focus outside any input, the keys D S T R E M L each perform their action. Delete asks for confirmation in an in-page popover (no browser dialog).
- **C40** — In triage, "Duplicate note" followed by Skip presents the copy next (same fields, status draft). The queue total increases by one.
- **C41** — With drafts A, B, C queued and A under review, merging B into A and then pressing Skip presents C. The network log shows no request to B's id after the merge (the 404 bug).
- **C42** — Merging the current draft into another note advances the belt, and the total drops by one.
- **C43** — The similar sheet lists each similar note with Open and "Merge…". Merge… shows the direction switch "Into this note" | "This note into '<other>'", a survivor sentence, and take rows in exactly the order text, lemma, part of speech, inflections, audio, IPA, translations, examples, with no section headings.
- **C44** — The audio take row has a play button, and pressing it stages nothing. Rows that are empty on the source are disabled. The commit button reads "Merge N fields · keep '<survivor>'" and N tracks the toggles.
- **C45** — From the Notes list, merging draft "bilen" into ready "bil" with translations taken deletes "bilen" and opens "bil" holding both sets of translations.
- **C46** — With a ready note open, "This note into '<other>'" is disabled and states that only a draft can be merged away.
- **C47** — Note-context Duplicate opens a new draft whose meta line says "copy of <original>", with identical fields and playable audio.

## Notes list and grammar

- **C48** — Phone list: stacked rows with headword, small audio and status glyphs on the right, and a dim line of type · PoS · first translation · updated. A "Filters" button with an active-count badge opens a sheet whose primary button reads "Show N notes".
- **C49** — Choosing part of speech adjektiv and Audio "no audio" shows two removable chips plus "Clear all". Every row is an adjective without audio, and the count matches. Removing a chip widens the results immediately.
- **C50** — Desktop list: a filter bar (Status, Type, Part of speech, Origin, Audio, Missing, Updated) with custom menus, a sort menu (Recently updated, Recently created, Text A–Z, Least complete first), and a table with columns Text, Type, Part of speech, Translation, Origin, Status, Audio, Complete, Updated.
- **C51** — "Triage these" opens the belt whose total equals the filtered count.
- **C52** — A rule with `<p>`, `<table>` and `<ul>` HTML displays rendered, with no visible tags. "Edit HTML" shows the source, and an edit that is saved shows up in the rendered view. A rule containing `<script>` or `onclick` executes nothing.
- **C53** — The rule page shows the wrapping title, explanation and "Used by N notes" chips, and has no examples section.

## Cross-checks

- **C54** — Side by side with the mockup at 390 px and 1440 px, in light and dark, every page and context matches its layout, control set and copy. No page scrolls horizontally at 390 px.
- **C55** — The stabbur pytest suite passes.
- **C56** — This change's diff touches nothing under `grind/`, `mjolnir/` (the builder belongs to the paired change), `smia/`, or the device-plane paths of `docs/11-ota-contract.md`.
