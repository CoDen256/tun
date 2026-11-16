# System-Wide Master Backlog

## Quick Log (Manual Dump)
[ux] backup own ui with own logs hisotry and button for manual backup and cron setup settings
[ux] assembly update patches to be more standartized (do not hardcode endpoint for both, let audio url endpon also be specified ), infer fillable envs from the patches.
[ux] assembly when picking bundle from catalogue its not obvious if its loading or anything, there is no progress marker
[ux] assembly compare doesn't work at all
[bug] projector throws on a verb note whose `inflections` is an empty object `{}` — it enters the verb branch and `ensurePrefix` throws on undefined. `inflections: null` is the projector's own "none" input and works. Found 2026-11-16 while building flush-record-atomicity (four rollover pipeline test fixtures were failing at HEAD on any database because of it); the fixtures were corrected, the latent projector bug deliberately NOT fixed as out of that change's scope.

[ux] convenient phone portrait display for stabbur. Designed 2026-11-16 in the `full-sweep` "Stabbur merging & dict.cc translations" design session, then deliberately DEFERRED out of that package so the operator can take it later; the four changes it would have touched shipped without it. What was settled there, so it need not be re-derived: four pages need portrait layouts — Triage, Notes list, Note editor/detail, Settings. Triage: the queue selector collapses to a native `<select>`, the belt stays but shortens, and the verdict bar pins to the bottom of the viewport as a thumb-reachable row (Delete / Skip / Previous as glyphs, "Ready & next" taking the remaining width). Notes list: the table becomes stacked rows — the two glyph columns (status, audio) stay on the right of the headword, and type/PoS/translation/updated fold into one dim secondary line; the pager shrinks to `‹ 2 ›` plus the count. Note editor: the two-column detail grid collapses to one column, similar-notes and merge included. Settings: single column. Nothing about the DATA changes — this is layout only. Mockup of the intended portrait treatment: `stabbur/openspec/changes/stabbur-triage-queues/mockups/stabbur-merge-dictcc.html` (the "Portrait" blocks on the Triage and Notes list tabs).

## Triage & Planned Packages

> Last triaged 2026-11-15. All packages batched into `batches/full-sweep/`.
