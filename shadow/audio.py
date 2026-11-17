"""
audio.py — shadow's server-side audio store and its ffmpeg work.

THIS FILE REVERSES A STANDING RULE, DELIBERATELY. Until shadow-studying-mode
shadow stored no audio at all; `db/models.py`, `shadowing.py`, the Dockerfile
and D147 all said so. The operator reversed it on 2026-11-15 because the real
workflow moved to the phone, and a browser that must hold a multi-hour file
locally cannot serve a phone.

What makes the reversal safe is the distinction the original revert was
actually about: the thing that failed was server-side DECODING PER REQUEST —
a Praat decode of a multi-hour file on upload, again on split, and again on
every chapter-audio request, nothing cached. Nothing here decodes per
request:

  * transcode      ONCE, on upload, to a mono Opus master; the original is
                   then discarded.
  * analysis       ffmpeg `silencedetect` over the master, once per
                   analysis the operator explicitly asks for, emitting
                   RANGES ONLY — no audio is ever written by an analysis.
  * chapter chunk  a PRECISE re-encode, cached on disk and keyed by the
                   chapter's boundaries so a moved boundary cannot serve a
                   stale chunk. Cut ONCE per chapter, in the background,
                   right after the analysis that created the boundary.

CORRECTION, 2026-11-16 (shadow-studying-refinements). The line above used
to read "a STREAM COPY cut (`-c copy`), milliseconds", and the whole file
advertised that stream copy as what made a chapter chunk cheap. IT WAS
CHEAP AND IT WAS WRONG, and the stale claim is annotated rather than
deleted because the mistake is the instructive part:

  `-ss`/`-to` placed BEFORE `-i` is INPUT seeking, and a stream copy
  cannot cut between the frames it muxes. The output therefore began at
  the enclosing Ogg page, somewhere before the millisecond asked for. Two
  operator-visible bugs came out of that one flag:

    - Explore's sentence preview opened with the PREVIOUS sentence's
      audio (Prepare did not, because it seeks inside an already-decoded
      chapter chunk — sample-accurate, and the contrast was the clue);
    - the Study playhead desynced from the sound. Every manifest offset
      is `sentence.startMs - chapter.startMs`, which is true only if the
      chunk really starts at `chapter.startMs`. It did not, so the whole
      drawn window was shifted against what was heard.

  The previous cycle's review saw it, called it "audibly small" and
  deferred it. The operator hit it within a day. Cheapness was never worth
  this; every cut here now decodes and starts at the requested
  millisecond.

No per-sentence artefact is ever stored. The file count for a book is 1
master plus a derivable cache; it does not scale with the sentence count.

The learner's own recordings are NEVER received here, in any form. There is
no endpoint that accepts them and no path in this module that could write
one.

LAYOUT, under SHADOW_AUDIO_DIR (a named volume, see compose.yaml):

    <root>/_uploads/<upload_id>.part        resumable upload, appended to
    <root>/books/<media_id>/master.opus     the one stored artefact
    <root>/books/<media_id>/chunks/ch-<cutver>-<segment_id>-<start>-<end>.opus
                                            derivable cache, free to delete
"""

from __future__ import annotations

import json
import os
import pathlib
import shutil
import subprocess
import threading
import time
import uuid

# One constant, defaulted in code and set in compose.yaml only (D151: used by
# exactly one project, so it is that project's business and is typed once).
AUDIO_ROOT = pathlib.Path(os.environ.get('SHADOW_AUDIO_DIR', '/data/audio'))

# Tier-2 decisions recorded in batches/full-sweep/DECISIONS-MADE.md.
OPUS_BITRATE = '32k'          # mono speech; ~170 MB for a 12-hour book
OPUS_APPLICATION = 'audio'    # not 'voip': audiobooks are produced speech
SILENCE_NOISE_DB = -30        # the fixed noise floor; the two THRESHOLDS
                              # (sentence/chapter silence length) stay the
                              # only analysis parameters, per design.md §5
UPLOAD_TTL_SEC = 24 * 3600    # a RESUMABLE upload survives a day of silence;
                              # an orphan part file is reclaimed at once
ORPHAN_GRACE_SEC = 60         # a part file younger than this is never judged
                              # an orphan — see sweep_abandoned_uploads
SWEEP_INTERVAL_SEC = 900      # the janitor's period; shadow runs one process
PROBE_TIMEOUT_SEC = 60
CUT_TIMEOUT_SEC = 120         # a sentence: seconds of audio, a fraction of a
                              # second of work
