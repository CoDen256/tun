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
`hover-translate/openspec/changes/capture-and-tooltip-ux/acceptance.md`'s
N, C, and remaining A/T criteria with a real `Alt+Shift+C` / `Alt+Shift+R`
keypress and a real right-click.

---

## Sizing, click-to-capture, audio page — sizing-and-surface-fixes

Implemented across three waves, code-reviewed (8 findings, all fixed), and
browser-tested against the staged build with the dev stack running. Testing
found two further defects, both fixed. **21 of 37 criteria could not be
observed at all** — see the honest accounting below; that is the bulk of what
you need to test live.

### Deploy notes

No schema, no migration on the server side. No stabbur change in this package.

```
cd hover-translate
npm run stage:chrome:dev   # rebuilds all three units, re-stages staging/chrome
```

Then **reload** the extension in `chrome://extensions` — a page refresh is not
enough, content-script CSS and the manifest both changed.

**One client-side migration runs automatically on load.** A stored
`tooltipTheme: {size: "small"|"medium"|"large"}` is mapped onto 11/13/16px for
both text sizes, with widths set to the 400px default; the older eight-field
caption-mirroring theme resolves to defaults. Nothing is lost silently, but if
you had picked Large you will now see 16px rather than a named step.

### Two shortcuts and one setting changed meaning

- `leftClickAction` **is gone from Settings**, along with its copy-original and
  copy-translation options. A plain left click on a hovered subtitle word now
  opens the capture surface; `Shift`+click saves to the local dictionary.
- Customize no longer has a Small/Medium/Large select. It has **four sliders**:
  tooltip text size and width, note-surface text size and width (11–32px /
  320–900px, defaults 13px / 400px).

### Verified by the tester, in a real browser

- **S3, the one that mattered most** — at the defaults nothing changed:
  tooltip measured 13px base, 400px clamp for a single word, 520px for a
  phrase; inline popup 400px wide, 13px base.
- **S12** — caption font-size driven to 10.93 / 21.87 / 43.73px; the tooltip
  stayed **13px in all three**. Package 1's headline fix is not regressed.
- **S7** — at 24px the provider gutter grew 52→96px and the language column
  30→55px, so the layout scales rather than just the glyphs.
- **H1** — the hovered word no longer appears inside the tooltip (DOM
  inspected, not eyeballed).
- **X1, X2** — the `esc` close button is visible at rest and dismisses without
  sending (stabbur draft count 29 before and after, no POST logged).
- **K1, K2, K4, K7** — clicking a hovered word opens the surface prefilled
  with that word plus its context; Shift+click shows the saved confirmation
  and opens no surface; a fast click never opened an empty surface.

### What you need to test live, and why

**Everything on an extension page.** `chrome-extension://` is blocked at the
scheme level by the test automation, so none of this was observed:

1. **Customize (S1, S5, S6, S13–S16)** — that the four sliders exist, move
   independently, preview live, reset to defaults, and that a stored legacy
   named size loads without breaking. The *mechanism* was verified by
   injecting the CSS properties directly; the **settings-to-surface path was
   never observed for any sizing criterion**. This is the biggest gap.
2. **Quick Note and the audio send form (S10, S11)** — that the note-surface
   size reaches their translations blocks.
3. **The whole Audio page (D1–D8)** — the restyle onto the `ns-*` primitives,
   the translations block on the note form, the slice selector, Start/Stop,
   Assign to note, Discard, the Sent history and Re-home. **Watch the Sent
   history specifically**: it was rendering a check mark on *failed* sends;
   that is fixed, so confirm a failed send now shows a cross, not a ✓.
4. **K5** — that Settings no longer offers an on-left-click control.

**The two tester-found defects, fixed but never re-verified in a browser:**

5. The capture surface was rendering partly off-screen with **"Send capture"
   below the fold** (it measured 527–689px against a 612px viewport while the
   code assumed 520px). Placement now reads the real measured height. Confirm
   the Send button is reachable without scrolling, and that at a large
   configured size (32px / 900px) on a short window the surface scrolls
   *internally* with its bar pinned, rather than overflowing the page.
6. **Escape only dismissed with focus inside the surface.** Now a
   document-level handler dismisses whenever it is open. Note it calls
   `stopPropagation()`, so Escape no longer also exits YouTube fullscreen
   while the surface is up — confirm that is what you want.

**H2 — unresolved, and possibly a real failure.** The fallback state could not
be induced. The tester stopped `smia-backend` and the tooltip resolved
*identically* via a provider labelled `google`, and the gateway logged **zero**
requests from the extension across the whole session (only the tester's own
curls). So every tooltip observed appears to have come from the bundled local
translator — in which case the fallback **marker** and the new `.tt-foot`
"smia unreachable" strip should have been visible and were not. Check: with the
extension pointed at a reachable backend, stop smia and confirm the strip
appears below the last band. If it does not, that is a defect in the T2
rehoming, not an environment artefact.

**Two captures may be queued or misdirected.** The tester clicked "Send
capture" twice (`Majestet`, `monark`) and nothing arrived in the local stack.
Either they are sitting in the extension's outbox and will flush on next
delivery, or the configured host is a different deployment and they landed
there. Worth confirming where.

### Not fixed here — for Quick Log

- `HoverHandlerFactory` / `DirectHoverHandler` / `DelegatedHoverHandler` /
  `IHoverHandler` are **dead code** (`createHoverHandler` has no caller), and
  each carries its own copy of the two defects just fixed in the live paths:
  an ungated `pointerup` and an `elementsFromPoint` click handler with no
  shadow-host guard. They never run, so they were left alone — but if anyone
  wires the factory up, both defects return. Delete the trio or fix it.
- A long provider label (`google (fallback)`) is `white-space: nowrap` in the
  gutter column and overflows into the chip column. Pre-existing; now does so
  proportionally at every scale.
- The note-surface **width** slider reaches only the inline capture popup —
  Quick Note and the audio form take their width from the popup window. Within
  contract (acceptance only tests text size there, and the preview is labelled
  "inline capture popup"), but it may surprise you.
