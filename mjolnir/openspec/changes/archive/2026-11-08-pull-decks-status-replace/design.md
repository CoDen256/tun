## Context

`restoreFromDoc` (`patches/js/progress-sync-manual-companion.js:73-99`) ends
with:

```js
var currentDecksInfo = store.getState().deckStats.decks_info;
var mergedDecksInfo = decksLogic.initDecksStatus(currentDecksInfo, doc.decksStatus || []);
store.dispatch(deckActions.setDecksInfo(mergedDecksInfo));
```

`decksLogic.initDecksStatus` is **stock app code**, module 2110
(`index.android.bundle.exploded/2110.js:89-103`) — no existing mjolnir
patch touches module 2110 today. Its current body:

```js
initDecksStatus: function (n, u) {   // n = currentDecksInfo (local), u = incoming decksStatus
  for (var l = function (l) {
      var o = n.find(function (n) { return n.ID === u[l].ID; });
      if (o) o.PullCounter = u[l].PullCounter;        // update in place
      else {
        var f = t.default.find(function (n) { return n.ID === u[l].ID; });  // static deck defs
        var c = Object.assign({}, f);
        c.PullCounter = u[l].PullCounter, n.push(c);
      }
    }, o = 0; o < u.length; o++) l(o);
  return n;   // mutated `n`, unmatched entries untouched
},
```

This is an upsert-by-ID loop over the *incoming* array, mutating and
returning the *local* array `n`. Any entry already in `n` whose `ID` never
appears in `u` survives completely untouched — including its
`PullCounter`. That is the confirmed bug: a server doc with
`decksStatus` entries removed (not zeroed) for a deck leaves that deck's
local `PullCounter` exactly as it was before the pull.

By contrast, the same `restoreFromDoc` call handles `total_cards` as a
pure replace (`setTotalCards(doc.totalCards)` — whatever the reducer does
with it, the dispatched value is the server's array, not a merge of
old+new). `decks_info` is the only field in this restore sequence that
merges instead of replaces, and nothing in `progress-sync-manual-pull`'s
own design docs calls this out as intentional — it reads as an oversight
in behavior inherited from stock app code, not a deliberate choice.

## Goals / Non-Goals

**Goals:**
- Make `decks_info`/`PullCounter` restoration a full replace, matching the
  `total_cards` field's existing behavior and the documented "pull
  overwrites local" guarantee.
- Keep the fix scoped to `initDecksStatus` itself — no change to
  `progress-sync-manual-companion.js`'s call site, no change to the push
  direction (`getDecksStatus`/`pushCloudProgress`).

**Non-Goals:**
- Not fixing the deck-list screen's `Completion` percentage staleness
  (module 2119/`2219-end-of-trial.edited.js`'s `Ot()`, gated on
  `useEffect` deps that exclude the `decksInfo` prop). Confirmed as a
  separate, purely cosmetic staleness that self-corrects on the next
  mount/relaunch once the underlying `PullCounter` is correct — not
  addressed here, per explicit decision during exploration.
- Not changing `getDecksStatus` (push-side reader) or anything in
  `2080-progress-sync-shim.edited.js`.
- Not touching the static deck-defs module itself (`t`/`I.default` in
  2110/2119) — only `initDecksStatus`'s merge logic.

## Decisions

### D1 — Replace via `doc.decksStatus.map(...)`, not a two-pass merge-then-prune

New body (exact module ids/local var names to be confirmed against the
real bundle at patch-authoring time — this is the shape, not final code):

```js
initDecksStatus: function (currentDecksInfo, incoming) {
  var staticDefs = t.default;  // same static deck-defs reference the original used
  return incoming.map(function (entry) {
    var def = staticDefs.find(function (d) { return d.ID === entry.ID; });
    return Object.assign({}, def, { PullCounter: entry.PullCounter });
  });
},
```

This builds the result entirely from `incoming` (the server's
`decksStatus`), falling back to the static per-deck default object for any
fields `incoming` doesn't carry (it only ever carries `{ ID, PullCounter }`
per the companion's own comments). `currentDecksInfo` becomes unused by
this function — intentional, since the whole point is "server is the
source of truth after a pull," matching `setTotalCards`'s own behavior.

Alternative considered: keep the upsert loop but add a second pass that
resets any `n` entry absent from `u` to its static default
(`PullCounter: 0`). Rejected — more code to express the same outcome, and
still implicitly treats "absent from the deck's own static list" as a
case to worry about, when `incoming` is already authoritative and a plain
`.map` handles "deck exists in statics but absent from incoming" for free
via the lookup.

### D2 — New patch pair for module 2110, following existing convention

No mjolnir patch currently touches module 2110. This change adds
`2110-decks-logic.baseline.js` / `2110-decks-logic.edited.js`, following
the exact baseline/edited pairing already used for 968/2176/2219/1440/2080
— baseline captures the stock `initDecksStatus` verbatim (as quoted in
Context above) for future patch-back diffing, edited carries the replaced
implementation.

Alternative considered: patch `initDecksStatus`'s behavior from within
`progress-sync-manual-companion.js` instead (e.g. have the companion build
the replaced array itself and skip calling `decksLogic.initDecksStatus`
entirely). Rejected — `initDecksStatus` is also used by other callers in
the stock module (`getDecksStatus` and any other call sites in 2110 should
be checked at implementation time); patching the function itself fixes it
for every caller, not just this one, and keeps the "which module owns
this logic" boundary matching stock app structure rather than duplicating
decklogic inside a companion.

## Risks / Trade-offs

- **Other callers of `initDecksStatus` inside module 2110 (if any) also
  change behavior** → mitigation: confirm at implementation time (grep
  the exploded bundle for all `initDecksStatus` call sites) that nothing
  else relies on the old upsert-preserving-unmatched-entries behavior;
  the sign-in restore path (module 2205) is the other known consumer of
  similar restore logic and should be checked for whether it also calls
  this function with the same expectations.
- **`incoming` entries with no matching static def** → `Object.assign({},
  undefined, {...})` would silently drop base fields. Mitigation: confirm
  at implementation time whether this is reachable (a server doc
  referencing a deck ID no longer in the static deck list) and, if so,
  filter or fall back explicitly rather than relying on `Object.assign`'s
  silent undefined-spread behavior.

## Open Questions

- Should `0` (no `PullCounter` sent at all) and "deck entirely absent from
  `incoming`" be distinguished? Current design treats "absent from
  `incoming`" the same as any other deck not in the server's list — it
  simply won't appear in the result at all (matching `total_cards`'
  behavior of representing only what the server sent). Confirm this
  matches what the deck-list screen expects when a deck has literally
  never been pulled.