CHUNK_CUT_TIMEOUT_SEC = 3600  # a chapter, IN THE BACKGROUND: a real re-encode,
                              # ~20-30 s for 45 minutes. Nobody is waiting on
                              # this thread, so the ceiling is generous on
                              # purpose — a chunk that times out is a chapter
                              # that cannot be studied.
CHUNK_REQUEST_CUT_TIMEOUT_SEC = 90
                              # the same chapter on the SYNCHRONOUS request
                              # path, where a web worker IS being held.
                              # Confirmed defect, 2026-11-17: the background
                              # ceiling was used here too, so a handful of
                              # cold chapter entries could occupy every
                              # worker for an hour each while the gateway
                              # timed the operator out and ffmpeg kept
                              # running. 90 s is ~3x the measured 45-minute
                              # encode; past it the request gives up and says
                              # "still being prepared", and the BACKGROUND
                              # pre-cut that the endpoint started first keeps
                              # going, so the retry is cheap and finite.
CHUNK_PARTIAL_GRACE_SEC = 1800
                              # a `.partial` chunk encode whose file has not
                              # been written to for this long is abandoned.
                              # ffmpeg writes continuously, so a live encode's
                              # mtime is always fresh; only a killed one goes
                              # quiet. Well past CHUNK_CUT_TIMEOUT_SEC/2 and
                              # well past any real encode's stall.

# The precise cut (shadow-studying-refinements task 1.1).
#
# `-ss` BEFORE `-i` is fast (it seeks the container) but lands on a page;
# `-ss` AFTER `-i` is exact (it decodes and discards) but reads the file from
# zero, which is minutes into a 12-hour book. Doing BOTH is the whole trick:
# seek the container to CUT_SEEK_PAD_MS before the target, then discard the
# remaining pad by decoding it. Cost is one pad's worth of decode; the output
# starts at the millisecond asked for.
CUT_SEEK_PAD_MS = 500

# ── Silence TRIMMING (shadow-studying-refinements §2) ───────────────────
# A PLAYBACK AND DISPLAY ATTRIBUTE, NEVER A BOUNDARY. See speech_window.
TRIM_MIN_SILENCE_MS = 120     # the shortest edge silence worth trimming at all
TRIM_ONSET_GUARD_MS = 80      # never trim closer than this to detected speech.
                              # Conservative at onsets is the whole rule: a
                              # clipped soft consonant does not LOOK broken, it
                              # just means shadowing a truncated model, which
                              # is invisible to the operator. 80 ms still
                              # leaves <150 ms of lead-in on a 300 ms silence.
TRIM_TAIL_GUARD_MS = 120      # the tail is cheap to be wrong about and
                              # expensive to clip — a trailing fricative
TRIM_MIN_SPEECH_MS = 300      # a window shorter than this is not believed;
                              # the full span is used instead


class AudioError(RuntimeError):
    """ffmpeg/ffprobe refused to do the thing, with its own message attached."""


class AudioTimeout(AudioError):
    """The tool ran past its ceiling. Distinguished from a refusal because a
    timeout is "not yet", which the caller may want to answer differently
    from "never" — see `ChunkPending`."""


class ChunkPending(AudioError):
    """The chapter's chunk is not ready and this caller's budget ran out.

    Not a failure: the encode is still running (or is queued behind the
    background pre-cut) and a later request will find the file. The chunk
    endpoint turns this into 503 + Retry-After rather than an error.
    """


# ── Paths ───────────────────────────────────────────────────────────────

def uploads_dir() -> pathlib.Path:
    p = AUDIO_ROOT / '_uploads'
    p.mkdir(parents=True, exist_ok=True)
    return p


def upload_part_path(upload_id: str) -> pathlib.Path:
    # upload_id is server-minted (uuid4 hex); never a client string.
    return uploads_dir() / f'{upload_id}.part'


def book_dir(media_id: int) -> pathlib.Path:
    return AUDIO_ROOT / 'books' / str(int(media_id))


def master_path(media_id: int) -> pathlib.Path:
    return book_dir(media_id) / 'master.opus'


def chunks_dir(media_id: int) -> pathlib.Path:
    return book_dir(media_id) / 'chunks'


# Bumped whenever the BYTES a chunk contains change for the same boundaries.
# v1 chunks were stream-copied and start early; v2 chunks start at the
# millisecond. The tag is in the filename, so a v1 file is simply never
# addressed again — the same mechanism the boundaries already use (task 1.4).
CHUNK_CUT_VERSION = 'v2'


