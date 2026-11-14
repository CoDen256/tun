FROM python:3.12-slim

# Build context is the repository root (see shadow/compose.yaml), so every
# COPY source is shadow/-prefixed. This is what lets a later change COPY from
# shared top-level libraries (zone-isolation task 1.2's libs/pyservice).

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ffmpeg is here for yt-dlp's audio-extraction postprocessing step, nothing
# else — shadow decodes no audio itself (see app.py). No build-essential:
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
COPY shadow/app.py shadow/shadowing.py shadow/phonexa_client.py ./
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
