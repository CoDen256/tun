# Design — examples-sentence-normalisation

## D1 — smia owns the sentence shape (operator decision, 2026-11-23)

The operator considered both places and chose smia. "This is an example
sentence" is a property of the data `/examples` returns, in the same way its
ranking already is (D137). stabbur keeps its own loose de-duplication, which
ignores case, outer whitespace and final punctuation, so that examples stored
on notes *before* this change still match the normalised candidates.

## D2 — Normalise after the cache, never before

Normalisation runs on the payload just before it is returned, on the `POST`
path (cache hit or miss) and on `GET /examples/{id}`. The cache keeps the
provider's raw answer. This means:

- every entry already cached is normalised on its next read, with no purge;
- a later change to the rule takes effect immediately, again with no purge;
- the stored payload stays a faithful record of what the provider said.

## D3 — The rule

Given a candidate `text`:

1. Trim outer whitespace. If nothing is left, drop the candidate.
2. **Capitalise:** upper-case the first *letter*, skipping any leading
   non-letters (quotes `«"'„`, dashes `–—-`, opening brackets, spaces). Every
   other character is left as it is. Upper-casing must handle Norwegian
   letters (`æ→Æ`, `ø→Ø`, `å→Å`).
3. **Terminate:** look at the text with any trailing closing quotes/brackets
   (`»"'”)]`) set aside. If it ends in `.`, `!`, `?`, `…` or `...`, leave it.
   Otherwise append `.` *before* those trailing closers
   (`«Kom hit»` → `«Kom hit».`; the builder may decide placement in odd
   cases, tier 2).
4. A candidate that turns out identical to an earlier candidate *from the
   same response* (compared on the normalised text) is dropped. This happens
   after the provider's own `limit` slicing, so a response can come back
   shorter than `limit`. The builder may instead re-fill from the provider's
   pre-slice list if the adapter shape makes that easy (tier 2).

`source` and `sense` are untouched.

## Risks

- A dictionary fragment that is really a phrase (`komme seg opp`) becomes
  `Komme seg opp.`. The operator asked for exactly this.
- Abbreviation-final text (`m.m.`) already ends in `.` and is left alone.
