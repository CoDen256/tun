# Design — stabbur-editor-redesign

See `proposal.md` for the why and the full list of what changes. The
operator settled everything here in the 2026-11-20 `/tun-design` session.
**The mockup is the look-and-interaction reference and is built 1:1.**

## Context

- The editor exists three times in `ui/index.html` (`page-triage`,
  `page-note-detail`, `page-new-note`), each with its own field markup.
  `ui/ui.js` is 4.4k lines and drives all three separately.
- `notes.context_text` is one TEXT. Newlines separate examples, and
  `mjolnir/builder/src/projector.js` turns them into `<br>` on the X face.
- `notes.translations` is `[{lang, text}]`. With
  `settings.translation_merge_mode = 'append'`, a second candidate for the
  same language was glued on as `"a / b"` inside one row (`useTranslationCandidate`).
  That `" / "` is the only writer of that separator in translations.
- The PoS ordering rule (`stabbur-triage-queues` D5) and the IPA asymmetry
  (`stabbur-merge-fixes` D2, `stabbur-triage-queues` D6) are settled and
  documented in `stabbur/CLAUDE.md`. This change keeps both and changes only
  their presentation.

## Goals / Non-Goals

**Goals:**
- The mockup's screens, controls, copy and behaviour, reproduced faithfully
  in the real app, in both layouts and both themes.
- Data that matches the UI: examples and translations are lists of separate
  values end to end, with no joined strings and no compatibility shims.

**Non-Goals:**
- No change to the device plane, smia, or the hover-translate capture
  contract.
- No change to which verdicts exist, or to their save semantics (autosave /
  manual stays as it is).
- No change to PoS-ordering, IPA-append or merge-IPA-replace semantics.
- No per-example translation. An example is a plain sentence.

## Decisions

### D1 — One editor, three contexts
One editor implementation renders the fields and suggestion sheets. The
context (triage | note | new) selects only:
- the pinned bar's contents
- the belt above the headword (triage only)
- what Save / verdicts do

Alternative rejected: keeping three forms with a shared field list. That is
what drifted.

### D2 — The mockup is normative
`mockups/stabbur-editor-redesign.html` is the reference for:
- layout, spacing, type, colour tokens
- control shapes, copy
- sheet behaviour, marker semantics, bar contents per context and per
  layout

Its *data* is sample data. Where the mockup simulates something (clipboard
read, playback, pagination, grammar save), the real behaviour is specified in
`specs/`.

### D3 — Phone vs desktop is a layout switch on viewport width
- Narrow: the tabbed phone layout.
- Wide: the three-zone desktop layout.

The breakpoint is tier 2. Choose it so the three desktop columns never
compress below roughly 280 px each. No separate mobile route; same URL, same
state.

### D4 — `examples` is a JSONB array of strings, replacing `context_text`
- `notes.examples JSONB NOT NULL DEFAULT '[]'`: an ordered list of non-empty
  plain sentences.
- `context_text` is **dropped**, not kept alongside. The operator: *"Ideally
  don't leave any backwards compatibility stuff if not needed."*

JSONB array, not a child table, because:
- it mirrors `translations`
- it travels whole with the note through the read API, merge and duplicate
- nothing queries an individual example

### D5 — One alembic migration does all data surgery, exactly once
1. Add `examples`. Fill it from `context_text`:
   - split on `\n`
   - trim each line
   - drop empty lines
   - keep the order
2. For every note, replace each translation row whose `text` contains
   `" / "` with one row per non-empty, trimmed segment, same `lang`, in
   order, at the position of the original row. Within that language, drop
   only exact duplicates the split itself produces.
3. Drop `notes.context_text`.
4. Drop `settings.translation_merge_mode`.

`captures.context_text` is untouched: the capture is provenance (D85).

Both splits are mechanical inverses of what wrote them (newline-join and
append-mode), not guesses. The migration is irreversible by design. The
pre-deploy daily backup dump is the rollback. The operator checklist must say
so and must list the verification queries.

### D6 — Read API: `examples` replaces `context_text`; deploy order
- The public read API (`notes-read-api`, contract D-N4) returns
  `examples: string[]` in place of `context_text`.
- The only consumer is mjolnir's builder: paired change
  `mjolnir/openspec/changes/projector-examples-column`.
- The builder change makes the projector read `examples` and join it with
  `<br>`.
- For context text separated by single newlines, that output is
  byte-identical to today's. A context that had blank lines or padded lines
  loses the empty `<br>`s and the padding (D5 drops them).
- Every publish already regenerates all minted cards' content
  (`builder-pipeline`), so those cards simply update on the next publish.
  Nothing else churns.
- **Deploy both in one rollout.** The operator checklist orders the stabbur
  migration first, then the builder.

### D7 — Translations are always separate rows
- Using a candidate always appends a new `{lang, text}` row.
- `translation_merge_mode` and its settings control are removed.
- In the sheet, translation candidates are listed **per provider** (provider
  boxes, as for every kind), each with a language tag. The per-language
  grouping and the in-panel "add target language" control are **dropped**
  (operator decision). Which languages are queried comes only from Settings →
  Translation languages.

### D8 — Suggestion sheet
- One sheet per field kind: bottom sheet on the phone, right drawer on
  desktop.
