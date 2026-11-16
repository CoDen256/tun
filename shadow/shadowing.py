"""
shadowing.py — shadow's server-side persistence and audio service for the
studying loop: books and their one stored Opus master, resumable uploads,
named split configurations, server-side silence analysis producing RANGES,
progress as completed time ranges, the time-position cursor, and chapter
chunks cut on demand.

Split out of phonexa into its own service (zone-isolation task 3). The only
thing that changed in that move: `db.get(User, user_id)` is gone. `users`
lives in phonexa's database and the one cross-domain foreign key
(shadowing_media.user_id -> users.id) was dropped per D42, so the profile
check asks phonexa over HTTP (phonexa_client.verify_user) and ACCEPTS the
id when phonexa cannot be reached — losing a validation is the degradation
we accept; refusing the write would be the cascade that split exists to
prevent.

CORRECTION, 2026-11-15 (shadow-studying-mode). THIS FILE USED TO SAY "Audio
is NEVER stored or decoded here", and described segmentation as running in
the browser. Both claims are now false and are corrected rather than
deleted, because the reasoning behind them is still the thing that keeps
this design honest:

  WHAT WAS REVERTED ORIGINALLY was server-side DECODING PER REQUEST — a
  Praat decode of a multi-hour file on upload, again on split, and again on
  every chapter-audio request, nothing cached. That is still forbidden.

  WHAT HAPPENS NOW is: one transcode on upload to a mono Opus master
  (audio.py), silence analysis over that master only when the operator asks
  for it, and chapter chunks produced by a STREAM COPY and cached. No
  per-sentence artefact is ever written; the file count for a book does not
  scale with its sentence count.

  WHY the reversal: the operator's sessions moved to the phone, and a
  browser that must hold the file locally cannot serve a phone (no File
  System Access API, no way to resume). Audio on the server is what makes
  "continue on the other device" possible at all.

  WHAT DID NOT CHANGE: the learner's own recordings are never received
  here. There is no endpoint in this file that accepts them, and the audio
  volume stays out of the backup set.

PROGRESS IS NOT A BOOLEAN ANY MORE. A book owns completed TIME RANGES and a
sentence is done when its whole span is covered (progress.py, design.md
§4). `shadowing_segments.done` is a frozen legacy column: never read, never
written. That is what carries progress across split configs and across a
re-split.
"""

from __future__ import annotations

import datetime
import io
import os
import pathlib
import tempfile
import threading
import time
import uuid

from flask import Blueprint, jsonify, request, send_file

import audio
import phonexa_client
import progress
from db.models import (
    ShadowingCursor,
    ShadowingMedia,
    ShadowingProgressRange,
    ShadowingSegment,
    ShadowingSplitConfig,
    ShadowingUpload,
)
from db.session import get_sessionmaker

shadowing_bp = Blueprint('shadowing', __name__)

DEFAULT_SENTENCE_SILENCE_MS = 400
DEFAULT_CHAPTER_SILENCE_MS = 2500
# 8 MiB slices: big enough that a 1 GB book is ~128 requests rather than
# thousands, small enough that a dropped connection costs seconds. The
# gateway imposes no body limit (verified: no `request_body` directive in
# grind/caddy/), so this is purely a client/server choice.
UPLOAD_CHUNK_BYTES = 8 * 1024 * 1024


# ── helpers ─────────────────────────────────────────────────────────────

def _require_user_id():
    """userId from the query string or the JSON body; None when absent."""
    user_id = request.args.get('userId', type=int)
    if user_id is None:
        body = request.get_json(silent=True) or {}
        try:
            user_id = int(body.get('userId'))
        except (TypeError, ValueError):
            user_id = None
    return user_id


def _ranges_for(db, media_id: int, user_id: int) -> list[tuple[int, int]]:
    rows = (db.query(ShadowingProgressRange)
            .filter_by(media_id=media_id, user_id=user_id)
            .order_by(ShadowingProgressRange.start_ms).all())
    return [(r.start_ms, r.end_ms) for r in rows]


def _store_ranges(db, media_id: int, user_id: int, ranges) -> list[tuple[int, int]]:
    """Replace the stored set with a normalised one (task 4.1).

    Delete-then-insert rather than a diff: the set is small by construction
    (normalisation merges adjacent ranges, so a fully-read book is ONE
    row), and a diff would be more code guarding a smaller write.
    """
    normalised = progress.normalize(ranges)
    db.query(ShadowingProgressRange).filter_by(media_id=media_id, user_id=user_id).delete()
    for start_ms, end_ms in normalised:
        db.add(ShadowingProgressRange(media_id=media_id, user_id=user_id,
                                      start_ms=start_ms, end_ms=end_ms))
    return normalised


def _cursor_ms(db, media_id: int, user_id: int) -> int | None:
    row = db.query(ShadowingCursor).filter_by(media_id=media_id, user_id=user_id).first()
    return row.position_ms if row else None


def _segment_json(s: ShadowingSegment, ranges) -> dict:
    return {
        'id': s.id, 'kind': s.kind, 'parentId': s.parent_segment_id,
        'configId': s.config_id, 'orderIndex': s.order_index,
        'startMs': s.start_ms, 'endMs': s.end_ms, 'durationMs': s.end_ms - s.start_ms,
        'text': s.text,
        # DERIVED, never stored: fully covered by the book's completed ranges.
        'done': progress.covers(ranges, s.start_ms, s.end_ms),
    }


