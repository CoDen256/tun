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

## Item — dict.cc audio: human only, every entry, both pairs

Verified against the real dict.cc backend. The operator's own worked
example is `stille`, whose expected result he enumerated by hand.

6. `GET /tts?text=stille&lang=nb` with `dictcc_api` returns **more than 15**
   candidates (before the change it returned 2 — the first entry's human and
   synthetic).
7. **Every** candidate has `source: "human"`. No candidate has
   `source: "synthetic"`, and none carries a `voice` key. The synthetic voice
   is never requested at all — confirmed by reading the outbound requests:
   no request carries a `voice=` parameter.
8. Every candidate carries a `context` naming the phrase that recording
   reads, with its bracketed part-of-speech tag where dict.cc has one — e.g.
   a candidate for `[verb] å stille krav` and one for `[adj] stille`.
9. **The entries the operator named as having no human Norwegian audio
   produce no candidate**, while still appearing in `/translations`:
   - `å stille opp noe` (entry 2240021, German recording only)
   - `å gå stille i dørene [idiom]` (2266223, German only)
   - `Stille vann har dypest grunn.` (1223599 / 1849840)
   No candidate's `context` contains any of those three phrases.
10. **The EN↔NO-only recordings are present** — candidates exist whose
    `context` names `å stille klokka`, `å stille klokken` and `å stille ut`.
    These live only in the `ENNO` pair and were unreachable before the
    `dir` fix.
11. `GET /tts?text=hus&lang=nb` returns candidates, and the recordings
    endpoint reports `lid81` for that word from **more than one** contributing
    user — asserting the language id is matched, not a user id.
12. `GET /inflections?word=stille&lang=nb` with `dictcc_api` succeeds and the
    `ENNO` pair contributes: querying that pair alone returns a non-empty
    entry list (it returned zero before the `dir` fix).
13. The recordings endpoint is called **once per pair per variant**, not once
    per entry — confirmed by counting outbound requests to
    `ajax_get_audiorecordings.php` for one `stille` lookup: at most one per
    `(lp, variant)` combination.
14. A `stille` lookup completes in **under 8 seconds** (it took 12.6s when
    every entry was probed for audio and the synthetic voice was requested).
15. A `/tts` response from a non-dict.cc provider (`pygmalion`) returns
    candidates with **no** `context` key, and is otherwise the same shape as
    before the change.
16. `GET /tts?text=kalv&lang=nb&pos=substantiv` is **not** a supported
    filter: the `pos` parameter is ignored and the full candidate set is
    returned.

## Item — filmot phrase quoting

17. The filmot `/tts` candidate for the Norwegian query `fastsatt av`
    carries a URL whose path segment contains `%22` at both ends of the
    encoded phrase.
18. Opening that URL in a browser lands on a filmot results page for the
    quoted phrase, not an error page.
19. The filmot candidate for the single word `hus` carries a URL with no
    quote characters, identical to the pre-change URL.

## Regression

20. `pytest` passes in `smia/` with no test skipped or deleted that was
    passing before the change, other than the two filmot URL expectations
    this change deliberately updates.
21. `GET /translations?text=do&from=nb&to=en` returns the same candidate
    grouping as before the change — entries sharing a sense still joined
    with `/`, context still carrying the bracketed tag. This change does
    not touch translation grouping.
22. `GET /translations?text=stille&from=nb&to=de` returns candidates for
    **every** row dict.cc has, including ones with no audio whatsoever —
    `å gå stille i dørene [idiom]` and `Stille vann har dypest grunn.` are
    both present, each with its own context. Translations are never gated
    on audio availability.
