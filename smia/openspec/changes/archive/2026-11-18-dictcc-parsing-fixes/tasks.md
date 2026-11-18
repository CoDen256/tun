# Tasks — dictcc-parsing-fixes

No ordering constraint inside this change. The change as a whole lands
before `stabbur-triage-queues`, which reads the `context` added in task 2.

## 1. The article splitter

- [x] 1.1 Replace `seg.split(maxsplit=1)` in `_parse_inflection_blocks`
      with a split that lifts **every** leading article form, including
      alternatives separated by `/`, into `article`.
- [x] 1.2 When no article run can be identified, leave the whole segment in
      the inflected slot and set no `article`. Never emit a partial split.
- [x] 1.3 Leave the German 2-slot path's behaviour intact — each German
      slot carries its own article word, and only the first slot's is kept
      as canonical (the existing comment explains why; keep it).
- [x] 1.4 Tests: the real `do` table verbatim as a fixture, a single-gender
      Norwegian noun, and the German `Haus` table — asserting the last two
      are byte-identical to today's output.

## 2. Per-entry dict.cc audio — HUMAN ONLY

Reworked 2026-11-16 after the operator supplied the recordings endpoint and
his worked `stille` example. `smia/providers/dict/api.md` documents the
request/response shape, the `lid` language ids and the evidence that `lid`
is the language rather than the user — read it before touching this.

- [x] 2.0 `_LANG_SELF_LOOKUP_PAIRS["nb"]`: `("ENNO", 1)` -> `("ENNO", 2)`.
      Norwegian is the SECOND language of both `DENO` and `ENNO`; `dir=1`
      asks for "stille as an English word" and returns 0 entries, hiding
      that pair's whole dataset (audio AND inflections).
- [x] 2.7 `_fetch_recording_lids(lp, ids)`: ONE batched call to
      `https://<lp>.dict.cc/dict/ajax_get_audiorecordings.php` per
      `(lp, variant)`, parsing the space-aligned tokens into
      `{entry_id: {lid, ...}}`. Refuse to align a response whose token
      count does not match the request rather than zipping it short.
- [x] 2.8 Emit a candidate only for an entry carrying a recording whose
      `lid` matches the requested language. Skip the rest WITHOUT fetching
      — `*_rec_ip` synthesises, so fetching would produce a synthetic clip
      labelled "human".
- [x] 2.9 Stop requesting the synthetic voice entirely; delete
      `_VOICE_FOR_LANG`. Dedicated synthesisers (elevenlabs) are untouched.
- [x] 2.10 `/tts` context names what the recording actually READS: the
      dict.cc source phrase verbatim, infinitive marker included
      (`[verb] å stille krav`). `_entry_context` gained a `verbatim` flag
      used only by the tts call site — `/translations` keeps its
      established stripped convention (`[verb] stille krav`), which a test
      now pins from both sides.
- [x] 2.11 Tests for acceptance criteria 6-16, against a `stille` fixture
      captured verbatim from the real backend (entries AND raw
      `ajax_get_audiorecordings.php` tokens, both pairs): every candidate
      human with no `voice` anywhere; a German-only entry (2240021) yields
      no candidate and is never fetched; the EN<->NO-only recordings
      (2016116, 1149015) are returned; one recordings call per
      `(lp, variant)`; a misaligned response raises; context names the
      phrase read plus its PoS tag; two different recordings of one phrase
      both survive; `lid` matched as a language, not a user.

## 2b. Original per-entry work (superseded in part by 2.0/2.7-2.9)

- [x] 2.1 In `DictccApiTtsAdapter.lookup`, iterate every entry in
      `translations` by entry id instead of reading `translations[0]`.
- [x] 2.2 Request the human recording, and the synthetic voice where one is
      configured for the language, per entry.
- [x] 2.3 Keep the content-hash dedupe (`seen_sha`) so identical bytes
      reached through different entries collapse.
- [x] 2.4 Keep the existing failure rule: skip a failing entry, raise only
      when every attempt failed.
- [x] 2.5 Set `context` on each candidate from the entry's `entry_type` and
      source phrase, using the `[type] phrase` convention the translate
      adapter already builds.
- [x] 2.6 Tests: a word whose first entry has no recording still returns
      audio; candidates carry their `context`; identical bytes dedupe.

## 3. filmot phrase quoting

- [x] 3.1 `_filmot_url` wraps a query of two or more whitespace-separated
      tokens in `"` before `quote_plus`. Single words unchanged.
- [x] 3.2 Update `test_filmot_url_joins_multi_word_query_with_plus` to the
      quoted expectation, and keep the single-word test asserting the URL
      is unchanged.

## 4. Specs and docs

- [x] 4.1 Record in `smia/CLAUDE.md` or the adapter docstring that dict.cc
      `/tts` candidates now carry `context`, and that part of speech is an
      ordering signal owned by the caller — smia never filters on it.
