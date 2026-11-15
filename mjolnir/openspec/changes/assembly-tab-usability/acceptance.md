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
