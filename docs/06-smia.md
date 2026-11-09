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
| `POST /ipa` | `{text, lang, provider}` | discriminated on `mode` (`ipa-multiword`): `{provider, mode: "phrase", candidates: [{ipa, variety?}]}` for a single word or a provider's own whole-phrase entry; `{provider, mode: "per_word", tokens: [{text, candidates}], joined?}` on a phrase miss — `joined` only when every token resolved to exactly one candidate | `nst` (NST NOFABET lexicon, dialect-aware), `kaikki` (`sounds[].ipa`), `ordbokene` (ordbokene.no API), `ipadict` (ipa-dict/nb), `wikipron` |
| `POST /tts` | `{text, lang, provider}` | `{provider, candidates: [{sha256, ...metadata}]}` | live at various points: `kaikki`, `dictcc_api`, `forvo`; `elevenlabs`/`filmot` need their own API key — check `GET /providers` for what's actually configured right now, this list drifts |
| `POST /stt` | audio body (multipart) + `{provider}` (always required, even with one configured) | `{provider, text}` | `hf_whisper` (Hugging Face Inference, whisper; cloud-only, self-hosted whisper dropped as too heavy), `elevenlabs` |
| `POST /translations` | `{text, from, to, provider}` | `{provider, candidates: [{text, context?}]}` — a candidate list like every other kind, confirmed live (D118); this doc previously said a single `{provider, text}`, which was wrong | `google`/`bing` (ported from hover-translate's `TranslatorFactory`), `deepl`, `dictcc_api`/`dictcc_static`; check `GET /providers` for what's live right now |
| `POST /examples` | `{text, lang, provider, limit?}` (`lang` only `nb`; `limit` defaults 3, clamped 1-10, part of the cache key) | `{provider, candidates: [{text, source?, sense?}]}` — no translation field, ever (D137) | `ordbokene` (live, sense-attached), `kaikki` (`senses[].examples[]`, filtered of morphology fragments), `tatoeba` (18,898 local sentences), `leipzig` (one provider spanning three local sub-corpora — `web_2020`/`news_2013`/`wikipedia_2014` — tagged per-candidate by `source`, same "one provider, several varieties" pattern as `nst`'s dialects) |
| `GET /providers` | — | full catalog, all kinds, plus a `counts` map (kind -> {provider: row count}) for providers backed by a local imported table — live/API/manual-link providers have no entry in `counts` | — |
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

## Translation in the extension: smia-primary, not fast-then-enrich

**Correction (D146): this section previously described a design that
`smia-translation-and-stabbur-capture` built differently. D32 is narrowed,
not deleted** — the "extension keeps working when the server is down"
property it names survives, but the mechanism is not "render fast-local
first, then async-enrich from smia." As actually built:

```
hover → fan out POST smia /translations, one call per configured
        (provider, targetLanguage) pair — NOT "GET /translations", and
        NOT a single combined call
      → each cell paints independently as its own request resolves
        (no Promise.all; a skeleton until then)
save  → the capture/note carries whatever translations were obtained,
        exactly as before
```

smia is the **primary** path, not an "enrichment" layered on top of a fast
local tier — there is no always-shown fast-local tooltip underneath it.
The local Google translator survives only as a **transport-failure
fallback** (smia unreachable, timeout, or 5xx) — never shown alongside a
successful smia answer, and never substituted for a provider's genuinely
empty result. `/ipa` and "already in your deck?" enrichment are explicitly
out of scope for the extension (the design's Non-Goals) — those stay
stabbur's editor's job, not hover-translate's.

This still resolves the "extension depends on the server for its core
feature" problem D32 names, by a different route: a transport failure
degrades to the local fallback rather than a blank tooltip. What it does
**not** preserve is instant-first-paint on every hover — with no
prefetch, an uncached word's first hover costs a real round trip to the
VPS per configured provider×language cell. That trade-off is deliberate
(`autoPause` is what makes it tolerable) and logged as an explicit risk,
not a silently dropped requirement.
