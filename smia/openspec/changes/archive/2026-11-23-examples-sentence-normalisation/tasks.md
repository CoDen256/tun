# Tasks — examples-sentence-normalisation

Acceptance criteria are in `acceptance.md` (N01–N05). The design is `design.md` D1–D3.

## 1. Normaliser

- [x] 1.1 Write a pure `normalise_example_text(text) -> str | None`
  implementing D3 (trim, capitalise the first letter after leading
  non-letters, terminal punctuation placed before trailing closers, `None`
  for empty).
- [x] 1.2 Unit tests covering the scenarios in the spec delta, plus `æ/ø/å`,
  `...`, `…`, `!`, `?`, `«…»`, a leading `–`, and a text that is only
  punctuation.

## 2. Response boundary (D2)

- [x] 2.1 Apply the normaliser plus the within-response de-duplication to
  the `/examples` payload *after* the lookup-cache read, on the `POST` path
  (both hit and miss) and on `GET /examples/{id}`. The cache keeps storing
  the raw provider payload.
- [x] 2.2 Test: seed a raw lower-case payload in the cache, `POST` the same
  request, and assert the returned text is normalised while the stored row is
  unchanged.

## 3. Docs

- [x] 3.1 `docs/06-smia.md`'s `/examples` row: state that candidate text is
  normalised as a sentence at the response boundary.

## Notes

- Normaliser: `smia/example_text.py` (`normalise_example_text`,
  `normalise_examples_payload`). Wired in via a new optional
  `transform_payload=` hook on `routes/generic.py`'s
  `register_lookup_routes`, so it runs on the POST path (hit and miss) and on
  `GET /examples/{id}` with the cache still storing the raw payload.
- Tier-2 D3.3: the added `.` goes at the very END, after any trailing closer
  (`«Kom hit»` → `«Kom hit».`), per D3's worked example. An already-terminated
  quotation is untouched (`«Kom hit!»`).
- Tier-2 D3.4: no re-fill after de-duplication. The boundary sees only the
  payload — the provider's pre-slice list no longer exists on a cache hit, so
  re-filling would make hit and miss disagree.
- Pure-punctuation text (`...`, `?!`) is dropped like empty text: it is not a
  sentence and terminating it would only yield `....`.
- Tests: `tests/test_example_text.py` (new) and the normalisation block
  appended to `tests/test_examples_route.py`.
  `tests/test_lexin_routes.py::test_examples` updated to the normalised
  expectation (`Konserten ble avlyst.`).
- Suite run in the smia container against a throwaway `smia_test` database:
  **40 failed, 341 passed**. The 40 are pre-existing and data-dependent (the
  fresh database has no imported ordbank/kaikki/nst provider tables); the
  failing set is byte-identical before and after this change.
