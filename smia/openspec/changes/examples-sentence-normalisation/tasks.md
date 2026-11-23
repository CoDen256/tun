# Tasks — examples-sentence-normalisation

Acceptance criteria are in `acceptance.md` (N01–N05). The design is `design.md` D1–D3.

## 1. Normaliser

- [ ] 1.1 Write a pure `normalise_example_text(text) -> str | None`
  implementing D3 (trim, capitalise the first letter after leading
  non-letters, terminal punctuation placed before trailing closers, `None`
  for empty).
- [ ] 1.2 Unit tests covering the scenarios in the spec delta, plus `æ/ø/å`,
  `...`, `…`, `!`, `?`, `«…»`, a leading `–`, and a text that is only
  punctuation.

## 2. Response boundary (D2)

- [ ] 2.1 Apply the normaliser plus the within-response de-duplication to
  the `/examples` payload *after* the lookup-cache read, on the `POST` path
  (both hit and miss) and on `GET /examples/{id}`. The cache keeps storing
  the raw provider payload.
- [ ] 2.2 Test: seed a raw lower-case payload in the cache, `POST` the same
  request, and assert the returned text is normalised while the stored row is
  unchanged.

## 3. Docs

- [ ] 3.1 `docs/06-smia.md`'s `/examples` row: state that candidate text is
  normalised as a sentence at the response boundary.
