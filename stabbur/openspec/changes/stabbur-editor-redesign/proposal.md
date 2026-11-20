# Proposal — stabbur-editor-redesign

Batch `stabbur-redesign`, package "Stabbur editor redesign". Designed
2026-11-20 with the operator over six mockup iterations. The operator locked
it as: *"this is exactly perfect as it is now"*, to be implemented **1:1**
from `mockups/stabbur-editor-redesign.html`.

## Why

stabbur's note form exists three times (triage card, note detail, new note)
with field sets that drift apart. It is a long, prose-heavy desktop layout
that is unusable on a phone, and every field carries an inline
toggle + query + rerun strip that buries the values. The operator wants
one modern, minimal, phone-first editor. It must stay "überschaubar" on
desktop: everything in one look, nothing bloated.

Five neighbouring backlog items touch exactly these surfaces, so they are
absorbed rather than rebuilt around:
- the triage merge 404 bug
- the audio suggestion rehaul
- translations/examples as separate rows
- the duplicate-note button
- the provider order being reflected in the suggestion list

## What Changes

- **One editor, three contexts.** A single editor component serves the triage
  belt, the note opened from the Notes list, and New note. The field set is
  identical everywhere. Only the pinned action bar differs per context.
- **Phone layout.** Four segmented tabs: Word (part of speech, lemma,
  inflections), Sound (audio, IPA), Meaning (translations, examples) and
  Grammar (optional, de-emphasised). Each tab carries a done-marker: a filled
  dot when complete, `d/t` when not, and a dashed ring for optional grammar.
  The headword sits above the tabs with a small type pill on the meta line.
- **Desktop layout.** No tabs. A headword band (headword + type pill, with
  meta and similar notes on one line above it), then three columns (Word |
  Sound | Meaning) divided by hairlines, then Grammar as one quiet line.
- **Pinned, context-specific action bar**:
  - **Triage:** Delete · Skip · Previous · ⋯ · Prefill · "Ready & next". On
    the phone, Skip moves into the ⋯ tray and Prefill is icon-only. The ⋯
    menu holds Duplicate note, Send to back and Save. The keyboard shortcuts
    D S T R E M L keep working on desktop.
  - **Note:** Back · Draft|Ready · Duplicate · ⋯ · Prefill · Save, where Save
    shows dirty or "Saved". On the phone, Duplicate moves into ⋯ next to
    Delete.
  - **New note:** Prefill · Save draft · Save as ready.
- **Suggestions become one sheet per field**, replacing the inline
  ✨/query/⟳ strip:
  - Each field has one sparkle button with a candidate-count badge. It opens a
    bottom sheet on the phone and a right-side drawer on desktop.
  - The sheet has a shared editable query and rerun.
  - Providers appear as separate boxes in the operator's Settings order,
    including providers with no result.
  - Each provider can override the query for itself only, with reset and its
    own rerun.
  - A sheet animates only when it opens. Interacting inside it never replays
    the animation or loses its scroll position.
- **Part-of-speech marker instead of groups.** Translation and audio candidates
  matching the note's part of speech still sort first (the ordering rule is
  unchanged). They now carry a small PoS tag instead of "matching / other"
  headers. Audio rows show the provider's context string and the duration,
  and never a voice or speaker name.
- **Inflection candidates render as a two-column mini-table** (form → value).
- **Example candidates show their provider's context**, the same way
  translation candidates do.
- **Audio rehaul.**
  - A waveform player with a draggable selection, shown in ms.
  - The free-text "paste any audio link" box is **removed**. A single "Use URL
    from clipboard" button and an "Upload file" button replace it.
  - forvo and filmot become small "Open elsewhere" links at the bottom of the
    audio sheet, with no input fields.
- **Separate translation rows, always.** **BREAKING:** the append/separate
  merge-mode setting is removed. Using a translation candidate always adds a
  row. Each row has a small language chip that opens a menu.
- **Examples become a real list column** (`examples`, one plain sentence per
  element), replacing `context_text`. **BREAKING** for the read API (the field
  is renamed and changes type). The only consumer is mjolnir's builder,
  changed in the paired `mjolnir` change `projector-examples-column`.