def chunk_path(media_id: int, segment_id: int, start_ms: int, end_ms: int) -> pathlib.Path:
    """Cache path KEYED BY THE BOUNDARIES AND BY THE CUT (task 2.2, task 1.4).

    Putting start/end in the name is the whole invalidation strategy: a
    boundary edit changes the key, so the old file is simply never asked
    for again. It is garbage, not a stale answer, and `drop_chunks_for`
    (plus the janitor's `purge_stale_chunks`) clears it. Correctness does not depend on remembering to invalidate.

    CHUNK_CUT_VERSION extends that to a change in HOW the bytes are made.
    The boundaries of a chapter cut before 2026-11-16 are still valid, so
    the boundary key alone would have happily served a chunk that starts
    at the wrong millisecond. The version tag makes the stale file
    unaddressable too, and `purge_stale_chunks` reclaims it.
    """
    return (chunks_dir(media_id)
            / f'ch-{CHUNK_CUT_VERSION}-{int(segment_id)}-{int(start_ms)}-{int(end_ms)}.opus')


def drop_chunks_for(media_id: int, segment_ids) -> int:
    """Delete the cached chunks of THESE chapter segments, and no others.

    CORRECTION, 2026-11-17. This was `drop_chunk_cache(media_id)`, an
    `rmtree` of the whole book's `chunks/`, and its justification was that
    a re-cut cost milliseconds. It does not any more: a chapter is a
    precise re-encode, ~20-30 s. Wiping the book therefore threw away
    every OTHER split config's chapters as well — configs whose boundaries
    had not moved at all — and charged the operator 20-30 s per chapter to
    rebuild them.

    Narrowing it is safe for exactly the reason `chunk_path` gives: the
    filename carries the segment id, the boundaries and the cut version, so
    a chunk whose key changed is already unaddressable. Deleting is only
    ever about reclaiming disk, so deleting LESS can never serve a stale
    answer — it can only leave garbage, which `purge_stale_chunks` sweeps.
    """
    removed = 0
    for segment_id in {int(s) for s in segment_ids}:
        for chunk in chunks_dir(media_id).glob(f'ch-*-{segment_id}-*.opus'):
            try:
                chunk.unlink()
                removed += 1
            except OSError:
                pass
    return removed


def purge_stale_chunks(live_chunk_names: dict[int, set[str]] | None = None) -> int:
    """Reclaim cache files nothing can address any more (task 1.4).

    Addressability alone already makes a stale chunk harmless — nothing
    asks for it. This only reclaims the disk, and it is a sweep rather
    than a migration because the cache is pure derivation: being wrong
    here costs a re-cut, never a wrong answer.

    THREE kinds of rubbish, and the last two were found on 2026-11-17:

      * a chunk cut by an OLDER cut version — the pre-2026-11-16 stream
        copy. Unaddressable because the version is in the name.
      * a chunk of a segment id that NO LONGER EXISTS. Re-analysis deletes
        a config's rows and writes new ones with new ids, so a pre-cut
        that was still running wrote chunks for ids that are now gone;
        they carry the CURRENT version prefix, so the rule above skips
        them forever. `live_chunk_names` maps media_id to the set of
        filenames that are still addressable; passing None means "the
        caller could not reach the database", and then this rule is
        skipped entirely rather than guessed at (D157 — a janitor must
        survive a dead database). A file younger than ORPHAN_GRACE_SEC is
        never judged dead: the live set was read before this glob, so a
        chapter created in between would otherwise lose its fresh chunk.
      * an abandoned `.partial` encode. `cut` writes
        `<name>.<pid>-<hex>.partial` and renames it into place, so a
        pre-cut killed by a container restart — a realistic 20-minute
        window per analysis now — leaves one behind that the old
        `ch-*.opus` glob could not even see.
    """
    removed = 0
    books = AUDIO_ROOT / 'books'
    if not books.is_dir():
        return 0
    prefix = f'ch-{CHUNK_CUT_VERSION}-'
    now = time.time()
    for chunk in books.glob('*/chunks/ch-*.opus'):
        dead = not chunk.name.startswith(prefix)
        if not dead and live_chunk_names is not None:
            try:
                media_id = int(chunk.parent.parent.name)
            except ValueError:
                continue
            live = live_chunk_names.get(media_id)
            if live is not None and chunk.name not in live:
                try:
                    dead = chunk.stat().st_mtime < now - ORPHAN_GRACE_SEC
                except OSError:
                    dead = False
        if not dead:
            continue
        try:
            chunk.unlink()
            removed += 1
        except OSError:
            pass
    for partial in books.glob('*/chunks/*.partial'):
        try:
            if partial.stat().st_mtime < now - CHUNK_PARTIAL_GRACE_SEC:
                partial.unlink()
                removed += 1
        except OSError:
            pass
    return removed