def _config_json(c: ShadowingSplitConfig, ranges=()) -> dict:
    sentences = [s for s in c.segments if s.kind == 'sentence']
    return {
        'id': c.id, 'mediaId': c.media_id, 'name': c.name,
        'sentenceSilenceMs': c.sentence_silence_ms, 'chapterSilenceMs': c.chapter_silence_ms,
        'isActive': c.is_active,
        'analysisState': c.analysis_state, 'analysisError': c.analysis_error,
        'chapterCount': sum(1 for s in c.segments if s.kind == 'chapter'),
        'sentenceCount': len(sentences),
        'doneCount': sum(1 for s in sentences if progress.covers(ranges, s.start_ms, s.end_ms)),
    }


_WORKING_AUDIO = ('uploading', 'transcoding')


def _iso_utc(dt) -> str | None:
    """`updated_at` is a naive UTC timestamp; say so, so the browser does not
    read it as local time and compute an elapsed of several hours."""
    if dt is None:
        return None
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=datetime.timezone.utc)
    return dt.isoformat()


def _media_json(m: ShadowingMedia, ranges=(), cursor_ms=None) -> dict:
    active = m.active_config
    sentences = sorted([s for s in (active.segments if active else []) if s.kind == 'sentence'],
                       key=lambda s: s.start_ms)
    done = [s for s in sentences if progress.covers(ranges, s.start_ms, s.end_ms)]
    cursor_sentence = progress.resolve_cursor(
        [{'id': s.id, 'start_ms': s.start_ms, 'end_ms': s.end_ms} for s in sentences], cursor_ms)
    cursor_index = next((i for i, s in enumerate(sentences)
                         if cursor_sentence and s.id == cursor_sentence['id']), None)
    chapter_index = None
    if cursor_index is not None and sentences[cursor_index].parent_segment_id is not None:
        chapters = sorted([s for s in active.segments if s.kind == 'chapter'],
                          key=lambda s: s.start_ms)
        chapter_index = next((i for i, c in enumerate(chapters)
                              if c.id == sentences[cursor_index].parent_segment_id), None)
    return {
        'id': m.id, 'title': m.title or m.original_filename,
        'originalFilename': m.original_filename, 'fileSizeBytes': m.file_size_bytes,
        'durationMs': m.duration_ms, 'sampleRateHz': m.sample_rate_hz, 'channels': m.channels,
        'audioState': m.audio_state, 'audioError': m.audio_error, 'audioBytes': m.audio_bytes,
        'hasAudio': bool(m.audio_path),
        'createdAt': m.created_at.isoformat() if m.created_at else None,
        'activeConfigId': active.id if active else None,
        'activeConfigName': active.name if active else None,
        'analysisState': active.analysis_state if active else 'idle',
        'analysisError': active.analysis_error if active else None,
        # When the CURRENT operation started, so the page can estimate
        # against this operation rather than against whenever it first
        # happened to notice the book. `updated_at` is the honest answer:
        # the only writes to either row while it is working are the ones
        # that set the working state, and the next write ends it.
        'audioStateSince': _iso_utc(m.updated_at) if m.audio_state in _WORKING_AUDIO else None,
        'analysisSince': (_iso_utc(active.updated_at)
                          if active is not None and active.analysis_state == 'running' else None),
        'configCount': len(m.configs),
        'chapterCount': sum(1 for s in (active.segments if active else []) if s.kind == 'chapter'),
        'sentenceCount': len(sentences),
        'doneCount': len(done),
        'cursorMs': cursor_ms,
        'cursorSegmentId': cursor_sentence['id'] if cursor_sentence else None,
        'cursorSentenceIndex': cursor_index,
        'cursorChapterIndex': chapter_index,
    }


def _media_detail_json(m: ShadowingMedia, ranges, cursor_ms) -> dict:
    out = _media_json(m, ranges, cursor_ms)
    active = m.active_config
    out['configs'] = [_config_json(c, ranges) for c in m.configs]
    out['segments'] = [_segment_json(s, ranges)
                       for s in sorted(active.segments if active else [],
                                       key=lambda s: (s.kind != 'chapter', s.start_ms))]
    out['progressRanges'] = [{'startMs': a, 'endMs': b} for a, b in ranges]
    return out


def _not_found():
    return jsonify({'error': 'not found'}), 404


# ══════════════════════════════════════════════════════════════════════════
# Resumable upload (design.md §9)
#
# The server appends slices to ONE temp file and never holds a book in
# memory; `received_bytes` is the resume point and the only thing the client
# needs to continue after its tab died. A single large POST was rejected in
# design: no honest progress, no recovery.
# ══════════════════════════════════════════════════════════════════════════

def _upload_json(u: ShadowingUpload) -> dict:
    return {
        'uploadId': u.id, 'userId': u.user_id, 'fingerprint': u.fingerprint,
        'originalFilename': u.original_filename,
        'sizeBytes': u.size_bytes, 'receivedBytes': u.received_bytes,
        'state': u.state, 'error': u.error, 'mediaId': u.media_id,
        'chunkBytes': UPLOAD_CHUNK_BYTES,
    }


def _sweep_upload_rows(db) -> None:
    """Drop upload rows whose temp file is gone or whose work is long over.

    The row half of the chore `sweep_uploads` runs; a finished or abandoned
    upload must not accumulate forever in a table the operator never looks
    at. A finished row is kept for a day because a client that lost the
    `complete` response still asks this table which book it got.

    The ORDER matters, and it is why this runs before the file sweep: a row
    deleted here turns its part file into an orphan, and the file sweep
    immediately afterwards reclaims it in the same pass rather than a day
    later.
    """
    cutoff = datetime.datetime.utcnow() - datetime.timedelta(seconds=audio.UPLOAD_TTL_SEC)
    for row in db.query(ShadowingUpload).all():
        stale = row.updated_at is not None and row.updated_at < cutoff
        missing = not audio.upload_part_path(row.id).exists()
        if (row.state in ('done', 'failed') and stale) or (row.state == 'receiving' and missing and stale):
            db.delete(row)
    db.commit()


