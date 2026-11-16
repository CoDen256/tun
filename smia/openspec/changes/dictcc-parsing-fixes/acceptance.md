# Acceptance criteria — dictcc-parsing-fixes

The review contract for the build phase. Every criterion is an observable
end state, confirmed against the running service in dev compose (`cd smia
&& docker compose up`, which publishes its port) or against a real HTTP
response, never by reading code or trusting a log line. An agent that did
not write the code verifies these.

Dev setup assumed: smia up with the dict.cc providers enabled and outbound
network reachable — every criterion below queries the real dict.cc backend,
because the whole class of defect here is "our parser and the real payload
disagree".

---

## Item — the `do` inflection bug

1. `GET /inflections?word=do&lang=nb` with `dictcc_api` returns exactly one
   `substantiv` candidate whose `paradigm.article` is `en/et`.
2. That candidate's `paradigm.sg_indef` is exactly `do`. The string
   `/ et do` appears nowhere in the response.
3. That candidate's `sg_def`, `pl_indef` and `pl_def` are `doen / doet`,
   `doer / do` and `doene / doa` — each carrying both alternatives.
4. `GET /inflections?word=kalv&lang=nb` returns a candidate whose
   `paradigm.article` is `en` and whose `sg_indef` is `kalv` — a
   single-gender noun is unchanged by the fix.
5. `GET /inflections?word=Haus&lang=de` returns a candidate whose
   `sg_indef` is `Haus` and `pl_indef` is `Häuser`, with `article` set to
   `das` — the German 2-slot path is unchanged.

## Item — dict.cc audio for every entry

6. For a Norwegian word with dict.cc entries of more than one part of
   speech, `GET /tts?text=<word>&lang=nb` with `dictcc_api` returns **more
   than one** candidate, and the number of distinct `sha256` values is
   greater than it was before the change for the same word.
7. Every candidate in that response carries a `context` string whose first
   characters are a bracketed tag (for example `[noun]`).
8. Playing two candidates with different `context` values through
   `GET /audio/<sha256>` yields two audibly different recordings — i.e. the
   `sha256` values differ, not merely the labels.
9. A `/tts` response from a non-dict.cc provider (`pygmalion`) returns
   candidates with **no** `context` key, and is otherwise byte-for-byte the
   same shape as before the change.
10. `GET /tts?text=<word>&lang=nb&pos=substantiv` is **not** a supported
    filter: the `pos` parameter is ignored and the full candidate set is
    returned. No candidate is ever withheld on the basis of part of speech.

## Item — filmot phrase quoting

11. The filmot `/tts` candidate for the Norwegian query `fastsatt av`
    carries a URL whose path segment contains `%22` at both ends of the
    encoded phrase.
12. Opening that URL in a browser lands on a filmot results page for the
    quoted phrase, not an error page.
13. The filmot candidate for the single word `hus` carries a URL with no
    quote characters, identical to the pre-change URL.

## Regression

14. `pytest` passes in `smia/` with no test skipped or deleted that was
    passing before the change, other than the two filmot URL expectations
    this change deliberately updates.
15. `GET /translations?text=do&from=nb&to=en` returns the same candidate
    grouping as before the change — entries sharing a sense still joined
    with `/`, context still carrying the bracketed tag. This change does
    not touch translation grouping.
