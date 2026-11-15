# Tasks — assembly-tab-usability

## 1. Assemble tab: one prefilled list
- [ ] 1.1 `hub/src/ota.js` `assembleDefaults` returns resolved values —
      `nextPatchRev`, suggested `label`, `dataRev`, `syncBaseUrl`,
      `audioBaseUrl`, `syncToken` — replacing the `*Configured` booleans.
      Update the comment to record the reversal and its reasoning.
- [ ] 1.2 Remove the `assemble-label` and `assemble-patch-rev` fields from
      `src/ui-assets/index.html` and every reference in `app.js`.
- [ ] 1.3 Seed the placeholder rows in the agreed order and prefill them
      from `assembleDefaults`; `SYNC_TOKEN` masked with a reveal toggle;
      `BUILD_ID` blank with its "assigned at submit time" note.
- [ ] 1.4 `runAssemble` sends `patchRev`/`label` from the rows; drop the
      field-into-row reconciliation. Verify `assembleAndSubmit`'s
      `PATCH_REV` override is now identity.
- [ ] 1.5 Standalone mode: rows present, version rows blank, hint explains
      no server was reachable.
- [ ] 1.6 Update `hub/test/hub.test.js` for the new `assemble-defaults`
      payload.

## 2. Explorer: find a module by its number
- [ ] 2.1 Group the results list; render an exact-id jump row and an
      "ids containing" group for numeric queries, above the source hits.
- [ ] 2.2 Keep non-numeric behaviour identical; omit empty groups.
- [ ] 2.3 Id matching runs against the already-loaded module list — no new
      server round trip for the id groups.

## 3. Card preview from the bundle
- [ ] 3.1 Extractor reading `base/.../index.android.bundle`: tag styles,
      full class map, both themes, the `normalize` rule. Fails loudly on a
      map it cannot find. Never writes to `base/`.
- [ ] 3.2 Extract the IPA/Norwegian symbol inventory from stock card
      content for the symbol catalogue.
- [ ] 3.3 Serve the bundled Poppins family and `arial.ttf` from hub.
- [ ] 3.4 Render one card with the real geometry: 342 wide, derived C,
      .28/.28/.44 faces, 60% dividers, E and X scrolling, N not, centring
      that does not clip.
- [ ] 3.5 Tap-to-play per face; remove the `<audio>` control; handle the
      no-audio and missing-clip cases.
- [ ] 3.6 Class catalogue and symbol catalogue, both generated, both
      labelled as generated.
- [ ] 3.7 Throwaway editor: three live-rendering textareas, click-to-insert
      palette, not-saved banner, reset.
- [ ] 3.8 Label `#1B1D21` as a mapping from `archivedBackground` wherever
      it is surfaced.
