## Why

D148 records phonexa as the one service routed by **subdomain rather than by
path**, and `add-phonexa-to-stack` (implemented 2026-11-12) wrote that into
`DEPLOY.md` as a DNS prerequisite and into `docs/02-services.md` as a standing
fact. The operator has since directed that phonexa be routed like every other
service: `https://<host>/phonexa/`, no subdomain.

D148's reasoning was sound for the code as it stood — phonexa's frontend
hardcoded absolute `fetch('/api/v1/…')` paths and opened its live-mic WebSocket
at `location.host + '/stream'`, with `js/realtime.js` frozen. The sibling changes
remove that premise: phonexa's `path-prefix-routing` adopts the same
`X-Forwarded-Prefix` → `window.PHONEXA_PREFIX` → `API_BASE` pattern stabbur (D46)
and smia (D119) already use, and mjolnir's `phonexa-path-block` replaces the site
block with a `handle_path /phonexa/*`.

`tun` ships no deployable artifacts (D84), so this change is **documentation and
decisions only** — but those are the operator-facing surface, and leaving them
asserting a DNS record that is no longer needed is worse than leaving them
silent.

## What Changes

- `docs/07-decisions.md`: supersede D148's **routing** half and keep its **auth**
  half. The new ADR records path-prefix routing, the `X-Forwarded-Prefix`
  pattern being applied for the third time, the freeze amendment in phonexa that
  made it possible, and the shared-origin trade-off the operator accepted. D148
  is annotated, not deleted — its verified Caddy/compose findings stay findable.
- `docs/07-decisions.md`: amend D147's "Routing is by **subdomain, not `/phonexa`
  path** (see D148)" clause.
- `docs/02-services.md`: phonexa is routed by path like the others.
- `DEPLOY.md`: drop the DNS A/AAAA step and `PHONEXA_SITE_ADDRESS` from the
  phonexa section; keep hash generation, quoting and rotation; state the shared
  origin; note the bare-path redirect so an operator who types `/phonexa` and
  gets a broken page knows why.
- `docs/08-pitfalls.md`: add the relative-asset/trailing-slash trap if it is not
  already covered — it is the one failure here that looks like a different bug
  (a blank page, assets 404ing against the main site's catch-all).

**Non-goals:**
- No compose change. phonexa joins the stack exactly as `add-phonexa-to-stack`
  left it; `include:`, the backup service and the audio mirror are untouched.
- No change to the backup set, the restore procedure or the audio staleness rule.
- No Caddy work (mjolnir's `phonexa-path-block`) and no phonexa code work
  (phonexa's `path-prefix-routing`).
- D148's auth decision is not reopened: the gate stays Caddy `basic_auth` on the
  operator token's hash.

## Capabilities

### New Capabilities
- None.

### Modified Capabilities
- `unified-deployment`: how phonexa is reached is restated as a path prefix on the
  main site, with no DNS prerequisite.

## Impact

- `docs/07-decisions.md` (new ADR + two annotations), `docs/02-services.md`,
  `DEPLOY.md`, possibly `docs/08-pitfalls.md`.
- Operators lose a DNS prerequisite and one `.env` variable; they gain a
  shared-origin consequence worth stating once, plainly.
- Depends on both sibling changes for the statements to be true; this change
  should land **last** of the three, since it documents the end state.
