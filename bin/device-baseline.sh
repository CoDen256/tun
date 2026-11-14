#!/usr/bin/env bash
# device-baseline.sh — capture the DEVICE PLANE's observable contract, verbatim.
#
# WHY THIS EXISTS. `unified-auth` section 2 moved the device sync gate into the
# gateway, and the change notes cite a "before" capture taken in
# `scratchpad/ua-baseline/`. That directory is not in the tree and never was,
# so the evidence for the single most dangerous change in the repo — the one
# touching a contract an un-rollbackable APK depends on — was not reproducible
# by anyone, including its author. This script replaces that capture with one
# that is COMMITTED (`docs/baselines/device-plane.txt`) and REGENERABLE.
#
# WHAT IT IS FOR. Take it before touching the gateway, take it after, diff.
# A zero diff is the evidence that the device saw no change. A non-zero diff is
# a device-contract decision, to be made deliberately and written down — never
# noticed afterwards.
#
# REGENERATE / COMPARE
#   docker compose -f compose.yaml -f compose.dev.yaml up -d      # :8080
#   bash bin/device-baseline.sh > /tmp/after.txt
#   diff docs/baselines/device-plane.txt /tmp/after.txt           # must be empty
#   # to adopt an intended change:
#   bash bin/device-baseline.sh > docs/baselines/device-plane.txt && git diff
#
# DETERMINISM. Everything that legitimately varies run to run is normalised:
# Date, Etag, Last-Modified, Alt-Svc, the random uid, and the token values.
# NO SECRET IS EVER WRITTEN TO THE OUTPUT — tokens are replaced by their names.
#
# IT RUNS AGAINST THE LOCAL STACK ON PURPOSE. A fresh uid is created on every
# run (that is how `_justCreated` can be captured at all), and creating rows in
# production to take a screenshot of the gateway is not a trade worth making.
# Pass a base url explicitly if you really mean to.
set -uo pipefail
cd "$(dirname "$0")/.."
[ -f .env ] && set -a && . ./.env && set +a

BASE="${1:-http://localhost:8080}"
OTA_TOKEN="${OTA_TOKEN:?set OTA_TOKEN in the root .env}"
OP_TOKEN="${OPERATOR_AUTH_TOKEN:?set OPERATOR_AUTH_TOKEN in the root .env}"
BUILD="${OTA_BASELINE_BUILD:-b000001}"
UID_="baseline$(date +%s)$RANDOM"

# Normalise everything volatile. The point of the file is the CONTRACT —
# statuses, header NAMES and the values that are promises (Cache-Control,
# Content-Type, Location, Content-Length where it is a promise) — not the
# bytes that differ on every request.
norm() {
	tr -d '\r' \
	| sed -E "s|$UID_|<UID>|g; s|$OTA_TOKEN|<OTA_TOKEN>|g; s|$OP_TOKEN|<OPERATOR_TOKEN>|g" \
	| sed -E 's/^(Date|Etag|Last-Modified|Alt-Svc|Server|Vary|Connection):.*/\1: <volatile>/I' \
	| sed -E 's/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}Z/<volatile-ts>/g'
}

# Show status + the headers that are part of the contract, then the body.
probe() { # probe <label> <curl args...>
	printf '\n--- %s\n' "$1"; shift
	local out
	out=$(curl -s -D /tmp/.dbl.h -o /tmp/.dbl.b --max-time 20 "$@" 2>&1)
	{
		# The status line has no colon after "HTTP/1.1" — it needs its own
		# branch. Getting that wrong silently dropped every status code from
		# the capture, which is the only thing on this page that really
		# matters. Found by reading the first generated file, not by assuming.
		grep -iE '^(HTTP/[0-9.]+ |cache-control:|content-type:|content-length:|location:|www-authenticate:|accept-ranges:)' /tmp/.dbl.h
		# A JSON body is rendered as SORTED KEYS, not as the first N bytes.
		# Truncating at 400 bytes hid the two things this capture exists to
		# show: `_justCreated` on a first read, and the six device-status
		# fields being absent after a PATCH that sent them. Key order from the
		# service is not stable enough to diff on, so sort it.
		if head -c 1 /tmp/.dbl.b 2>/dev/null | grep -q '{'; then
			printf 'body (JSON, keys sorted):\n'
			python3 -c 'import json,sys; print(json.dumps(json.load(open("/tmp/.dbl.b")), sort_keys=True, indent=1))' \
				2>/dev/null || { printf 'NOT VALID JSON: '; head -c 400 /tmp/.dbl.b; printf '\n'; }
		elif [ -s /tmp/.dbl.b ]; then
			printf 'body: '; head -c 400 /tmp/.dbl.b; printf '\n'
		else
			printf 'body: <empty>\n'
		fi
	} | norm
}

cat <<EOF
# DEVICE-PLANE BASELINE
# regenerate: bash bin/device-baseline.sh > docs/baselines/device-plane.txt
# base: <BASE>   build: $BUILD   uid: <UID> (fresh every run)
# Volatile headers are normalised; tokens are never written out.
EOF

