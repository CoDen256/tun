# smia-ui-tts-polish — design

The accepted mockup (`mockups/inline-play.html`) is the design; build
against it. Key choices it settles:

- **Gutter control, not inline text.** Each line containing
  `"sha256": "<64 hex>"` gets a small round control in a fixed ~28 px left
  gutter. The control has no text node (glyph via CSS `::before`,
  `user-select: none`), so selecting/copying the response yields clean
  JSON.
- **States**: loading (spinner while `GET /tts/{sha256}` is fetched) →
  ▶ ready → ■ playing with a thin progress bar under the line → back to ▶
  when finished. A failed fetch shows ⚠ with the HTTP status and URL as a
  tooltip (hover; tap on touch) and cannot be played.
- **One at a time**: starting one stops any other; clicking the playing one
  stops it. Keyboard: Enter/Space activate.
- **Layout**: the result block does not wrap (`white-space: pre`) and
  scrolls horizontally inside itself; tables scroll inside their sections;
  no horizontal page scroll at phone width.
- Only `tts` responses get controls; other kinds render as today.

The mockup's "example: …" preset buttons and synthesized tones are mockup
affordances — not built.
