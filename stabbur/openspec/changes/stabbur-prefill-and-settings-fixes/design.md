# Design — stabbur-prefill-and-settings-fixes

Decisions made with the operator in the `stabbur-fixes` design session,
2026-11-23. "Tier 2" marks a point the operator explicitly left to the
builder.

## What the code does today (the diagnosis these decisions answer)

- `prefill()` warms every kind in parallel, then runs the steps **one after
  another** (`pos → ipa → translations → inflections → examples → audio`).
  Each step `await`s `ensureKind`, and `ensureKind` resolves only when
  **every enabled provider of that kind** (plus link providers) has
  answered. So one slow provider that the step will not even use (say, the
  third translations provider) holds up that field **and every field after
  it**. This is the main cause of "5–10 s".
- Every `/api/enrich/*` call is a synchronous proxy to smia. A smia 500 is
  passed through unchanged. Each step is wrapped in a `try`, so a failed
  lookup *should* only cost its own field. "Can't prefill anything at all"
  therefore means something else fails, or is too slow to finish, across the
  board. The root cause has not been found yet and finding it is part of
  this change.

## D1 — Progressive fill, top provider still wins (item 2)

Each field's step starts as soon as its inputs are ready. Only part of
speech has dependents (inflections need the shape; translations and audio
are ordered by it), so `pos` runs first and the others start once it
settles. IPA and examples do not depend on pos and may start immediately.
Within a field:

- Walk the enabled providers **in the operator's order**. Wait for provider
  1. If it answers with a usable value, fill the field **now**, without
  waiting for providers 2…n.
- If provider 1 errors or has nothing, move on to provider 2, which has
  usually already answered by then because all of them were asked in
  parallel, and so on.
- A lower provider that answers first is **never** used while a provider
  above it is still pending. *(Operator, verbatim: "it should never violate
  picking the suggestion of the top provider, even if the providers below
  have finished early, we still need the top provider's response.")*
- Examples is a grid (N providers × M sentences). It fills its rows in
  provider order: provider 1's sentences are written once provider 1
  answers, then provider 2's, and so on. A provider's rows never appear
  above those of a provider earlier in the order. Whether the rows are
  written in one go or one provider at a time is tier 2, as long as the
  final order is correct.

All lookups are still fired in parallel up front, so the sheets' badge
counts and the suggestion sheets behave as they do today. What changes is
only *when each field is written*.

The end-of-prefill toast and the spinner on the Prefill button stay. They
appear when the last field has settled.

## D2 — The 500 is diagnosed, not guessed (item 2)

The builder must reproduce or trace the 500 before fixing it. Candidates
worth checking, none confirmed: a smia provider raising on a specific
input; stabbur being served by Flask's threaded dev server while about 20
parallel proxy calls land at once; the 20 s `smia_client` timeout. Whatever
the cause turns out to be, the outcome must be that a single failing lookup
shows as an error **on its own field or sheet box** and every other field
still fills. The cause and the fix go into the batch's `DECISIONS-MADE.md`
in one line. If the root cause is an upstream provider's own fault and
cannot be fixed, containing it counts as done (tier 2).

## D3 — Examples append, with loose de-duplication (item 5)

Plain Prefill on a note that already has examples **adds** the new
sentences after the existing rows instead of skipping the field. The budget
is unchanged: up to N providers × M sentences per provider, counted
*before* de-duplication. Sentences that are already on the note are
skipped, and a provider's shortfall is not backfilled (as in
`stabbur-editor-fixes` D3).

Two sentences count as the same when they are equal after: trimming outer
whitespace, collapsing internal whitespace runs to one space, lower-casing,
and stripping trailing `. ! ? …` and closing quotes. This makes a sentence
stored before smia's normalisation (`komme seg opp`) match its normalised
candidate (`Komme seg opp.`).

Re-opening a note under automatic prefill re-runs this. Because duplicates
are skipped and providers answer the same way for the same query, a second
run adds nothing in practice. The field's provenance tag names the
providers that contributed in *this* run, and the field counts as "filled"
in the toast only when at least one row was added.

**Force prefill still replaces** (operator decision): it discards the
note's examples and writes a fresh grid, exactly as today.

## D4 — Settings: the page is the truth; saves only report (item 1)

The accepted mockup is `mockups/stabbur-fixes-mockup.html` (Settings tab) and
is normative for layout and wording.

**Why it is slow today.** Every `GET` and `PATCH /api/settings` calls smia's
`GET /providers` synchronously (`routes/settings.py` `_serialize`), and that
endpoint runs a `COUNT` over each registered dictionary table (kaikki, nst,
ipadict, dictcc_static, kaikki examples) on every call. After the response
arrives, `patchSettings` re-renders the whole page from the server's body.

**Why drag "doesn't work".** This is a suspicion, not yet confirmed in a
browser. The reply to a slow save re-renders the list from the server's
state. That undoes a second drag made in the meantime, and it destroys the
DOM of a drag that is still in progress. The builder must confirm the
actual cause in the browser before fixing it. If it turns out to be
something else as well, both are fixed.

Decisions:
- **Optimistic, local-first.** A change updates the page's state at once.
  A save response never overwrites a value the operator has changed since
  that request was sent. The builder chooses how (per-key sequence numbers,
  or ignoring stale responses; tier 2). Save state is shown **inline per
  section or list** ("Saving…" → "✓ Saved", plus an error), not as a toast
  per save. On failure, the stored value comes back and the error is shown.
- **The catalogue is reused for up to 60 s** inside stabbur (an amendment to
  operator-settings D3's "every time", recorded in the spec delta), and a
  failed fetch is never cached. Where it is cached, and whether `PATCH`
  returns the full reconciled body or only what changed, is tier 2. The bar
  is acceptance S03: settings saves come back fast. The smia endpoint is
  **not** changed by this package, and the cache lives on stabbur's side
  only, so the two halves stay independent.

## D5 — Sheet count K; one fetch at size K (item 3)

The operator chose two fetches only if that turned out faster. It isn't:
`tatoeba`/`leipzig` run the same bounded SQL (`PRE_RANK_FETCH_CAP`)
whatever `limit` is sent, and the dictionary providers slice in Python. So
**every examples lookup asks for K**, and prefill slices the first M per
provider from that same answer. Opening the sheet after a prefill is
answered from the session's lookup cache.

- New stored preference, the sheet sentence count. It needs a migration:
  a nullable column with a 1–10 check constraint, matching how
  `examples_count` is stored. The default is `max(5, examples_count)`, so an
  operator whose M is already above 5 does not break the M ≤ K rule. The
  API rejects M > K, and the page disables the stepper that would break the
  rule, with a short reason (mockup).
- smia clamps `limit` to 1–10, so K is capped at 10. That stays inside
  smia's existing contract.
- The section is renamed **Examples** (previously "Examples prefill").

## D6 — Per-provider count in the sheet, ad hoc (item 4)

This mirrors the per-provider query override exactly. The count stepper
sits in the same row the query pill opens: `[query] [− K +] Reset ⟳`. It
lives in the sheet's session state for that note, is never stored, and is
never used by prefill. The pill shows `· n` while n ≠ K. Reset clears both
the query and the count. Only the Examples sheet has the stepper, because
no other kind takes a count.

**On note** (rather than the current "Used") marks a candidate the note
already holds, by the D3 loose comparison. It reflects the note's examples
as they are now, so deleting an example makes its candidate usable again.
