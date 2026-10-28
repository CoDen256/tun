# smia — the linguistics service

*Smia* = "the forge". One service for everything that turns raw text/audio into
enriched linguistic data. All five operations share one shape: **input in →
one provider called → cached → enriched out.**

> **Updated by `smia-service-foundation` (2026-10-21):** this doc originally
> described every endpoint as a "provider chain with fallback" (try provider A,
> fall back to B on failure). That model is gone — see D-S1 below. It also
> undersold the real provider landscape once `providers/`'s downloaded data was
> inspected (richer than naob/Forvo/piper); see D-S7 for the finalized lists.

It also removes duplicated provider code: translators currently live inside
hover-translate's content script, STT config inside phonexa's Shadowing page.

## Endpoints

Every endpoint is REST-ified around a content-addressed resource: `POST
/<kind>` creates-or-fetches (idempotent, id = `sha256(kind, provider, input)`),
`GET /<kind>/{id}` fetches without recomputation. The caller **names exactly
one provider per call** — no chain, no fallback, no fan-out (D-S1). `provider`
is required whenever a kind has 2+ providers configured, optional (defaulted)
when it has exactly one.

| Endpoint | In | Out | Providers (no particular order — caller's choice) |
|---|---|---|---|
| `POST /inflections` | `{word, lang, provider}` | `{provider, candidates: [{lemma, pos, paradigm}]}` | `ordbank` (Norsk Ordbank, local Postgres import, primary), `kaikki` (kaikki.org/Wiktionary `forms[]`, secondary) |
| `POST /ipa` | `{text, lang, provider}` | `{provider, candidates: [{ipa, variety}]}` | `nst` (NST NOFABET lexicon, dialect-aware), `kaikki` (`sounds[].ipa`), `ordbokene` (ordbokene.no API), `ipadict` (ipa-dict/nb), `wikipron` |
| `POST /tts` | `{text, lang, provider}` | `{provider, candidates: [{sha256, ...metadata}]}` | live at various points: `kaikki`, `dictcc_api`, `forvo`; `elevenlabs`/`filmot` need their own API key — check `GET /providers` for what's actually configured right now, this list drifts |
| `POST /stt` | audio body (multipart) + `{provider}` (always required, even with one configured) | `{provider, text}` | `hf_whisper` (Hugging Face Inference, whisper; cloud-only, self-hosted whisper dropped as too heavy), `elevenlabs` |
| `POST /translations` | `{text, from, to, provider}` | `{provider, candidates: [{text, context?}]}` — a candidate list like every other kind, confirmed live (D118); this doc previously said a single `{provider, text}`, which was wrong | `google`/`bing` (ported from hover-translate's `TranslatorFactory`), `deepl`, `dictcc_api`/`dictcc_static`; check `GET /providers` for what's live right now |
| `GET /providers` | — | full catalog, all kinds | — |
| `GET /health` | — | per-provider last-success/last-failure/quota (informational only — never changes routing) | — |
| `GET /ui` | — | provider health, cache hit rate, manual try-it (bypasses cache) | — |

The response always records **which provider answered**, because quality
varies a lot — this is now a required top-level `provider` field on every
response, not an aside.

## Design rules

- **No endpoint picks a winner among providers.** The caller names one
  provider; smia calls it, cache-first, and returns exactly what it got —
  including its failure, with no retry against a different provider (D-S1).
- **Candidates, not a single winner, wherever a provider's own data is
  inherently multi-valued** — not just `/inflections`' long-standing
  ambiguity (`skinner` = verb *or* noun plural), but also `/ipa` (a provider
  can hold several dialect/variety pronunciations) and `/tts` (several
  recordings/speakers).
- **Provider sets are declarative config**, not code paths — adding a
  provider is a new adapter module + a registry call, never a branch in the
  request-handling code (see smia's own `registry.py`/`adapters/`).
- **Everything is cached** on `(kind, provider, sha256(input))`.
- **`/tts`'s audio cache is smia's own, private, content-addressed, and NOT
  canonical** — distinct from any shared blob store. Callers (e.g. stabbur)
  that need durable audio copy bytes into their own storage.
- STT is cloud-only; the interface stays open for a local backend later (D17).

## Translation in the extension: fast-then-enrich

Hover must feel instant, and a round-trip to the VPS is not instant.

```
hover → render tooltip from the FAST local translator      (immediate)
      → async: GET smia /translations + /ipa + "already in your deck?"
      → enrich the tooltip in place                        (a moment later)
save  → the capture carries whatever has arrived
```

This resolves the "extension depends on the server for its core feature"
problem outright: if the server is down, hover still translates; only enrichment is
missing. It also means capture never waits on enrichment.
