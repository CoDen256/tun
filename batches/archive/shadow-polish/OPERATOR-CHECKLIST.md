# Operator checklist — shadow-polish

Appended by each `/tun-build` session as its package archives.

---

## Shadow studying refinements — `shadow-studying-refinements` (shadow)

Live findings from your first real sessions, fixed. No schema destruction,
no progress migration — the completed-time-ranges model is untouched.

### Deploy

```bash
git pull
docker compose up -d --build shadow-backend
```

One additive migration (`d3f81c5a2e17`) runs itself at boot: two nullable
columns for the speech window. Nothing to run by hand.

**`alembic downgrade` on shadow refuses, by design** — unchanged from last
cycle, and the refusal message now also warns that a newer revision may
already have run. Go back by restoring a dump, never by downgrading.

### The first thing you must do

**Re-analyse each book you are already studying** (Prepare → Re-analyse).
Books analysed before this change have no speech windows, so they stay
untrimmed and the trim switch will look like it does nothing. This is
deliberate, not a bug. Re-analysis does not touch your progress.

**Your existing chapter chunks were cut the old, inaccurate way** and are
invalidated automatically — the first entry into a chapter may take longer
while it is re-cut, and after an analysis the rest are pre-cut in the
background.

### Data / storage verification

- `docker compose exec postgres psql -U shadow -d shadow -c "select count(*) from shadowing_segments where speech_start_ms is not null;"`
  — non-zero only for configs analysed after this change.
- `docker compose exec postgres psql -U shadow -d shadow -c "select count(*) from shadowing_progress_ranges;"`
  — your progress; untouched by any of this.
- Chunk files now carry a `ch-v2-` prefix. Old `ch-` files are unaddressable
  and swept.

### Flows to test live

1. **The two bugs you reported.** In Explore, ▶ several sentences in a row —
   none should open with the tail of the previous one. In Study, play a
   sentence and watch the playhead against what you hear; the bump and the
   sound should coincide. (Measured at ≤0.06 ms cut error and 0.00pp
   playhead error, but your ears are the real test.)
2. **Trimming.** Sentences and your takes should both skip their dead air.
   Then turn the switch off in Settings and confirm the silence returns.
   **Listen for a clipped consonant onset** — a Norwegian *hv-* or a breathy
   *h*. That is the failure mode the switch exists for; if you hear it, say
   so and the detector's guard gets widened.
3. **Record and Compare — still the least-verified part.** No microphone
   exists in dev; an agent substituted the input device so shadow's own
   code ran, but a real mic is your test. Check that your lane sits directly
   under the sentence's, aligned, that the controls do not jump when
   recording starts and stops, and that your take is gone after a reload.
4. **Contours.** `P` hides and shows them. Each should sit on its own lane
   in its own colour, with the waveform pushed back slightly behind it.
   Judge the colours and the blur on your own monitor in both themes.
5. **Chapter stepping.** `Shift+←` / `Shift+→`. The ends of the book should
   say so rather than misbehave.
6. **Replay.** Press play again mid-sentence — it should restart, not stop.
7. **Explore reach.** Tap anywhere on a cell to open it, on phone and
   desktop. Selection now needs the explicit select mode.
8. **The phone.** Nav hidden; pull down from the top edge to get it back.
   Four equal buttons with Done&next among them. **No tick strip — that is
   deliberate, at your request.**
9. **Split configs, the expensive path.** Re-analyse a config while its
   pre-cut is still running, then enter a chapter. It should not stall for
   ~25 s. A reviewer found that re-analysis used to cancel its own pre-cut
   silently; this is the flow that proves the fix.

### Known / not defects

- **Compare sends your trimmed take to phonexa** for the pitch contour. It
  is analysed in memory and stored nowhere — but "nothing leaves the
  browser" is not literally true, and you should know that. Pre-existing.
- The phone nav auto-hides on pointer actions, not on keyboard navigation.
- Criterion 45 (shadow still serves with Postgres stopped) was **not
  re-verified this cycle** — doing so means stopping the shared cluster
  while other sessions build against it. It passed last cycle and nothing
  here touches the boot path.