def delete_book_audio(media_id: int) -> None:
    """Master + cache. Called on book deletion (task 1.6)."""
    shutil.rmtree(book_dir(media_id), ignore_errors=True)


def sweep_abandoned_uploads(ttl_sec: int = UPLOAD_TTL_SEC, live_ids=None,
                            busy_ids=None) -> int:
    """Reclaim `.part` files. Returns how many were deleted.

    THREE kinds of part file, and only one of them is rubbish on a timer:

      * a BUSY part file — one whose upload row is in a state where the
        server itself may still open it, which today means `transcoding`.
        It is never deleted here, at any age. (This is the defect the
        reviewer found on 2026-11-16: `live_ids` was built from
        `state='receiving'` ONLY, so the moment `complete_upload` flipped
        the row to `transcoding` the source file became an "orphan" whose
        mtime — the last slice, minutes or hours ago — was already past
        every grace period. A ten-minute transcode of a 1 GB book had its
        own input unlinked underneath it. The open fd kept THAT run alive,
        so it looked fine, but a failed transcode had nothing to retry
        from and a restart mid-transcode left the row `transcoding` with
        the source gone. Narrower, same cause: between `complete_upload`'s
        commit and ffmpeg's `open()` the file could vanish outright.)
      * a part file with NO row claiming it is an orphan by construction —
        nothing can ever append to it or complete it again, because the
        resume path finds uploads through the table. It goes immediately,
        whatever its age.
      * a part file whose row is `receiving` is a resumable upload. It
        survives until nobody has touched it for `ttl_sec`.

    `live_ids` is the set of upload ids whose part file is still claimed by
    a row (receiving OR busy); `busy_ids` is the subset that no rule may
    delete. Passing `live_ids=None` means "the caller cannot reach the
    database", and then only the TTL rule applies, with `busy_ids` still
    honoured — a sweep that cannot tell an orphan from a resume must not
    guess.

    A part file younger than ORPHAN_GRACE_SEC is never called an orphan:
    `live_ids` was read before this glob, so an upload that started in
    between would otherwise have its brand-new file deleted underneath it.
    """
    removed = 0
    now = time.time()
    cutoff = now - ttl_sec
    busy = set(busy_ids or ())
    for part in uploads_dir().glob('*.part'):
        try:
            if part.stem in busy:
                continue        # work in flight owns this file
            orphan = (live_ids is not None and part.stem not in live_ids
                      and part.stat().st_mtime < now - ORPHAN_GRACE_SEC)
            if orphan or part.stat().st_mtime < cutoff:
                part.unlink()
                removed += 1
        except OSError:
            pass
    return removed


# ── ffmpeg / ffprobe ────────────────────────────────────────────────────

