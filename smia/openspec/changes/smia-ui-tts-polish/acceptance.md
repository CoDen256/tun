# Acceptance criteria

Dev compose (`cd smia && docker compose up`), open `/smia/` with
claude-in-chrome. Reference: `mockups/inline-play.html`.

## Health below try-it (item: "[ux] smia ui put provider healch below …")

1. Scrolling down from the top, the section headings read in this order:
   "Provider catalog", "Manual try-it", "Provider health".

## Inline play buttons (item: "[ux] smia ui nice ux idea … play buttons near sha256")

2. Try-it with kind `tts`, provider `pygmalion`, body `{"text":"led","lang":"nb"}`
   → Send: every line of the result containing `"sha256"` has a play
   control to its left, inside the result block; there are no `<audio>`
   players below the result.
3. Clicking a control plays that candidate (the control turns to a stop
   state and a progress bar runs under the line); clicking a second
   control stops the first and plays the second; when audio ends the
   control returns to ▶.
4. With a candidate whose `/tts/{sha256}` returns 404 (e.g. edit a sha in
   the DB cache or block the request), its control shows ⚠ and its
   tooltip names the 404.
5. Selecting the whole result and copying it yields text with no ▶/■/⚠
   characters; everything after the first line parses as JSON.
6. At 375 px viewport width the page does not scroll horizontally; the
   result block scrolls horizontally on its own.
7. A non-tts try-it (kind `ipa`) renders as before, with no play controls.