def sweep_uploads() -> int:
    """Task 1.5, both halves, in the one order that works: rows first, then
    the files the rows no longer claim.

    Returns the number of part files reclaimed. Every caller is allowed to
    fail: cleanup is never the reason a request or a boot goes wrong.
    """
    live: set[str] | None = None
    try:
        with get_sessionmaker()() as db:
            _sweep_upload_rows(db)
            live = {r.id for r in db.query(ShadowingUpload).filter_by(state='receiving').all()}
    except Exception:  # noqa: BLE001 — a database outage must not stop the disk sweep
        live = None
    return audio.sweep_abandoned_uploads(live_ids=live)


def start_upload_janitor() -> None:
    """One daemon thread, started by scripts/bootstrap.py after the port is
    bound, sweeping every `SWEEP_INTERVAL_SEC`.

    This is NOT a scheduler creeping in: shadow runs a single process with
    one of these threads, and the work is a glob of one directory. The
    earlier design (sweep only when a new upload starts) meant an operator
    who abandoned an upload and never uploaded again kept the bytes
    forever, which is exactly what was found on disk.
    """
    def loop():
        # A short head start: the first sweep wants the uploads table, and
        # at boot the migration may still be running behind the readiness
        # flag (D157). Being early only costs this pass its orphan rule.
        time.sleep(15)
        while True:
            try:
                n = sweep_uploads()
                if n:
                    print(f'shadow — swept {n} abandoned upload part file(s)', flush=True)
            except Exception as exc:  # noqa: BLE001
                print(f'shadow — upload sweep failed: {exc}', flush=True)
            time.sleep(audio.SWEEP_INTERVAL_SEC)

    threading.Thread(target=loop, name='shadow-upload-janitor', daemon=True).start()


@shadowing_bp.route('/api/v1/shadowing/uploads', methods=['POST'])
def start_upload():
    """Begin (or RESUME) an upload. Body: {userId, filename, sizeBytes}.

    Resume is keyed on (userId, fingerprint) where the fingerprint is
    derived server-side from the filename and the byte size, so offering
    the same file again after a crash finds the same temp file and answers
    with how much of it already landed — the client then seeks there. The
    client computes nothing and sends no hash.
    """
    data = request.get_json(silent=True) or {}
    user_id = _require_user_id()
    filename = (data.get('filename') or '').strip()
    try:
        size_bytes = int(data.get('sizeBytes'))
    except (TypeError, ValueError):
        size_bytes = 0
    if user_id is None or not filename or size_bytes <= 0:
        return jsonify({'error': 'userId, filename and sizeBytes are required'}), 400

    fingerprint = f'{filename}:{size_bytes}'
    sweep_uploads()  # task 1.5 — an upload is exactly when the disk is about
                     # to be used; the janitor thread covers the rest of the time

    with get_sessionmaker()() as db:
        if phonexa_client.verify_user(user_id) is False:
            return jsonify({'error': 'no such user'}), 404

        existing = (db.query(ShadowingMedia)
                    .filter_by(user_id=user_id, fingerprint=fingerprint).first())
        if existing is not None and existing.audio_state == 'ready':
            # Re-upload deduplication: this book is already here, whole.
            return jsonify({'alreadyExists': True, 'mediaId': existing.id}), 200

        upload = (db.query(ShadowingUpload)
                  .filter_by(user_id=user_id, fingerprint=fingerprint, state='receiving')
                  .first())
        if upload is None:
            upload = ShadowingUpload(
                id=uuid.uuid4().hex, user_id=user_id, fingerprint=fingerprint,
                original_filename=filename, size_bytes=size_bytes, received_bytes=0)
            db.add(upload)
            db.commit()
            db.refresh(upload)
        else:
            # Trust the FILE, not the row: a crash between the write and the
            # commit would otherwise make the client resume from too far on.
            part = audio.upload_part_path(upload.id)
            on_disk = part.stat().st_size if part.exists() else 0
            if on_disk != upload.received_bytes:
                upload.received_bytes = on_disk
                db.commit()
        return jsonify(_upload_json(upload)), 201


@shadowing_bp.route('/api/v1/shadowing/uploads/<upload_id>')
def get_upload(upload_id):
    """"How much of this do you already have?" — the resume query."""
    with get_sessionmaker()() as db:
        upload = db.get(ShadowingUpload, upload_id)
        if upload is None:
            return _not_found()
        return jsonify(_upload_json(upload))


@shadowing_bp.route('/api/v1/shadowing/uploads/<upload_id>', methods=['PUT'])
def append_upload_slice(upload_id):
    """Append one raw slice at `?offset=`. Streamed to disk, never buffered.

    The offset is checked rather than trusted: a slice that does not start
    exactly where the file ends is refused with the real offset, so a
    confused client re-syncs instead of writing a corrupt book.
    """
    offset = request.args.get('offset', type=int)
    with get_sessionmaker()() as db:
        upload = db.get(ShadowingUpload, upload_id)
        if upload is None:
            return _not_found()
        if upload.state != 'receiving':
            return jsonify({'error': f'upload is {upload.state}'}), 409
        part = audio.upload_part_path(upload.id)
        on_disk = part.stat().st_size if part.exists() else 0
        if offset is not None and offset != on_disk:
            return jsonify({'error': 'offset mismatch', 'receivedBytes': on_disk}), 409

        written = 0
        stream = request.stream
        with open(part, 'ab') as fh:
            while True:
                block = stream.read(1024 * 1024)
                if not block:
                    break
                fh.write(block)
                written += len(block)
        upload.received_bytes = part.stat().st_size
        db.commit()
        db.refresh(upload)
        out = _upload_json(upload)
        out['writtenBytes'] = written
        return jsonify(out)