- **One-time data migration:**
  - every stored translation row whose text contains `" / "` is split into
    separate rows of the same language
  - every note's `context_text` is split on newlines into `examples`
  - the `context_text` column is dropped
- **Merge in both directions**, from the similar-notes sheet:
  - "Into this note" or "This note into '<other>'", with an explicit survivor
    line.
  - Take toggles in section order: text → lemma → part of speech →
    inflections → audio → IPA → translations → examples. Part of speech is a
    new take.
  - An audio take has a play button.
- **Merge 404 fix.** Notes absorbed by a merge are removed from the in-memory
  triage queue, so the belt never lands on a hard-deleted note.
- **Duplicate note**, from the Note bar and the triage ⋯ menu:
  - copies every field, the audio reference included, as a new draft
  - in triage the copy is inserted directly after the current note
- **Prefill is a first-class button** in every editor context's pinned bar.
- **Custom controls replace every native `<select>`:** part of speech
  (dropdown with a "custom…" entry), translation language, grammar rule,
  queue, type, filters and sort.
- **Notes list.**
  - Rich filters: status, type, part of speech (multi), origin, audio
    has/none, missing fields (IPA / translation / examples / lemma), and
    updated within.
  - Sort: updated, created, text A–Z, least complete.
  - Phone: a Filters sheet plus removable active-filter chips and stacked
    rows.
  - Desktop: a filter bar with menus and a table with Origin and Complete
    columns.
- **Grammar.**
  - A rule's explanation (`grammar_rules.html`) is shown **rendered**, with an
    Edit-HTML toggle.
  - The rule page has no examples section.
  - Long titles wrap.
- **New visual language.**
  - Cool ink on white, with a dark pair.
  - One cobalt accent, hairlines instead of boxes, underlined inputs.
  - Schibsted Grotesk headword, Inter UI, Charis SIL IPA, IBM Plex Mono tags.
  - Labels are small uppercase tracked grey, and typed values use a distinct
    **value colour**.
- **Appearance settings:**
  - theme Auto / Light / Dark
  - value colour from four presets (blue, teal, violet, orange) or any custom
    colour
  - stored server-side in stabbur's settings row and applied on every page

## Capabilities

### New Capabilities
- `note-editor-surface`: the one editor shared by triage, note detail and new
  note. Covers the phone tabs and done-markers, the desktop zones, the
  context-specific pinned bar, the per-field suggestion sheet, the custom
  controls and the visual language.

### Modified Capabilities
- `note-editor`:
  - translation candidates always add a row (merge mode gone)
  - the context field becomes the examples list
  - the audio-link box is replaced by clipboard + upload
  - candidate presentation changes (PoS tag, inflection table, example
    context)
- `note-triage`:
  - Duplicate and Prefill in the bar
  - absorbed notes leave the queue after a merge
- `notes-browser`: the richer filters and sort.
- `notes-authoring`: duplicating a note.
- `notes-schema`: `examples` replaces `context_text`. Translations are never
  slash-joined.
- `notes-read-api`: `examples` (array) replaces `context_text` in the
  contract.
- `operator-settings`:
  - the translation merge mode is removed
  - the appearance preferences are added
- `similar-notes`:
  - two-way merge
  - part of speech as a take
  - take order
  - audio preview
- `grammar-management`: the explanation is rendered as HTML, and the rule has
  no examples.
- `captures-ingestion`: promotion seeds `examples` from the capture's
  `context_text`.

## Impact

- **stabbur:**
  - `ui/` is rewritten
  - `db/models.py` and a new alembic migration for the split and drop
  - `routes/notes.py` (authoring, read API, merge, duplicate)
  - `routes/captures.py` (promotion)
  - `routes/settings.py` and `settings_store.py` (merge mode out, appearance
    in)
  - `routes/enrich.py`, plus import scripts and tests that name
    `context_text`
- **mjolnir builder:** `projector.js` and its fixtures, in the paired change
  `projector-examples-column`. This change must deploy before or together
  with it, never after.
- **Not touched:**
  - the device plane (`docs/11`)
  - the hover-translate capture contract (`POST /api/captures` keeps
    accepting `context_text`, D154)
  - smia
