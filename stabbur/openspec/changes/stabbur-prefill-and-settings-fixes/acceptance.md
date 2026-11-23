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