@shadowing_bp.route('/api/v1/shadowing/uploads/<upload_id>/complete', methods=['POST'])
def complete_upload(upload_id):
    """The last slice has landed: create the book, transcode ONCE, analyse.

    The transcode runs on a background thread so a multi-hour book does not
    hold an HTTP connection open for minutes; the Library polls
    `audioState`. The uploaded original is deleted only after the transcode
    succeeds (task 1.4). The transcode then hands straight over to the
    book's first analysis with the default thresholds — an upload that
    needed a trip to Prepare before it had any segmentation was never the
    designed flow (design.md §8).
    """
    with get_sessionmaker()() as db:
        upload = db.get(ShadowingUpload, upload_id)
        if upload is None:
            return _not_found()
        part = audio.upload_part_path(upload.id)
        on_disk = part.stat().st_size if part.exists() else 0
        if on_disk < upload.size_bytes:
            return jsonify({'error': 'upload is incomplete',
                            'receivedBytes': on_disk, 'sizeBytes': upload.size_bytes}), 409

        media = (db.query(ShadowingMedia)
                 .filter_by(user_id=upload.user_id, fingerprint=upload.fingerprint).first())
        if media is None:
            media = ShadowingMedia(
                user_id=upload.user_id, fingerprint=upload.fingerprint,
                original_filename=upload.original_filename, title=upload.original_filename,
                file_size_bytes=min(on_disk, 2_147_483_647),
                sentence_silence_ms=DEFAULT_SENTENCE_SILENCE_MS,
                chapter_silence_ms=DEFAULT_CHAPTER_SILENCE_MS,
                audio_state='transcoding')
            db.add(media)
            db.flush()
            db.add(ShadowingSplitConfig(
                media_id=media.id, name='Default split',
                sentence_silence_ms=DEFAULT_SENTENCE_SILENCE_MS,
                chapter_silence_ms=DEFAULT_CHAPTER_SILENCE_MS,
                is_active=True))
        else:
            media.audio_state = 'transcoding'
            media.audio_error = None
        upload.state = 'transcoding'
        upload.media_id = media.id
        db.commit()
        media_id = media.id

    threading.Thread(target=_transcode_job, args=(upload_id, media_id), daemon=True).start()
    return jsonify({'mediaId': media_id, 'state': 'transcoding'}), 202


def _transcode_job(upload_id: str, media_id: int) -> None:
    part = audio.upload_part_path(upload_id)
    try:
        info = audio.transcode_to_master(part, media_id)
        part.unlink(missing_ok=True)  # the original is discarded — design.md §1
        with get_sessionmaker()() as db:
            media = db.get(ShadowingMedia, media_id)
            media.audio_path = f'books/{media_id}/master.opus'
            media.audio_bytes = info['bytes']
            media.duration_ms = info['durationMs']
            media.sample_rate_hz = info['sampleRateHz']
            media.channels = info['channels']
            media.audio_state = 'ready'
            media.audio_error = None
            upload = db.get(ShadowingUpload, upload_id)
            if upload is not None:
                upload.state = 'done'
            # Upload -> transcode -> ANALYSE, with no operator action: the
            # designed flow (design.md §8, "a determinate analysing state")
            # is that a dropped book segments itself. Marking the active
            # config `running` here, in the same transaction that makes the
            # audio ready, means the Library never sees a ready book with an
            # idle config and "0 chapters" — there is no gap to poll into.
            config = next((c for c in media.configs if c.is_active), None)
            if config is None:
                config = next(iter(media.configs), None)
            if config is not None:
                config.analysis_state = 'running'
                config.analysis_error = None
            config_id = config.id if config is not None else None
            db.commit()
        if config_id is not None:
            _start_analysis(config_id)
    except Exception as exc:  # noqa: BLE001 — the reason must reach the page
        with get_sessionmaker()() as db:
            media = db.get(ShadowingMedia, media_id)
            if media is not None:
                media.audio_state = 'failed'
                media.audio_error = str(exc)[:500]
            upload = db.get(ShadowingUpload, upload_id)
            if upload is not None:
                upload.state = 'failed'
                upload.error = str(exc)[:500]
            db.commit()


@shadowing_bp.route('/api/v1/shadowing/uploads/<upload_id>', methods=['DELETE'])
def abandon_upload(upload_id):
    with get_sessionmaker()() as db:
        upload = db.get(ShadowingUpload, upload_id)
        if upload is None:
            return _not_found()
        audio.upload_part_path(upload.id).unlink(missing_ok=True)
        db.delete(upload)
        db.commit()
    return jsonify({'ok': True})


# ══════════════════════════════════════════════════════════════════════════
# Books
# ══════════════════════════════════════════════════════════════════════════

