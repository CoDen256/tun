# Design — stabbur-editor-fixes

## D1 — Why the dropdowns close themselves (finding 1)

`render()` replaces `#app`'s innerHTML, which resets `.scroll`'s scrollTop to
0, then restores it. That restore dispatches a `scroll` event, and
`app.addEventListener('scroll', …, true)` — the "a scroll closes an open
picker" rule from the reference — catches it in the capture phase and both
clears `S.pick` and removes the `.menu` node that the same render just
produced. Opening a picker renders, so **opening a picker closes it** — but
only when the page is scrolled far enough that the restore is a real change,
which is exactly the operator's "sometimes".

Fix: the rule becomes "a scroll **that moves the page** closes the picker".
`openPick` records the scroller's current `scrollTop`; the handler closes the
picker only when the live value differs from that recorded one, and updates
the record when it closes. The reference's behaviour is preserved — a real
scroll still closes the picker — and a render's restore-to-the-same-place
never does.

This is the single root cause for finding 8 as well: the translation
language button is a picker like any other, and it failed for the same
reason, in the place where the operator is always scrolled down.

## D2 — The lemma is part of opening a note, not part of triage (finding 2)

The derive-from-text guess lives in `showTriageNote`, so the two other
contexts open with an empty lemma, and `defaultQuery('inflections')` and
`defaultQuery('pos')` have nothing to ask with.

It moves into `newEditor`, which every context goes through. It runs **after**
`E.base` is taken, so the derived lemma registers as an unsaved edit — a
lemma that was never part of the baseline would otherwise be invisible to the
Save button and so never persist. A note whose lemma is already set and
differs from its text is left alone, as today.

Prefill additionally derives the lemma itself as its first step when the
field is empty, so pressing Prefill always has a query even if the
derivation could not run.

## D3 — Examples prefill is a grid, not a pool (finding 3)

Today the step pools candidates from up to `examples_max_providers`
providers and truncates the pool to `examples_count`, so "3 sentences,
2 providers" yields 3 sentences, usually all from the first provider.

It becomes: ask the first **N** = `examples_max_providers` enabled providers,
take the first **M** = `examples_count` sentences from each, in provider
order, de-duplicated across providers. A provider with fewer than M
contributes what it has and **nothing backfills it** (operator's ruling), so
the result is at most N × M. The per-provider request limit sent to smia
becomes M rather than the old total.

The two Settings controls are relabelled to say what they now mean —
"Providers to ask" and "Sentences per provider" — with the product shown
under them. The stored keys, their ranges and their validation are unchanged.

## D4 — Per-language translations provider order (finding 4)

Storage: `provider_prefs` gains keys of the shape `translations:<lang>`,
reconciled against the **translations** catalogue exactly as `pos` is
reconciled against the inflections one (`CATALOGUE_SOURCE`). The kinds served
are computed per read from `default_target_langs` plus any
`translations:*` key already stored, so adding a language to Settings adds
its list.

A `translations:<lang>` key with nothing stored **seeds from the plain
`translations` preference**, so every language starts at the order the
operator already configured rather than at the catalogue's. The plain
`translations` key stays in storage as that seed; the Settings page no longer
renders it, showing one list per language instead.

Client:
- `kindProviders('translations', lang)` answers that language's order.
- A lookup for provider `p` asks only the languages whose order enables `p`.
- The translations sheet is **grouped by language**: one group per target
  language, inside it one box per provider in that language's order, listing
  only that language's candidates.
- Prefill walks each missing language's own order and takes the first
  provider that answers for it.

Nothing else is per-language: the six other lists stay single.

## D5 — Dropping an audio file (finding 5)

The editor becomes a drop target in all three contexts. While a drag carrying
files is over it, a full-editor overlay says what dropping will do; dropping
an `audio/*` file (or one with an audio extension, since some sources send an
empty type) runs the same upload path as the Upload file button, which is
extracted into one `uploadAudioFile(file)` used by both. A non-audio file is
refused with a toast and nothing is attached. The drop replaces the current
recording exactly as an upload does.

## D6 — Making similar notes impossible to miss (finding 7)

Phone: the "N similar" chip on the meta line becomes a filled accent badge
rather than a quiet outline chip. Desktop: the similar line leads with the
same filled badge before the note names. The badge is only ever rendered when
there is at least one match, so it carries no false weight.

No new data and no new request: `E.sim` already holds the matches.

## D7 — Force prefill (finding 10)

`prefill({ force: true })`: every step's "already has a value" guard is
skipped, so each field is re-fetched and overwritten; everything else
(provider order, step order, provenance tagging) is identical. It is reached
from the ⋯ tray in the triage and note contexts, labelled "Force prefill" with
the consequence spelled out under it. The New note context has no ⋯ tray and
no filled fields to overwrite, so it does not get one. There is no
confirmation dialog: the operator asked for a button, and the result is
visible and individually editable.

Force also bypasses the lookup cache, so it is a genuine re-ask rather than a
replay of the answers the gap-filling prefill already had.

## D8 — Previous never prefills (finding 11)

`showTriageNote` takes `{ prefill: false }`, which `goPrevious` passes.
Ready & next, Skip and Send to back are unchanged and still honour the
`on_open` setting.

## D9 — Splitting alternatives on `/` (findings 12, 13)

One shared rule, applied in two places:

> A translation value is split on every `/`. Each part is trimmed; a part
> that is empty after trimming is dropped, and a value that yields nothing is
> left as it was.

- **Candidates** (finding 12): applied where a provider's translations answer
  is normalised, before de-duplication, so `"hurry/rush"` and `"hurry / rush"`
  both become two candidate rows carrying the same language and context.
- **Stored rows** (finding 13): applied once, by migration, to every
  `translations[].text`. Rows keep their language and their position; a
  split produces consecutive rows; `(lang, text)` duplicates within one note
  collapse to the first. The migration's `downgrade` refuses — the join is
  not recoverable.

No space is required around the slash, which is the explicit request. A
value like `"1/2"` is therefore split too; the operator asked for every
slash, and the two rows remain editable.

## D10 — Many translations in one language on a card (finding 13, builder)

`translationsHtml` groups the note's translations by language in
first-appearance order: one `<br>`-separated row per language, and within a
row the values joined by ` / `. A note with one value per language renders
exactly as it does today, so the only cards that change are those that now
carry several values for one language.

This lives in the paired mjolnir change `projector-translation-langs`, and
goes out after stabbur as usual.

## D11 — C28 (finding 6)

The ✨ badge count comes from `E.cands`, which only `fetchKind` fills, and
only Prefill or opening a sheet calls it. That is what ships and what the
operator confirmed. The `note-editor-surface` requirement is amended to state
it, so the next reader cannot mistake it for an oversight. No code change.
