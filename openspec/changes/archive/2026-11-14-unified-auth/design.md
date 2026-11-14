## Context

Auth accreted one service at a time. Each addition was locally reasonable:
D-S6 gave smia a bearer token, D-N1 copied it to stabbur, D-H6 added a cookie
for hub because server-rendered pages cannot send a custom header, D148 bolted
`basic_auth` onto the gateway for phonexa because phonexa has no auth of its
own. The result is four secrets, three mechanisms and `.env.example` files whose
bulk is prose explaining which value must be copied where.

## The finding that dictates the order

```js
// patches/js/2080-progress-sync-shim.edited.js:91
Authorization: 'Bearer ' + SYNC_TOKEN
```
```js
// hub/src/server.js:1449, reached only after requireAuth()
// "gated by the same shared operator-auth check above (task 4.2's
//  decision), not a separate device token"
```

`SYNC_TOKEN` is a distinct *named* slot in the patch, but its *value* is the
operator token, and hub validates it as such. So:

- rotating `OPERATOR_AUTH_TOKEN` breaks device sync today, silently;
- the phone holds a credential that opens the entire operator console;
- any change to operator authentication breaks the phone unless the device path
  is carved out first.

The third point is the hard constraint. It is why this change is sequenced the
way it is, and why the carve-out ships and is verified before anything about
operator auth changes.

The fix is cheap precisely because the slot is already separately named: give
`SYNC_TOKEN` its own value and gate `/mjolnir/userdata/*` on it. From the
device's side the wire is identical — same header, same format, same path —
only the string differs. `patches/js/config-rotate.js` and D39's `config.json`
already exist to change it without an APK rebuild.

That last step is nonetheless **optional and deliberately last**. The carve-out
alone (gateway validating the current value) delivers the entire structural
benefit with zero device risk. Changing the value is a device-coordinated
operation to take on its own schedule, or never.

## Decision — authentication lives inside the gateway

An earlier draft proposed `vakt`: a small stateless service, `forward_auth`, a
real login page, HMAC cookie, logout. The operator accepted it conditionally —
*"as long as it caches the login"*.

It has to be withdrawn, because it contradicts `zone-isolation`. Caddy has no
`forward_auth` response cache, so every request to every zone becomes a live
call to `vakt`. One container down means all eight zones 401 simultaneously —
precisely the coupling this effort exists to remove. The cookie caches the
*login*; nothing caches the *availability*.

| | login UI | logout | runtime dependency | build |
|---|---|---|---|---|
| **`basic_auth` (chosen)** | browser prompt | no | **none** | stock image |
| `caddy-security` plugin | real page | yes | none | custom `xcaddy` |
| ~~`vakt`~~ | real page | yes | **every request** | stock + a service |

`basic_auth` is the only option that is both zero-dependency and zero-build.
Browsers cache Basic credentials for the session, so the operator is prompted
once; the extension sets the header itself. The operator has stated they do not
want a logout button, which is the only real cost. `caddy-security` remains a
drop-in upgrade that keeps the zero-dependency property if the prompt grates.

**Cost factor 10, not 14.** The credential is a 32-byte random token: its
entropy is the defence, not the hash cost. Cost 14 burns CPU on every request to
protect against guessing something nobody will guess.

**Derived at container start** from `OPERATOR_TOKEN`, which is what retires the
manual hash ritual and both of its pitfalls. P36 exists because a bcrypt hash
contains `$` and Compose interpolates it, mangling the value into something that
still *looks* like a hash — invisible until every login fails. P35 exists
because the valueless key form resolves from the wrong `.env` under `include:`.
Neither can recur once nothing types a hash.

## Decision — services trust a gateway marker, or the internal token

```
 allow if  the gateway-verified marker header is present
 allow if  Authorization: Bearer INTERNAL_TOKEN
 else      401
```

The marker is only trustworthy because the gateway strips any inbound copy
before proxying and because services publish no port outside the loopback
interface in production. Both are requirements below, not conventions — the
whole model rests on them.

Service-to-service calls never pass through the gateway (builder → stabbur,
stabbur → smia, shadow → smia, shadow → phonexa), so the internal token is
retained rather than trusting the network. The operator asked for this
explicitly. It costs one value and keeps services honest if one is ever exposed.

## Decision — delete the carve-outs rather than port them

Each carve-out existed for a reason that the gateway removes:

| carve-out | why it existed | why it goes |
|---|---|---|
| `/ui` unauthenticated | an operator had to paste a token into the page | there is one login now |
| `/blob/<sha256>` | `<audio src>` cannot send a header | a browser credential covers it |
| `/api/enrich/tts/preview/<sha>` | same | same |
| `OPTIONS` | preflight carries no credential | moves to the gateway |

The `OPTIONS` case is the one that must be handled *in* the gateway rather than
simply dropped: a preflight that reaches the auth check fails before the real
request is ever sent, and the failure appears as a CORS error rather than an
auth error. This is the easiest thing in the change to get wrong, so it is
written down where the rule lives.

The device's own top-level `/blob/*` is a different route in a different zone
and remains open: the hash in the URL is the capability, unchanged.

## Risks

**Breaking the device.** Mitigated by ordering, by a byte-level before/after
comparison of a real device request, and by the fact that step 1 changes no
value the device sends. If step 1 is wrong, it is wrong while the device is
still sending exactly what it sent yesterday — a reversible configuration error,
not a field problem.

**Gateway rule ordering.** The device blocks must match before the operator
gate. A misordered rule sends device traffic into a `basic_auth` challenge. The
Caddyfile already carries a hard-won comment about ordering: a bare directive
mixed into a file that otherwise uses `handle` blocks compiles *after* the
catch-all and silently never runs. Verified with
`caddy adapt --adapter caddyfile`, not by reading.

**One shared origin, one credential.** D148 already accepted that hub's
`Path=/` cookie is sent by the browser on requests phonexa pages make. With
`basic_auth` this becomes the design rather than an accepted cost: one
credential covering every operator zone on one origin. Appropriate for a
single-operator system; stated so it is a decision.

**No logout.** Closing the browser clears it. Accepted by the operator
explicitly.

## Alternatives considered

- **`vakt` with `forward_auth`.** Withdrawn above — contradicts the isolation
  requirement that motivated the whole effort.
- **Keep per-service auth, unify only the secret.** Rejected: it keeps three
  implementations and every carve-out, and leaves adminer unprotected.
- **Trust the Docker network, drop the internal token.** Rejected by operator
  direction.
