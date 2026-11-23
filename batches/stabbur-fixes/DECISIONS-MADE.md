# stabbur-fixes

Tier-2 decisions and diagnoses from `/tun-build`, one line each.

## Diagnoses the design required (tasks 1.1 and 2.1)

- [stabbur fixes] drag failed because the handle captured the pointer and listened on *itself* — confirmed in Chrome, the handle's own event log for one drag reads `pointerdown → gotpointercapture → pointermove → lostpointercapture` and then nothing, because the first `insertBefore` moves the handle in the DOM and that releases capture, so no further moves and no `pointerup` ever reached it and the save never ran; fixed by moving the drag listeners to `document`, bound once.
- [stabbur fixes] the "500" is a **502** from one translations provider, not a 500 — stabbur's proxy maps unreachable to 502 and otherwise passes smia's status through verbatim, smia wraps provider failures as `ProviderLookupError → 502`, and this stack's whole log history contains **zero** 500s and 14 502s, every one of them `POST /api/enrich/translations`; already contained to its own field, so what made it look like "nothing prefills" was the serial walk, fixed by D1's progressive fill.

## Tier-2 decisions

- [stabbur fixes] stale-proofing is a single global save counter plus an in-flight count, not per-key sequence numbers — a reply is adopted only when it is the newest save and nothing is in flight, which is the one rule that cannot clobber a *different* key changed meanwhile.
- [stabbur fixes] `PATCH /api/settings` still returns the full reconciled body — the page simply ignores it unless that rule holds, so no endpoint shape changed.
- [stabbur fixes] the 60 s catalogue cache lives in `routes/settings.py` as a process-global guarded by a lock, with a `reset_catalogue_cache()` test seam, because it is the only module that fetches the catalogue.
- [stabbur fixes] example prefill writes its rows **provider by provider** as each answers, rather than in one go, so the field fills progressively while keeping provider order.
- [stabbur fixes] the Examples sheet's per-provider count stepper re-asks that provider immediately on each press, rather than waiting for rerun, matching how the per-provider query row already behaves.
- [stabbur fixes] `test_downgrade_refuses` now names the irreversible revision (`f7a2c9d4e3b1-1`) instead of `-1`, which silently meant "whatever is head" and broke the moment a migration landed on top.
- [smia] the added full stop goes after any trailing closer (`«Kom hit»` → `«Kom hit».`), following D3's worked example rather than its "before those closers" prose, which contradicted it.
- [smia] no re-fill from the pre-slice list after de-duplication — on a cache hit that list no longer exists, and re-filling would make a hit and a miss return different lengths for the same request.
- [smia] text that is only punctuation is dropped like empty text, which D3 did not name.
- [smia] `smia/Dockerfile` now COPYs `example_text.py`; without it smia crash-looped on `ModuleNotFoundError` at boot.
- [stabbur fixes] M ≤ K is a database check constraint as well as an API check, because the API check is a read-then-write that two optimistic saves can both pass; the loser gets a 409.
- [stabbur fixes] writing Sentences per provider also freezes the resolved sheet count, so lowering it can never silently lower a sheet count the operator never set.
- [stabbur fixes] every `/api/*` read is `cache: 'no-store'` — a reload was observed picking up a stale settings body from Chrome's cache and asking providers for a count the operator had already changed.
