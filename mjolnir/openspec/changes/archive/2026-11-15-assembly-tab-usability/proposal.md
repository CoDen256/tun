# assembly-tab-usability

Batch `full-sweep`, package **Assembly tab usability** (D161 workflow,
`docs/15-agentic-workflow.md`). Three independent operator-facing
irritations in the bundle-tool workbench and in hub's Cards page.

## Why

1. **The Assemble tab asks for values it already knows.** Patch rev and
   Label each have a dedicated field, Label *also* exists as a `LABEL`
   placeholder row, and `PATCH_REV` — which `boot-ok-companion.js` really
   does bake as `__MJOLNIR_PATCH_REV__` — is not a placeholder row at all.
   The patch-rev hint says "auto-incremented to 17" next to a box the
   operator still finds empty. Three shapes for one idea.

2. **The Explorer tab cannot find a module by its number.** Its search box
   is a server-side full-text *source* search, so typing `2110` returns
   every module that `require`s 2110 and never module 2110 itself.

3. **The card preview does not look like the device.** Its CSS was
   hand-transcribed once and is missing most of the app's real style map —
   no `sup`, `supWrap`, `arialFont`, `arialFontNormal`, no font scaling, no
   real fonts. It draws three separate boxes where the app draws one card
   split into thirds. The operator therefore has to publish a bundle and
   open the phone to see how a card actually reads.

## What changes

- The Assemble tab's dedicated Label and Patch rev fields are removed; the
  placeholder list becomes the single home for every baked value, arriving
  prefilled with real resolved values.
- The Explorer tab's search gains module-number lookup alongside its
  existing source search.
- The card preview is regenerated from styles and fonts extracted out of
  the stock bundle itself, rendered in the app's real card geometry, with a
  class catalogue, a symbol catalogue, and a throwaway HTML editor.

## Non-goals

- Redefining what `PATCH_REV` / `DATA_VERSION` / `LABEL` *mean*. That is
  the `full-sweep` package "Builder UI rehaul & data versioning". This
  change only decides which fields exist and how they are filled, from
  whatever `/mjolnir/ota/assemble-defaults` returns.
- Anything on the device plane (`docs/11-ota-contract.md`). Nothing here
  touches the OTA contract, the bundle format, or the sync protocol.
- A pixel-perfect on-device renderer with gestures and SRS. The preview is
  a reading aid, not an emulator.
