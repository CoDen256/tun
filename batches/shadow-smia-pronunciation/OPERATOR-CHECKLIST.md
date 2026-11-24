# shadow-smia-pronunciation

---

## Shadow playback, splitting & chapter reading — `shadow-playback-chapter-reading` (shadow)

shadow becomes single-user (D168) and gets the following:
- the in-app Settings screen;
- audiobook mode;
- pause;
- the reversed split flow;
- autoplay;
- the compact phone header;
- chapter break, merge and title in Prepare;
- an installable app (PWA).

Agent-verified against `shadow/openspec/changes/archive/2026-11-24-shadow-playback-chapter-reading/acceptance.md` in dev, including a headless Chromium run. That is **not** your acceptance (D161).

### 1. Before deploying: check the owner pin will succeed

The migration `e5b9c2d47a10` pins ONE owner id. If shadow's data holds more
than one distinct `user_id`, it **aborts and changes nothing**: shadow keeps
serving, reports *degraded*, and its database-backed pages answer 503 (D157).
Check first, on the VPS:

```bash
docker compose exec -T postgres psql -U shadow -d shadow -c "
select 'media' t, user_id, count(*) from shadowing_media group by 2
union all select 'uploads', user_id, count(*) from shadowing_uploads group by 2
union all select 'ranges', user_id, count(*) from shadowing_progress_ranges group by 2
union all select 'cursors', user_id, count(*) from shadowing_cursors group by 2;"
```

Expect exactly one distinct `user_id`. If you see two, decide which rows are
junk and delete them by hand **before** deploying. The migration will not
choose for you.

### 2. Deploy

```bash
git pull
docker compose up -d --build shadow-backend
```

The migration runs by itself at boot. It adds:
- `shadow_owner`;
- `shadow_settings`;
- `shadowing_segments.title`;
- `shadowing_split_configs.manual_edit_count`.

It is additive: no span, progress range or cursor is touched.

### 3. Verify the migration and the one-time settings import

```bash
docker compose exec -T postgres psql -U shadow -d shadow -c "select * from shadow_owner;"
docker compose exec -T postgres psql -U shadow -d shadow -c "select key, value from shadow_settings order by key;"
docker compose logs shadow-backend | grep -i -E "owner|import|AmbiguousOwner" | tail
```

- `shadow_owner` holds your id.
- Within a few minutes `shadow_settings` holds:
  - `transcribeBackend` with your provider;
  - `shadowTrimSilence` as you had it in phonexa;
  - the `_phonexaImportDone` marker.

  If phonexa is down at boot, the import retries in the background (up to
  10 min backoff); defaults apply meanwhile.
- From now on shadow never asks phonexa for users or settings.

### 4. Test live (browser and phone)

**Settings and single-user**
- [ ] No profile picker anywhere. ⚙ in the nav opens Settings in the same page. ◐ is gone from the nav, and the Trim card is gone from Library.
- [ ] Flip Trim silence, "Play sentence when opened" and "Trim in audiobook mode", and change the STT provider. Each row shows ✓ saved, and everything survives a reload.
- [ ] Set Theme to Dark on the phone. The desktop stays on its own theme.
- [ ] The old link `/shadow/settings.html` (still used by phonexa's nav) lands on Settings.

**Study loop**
- [ ] Pause pill (K) right of Play; pause mid-sentence, wait, resume. Play while paused restarts from the start.
- [ ] Record a take and stop. The browser's microphone indicator disappears within a second, on desktop Chrome and on the phone.
- [ ] Done & next (↵) jumps instantly even on mobile data. The next sentence autoplays, and the "↻ autoplay" chip flashes.
- [ ] Split (X, or ⋯ → Split… on the phone):
  - playback stops and a red line appears;
  - drag it, use hear left and hear right, then confirm;
  - the two halves trim like normal sentences.
- [ ] Phone header: two lines (✕ · book · ⋯ / ‹ chapter › · n / N · ▶▶ Listen). The grabber reveals the nav.

**Audiobook mode (the big one — on the phone)**
- [ ] ▶▶ Listen from mid-chapter: it reads on at natural tempo with the pauses as recorded. The sentence, counter and playhead follow along, and the banner says it's automatic.
- [ ] **The screen stays on** past your phone's screen timeout ("☼ screen stays on" in the banner). After Stop, it dims normally again. *Agents could not test this — headless Chromium refuses the wake lock.*
- [ ] Stop by:
  - tapping the waveform;
  - the big bottom button;
  - pressing Record, which only stops and does not record.

  Study that sentence, then "▶▶ Resume · N+1" continues from the next one.
- [ ] Let it reach the end of a chapter: "End of chapter N", and nothing from the next chapter plays.
- [ ] Turn "Trim in audiobook mode" on: the pauses between sentences are skipped.

**Explore and Prepare**
- [ ] Explore previews are instant after expanding a chapter, with no lag or silence. The live line follows the sound and freezes on pause.
- [ ] Prepare:
  - hover between two sentences (on the phone, use "⤒ Show chapter breaks") → Start new chapter here → confirm, and check the renumbering;
  - Undo puts it back;
  - ⇣ Merge with next chapter, then ✎ Title. The title shows in Explore and Study as "Chapter N · Title".
- [ ] Re-analysing that config warns that chapter edits are discarded, and discards them.

**Installable app**
- [ ] On the phone in Chrome: ⋮ → **Install app**. It opens standalone at shadow's Library.
- [ ] You may be asked for the gateway login once inside the app window. *Not testable headless.*
- [ ] Afterwards, report whether the login prompt reappears on every launch. If it does, that's a new backlog item.

### Known, not fixed (out of scope)
- Library's resume line still shows "Chapter N" without the chapter title.
- In Study, M on a chapter's last sentence says "Nothing after this one in this chapter to merge". Prepare says "merge the chapters first".
- The phonexa nav still links to `/shadow/settings.html`. It works, via the forwarder.
