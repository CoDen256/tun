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

**4a. Crawl — ALREADY DONE (2026-11-26), skip to 4b.** You ran it, and the
result is committed: 2,832 (exercise, dialect) pairs, 0 failures, exit 0,
53,695 sound URLs. Nothing here needs running again; a re-run would replay
the whole thing from the cache with no network calls.

*(Your run reported 295 problems. 293 were CALST serving an empty word list
for a pronunciation-contrast exercise a dialect has no recordings of — data,
not a failure — and 2 were exercise 938 stopping 5 samples short of the old
cap. Both are fixed in the crawler, the manifest was re-run clean, and no
audio was ever missing. Commits `0ac6674b2`, `bafd60ba6`.)*

The command, for reference or a future re-crawl (detached):

```bash
docker compose run -d --name calst-crawl --no-deps -v "$PWD/smia":/work -w /work smia-backend python -m scripts.crawl_calst
```

No `--rm`, so the stopped container keeps its exit code and logs until you
remove it. Come back whenever you like:

```bash
docker ps -a --filter name=calst-crawl                      # "Up …" while running, "Exited (N) …" when done
docker logs -f calst-crawl                                  # optional: live progress; Ctrl-C only stops watching
docker inspect calst-crawl --format '{{.State.ExitCode}}'   # the exit code, after it stopped
docker logs calst-crawl 2>&1 | tail -40                     # the coverage report is at the end
```

What the exit code means:

| exit | meaning | what to do |
|---|---|---|
| **0** | Every pair is `saturated` or `empty`. | `docker rm calst-crawl`, then go on to 4b. |
| **1** | The report lists failed or unsaturated pairs. | `docker start calst-crawl` re-runs the same crawl. It resumes from the cache and retries only those pairs. |
| **3** | Aborted after 50 consecutive request failures; CALST is throttling or down. | Wait a while, then `docker start calst-crawl`. |

| **137** (or another kill code) | The container was stopped, e.g. the VPS rebooted. It does not restart by itself. | `docker start calst-crawl`. It resumes from the cache. |

`empty` in the report is not a problem: that dialect has no recordings for
that exercise, which is true of every pronunciation-contrast exercise outside
Oslo (293 pairs). Add `--retry-empty` only if you suspect CALST was having a
bad day when it said so. Some exercises also return words with no recordings
under Trondheim and Tromsø — also CALST's data, not a failure.

**4b. Extract and download — NOT DONE YET.** As of 2026-11-26 the crawl data
is committed but no audio has been fetched: `providers/pygmalion/audio/` is
still the Oslo-only 10,203 rows, and there is no `Tromsoe/` directory. Measured
locally against the committed crawl:

| | |
|---|---|
| New manifest rows | 43,977 |
| Of those, importable (not surplus) | 26,190 |
| Files to download | ~44,000, about one per second → **10–12 h** |
| Audio added to git | **~300 MB** (Oslo's 10,006 files are 69 MiB) |
| Words covered after import | 4,665, up from 4,543 |

That is 6× the ~52 MB the design signed off on, so decide first whether all
eight dialects' audio belongs in git. Nothing else is blocked on it: the
database is unaffected either way, since the backup no longer dumps smia.

Run them as two steps, not one: extract is offline and takes seconds, and its
numbers are what you decide the 11-hour download on. Pull first, so the VPS
has the corrected manifest and the crawler fix, and check you have ~1 GB free
(`df -h .`) for the audio plus its git objects.

```bash
git pull
```

**Extract** (offline, seconds, prints the per-dialect table and the counts):

```bash
docker compose run --rm --no-deps -v "$PWD/smia":/work -w /work smia-backend sh -c 'pip install -q rich==13.9.4 && python -m scripts.fetch_pygmalion_audio extract'
```

**Download** (detached — it runs for 10–12 h and must not die with your SSH
session):

```bash
docker compose run -d --name pygmalion-dl --no-deps -v "$PWD/smia":/work -w /work smia-backend sh -c 'pip install -q rich==13.9.4 && python -m scripts.fetch_pygmalion_audio download'
```

Check on it whenever you like, the same way as the crawl:

```bash
docker ps -a --filter name=pygmalion-dl                      # "Up …" or "Exited (N) …"
docker logs --tail 20 pygmalion-dl                           # progress, one line per file
docker inspect pygmalion-dl --format '{{.State.ExitCode}}'   # after it stopped
```

It is resumable: a row already `ok` is never re-fetched, so after a crash, a
reboot or a stop, `docker start pygmalion-dl` picks up where it left off.
When it finishes, `docker rm pygmalion-dl`.

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