- Providers render as boxes in the operator's Settings order. Disabled
  providers are hidden, and a footer says how many are switched off. A
  provider with no candidates still renders, as "Nothing for '<query>'".
- The shared query starts from the field's named source (unchanged rule).
  Each provider can override it with its own query, and rerun only that
  provider.
- The open animation runs once per opening. A re-render keeps the sheet
  still and preserves its scroll position.
- Candidates matching the note's PoS sort first (unchanged), with a small PoS
  tag on the row instead of group headers.
- Audio rows show `context` + duration only.
- Inflection candidates render as a form → value mini-table.
- Example candidates show the provider's provenance/context line.
- Single-value kinds close the sheet after Use: part of speech, inflections,
  audio, text-from-audio. List kinds stay open: translations, examples, IPA
  tokens.

### D9 — Audio input
- The "paste any audio link" text input is removed.
- "Use URL from clipboard" reads the clipboard on that click (it requires a
  secure context and the browser's permission) and runs the existing link
  capture with the URL it finds.
- When the clipboard is unreadable or holds no URL, the operator is told
  exactly that. There is no hidden fallback text box.
- "Upload file" is the existing manual upload.
- forvo and filmot appear only as external links at the bottom of the audio
  sheet, in their Settings order. They never show inputs.

### D10 — Merge is two-way and drops absorbed notes from the queue
- The similar-notes sheet offers "Into this note" (the current note survives)
  and "This note into '<other>'" (the other survives, the current note is
  absorbed).
- The existing "only a draft may be absorbed" rule stands. When the current
  note is `ready`, the second direction is disabled and shows the reason
  (operator decision).
- Takes, in order: text, lemma, part of speech, inflections, audio, IPA,
  translations, examples.
  - IPA, text, lemma, part of speech, inflections and audio replace.
  - Translations and examples are added, de-duplicated.
  - This is the existing semantics plus part of speech.
- Save-then-merge (`stabbur-merge-fixes`) is unchanged.
- After any merge in triage, every absorbed id is removed from the in-memory
  queue (the 404 fix).
- When the current note was absorbed:
  - in triage, the belt advances
  - from the Notes list, the survivor opens

### D11 — Duplicate
- Creates a new `draft` note with every field copied, including
  `audio_blob`/`audio_sel_ms`. Blobs are content-addressed, so the bytes are
  shared.
- `origin` is `manual`, with no `capture_id` and no `import_ref`, because a
  capture backs exactly one note (`notes-schema` origin evidence).
- From Note, the copy opens. From triage, the copy is inserted directly after
  the current note in the in-memory queue.

### D12 — Appearance preferences
New scalar preferences on stabbur's single settings row:
- `theme`: `auto|light|dark`, default `auto`
- `value_color`: `blue|teal|violet|orange|custom`, default `blue`
- `value_color_custom`: `#rrggbb`, default unset

Each preset has a light and a dark shade. These are the mockup's tokens:

| preset | light | dark |
|---|---|---|
| blue | `#0b5cff` | `#82adff` |
| teal | `#00897b` | `#4fd1c0` |
| violet | `#7c3aed` | `#b79cff` |
| orange | `#d9480f` | `#ff9b5e` |

A custom colour is used as given in both themes. Applied on every stabbur
page before first paint, so there is no flash of the wrong theme (tier 2:
how).

### D13 — Grammar explanation renders as HTML
- `grammar_rules.html` is displayed rendered.
- An "Edit HTML" toggle swaps in the raw source for editing.
- Scripts and event handlers must not execute (tier 2: sanitiser choice).
- The rule page shows title, explanation and "Used by N notes". There is no
  examples section, because the data model has none.

### D14 — Dropped from the editor
- The "raw stored record" view is dropped (operator decision).
- The in-panel add-language control is dropped (D7).
- The free-text audio-link box is dropped (D9).
- The translation merge-mode setting is dropped (D7).

### D15 — Fonts
- Schibsted Grotesk (headword), Inter (UI), Charis SIL (IPA), IBM Plex Mono
  (tags/counts).
- Self-hosting or Google Fonts is tier 2, provided the faces match and IPA
  renders.

## Risks / Trade-offs

- [Irreversible migration] → It runs once inside a single transaction. The
  checklist requires a fresh backup dump first, and gives row-count and
  sample queries to run before and after.
- [Read-API rename breaks an un-updated builder] → One rollout (D6). The
  builder change's acceptance criterion diffs card content before and after
  for migrated notes.
- [Clipboard API refused on some browsers] → An explicit error message, with
  Upload still available. The operator chose to drop the text box.
- [Rendering operator HTML] → Sanitise script and handlers (D13). It is
  single-operator content behind auth.
- [A 1:1 rebuild of a 4.4k-line UI] → The acceptance criteria are written
  against the mockup's observable states, so drift is caught at test time.

## Migration Plan

1. Take a fresh backup dump (daily job, or run it manually).
2. Deploy stabbur. The alembic migration runs (D5) behind D157's
   serve-before-migrate.
3. Verify:
   - no note has a translation text containing `" / "`
   - `examples` counts equal the old non-empty line counts (the checklist
     carries the queries)
4. Deploy the mjolnir builder (`projector-examples-column`), then run a
   forecast. No content diffs are expected for unchanged notes.

Rollback: restore the dump and redeploy the previous images of both
services.
