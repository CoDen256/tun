# Tasks — projector-translation-langs

- [x] 1.1 `builder/src/projector.js`: `translationsHtml` groups by language in
  first-appearance order, joins each language's values with ` / `, joins the
  lines with `<br>` inside the existing `<div class="center">` wrapper, and
  keeps no-language values in their own line (design D1–D3).
- [x] 1.2 `builder/test/projector.test.js`: a case per `builder-pipeline`
  scenario, including the byte-identical case for one value per language.
- [x] 1.3 `npm test` in `mjolnir/builder` green.
- [ ] 1.4 Verified against a real forecast on the hub stack: open a card
  preview for a note with two values in one language and read the E face.