def _run(args: list[str], timeout: int) -> subprocess.CompletedProcess:
    # Always an argument list, never a shell string: filenames derive from
    # ids we minted, but the habit is the protection.
    try:
        return subprocess.run(args, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired as exc:
        raise AudioTimeout(f'{args[0]} timed out after {timeout}s') from exc
    except FileNotFoundError as exc:
        raise AudioError(f'{args[0]} is not installed in this image') from exc


def probe(path: pathlib.Path) -> dict:
    """{durationMs, sampleRateHz, channels, codec} for an audio file."""
    proc = _run(['ffprobe', '-v', 'error', '-print_format', 'json',
                 '-show_format', '-show_streams', '-select_streams', 'a:0', str(path)],
                PROBE_TIMEOUT_SEC)
    if proc.returncode != 0:
        raise AudioError('ffprobe failed: ' + (proc.stderr or '').strip()[:300])
    try:
        info = json.loads(proc.stdout)
    except json.JSONDecodeError as exc:
        raise AudioError('ffprobe returned unreadable JSON') from exc
    streams = info.get('streams') or []
    if not streams:
        raise AudioError('the file contains no audio stream')
    stream = streams[0]
    duration = stream.get('duration') or (info.get('format') or {}).get('duration')
    return {
        'durationMs': int(round(float(duration) * 1000)) if duration else None,
        'sampleRateHz': int(stream['sample_rate']) if stream.get('sample_rate') else None,
        'channels': int(stream['channels']) if stream.get('channels') else None,
        'codec': stream.get('codec_name'),
    }


def transcode_to_master(source: pathlib.Path, media_id: int) -> dict:
    """The ONE transcode. Mono Opus master; the source is NOT touched here.

    Returns the probe of the result. The caller discards the original only
    after this returns successfully — a failed transcode must never cost
    the upload (task 1.4).
    """
    dest = master_path(media_id)
    dest.parent.mkdir(parents=True, exist_ok=True)
    tmp = dest.with_suffix('.opus.partial')
    proc = _run(['ffmpeg', '-nostdin', '-y', '-i', str(source),
                 '-vn', '-map_metadata', '-1',
                 '-ac', '1', '-c:a', 'libopus', '-b:a', OPUS_BITRATE,
                 '-vbr', 'on', '-application', OPUS_APPLICATION,
                 '-f', 'opus', str(tmp)],
                timeout=6 * 3600)
    if proc.returncode != 0 or not tmp.exists():
        tmp.unlink(missing_ok=True)
        raise AudioError('transcode failed: ' + (proc.stderr or '').strip()[-400:])
    tmp.replace(dest)
    info = probe(dest)
    info['bytes'] = dest.stat().st_size
    return info


def cut(media_id: int, start_ms: int, end_ms: int, dest: pathlib.Path,
        *, to_wav: bool = False, timeout: int = CUT_TIMEOUT_SEC) -> pathlib.Path:
    """Cut [start_ms, end_ms) out of the master, STARTING AT start_ms.

    CORRECTION, 2026-11-16. This docstring used to open with "`stream_copy`
    is the default and is what makes a chapter chunk cheap: `-c copy` muxes
    existing Opus frames, so a 45-minute chapter cuts in milliseconds and
    re-encodes nothing." Every word of that was true and the result was
    still wrong: a stream copy cannot cut between the frames it muxes, so
    the output began at the enclosing Ogg page rather than at `start_ms`.
    See the module docstring for the two bugs that came out of it. The
    parameter is gone; there is one kind of cut here now and it is precise.

    The flags, and why they are in this order:

        -ss (start - PAD)   container seek: cheap, inexact, gets us close
        -i  master
        -ss PAD             OUTPUT seek: decodes and discards the pad, so
                            the first sample written is `start_ms`
        -t  duration        a duration, not `-to`: `-to` is read against
                            the input's own timeline, which the input seek
                            has already moved. A duration cannot be
                            misread.

    `to_wav` is for phonexa's parselmouth, which wants PCM. Either way the
    output is re-encoded, which is what makes it exact.
    """
    src = master_path(media_id)
    if not src.exists():
        raise AudioError('this book has no stored audio')
    start_ms, end_ms = int(start_ms), int(end_ms)
    if end_ms <= start_ms:
        raise AudioError(f'empty cut requested: [{start_ms}, {end_ms})')
    dest.parent.mkdir(parents=True, exist_ok=True)
    # Unique per call: the background pre-cutter and a live request may ask
    # for the same chunk at the same moment, and two writers sharing one
    # `.partial` would interleave into a corrupt file. `replace` is atomic,
    # so whichever finishes last simply wins with identical bytes.
    tmp = dest.with_name(f'{dest.name}.{os.getpid()}-{uuid.uuid4().hex[:8]}.partial')
    coarse_ms = max(0, start_ms - CUT_SEEK_PAD_MS)
    fine_ms = start_ms - coarse_ms
    args = ['ffmpeg', '-nostdin', '-y',
            '-ss', f'{coarse_ms / 1000:.3f}',
            '-i', str(src),
            '-ss', f'{fine_ms / 1000:.3f}',
            '-t', f'{(end_ms - start_ms) / 1000:.3f}']
    if to_wav:
        args += ['-ac', '1', '-ar', '16000', '-c:a', 'pcm_s16le', '-f', 'wav']
    else:
        args += ['-ac', '1', '-c:a', 'libopus', '-b:a', OPUS_BITRATE,
                 '-vbr', 'on', '-application', OPUS_APPLICATION, '-f', 'opus']
    args.append(str(tmp))
    try:
        proc = _run(args, timeout)
        if proc.returncode != 0 or not tmp.exists() or tmp.stat().st_size == 0:
            raise AudioError('cut failed: ' + (proc.stderr or '').strip()[-400:])
        tmp.replace(dest)
    finally:
        tmp.unlink(missing_ok=True)
    return dest


# One lock per chunk FILE, so the background pre-cutter and a live request
# never encode the same chapter twice at once. Before this (2026-11-17) they
# could, and the request path's own deadline made it likely: the endpoint
# starts the pre-cut and then cuts the same chapter itself. `cut` is still
# safe under concurrency — each writer has its own `.partial` — but doing a
# 25-second encode twice on one box is exactly the cost this change exists to
# avoid. The dict only grows by chapter count and holds nothing but Locks.
_chunk_locks_guard = threading.Lock()
_chunk_locks: dict[str, threading.Lock] = {}


def _chunk_lock(key: str) -> threading.Lock:
    with _chunk_locks_guard:
        lock = _chunk_locks.get(key)
        if lock is None:
            lock = _chunk_locks[key] = threading.Lock()
        return lock


def _chunk_ready(path: pathlib.Path) -> bool:
    try:
        return path.stat().st_size > 0
    except OSError:
        return False


def chapter_chunk(media_id: int, segment_id: int, start_ms: int, end_ms: int,
                  *, budget_sec: int = CHUNK_CUT_TIMEOUT_SEC) -> pathlib.Path:
    """The cached chapter chunk, within a wall-clock budget.

    Normally already on disk: `shadowing.py` pre-cuts a configuration's
    chapters in the background as soon as its analysis finishes, which is
    what buys accuracy without making the operator wait for an encode on
    entering a chapter. Cutting here is the fallback for a chapter entered
    before the pre-cut reached it — slower, never wrong, never an error.

    `budget_sec` bounds the WHOLE wait, including time spent queued behind
    whoever is already encoding this exact chunk. The background pre-cutter
    passes the generous CHUNK_CUT_TIMEOUT_SEC; the request path passes
    CHUNK_REQUEST_CUT_TIMEOUT_SEC, because a web worker is being held.
    Running out raises `ChunkPending`, which means "not yet", not "no" —
    the encode that is already running carries on.
    """
    path = chunk_path(media_id, segment_id, start_ms, end_ms)
    if _chunk_ready(path):
        return path
    deadline = time.monotonic() + max(1, int(budget_sec))
    pending = ChunkPending('this chapter is still being prepared — '
                           'it is cut in the background; try again shortly')
    if not _chunk_lock(str(path)).acquire(timeout=max(0.1, deadline - time.monotonic())):
        raise pending
    try:
        if _chunk_ready(path):      # whoever held the lock just finished it
            return path
        remaining = int(deadline - time.monotonic())
        if remaining < 1:
            raise pending
        try:
            return cut(media_id, start_ms, end_ms, path, timeout=remaining)
        except AudioTimeout as exc:
            raise pending from exc
    finally:
        _chunk_lock(str(path)).release()


# ── Silence analysis — ranges only, never audio ─────────────────────────

def detect_silences(media_id: int, min_silence_ms: int) -> list[tuple[int, int]]:
    """Every silence of at least `min_silence_ms`, as (start_ms, end_ms).

    One ffmpeg pass with `silencedetect`, output to the null muxer: it
    writes no audio anywhere. Asking for the SHORTEST threshold of interest
    gives every silence with its length, so chapter silences are a filter
    over the same pass rather than a second decode.
    """
    src = master_path(media_id)
    if not src.exists():
        raise AudioError('this book has no stored audio')
    proc = _run(['ffmpeg', '-nostdin', '-i', str(src),
                 '-af', f'silencedetect=noise={SILENCE_NOISE_DB}dB:d={max(min_silence_ms, 1) / 1000:.3f}',
                 '-f', 'null', '-'],
                timeout=6 * 3600)
    if proc.returncode != 0:
        raise AudioError('silence analysis failed: ' + (proc.stderr or '').strip()[-400:])
    return _parse_silences(proc.stderr or '')


def _parse_silences(stderr: str, duration_ms: int | None = None) -> list[tuple[int, int]]:
    """ffmpeg's `silencedetect` log lines, as (start_ms, end_ms) pairs.

    `duration_ms` closes a silence that ffmpeg never ended — a span that
    fades out and stops gets a `silence_start` and no `silence_end`,
    because the stream ran out first. Dropping that pair (which this code
    did until 2026-11-16) is harmless over a whole book, where it only
    affects the final silence, and WRONG over a single sentence cut, where
    the trailing pause always runs to EOF and would therefore never be
    trimmed. Passing None keeps the old behaviour, which is what the
    whole-book pass wants.
    """
    silences: list[tuple[int, int]] = []
    pending: float | None = None
    for line in stderr.splitlines():
        if 'silence_start:' in line:
            try:
                pending = float(line.split('silence_start:')[1].split()[0])
            except (IndexError, ValueError):
                pending = None
        elif 'silence_end:' in line and pending is not None:
            try:
                end = float(line.split('silence_end:')[1].split()[0])
            except (IndexError, ValueError):
                pending = None
                continue
            silences.append((int(pending * 1000), int(end * 1000)))
            pending = None
    if pending is not None and duration_ms is not None:
        silences.append((int(pending * 1000), int(duration_ms)))
    return silences


def segment_ranges(media_id: int, duration_ms: int,
                   sentence_silence_ms: int, chapter_silence_ms: int) -> dict:
    """The whole segmentation: {'chapters': [...], 'sentences': [...],
    'silences': [...]}, all as (start_ms, end_ms) ranges.

    Sentences are the spans BETWEEN silences of at least
    `sentence_silence_ms`; chapters are the spans between the subset of
    those silences that are at least `chapter_silence_ms` long. Boundaries
    are placed at the MIDDLE of a silence, so a sentence carries a little
    of its own trailing pause and playback does not clip the last
    consonant.

    Repeatable by construction: same master + same two thresholds = same
    ranges. Nothing is written.

    THE ONE COMBINATION THAT IS NOT A SEGMENTATION (confirmed by review,
    2026-11-16): a chapter threshold SHORTER than the sentence one. The
    whole model rests on chapter cuts being a SUBSET of sentence cuts —
    long silences are a subset of medium ones. Invert it and chapter cuts
    become a superset: a chapter boundary lands inside a sentence, that
    sentence straddles two chapters, and the manifest's `offsetMs +
    durationMs` runs past the end of the chunk the phone downloaded. It is
    rejected here, at the one place every analysis goes through, rather
    than only at the endpoints that happen to be known today.
    """
    if chapter_silence_ms < sentence_silence_ms:
        raise AudioError(
            f'the chapter silence threshold ({chapter_silence_ms} ms) must be at '
            f'least the sentence one ({sentence_silence_ms} ms) — a shorter one '
            'would cut chapters inside sentences')
    silences = detect_silences(media_id, min(sentence_silence_ms, chapter_silence_ms))

    def spans(cut_points: list[int]) -> list[tuple[int, int]]:
        points = [0] + sorted(p for p in cut_points if 0 < p < duration_ms) + [duration_ms]
        return [(a, b) for a, b in zip(points, points[1:]) if b - a > 0]

    sentence_cuts = [(s + e) // 2 for s, e in silences if (e - s) >= sentence_silence_ms]
    chapter_cuts = [(s + e) // 2 for s, e in silences if (e - s) >= chapter_silence_ms]
    # The silence list travels with the ranges so the caller can derive every
    # sentence's speech window (see speech_window) from the SAME pass that
    # placed the boundaries. No second decode, and no second noise floor.
    return {'chapters': spans(chapter_cuts), 'sentences': spans(sentence_cuts),
            'silences': silences}


# ── The speech window — a playback attribute, never a boundary ──────────

def speech_window(start_ms: int, end_ms: int, silences) -> tuple[int, int]:
    """Where speech actually occurs inside the stored span [start_ms, end_ms).

    THE STORED SPAN IS NOT TOUCHED AND MUST NEVER BE. This returns a
    narrower window to PLAY and to DRAW; doneness, coverage, merge, split
    and cross-config carry-over all keep using the full span (design.md
    §2). Tightening the stored boundaries to this window was offered and
    rejected: the silence between two sentences would then belong to no
    sentence, could never be marked, and a wider sentence in another split
    config would read not-done forever.

    `silences` is the (start_ms, end_ms) list `detect_silences` already
    produced for the segmentation — the SAME pass, at the SAME noise floor
    that placed the boundaries. That is deliberate and it is the safety
    argument: this function can only ever trim audio the segmenter had
    already judged to be silence, so it cannot clip something the detector
    counted as speech. A boundary sits at the MIDDLE of a silence, so each
    span opens and closes with roughly half a pause, and that half-pause is
    exactly what is trimmed.

    Three guards on top, all of them erring towards playing too much:

      * TRIM_ONSET_GUARD_MS / TRIM_TAIL_GUARD_MS — back off from the
        detected edge, for the detector's own latency on a soft onset;
      * TRIM_MIN_SILENCE_MS — an edge silence shorter than this is not
        worth trimming and is left alone;
      * TRIM_MIN_SPEECH_MS — if what is left is implausibly short, the
        window is not believed and the FULL span is returned.

    Idempotent and total: given the same span and the same silence list it
    always returns the same pair, and the pair is always inside the span.
    """
    start_ms, end_ms = int(start_ms), int(end_ms)
    if end_ms - start_ms <= TRIM_MIN_SPEECH_MS:
        return start_ms, end_ms

    speech_start, speech_end = start_ms, end_ms
    for s_start, s_end in silences:
        if s_end <= start_ms or s_start >= end_ms:
            continue
        if (s_end - s_start) < TRIM_MIN_SILENCE_MS:
            continue
        # A LEADING silence is one that covers the span's own start.
        if s_start <= start_ms < s_end:
            speech_start = max(speech_start, min(s_end, end_ms) - TRIM_ONSET_GUARD_MS)
        # A TRAILING one covers the span's end.
        if s_start < end_ms <= s_end:
            speech_end = min(speech_end, max(s_start, start_ms) + TRIM_TAIL_GUARD_MS)

    speech_start = max(start_ms, min(speech_start, end_ms))
    speech_end = max(start_ms, min(speech_end, end_ms))
    if speech_end - speech_start < TRIM_MIN_SPEECH_MS:
        return start_ms, end_ms
    return speech_start, speech_end


def local_speech_window(media_id: int, start_ms: int, end_ms: int,
                        min_silence_ms: int) -> tuple[int, int]:
    """`speech_window` for ONE span, when no analysis silence list exists.

    Used after a manual split or merge, where the new boundary was chosen
    by the operator and not by a silence. It runs `silencedetect` over that
    span alone — seconds of audio, not a book — and feeds the result to the
    same rule, so a manually-edited sentence trims by exactly the same
    arithmetic as an analysed one.

    CORRECTION, 2026-11-17. "Exactly the same arithmetic" was a claim this
    function did not keep, and the claim was the bug rather than the code
    around it. Two differences, both now closed:

      * it ran `silencedetect` at `d=TRIM_MIN_SILENCE_MS` (120 ms) while
        analysis runs it at the CONFIG'S sentence threshold (400 ms by
        default). A split sentence therefore saw — and trimmed — short
        edge pauses that an analysed one never even detected, which is the
        opposite of conservative at onsets. The threshold is now passed in
        by the caller, from the config that owns the row.
      * it probed the span ALONE, so a boundary silence was clipped to the
        half that fell inside the span and could fail its own length test.
        The probe now extends `min_silence_ms` past each edge — still
        under a second of extra audio — so an edge silence is measured at
        its true length exactly as the whole-book pass measured it.

    Degrades to the full span on any ffmpeg trouble: no trim is always a
    correct answer, and this must never be able to fail a split.
    """
    start_ms, end_ms = int(start_ms), int(end_ms)
    if end_ms - start_ms <= TRIM_MIN_SPEECH_MS:
        return start_ms, end_ms
    src = master_path(media_id)
    if not src.exists():
        return start_ms, end_ms
    pad_ms = max(0, int(min_silence_ms))
    probe_start_ms = max(0, start_ms - pad_ms)
    probe_end_ms = end_ms + pad_ms          # past EOF is harmless: -t just ends
    coarse_ms = max(0, probe_start_ms - CUT_SEEK_PAD_MS)
    try:
        proc = _run(['ffmpeg', '-nostdin',
                     '-ss', f'{coarse_ms / 1000:.3f}', '-i', str(src),
                     '-ss', f'{(probe_start_ms - coarse_ms) / 1000:.3f}',
                     '-t', f'{(probe_end_ms - probe_start_ms) / 1000:.3f}',
                     '-af', f'silencedetect=noise={SILENCE_NOISE_DB}dB:'
                            f'd={max(int(min_silence_ms), 1) / 1000:.3f}',
                     '-f', 'null', '-'],
                    CUT_TIMEOUT_SEC)
    except AudioError:
        return start_ms, end_ms
    if proc.returncode != 0:
        return start_ms, end_ms
    # The sub-cut's clock starts at 0 AT THE COARSE SEEK POINT, not at the
    # output seek's target: `-ss` after `-i` drops frames the filter has
    # already seen, so `silencedetect` counts from `coarse_ms`. Shifting by
    # the span's own start — which this did until 2026-11-17 — therefore
    # reported every silence CUT_SEEK_PAD_MS (500 ms) late, and a window
    # measured after a split or a merge was skewed by half a second.
    # Measured, not reasoned: a silence the whole-book pass puts at
    # (4199, 4500) came back as (4699, 5000).
    local = _parse_silences(proc.stderr or '', duration_ms=probe_end_ms - coarse_ms)
    return speech_window(start_ms, end_ms,
                         [(a + coarse_ms, b + coarse_ms) for a, b in local])
