## Why

Four secrets, three verification mechanisms, five places a token is typed, and
one derived hash that nothing keeps in step:

```
 phone     ─OTA_TOKEN──────►  gateway /ota/*      header match in Caddy
 phone     ─SYNC_TOKEN─────►  hub                 Node, validated against OPERATOR_AUTH_TOKEN
 browser   ─cookie─────────►  hub, builder        Node cookie or bearer
 browser   ─basic──────────►  gateway /phonexa/*  bcrypt(OPERATOR_AUTH_TOKEN), derived BY HAND
 browser   ─bearer─────────►  stabbur             Flask middleware + 3 carve-outs
 browser   ─bearer─────────►  smia                Flask middleware + 2 carve-outs
 extension ─bearer─────────►  smia AND stabbur    holds BOTH raw tokens
 builder   ─bearer─────────►  stabbur             token copied into mjolnir/.env
 stabbur   ─bearer─────────►  smia                token copied into stabbur/.env
 phonexa   ─bearer─────────►  smia                token copied into phonexa/.env
 (adminer)                                        no auth at all
```

**The finding that shapes this change:** the device's `SYNC_TOKEN` is validated
against `OPERATOR_AUTH_TOKEN`. The phone holds an operator credential. Two
consequences: rotating the operator token silently breaks device sync today,
and *any* change to operator authentication breaks the phone unless the device
path is carved out first.

The operator's hard constraint is **not breaking the device**. That constraint
dictates the order of every task in this change.

## What Changes

**Three zones, three credentials, no overlap.**

```
 DEVICE PLANE      /ota/*  /blob/*  /audio-manifest/*   OTA_TOKEN   (unchanged)
                   /mjolnir/userdata/*                  SYNC_TOKEN  (own gate)
 OPERATOR PLANE    everything a human opens             OPERATOR_TOKEN
 INTERNAL          service to service, never via gateway INTERNAL_TOKEN
```

**The device plane is moved, never modified.** The `/ota/*`, `/blob/*` and
`/audio-manifest/*` blocks are relocated into `grind/Caddyfile` as a literal
copy: same token, same header, same `GET|HEAD` restriction (P23), same
`no-store` on the current descriptor (D26), same immutable caching, same
transport-only gzip (D49). `11-ota-contract.md` is not touched.

**`/mjolnir/userdata/*` gets its own gate, before anything else changes.** The
gateway validates `Bearer` against a value, and that value is initially
`OPERATOR_TOKEN` — exactly what the device sends today. The device sees no
difference whatsoever. Only after that is verified does the operator plane
change. Giving `SYNC_TOKEN` a distinct value is a later, optional, device-
coordinated step using the `config.json` mechanism D39 already provides.

**Operator auth becomes `basic_auth` in the gateway.** One credential, checked
inside Caddy itself, so authentication adds **zero new failure points** — the
decisive property given that `zone-isolation` exists to stop failures
propagating. The hash is derived at container start from `OPERATOR_TOKEN`,
which retires the manual `caddy hash-password` ritual, `PHONEXA_AUTH_HASH`,
P35 and P36 outright.

**Every service's auth module is deleted** and replaced by one check in `libs/`:
accept a gateway-verified marker header, or `INTERNAL_TOKEN`; otherwise 401.
The gateway strips any inbound copy of that header.

| | before | after |
|---|---|---|
| `stabbur/auth.py` | 45 lines, 3 carve-outs | `libs/pyservice/auth.py` |
| `smia/auth.py` | 50 lines, 2 carve-outs | same file |
| `hub/src/auth.js` + `builder/src/auth.js` | ~90 lines, duplicated | `libs/jsservice/auth.js` |
| phonexa | none + gateway basic_auth + manual bcrypt | same shared check |
| adminer | **nothing** | gated |

**Every carve-out is deleted, and each one is a tightening.** `/ui` existed
because an operator had to paste a token into an unauthenticated page — there is
one login now. `/blob/<sha256>` and the TTS preview were open because
`<audio src>` cannot send a header — a browser credential covers them. The
device's own top-level `/blob/*` stays open and untouched: different zone,
different path. smia's `OPTIONS` carve-out moves to the gateway, which must
answer CORS preflight **before** the auth check, since preflight carries no
credential by design.

**Every service's UI moves to its prefix root** — `/stabbur/` instead of
`/stabbur/ui`. This is the operator's `/ui` removal, and it also fixes a live
401: `https://coden256.dev/stabbur/` returns 401 today because stabbur has no
route at `/` while `/stabbur/ui` returns 200 (both verified 2026-11-13).

**hover-translate holds one credential instead of two**, sent to one origin.
It lives in its own repository (D154) and is the one client that cannot use a
browser session, so this change is coordinated there rather than here.

## Capabilities

### New Capabilities
- `device-plane`: the device-facing contract, frozen and stated as a
  requirement so a later change cannot erode it by accident.
- `operator-auth`: one credential, gateway-enforced, no per-service auth.

### Modified Capabilities
- `zone-isolation`: authentication must not introduce a shared failure point.

## Impact

- `grind/`, `libs/`, every service's auth module (deleted), every service's UI
  route, `hover-translate`'s configuration, `.env`.
- `docs/07-decisions.md`: D-H6, D-N1, D-S6 collapse into one; D148's auth half
  superseded; D46's `/ui` convention superseded; P35/P36 retired.
- D01 ("auth is a long random shared token") still holds — it is now three
  scoped tokens instead of one reused four ways.

**Non-goals:**
- No identity system, no per-client tokens, no scopes. D01 stands.
- No change to what the device sends. Not in this change, not as a side effect.
