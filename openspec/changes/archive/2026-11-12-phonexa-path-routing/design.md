## Context

`tun` ships no deployable artifacts (D84) — it owns `docs/`, `DEPLOY.md`, the
unifying `compose.yaml` and the backup service. This change touches only the
first two: the compose file, the backup service, the audio mirror and the restore
procedure from `add-phonexa-to-stack` are all unaffected by *how* phonexa is
routed.

What makes it worth a change rather than a drive-by edit is that D148 is a
recently-accepted decision with a stated rationale, and the honest way to reverse
half of a decision is to record why the premise changed.

## Decisions

### 1. Supersede D148's routing half; keep its auth half
D148 bundles two independent decisions under one row:

```
  D148  ┌─ routing: subdomain, not path      ← premise removed, supersede
        └─ auth:    Caddy basic_auth on the  ← premise intact, keep
                    operator token's hash
```

The routing premise was *"phonexa's frontend hardcodes absolute paths and
`js/realtime.js` is frozen"*. phonexa's `path-prefix-routing` change removes both
halves of that: the frontend becomes prefix-aware via the house
`X-Forwarded-Prefix` pattern, and the freeze is narrowed to the frame pipeline
and wire protocol — which is what it was always for — so two base-URL constants
can move.

The auth premise was *"phonexa has no authentication of its own and exposes
destructive endpoints, and `OPERATOR_AUTH_TOKEN` is enforced in hub's and
builder's application code, so there is nothing to reuse at the proxy."* Nothing
about that changed. The gate moves from a site block to a handle block; the
decision does not move at all.

### 2. Annotate, do not delete
Same discipline `add-phonexa-to-stack` used (its task 3.4: "annotate (not delete)
any line made stale"). D148 carries findings that cost real effort and are not
about routing:

- `basic_auth` does not block a WebSocket upgrade — verified at the protocol
  level, which is why no cookie fallback exists anywhere in the stack.
- A Caddy `{$VAR:default}` default can contain `$`.
- Caddy falls back to a default only when the variable is **absent**, never when
  set-but-empty — the reason compose uses the valueless-key form.

Deleting the row to "clean up" would take those with it. The new ADR points back
at D148 for them.

### 3. This is the third application of the same pattern — say so
D46 established it for stabbur; D119 applied it to smia and recorded the failure
mode in so many words: *"without it, every absolute asset/API request inside it
would escape the `/smia/*` proxy prefix and 404."* phonexa is the third. Writing
that lineage into the new ADR turns three separate incidents into one known
pattern: **a service joining this stack by path must be prefix-aware, and the
work is `X-Forwarded-Prefix` → injected global → one `API_BASE` constant.**

### 4. The trailing-slash trap belongs in pitfalls, not just DEPLOY.md
`/phonexa` without a trailing slash resolves phonexa's relative assets against
`/`, so they hit mjolnir's catch-all and the page renders blank. The symptom
(blank page, 404s on `/css/…`) points at the main site, not at phonexa or at the
missing slash. That is exactly the profile of a `08-pitfalls.md` entry: cheap to
recognise, expensive to diagnose cold.

### 5. Land last
```
  phonexa  path-prefix-routing   ← no-op without the header, safe anytime
     ↓
  mjolnir  phonexa-path-block    ← unsafe before phonexa's lands
     ↓
  tun      this change           ← documents the end state, so it goes last
```
Documentation that describes a state the stack is not yet in is worse than
documentation that lags by a day.

## Risks / Trade-offs

- **Reversing a four-hour-old decision looks like churn.** It is: the operator
  changed their mind about an operational trade-off, which is their call to make.
  The log records the reversal and its cause rather than quietly rewriting D148
  to look like it always said this.
- **Shared origin is a real security reduction**, accepted deliberately: hub's
  and builder's cookie is `Path=/`, so it rides along on requests a phonexa page
  initiates. Bounded by `basic_auth` in front of phonexa. Stated in `DEPLOY.md`
  rather than buried in an ADR, because it is the kind of thing an operator
  should be able to find.
- **One fewer isolation boundary, one fewer certificate, one fewer DNS record.**
  The simplification is the point; the cost is the line above.
