# dictcc-parsing-fixes

Batch `full-sweep`, package **Stabbur merging & dict.cc translations**
(D161 workflow, `docs/15-agentic-workflow.md`). The smia half of the
package: three defects in the `dictcc_api` adapter plus one URL fix in
`manual_link`. **This change builds first** — `stabbur-triage-queues`
orders audio candidates by part of speech, and the tag it orders on is
added here.

Backlog items this change serves, verbatim:

> [bug] smia dict_cc can't parse "do"  (en/et do | doen/doet | doer/do | doene/doa)

> [REHAUL] rethink dictcc parsing and stabbur displaying of translations.
> also dict_cc audios not everyone is present and stabbur when asking
> dict_cc should filter by PoS, because he picks the wrong PoS sometimes

> [UX] smia filmot link for multiword should search them in a quotes:
> https://filmot.com/search/%22fastsatt%20av%22/1?lang=no&hideDeleted=1&gridView=1&

## Why

### 1. The article splitter assumes one token

Confirmed live against the real API during design (not inferred from the
bug report). `app_translations.php?s=do&dir=2&lp=ENNO` returns:

```
title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl"
cell:   en / et do | doen / doet | doer / do | doene / doa
```

`_parse_inflection_blocks` handles the pipes correctly and produces four
segments against four labels. It then fails on the **article slot alone**:

```python
tokens = seg.split(maxsplit=1)      # "en / et do" -> ["en", "/ et do"]
paradigm["article"] = tokens[0]     # "en"
paradigm[key] = tokens[1]           # "/ et do"      <- garbage
```

`do` is a **two-gender noun** — `en do` *and* `et do` — and dict.cc writes
both genders into the article slot separated by `/`. Nothing about the word
`do` is special: every two-gender Norwegian noun breaks identically, and
the failure is silent, producing a plausible-looking paradigm whose
singular indefinite is the string `/ et do`.

### 2. dict.cc audio is only ever fetched for the first entry

`DictccApiTtsAdapter.lookup` reads `translations[0]["id"]` and asks for
that one entry's recording. A word whose first returned entry carries no
human recording yields no audio at all, even when a later entry — often
the sense the operator actually meant — has one. This is the operator's
"dict_cc audios not everyone is present", and it is a hard gap, not a
ranking problem.

### 3. Nothing tells a caller which sense an audio candidate belongs to

`/translations` candidates carry the dict.cc `entry_type` inside their
`context` string (`[verb] å komme i vei`). `/tts` candidates carry
`{sha256, source, voice}` and nothing else. stabbur therefore cannot order
audio candidates by the note's part of speech the way it can order
translations — which is exactly the half of the operator's complaint that
reads "and in audio it was missing completely".

### 4. filmot phrase search

`_filmot_url` percent-encodes the query but does not quote it, so a
multiword lookup searches for the words rather than the phrase.

## What changes

- **The article slot keeps every gender.** `article` becomes `en/et`; the
  noun form is whatever remains. One candidate, slashes preserved in every
  slot, matching dict.cc's own notation. The operator explicitly rejected
  splitting a two-gender table into two candidates.
- **Every distinct dict.cc entry is asked for audio**, not just the first.
  Candidates dedupe on content hash, as today.
- **dict.cc `/tts` candidates gain a `context` field** carrying the same
  bracketed tag `/translations` already emits (`[noun]`, `[verb]`), plus
  the matched source phrase. Other `/tts` providers are unaffected and
  carry none.
- **filmot wraps multiword queries in literal quotes.** Single words are
  left unquoted and the query parameters are otherwise unchanged — the
  operator chose this over also adding `hideDeleted=1`, which was
  incidental to the URL he happened to copy.

## What does NOT change

- **No part-of-speech filtering anywhere, and no new request parameter.**
  The operator was explicit: PoS is an **ordering** signal, never a filter.
  Nothing dict.cc returns is ever withheld. The ordering itself is
  stabbur's, done client-side on data smia already returns — see
  `stabbur-triage-queues`.
- No change to `/translations` candidate grouping. Entries sharing a sense
  stay joined into one candidate with `/`.
- No new provider, no adapter removed, no change to the registry.
- Nothing in the device plane (`docs/11-ota-contract.md`) is reachable from
  this service at all.
