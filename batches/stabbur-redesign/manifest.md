# stabbur-redesign

Batch opened 2026-11-19 directly by the operator (no `/tun-triage` pass — the
ask arrived as one coherent redesign rather than a Quick Log dump, and it
absorbs several already-logged items listed verbatim below).

## Dependencies

Single package. Nothing to order. Within the package, the stabbur change must
land before the mjolnir one is verifiable (the builder reads the new column),
but both are in one build session.

## Status

| package | status |
|---|---|
| Stabbur console redesign | pending |

## Packages

### Stabbur console redesign
projects: stabbur, mjolnir

The operator's ask, verbatim:

> i want to completely redesign the stabbur triage/note editing page and also
> make it more phone friendly as well and make it more modern minimalistic and
> easy to use.

Absorbed Quick Log items, verbatim:

> [ux] convenient phone portrait display for stabbur. Designed 2026-11-16 in
> the `full-sweep` "Stabbur merging & dict.cc translations" design session,
> then deliberately DEFERRED out of that package so the operator can take it
> later; the four changes it would have touched shipped without it. [...]
> Nothing about the DATA changes — this is layout only.

> [bug] stabbur triage: after a merge on the triage belt, the absorbed notes
> stay in the in-memory `triageQueue`. Similar-note matches are very often
> other drafts in the same queue, so advancing lands on a row whose note was
> just hard-deleted and every PATCH/accept against it 404s. PRE-EXISTING
> (identical before the `stabbur-merge-fixes` change — confirmed at 925386bd),
> but that change makes merging much more prominent (take text/lemma,
> operation labels, save-and-merge), so it will be hit more often. Fix: drop
> the absorbed ids from `triageQueue` in `commitSimilarMerge`'s tail, where it
> currently only refreshes the survivor.

> [ux] stabbur audio suggestion rehaul, filmot and forvo should be smaller, no
> input field, url input should be removed and there should be just a button,
> that says: url from clipboard? forvo and filmot push down

> 1. stabbur examples/translations store as separate rows, not joined by "/",
> just make the ux easier to edit, view those multiple translations

> [ux] stabbur duplicate note button

> [ux] stabbur provider priority should reflect the same order in the
> suggestion list, even if no prefill is done

Note on the portrait item: its "layout only" scope is **superseded** by this
package, which was commissioned as a complete redesign. What that session
settled (native `<select>` queue picker, shortened belt, pinned thumb-reachable
verdict bar, stacked notes rows, single-column settings) is carried forward as
input, not as a constraint.
