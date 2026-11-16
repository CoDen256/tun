# Design — dictcc-parsing-fixes

## D1 — One candidate per inflection table, slashes preserved

Rejected: emitting one candidate per gender. The data invites it — in the
`do` table the alternatives align positionally, so `(en do, doen, doer,
doene)` and `(et do, doet, do, doa)` can be read straight off. The operator
rejected it anyway, and the reason holds up: the alignment is not
guaranteed by anything dict.cc documents, a slot can carry two alternatives
of the *same* gender, and a splitter that is right most of the time
produces a confidently wrong paradigm the rest of the time — the same
silent-plausible failure this change exists to remove.

So: `article` holds every article form dict.cc gave, joined as dict.cc
joined them. Each inflected slot holds its own text verbatim. The operator
edits down what he does not want, with both forms visible.

The implementation consequence is narrow: the article is no longer "the
first whitespace-delimited token". It is **the leading run of article words
and their separators** — the portion of the segment before the inflected
form begins. A segment whose article cannot be identified keeps the whole
segment in the inflected slot and sets no `article`, which is a visible
gap rather than a wrong value.

## D2 — `context` on `/tts`, not a `pos` key, and not a request parameter

Three options were on the table for getting the part of speech to the
audio candidates. The operator chose the `context` field.

- Rejected: a structured `pos` key on candidates. It is the cleaner data
  shape, but the operator had already chosen, for `/translations`, to parse
  the existing `context` string rather than add a field — adding one here
  only would leave the two kinds inconsistent for no gain.
- Rejected: a `pos` request parameter with smia doing the ordering. That
  puts the ordering rule in smia, which does not know the note, and it is a
  new API surface for a client-side sort.
- Chosen: `/tts` candidates from `dictcc_api` carry `context` with the same
  bracketed convention `/translations` uses. One parse rule in stabbur
  covers both kinds.

`context` is optional on a `/tts` candidate. Providers other than
`dictcc_api` do not set it, and a consumer that does not understand it
ignores it — this is additive to `tts-api`, not a reshape.

## D3 — Walking every entry, bounded by what dict.cc returns

The operator chose "fetch audio for every distinct entry" over "stop at the
first entry that has audio". The cost is one audio request per entry
instead of one per word. Two things keep that acceptable: `audio_cache`
already content-addresses the result so byte-identical recordings collapse,
and the entry list for a single lemma is short.

Distinctness is per **entry id**, not per entry_type — several entries can
share a type and still be different senses with different recordings. The
synthetic-voice candidate keeps its existing behaviour and is requested
once per entry alongside the human one.

An entry whose audio request fails is skipped, not fatal. The existing rule
stands: the lookup only raises when *every* combination errored.

## D4 — filmot quoting is a phrase rule, not a formatting rule

A single-word query is left alone because quoting it changes nothing about
what filmot matches while making the visible URL noisier. Two or more
whitespace-separated tokens are wrapped in `"` before percent-encoding, so
the encoded form carries `%22…%22` as in the operator's example.

`hideDeleted=1` is deliberately **not** added. It appeared in the URL the
operator pasted, and he confirmed in session it was incidental to that
paste rather than part of the ask.
