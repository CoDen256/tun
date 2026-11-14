# hub's own deployable image (task 7.1) — same base as D92's `mjolnir-node`
# container (root Dockerfile) for consistency: node:22-alpine. hub doesn't
# shell out to anything (no ffmpeg/curl needed), but bash is kept for parity
# with the shared base and any future ops scripting. Built with the repo
# root as context (hub imports `../../src/deckData.js` directly for the
# Cards page) and bind-mounted at runtime, not copied in — `git pull` + a
# container restart picks up source changes without a rebuild.
#
# The build context is the MONOREPO ROOT (compose: `context: ..`), not
# mjolnir, so a later change can COPY from shared `libs/`. Every COPY source
# below is therefore `mjolnir/`-prefixed while the image layout under /app is
# unchanged (/app == the mjolnir directory).
FROM node:22-alpine
RUN apk add --no-cache bash
WORKDIR /app

COPY mjolnir/package.json mjolnir/package-lock.json ./
RUN npm ci --omit=dev
COPY mjolnir/hub/package.json mjolnir/hub/package-lock.json ./hub/
RUN npm ci --omit=dev --prefix hub

WORKDIR /app/hub
CMD ["node", "bin/server.js"]
