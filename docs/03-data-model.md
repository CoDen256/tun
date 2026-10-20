# Data model: capture → item → card

> **Ownership split (D43).** This document spans two services. Read it with
> this line in mind:
>
> | owned by **stabbur** | owned by **mjolnir/hub** |
> |---|---|
> | `capture`, `item` (text, translations, context, audio, pos, inflections, transcription, kind, status), `grammar_rule`, audio blobs | `card_slots` (permanent 6-char ids), `decks` C20–C29, card **type a–e**, projection to N/E/X/A, occurrences, lag-11 interleave, `publications`, `build_jobs` |
>
> stabbur has no decks, no card ids, no occurrences, no N/E/X/A. The `item`
> sketch below still shows `type`, `deck_code` and `card_no` inline — those
> three live in hub's mirror of the item, not in stabbur. **This section needs
> a restructuring pass to reflect the split properly.**

## Three distinct entities (do not merge them)

| Entity | What it is | Lives in |
|---|---|---|
| **capture** | a raw lexical intent grabbed in the wild, unclassified | `stabbur.captures` |
| **item** | a triaged, enriched thing you intend to learn | `stabbur.items` |
| **card** | the Mjølnir projection of an item (N/E/X/A + occurrences) | generated, not stored |

A phonexa **`Token` is NOT a capture.** A Token is a *phoneme instance*
(char range + time range + `vowel_id`) feeding formant analysis. Different
lifecycle, different purpose. Promoting a capture's clip into a phonexa
`Sample` for vowel analysis is an optional, explicit action — a link, not the
storage model. Most items will never become Samples.

## Schemas (sketch)

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

item
  id, created_at, capture_id      -- provenance; null for manual entries
  type      a|b|c|d|e             -- see table below
  no_text                         -- the Norwegian side
  transcription, transcription_kind phonemic|phonetic, transcription_source
  pos, lemma                      -- type (a)
  inflections JSONB               -- type (a), POS-shaped (below)
  tr_en, tr_de
  context_text
  audio_blob  sha256              -- REQUIRED before status=ready
  audio_sel_ms [start, end]       -- trimmed during triage
  grammar_rule_id                 -- type (e)
  status    draft|ready|published
  deck_code, card_no              -- minted at publish, IMMUTABLE FOREVER

grammar_rule(id, title, html)     -- shared X across type (e) cards
decks(code, title, category, max_interval, auto_tick_streak, auto_hammer_count, enabled)
publications(build_id, base_version, patch_rev, data_rev, bundle_sha, created_at)
card_slots(deck_code, card_no, item_id, retired_bool)   -- the permanent ID ledger
```

### Inflection shapes (type a)

```
substantiv  {article, sg_indef, sg_def, pl_indef, pl_def}
adjektiv    {positiv, nøytrum, flertall, komparativ, superlativ}
verb        {infinitiv, presens, preteritum, perfektum}
adverb      {form}
other POS   {}        -- supported as type (a) with no inflections
```

## The five card types

| type | N (front) | E (back) | X (extra) | `A` | occurrences |
|---|---|---|---|---|---|
| **a** Word | word + inflection table (+ transcription) | en / de | context sentence | `N` | A, E, N |
| **b** Expression | phrase | en / de | context (optional) | `N` | A, E, N |
| **c** Listening | hard sentence | english | — | `N` | A |
| **d** Pronunciation | `"Read out: " + phrase` | **transcription** | — | `E` | N |
| **e** Grammar | question (translate/transform) | norwegian answer | grammar rule | `E` | N |

All five shapes are attested in the stock bundle, so none is an untested path.
Occurrence-set frequency across the 2790 stock cards:
`EN` 1124 · `N` 987 · `AEN` 376 · `A` 278 · `AE` 98 · `E` 58.

**Projection is pure**: type determines `A` and the occurrence list. Occurrences
are computed, never stored.

## Deck and ID scheme

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

### Deck allocation (one per type / PoS)

| code | contents |
|---|---|
| C20 | substantiv |
| C21 | adjektiv |
| C22 | verb |
| C23 | adverb |
| C24 | preposisjon |
| C25 | konjunksjon + subjunksjon |
| C26 | expressions (type b) |
| C27 | listening (type c) |
| C28 | pronunciation (type d) |
| C29 | grammar (type e) |

Decks are Mjølnir's pacing unit (`MaxInterval`, `AutoTickStreak`,
`AutoHammerCount` are per-deck), which is exactly why the split is by type/PoS.

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

**Rule: hold `ready` items until a deck has ≥6 of them, then publish that deck.**
Smaller batches are allowed but will introduce a card's occurrences close
together on its first day only — mild, and SRS spaces them out afterwards.

## Permanence rules (violating these corrupts progress)

1. **Card IDs are permanent.** Minted at publish into `card_slots`, never reused,
   never reassigned. Deleting an item leaves a tombstone.
2. **Published cards are append-only.** A card removed from the bundle leaves a
   live progress record that renders blank (`if(!N&&!E&&!X) getCard(ID)` returns
   nothing). Retire by moving to a disabled deck, never by removal.
3. **Never reorder a published deck's `Cards[]`.** See PullCounter above.
4. **Category deck blocks stay contiguous.** Append C20–C29 after C17 as one block.
