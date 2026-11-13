FROM python:3.12-slim

# Build context is the repository root (see phonexa/compose.yaml), so every
# COPY source is phonexa/-prefixed. This is what lets a later change COPY from
# shared top-level libraries.

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ffmpeg stays: Formant Lab ingest and the trim endpoint decode uploaded
# audio here. yt-dlp — the other thing that used to need it — left with
# shadow (zone-isolation task 3.3), so the hang-prone download subprocess is
# no longer in this image at all.
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY phonexa/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Backend
COPY phonexa/formanter.py ./
COPY phonexa/db/ ./db/
COPY phonexa/alembic.ini .
COPY phonexa/alembic/ ./alembic/
COPY phonexa/scripts/ ./scripts/

# Frontend assets
COPY phonexa/index.html phonexa/editor.html phonexa/debug.html phonexa/praat.html phonexa/sounds.html phonexa/tokens.html phonexa/drill.html phonexa/consonants.html phonexa/processor.js ./
COPY phonexa/js/ ./js/
COPY phonexa/css/ ./css/
COPY phonexa/lang/ ./lang/

EXPOSE 5050

# One entrypoint shape across all three Python services (zone-isolation):
# scripts/bootstrap.py binds the port first and migrates in the background.
# The old ENTRYPOINT (scripts/docker-entrypoint.sh: `alembic upgrade head`
# then exec) is gone — it could not start at all with the database down, which
# took the vowel chart, Formant Lab and live speech down with it even though
# none of them read a row. Needs `/libs` on PYTHONPATH; see compose.yaml.
CMD ["python", "-m", "scripts.bootstrap"]
