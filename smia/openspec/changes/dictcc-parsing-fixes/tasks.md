# Tasks — dictcc-parsing-fixes

No ordering constraint inside this change. The change as a whole lands
before `stabbur-triage-queues`, which reads the `context` added in task 2.

## 1. The article splitter

- [ ] 1.1 Replace `seg.split(maxsplit=1)` in `_parse_inflection_blocks`
      with a split that lifts **every** leading article form, including
      alternatives separated by `/`, into `article`.
- [ ] 1.2 When no article run can be identified, leave the whole segment in
      the inflected slot and set no `article`. Never emit a partial split.
- [ ] 1.3 Leave the German 2-slot path's behaviour intact — each German
      slot carries its own article word, and only the first slot's is kept
      as canonical (the existing comment explains why; keep it).
- [ ] 1.4 Tests: the real `do` table verbatim as a fixture, a single-gender
      Norwegian noun, and the German `Haus` table — asserting the last two
      are byte-identical to today's output.

## 2. Per-entry dict.cc audio

- [ ] 2.1 In `DictccApiTtsAdapter.lookup`, iterate every entry in
      `translations` by entry id instead of reading `translations[0]`.
- [ ] 2.2 Request the human recording, and the synthetic voice where one is
      configured for the language, per entry.
- [ ] 2.3 Keep the content-hash dedupe (`seen_sha`) so identical bytes
      reached through different entries collapse.
- [ ] 2.4 Keep the existing failure rule: skip a failing entry, raise only
      when every attempt failed.
- [ ] 2.5 Set `context` on each candidate from the entry's `entry_type` and
      source phrase, using the `[type] phrase` convention the translate
      adapter already builds.
- [ ] 2.6 Tests: a word whose first entry has no recording still returns
      audio; candidates carry their `context`; identical bytes dedupe.

## 3. filmot phrase quoting

- [ ] 3.1 `_filmot_url` wraps a query of two or more whitespace-separated
      tokens in `"` before `quote_plus`. Single words unchanged.
- [ ] 3.2 Update `test_filmot_url_joins_multi_word_query_with_plus` to the
      quoted expectation, and keep the single-word test asserting the URL
      is unchanged.

## 4. Specs and docs

- [ ] 4.1 Record in `smia/CLAUDE.md` or the adapter docstring that dict.cc
      `/tts` candidates now carry `context`, and that part of speech is an
      ordering signal owned by the caller — smia never filters on it.