echo
echo "=== /ota/* (token-gated, GET/HEAD only — contract 11-ota-contract.md §7) ==="
probe "GET /ota/current.json   no token            -> expect 401 'unauthorized'" "$BASE/ota/current.json"
probe "GET /ota/current.json   wrong token         -> expect 401" -H 'Authorization: Bearer wrong' "$BASE/ota/current.json"
probe "GET /ota/current.json   correct token       -> expect 200, no-store (D26)" -H "Authorization: Bearer $OTA_TOKEN" "$BASE/ota/current.json"
probe "POST /ota/current.json  correct token       -> expect 405 'method not allowed' FROM THE GUARD (P23)" -X POST -H "Authorization: Bearer $OTA_TOKEN" "$BASE/ota/current.json"
probe "HEAD /ota/bundle/$BUILD.js correct token    -> expect 200, immutable" -I -o /dev/null -H "Authorization: Bearer $OTA_TOKEN" "$BASE/ota/bundle/$BUILD.js"

echo
echo "=== /audio-manifest/* (UNauthenticated by design, D-P1) ==="
# NOTE: mjolnir/data/ is .gitignored (it holds a 6 MB bundle), so a local
# stack publishes no audio manifest and no blobs. The 404 captured here is
# itself contract: a missing device-plane object must come back as an
# EMPTY-BODIED 404, never the HTML status page (P49) and never a JSON error
# document (P46). Against a host that does publish audio this row is a 200
# with `Cache-Control: public, max-age=31536000, immutable`.
probe "GET /audio-manifest/$BUILD.json  no token   -> 200 where audio is published; empty-bodied 404 where it is not" "$BASE/audio-manifest/$BUILD.json"
probe "POST /audio-manifest/$BUILD.json            -> expect 405 'method not allowed' (the guard runs before file_server)" -X POST "$BASE/audio-manifest/$BUILD.json"

echo
echo "=== /blob/<sha256> (content-addressed; the hash IS the capability) ==="
BLOB_SHA=$(curl -s --max-time 20 "$BASE/audio-manifest/$BUILD.json" | grep -o '[0-9a-f]\{64\}' | head -1)
if [ -n "$BLOB_SHA" ]; then
	probe "HEAD /blob/<sha from this build's manifest> -> expect 200, immutable" -I -o /dev/null "$BASE/blob/$BLOB_SHA"
else
	printf '\n--- HEAD /blob/<sha from this build\x27s manifest>\nNOT CAPTURED: this stack publishes no audio manifest, so there is no sha to ask for.\nThis is expected on a local stack (mjolnir/data is .gitignored) and is NOT expected against production.\n'
fi

echo
echo "=== /mjolnir/userdata/<uid> (device sync, gated at the gateway, unified-auth §2) ==="
probe "GET  no token      -> expect 302 to /mjolnir/login, EMPTY body (deliberate, NOT 401)" "$BASE/mjolnir/userdata/$UID_"
probe "GET  device token  -> expect 200 and _justCreated on the FIRST read" -H "Authorization: Bearer $OP_TOKEN" "$BASE/mjolnir/userdata/$UID_"
probe "GET  device token  -> expect 200 and NO _justCreated on the re-read" -H "Authorization: Bearer $OP_TOKEN" "$BASE/mjolnir/userdata/$UID_"
# The six are deviceId/activeBuildId/pendingBuildId/audioCached/audioTotal/
# lastFetchError — read out of mjolnir/sync/src/server.js, not guessed. The
# first draft of this probe guessed a different six, and the capture showed
# every one of them merged straight into the document: a baseline that only
# ever asserts what the author already believed proves nothing.
probe "PATCH device token -> expect 200; dailyCards merges, the six device-status fields are STRIPPED" \
	-X PATCH -H "Authorization: Bearer $OP_TOKEN" -H 'Content-Type: application/json' \
	--data '{"dailyCards":42,"deviceId":"X","activeBuildId":"X","pendingBuildId":"X","audioCached":1,"audioTotal":2,"lastFetchError":"X"}' \
	"$BASE/mjolnir/userdata/$UID_"
probe "GET  device token  -> the PATCH landed, the status fields did not" -H "Authorization: Bearer $OP_TOKEN" "$BASE/mjolnir/userdata/$UID_"
probe "PUT  device token  -> expect 405 (method dispatch BEFORE readiness)" -X PUT -H "Authorization: Bearer $OP_TOKEN" "$BASE/mjolnir/userdata/$UID_"
probe "GET  /mjolnir/userdata/%ff device token -> expect 404, EMPTY body (P46: never a JSON error body on the device path)" \
	-H "Authorization: Bearer $OP_TOKEN" "$BASE/mjolnir/userdata/%ff"

rm -f /tmp/.dbl.h /tmp/.dbl.b
