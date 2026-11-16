# Acceptance criteria — stabbur-triage-queues

The review contract for the build phase. Every criterion is an observable
end state, confirmed by driving the running UI in dev compose with
claude-in-chrome, or by reading the resulting row in stabbur's database —
never by reading code or trusting a log line. An agent that did not write
the code verifies these.

Dev setup assumed: `cd stabbur && docker compose up` (which publishes its
port) with smia reachable and `dictcc-parsing-fixes` already deployed —
criteria 26–31 read the `context` tag it adds. Enough notes to page
(60+ is sufficient), and among them: notes with and without audio, with and
without IPA, at least one whose `inflections` is `{}` and one whose
`inflections` is `null`, notes of more than one part of speech, and at
least one multiword expression whose tokens have differing IPA candidate
counts.

---

## Item — saved queues

1. The Triage page shows a queue selector, and the old origin dropdown is
   gone from the page entirely.
2. The selector lists the three built-in queues (`import`, `manual`,
   `capture`), each with a remaining count, and none of them offers a
   delete control.
3. Selecting the `import` built-in queue produces exactly the belt the
   origin dropdown produced before this change: `draft` notes of origin
   `import`, oldest updated first, same count.
4. Creating a queue named `Missing audio` whose only filter is
   `audio: missing` and selecting it yields a belt in which **every** note
   has no audio, and whose count equals the number of such notes in the
   database.
5. No note carrying audio appears in that queue's belt.
6. A queue filtering `inflections: missing` includes a note whose
   `inflections` is `{}`, and excludes one with a populated paradigm.
   (`inflections` is `NOT NULL` in the schema, so `{}` is the only empty
   state that can exist — see DECISIONS-MADE.md. The filter must still
   treat SQL `NULL` as missing, for the nullable columns below.)
7. A queue filtering `translations: missing` includes a note whose
   `translations` is `[]`, and excludes one with a translation.
   (`translations` is likewise `NOT NULL`.)
7a. A queue filtering `transcription: missing` includes notes whose
   `transcription` is SQL `NULL` **and** notes whose `transcription` is the
   empty string `''` — this column is nullable, so both states are real.
7b. A queue filtering `lemma: has` excludes a note whose `lemma` is `NULL`
   and excludes one whose `lemma` is `''`.
8. Two saved queues with different sorts, selected in turn, present their
   notes in their own orders; selecting one and returning to the other
   leaves the second one's order unchanged.
9. Renaming a queue and reloading the page shows the new name.
10. Deleting an operator-created queue removes it from the selector and
    leaves the built-ins present.
11. An attempt to edit or delete a built-in queue is rejected by the API
    with an error, not silently ignored.
12. Queues survive a browser data wipe: clear `localStorage`, reload, and
    the operator's own queues are still listed — they are stored server
    side.
13. The rail's draft badge counts drafts across every origin, as before —
    it is not scoped to the selected queue.

## Item — triaging a filtered result set

14. The Notes page offers an action that opens the triage belt over the
    currently filtered results. With the browser filtered to `draft` notes
    of type `word`, the belt afterwards holds exactly those notes.
15. That belt can be named and saved as a queue from where it opened, and
    the new queue then appears in the Triage selector.

## Item — notes list paging and compact columns

16. `GET /api/notes/authoring?limit=20&offset=40` returns 20 rows **and** a
    total of all notes matching the filters, not 20.
17. The Notes page shows a readout naming the displayed slice and the total
    (for example rows 41–60 of 312), and the numbers agree with the
    database.
18. Requesting the last page of a result set that does not divide evenly
    returns only the remaining rows, and the readout ends at the total.
19. Changing any filter returns the view to the first page, with a total
    recomputed for the new filters.
20. Changing the page size re-pages the same result set and leaves the
    total unchanged.
21. Each row's status and audio presence are single indicators carrying an
    accessible description reachable by hovering or by a screen reader.
22. At a 1280px-wide viewport the notes table does not scroll horizontally
    and the note text column is not truncated to fewer characters than
    before this change.
