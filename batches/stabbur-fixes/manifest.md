# stabbur-fixes

Batch opened 2026-11-23 from one triaged package.

## Dependencies

None — single package.

## Status

| package | status |
|---|---|
| stabbur fixes | designing — `stabbur/…/stabbur-prefill-and-settings-fixes`, `smia/…/examples-sentence-normalisation` |

## Packages

### stabbur fixes
projects: stabbur, smia *(smia added in design: the operator placed item 6's normalisation in smia's `/examples`)*

[ux] stabbur settings drag and drop not working and in general the whole settings page is very slow and not responsive, it loads/saved very slowly
[ux] stabbur ideally the prefill should also have its performance improved, i don't know how, but we should find out, when i open a card the prefill is kinda long, like 5-10s, sometimes it gets 500 and can't prefill anything at all.
[ux] stabbur prefill uses settings for example to determine how much (provider x sentences) to ask smia for prefilling, but when opened a suggestion drawer it should ask for more sentences(also should be additonally defined in settings), so i might have for prefill 5 provider x 2 sentence each, but when i open the drawer it should ask more, for example 5 sentence per each 
[ux] stabbur ideally i would able to override the number of examples to ask example provider just as i can override prompt per provider.
[ux] stabbur example prefilling should add examples when one is already (even if before prefilled there was already) there, but do not repeat examples. 
[ux] stabbur Also would be nice to always capitalize the first letter of the example and force "dot" at the end

## Deferred to the builder (tier 2)

(none yet)

## Dropped / deferred

(none)
