## 1. Decision log

- [ ] 1.1 Add the new ADR (next free D-number): phonexa is routed by path prefix
      at `/phonexa/`, superseding D148's routing half; record the three-strikes
      lineage of the `X-Forwarded-Prefix` pattern (D46 stabbur → D119 smia →
      phonexa), the freeze amendment in phonexa that made it possible, the
      trailing-slash dependency, and the shared-origin trade-off the operator
      accepted
- [ ] 1.2 Annotate D148 in place: mark the routing half superseded with a pointer
      to the new ADR; state explicitly that its auth half and its verified
      findings (`basic_auth` does not block a WS upgrade; `{$VAR:default}` can
      contain `$`; Caddy falls back only when a variable is absent, never when
      set-but-empty) remain current
- [ ] 1.3 Amend D147's "Routing is by **subdomain, not `/phonexa` path** (see
      D148)" clause the same way — annotate, do not delete

## 2. Operator docs

- [ ] 2.1 `DEPLOY.md`: rewrite the phonexa hostname/DNS/login section — drop the
      A/AAAA record and `PHONEXA_SITE_ADDRESS`; keep `caddy hash-password`, the
      single-quote rule, the rotation rule and what the browser shows; add the
      shared-origin note and the `/phonexa` → `/phonexa/` redirect
- [ ] 2.2 `DEPLOY.md`: check the Adminer, backup-contents and restore sections for
      anything that assumed a separate phonexa hostname (they should be
      unaffected — verify rather than assume)
- [ ] 2.3 `docs/02-services.md`: phonexa is routed by path like the others; remove
      the subdomain wording
- [ ] 2.4 `docs/08-pitfalls.md`: add the bare-`/phonexa` trap — relative assets
      resolve against `/`, hit mjolnir's catch-all, and the page renders blank
      with 404s that point at the wrong service

## 3. Verification

- [ ] 3.1 `grep -rn "subdomain\|PHONEXA_SITE_ADDRESS" DEPLOY.md docs/` returns only
      annotated-as-superseded occurrences
- [ ] 3.2 Walk `DEPLOY.md`'s phonexa path end to end against the real deployed
      stack once all three changes have landed: no DNS step is missing, the hash
      step still works, `/phonexa/` loads
- [ ] 3.3 `docker compose config` from `tun` is unchanged by this change (it
      touches no compose file) — confirm, since the claim is load-bearing for
      "documentation only"

## 4. Sequencing

- [ ] 4.1 Land after phonexa's `path-prefix-routing` and mjolnir's
      `phonexa-path-block` (`design.md` §5)
