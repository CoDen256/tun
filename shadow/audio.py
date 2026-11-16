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
  * chapter chunk  a STREAM COPY cut (`-c copy`), milliseconds, cached on
                   disk and keyed by the chapter's boundaries so a moved
                   boundary cannot serve a stale chunk.

No per-sentence artefact is ever stored. The file count for a book is 1
master plus a derivable cache; it does not scale with the sentence count.

The learner's own recordings are NEVER received here, in any form. There is
no endpoint that accepts them and no path in this module that could write
one.

LAYOUT, under SHADOW_AUDIO_DIR (a named volume, see compose.yaml):

    <root>/_uploads/<upload_id>.part        resumable upload, appended to
    <root>/books/<media_id>/master.opus     the one stored artefact
    <root>/books/<media_id>/chunks/ch-<segment_id>-<start>-<end>.opus
                                            derivable cache, free to delete
"""

from __future__ import annotations

import json
import os
import pathlib
import shutil
import subprocess
import time

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
CUT_TIMEOUT_SEC = 120


class AudioError(RuntimeError):
    """ffmpeg/ffprobe refused to do the thing, with its own message attached."""


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


def chunk_path(media_id: int, segment_id: int, start_ms: int, end_ms: int) -> pathlib.Path:
    """Cache path KEYED BY THE BOUNDARIES (task 2.2).

    Putting start/end in the name is the whole invalidation strategy: a
    boundary edit changes the key, so the old file is simply never asked
    for again. It is garbage, not a stale answer, and `drop_chunk_cache`
    clears it. Correctness does not depend on remembering to invalidate.
    """
    return chunks_dir(media_id) / f'ch-{int(segment_id)}-{int(start_ms)}-{int(end_ms)}.opus'


def drop_chunk_cache(media_id: int) -> None:
    shutil.rmtree(chunks_dir(media_id), ignore_errors=True)


def delete_book_audio(media_id: int) -> None:
    """Master + cache. Called on book deletion (task 1.6)."""
    shutil.rmtree(book_dir(media_id), ignore_errors=True)


def sweep_abandoned_uploads(ttl_sec: int = UPLOAD_TTL_SEC, live_ids=None) -> int:
    """Reclaim `.part` files. Returns how many were deleted.

    Two kinds of rubbish, and only one of them is a matter of time:

      * a part file with NO live `receiving` upload row is an orphan by
        construction — nothing can ever append to it or complete it again,
        because the resume path finds uploads through the table. It goes
        immediately, whatever its age. (This is the case the first version
        of this sweep missed: it looked only at mtime, so a part file whose
        row had already been swept sat on the disk for a full day, and then
        only if another upload happened to start.)
      * a part file that still HAS a live row is a resumable upload. It
        survives until nobody has touched it for `ttl_sec`.

    `live_ids` is the set of upload ids still in state `receiving`. Passing
    None means "the caller cannot reach the database", and then only the
    TTL rule applies — a sweep that cannot tell an orphan from a resume
    must not guess.

    A part file younger than ORPHAN_GRACE_SEC is never called an orphan:
    `live_ids` was read before this glob, so an upload that started in
    between would otherwise have its brand-new file deleted underneath it.
    """
    removed = 0
    now = time.time()
    cutoff = now - ttl_sec
    for part in uploads_dir().glob('*.part'):
        try:
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
        raise AudioError(f'{args[0]} timed out after {timeout}s') from exc
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
        *, stream_copy: bool = True, to_wav: bool = False) -> pathlib.Path:
    """Cut [start_ms, end_ms) out of the master.

    `stream_copy` is the default and is what makes a chapter chunk cheap:
    `-c copy` muxes existing Opus frames, so a 45-minute chapter cuts in
    milliseconds and re-encodes nothing. Sentence previews and the Formant
    Lab handoff ask for `to_wav`, because phonexa's parselmouth wants PCM
    — those are seconds of audio, not a chapter.
    """
    src = master_path(media_id)
    if not src.exists():
        raise AudioError('this book has no stored audio')
    dest.parent.mkdir(parents=True, exist_ok=True)
    tmp = dest.with_name(dest.name + '.partial')
    args = ['ffmpeg', '-nostdin', '-y',
            '-ss', f'{start_ms / 1000:.3f}', '-to', f'{end_ms / 1000:.3f}',
            '-i', str(src)]
    if to_wav:
        args += ['-ac', '1', '-ar', '16000', '-c:a', 'pcm_s16le', '-f', 'wav']
    elif stream_copy:
        args += ['-c', 'copy', '-f', 'opus']
    else:
        args += ['-c:a', 'libopus', '-b:a', OPUS_BITRATE, '-f', 'opus']
    args.append(str(tmp))
    proc = _run(args, CUT_TIMEOUT_SEC)
    if proc.returncode != 0 or not tmp.exists() or tmp.stat().st_size == 0:
        tmp.unlink(missing_ok=True)
        raise AudioError('cut failed: ' + (proc.stderr or '').strip()[-400:])
    tmp.replace(dest)
    return dest


def chapter_chunk(media_id: int, segment_id: int, start_ms: int, end_ms: int) -> pathlib.Path:
    """The cached chapter chunk, cut on first demand (task 2.1)."""
    path = chunk_path(media_id, segment_id, start_ms, end_ms)
    if path.exists() and path.stat().st_size > 0:
        return path
    return cut(media_id, start_ms, end_ms, path, stream_copy=True)


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
    silences: list[tuple[int, int]] = []
    pending: float | None = None
    for line in (proc.stderr or '').splitlines():
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
    return silences


def segment_ranges(media_id: int, duration_ms: int,
                   sentence_silence_ms: int, chapter_silence_ms: int) -> dict:
    """The whole segmentation, as ranges: {'chapters': [...], 'sentences': [...]}.

    Sentences are the spans BETWEEN silences of at least
    `sentence_silence_ms`; chapters are the spans between the subset of
    those silences that are at least `chapter_silence_ms` long. Boundaries
    are placed at the MIDDLE of a silence, so a sentence carries a little
    of its own trailing pause and playback does not clip the last
    consonant.

    Repeatable by construction: same master + same two thresholds = same
    ranges. Nothing is written.
    """
    silences = detect_silences(media_id, min(sentence_silence_ms, chapter_silence_ms))

    def spans(cut_points: list[int]) -> list[tuple[int, int]]:
        points = [0] + sorted(p for p in cut_points if 0 < p < duration_ms) + [duration_ms]
        return [(a, b) for a, b in zip(points, points[1:]) if b - a > 0]

    sentence_cuts = [(s + e) // 2 for s, e in silences if (e - s) >= sentence_silence_ms]
    chapter_cuts = [(s + e) // 2 for s, e in silences if (e - s) >= chapter_silence_ms]
    return {'chapters': spans(chapter_cuts), 'sentences': spans(sentence_cuts)}
