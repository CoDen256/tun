# Supplies the node runtime for `bin/bundle-tool.js` (the OTA publish CLI,
# D76/D-P2) and, from P4 onward, `builder`/`hub`'s own services — the
# operator is not expected to install node on the VPS itself (D84: this repo
# owns the entire deployable stack). The repo itself is bind-mounted at
# runtime (compose.yaml), not copied in here, so `git pull` + a container
# restart picks up source changes without a rebuild; only `npm ci` — the
# expensive, rarely-changing part — happens at build time.
FROM node:22-alpine
# ffmpeg: builder's audio-trim step (D-F1, small-fixes-audio-trim-drain-order)
# shells out to it to cut a card's audio to its audio_sel_ms selection.
RUN apk add --no-cache bash curl ffmpeg
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY builder/package.json builder/package-lock.json ./builder/
RUN npm ci --omit=dev --prefix builder
COPY hub/package.json hub/package-lock.json ./hub/
RUN npm ci --omit=dev --prefix hub

# No long-running default process yet — P4's real `builder` server/clock need
# STABBUR_BASE_URL, which doesn't exist until stabbur's p4-notes ships
# (tasks.md 5.4). Idle so `docker compose exec` has something to attach to
# for one-off commands (the ota-publish bootstrap, tasks.md 5.3) in the
# meantime.
CMD ["tail", "-f", "/dev/null"]
