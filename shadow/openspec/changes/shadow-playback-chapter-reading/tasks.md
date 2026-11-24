# Tasks

> Every task is verified against `acceptance.md`. UI tasks implement
> `mockups/` **1-1** (operator instruction). A reviewer compares the built
> screens side by side with the mockup at desktop and at 390×844, in light
> and dark.

## 1. Single owner and shadow-owned settings

- [x] 1.1 Migration: add the settings store; pin the owner id from existing data (abort, changing nothing, on >1 distinct id) — verify with a test DB holding one id (succeeds) and two ids (aborts, rows unchanged)
- [x] 1.2 Server uses the owner id for every request and ignores a client `userId`; upload no longer calls phonexa to verify users — verify books/progress/cursor unchanged in the UI (A1.2)
- [x] 1.3 Settings read/write endpoints against the shadow store; one-time background import of `transcribeBackend` and `shadowTrimSilence` from phonexa with defaults on failure — verify A1.3, A1.4
- [x] 1.4 Remove the profile picker and the users/settings proxies from shadow's pages and JS — verify A1.1

## 2. Player model

- [x] 2.1 One shared player behaviour (play restarts, pause/resume, one player at a time, truthful playhead) used by Study, Prepare previews and Explore previews — verify A2.1–A2.4
- [x] 2.2 Explore expands load the chapter chunk; previews seek in it with a loading state; no per-sentence audio requests — verify A3.1–A3.3

## 3. Study loop hot path

- [x] 3.1 Release microphone tracks on stop/cancel/leave — verify A4.1
- [x] 3.2 Optimistic done-and-next with background write, reconcile, revert-and-error on failure — verify A5.1, A5.2

## 4. Trim parity

- [x] 4.1 Verify (and fix if needed) that split/merge speech windows match analysis within 20 ms — verify A6.1

## 5. Installable app

- [x] 5.1 Web manifest + icons, linked with credentials; scope/start at the shadow prefix; standalone — verify A7.1, A7.2

## 6. Settings screen

- [x] 6.1 Settings as an in-app screen from ⚙ (mockups/settings-prepare.html screen A): Appearance/Playback/Transcription/Books groups, instant save with per-row ✓; old settings.html redirects to it — verify A8.1–A8.4
- [x] 6.2 Remove ◐ from the nav and the trim card from Library; theme System/Light/Dark per device — verify A8.5, A1.6

## 7. Study screen (mockups/study.html)

- [x] 7.1 Pause pill placement desktop/phone, ↺ on Play while playing, hollow paused playhead, `K` — verify A2.3, A13.1
- [x] 7.2 Reversed split flow: split stops playback, line + shade + A/B, drag/tap/nudge, hear left/right, Confirm/Cancel, inert controls — verify A11.1–A11.4
- [x] 7.3 Autoplay on operator-initiated moves, ↻ chip and flash, honours the setting — verify A12.1–A12.3
- [x] 7.4 Compact phone header (grabber + two lines) and the extended ⋯ sheet — verify A14.1, A14.2
- [x] 7.5 Shortcut overlay lists `K`, `L` and the split-editing keys — verify A13.2

## 8. Audiobook mode

- [x] 8.1 ▶▶ Listen / Resume control, `L`; continuous chapter playback when untrimmed, trimmed sentences back to back when trimmed; boundary tracking drives sentence/counter/waveform/playhead and cursor; never marks done — verify A10.1–A10.4
- [x] 8.2 Banner (desktop/phone), phone full-width stop, wake lock — verify A10.5, A10.6
- [x] 8.3 Stop paths (Stop, Space, Esc, waveform tap, any study action, stop-only press), resume from N+1, end-of-chapter stop — verify A10.7–A10.10

## 9. Chapter editing in Prepare

- [x] 9.1 Migration: nullable `title` on segments; server operations: start chapter at sentence, merge with next chapter, set title — each a manual edit of its config, no span/progress change — verify A9.1, A9.2, A9.6
- [x] 9.2 Prepare UI per mockup screen B: hover break point, "Show chapter breaks", in-page confirms with ▶ hear the boundary, flash + Undo toast, Merge-with-next on headers, ✎ Title, last-sentence merge hint, edit count on config card, extended re-analyse warning — verify A9.3–A9.5, A9.7
- [x] 9.3 Chapter titles shown in Explore and in Study's chapter label — verify A9.8

## Workflow follow-up

- ADR D168 is recorded in `docs/07-decisions.md` (written at design time).
- OPERATOR-CHECKLIST: the owner-pinning migration (what an abort looks like and how to resolve it), the one-time settings import, installing the PWA on the phone and the possible one-time login prompt inside it.
