# Data model: capture → note → card

Two systems, two vocabularies, deliberately. **stabbur** stores **notes** —
authored learning content, language-agnostic, no idea what an SRS app does
with them. **Mjølnir** derives **cards** from notes it pulls — decks, 6-char
ids, occurrences, N/E/X/A. The split is structural (D43): stabbur would
survive switching to a different SRS app entirely, because it has never heard
of one.

The names are borrowed from Anki's own distinction on purpose: a *note* is
content; a *card* is one reviewable, rendered unit a template derives from a
note. Here, "the template" is Mjølnir's projection logic.

## Three distinct entities (do not merge them)

| Entity | What it is | Lives in |
|---|---|---|
| **capture** | a raw lexical intent grabbed in the wild, unclassified | `stabbur.captures` |
| **note** | authored, reviewed learning content — language-agnostic | `stabbur.notes` |
| **card** | the Mjølnir projection of a note (N/E/X/A + occurrences) | generated, not stored |

A phonexa **`Token` is NOT a capture.** A Token is a *phoneme instance*
(char range + time range + `vowel_id`) feeding formant analysis. Different
lifecycle, different purpose. Promoting a capture's clip into a phonexa
`Sample` for vowel analysis is an optional, explicit action — a link, not the
storage model. Most notes will never become Samples.

## Schemas

```
capture
  id, created_at, status  inbox|promoted|discarded
  selected_text                   -- what you actually selected
  context_text                    -- surrounding sentence(s)/paragraph
  translations JSONB              -- [{provider, lang, text}] as captured
  audio_blob  sha256 | null       -- WIDE clip (padded), null for text sources
  audio_sel_ms [start, end]       -- selection range inside that clip
  source JSONB                    -- {youtube: videoId, cueStartMs, cueEndMs, url, title}
                                  -- | {web: url, title} | {shadowing_segment_id}

note
  id                 immutable forever, even once removed (tombstone — see below)
  created_at
  updated_at         bumped on every edit (D82); notes-read-api's `since`
                      filters on this, not created_at, so builder's pulls
                      also catch edits to already-ready notes
  deleted_at         null | timestamp (D82) — the concrete tombstone marker:
                      set only when a `ready` note is removed; a `draft`
                      note's row is hard-deleted instead, so this stays null
                      for every note that was never eligible to be pulled
  capture_id         provenance; null for manual entries
  type               word | expression | listening | pronunciation | grammar
  source_lang        e.g. "no" — a real column; today every note is Norwegian,
                      but nothing here assumes that forever
  text                              -- the source-language content
  translations JSONB               -- [{lang, text}, ...] — any number, any
                                      languages, not fixed to en/de
  transcription                    -- bare string, no kind/source provenance
  pos, lemma
  inflections JSONB                -- Norwegian-shaped for now (below);
                                      becomes language-keyed if a second
                                      source_lang is ever added — not before
  context_text
  audio_blob  sha256 | null        -- NOT required to reach status=ready;
                                      only required for Mjølnir to pick it up
  audio_sel_ms [start, end]
  grammar_rule_id                  -- type=grammar
  seq                              -- stabbur-internal display number only;
                                      unrelated to Mjølnir's card_no
  status      draft | ready        -- the WHOLE lifecycle on stabbur's side.
                                      "ready" means "reviewed and correct," not
                                      "published" — stabbur has no idea whether
                                      Mjølnir ever picked a note up, and never
                                      needs to

grammar_rule(id, title, html)      -- shared X across type=grammar notes
```

Nothing deck-, card-id-, or occurrence-shaped lives in stabbur. Those are
Mjølnir's (`mjolnir/hub`'s) concern entirely:

```
card_slots(deck_code, card_no, note_id, retired_bool)   -- permanent id ledger
decks(code, title, category, max_interval, auto_tick_streak, auto_hammer_count, enabled)
publications(build_id, base_version, patch_rev, data_rev, bundle_sha, created_at)
```

`build_id` stays the existing OTA identity, untouched. The other three version
fields are owned differently (D77): `base_version` and `patch_rev` are set by
hand and simply copied forward until the operator changes them; `data_rev` is
bumped automatically by `builder` on every publish it performs (which, by
definition, always carries new or changed content).

`mjolnir/hub` tracks internally which note ids it has already minted into
`card_slots` — this is **hub's own ledger**, built from what it pulled, never
pushed back to stabbur. The pull stays one-directional (D44): stabbur does not
know hub exists, and there is no "published" callback. See `02-services.md`.

### Inflection shapes (Norwegian, used for every note today)

```
substantiv  {article, sg_indef, sg_def, pl_indef, pl_def}
adjektiv    {positiv, nøytrum, flertall, komparativ, superlativ}
verb        {infinitiv, presens, preteritum, perfektum}
adverb      {form}
other POS   {}        -- supported as type=word with no inflections
```

## The five note/card types

