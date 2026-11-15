# smia

*Smia: the forge — where raw material gets worked.*

The **linguistics** service of the [Tun](..) ecosystem — the `smia/`
directory of the one `tun` repository since D150, not a sibling checkout. One
place for every operation of the shape *input in → enriched out, several
providers, expensive enough to cache*.

**The API, the provider catalog and the design rules live in ONE place:
[`docs/06-smia.md`](../docs/06-smia.md) at the repository root.** This file
deliberately does not restate them — an earlier version carried its own
endpoint table (`/inflect`, `/translate`, naob→espeak chains, a `/ui` path)
that drifted years behind the real service; the live catalog is always
`GET /providers`.

In one breath: `POST /inflections | /ipa | /tts | /stt | /translations |
/examples` — content-addressed create-or-fetch, the caller names exactly one
provider per call (no chains, no fallback — D-S1), every response records
which provider answered. UI at the prefix root `/smia/`.

## Running it

```sh
cd smia && docker compose --env-file ../.env up -d   # standalone, backend on 127.0.0.1:5055
docker compose up -d smia-backend                    # or from the repo root
```

Provider data under `providers/` is **tracked in git** (a clone gives a
working smia) except the archives named in `scripts/bootstrap.py` — two of
which are absent from production, making ~9M imported corpus rows
non-re-importable from a clone (see `DEPLOY.md` §7: smia is deliberately not
in the backup set, so `providers/` is the thing to keep safe).

`smia/.env` holds only `HF_TOKEN`, `DEEPL_TOKEN`, `ELEVENLABS_TOKEN` —
optional; those providers fail at call time without them.

## Status

Deployed in the unified stack behind `/smia/` since D119; one shared
operator-auth check from `libs/` (D159); serves before it migrates (D157).

*Correction, 2026-11-13: this section used to read "Not implemented". That is
long false. Left recorded rather than silently replaced, per the
documentation convention.*
