FROM node:22-alpine

RUN apk add --no-cache bash

WORKDIR /app

# Same shape as hub's and builder's images: only manifests are COPYed, the
# source arrives at runtime through the `.:/app` bind mount declared in
# mjolnir/compose.yaml. sync shares hub's dependencies (it imports
# hub/src/userdata.js and hub/src/db.js directly rather than duplicating them).
COPY mjolnir/package.json mjolnir/package-lock.json ./
RUN npm ci --omit=dev
COPY mjolnir/hub/package.json mjolnir/hub/package-lock.json ./hub/
RUN npm ci --omit=dev --prefix hub

WORKDIR /app/sync
CMD ["node", "bin/server.js"]