| type | N (front) | E (back) | X (extra) | `A` (audio attached to) | occurrence set |
|---|---|---|---|---|---|
| **word** | word + inflection table (+ transcription) | en / de / … | context sentence | `N` | **A, E** |
| **expression** | phrase | en / de / … | context (optional) | `N` | **A, E** |
| **listening** | hard sentence | translation | — | `N` | A |
| **pronunciation** | `"Read out: " + phrase` | **transcription** | — | `E` | N |
| **grammar** | question (translate/transform) | norwegian answer | grammar rule | `E` | N |

**D91: word/expression occurrence set is `A, E` only — `N` is dropped as a
drawable occurrence (operator decision, 2026-10-25).** The word/expression
card is never quizzed text-first (reading the Norwegian word and recalling
its meaning); only audio-first (`A`: hear it, recall meaning+spelling) and
translation-first (`E`: see the meaning, produce the Norwegian word) remain.
The `N` field still exists on the card's *content* — every side always
appears once revealed, per the rule below — it simply never triggers a quiz
on its own. All five shapes below are attested in the *stock* bundle
(occurrence-set frequency across its 2790 cards: `EN` 1124 · `N` 987 ·
`AEN` 376 · `A` 278 · `AE` 98 · `E` 58) — that frequency table describes the
stock content's own historical authoring choices, not a target for new
content produced under this (narrower) occurrence-set design.

**What the occurrence letter (`N`/`E`/`A`) means: which side is presented
*first*, before any reveal — not whether audio exists.** `A` = audio plays
first, nothing shown. `N`/`E` = that text is shown first. **Once revealed,
every side appears, including the audio clip** — the card-level `A` field
only names which side (N/E/X) the one audio clip is attached to; that clip
plays on reveal regardless of which occurrence variant triggered the review.
Type **pronunciation** has occurrence set `{N}` only (never quizzed
audio-first) but still plays its correct-pronunciation clip on reveal (`A:"E"`)
— that playback IS the exercise. **Audio is therefore mandatory for every
Mjølnir card, with no type-based exception.** A note with no `audio_blob` is
simply not eligible for Mjølnir to pick up yet, regardless of type or
`status`.

**Projection is pure**: type determines `A` and the occurrence list.
Occurrences are computed, never stored.

## Deck and ID scheme (Mjølnir-side only — stabbur has no decks)

**Decision: custom decks continue the existing `C` category, starting at `C20`.**

The deck-list screen switches on `deck.Name.charAt(0)` with only `Z/A/B/C` cases
and no default, and each category's decks must occupy a *contiguous range* of the
deck array (indices come from `findIndex(first)…findIndex(last)+1`). Adding a new
`P` category means 2 extra `useState` pairs, a 5th case in two separate switches,
section headers, scroll offsets and the approach selector — all inside mod 2119,
the largest and most rebase-fragile UI module. Not worth it.

```
deck codes : C20 … C29   (appended after C17 as one contiguous block)
card ids   : C20 + 3 digits   →  "C20001"      ← EXACTLY 6 CHARS, NON-NEGOTIABLE
occurrence : C20001N / C20001E / C20001A       ← 7 chars; last char = direction
audio file : c20001.mp3  (lowercased id)
rollover   : C30 = "substantiv II" when C20 hits 999
```

Six characters is hard-coded: `getCard(t) { return 6 == t.length ? cards[t] : cards[t.substr(0,6)] }`
(mod 2112) plus `card.slice(0,6)` in mods 2110, 2124, 2131.

Note: Mjølnir's `card_no` (the 3-digit suffix above) is a different number
from stabbur's `seq` — they are unrelated, deliberately, and never compared.

### Deck allocation (one per type / PoS)

| code | contents |
|---|---|
| C20 | substantiv |
| C21 | adjektiv |
| C22 | verb |
| C23 | adverb |
| C24 | preposisjon |
| C25 | konjunksjon + subjunksjon |
| C26 | expressions (type=expression) |
| C27 | listening (type=listening) |
| C28 | pronunciation (type=pronunciation) |
| C29 | grammar (type=grammar) |

Decks are Mjølnir's pacing unit (`MaxInterval`, `AutoTickStreak`,
`AutoHammerCount` are per-deck), which is exactly why the split is by type/PoS.
Deck assignment and rollover are computed entirely by `mjolnir/builder` from a
note's `type` — stabbur never assigns or stores a deck.

## Occurrence ordering inside `Cards[]`

`Cards[]` is the **introduction order**. Once a card has a progress record,
Stage/Time take over — so ordering matters only on the day a card enters rotation.

### The mechanism (mod 2110 `drawNewCards`)

```js
var v = 5 * PullCounter;
var u = premium ? deck.Cards.slice(v, v+5)
                : deck.Cards.filter(n => "N" === n.P).slice(v, v+5);
...
PullCounter++;
```

**`PullCounter` is a block index; each pull consumes 5 consecutive occurrences.**
It is stored in synced userdata (`decksInfo`).

Two consequences, both hard rules:

1. **Appending to `Cards[]` is always safe** — new entries land beyond the
   current PullCounter.
2. **Reordering a published deck's `Cards[]` is catastrophic** — PullCounter 12
   means "the first 60 entries are consumed"; after a reorder you silently and
   permanently *skip* cards. (Duplicates would be caught by the
   `{ID, language, DECK_ID}` dedup; skips would not.)

