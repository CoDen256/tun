
# request of translations + inflections
# the word must be clean lemma not inflected
lang: DE-EN
GET https://www.dict.cc/syn/app_translations.php?s=Warum&dir=1&lp=DEEN&appversioncode=260804

Accept:*/*

Accept-Encoding:gzip, deflate, br, zstd

Accept-Language:en-GB,en-US;q=0.9,en;q=0.8

Connection:keep-alive

Host:www.dict.cc


# request of translations + inflections
# the word must be clean lemma not inflected
lang: EN-NO
GET https://www.dict.cc/syn/app_translations.php?s=kalv&dir=2&lp=ENNO&appversioncode=260804


# response

```
{

"translations": [

{

"id": 528676,

"term1": "calf",

"term2": "kalv {m}",

"entry_type": "noun",

"subj_ids": ",25,",

"vt_usage": 0,

"sort_num": 16

}

],

"dir": 2,

"inflections": "<tr title=\"article indefinite.sg | definite.sg | indefinite.pl | definite.pl\"><td valign=\"top\"></td><td valign=\"top\"><b>NOUN</b>&nbsp;&nbsp;</td><td width=\"95%\" > en&nbsp;kalv <span class=\"infl_pipe\">|</span> kalven <span class=\"infl_pipe\">|</span> kalver <span class=\"infl_pipe\">|</span> kalvene </td></tr>",

"inflections_repl": " en&nbsp;kalv \tkalv\t;\t kalven \tkalven\t;\t kalver \tkalver\t;\t kalvene \tkalvene\t;\t",

"inflections_info": "<br><b>NOUN</b> &nbsp; article indefinite.sg | definite.sg | indefinite.pl | definite.pl"

}
```


# Recordings (tts)
GET https://audio.dict.cc/speak.audio.v2.php?error_as_text=1&type=mp3&id=528676&lang=NO_rec_ip&lp=ENNO&appversioncode=260804&text=kalv (human)

GET https://audio.dict.cc/speak.audio.v2.php?error_as_text=1&type=mp3&id=1335801&lang=rec&lp=ENNO&appversioncode=260804 (human the same as previous)

GET https://audio.dict.cc/speak.audio.v2.php?error_as_text=1&type=mp3&id=528676&lang=NO&lp=ENNO&appversioncode=260804&voice=Liv (robot)

# Which entries actually HAVE a human recording — `ajax_get_audiorecordings.php`

Added 2026-11-16 (`dictcc-parsing-fixes`), after the operator pointed at the
request the phone app makes. **This endpoint is the only reliable way to tell
a human recording from a computer-generated one.**

## The trap it replaces

`speak.audio.v2.php?...&lang=<L>_rec_ip` returns **audio bytes for almost
every entry**, synthesising when no human recording exists. So probing it
answers "can you make a sound for this", not "is there a recording". Measured
live: it answered for **all 29** `stille` entries in DE↔NO, including ones
with no Norwegian recording at all. Reading `source: "human"` off that probe
is wrong, and was the defect behind "dict_cc audios not everyone is present"
and "ignore computer generated ones".

Nor is there a signal in the entry payload. Its keys are exactly
`{id, term1, term2, entry_type, subj_ids, vt_usage, sort_num}` — no recording
flag. `vt_usage` looks promising on one example (9 for a human entry, 0 for a
synthetic-only one) and then **collapses on the full set**: `å stille krav`,
`å stille om`, `å stille klokka` and `å stille ut` are all `vt_usage: 0` and
all have real Norwegian recordings.

## Request

```
GET https://<lp>.dict.cc/dict/ajax_get_audiorecordings.php
    ?id_str=0+<id>+<id>+...&appversioncode=260804
```

- **Host is the pair, lowercased** — `deno.dict.cc`, `enno.dict.cc`. Not
  `www.dict.cc`.
- `id_str` is a **space-separated** list of entry ids with a **leading `0`**,
  in the order `app_translations.php` returned them. The preceding request is
  the ordinary one, e.g.
  `app_translations.php?s=stille&dir=2&lp=ENNO&appversioncode=260804`.
- One batched call covers every entry of a lookup — not one call per entry.

## Response

A single line, **space-separated, one token per requested id, in order**. The
leading `0` consumes the first token. Each token is a `|`-separated list of
recording keys.

An entry with no recordings contributes a literal **`0`** token — *not* an
empty string. (This paragraph first said "an empty token"; corrected
2026-11-17 by probing a bogus id alongside a real one, which returned
`'0 0 917015_krautteich_der_lid2_v|...  '`.) The response also ends with a
**trailing space**. Both details matter for the alignment check: `strip()`
then `split(" ")` yields exactly `len(ids) + 1` tokens, so a short response
is a genuine misalignment rather than an artefact of parsing, and the `0`
token simply parses to an empty lid set — the correct outcome.

A recording key is shaped:

```
<recordingId>_<username>_<country>_lid<N>_v
     1334012_  mtbboy1993 _   no   _ lid81 _v
      123211_  Artists    _   usr  _ lid1  _v
```

### `lid<N>` is the LANGUAGE of the recording — not the user, not the country

This was verified explicitly, because the whole filter depends on it:

| lid | language |
|---|---|
| `81` | Norwegian |
| `2` | German |
| `1` | English |

- **Two different users carry `lid81` for the same word**: `hus` in EN↔NO has
  recordings from `55S55` (country `noch`) *and* `mtbboy1993` (country `no`),
  both `lid81`. So it is not a user id.
- A dozen distinct users share `lid1`; another dozen share `lid2`.
- `lid2` appears only under `DENO`, `lid1` only under `ENNO`, `lid81` under
  both — a clean partition by language pair.
- `scabaret` (country `deusr`) carries `lid1`: a German-registered user who
  recorded the **English** side. The lid follows the recording's language,
  not the speaker's nationality.

One entry commonly carries recordings on **both** sides of the pair, which is
why the lid must be *matched* rather than merely counted.

## The rule

An entry has real human audio in language `L` **iff** it has a recording whose
`lid` is `L`'s id. Fetch `speak.audio.v2.php` only for those entries; skip the
rest entirely rather than fetching a synthesised stand-in.

**The `voice=Liv` request is never made at all** — that is dict.cc's
synthesiser (shown as "Liv" in its own UI) and is a separate request, not
something that needs filtering out of a response.

## Worked example — `stille`, Norwegian

Entries with no Norwegian recording, correctly yielding **no audio** while
still appearing in `/translations`:

| entry | lids | phrase |
|---|---|---|
| 2240021 | `2` only | `å stille opp noe` |
| 2266223 | `2` only | `å gå stille i dørene [idiom]` |
| 1223599 | `2` only | `Stille vann har dypest grunn.` |
| 1849840 | `1` only | `Stille vann har dypest grunn.` (EN↔NO) |

Result after the fix: **22 human candidates, 0 synthetic, ~3.5s** — against
103 candidates in 12.6s when every entry was probed for audio and the
synthetic voice was requested too.

## `lp`/`dir` for a self-lookup — a corrected trap

`_LANG_SELF_LOOKUP_PAIRS` read `("ENNO", 1)` for Norwegian until 2026-11-16.
`dir=1` means the queried word is on the **first** language of `lp`, i.e. it
asked dict.cc for *stille as an English word*. Measured:

```
s=stille&lp=ENNO&dir=1  ->  0 entries
s=stille&lp=ENNO&dir=2  -> 14 entries
```

Norwegian is the second language of **both** `DENO` and `ENNO`, so both are
`dir=2`. The wrong value made every Norwegian word's EN↔NO-only data — audio
*and* inflection tables — silently unreachable, which is the exact gap the
multi-pair list was added to close. `å stille klokka`, `å stille klokken` and
`å stille ut` exist only in that pair.

# One specific recording — `lang=rec&id=<recordingId>`

Added 2026-11-23 (`tts-candidate-matching`). The second request in the
"Recordings (tts)" block at the top (`id=…&lang=rec`) takes a **recording
id** — the `<recordingId>` of a key from `ajax_get_audiorecordings.php` —
not an entry id:

```
GET https://audio.dict.cc/speak.audio.v2.php?error_as_text=1&type=mp3&id=<recordingId>&lang=rec&lp=<LP>&appversioncode=260804
```

Verified live on `stille` (DENO entry 383115, keys
`126435_makro_atder_lid2_v|155195_Halmafelix_de_lid2_v|1334012_mtbboy1993_no_lid81_v`):

| request | bytes (sha256 prefix) |
|---|---|
| `id=383115&lang=NO_rec_ip` (entry-level) | `f35cecf2…` |
| `id=1334012&lang=rec` (mtbboy1993, lid81) | `f35cecf2…` — identical |
| `id=383115&lang=DE_rec_ip` (entry-level) | `be62fdf7…` |
| `id=155195&lang=rec` (Halmafelix, lid2) | `be62fdf7…` — identical |
| `id=126435&lang=rec` (makro, lid2) | `4cd089a1…` — a different take, unreachable entry-level |

So the entry-level call serves ONE of an entry's recordings (unknown whose);
`lang=rec` serves each one. The adapter therefore fetches every
requested-language recording by its id and returns one candidate per
recording with `voice` = the key's `<username>`. A recording id is global —
`1334012` is the same take on several entries and in both pairs — so it is
fetched once per lookup.

A nonsense recording id returned `text/html` (`Error: Bot detected!`), i.e. a
text error, not synthesis; keep request volume modest.
