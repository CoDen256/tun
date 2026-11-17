# CLAUDE.md

## stabbur — part of the Tun ecosystem

The **learning content** service: captures → triage → reviewed **notes**, plus
the canonical learning audio blobs. A note is authored content; "card" is a
different word for a different entity Mjølnir derives — never use them
interchangeably in this repo.

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
Do not re-derive settled decisions.

### Hard boundaries (D43, D44, D45, D74)

- **No Mjølnir concepts here.** No decks, no 6-char card ids, no occurrences,
  no N/E/X/A, no card types. All of that belongs to `mjolnir/hub`, which
  *pulls* from this service. stabbur must not know hub exists.
- **Language-agnostic.** `source_lang` is a real column; `translations` is
  `[{lang, text}]` for any languages, not fixed en/de. `inflections` is a flat
  JSONB, Norwegian-shaped, until a second `source_lang` actually exists.
- **`status` is `draft`/`ready` only.** Never add a "published" state here —
  stabbur never learns whether Mjølnir picked a note up, by design (D74). That
  tracking is entirely `mjolnir/hub`'s own ledger, never pushed back.
- **`audio_blob` is not required for `status=ready`.** "Ready" means reviewed
  and correct, nothing about what a consumer needs. Mjølnir's own eligibility
  filter (audio mandatory, no type-based exception) lives on Mjølnir's side.
- **stabbur owns the canonical learning audio** as `blob/<sha256>`. smia is
  stateless and returns bytes; stabbur stores them.
- Separate database. **No cross-service foreign keys** — service independence
  has to be structural, not nominal.

### Depends on

`smia` for enrichment. Nothing else.

## Status

Notes, grammar rules, settings, and blob storage are implemented. `captures`
exists as its own table (`captures-provenance-and-promote`): `POST
/api/captures` ingests a capture and atomically promotes it to a draft note,
making `origin=capture` a reachable, referentially-backed state for the first
time. Relevant docs: `docs/03-data-model.md`, `02-services.md`,
`06-smia.md`, and **D74** for why `item` became `note`.

## The IPA asymmetry between merge and the suggest panel — do not "fix" it

Two controls touch `transcription` and they behave **deliberately
differently**. Both are the operator's explicit choice, made in one design
session (`stabbur-merge-fixes` D2, `stabbur-triage-queues` D6):

- **Merge's "Take IPA" REPLACES.** Taking a field from another note is a
  swap — you are choosing that note's value over your own.
- **The suggest panel's "Use" on an IPA candidate APPENDS**, separated by a
  single space. Using a suggestion is assembly — the operator is building
  one transcription of a multiword expression out of its tokens, which is
  why the separator is a space and not `" / "`.

Same column, two gestures, two intents. A change that makes them
consistent is undoing a decision, not fixing a bug.

Related: part of speech **orders** candidates and never filters them, and
the ordering is stabbur's own, done on the `context` string smia returns.
See `smia/CLAUDE.md` for smia's half.

## Part of speech orders candidates; it never filters them

`stabbur-triage-queues` D5. The operator's complaint was that dict.cc
"picks the wrong PoS", and his diagnosis was more precise than that: **the
right candidate was already in the response and simply was not first**, and
`walkProviders` takes `candidates[0]`.

So nothing is ever withheld. Candidates matching the note's part of speech
sort to the top — which is what makes automatic prefill pick the right
sense — and the panel groups them with the note's own group first and
labelled. This applies to translations **and** audio.

- The tag is read from a **leading bracketed** `context` (`[verb] å komme
  i vei`). `dictcc_static`'s unbracketed `noun Br.` is deliberately
  **untagged**, grouped last, never parsed by a word list that could drift.
- Tags are normalised on both sides: dict.cc is English (`noun`), stabbur
  stores Norwegian (`substantiv`).
- With no part of speech on the note, or no candidate matching it, the
  provider's order is left **completely alone** and no preference is
  invented.
- No `pos` parameter is ever sent to smia. The ordering is stabbur's own.

Do not turn this into a filter.