@shadowing_bp.route('/api/v1/shadowing/media')
def list_shadowing_media():
    user_id = request.args.get('userId', type=int)
    if user_id is None:
        return jsonify({'error': 'userId query param is required'}), 400
    with get_sessionmaker()() as db:
        media = (db.query(ShadowingMedia).filter_by(user_id=user_id)
                 .order_by(ShadowingMedia.created_at.desc()).all())
        return jsonify([
            _media_json(m, _ranges_for(db, m.id, user_id), _cursor_ms(db, m.id, user_id))
            for m in media
        ])


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>')
def get_shadowing_media(media_id):
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        user_id = request.args.get('userId', type=int) or media.user_id
        return jsonify(_media_detail_json(media, _ranges_for(db, media_id, user_id),
                                          _cursor_ms(db, media_id, user_id)))


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>', methods=['PATCH'])
def patch_shadowing_media(media_id):
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        if 'title' in data:
            media.title = (data['title'] or '').strip() or None
        db.commit()
        user_id = request.args.get('userId', type=int) or media.user_id
        return jsonify(_media_json(media, _ranges_for(db, media_id, user_id),
                                   _cursor_ms(db, media_id, user_id)))


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>', methods=['DELETE'])
def delete_shadowing_media(media_id):
    """Rows AND the stored audio (task 1.6) — master, chunk cache, the lot."""
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        # Upload rows carry media_id as a plain integer (no FK — the row
        # outlives the upload on purpose), so they are cleaned explicitly.
        db.query(ShadowingUpload).filter_by(media_id=media_id).delete()
        db.delete(media)   # cascades to configs, segments, ranges, cursors
        db.commit()
    audio.delete_book_audio(media_id)
    return jsonify({'ok': True})


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/audio')
def get_master_audio(media_id):
    """The whole master, Range-capable — for the desktop's waveform.

    The PHONE never asks for this: its unit of download is a chapter chunk
    (design.md §3), which is why this route is not on the mobile path.
    """
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None or not media.audio_path:
            return _not_found()
    path = audio.master_path(media_id)
    if not path.exists():
        return _not_found()
    return send_file(path, mimetype='audio/ogg', conditional=True)


# ══════════════════════════════════════════════════════════════════════════
# Split configurations (design.md §5)
# ══════════════════════════════════════════════════════════════════════════

@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/configs')
def list_configs(media_id):
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        user_id = request.args.get('userId', type=int) or media.user_id
        ranges = _ranges_for(db, media_id, user_id)
        return jsonify([_config_json(c, ranges) for c in media.configs])


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/configs', methods=['POST'])
def create_config(media_id):
    """New config. `analyze: true` starts analysis straight away.

    Creating one never touches the master and never re-transcodes: a config
    is thresholds plus rows.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        config = ShadowingSplitConfig(
            media_id=media_id,
            name=(data.get('name') or f'Split {len(media.configs) + 1}').strip(),
            sentence_silence_ms=int(data.get('sentenceSilenceMs') or DEFAULT_SENTENCE_SILENCE_MS),
            chapter_silence_ms=int(data.get('chapterSilenceMs') or DEFAULT_CHAPTER_SILENCE_MS),
            is_active=False)
        db.add(config)
        db.commit()
        db.refresh(config)
        config_id = config.id
        if data.get('makeActive'):
            _activate(db, media_id, config_id)
            db.commit()
        should_analyze = bool(data.get('analyze'))
        out = _config_json(config, _ranges_for(db, media_id, media.user_id))
    if should_analyze:
        _start_analysis(config_id)
        out['analysisState'] = 'running'
    return jsonify(out), 201


def _activate(db, media_id: int, config_id: int) -> None:
    """Exactly one active config, enforced on write."""
    db.query(ShadowingSplitConfig).filter_by(media_id=media_id).update({'is_active': False})
    db.query(ShadowingSplitConfig).filter_by(id=config_id).update({'is_active': True})


@shadowing_bp.route('/api/v1/shadowing/configs/<int:config_id>')
def get_config(config_id):
    with get_sessionmaker()() as db:
        config = db.get(ShadowingSplitConfig, config_id)
        if config is None:
            return _not_found()
        user_id = request.args.get('userId', type=int) or config.media.user_id
        ranges = _ranges_for(db, config.media_id, user_id)
        out = _config_json(config, ranges)
        out['segments'] = [_segment_json(s, ranges)
                           for s in sorted(config.segments,
                                           key=lambda s: (s.kind != 'chapter', s.start_ms))]
        return jsonify(out)


@shadowing_bp.route('/api/v1/shadowing/configs/<int:config_id>', methods=['PATCH'])
def patch_config(config_id):
    """Rename, and/or make active. Neither touches audio or boundaries."""
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        config = db.get(ShadowingSplitConfig, config_id)
        if config is None:
            return _not_found()
        if 'name' in data:
            name = (data['name'] or '').strip()
            if not name:
                return jsonify({'error': 'name cannot be empty'}), 400
            config.name = name
        if data.get('isActive'):
            _activate(db, config.media_id, config_id)
        db.commit()
        db.refresh(config)
        return jsonify(_config_json(config, _ranges_for(db, config.media_id, config.media.user_id)))


@shadowing_bp.route('/api/v1/shadowing/configs/<int:config_id>/duplicate', methods=['POST'])
def duplicate_config(config_id):
    """A copy with the same boundaries — the safe way to try an edit.

    Chapters are copied first so a sentence's `parent_segment_id` can be
    remapped to the copy's chapter rather than pointing back at the
    original's.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        src = db.get(ShadowingSplitConfig, config_id)
        if src is None:
            return _not_found()
        copy = ShadowingSplitConfig(
            media_id=src.media_id, name=(data.get('name') or f'{src.name} (copy)').strip(),
            sentence_silence_ms=src.sentence_silence_ms,
            chapter_silence_ms=src.chapter_silence_ms, is_active=False)
        db.add(copy)
        db.flush()
        id_map: dict[int, int] = {}
        for s in sorted(src.segments, key=lambda s: (s.kind != 'chapter', s.start_ms)):
            row = ShadowingSegment(
                media_id=s.media_id, config_id=copy.id, kind=s.kind,
                parent_segment_id=id_map.get(s.parent_segment_id),
                order_index=s.order_index, start_ms=s.start_ms, end_ms=s.end_ms, text=s.text)
            db.add(row)
            db.flush()
            id_map[s.id] = row.id
        db.commit()
        db.refresh(copy)
        return jsonify(_config_json(copy, _ranges_for(db, copy.media_id, copy.media.user_id))), 201


