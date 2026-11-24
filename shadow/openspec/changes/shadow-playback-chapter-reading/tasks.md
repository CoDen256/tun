# Tasks

> Stage 1 tasks. Stage 2 (UI items) are appended when their mockups are
> accepted. Every task is verified against `acceptance.md`.

## 1. Single owner and shadow-owned settings

- [ ] 1.1 Migration: add the settings store; pin the owner id from existing data (abort, changing nothing, on >1 distinct id) — verify with a test DB holding one id (succeeds) and two ids (aborts, rows unchanged)
- [ ] 1.2 Server uses the owner id for every request and ignores a client `userId`; upload no longer calls phonexa to verify users — verify books/progress/cursor unchanged in the UI (A1.2)
- [ ] 1.3 Settings read/write endpoints against the shadow store; one-time background import of `transcribeBackend` and `shadowTrimSilence` from phonexa with defaults on failure — verify A1.3, A1.4
- [ ] 1.4 Remove the profile picker and the users/settings proxies from shadow's pages and JS — verify A1.1

## 2. Player model

- [ ] 2.1 One shared player behaviour (play restarts, pause/resume, one player at a time, truthful playhead) used by Study, Prepare previews and Explore previews — verify A2.1–A2.4
- [ ] 2.2 Explore expands load the chapter chunk; previews seek in it with a loading state; no per-sentence audio requests — verify A3.1–A3.3

## 3. Study loop hot path

- [ ] 3.1 Release microphone tracks on stop/cancel/leave — verify A4.1
- [ ] 3.2 Optimistic done-and-next with background write, reconcile, revert-and-error on failure — verify A5.1, A5.2

## 4. Trim parity

- [ ] 4.1 Verify (and fix if needed) that split/merge speech windows match analysis within 20 ms — verify A6.1

## 5. Installable app

- [ ] 5.1 Web manifest + icons, linked with credentials; scope/start at the shadow prefix; standalone — verify A7.1, A7.2

## Workflow follow-up

- ADR D168 is recorded in `docs/07-decisions.md` (written at design time).
- OPERATOR-CHECKLIST: the owner-pinning migration (what an abort looks like and how to resolve it), the one-time settings import, installing the PWA on the phone and the possible one-time login prompt inside it.
