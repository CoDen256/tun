# hub

The device-facing service — **and**, since D80, operator-facing too. **Owns
the schema**: `card_slots`, `decks`, `publications`, `build_jobs`, `userdata`,
`userdata_history`, and its own ledger of which note ids are already minted
(never pushed back to stabbur, D44). `builder` is the only other process
that touches this database, and it has no schema of its own — see
`../builder/README.md`.

## Device-facing (the phone's only contact point)

- `GET  /ota/current.json`  → `{buildId, url, sha256, size}` (identity, never ordering — D26)
- static bundle + audio manifest + `blob/<sha256>` serving
- `GET/PATCH/POST /mjolnir/userdata/{uid}` — Firestore-shaped, field-merge,
  keyed by the real Firebase uid (D-S1)

Keeps a **per-build snapshot** of exactly the audio the device needs, so
studying never depends on `stabbur` being reachable (D45).

This protocol is effectively frozen — the phone is hard to update. Deploy it
independently of everything you iterate on.

## Operator-facing (D80)

A small UI at `/mjolnir` showing the **publish history** — every row of its
own `publications` table: `build_id`, the three separately-owned version
fields (`base_version`/`patch_rev` set by hand, `data_rev` bumped
automatically by `builder` on every publish — D77), `bundle_sha`, when it
shipped. Read-only here; the forecast and the "publish now" trigger live in
`builder`'s own UI, since that's where the underlying computation actually
runs — `hub` only ever shows what already happened, never a dry run of what
might.

See `tun/docs/02-services.md`, `03-data-model.md`, `04-delivery.md`, and
`05-sync.md`.
