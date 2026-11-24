# smia-tts

## Package: smia tts provider data and ui

Changes (archived 2026-11-24, smia): `calst-full-coverage`,
`tts-candidate-matching`, `smia-ui-tts-polish`.

All commands run on the VPS from the repository root (`~/tun` or wherever
the checkout lives), against the unified stack.

### 1. Deploy the code (standard, plus one migration that runs itself)

```bash
git pull
docker compose up -d --build smia-backend
```

- The smia image bakes the code in, so `--build` is required.
- On boot the backend applies Alembic revision **`f3c9a7e2b815`**, which adds
  `pygmalion_audio.match_key` and `pygmalion_audio.text`, plus an index on
  `match_key`, and backfills `match_key` from `word` on existing rows.
  Confirm it:

```bash
docker compose exec -T postgres sh -c 'psql -U "$POSTGRES_USER" -d smia -c "\d pygmalion_audio"'
```

Expect the columns `match_key` and `text` and the index
`ix_pygmalion_audio_match_key`.

### 2. One-time data migration: re-import pygmalion and purge stale `/tts` answers

**Required.** The startup import skips a non-empty table, the existing rows
have no `text` yet, and cached `/tts` answers predate the new fields.

```bash
docker compose exec -T postgres sh -c 'psql -U "$POSTGRES_USER" -d smia' <<'SQL'
TRUNCATE pygmalion_audio;
DELETE FROM lookup_cache WHERE kind = 'tts' AND provider IN ('pygmalion', 'dictcc_api');
SQL
docker compose exec -T smia-backend python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl
```

The import must end with **`7160 imported … 1 skipped, 0 hash-mismatched`**.
The one skipped row is `trettiende`, which the server always returns as a
0-byte file.

This gives you the Oslo corpus. Section 4 adds the other dialects.

### 3. Live flows to test after steps 1–2

Open `/smia/` in the browser.

**UI** (`smia-ui-tts-polish`; agents could not check these because no
browser was available from WSL):

- [ ] **Section order.** Scrolling down, the headings read: Provider catalog → Manual try-it → Provider health.
- [ ] **Inline play.** Try-it with kind `tts`, provider `pygmalion`, body `{"text":"målende","lang":"nb"}`, then Send.
  - [ ] Each `"sha256"` line has a ▶ in the left gutter of the JSON.
  - [ ] There is no list of audio players below the result.
- [ ] **Playback.**
  - [ ] Clicking ▶ plays the audio; the button turns to ■ and a thin progress bar runs under the line.
  - [ ] Clicking a second ▶ stops the first one.
  - [ ] When playback ends, the button returns to ▶.
- [ ] **Error state.** Make a candidate's audio fail, e.g. delete its row from `tts_audio` in Adminer and send again.
  - [ ] That control shows ⚠.
  - [ ] Its tooltip names the 404, on hover and on Tab focus.
- [ ] **Clean copy.** Select the whole result and copy it. The clipboard has no ▶/■/⚠ characters, and everything after the first line is valid JSON.
- [ ] **Phone width.** At phone width (DevTools, 375 px) the page doesn't scroll sideways; only the result box does.
- [ ] **Non-tts kinds.** A non-tts try-it (kind `ipa`) looks exactly as before, with no play controls.

**Data** (agent-verified in dev; re-check live):

- [ ] **Tonelag words.** Try-it `tts` / `pygmalion` with each of `målende`, `målene`, `bindende`, `seilende`: each returns 2 candidates with `voice: "Oslo"`, and the audio plays.
- [ ] **Fuzzy matches.** Try-it `tts` / `pygmalion`:
  - [ ] `avis` → `context: "ei avis"`
  - [ ] `bokhandel` → `context: "bok + handel"`
  - [ ] `stille opp` → `context: "stille"`
  - [ ] `led` → no `context` key at all
- [ ] **dict.cc speakers.** Try-it `tts` / `dictcc_api` with `takk`:
  - [ ] The `context: "takk"` candidates carry `voice` = dict.cc user names, including `carloschavez`, `steffenandree` and `mtbboy1993`.
  - [ ] Each one sounds different.
- [ ] **stabbur.** In stabbur's audio suggestions for a note like `avis`, the candidate's label shows `ei avis`. stabbur already displays `context`, so this needs no stabbur change.

### 4. Your step: crawl all 8 CALST dialects, then extract, download, import, commit and push

This is about 18,000 requests at roughly 3.5 s each, so **15–20 hours**. The
crawl can be resumed: every finished sample is cached, so after a crash,
reboot or Ctrl-C you just run the same command again. Run every command from
the repository root.

The backend mounts `providers/` read-only. These one-off containers mount the
checkout at `/work` instead, so the scripts can write there.

**4a. Crawl** (detached):

```bash
docker compose run -d --name calst-crawl --no-deps -v "$PWD/smia":/work -w /work smia-backend python -m scripts.crawl_calst
docker logs -f calst-crawl          # progress; Ctrl-C only stops watching
docker wait calst-crawl             # prints the exit code once finished
docker logs calst-crawl 2>/dev/null | tail -30   # the coverage report
docker rm calst-crawl
```

What the exit code means:

| exit | meaning | what to do |
|---|---|---|
| **0** | Every (exercise, dialect) is saturated. | Go on to 4b. |
| **1** | The report lists failed or unsaturated pairs. | Re-run the same command. It resumes and retries only those pairs. |
| **3** | Aborted after 10 consecutive request failures; CALST is throttling or down. | Wait, then re-run. |

- Under Trondheim and Tromsø some exercises have words without recordings.
  That is CALST's data, not a failure.

**4b. Extract and download.** Extract is offline. The download is about one
file per second, and the number of new files is printed by extract.

```bash
docker compose run --rm --no-deps -v "$PWD/smia":/work -w /work smia-backend sh -c 'pip install -q rich==13.9.4 && python -m scripts.fetch_pygmalion_audio extract && python -m scripts.fetch_pygmalion_audio download'
```

- Existing manifest rows are never renumbered (fixed in this build).
- New dialects land in their own folders: `Bergen/`, `Tromsoe/`, …
- They show up as `voice` values `Bergen`, `Tromsø`, `Sandnessjøen`, …

**4c. Give the files back to your user.** The containers run as root.

```bash
docker compose run --rm --no-deps -v "$PWD/smia":/work smia-backend chown -R "$(id -u):$(id -g)" /work/providers
```

**4d. Import into the live database.** Repeat step 2. The import count will
be higher than 7160 now.

```bash
docker compose exec -T postgres sh -c 'psql -U "$POSTGRES_USER" -d smia' <<'SQL'
TRUNCATE pygmalion_audio;
DELETE FROM lookup_cache WHERE kind = 'tts' AND provider = 'pygmalion';
SQL
docker compose exec -T smia-backend python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl
```

**4e. Commit and push the data from the VPS** (your decision, 2026-11-23):

```bash
git add smia/providers/calst smia/providers/pygmalion/audio
git commit -m "data(calst-full-coverage): all-dialect CALST crawl"
git push
```

**4f. Verify** (`calst-full-coverage` acceptance 7, yours):

- [ ] The coverage report lists the `dialects found:` line with all 8 dialects.
- [ ] Try-it `tts` / `pygmalion` with `de` or `led` returns candidates whose `voice` includes non-Oslo dialects (`Bergen`, `Trondheim`, …), and the audio plays.
- [ ] No dialect shows up twice under two spellings (`Sandnessjøen` vs `Sandnessjoeen`).