@shadowing_bp.route('/api/v1/shadowing/configs/<int:config_id>', methods=['DELETE'])
def delete_config(config_id):
    """Deleting a config deletes ITS rows. Progress is untouched — it is not
    in a config (design.md §4)."""
    with get_sessionmaker()() as db:
        config = db.get(ShadowingSplitConfig, config_id)
        if config is None:
            return _not_found()
        media_id, was_active = config.media_id, config.is_active
        if db.query(ShadowingSplitConfig).filter_by(media_id=media_id).count() <= 1:
            return jsonify({'error': 'a book must keep at least one split config'}), 400
        db.delete(config)
        db.flush()
        if was_active:
            remaining = (db.query(ShadowingSplitConfig)
                         .filter_by(media_id=media_id).order_by(ShadowingSplitConfig.id).first())
            if remaining is not None:
                _activate(db, media_id, remaining.id)
        db.commit()
    return jsonify({'ok': True})


@shadowing_bp.route('/api/v1/shadowing/configs/<int:config_id>/analyze', methods=['POST'])
def analyze_config(config_id):
    """(Re-)run silence analysis for THIS config. Ranges only; no audio written.

    Destructive to this config's boundary rows, including manual edits —
    the page warns before calling, and the warning is scoped to this config
    because no other config's rows are touched. Progress is never affected.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        config = db.get(ShadowingSplitConfig, config_id)
        if config is None:
            return _not_found()
        if config.media.audio_state != 'ready':
            return jsonify({'error': 'this book has no stored audio to analyse'}), 409
        if 'sentenceSilenceMs' in data:
            config.sentence_silence_ms = int(data['sentenceSilenceMs'])
        if 'chapterSilenceMs' in data:
            config.chapter_silence_ms = int(data['chapterSilenceMs'])
        config.analysis_state = 'running'
        config.analysis_error = None
        db.commit()
    _start_analysis(config_id)
    return jsonify({'configId': config_id, 'analysisState': 'running'}), 202


def _start_analysis(config_id: int) -> None:
    threading.Thread(target=_analysis_job, args=(config_id,), daemon=True).start()


def _analysis_job(config_id: int) -> None:
    try:
        with get_sessionmaker()() as db:
            config = db.get(ShadowingSplitConfig, config_id)
            if config is None:
                return
            media_id = config.media_id
            duration_ms = config.media.duration_ms or 0
            sentence_ms, chapter_ms = config.sentence_silence_ms, config.chapter_silence_ms
            config.analysis_state = 'running'
            db.commit()
        if duration_ms <= 0:
            raise audio.AudioError('the book has no known duration')
        result = audio.segment_ranges(media_id, duration_ms, sentence_ms, chapter_ms)

        with get_sessionmaker()() as db:
            config = db.get(ShadowingSplitConfig, config_id)
            db.query(ShadowingSegment).filter_by(config_id=config_id).delete()
            db.flush()
            chapters = []
            for i, (start_ms, end_ms) in enumerate(result['chapters']):
                row = ShadowingSegment(media_id=media_id, config_id=config_id, kind='chapter',
                                       parent_segment_id=None, order_index=i,
                                       start_ms=start_ms, end_ms=end_ms)
                db.add(row)
                db.flush()
                chapters.append(row)
            order_in_chapter: dict[int, int] = {}
            for start_ms, end_ms in result['sentences']:
                parent = next((c for c in chapters if c.start_ms <= start_ms < c.end_ms),
                              chapters[0] if chapters else None)
                idx = order_in_chapter.get(parent.id if parent else 0, 0)
                order_in_chapter[parent.id if parent else 0] = idx + 1
                db.add(ShadowingSegment(
                    media_id=media_id, config_id=config_id, kind='sentence',
                    parent_segment_id=parent.id if parent else None, order_index=idx,
                    start_ms=start_ms, end_ms=end_ms))
            config.analysis_state = 'idle'
            config.analysis_error = None
            db.commit()
        # Chapter boundaries moved, so every cached chunk is keyed on a
        # boundary that no longer exists. Dropping it is free (task 2.2).
        audio.drop_chunk_cache(media_id)
    except Exception as exc:  # noqa: BLE001
        with get_sessionmaker()() as db:
            config = db.get(ShadowingSplitConfig, config_id)
            if config is not None:
                config.analysis_state = 'failed'
                config.analysis_error = str(exc)[:500]
                db.commit()


# ══════════════════════════════════════════════════════════════════════════
# Chapter chunks — the phone's unit of download (design.md §3)
# ══════════════════════════════════════════════════════════════════════════

@shadowing_bp.route('/api/v1/shadowing/chapters/<int:segment_id>/manifest')
def chapter_manifest(segment_id):
    """What is inside this chapter, in chunk-relative time.

    `offsetMs` is the sentence's position WITHIN the fetched chunk: the
    client seeks inside the audio element it already has rather than making
    an audio request per sentence.
    """
    with get_sessionmaker()() as db:
        chapter = db.get(ShadowingSegment, segment_id)
        if chapter is None or chapter.kind != 'chapter':
            return _not_found()
        user_id = request.args.get('userId', type=int) or chapter.media.user_id
        ranges = _ranges_for(db, chapter.media_id, user_id)
        sentences = sorted(
            [s for s in chapter.config.segments
             if s.kind == 'sentence' and s.parent_segment_id == chapter.id],
            key=lambda s: s.start_ms)
        return jsonify({
            'chapterId': chapter.id, 'mediaId': chapter.media_id, 'configId': chapter.config_id,
            'startMs': chapter.start_ms, 'endMs': chapter.end_ms,
            'durationMs': chapter.end_ms - chapter.start_ms,
            'chunkUrl': f'/api/v1/shadowing/chapters/{chapter.id}/chunk',
            'sentences': [
                dict(_segment_json(s, ranges), offsetMs=s.start_ms - chapter.start_ms)
                for s in sentences
            ],
        })


@shadowing_bp.route('/api/v1/shadowing/chapters/<int:segment_id>/chunk')
def chapter_chunk(segment_id):
    """The chapter's audio, stream-copied out of the master and cached.

    Cached under a name containing the chapter's current boundaries, so a
    boundary edit can never serve a stale chunk: the new boundaries address
    a different file. The cache is pure derivation — deleting it costs one
    re-cut of a few milliseconds.
    """
    with get_sessionmaker()() as db:
        chapter = db.get(ShadowingSegment, segment_id)
        if chapter is None or chapter.kind != 'chapter':
            return _not_found()
        media_id, start_ms, end_ms = chapter.media_id, chapter.start_ms, chapter.end_ms
        if chapter.media.audio_state != 'ready':
            return jsonify({'error': 'this book has no stored audio'}), 409
    try:
        path = audio.chapter_chunk(media_id, segment_id, start_ms, end_ms)
    except audio.AudioError as exc:
        return jsonify({'error': str(exc)}), 503
    return send_file(path, mimetype='audio/ogg', conditional=True)


@shadowing_bp.route('/api/v1/shadowing/segments/<int:segment_id>/audio')
def segment_audio(segment_id):
    """One sentence's audio, cut live — NOT cached, NOT stored.

    This is what Prepare's per-row preview, Explore's ▶ and the Formant Lab
    handoff use. It is cut on every request on purpose: caching per
    sentence would be exactly the per-sentence artefact this design
    forbids, and a sentence is a few seconds of Opus.

    `?format=wav` for phonexa, which wants PCM for parselmouth.
    """
    want_wav = request.args.get('format') == 'wav'
    with get_sessionmaker()() as db:
        seg = db.get(ShadowingSegment, segment_id)
        if seg is None:
            return _not_found()
        if seg.media.audio_state != 'ready':
            return jsonify({'error': 'this book has no stored audio'}), 409
        media_id, start_ms, end_ms = seg.media_id, seg.start_ms, seg.end_ms
    suffix = '.wav' if want_wav else '.opus'
    tmp = tempfile.NamedTemporaryFile(prefix='seg-', suffix=suffix, delete=False)
    tmp.close()
    try:
        audio.cut(media_id, start_ms, end_ms, pathlib.Path(tmp.name),
                  stream_copy=not want_wav, to_wav=want_wav)
        data = open(tmp.name, 'rb').read()
    except audio.AudioError as exc:
        return jsonify({'error': str(exc)}), 503
    finally:
        os.unlink(tmp.name)
    return send_file(io.BytesIO(data), mimetype='audio/wav' if want_wav else 'audio/ogg',
                     download_name=f'sentence-{segment_id}{suffix}')


# ══════════════════════════════════════════════════════════════════════════
# Progress and the cursor (design.md §4)
# ══════════════════════════════════════════════════════════════════════════

@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/progress')
def get_progress(media_id):
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        user_id = request.args.get('userId', type=int) or media.user_id
        ranges = _ranges_for(db, media_id, user_id)
        return jsonify({
            'mediaId': media_id, 'userId': user_id,
            'ranges': [{'startMs': a, 'endMs': b} for a, b in ranges],
            'coveredMs': progress.covered_ms(ranges, 0, media.duration_ms or 0),
            'cursorMs': _cursor_ms(db, media_id, user_id),
        })


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/progress', methods=['POST'])
def post_progress(media_id):
    """Mark done / not done, by segment ids or by raw spans.

    Body: {userId, doneSegmentIds[], notDoneSegmentIds[],
           doneRanges[{startMs,endMs}], notDoneRanges[...]}

    One endpoint for single marking and for Explore's bulk marking, because
    they are the same operation: both just add or remove spans on the
    book's one range set, which is why a bulk mark is instantly visible in
    every config. Un-marking is applied after marking, so a request that
    does both ends with the removal winning.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        user_id = _require_user_id() or media.user_id

        def spans_from_ids(ids):
            if not ids:
                return []
            rows = (db.query(ShadowingSegment)
                    .filter(ShadowingSegment.media_id == media_id,
                            ShadowingSegment.id.in_([int(i) for i in ids])).all())
            return [(r.start_ms, r.end_ms) for r in rows]

        def spans_from_ranges(raw):
            return [(int(r['startMs']), int(r['endMs'])) for r in (raw or [])]

        ranges = _ranges_for(db, media_id, user_id)
        ranges = progress.add(ranges, *spans_from_ids(data.get('doneSegmentIds')),
                              *spans_from_ranges(data.get('doneRanges')))
        ranges = progress.subtract(ranges, *spans_from_ids(data.get('notDoneSegmentIds')),
                                   *spans_from_ranges(data.get('notDoneRanges')))
        ranges = _store_ranges(db, media_id, user_id, ranges)
        db.commit()
        return jsonify({
            'mediaId': media_id, 'userId': user_id,
            'ranges': [{'startMs': a, 'endMs': b} for a, b in ranges],
            'doneCount': sum(1 for s in (media.active_config.segments if media.active_config else [])
                             if s.kind == 'sentence' and progress.covers(ranges, s.start_ms, s.end_ms)),
        })


