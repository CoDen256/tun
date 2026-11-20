# Design — projector-examples-column

## Context

`projector.js` builds X for word and expression notes as
`<div class="left">${context_text.replaceAll('\n','<br>')}</div>`, or `""`
when there is no context. stabbur's paired change splits `context_text` into
`examples` once, by migration, and drops it (see that change's design D5/D6).

## Goals / Non-Goals

**Goals:**
- Project `examples` faithfully.
- Keep the markup unchanged for ordinary data.

**Non-Goals:**
- No fallback to `context_text`. The operator asked for no compatibility
  shims.
- No new card markup. No per-example styling.
- No change to listening, pronunciation or grammar faces, which never used
  context.

## Decisions

### D1 — Join with `<br>`, keep the wrapper
`X = examples.length ? '<div class="left">' + examples.join('<br>') + '</div>' : ""`.

- This is the same wrapper and the same separator the newline replacement
  produced, so single-newline data projects byte-identically.
- Blank or padded lines that the stabbur migration removed now render
  without them.
- Every publish regenerates minted content (`builder-pipeline`), so those
  cards update on the next run.

Alternative rejected: one `<div>` per example. It changes the card's look
on the device, and that was not asked for.

### D2 — No fallback
- A note payload without `examples` projects an empty X.
- The builder never reads `context_text`. A stale stabbur therefore shows up
  as missing examples in the forecast's content diff, not as silently
  "working" on the old field.

## Risks / Trade-offs

- [The builder is deployed before stabbur migrates] → Examples vanish from
  every card's X on the next publish. Mitigation: the operator checklist
  orders stabbur first, then the builder, in one rollout. Before the first
  publish, a forecast shows the content diff.
