# Acceptance — stabbur-prefill-and-settings-fixes

Every criterion is verified by **observing the running dev stack in a
browser** (claude-in-chrome). Reading code, getting a 200 response, or "the
function is called" does not count as a pass. Each criterion names the
backlog item it answers.

**Slowing or failing a provider on purpose.** Where a criterion needs a
provider to be slow or to fail, the tester wraps `window.fetch` in the page
(via the JS tool) so that requests to `/api/enrich/<kind>` whose JSON body
names that `provider` are delayed by the stated time, or answered with a
500. Nothing in the stack itself is changed.

## Item 1 — Settings page

The accepted mockup is `mockups/stabbur-fixes-mockup.html`, Settings tab.

- **S01** Open Settings. Drag the third provider in the Examples list to the
  top using the mouse on its handle. **It stays at the top the moment it is
  released**, the numbers read 1…n in the new order, and the list's title
  shows "Saving…" and then "✓ Saved". Reload the page: the order is still the
  new one.
- **S02** With `fetch` wrapped so that `PATCH /api/settings` is delayed by
  2 s, make two drags in the same list less than 2 s apart. **The list never
  jumps back** to an earlier order, at any point. After both saves have
  completed and the page is reloaded, the list shows the order after the
  second drag.
- **S03** With nothing delayed, toggle a provider switch off and on five
  times in a row. Each `PATCH /api/settings` in the network log completes in
  **under 500 ms**, and at most one of the five shows a call to smia's
  `/providers` in stabbur's logs.
- **S04** Focus a handle in Translations · de and press Arrow Up. The
  provider moves up one place, keeps focus, and the de list shows Saved. The
  en list is unchanged after a reload.
- **S05** With `fetch` wrapped so that `PATCH /api/settings` returns 500,
  move a provider. The list shows an error status and **returns to the
  stored order**.

## Item 3 — sheet sentence count

- **E01** Settings → **Examples** shows three steppers: Providers to ask,
  Sentences per provider, and **Sentences in the suggestion sheet**. On a
  fresh database the last one reads **5**, and the summary line states the
  N × M prefill maximum and the sheet's count.
- **E02** Set Sentences in the suggestion sheet to 3 and Sentences per
  provider to 3. **The + button on Sentences per provider is disabled** and
  its row explains why. Likewise, the − button on the sheet count is
  disabled. A direct `PATCH` with `examples_count: 4` gets a 4xx and Settings
  still shows 3 after a reload.
- **E03** Settings: Providers to ask 2, Sentences per provider 2, sheet 5.
  On a note with no examples, press Prefill: **at most 4 example rows are
  added**, two from each of the first two providers. Then open the Examples
  sheet: **each provider box lists up to 5 sentences**, and the network log
  shows **no new `/api/enrich/examples` request** when the sheet opens.
- **E04** Raise the sheet count to 7, go to another note and open its
  Examples sheet. The requests carry `limit: 7`, and a provider with enough
  material lists 7.

## Item 4 — per-provider count, On note

- **E05** With the Examples sheet open (sheet count 5), open leipzig's query
  row: it shows the query input, a **count stepper reading 5**, Reset and
  rerun. Raise the count to 8 and press Enter. **Only one
  `/api/enrich/examples` request is made, for leipzig, with `limit: 8`**.
  Leipzig's box lists up to 8, and its collapsed pill reads `… · 8`.
- **E06** Press Reset in that row. Leipzig's pill shows no count, and its box
  is asked again with the shared query and `limit: 5`.
- **E07** Override leipzig's count to 8, then go to the next note (triage
  Skip, or open another note) and open its Examples sheet. Leipzig is asked
  with `limit: 5`, and Settings still shows a sheet count of 5.
- **E08** On a note holding an example that a provider also returns, open
  the Examples sheet: that candidate's button reads **On note** and is
  disabled. Press **Use** on another candidate: it becomes On note and the
  note gains that row. Delete that row from the note: the candidate shows
  **Use** again.

## Item 2 — progressive prefill

- **P01** In Settings, give Translations · en at least two enabled
  providers. Delay the **second** by 8 s. Open a triage note with empty
  translations and prefill. **The en translation appears before 8 s have
  passed**, and its provenance tag names the first provider.
- **P02** Delay **every** enabled audio provider by 8 s. Prefill a note with
  empty transcription, translations, examples and audio. **Transcription,
  translations and examples all show values while the audio field is still
  empty**, and audio fills afterwards.
- **P03** Delay the **first** enabled translations provider by 4 s and leave
  the second undelayed, with both returning a value for the word. Prefill.
  **For about 4 s the translation stays empty. It then fills with the first
  provider's value**, and the provenance tag names the first provider, never
  the second.
- **P04** Make every enabled IPA provider answer 500. Prefill a note with
  empty transcription, translations and examples. **Translations and
  examples are filled, transcription is empty**, and the final toast
  appears; the Prefill button stops spinning.
- **P05** Make the **first** enabled translations provider answer 500 and
  leave the second normal. Prefill. The translation fills from the second
  provider and its tag names the second provider.
- **P06** `DECISIONS-MADE.md` has a line naming the cause found for the
  intermittent 500 and how it is fixed or contained. With nothing slowed or
  failed, prefill five different triage notes in a row: **no `/api/enrich/*`
  response in the network log is a 500**, unless the cause recorded in that
  line is a named upstream provider's own fault, in which case P04 already
  shows it is contained.

## Item 5 — examples append

- **X01** Settings: Providers to ask 1, Sentences per provider 2. Open a
  note, type one example by hand into an empty Examples field, and press
  Prefill. **The note shows three example rows**: the typed one first and
  unchanged, then two from the first provider.
- **X02** Press Prefill again on the same note. **Still three rows.** The
  toast does not count examples among the fields filled.
- **X03** Take a note with a stored example written in lower case with no
  final dot, matching a sentence its first provider returns (find one in the
  Examples sheet first, then edit the row by hand to the lower-case,
  undotted form). Press Prefill. **No second copy of that sentence appears**
  in any casing.
- **X04** On a note with three examples, choose Force prefill from the ⋯
  tray. **The examples field holds only the freshly fetched sentences.**
  None of the old three remain, unless a provider returned them again.
