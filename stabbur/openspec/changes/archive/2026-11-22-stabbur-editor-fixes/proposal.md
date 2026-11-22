# Proposal — stabbur-editor-fixes

Batch `stabbur-redesign`, package "Stabbur editor fixes". The operator
deployed `stabbur-editor-redesign` and tested it live; this is the return
leg of D161 — thirteen live findings, verbatim, turned into one change.
The paired mjolnir change is `projector-translation-langs`.

## Why

The redesign landed, and working with it for real surfaced defects and gaps
the build sandbox could not show: a dropdown that closes itself, a prefill
that cannot run because the field it queries from is empty, an examples
budget that does not mean what the operator set it to, and a provider order
that is global where the operator's work is per-language.

Operator findings, verbatim:

1. the dropdowns don't work reliably, sometimes i can't open them at all
2. lemma is not prefiiled when i open note not via triage, only when i edit
   the text, but i can't run the prefill without lemma and i normally i
   would jsut open the note and press prefill directlyæ
3. examples prefiil should work the following: i set the number of providers
   and number of sentences, it always asks first N providers and pickx M
   sentences from each of them, so that we have NxM examples.
4. for each language i want to have own order of providers.
5. drag and rop feature of audio not working
6. C28 yes only after i press prefill or open a drawer correct.
7. similar notes should have some highlight, since i miss them, they are not
   that visible.
8. can't change translation lang when manually adding a translation.
10. i need also force prefill button, that would override everything ther is
    already prefilled.
11. don't prefiil when going to previous card, even if it set up to prefill.
12. also i need to parse suggestions from providers that have also "/"
    between translations as alternatives, even thouse where ther is no space
    before/after "/"
13. Also the same goes for the database. I already migrated everything, but
    we need another migration, that will go over each translation and split
    any translation having any "/" (without spaces) into separate
    translation entries. Also verify that the builder no how to parse
    multiple entries for the same language. It Should join them by "/" when
    presenting, but different languages appear on different rows.

Three readings were settled with the operator before this was written:
- (5) means **dropping an audio file onto the editor**, which does not exist
  today — not the waveform trim handles and not the settings drag handle.
- (4) means the **Translations** provider list only. The other six lists ask
  Norwegian-side questions that do not vary by target language.
- (3) takes what a short provider has and does **not** backfill from the
  others: each provider's share stays its own.

(6) is the operator's ruling on the C28 question this batch was blocked on.
It confirms the shipped behaviour — the ✨ count badges appear only after a
Prefill or after the field's sheet has been opened — so the block is lifted
with no code change, and the spec is amended to state it.

(9) is absent from the operator's list.

## What Changes

- **Pickers survive a render.** Every custom dropdown (part of speech, type,
  translation language, grammar rule, queue, notes filters and sort) opens
  and stays open regardless of where the page is scrolled.
- **The lemma is derived on open in every context**, not only on the triage
  belt, and Prefill derives it itself when it is still empty — so Prefill is
  never blocked by an empty lemma.
- **Examples prefill is N × M.** "Providers to ask" (N) and "Sentences per
  provider" (M): the first N enabled providers are asked, up to M sentences
  are taken from each, and a provider with fewer contributes what it has.
- **The Translations provider order is per target language.** Settings shows
  one Translations list per language in Translation languages; the
  translations sheet is grouped by language, each group listing its own
  providers in its own order; prefill walks each language's own order.
- **An audio file can be dropped onto the editor** to attach it, in all three
  contexts, alongside Upload file and Use URL from clipboard.
- **Similar notes are highlighted** so they cannot be missed.
- **Force prefill** overwrites fields that already hold a value, from the ⋯
  tray, next to the gap-filling Prefill that stays unchanged.
- **Previous never prefills**, whatever the prefill timing setting says.
- **Translation candidates split on `/`.** A provider answering
  `"hurry/rush"` or `"hurry / rush"` offers two candidates, not one.
- **Stored translations split on `/` once, by migration**, into separate rows
  of the same language.
- **C28 is settled**: the suggestion count badges appear only after an
  explicit action. Specified, not changed.

## Impact

- `stabbur`: `ui/ui.js`, `ui/ui.css`, `settings_store.py`,
  `routes/settings.py`, `routes/enrich.py`, one Alembic migration, tests.
- `mjolnir`: the builder projector only, in the paired change
  `projector-translation-langs`. Deploy stabbur first.
- Device plane, APK, grind, smia, hover-translate: untouched.
- The hover-translate capture contract (D154) is unchanged.
