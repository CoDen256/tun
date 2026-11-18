# System-Wide Master Backlog

## Quick Log (Manual Dump)
[ux] backup own ui with own logs hisotry and button for manual backup and cron setup settings
[ux] assembly update patches to be more standartized (do not hardcode endpoint for both, let audio url endpon also be specified ), infer fillable envs from the patches.
[ux] assembly when picking bundle from catalogue its not obvious if its loading or anything, there is no progress marker
[ux] assembly compare doesn't work at all
[bug] projector throws on a verb note whose `inflections` is an empty object `{}` — it enters the verb branch and `ensurePrefix` throws on undefined. `inflections: null` is the projector's own "none" input and works. Found 2026-11-16 while building flush-record-atomicity (four rollover pipeline test fixtures were failing at HEAD on any database because of it); the fixtures were corrected, the latent projector bug deliberately NOT fixed as out of that change's scope.
1. stabbur examples/translations store as separate rows, not joined by "/", just make the ux easier to edit, view those multiple translations
2. ipa should be merged on smia side
[idea/rehaul] create pronounciatikn/audio for context of words (builder, but also kinda stabbur should allow attaching more audio per note)
[content] y/i listening pairs, use calst for generating pronounciation/listening exercises notes
[bug] some of the mjolnir cards are too loud, some are too quite in relation to the stock volume. we hae to standartize it, but where? 
[ux] convenient phone portrait display for stabbur. Designed 2026-11-16 in the `full-sweep` "Stabbur merging & dict.cc translations" design session, then deliberately DEFERRED out of that package so the operator can take it later; the four changes it would have touched shipped without it. What was settled there, so it need not be re-derived: four pages need portrait layouts — Triage, Notes list, Note editor/detail, Settings. Triage: the queue selector collapses to a native `<select>`, the belt stays but shortens, and the verdict bar pins to the bottom of the viewport as a thumb-reachable row (Delete / Skip / Previous as glyphs, "Ready & next" taking the remaining width). Notes list: the table becomes stacked rows — the two glyph columns (status, audio) stay on the right of the headword, and type/PoS/translation/updated fold into one dim secondary line; the pager shrinks to `‹ 2 ›` plus the count. Note editor: the two-column detail grid collapses to one column, similar-notes and merge included. Settings: single column. Nothing about the DATA changes — this is layout only. Mockup of the intended portrait treatment: `stabbur/openspec/changes/stabbur-triage-queues/mockups/stabbur-merge-dictcc.html` (the "Portrait" blocks on the Triage and Notes list tabs).

[bug] stabbur triage: after a merge on the triage belt, the absorbed notes stay in the in-memory `triageQueue`. Similar-note matches are very often other drafts in the same queue, so advancing lands on a row whose note was just hard-deleted and every PATCH/accept against it 404s. PRE-EXISTING (identical before the `stabbur-merge-fixes` change — confirmed at 925386bd), but that change makes merging much more prominent (take text/lemma, operation labels, save-and-merge), so it will be hit more often. Fix: drop the absorbed ids from `triageQueue` in `commitSimilarMerge`'s tail, where it currently only refreshes the survivor.
[ux] stabbur grammar detail: the usage list requests `limit: 200` while `rule.usage_count` is uncapped, so a rule referenced by 300 notes reads "300 notes reference this rule" above a list of 200. Either page the list or say it is showing the first 200.

## Triage & Planned Packages

> Last triaged 2026-11-15. All packages batched into `batches/full-sweep/`.
