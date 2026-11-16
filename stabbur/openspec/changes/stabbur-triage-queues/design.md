# Design — stabbur-triage-queues

## D1 — Saved queues live in the settings row, and replace the dropdown

The operator chose settings storage over `localStorage`, and replacement of
the origin dropdown over sitting beside it.

Settings, because a queue is most useful on the phone and `localStorage`
does not travel. `operator-settings` is already a singleton row of operator
preferences (D1/D2 of that change) and a JSONB list of named queues is the
same kind of thing as `provider_prefs` — ordering and enablement, not
service configuration.

Replacement rather than coexistence, because two selectors answering the
same question ("which notes am I working through?") is the kind of
duplication that goes stale. `import` / `manual` / `capture` survive as
**built-in queues** — present in the selector, not deletable, not editable
— so nothing the operator relies on today disappears and the persisted
origin preference migrates to a queue selection.

Each queue carries its own sort. A sweep queue ("everything missing audio")
and a review queue ("the four ready notes with no IPA") want different
orders, and a global sort setting would make one of them wrong.

## D2 — Field presence is a first-class filter dimension

The backlog asked only for "missing audio". The operator generalised it in
session to any of audio, IPA, inflections, context, translations and lemma,
each as a three-state `any` / `missing` / `has`.

Three-state rather than a checkbox because the absent state has to be
distinguishable from the unset state: a queue that does not care about
audio is not the same as one that wants notes *with* audio.

"Missing" means SQL `NULL` **or** the column's empty value — an empty
string, `[]`, `{}`. A note whose `inflections` is `{}` is missing
inflections by any reading the operator would recognise, and treating it as
present would make the sweep queue silently skip exactly the notes it
exists to find. (This is the same empty-versus-null distinction that bit
mjolnir's projector; see the related backlog item.)

Two further dimensions were added beyond the operator's list, both free
from columns that already exist: `source_lang`, and an **updated-since**
window. Neither invents data.

## D3 — Two entry points, one filter vocabulary

Filters live on the Triage page (as the queue being edited) **and** the
notes browser gains "triage these results". The operator asked for both.

They are not two implementations. The notes browser's existing filter
controls and the queue editor produce the same filter object, and "triage
these results" opens the belt over an **unsaved** queue — the operator can
then name and save it, or not. A queue is therefore just a filter set that
was given a name.

## D4 — Paging is server-side, and the read API is untouched

`/api/notes/authoring` gains `limit` and `offset` and returns the total
alongside the rows. The response stays small whatever the note count,
which is what makes the list usable on a phone later.

The route's response shape changes from a bare array to an object carrying
rows and a total. This is an operator-only route (D-S1) with exactly one
consumer — stabbur's own UI. `/api/notes`, the route mjolnir pulls from
(D44), is a **different function with a different query path** and is not
touched: no paging, no new filter, no shape change. The separation already
exists in the code and this change preserves it deliberately.

Status and Audio become single glyphs with `title` tooltips. They are
boolean-ish values under wide headers, and the width belongs to `Text`.

## D5 — Part of speech orders; it never filters

This is the single most important decision in the change, and the one most
likely to be got wrong at build time.

The operator's own diagnosis: *"the desired PoS was already correctly in
the translations, but didn't get picked because it wasn't first. And in
audio it was missing completely."* He explicitly rejected filtering.

So: every candidate the provider returned is still shown. Those whose part
of speech matches the note's sort first, which makes `candidates[0]` — the
one automatic prefill takes — the right one. Display groups them under
part-of-speech headings with the note's own group first and labelled as
such.

Fallback, chosen explicitly: **when the note has no part of speech, or no
candidate matches it, the provider's order is left untouched.** No fixed
noun-verb-adjective priority, no marker. An ordering with nothing to order
on must not invent a preference.

The ordering runs client-side on data smia already returns. No request
parameter is added to any smia endpoint.

### Where the part of speech comes from

The operator chose to **parse the existing `context` string** rather than
add a structured `pos` key to `/translations` candidates. `dictcc_api`
emits `[verb] å komme i vei` — a leading bracketed tag.

`dictcc_static` does not bracket: its context is `noun Br.`, built from the
dataset's own `pos` and `tags` columns. The operator chose to recognise
**only** the bracketed form and group everything else as **untagged**,
shown last, rather than add a word list or change smia. Untagged candidates
are never hidden and never reordered among themselves.

For **audio** there is no such string today, which is why
`dictcc-parsing-fixes` adds `context` to dict.cc `/tts` candidates using
the same bracketed convention. One parse rule serves both kinds.

Note the ordering dependency inside the prefill walk: `prefillTriagePos`
already runs before translations, inflections and audio, so the note's part
of speech is known by the time anything needs to order on it. That ordering
must be preserved.

## D6 — IPA Use appends with a space, and marks accumulate

The operator corrected the obvious choice here: not `" / "` (the separator
translations and smia's merged varieties use) but a **space**, because the
case he has is assembling one transcription of a multiword expression out
of its tokens. `" / "` would mean "these are alternatives"; a space means
"these are consecutive".

An empty field is simply filled. Using the same candidate twice does not
duplicate it.

`markSuggestUsed` currently un-marks every other used control in scope.
With an additive field that makes the ticks lie about what the field
contains, so marks now **accumulate** — and the operator chose to make that
true everywhere, translations included, rather than special-case IPA.

The "assembled from single words" row keeps replacing rather than
appending: it is a complete transcription of the whole phrase, not one more
token.

## D7 — Prefill assembles, superseding D2 of `smia-ipa-multiword-response`

smia omits `joined` whenever any token has zero or more than one candidate.
In practice most Norwegian multiword phrases trip that, so prefill leaves
transcription empty far more often than the operator expects.

The operator was shown the archived decision — "if stabbur joined the
tokens anyway it would be inventing the very answer smia declined to
invent" — and reversed it, choosing the stabbur-side join over relaxing
smia's rule for every caller.

The reversal is bounded by three things:

1. The assembled value uses each token's **first** candidate, in smia's
   token order. stabbur never re-tokenises; smia's tokenizer stays
   authoritative.
2. A token with **zero** candidates leaves a visible gap marker in the
   assembled string rather than being silently dropped. An assembled
   transcription with a hole in it must look like one.
3. The prefilled field is **flagged as assembled** in its provenance
   badge, keeping D3 of that change — an assembled string is never
   presented as a real phrase lookup — and extending it to prefill.

## D8 — Variety is hover-only

The operator was offered showing the provider when variety is absent, a
pill, or removal, and chose none of them: variety should be reachable on
**hover over the transcription itself** and never rendered as visible text.

The blank-slot problem disappears because there is no slot. The information
is still there for the one moment it matters — deciding between two
candidates — without a column that is empty for the providers at the top of
his order. Where `routes/ipa.py` merged several varieties under one IPA,
the tooltip shows the merged string.

## D9 — Audio search searches notes, not blobs

The operator chose searching his own notes over browsing the blob store.
The reason is structural: a blob has no text of its own. It is findable
only through the notes that reference it, so a blob browser would be a
notes search wearing a different hat — with the extra failure mode of
surfacing orphaned blobs that mean nothing.

The search reuses the authoring route's existing `q` (text, lemma,
translations) restricted to notes that have audio, and lives **in the audio
suggest panel**, where the operator already is when a note needs a
recording.

Attaching stores the same `sha256` on the second note. Blobs are
content-addressed and immutable (`blob-storage`), so two notes referencing
one recording is already a supported state, not a new one. No copy, no
reference counting, and deleting one note must not delete the blob — which
is already true, since nothing deletes blobs.
