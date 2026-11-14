# builder's own deployable image (task 7.1) — same base as D92's
# `mjolnir-node` container (root Dockerfile) for consistency: node:22-alpine,
# same apk packages (ffmpeg for the audio-trim step, D-F1). Built with the
# repo root as context (builder imports `../../src/`, `../../tool/` directly,
# same as it always has) and bind-mounted at runtime, not copied in, so
# `git pull` + a container restart picks up source changes without a
# rebuild — only `npm ci` happens at build time.
#
# The build context is the MONOREPO ROOT (compose: `context: ..`), not
# mjolnir, so a later change can COPY from shared `libs/`. Every COPY source
# below is therefore `mjolnir/`-prefixed while the image layout under /app is
# unchanged (/app == the mjolnir directory).
FROM node:22-alpine
RUN apk add --no-cache bash curl ffmpeg
WORKDIR /app

COPY mjolnir/package.json mjolnir/package-lock.json ./
RUN npm ci --omit=dev
COPY mjolnir/builder/package.json mjolnir/builder/package-lock.json ./builder/
RUN npm ci --omit=dev --prefix builder

WORKDIR /app/builder
CMD ["node", "bin/server.js"]
