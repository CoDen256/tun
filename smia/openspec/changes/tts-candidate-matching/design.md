# tts-candidate-matching — design

## Decisions (operator, design session 2026-11-23)

### 1. Fuzzy tiers — only when exact misses

```
query ──► tier 1  exact casefolded text (today's behaviour)
            │ no rows
            ▼
          tier 2  normalize(query) == match_key
            │ no rows
            ▼
          tier 3  normalize(query minus trailing particles) == match_key
            │ no rows
            ▼
          {candidates: []}
```

The first tier with rows answers; tiers are never mixed. This supersedes
the `pygmalion-tts-provider` non-goal "no fuzzy matching" for this
provider only; `/inflect` still owns inflection — no lemmatisation here.

`normalize` (one function, used at import for the stored side and at
lookup for the query side):
- casefold, trim, collapse whitespace;
- drop surrounding punctuation (`Hallo!` → `hallo`, `Hva heter du?` →
  `hva heter du`);
- drop ONE leading article or infinitive marker: `å`, `en`, `ei`, `et`
  (and Nynorsk `ein`, `eit`) — only when something follows it;
- join ` + ` compounds (`bok + handel` → `bokhandel`; tolerate doubled
  spaces, `flagg  + stang`).

Tier 3 "particles afterwards": drop trailing tokens that are verb particles,
prepositions or the reflexive (`stille opp` → `stille`, `glede seg over` →
`glede`). The exact list is the builder's (tier 2), but it must include at
least `opp ned ut inn av på til med seg om fram frem bort igjen over`.

The stored side gets a `match_key` column in `pygmalion_audio`, filled at
import and indexed — so tier 2/3 are index lookups, not table scans. A
re-import fills it (deploy already truncates + re-imports for
`calst-full-coverage`).

### 2. Fuzzy candidates are labelled

A tier-2/3 candidate carries `context` = the stored word text it matched,
verbatim as stored (`"ei avis"`, `"bok + handel"`). Tier-1 candidates carry
no `context`. stabbur's audio list already displays `context`, so the label
shows up there without a stabbur change.

### 3. Speaker name goes in `voice` (dict.cc)

dict.cc human candidates gain `voice` = the dict.cc user name from the
recording key (`<recId>_<user>_<country>_lid81_v` → `<user>`). Operator
chose `voice` over a new `speaker` field: no new field, accepting that
`voice` means a dialect on `pygmalion` and a person on `dictcc_api`.

Which recording a candidate is: today the audio call fetches by entry id,
so with several Norwegian recordings on one entry it is unknown whose
voice came back. The builder first checks whether dict.cc's audio endpoint
can fetch a specific recording (by `recId`, or the key); if so, each
Norwegian recording becomes its own candidate with its own `voice`. If it
cannot, `voice` is set only when the entry has exactly one Norwegian
recording, and omitted otherwise — never guessed. The finding is recorded
in DECISIONS-MADE.md either way.

CALST / pygmalion: no names exist; `voice` stays the dialect.

## Non-Goals

- No `pos`/filtering changes (CLAUDE.md "ordering signal, never a filter").
- No cross-language dedup of dict.cc audio (that is the sibling backlog
  package "smia provider data, PoS ownership & responses").
- No fuzzy matching for other providers.

## Risks

- **False friends in tier 3** (`stille opp` answered by `stille`): accepted
  — it only fires when nothing closer exists, and `context` says so.
- **Stale cache**: `/tts` responses are cached by input without a version;
  deploy purges `lookup_cache` rows for (`tts`, `pygmalion`) and (`tts`,
  `dictcc_api`). Operator checklist step.
- **More dict.cc requests** if recordings are fetched one by one — bounded by
  the number of Norwegian recordings per entry (typically 1–3).
