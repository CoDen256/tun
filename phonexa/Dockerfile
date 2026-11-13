FROM python:3.12-slim

# Build context is the repository root (see phonexa/compose.yaml), so every
# COPY source is phonexa/-prefixed. This is what lets a later change COPY from
# shared top-level libraries.

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

COPY phonexa/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Backend
COPY phonexa/formanter.py phonexa/shadowing.py ./
COPY phonexa/db/ ./db/
COPY phonexa/alembic.ini .
COPY phonexa/alembic/ ./alembic/
COPY phonexa/scripts/ ./scripts/

# Frontend assets
COPY phonexa/index.html phonexa/editor.html phonexa/debug.html phonexa/shadow.html phonexa/praat.html phonexa/sounds.html phonexa/tokens.html phonexa/drill.html phonexa/settings.html phonexa/consonants.html phonexa/processor.js ./
COPY phonexa/js/ ./js/
COPY phonexa/css/ ./css/
COPY phonexa/lang/ ./lang/

RUN chmod +x /app/scripts/docker-entrypoint.sh

EXPOSE 5050

# Entrypoint applies Alembic migrations, then execs CMD.
ENTRYPOINT ["/app/scripts/docker-entrypoint.sh"]
CMD ["python", "formanter.py"]
