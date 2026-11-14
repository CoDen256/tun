#!/usr/bin/env bash
# Publish a bundle as an OTA build. Run on the VPS, from the mjolnir repo root.
#
#   bin/ota-publish.sh <bundle-file> <buildId> [label]
#
# Writes data/ota/bundle/<buildId>.js and repoints data/ota/current.json.
# Rollback is exactly this command with an older buildId whose bundle is
# still on disk (D26) — there is no ordering anywhere in the system.
#
# D75: this script moved here from `tun`. D-P4: it is now a thin wrapper —
# the actual guards (buildId regex, no-reuse-with-different-bytes, magic
# prefix, https-only) live in `tool/src/otaPublish.js`, the canonical
# implementation `builder` also imports in-process.
set -euo pipefail
cd "$(dirname "$0")/.."
# D151: shared values (TUN_PUBLIC_BASE, OTA_TOKEN) live in the REPOSITORY
# ROOT .env — one level up from here — and only mjolnir-local ones in ./.env.
# Sourcing just ./.env was correct before the monorepo and broke silently with
# it: mjolnir/.env no longer exists, so this script aborted on
# TUN_PUBLIC_BASE's `:?` guard before reaching a single check. Found by
# independent review, not by running it, because every earlier run passed the
# base url and token explicitly. Root first, project second.
[ -f ../.env ] && set -a && . ../.env && set +a
[ -f .env ] && set -a && . ./.env && set +a
: "${TUN_PUBLIC_BASE:?set TUN_PUBLIC_BASE in .env}"
exec node bin/bundle-tool.js ota-publish "$@"