### The interleave rule

Stock data uses minimum-lag re-insertion, not shuffling:

```
C16 (50 cards × NE):
NNNNNNNNNNN ENENNENENNENENNENEN… EEEEEEEEEEEEEEEEEEEEEEEE
└─ 11 new ─┘ └ each E lands 11 behind its own N ┘ └ tail ┘
```

Measured minimum lags do **not** correlate with `MaxInterval` /
`AutoTickStreak` / `AutoHammerCount` (C13–C17 are structurally identical and all
use 11; A08 and B08 use 1). Different authoring batches used different recipes.
The C13–C17 family is the cleanest, most recent, clearly machine-generated set.

**Rule: minimum lag 11.** This is mechanically justified, not copied: the app
pulls 5 occurrences per block, so a lag of 11 guarantees a card's occurrences
land at least two pull-blocks apart — never in the same session chunk.

Separately: mod 2110's `drawNewCards(n, l, o, f, c, s)` (`n` = the learner's
*selected* decks, `o` = the last deck drawn) round-robins across every
selected deck, pulling one ≤5-occurrence block from a deck before moving to
the next. Studying with several decks enabled therefore interleaves *across*
decks for free, which adds real but **probabilistic** spacing — it depends on
what the learner has selected and shrinks to zero if they ever study one deck
alone. The guarantee below does not rely on it; it's a bonus on top, not a
substitute (findings.md's deck-data-model notes this as a confirmed, not
assumed, mechanism).

### Appending new cards to an existing deck — D91 (supersedes D87/D88)

**No minimum-batch floor of any kind.** Publish whatever is `ready` and
audio'd, any batch size, including a single note. This replaced an earlier
design (a fixed 6-note floor, applied uniformly) once two problems with it
were found: it cost pure publish latency for occurrence sets that don't need
intra-card spacing at all (listening/pronunciation/grammar — one occurrence
each), and even where it applied, a same-batch round-robin of 6 cards cannot
actually reach lag 11 — the achievable gap between a card's own occurrences
is capped at the batch size, not the target lag.

**The guarantee is now cross-batch, not same-batch**, and lives in `hub`'s
own persisted state, not in the bundle alone:

```
On mint: the card's A occurrence is appended immediately — it always ships
         in the same publish the card is minted in (D91: "A always first").
         Its E occurrence is NOT appended yet. A row is queued instead:
         {deck_code, card_id, letter: "E", remaining: 11}

Every subsequent publish to that deck: decrement every queued row's
         `remaining` by however many brand-new occurrences this publish adds
         to that same deck (new cards' A's only — a queued E draining in the
         same run does not count toward another queued E's countdown, to
         keep the bookkeeping a single integer per row rather than an exact
         array-position computation). Any row that reaches `remaining <= 0`
         is appended this run and removed from the queue.

A deck that gets zero new cards in a given publish leaves its queue
         untouched — correct, because nothing was added to that deck's
         `Cards[]` for the countdown to have progressed against.
```

Worked example, 2 notes ready (nowhere near any old floor):

```
Publish 1:  A1 A2                          queue: E1→11, E2→11
Publish 2:  A3                             queue: E1→10, E2→10, E3→11
...
Publish N (11 new occurrences have landed in this deck since E1 was queued):
            E1 finally appends
```

Single-occurrence types (listening/pronunciation/grammar) never touch the
queue — there is nothing of their own to space against, so they publish the
moment they're ready, every time, with no floor and no wait, ever.

## Content is regenerated fresh on every publish; positions are frozen forever

A note can be edited after reaching `status=ready` (stabbur has no "don't
touch me, I'm live" state — it doesn't need one). This works safely because of
how `builder` republishes: **`Cards[]` occurrence positions and `card_slots`
assignments are permanently frozen once minted, but the N/E/X/A *content* for
every card is regenerated fresh from stabbur's current note state on every
publish** — not just for newly-added cards. `Cards[]` entries only ever
contain `{id}{direction}` strings; content lookup is a separate array indexed
by id. So a typo fix in stabbur reaches the device on the next publish, with
zero risk to occurrence ordering or progress.

`builder`'s job each run, precisely:
1. Regenerate all card content from stabbur's current note state.
2. Append card_slots + `Cards[]` occurrences only for notes not yet minted.
3. Never reorder, never remove, an existing `Cards[]` entry.

## Permanence rules (violating these corrupts progress)

1. **Card IDs are permanent.** Minted at publish into `card_slots`, never reused,
   never reassigned. A note's `id` is also permanent, even if the note is later
   removed from stabbur — a tombstone, not a hole.
2. **Published cards are append-only.** A card removed from the bundle leaves a
   live progress record that renders blank (`if(!N&&!E&&!X) getCard(ID)` returns
   nothing). Retire by moving to a disabled deck, never by removal.
3. **Never reorder a published deck's `Cards[]`.** See PullCounter above.
4. **Category deck blocks stay contiguous.** Append C20–C29 after C17 as one block.
