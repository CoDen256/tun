## Context

`phonexa-site-block` shipped four hours before this change was written. Its
routing half rests on one premise — phonexa's frontend cannot be told what prefix
it is mounted under — which phonexa's `path-prefix-routing` change removes by
adopting the `X-Forwarded-Prefix` pattern `stabbur` and `smia` already use. Its
auth half rests on a different premise — phonexa has no authentication of its own
and exposes destructive endpoints — which is unchanged and stays enforced here.

This is therefore a **supersede of the routing half only**. The site block's
verified findings stay on the record and are worth not re-deriving:

- `basic_auth` does **not** block a WebSocket upgrade (handshake returned 101
  with a correct `Sec-WebSocket-Accept`, frames flowed; 401 without credentials).
  No cookie fallback was needed then and none is needed now.
- A Caddy `{$VAR:default}` default **can** contain `$`, which is what makes the
  locked fail-closed hash work.
- Caddy falls back to that default only when the variable is **absent**, never
  when it is set-but-empty — which is why compose uses the valueless
  `PHONEXA_AUTH_HASH:` key form rather than `${PHONEXA_AUTH_HASH:-}`.

## Decisions

### 1. `handle_path`, placed with the other `handle` blocks
Copy the `/smia` block's shape exactly: `redir /phonexa /phonexa/ 308`, then
`handle_path /phonexa/* { … reverse_proxy {$PHONEXA_UPSTREAM} { header_up
X-Forwarded-Prefix /phonexa } }`.

The Caddyfile already carries a long comment explaining why this **must** be a
`handle`-family block: Caddy's global directive ordering places a bare
`reverse_proxy` *after* the whole `handle` group regardless of where it is
written, so the unconditional catch-all matches first and the bare directive
silently never runs. That was confirmed once via `caddy adapt` (route index 6 vs
the catch-all's 4) and cost a round of "every request 404s". Do not rediscover it.

### 2. The trailing-slash redirect is not cosmetic here
`/stabbur` already has one, with a comment. For phonexa it is load-bearing in a
stronger sense: phonexa's HTML uses **relative** asset and page links
(`css/index.css`, `js/shadow.js`, `shadow.html`). At `https://host/phonexa` with
no trailing slash the browser resolves those against `/`, producing
`/css/index.css` → mjolnir's catch-all 404 → a blank page with no obvious cause.

### 3. Auth moves from a site block to a handle block, unchanged in substance
`basic_auth { operator {$PHONEXA_AUTH_HASH:<locked default>} }` moves inside the
`handle_path`. Because `handle_path` strips before the proxy but the directives
inside run in order, the gate still covers every phonexa route uniformly —
static assets, `/ping`, and the destructive `/api/v1/admin/*` endpoints alike.

Worth stating: phonexa's `serve_static` route serves any file present in its
application directory, so "the gate covers everything" is not a nicety. It was
true under the site block and must stay true here.

### 4. Fail-closed loses its address half, keeps its hash half
Under a hostname there were two inert defaults: an address that never triggers
ACME, and a hash nobody knows. Under a path there is no address to make inert —
`/phonexa/*` is always matched. So the hash default does all the work: unset
`PHONEXA_AUTH_HASH` ⇒ 401 for everything, never an open proxy. With phonexa not
deployed at all, an authenticated request 502s, which is the same behaviour
`/stabbur` and `/smia` already have when their service is down.

### 5. Shared origin — the one thing genuinely given up
```
 before: phonexa.example.net  |  example.net      two origins
 after:  example.net/phonexa  |  example.net/…    one origin
```
hub's and builder's cookie is `HttpOnly; SameSite=Strict; Path=/`
(`hub/src/auth.js:85`, `builder/src/auth.js:84`). phonexa-origin JavaScript
cannot read it, but the browser sends it on same-origin requests, so a
stored-content XSS in phonexa could drive authenticated requests at `/mjolnir/…`.
Bounded by `basic_auth` standing in front of phonexa entirely. Accepted by the
operator (2026-11-12); recorded so it is a decision, not a later surprise.

### 6. Ordering with phonexa's change
phonexa's `path-prefix-routing` is backward compatible — with no
`X-Forwarded-Prefix` header its prefix is `""` and every URL is what it is today.
This change is **not** independently safe: stripping a prefix in front of a
backend that still emits root-absolute URLs produces a page whose every API call
escapes the prefix. Land phonexa first; this second. Reverting this block alone
restores a working (root-mounted, unreachable-from-outside) phonexa.

## Risks / Trade-offs

- **Supersedes a four-hour-old change.** Cheap in code, slightly expensive in ADR
  hygiene — handled by superseding rather than reverting, so the verified
  findings above survive in the record.
- **Browser credential caching changes scope.** The prompt now appears on the
  main hostname and credentials are cached for that whole origin, including the
  hub/builder paths that use their own cookie login. Two auth mechanisms on one
  origin is slightly confusing to a human, harmless to the machine.
- **One more `handle` block in an ordering-sensitive file.** Mitigated by placing
  it with the others and verifying with `caddy adapt` rather than by reading.

## Open Questions

- Whether a browser re-sends cached basic-auth credentials on the WebSocket
  handshake. Inherited unresolved from `phonexa-site-block` task 3.7; unchanged
  by moving the gate from a site block to a handle block, and still answerable
  only on a real deploy. If it fails, only the live mic tracker breaks and the
  fix is a cookie fallback.