@shadowing_bp.route('/api/v1/shadowing/media/<int:media_id>/cursor', methods=['PUT'])
def put_cursor(media_id):
    """Store the reading position as a TIME. Body: {userId, positionMs} or {segmentId}.

    Written on every navigation, marked or not — leaving mid-chapter
    without marking anything must still resume in the right place.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        media = db.get(ShadowingMedia, media_id)
        if media is None:
            return _not_found()
        user_id = _require_user_id() or media.user_id
        position_ms = data.get('positionMs')
        if position_ms is None and data.get('segmentId') is not None:
            seg = db.get(ShadowingSegment, int(data['segmentId']))
            position_ms = seg.start_ms if seg is not None else None
        if position_ms is None:
            return jsonify({'error': 'positionMs or segmentId is required'}), 400
        row = db.query(ShadowingCursor).filter_by(media_id=media_id, user_id=user_id).first()
        if row is None:
            row = ShadowingCursor(media_id=media_id, user_id=user_id)
            db.add(row)
        row.position_ms = max(0, int(position_ms))
        db.commit()
        return jsonify({'mediaId': media_id, 'userId': user_id, 'positionMs': row.position_ms})


# ══════════════════════════════════════════════════════════════════════════
# Manual boundary editing — on the config that owns the row
# ══════════════════════════════════════════════════════════════════════════

@shadowing_bp.route('/api/v1/shadowing/segments/<int:segment_id>', methods=['PATCH'])
def patch_shadowing_segment(segment_id):
    """Only `text` (the smia transcript) is writable here.

    `done` is NOT accepted any more: doneness is coverage, and writing a
    boolean would create a second, disagreeing source of truth. Use
    POST .../progress.
    """
    data = request.get_json(silent=True) or {}
    with get_sessionmaker()() as db:
        seg = db.get(ShadowingSegment, segment_id)
        if seg is None:
            return _not_found()
        if 'done' in data:
            return jsonify({'error': 'done is derived from progress ranges — '
                                     'POST /api/v1/shadowing/media/<id>/progress instead'}), 400
        if 'text' in data:
            seg.text = data['text']
        db.commit()
        db.refresh(seg)
        return jsonify(_segment_json(seg, _ranges_for(db, seg.media_id, seg.media.user_id)))


@shadowing_bp.route('/api/v1/shadowing/segments/<int:segment_id>/split', methods=['POST'])
def split_shadowing_segment(segment_id):
    """Split at `atMs`. Doneness is PRESERVED for free: both halves lie
    inside the span that was covered, so both read as done without touching
    the progress record at all."""
    data = request.get_json(silent=True) or {}
    at_ms = data.get('atMs')
    if at_ms is None:
        return jsonify({'error': 'atMs is required'}), 400
    at_ms = int(at_ms)
    with get_sessionmaker()() as db:
        seg = db.get(ShadowingSegment, segment_id)
        if seg is None:
            return _not_found()
        if not (seg.start_ms < at_ms < seg.end_ms):
            return jsonify({'error': 'atMs must fall strictly inside the segment'}), 400
        siblings = db.query(ShadowingSegment).filter(
            ShadowingSegment.config_id == seg.config_id, ShadowingSegment.kind == seg.kind,
            ShadowingSegment.parent_segment_id == seg.parent_segment_id,
            ShadowingSegment.order_index > seg.order_index,
        ).all()
        for sib in siblings:
            sib.order_index += 1
        new_seg = ShadowingSegment(
            media_id=seg.media_id, config_id=seg.config_id, kind=seg.kind,
            parent_segment_id=seg.parent_segment_id,
            order_index=seg.order_index + 1, start_ms=at_ms, end_ms=seg.end_ms, text=None)
        seg.end_ms = at_ms
        db.add(new_seg)
        db.commit()
        db.refresh(seg)
        db.refresh(new_seg)
        if seg.kind == 'chapter':
            audio.drop_chunk_cache(seg.media_id)
        ranges = _ranges_for(db, seg.media_id, seg.media.user_id)
        return jsonify({'first': _segment_json(seg, ranges),
                        'second': _segment_json(new_seg, ranges)})


@shadowing_bp.route('/api/v1/shadowing/segments/merge', methods=['POST'])
def merge_shadowing_segments():
    """Merge two adjacent segments. Doneness becomes CONJUNCTIVE for free:
    the merged span reads as done only if the union of ranges covers all of
    it, which happens exactly when both halves were done."""
    data = request.get_json(silent=True) or {}
    id_a, id_b = data.get('segmentIdA'), data.get('segmentIdB')
    if not id_a or not id_b:
        return jsonify({'error': 'segmentIdA and segmentIdB are required'}), 400
    with get_sessionmaker()() as db:
        a, b = db.get(ShadowingSegment, id_a), db.get(ShadowingSegment, id_b)
        if a is None or b is None:
            return _not_found()
        if a.config_id != b.config_id or a.kind != b.kind or a.parent_segment_id != b.parent_segment_id:
            return jsonify({'error': 'segments must be the same kind and same parent '
                                     'within one split config'}), 400
        first, second = (a, b) if a.start_ms <= b.start_ms else (b, a)
        if second.order_index != first.order_index + 1:
            return jsonify({'error': 'segments must be adjacent'}), 400

        first.end_ms = second.end_ms
        first.text = ' '.join(t for t in [first.text, second.text] if t) or None
        db.query(ShadowingSegment).filter_by(parent_segment_id=second.id).update(
            {'parent_segment_id': first.id})
        later = db.query(ShadowingSegment).filter(
            ShadowingSegment.config_id == first.config_id, ShadowingSegment.kind == first.kind,
            ShadowingSegment.parent_segment_id == first.parent_segment_id,
            ShadowingSegment.order_index > second.order_index,
        ).all()
        for sib in later:
            sib.order_index -= 1
        db.delete(second)
        db.commit()
        db.refresh(first)
        if first.kind == 'chapter':
            audio.drop_chunk_cache(first.media_id)
        return jsonify(_segment_json(first, _ranges_for(db, first.media_id, first.media.user_id)))
