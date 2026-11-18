# stabbur-triage-queues

Batch `full-sweep`, package **Stabbur merging & dict.cc translations**
(D161 workflow, `docs/15-agentic-workflow.md`). Six backlog items that all
land in the same two surfaces — the triage/notes browsing path and the
enrichment suggest panel.

**Depends on `smia/openspec/changes/dictcc-parsing-fixes`**, which must
build first: ordering audio candidates by part of speech reads the
`context` tag that change adds to dict.cc `/tts` candidates.

Backlog items, verbatim:

> [ux] triage should be possible to do for any filter (only those missing
> audio, only those matching some query text, only those having PoS this
> and status this)

> [ux] notes list going out of bounds, make status and audio much smaller.
> Make pagination.

> [ux] search by text in audio of stabbur to attach to a different note.

> [ux] ipa should be additive when i say "use"

> [ux] stabbur ignore variety field do something, can't se anything there

> [REHAUL] rethink dictcc parsing and stabbur displaying of translations.
> also dict_cc audios not everyone is present and stabbur when asking
> dict_cc should filter by PoS, because he picks the wrong PoS sometimes

## Why

### Triage can only ever cover one origin

`loadTriageQueue` builds its queue from `status=draft` plus one `origin`.
That is the only axis. "Everything missing audio", "the verbs with no
inflections", "the four ready notes with no IPA" are all unreachable, even
though the authoring route already filters on most of what is needed.

### The notes list returns everything and overflows

`/api/notes/authoring` has no `limit` and no `offset`; it returns every
matching row and the table renders all of them. Seven columns, two of
which (`Status`, `Audio`) are wide headers over one-word values, push the
table past its container.

### Automatic prefill picks the wrong sense

The operator's diagnosis, confirmed in session and more precise than the
backlog text: *the right candidate was already in the response, it just was
not first.* `walkProviders` returns `body.candidates[0]`, and dict.cc's own
order has no idea which part of speech the note is. So a `substantiv` note
gets the verb's translation — and, worse, the verb's recording, or none at
all. **The fix is ordering, not filtering.** Nothing is withheld.

### Using an IPA suggestion overwrites instead of assembling

`renderIpaCandidate`'s Use does `field.value = value`. For a multiword
expression the operator is assembling a transcription token by token, and
each Use destroys the previous one.

Compounding it: smia emits its `joined` whole-phrase string **only when
every token has exactly one candidate** (`smia/routes/ipa.py:152`). One
token with two dialect varieties, or none, and `joined` disappears,
`walkProviders` hits `continue`, and prefill leaves transcription empty.

### The variety slot renders as nothing

`renderIpaCandidate` prints `c.variety || ''`. `nst`, `kaikki_ipa` and
`leipzig` do populate it; `ipadict` and the dict.cc providers do not. With
those at the top of the operator's order the slot is permanently blank —
an empty column that reads as broken.

### A recording cannot be reused on another note

Audio reaches a note from a provider or a manual upload. A recording
already stored for one note cannot be found and attached to another, even
though blobs are content-addressed and sharing one costs nothing.

## What changes

- **Saved queues replace the origin dropdown.** A queue is a named filter
  set plus its own sort, stored in the settings row so it reaches any
  device. `import` / `manual` / `capture` ship as undeletable built-ins.
- **Filter dimensions:** status, type, origin, part of speech, source
  language, an updated-since window, text search, and **field presence**
  (`any` / `missing` / `has`) over audio, IPA, inflections, context,
  translations and lemma.
- **A second entry point:** the notes browser gains "triage these results",
  opening the belt over exactly the list currently shown.
- **Server-side paging with a total** on the authoring route, and `Status`
  / `Audio` collapsed to single glyphs with tooltips.
- **Candidates are ordered by the note's part of speech**, for both
  translations and audio, and **grouped** under part-of-speech headings
  with the note's own first. Nothing is hidden. With no part of speech on
  the note, or no candidate matching it, the provider's order is untouched.
- **IPA Use appends with a space.** Used-marks accumulate rather than
  cancelling each other.
- **Prefill assembles a multiword transcription** from each token's first
  candidate when smia declines to, flagged as assembled.
- **Variety moves to a hover tooltip** on the transcription and is never
  rendered as visible text.
- **Audio search**: find your own notes by text, lemma or translation, play
  their recordings, and attach one to the note being edited.

## What does NOT change

- **No part-of-speech filtering, and no new smia request parameter.**
  Ordering only.
- The `/api/notes` read API mjolnir pulls from (D44) is a different route
  and is untouched — no paging, no new filter, no shape change.
- `status` stays `draft`/`ready` (D74). A saved queue filters on it; it
  never adds a state.
- Attaching an existing recording stores the same `sha256`. Blobs are
  content-addressed and immutable; nothing is copied.
- No Mjølnir concept enters stabbur (D43).

## Conflict with a settled decision, surfaced

Assembling a transcription when smia omits `joined` **reverses D2 of the
archived change `smia-ipa-multiword-response`**, which states that stabbur
offers no whole-phrase fill in that case and calls it "the one place where
doing less is the requirement rather than a simplification."

The operator was shown that decision and its reasoning in session and
reversed it deliberately. Per D161, operator feedback outranks a spec, and
the reversal is recorded here and in that spec so a build agent cannot
restore the old behaviour as a bug fix. D3 of that change — that an
assembled string is never presented as a real phrase lookup — is kept and
extended to the prefilled value.

## Phone portrait is NOT in this change

Portrait layouts were designed in the same session and then deliberately
deferred by the operator. What was settled is recorded in the root
`BACKLOG.md`; the mockup's "Portrait" blocks show the intended treatment.
No responsive work is in scope here.
