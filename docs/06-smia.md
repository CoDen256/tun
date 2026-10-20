# smia — the linguistics service

*Smia* = "the forge". One service for everything that turns raw text/audio into
enriched linguistic data, because all five operations have the same shape:
**input in → enriched out, several providers, chain with fallback, expensive
enough to cache.**

It also removes duplicated provider code: translators currently live inside
hover-translate's content script, STT config inside phonexa's Shadowing page.

## Endpoints

| Endpoint | In | Out | Provider chain |
|---|---|---|---|
| `POST /inflect` | `{word, lang}` | `{candidates: [{lemma, pos, paradigm}]}` | Norsk ordbank (local Postgres import) |
| `POST /ipa` | `{text, variety}` | `{phonemic?, phonetic?, source}` | naob.no (priority) → open-dict-data ipa-lookup/nb → espeak-ng g2p |
| `POST /tts` | `{text, voice}` | `{blob: sha256}` | Forvo (words, real humans) → deno.dict.cc → cloud TTS free tier → piper |
| `POST /stt` | `{audio}` | `{text, segments[]}` | cloud only (whisper dropped — too heavy to host) |
| `POST /translate` | `{text, from, to[]}` | `[{provider, lang, text}]` | lifted from hover-translate's `TranslatorFactory` + DeepL / LibreTranslate |
| `GET /ui` | — | provider health, cache hit rate, quota, manual try-it, re-run with a different chain | — |

Both phonemic and phonetic transcriptions are acceptable; the response always
records **which provider answered**, because quality varies a lot (naob is
phonemic-only and often unavailable; espeak always answers but is mediocre).

## Design rules

- **Provider chains are declarative config**, not code paths. Reordering a chain
  is a config edit.
- **Everything is cached** on `(kind, provider, sha256(input))`. NAOB has no
  public API (scraping), Forvo is rate-limited, cloud TTS costs money.
- **Audio output goes into the shared content-addressed blob store**, the same
  one serving phonexa samples and Mjølnir device audio. A TTS render and a
  YouTube slice are both just `blob/<sha256>`.
- **`/inflect` returns candidates, never one answer.** Norwegian surface forms
  are ambiguous (`skinner` = verb *or* noun plural). Triage picks; nothing
  auto-picks.
- STT is cloud-only but the interface stays open for a local backend later.

## Translation in the extension: fast-then-enrich

Hover must feel instant, and a round-trip to Strato is not instant.

```
hover → render tooltip from the FAST local translator      (immediate)
      → async: GET smia /translate + /ipa + "already in your deck?"
      → enrich the tooltip in place                        (a moment later)
save  → the capture carries whatever has arrived
```

This resolves the "extension depends on the server for its core feature"
problem outright: if Strato is down, hover still translates; only enrichment is
missing. It also means capture never waits on enrichment.
