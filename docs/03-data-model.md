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
| **word** | word + inflection table (+ transcription) | en / de / … | context sentence | `N` | A, E, N |
| **expression** | phrase | en / de / … | context (optional) | `N` | A, E, N |
| **listening** | hard sentence | translation | — | `N` | A |
| **pronunciation** | `"Read out: " + phrase` | **transcription** | — | `E` | N |
| **grammar** | question (translate/transform) | norwegian answer | grammar rule | `E` | N |

All five shapes are attested in the stock bundle, so none is an untested path.
Occurrence-set frequency across the 2790 stock cards:
`EN` 1124 · `N` 987 · `AEN` 376 · `A` 278 · `AE` 98 · `E` 58.

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

### Appending new cards to an existing deck

Since reordering is forbidden, each publish appends a block. Within that block
apply lag-11 interleave. For that to be possible the block needs enough entries:

| occurrences/card | min cards per publish to achieve lag 11 |
|---|---|
| 2 (`EN`) | ~6 |
| 3 (`AEN`) | ~4 |
| 1 (`A`, `N`) | n/a — no intra-card lag needed |

**Rule: hold `ready` notes with audio until a deck has ≥6 of them, then publish
that deck.** Smaller batches are allowed but will introduce a card's
occurrences close together on its first day only — mild, and SRS spaces them
out afterwards.

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
