# hover-translate-fixes

## Hover translate fixes — capture-and-tooltip-ux

Implemented, code-reviewed (4 defects found and fixed), and live-tested
against the staged build in a real Chrome profile with the dev stack
running. Live testing found and fixed one more defect — see below. Not
everything could be driven by browser automation; what's still unverified
is listed at the end.

### Deploy notes

No schema or migration (no stabbur change in this package).

```
cd hover-translate
npm run stage:chrome:dev   # rebuilds extension + popup, re-stages staging/chrome
```

Load `hover-translate/staging/chrome` unpacked, or reload it in
`chrome://extensions` if already loaded — **a reload is required**, content
script CSS/manifest changes don't pick up on a page refresh alone.

Two shortcuts changed meaning; re-check `chrome://extensions/shortcuts` if
Chrome kept an old binding:
- `Alt+Shift+R` now shows/hides the recording pill instead of starting a
  recording directly.
- `Alt+N` is new (command id `open-quick-note`), opens the popup on Quick
  Note.

### Live-verified in this session (claude-in-chrome against a real profile)

- **T1 — the headline fix.** Confirmed directly: simulated the player's
  caption font-size at 50%/100%/200% (11.25px/22.5px/45px) and the
  tooltip's own computed `font-size` stayed exactly `16px` throughout.
- **T3/T4/T9** — computed style inspection confirmed the tooltip's font
  family and colors never match the host page's (fixed values throughout),
  and the 1-provider/1-language case renders as a clean small card, not a
  broken table.
- **A1, A9, A14** — the pill shows idle (no recording, clock at 0:00),
  survives a full page reload, and close-while-idle hides it cleanly with
  no stray state left in `sessionStorage`.
- **A3, A4, A5** — clicking Start on the pill began a real tab recording
  (elapsed clock visibly advanced, e.g. 0:00 → 0:10), Stop ended it and the
  pill stayed visible in an idle state, and the idle-after-a-take flag
  (`ht-pill-has-recorded`) was set, which drives A5's distinguishable dot
  color.

**One real bug found and fixed as a direct result of this testing**: the
entire band-and-chip tooltip CSS (`translationsBlock.css`) was silently
never loading in the browser. It was wired in via `@import` from the
content script's declared `styles.css`, but Chrome's content-script CSS
injection does not honor `@import` — the tooltip was rendering as bare,
unstyled divs inheriting the host page's own font/color at the point of
injection (worse than the original bug: inconsistent per-page rather than
consistently wrong). Fixed by listing both CSS files directly in the
manifest's `content_scripts.css` array. Re-verified after the fix (see T1
above, done post-fix).

### Still needs a manual pass

Two categories of acceptance criteria could not be driven by browser
automation in this session, for environment reasons, not product reasons:

1. **Anything needing the extension's own popup pages** (Settings,
   Quick Note, Customize, the Audio tab's slice selector) —
   `chrome-extension://` URLs are outside this automation's reach. Covers
   **N1–N14, A16–A25**, and the Settings-driven backend configuration
   needed to see real (not "not configured") translations anywhere.
2. **Anything triggered only by the OS-level keyboard shortcut or the
   native right-click menu** — synthetic `Alt+Shift+C`/`Alt+Shift+R` key
   presses did not reach `chrome.commands` in this sandbox (observed side
   effect: a page reload, not the command firing), and the native context
   menu did not render in a way this tooling could click. Covers **C1–C20**
   (the inline capture popup's two trigger paths) and the equivalent
   shortcut/menu path for the pill (its *behavior* once shown was verified
   above by setting its visibility flag directly).

Please run these live: open the popup, configure Settings with a real
backend host + operator token, then work through
`hover-translate/extension/openspec/changes/capture-and-tooltip-ux/acceptance.md`'s
N, C, and remaining A/T criteria with a real `Alt+Shift+C` / `Alt+Shift+R`
keypress and a real right-click.
