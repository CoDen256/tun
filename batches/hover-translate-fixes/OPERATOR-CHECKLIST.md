# hover-translate-fixes

## Hover translate fixes — capture-and-tooltip-ux

**Status: implemented and code-reviewed, but NOT yet live-verified.** The
build's tester step (claude-in-chrome against the running dev stack) could
not run in this session — the Claude-in-Chrome browser bridge was not
connected (confirmed directly, not inferred). Everything below needs a
human pass before this package can be considered accepted.

### Deploy notes

No schema or migration involved (no stabbur change in this package). To try
it:

```
cd hover-translate
npm run stage:chrome:dev   # rebuilds extension + popup, re-stages staging/chrome
```

Load `hover-translate/staging/chrome` unpacked in Chrome. In the extension's
Settings page, set the backend host to the gateway (`http://localhost:8080`
in dev) and the operator token from the root `.env`'s `OPERATOR_AUTH_TOKEN`.

Two commands changed meaning and may need re-confirming in
`chrome://extensions/shortcuts` if Chrome preserved an old binding:
- `Alt+Shift+R` now shows/hides a recording pill — it no longer starts a
  recording by itself.
- `Alt+N` is a new shortcut (command id `open-quick-note`) that opens the
  popup on Quick Note.

### What to test live

Work through `hover-translate/extension/openspec/changes/capture-and-tooltip-ux/acceptance.md`
end to end — it has ~86 numbered criteria (N1–N14 note popup, A1–A25 audio
capture, C1–C20 capture selection, T1–T18 hover tooltip), each phrased as a
concrete thing to observe. Priority order if time is short:

1. **T1–T6** — hover a YouTube subtitle word, change the player's caption
   size (50/100/200%), confirm the tooltip's own text size never changes.
   This is the headline fix.
2. **N1–N5, N11–N14** — Quick Note's keyboard contract (Ctrl/Cmd+Enter
   saves, Enter alone is a newline, Escape closes), the restyled form, and
   that translations shown there are never saved to the note.
3. **C1–C14** — Alt+Shift+C (or the context menu) on a text selection opens
   an in-page popup and sends nothing until Ctrl+Enter; also try it with
   nothing selected.
4. **A1–A16** — the recording pill: Alt+Shift+R shows/hides it without
   starting a recording; start/stop from the pill; open a second tab and
   confirm it reports the first tab's recording and refuses to start a
   second one; close the pill mid-recording and confirm it stopped and
   saved; confirm the popup's own Audio-tab Start/Stop still works on a
   page the pill can't reach (e.g. `chrome://extensions`).
5. **A17–A25** — expand a local recording in the Audio tab, drag the
   slice handles, confirm only the selected range is sent and the full
   recording is still there if you cancel.

### Known gap, not re-verified after the fix

Code review (on `502b7f2..HEAD`) found and the build fixed four defects
before this checklist was written:
- `Alt+N` was bound to Chrome's reserved `_execute_action`, which doesn't
  dispatch to `onCommand` listeners — the Quick Note routing was dead code.
  Rebound to a plain command + `chrome.action.openPopup()`.
- `startRecording()` had a TOCTOU race across its awaits that let two
  near-simultaneous pill starts both pass the "already recording" guard,
  silently discarding the first recording. Now claimed synchronously.
- The pill's "is any other tab's pill visible" check defaulted the wrong
  way on a failed background round-trip (toward skipping the A15
  stop-and-save safety net instead of triggering it).
- `dispose()` never told the background a pill was gone, and real
  (cross-origin) navigation wasn't hooked at all, which could leave the
  background's cross-tab registry pointing at a tab that no longer exists.

These are fixed in the code but none of A1–A16 or A15 specifically has been
re-observed running — that re-check is part of the live pass above.
