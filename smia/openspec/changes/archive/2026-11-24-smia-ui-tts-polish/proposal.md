# smia-ui-tts-polish

## Why

Two backlog items in batch `smia-tts`:

- `[ux] smia ui put provider healch below the "manual try it"`
- `[ux] smia ui nice ux idea: can we somehow add within the json response text field small play buttons, near "sha256" that will play the audio when pressed, instead of placing them below the response field`

## What Changes

- Section order on `/smia/`: Provider catalog → Manual try-it → Provider
  health.
- The try-it result stays pretty-printed JSON, but every `"sha256"` line
  gets an inline ▶ control in a left gutter; the separate list of
  `<audio>` players below the result is removed.

Accepted mockup: `mockups/inline-play.html` (operator: "Looks perfect",
2026-11-23).

## Capabilities

### New Capabilities
- `smia-ui`: the operator page's section order and inline audio playback in
  the try-it result.

## Impact

`smia/ui/index.html`, `ui.js`, `ui.css` only. No API change.
