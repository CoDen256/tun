## 1. Decision log

- [x] 1.1 Add the new ADR (**D149**): phonexa is routed by path prefix
      at `/phonexa/`, superseding D148's routing half; record the three-strikes
      lineage of the `X-Forwarded-Prefix` pattern (D46 stabbur → D119 smia →
      phonexa), the freeze amendment in phonexa that made it possible, the
      trailing-slash dependency, and the shared-origin trade-off the operator
      accepted
- [x] 1.2 Annotate D148 in place: mark the routing half superseded with a pointer
      to the new ADR; state explicitly that its auth half and its verified
      findings (`basic_auth` does not block a WS upgrade; `{$VAR:default}` can
      contain `$`; Caddy falls back only when a variable is absent, never when
      set-but-empty) remain current
- [x] 1.3 Amend D147's "Routing is by **subdomain, not `/phonexa` path** (see
      D148)" clause the same way — annotate, do not delete

## 2. Operator docs

- [x] 2.1 `DEPLOY.md`: rewrite the phonexa hostname/DNS/login section — drop the
      A/AAAA record and `PHONEXA_SITE_ADDRESS`; keep `caddy hash-password`, the
      single-quote rule, the rotation rule and what the browser shows; add the
      shared-origin note and the `/phonexa` → `/phonexa/` redirect
- [x] 2.2 `DEPLOY.md`: check the Adminer, backup-contents and restore sections for
      anything that assumed a separate phonexa hostname (they should be
      unaffected — verify rather than assume)
- [x] 2.3 `docs/02-services.md`: phonexa is routed by path like the others; remove
      the subdomain wording
- [x] 2.4 `docs/08-pitfalls.md`: add the bare-`/phonexa` trap — relative assets
      resolve against `/`, hit mjolnir's catch-all, and the page renders blank
      with 404s that point at the wrong service

## 3. Verification

- [x] 3.1 `grep -rn "subdomain\|PHONEXA_SITE_ADDRESS" DEPLOY.md docs/` returns only
      annotated-as-superseded occurrences — **done; two genuinely stale spots were
      found and fixed this way: P35's example variable (retired with D148's routing
      half) and D84's trailing "phonexa's subdomain routing lives there" clause**
- [ ] 3.2 Walk `DEPLOY.md`'s phonexa path end to end against the real deployed
      stack once all three changes have landed: no DNS step is missing, the hash
      step still works, `/phonexa/` loads — **needs the VPS. Every step was
      exercised locally while applying mjolnir's change (hash generation, the
      single-quote check, 401 → 200, `/phonexa/` loading against the real
      phonexa), but not as a walk-through of this guide on the real host**
- [x] 3.3 `docker compose config` from `tun` is unchanged by this change (it
      touches no compose file) — **confirmed: `compose.yaml` is not in this
      change's diff, and the merged config still renders all 12 services**

## 4. Sequencing

- [x] 4.1 Land after phonexa's `path-prefix-routing` and mjolnir's
      `phonexa-path-block` (`design.md` §5)