23. `GET /api/notes?source_lang=no&status=ready` — the read API mjolnir
    pulls — returns a bare array of every matching note, with no paging,
    no total wrapper, and a response byte-identical in shape to before
    this change.
24. Passing `limit` or a field-presence parameter to `/api/notes` has no
    effect on its output.

## Item — part of speech orders, never filters

25. For a note whose part of speech is `substantiv`, querying a translation
    provider that returns a verb sense before a noun sense shows the noun
    candidate **above** the verb candidate.
26. In that same panel the verb candidate is **still present**, under its
    own group heading. No candidate count is lower than the provider
    returned.
27. The group containing the note's own part of speech is visibly
    identified as such, and appears first.
28. Candidates from `dictcc_static`, whose context carries no bracketed
    tag, appear under an untagged group shown **after** the tagged groups,
    and none of them is hidden.
29. Running automatic prefill on that `substantiv` note fills the
    translation field with the **noun** sense, not the verb sense.
30. For the same note, the audio panel shows the `[noun]`-tagged recording
    above the `[verb]`-tagged one, and automatic prefill attaches the noun
    recording.
31. A note with **no** part of speech set shows candidates in exactly the
    order the provider returned them — compare against the raw smia
    response for the same query.
32. No request stabbur sends to smia carries a part-of-speech parameter —
    confirmed by reading the outbound request in stabbur's enrichment proxy
    or smia's access log.

## Item — additive IPA, assembling, hover variety

33. With the transcription field empty, using one IPA candidate fills it
    with that value.
34. Using a second IPA candidate leaves the field holding both values
    separated by a single space — not `" / "`, and not replaced.
35. After criterion 34, **both** candidates show a used mark; neither has
    been cleared.
36. Using the same candidate a second time does not duplicate its value in
    the field.
37. Using the "assembled from single words" row **replaces** the whole
    field with that row's value.
38. For a multiword expression where one token has two IPA candidates — so
    smia supplies no `joined` value — automatic prefill leaves the
    transcription field **non-empty**, holding each token's first candidate
    joined by single spaces.
39. The provenance badge on that prefilled transcription indicates the
    value was assembled, distinguishably from a real phrase lookup.
40. For an expression where one token has **no** candidate at all, the
    assembled value shows a visible gap marker in that token's position
    rather than silently joining the remaining tokens.
41. Hovering a transcription candidate reveals its variety; the variety
    appears nowhere else in the row.
42. A candidate from a provider supplying no variety (`ipadict`) shows no
    variety indicator and leaves no blank gap in its row.
43. A candidate whose varieties were merged by smia shows the merged
    variety string on hover.

## Item — audio search and reuse

44. The audio suggest panel offers a search over the operator's own notes.
    Searching a term matching a note that carries a recording lists that
    note; searching a term matching only notes without recordings lists
    nothing.
45. Each result can be played before it is chosen.
46. Choosing a result sets the editing note's `audio_blob` to **the same**
    `sha256` the source note carries — confirmed by reading both rows.
47. The source note is otherwise unchanged by the attach: same
    `audio_blob`, same `updated_at`.
48. No new blob file is created on disk by the attach — the blob count in
    stabbur's blob storage is unchanged before and after.
49. The attach works from the new-note form (staged until the note is
    created) as well as from an existing note (applied immediately).

## Regression

50. `pytest` passes in `stabbur/` with no previously-passing test skipped
    or deleted.
51. `status` remains `draft`/`ready` only — no third value exists in the
    schema, the API or the UI (D74).
52. No Mjølnir concept appears anywhere in this change: no deck, no card
    id, no occurrence, no card type (D43).
53. `bin/check-standards.sh` passes.
54. Nothing outside `stabbur/`, the superseded-decision annotation in
    `stabbur/openspec/changes/archive/2026-11-08-smia-ipa-multiword-response/`,
    and this change folder is modified.
55. **No responsive or phone-portrait CSS is added.** Portrait was
    deliberately deferred to the root `BACKLOG.md`; a diff containing
    portrait layout work fails this criterion even if it works.
