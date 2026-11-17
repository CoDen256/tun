# Tasks — stabbur-triage-queues

**This change builds after `smia/openspec/changes/dictcc-parsing-fixes`.**
Task 4.4 orders audio candidates on the `context` tag that change adds.

Order matters in two places inside this change:
- **5.1 before 5.2** — the archived D2 must be marked superseded before the
  assembling behaviour lands, so no interim state has the code and the spec
  disagreeing.
- **1.x before 2.x** — the filter vocabulary is shared, so the route's
  filters exist before either surface consumes them.

## 1. Filters on the authoring route

- [x] 1.1 Add `source_lang` and an updated-since parameter to
      `/api/notes/authoring`.
- [x] 1.2 Add three-state field-presence parameters for `audio_blob`,
      `transcription`, `inflections`, `context_text`, `translations`,
      `lemma`. `missing` matches SQL `NULL` **or** the column's empty value
      — `''`, `[]`, `{}`.
- [x] 1.3 Reject an unknown filter value with the route's existing 400
      shape rather than ignoring it.
- [x] 1.4 Tests per filter, including the `{}` and `[]` empty cases
      explicitly.

## 2. Paging

- [x] 2.1 Add `limit`/`offset` to `/api/notes/authoring`, with a bounded
      default page size and a 400 on an out-of-range value.
- [x] 2.2 Return rows and the matching total together. The total counts the
      filters, not the page.
- [x] 2.3 Leave `/api/notes` — the read API mjolnir pulls (D44) — entirely
      alone. Do not share a query builder between the two routes in a way
      that could ever change its behaviour.
- [x] 2.4 Notes table: `Status` and `Audio` become single indicators with
      accessible descriptions; `Text` takes the freed width.
- [x] 2.5 Pager: slice-of-total readout, page navigation, page-size choice.
      Changing any filter resets to the first page.
- [x] 2.6 Tests: page boundaries, partial last page, total independent of
      page size, read API unchanged.

## 3. Saved queues

- [x] 3.1 Add a queues list to the settings row: name, filters, sort.
- [x] 3.2 Three built-in queues (`import`/`manual`/`capture`, `draft`,
      oldest-updated first), not deletable and not editable. Migrate the
      stored origin preference to a queue selection.
- [x] 3.3 Settings API: create, rename, edit, delete, reorder the
      operator's own queues; reject any write touching a built-in.
- [x] 3.4 Triage page: the queue selector replaces the origin dropdown, with
      a per-queue remaining count.
- [x] 3.5 Queue editor: every filter dimension from task 1 plus the queue's
      own sort.
- [x] 3.6 Notes browser: "triage these results" opens the belt over the
      current filters as an unsaved queue, nameable and savable from there.
- [x] 3.7 The rail badge counts drafts across every queue, as it does today.
- [x] 3.8 Tests: a field-presence queue holds exactly the right notes; a
      queue's sort does not leak to another; built-ins reject edits.

## 4. Part-of-speech ordering

- [x] 4.1 Parse a leading bracketed tag out of a candidate's `context`.
      Only the bracketed form counts; everything else is untagged.
- [x] 4.2 Order candidates so the note's part of speech comes first; with
      no note part of speech or no match, leave the provider's order alone.
      **Never filter.**
- [x] 4.3 Group candidates under part-of-speech headings, the note's own
      first and identified as such; untagged last.
- [x] 4.4 Apply the same ordering to audio candidates, reading the `context`
      that `dictcc-parsing-fixes` adds to dict.cc `/tts` candidates.
- [x] 4.5 `walkProviders` takes the first candidate **after** ordering.
      Preserve the existing guarantee that `prefillTriagePos` runs before
      anything that orders on the part of speech.
- [x] 4.6 Tests: matching sense sorts first and the non-matching one is
      still present; untagged grouping; no-part-of-speech leaves order
      untouched.

## 5. Transcription assembling, additive use, hover variety

- [x] 5.1 Mark decision D2 of the archived `smia-ipa-multiword-response`
      superseded, **in place**, with the reason and a pointer here. Keep D3.
- [x] 5.2 When the service supplies no assembled value, assemble from each
      token's first candidate joined by a single space, in the service's
      token order. stabbur never re-tokenises.
- [x] 5.3 A token with no candidate leaves a visible gap marker.
- [x] 5.4 The provenance badge records that the value was assembled.
- [x] 5.5 Using a transcription candidate appends with a single space; an
      empty field is filled; the same candidate twice does not duplicate.
- [x] 5.6 The assembled-from-single-words row keeps replacing.
- [x] 5.7 `markSuggestUsed` accumulates instead of clearing its scope.
- [x] 5.8 Variety moves to a tooltip on the transcription; no visible text,
      no empty slot. Merged varieties show merged.

## 6. Audio search

- [x] 6.1 An endpoint (or an existing-route parameter) returning notes
      matching `q` that carry a recording, with enough to identify and play
      each one.
- [x] 6.2 A search control in the audio suggest panel with per-result
      playback.
- [x] 6.3 Choosing a result stores the same `sha256` on the note being
      edited. No new blob, no copy. Works on the new-note form (staged) and
      on an existing note (immediate), matching `attachAudioToNote`.
- [x] 6.4 Tests: both notes end up on one hash; the source note is
      unchanged; notes without audio are not offered.

## 7. Specs and docs

- [x] 7.1 Record in `stabbur/CLAUDE.md` that part of speech is an ordering
      signal only, with the operator's reasoning, so it is not "improved"
      into a filter.
- [x] 7.2 Record the asymmetry with `stabbur-merge-fixes`: merge's Take IPA
      replaces, the suggest panel's Use appends.

## Out of scope — do not implement

- [ ] 8.1 **No phone-portrait or responsive work.** It was designed in the
      same session and deliberately deferred by the operator to the root
      `BACKLOG.md`. The mockup's "Portrait" blocks are reference for that
      later item, not a requirement of this change.
