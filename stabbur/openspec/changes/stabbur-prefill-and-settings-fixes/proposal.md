# Proposal — stabbur-prefill-and-settings-fixes

Batch `stabbur-fixes`, package "stabbur fixes". This is the stabbur half of
the package. The smia half is
`smia/openspec/changes/examples-sentence-normalisation` (item 6). The two
halves ship independently.

## Why

The operator's findings, verbatim and numbered as they appear in the manifest:

1. [ux] stabbur settings drag and drop not working and in general the whole
   settings page is very slow and not responsive, it loads/saved very slowly
2. [ux] stabbur ideally the prefill should also have its performance
   improved, i don't know how, but we should find out, when i open a card the
   prefill is kinda long, like 5-10s, sometimes it gets 500 and can't prefill
   anything at all.
3. [ux] stabbur prefill uses settings for example to determine how much
   (provider x sentences) to ask smia for prefilling, but when opened a
   suggestion drawer it should ask for more sentences(also should be
   additonally defined in settings), so i might have for prefill 5 provider x
   2 sentence each, but when i open the drawer it should ask more, for example
   5 sentence per each
4. [ux] stabbur ideally i would able to override the number of examples to
   ask example provider just as i can override prompt per provider.
5. [ux] stabbur example prefilling should add examples when one is already
   (even if before prefilled there was already) there, but do not repeat
   examples.
6. *(smia half — `examples-sentence-normalisation`)*

## What changes

Items are added here as the operator locks them in during design.

- **Item 2 — progressive prefill.** Each field fills as soon as the provider
  it will actually use has answered, and fields no longer wait on each other
  (apart from the part-of-speech dependency). A field still always takes its
  **top enabled provider's** answer: a lower provider that answers first is
  used only once every provider above it has failed or answered with
  nothing. The intermittent 500 that leaves the whole prefill empty is
  diagnosed and either fixed or contained to the field it belongs to.
- **Item 5 — examples append.** Plain Prefill adds new example sentences
  after the ones the note already has, skipping any it already holds. The
  duplicate check ignores case, outer whitespace and final punctuation.
  Force prefill still replaces.

## Non-goals

- No change to which providers are consulted or in which order.
- No change to the device plane or to any other project apart from the smia
  half named above.
