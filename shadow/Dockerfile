FROM python:3.12-slim

# Build context is the repository root (see shadow/compose.yaml), so every
# COPY source is shadow/-prefixed. This is what lets a later change COPY from
# shared top-level libraries (zone-isolation task 1.2's libs/pyservice).

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ffmpeg (and ffprobe) is load-bearing in THREE places now. It used to be
# here "for yt-dlp's audio-extraction postprocessing step, nothing else —
# shadow decodes no audio itself"; that was true until 2026-11-15 and is now
# stale, so it is corrected here rather than deleted (shadow-studying-mode):
#
#   1. yt-dlp's audio extraction, as before;
#   2. the ONE transcode of an uploaded book to a mono Opus master;
#   3. silence analysis (`silencedetect`, writing no audio) and chapter
#      chunks (`-c copy`, a stream copy, no re-encode).
#
# What is still true, and is the distinction that made the reversal safe:
# shadow decodes nothing PER REQUEST. The failure originally reverted was a
# multi-GB decode on upload, on split and on every chapter-audio request
# with nothing cached. See shadow/audio.py. No build-essential:
# unlike phonexa this image has no parselmouth/numpy to compile, which is
# most of why it builds in a fraction of phonexa's time. That asymmetry is
# the deploy-granularity half of the split (design.md's row C).
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY shadow/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Backend
COPY shadow/app.py shadow/shadowing.py shadow/phonexa_client.py shadow/audio.py shadow/progress.py ./
COPY shadow/db/ ./db/
COPY shadow/alembic.ini .
COPY shadow/alembic/ ./alembic/
COPY shadow/scripts/ ./scripts/

# Frontend assets
COPY shadow/shadow.html shadow/settings.html ./
COPY shadow/js/ ./js/
COPY shadow/css/ ./css/

EXPOSE 5051

# One entrypoint shape across all four Python services (zone-isolation):
# scripts/bootstrap.py binds the port first and migrates in the background,
# so a cluster outage costs the shadowing LIST, not the page. Needs `/libs`
# on PYTHONPATH; see compose.yaml.
CMD ["python", "-m", "scripts.bootstrap"]
