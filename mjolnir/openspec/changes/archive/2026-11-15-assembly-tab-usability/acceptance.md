# Acceptance criteria — assembly-tab-usability

The review contract for the build phase. Every criterion is an observable
end state, confirmed by looking at the running UI in dev compose
(claude-in-chrome), never by reading code or trusting a log line. An agent
that did not write the code verifies these.

Dev setup assumed: the root stack up, the workbench reachable in embedded
mode (`/mjolnir/ota/assemble-defaults` answers 200), hub's Cards page
holding at least one minted card.

---

## Item 1 — Label and patch rev as prefilled placeholder rows

1. Opening the Assemble tab, the form pane contains **no** input labelled
   "Label" and **no** input labelled "Patch rev (logic version)". Searching
   the rendered DOM for `assemble-label` and `assemble-patch-rev` returns
   nothing.
2. The Placeholders list shows seven rows in this order: `PATCH_REV`,
   `LABEL`, `DATA_VERSION`, `BUILD_ID`, `SYNC_BASE_URL`, `SYNC_TOKEN`,
   `AUDIO_BASE_URL`.
3. The `PATCH_REV` row's **value input contains a number as typed text** —
   selecting the input and reading its value returns e.g. `17`, not the
   empty string. The number equals the one the tab's own hint text names.
4. The `LABEL` row's value input contains `<base_version>-patch<that same
   number>` as typed text.
5. The `DATA_VERSION` row's value input contains the most recent published
   data rev as typed text.
6. The `SYNC_BASE_URL` and `AUDIO_BASE_URL` rows contain the server's
   configured `https://…` URLs as typed text.
7. The `SYNC_TOKEN` row renders as a masked input whose value is non-empty.
   Clicking its reveal control changes the rendered characters to the clear
   token and clicking again re-masks it.
8. The `BUILD_ID` row is empty and carries visible text stating hub assigns
   it at submit time.
9. Pressing "Assemble & submit logic bundle" with nothing edited produces a
   result line naming `patch_rev` equal to the value from criterion 3 and
   the label from criterion 4. The new row on `/mjolnir/ota` shows the same
   two values.
10. Changing the `PATCH_REV` row to a different unused number and
    assembling produces a logic bundle whose `/mjolnir/ota` row shows
    **that** number — and the assembled bundle's baked
    `__MJOLNIR_PATCH_REV__` resolves to the same number (observable via the
    workbench's Explorer on the submitted bundle, or hub's baked-version
    readback, whichever the implementation exposes).
11. Changing the `LABEL` row and assembling produces a `/mjolnir/ota` row
    whose label is the edited value.
12. With the workbench run standalone (no hub reachable), the Assemble tab
    still shows all seven rows; `PATCH_REV`, `LABEL` and `DATA_VERSION` are
    empty and a visible hint states no server was reachable to suggest
    them.

---

## Item 2 — Explorer search by module number

13. With a session open whose module list contains module `2110`, typing
    `2110` into the Explorer search box renders, in this order: a single
    prominent jump row for module `2110` carrying its id, classification,
    size and verboseName and labelled as an exact-id match; then a group of
    ids containing `2110`; then the source-mention hits with snippets under
    their own heading.
14. Clicking that jump row opens module `2110` in the detail pane — the
    title reads `Module 2110`.
15. Typing a number that matches no module id renders no exact-id group at
    all (not an empty one), and the source hits render as before.
16. Typing `subscription` renders only the source-mention group, with
    snippets, and no id groups — i.e. unchanged from today's behaviour.
17. Clearing the box restores the full sorted module list, and the sort
    select still reorders it.

## Item 3 — card preview rendered from the bundle

**Geometry**

18. Opening a card's preview on hub's Cards page shows **one** bordered
    card, not three separate boxes, with two visible dividers that are
    noticeably narrower than the card (60% width, centred).
19. The three faces measure 0.28 / 0.28 / 0.44 of the card's height —
    measurable from the rendered elements — and the card's height tracks
    the simulated device height per `C = screenHeight − normalize(200)`.
20. Switching the simulated device from 375×812 to 768×1024 visibly
    changes both the card's width and height, and every font size rescales
    including the ×0.70 tablet factor (text is proportionally smaller
    relative to the frame than at 375).

**Scrolling**

21. Previewing a card whose X content is taller than the X face: the X
    face scrolls, and **at scroll position 0 its first line is fully
    visible** — nothing is cut off above. Scrolling reaches the last line.
22. The N face of the same card does not scroll.
23. A card whose faces all fit shows each face's content vertically
    centred within its face.

**Audio by tap**

24. No `<audio>` element exists anywhere in the rendered preview.
25. Clicking the face named by the card's `A` field, for a card whose clip
    is in the blob cache, plays the clip.
26. Clicking a face that is not the `A` face shows a brief visible
    indication that the face carries no audio, which then disappears, and
    plays nothing.
27. Clicking the `A` face of a card whose clip is absent from the blob
    cache shows a visible statement that the clip is unavailable.

**Styles and fonts**

28. Previewing a card containing
    `<div class="supWrap">k<div class="sup">j</div>(:)</div>` renders the
    `j` raised and visibly smaller than the `k`, on one line, not as plain
    inline text at body size.
29. Previewing a face containing
    `<span class="arialFontNormal"> &#649; </span>` renders ʉ in Arial —
    visibly a different typeface from the surrounding Poppins text — and
    not as a missing-glyph box.
30. Text in the preview renders in real Poppins, not a system sans
    fallback: the rendered font family resolves to a font hub serves.

**Catalogues**

31. The class catalogue lists `supWrap`, `sup`, `arialFont` and
    `arialFontNormal` — none of which the preview showed before this
    change — alongside the existing classes, each with the value it
    resolves to at the simulated width and a rendered sample. At width 375
    `arialFontNormal` reads as Arial 18px and `sup` as 11px.
32. The symbol catalogue lists `&#649;` with its glyph, its Unicode name,
    and its Poppins and Arial renderings side by side, which differ
    visibly. The Norwegian letters æ ø å appear in their own group.
33. Both catalogues carry visible text stating they are generated from the
    bundle.

**Throwaway editor**

34. Enabling the editor shows three textareas prefilled with the card's
    raw N, E and X HTML.
35. Typing into the X textarea re-renders the X face live, with the class
    map applied — adding `<span class="teal">x</span>` turns that text
    `#00A4BF`.
36. Clicking a style in the insert palette inserts that markup into the
    focused textarea and the face re-renders accordingly.
37. After editing, reloading the Cards page shows the card rendering from
    its stored content with no trace of the edit, and the card's row in
    the database is unchanged.
38. Pressing reset after editing restores all three textareas and all
    three faces to the minted card's own HTML.
39. A visible banner states that edits are not saved and are never sent to
    the builder.

**Regression guard**

40. The preview still expands inline under the card's own row in the Cards
    list, and opening a second card's preview collapses the first — at
    most one open at a time.
