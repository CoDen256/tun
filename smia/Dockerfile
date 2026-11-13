FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# nodejs: the `translators` package's Bing engine (adapters/bing_translate.py,
# provider-client-libraries D-L4) shells out to a JS runtime for Bing's
# client-side signing logic — confirmed missing live ("Unable to find
# available javascript runtime") the first time this ran inside the
# container, which doesn't happen in a dev venv that already has Node.
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

COPY smia/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY smia/app.py smia/auth.py smia/cache.py smia/registry.py \
     smia/audio_cache.py smia/health.py smia/norwegian.py ./
COPY smia/db/ ./db/
COPY smia/adapters/ ./adapters/
COPY smia/routes/ ./routes/
COPY smia/ui/ ./ui/
COPY smia/scripts/ ./scripts/
COPY smia/alembic.ini .
COPY smia/alembic/ ./alembic/

EXPOSE 5055

# Unchanged command, different contract (zone-isolation): scripts/bootstrap.py
# now binds the port FIRST and migrates in the background, so the container
# serves (degraded) with Postgres down instead of crash-looping. It imports
# libs/pyservice, which is mounted at /libs with PYTHONPATH set in
# compose.yaml — not COPYed, so one copy of that contract exists.
CMD ["python", "-m", "scripts.bootstrap"]
