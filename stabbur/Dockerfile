FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ffmpeg \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# yt-dlp (manual-link-audio-capture, filmot path) needs a JS runtime to solve
# YouTube's player challenges — recent yt-dlp defaults to deno and warns
# ("No supported JavaScript runtime could be found") without one, which in
# practice correlates with YouTube's "Sign in to confirm you're not a bot"
# extraction failures. Installed via deno's own install script (no apt
# package) into a fixed path already on PATH for the app user below.
ENV DENO_INSTALL=/usr/local
RUN curl -fsSL https://deno.land/install.sh | sh

# monorepo-merge: the build context is the repository root (so a later
# change can COPY from the shared libs/), therefore every source path here
# is prefixed with stabbur/. The destinations are unchanged — the image
# layout is identical to before the merge.
COPY stabbur/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY stabbur/app.py stabbur/auth.py stabbur/blob_storage.py stabbur/smia_client.py stabbur/settings_store.py stabbur/similarity.py ./
COPY stabbur/db/ ./db/
COPY stabbur/routes/ ./routes/
COPY stabbur/ui/ ./ui/
COPY stabbur/alembic.ini .
COPY stabbur/alembic/ ./alembic/
COPY stabbur/scripts/ ./scripts/

EXPOSE 5056

# Unchanged command, different contract (zone-isolation): scripts/bootstrap.py
# now binds the port FIRST and migrates in the background, so the container
# serves (degraded) with Postgres down instead of crash-looping. It imports
# libs/pyservice, which is mounted at /libs with PYTHONPATH set in
# compose.yaml — not COPYed, so one copy of that contract exists.
CMD ["python", "-m", "scripts.bootstrap"]
