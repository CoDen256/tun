# stabbur-fixes

Batch opened 2026-11-23 from one triaged package.

## Dependencies

None — single package. Its two changes (stabbur, smia) are independent and can ship in either order.

## Status

| package | status |
|---|---|
| stabbur fixes | building — `stabbur/openspec/changes/stabbur-prefill-and-settings-fixes`, `smia/openspec/changes/examples-sentence-normalisation` |

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

Explicitly left to the builder in design (2026-11-23):
- How saves are made stale-proof on the Settings page (per-key sequence numbers, ignoring stale responses, …), where the ≤60 s catalogue cache lives, and whether `PATCH /api/settings` returns the full body (stabbur D4).
- Whether example prefill writes its rows in one go or provider by provider, as long as the final provider order is right (stabbur D1).
- If the intermittent 500 is an upstream provider's own fault: containing it to its field counts as done (stabbur D2).
- smia normalisation edge cases: where the final `.` goes around closing quotes in odd cases, and whether to re-fill from the pre-slice list after within-response de-duplication (smia D3).

Not decided in design and still to be found by the builder: the actual cause of the drag failure and of the 500. Both get recorded in `DECISIONS-MADE.md`.

## Dropped / deferred

(none)
