# Proposal — projector-translation-langs

Batch `stabbur-redesign`, package "Stabbur editor fixes". The builder half of
operator finding 13, paired with stabbur's `stabbur-editor-fixes`. Deploy
stabbur first.

## Why

Operator finding 13, verbatim:

> Also the same goes for the database. I already migrated everything, but we
> need another migration, that will go over each translation and split any
> translation having any "/" (without spaces) into separate translation
> entries. Also verify that the builder no how to parse multiple entries for
> the same language. It Should join them by "/" when presenting, but
> different languages appear on different rows.

stabbur splits slash-joined translations into separate rows, so a note that
used to carry one English row reading `"hurry/rush"` now carries two. The
projector renders every translation on its own line regardless of language,
so that note's card would grow from one English line to two — the separate
rows would leak onto the card as separate lines, which is not what separate
rows were for.

## What Changes

- `translationsHtml` groups a note's translations **by language**, in
  first-appearance order: one line per language, the values within a language
  joined by ` / `.
- A note with one value per language renders byte-identically to today, so
  only notes that carry several values for one language change.
- Nothing else in the projection, the pipeline, or the device plane changes.

## Impact

- `mjolnir/builder/src/projector.js` and its tests.
- The E face of word, expression, listening and pronunciation cards for notes
  with several values in one language. Every existing minted card is
  regenerated on the next publish, so those cards update then.
- The device plane and the OTA contract are untouched.
