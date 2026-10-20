#!/usr/bin/env bash
# Publish a bundle as an OTA build. Run on the VPS, from the tun repo root.
#
#   bin/ota-publish.sh <bundle-file> <buildId> [label]
#
# Writes data/ota/bundle/<buildId>.js and repoints data/ota/current.json.
# Rollback is exactly this command with an older buildId whose bundle is
# still on disk (D26) — there is no ordering anywhere in the system.
set -euo pipefail

BUNDLE_SRC=${1:?usage: ota-publish.sh <bundle-file> <buildId> [label]}
BUILD_ID=${2:?usage: ota-publish.sh <bundle-file> <buildId> [label]}
LABEL=${3:-$BUILD_ID}

cd "$(dirname "$0")/.."
[ -f .env ] && set -a && . ./.env && set +a
PUBLIC_BASE=${TUN_PUBLIC_BASE:?set TUN_PUBLIC_BASE in .env}

# --- guards ---------------------------------------------------------------
# buildId becomes a filename and a path component; native validates the same
# charset and will reject anything else (D48).
if ! printf '%s' "$BUILD_ID" | grep -Eq '^[A-Za-z0-9._-]{1,64}$'; then
	echo "refusing: buildId must match ^[A-Za-z0-9._-]{1,64}\$" >&2; exit 1
fi
# ALLOW_HTTP=1 exists for the local docker test only. Never set it on the VPS.
case "$PUBLIC_BASE" in
	https://*) ;;
	http://*) [ "${ALLOW_HTTP:-0}" = 1 ] || { echo "refusing: TUN_PUBLIC_BASE must be https (D53) — got '$PUBLIC_BASE'" >&2; exit 1; } ;;
	*) echo "refusing: TUN_PUBLIC_BASE must be https (D53) — got '$PUBLIC_BASE'" >&2; exit 1 ;;
esac
[ -f "$BUNDLE_SRC" ] || { echo "no such file: $BUNDLE_SRC" >&2; exit 1; }

# The device checks this 26-byte prefix at every activation (D51). Catch a
# bad artifact here rather than on a phone that cannot be debugged.
if [ "$(head -c 26 "$BUNDLE_SRC")" != 'var __BUNDLE_START_TIME__=' ]; then
	echo "refusing: '$BUNDLE_SRC' does not start with 'var __BUNDLE_START_TIME__='" >&2
	echo "          the device would reject it at activation" >&2
	exit 1
fi

SIZE=$(stat -c%s "$BUNDLE_SRC")
SHA=$(sha256sum "$BUNDLE_SRC" | cut -d' ' -f1)
[ "$SIZE" -gt 0 ] || { echo "refusing: empty bundle" >&2; exit 1; }
[ "$SIZE" -le 67108864 ] || { echo "refusing: bundle > 64 MiB, native rejects it (D48)" >&2; exit 1; }

DEST="data/ota/bundle/${BUILD_ID}.js"
mkdir -p data/ota/bundle data/blob

# A buildId is permanent identity. Reusing one for different bytes would make
# the device keep a stale bundle forever: it compares ids, not hashes (D26).
if [ -f "$DEST" ]; then
	EXISTING=$(sha256sum "$DEST" | cut -d' ' -f1)
	if [ "$EXISTING" != "$SHA" ]; then
		echo "refusing: buildId '$BUILD_ID' already exists with DIFFERENT content." >&2
		echo "          on disk $EXISTING" >&2
		echo "          new     $SHA" >&2
		echo "          buildIds are permanent (D26). Use a new one." >&2
		exit 1
	fi
	echo "bundle already present and identical — republishing current.json only"
else
	cp "$BUNDLE_SRC" "$DEST.tmp"
	mv "$DEST.tmp" "$DEST"          # atomic: a partial file is never addressable
fi

# --- current.json, atomically --------------------------------------------
cat > data/ota/current.json.tmp <<JSON
{
  "schema": 1,
  "buildId": "${BUILD_ID}",
  "url": "${PUBLIC_BASE}/ota/bundle/${BUILD_ID}.js",
  "sha256": "${SHA}",
  "size": ${SIZE},
  "label": "${LABEL}"
}
JSON
mv data/ota/current.json.tmp data/ota/current.json

echo "published ${BUILD_ID}"
echo "  size   ${SIZE}"
echo "  sha256 ${SHA}"
echo "  url    ${PUBLIC_BASE}/ota/bundle/${BUILD_ID}.js"
