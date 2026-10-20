#!/usr/bin/env bash
# P1 acceptance test: prove the device-facing path works before any native
# code depends on it.
#
#   bin/ota-verify.sh [base-url]        # default: $TUN_PUBLIC_BASE
#
# Exercises exactly what the frozen native patch will do, plus the guards
# around it.
set -uo pipefail

cd "$(dirname "$0")/.."
[ -f .env ] && set -a && . ./.env && set +a
BASE=${1:-${TUN_PUBLIC_BASE:?set TUN_PUBLIC_BASE in .env or pass a base url}}
TOKEN=${OTA_TOKEN:?set OTA_TOKEN in .env}
AUTH="Authorization: Bearer ${TOKEN}"
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
PASS=0; FAIL=0

ok()   { printf '  \033[32mPASS\033[0m %s\n' "$1"; PASS=$((PASS+1)); }
bad()  { printf '  \033[31mFAIL\033[0m %s\n' "$1"; FAIL=$((FAIL+1)); }
code() { curl -s -o /dev/null -w '%{http_code}' "$@"; }

# An empty value must NEVER satisfy an assertion. Comparing two unset strings
# with [ "$a" = "$b" ] reports PASS when nothing was downloaded at all, which
# is how a totally failed run once reported five passes -- including the D49
# check that is unfixable after the APK ships.
eq() { # eq <label> <got> <want>
	if [ -z "$2" ] || [ -z "$3" ]; then bad "$1 (empty value: got='$2' want='$3')"; return 1; fi
	[ "$2" = "$3" ] && ok "$1" || bad "$1: got '$2' want '$3'"
}
body() { # body <file> <label>  -- a downloaded body must exist and be non-empty
	[ -s "$1" ] || { bad "$2 (nothing was downloaded)"; return 1; }
}

echo "verifying ${BASE}"

# An intermediary that re-encodes bodies breaks D49 -- the sha256 native
# computes would differ from the one current.json publishes, and native can
# never be fixed. Warn loudly; this is also why the DNS record must be
# grey-clouded (DNS only), not proxied.
SRV=$(curl -sSI --max-time 15 "$BASE/ota/current.json" 2>/dev/null | tr -d '\r' | grep -i '^server:' | cut -d' ' -f2-)
case "$(printf '%s' "$SRV" | tr 'A-Z' 'a-z')" in
	*cloudflare*|*akamai*|*fastly*|*cloudfront*)
		printf '  \033[33mWARN\033[0m an intermediary is answering (Server: %s).\n' "$SRV"
		printf '         A proxy that re-encodes bodies violates D49. Use DNS-only (grey cloud).\n' ;;
esac

echo "token gate"
[ "$(code "$BASE/ota/current.json")" = 401 ] \
	&& ok "no token -> 401" || bad "no token should be 401"
[ "$(code -H 'Authorization: Bearer wrong' "$BASE/ota/current.json")" = 401 ] \
	&& ok "wrong token -> 401" || bad "wrong token should be 401"
[ "$(code -H "$AUTH" "$BASE/ota/current.json")" = 200 ] \
	&& ok "correct token -> 200" || bad "correct token should be 200"
[ "$(code -X POST -H "$AUTH" "$BASE/ota/current.json")" = 405 ] \
	&& ok "POST -> 405 (P23: GET only)" || bad "POST should be 405"

echo "current.json"
curl -sS -H "$AUTH" "$BASE/ota/current.json" -o "$TMP/current.json"
CJ=$(cat "$TMP/current.json")
field() { printf '%s' "$CJ" | tr -d ' \n' | grep -o "\"$1\":\"[^\"]*\"" | cut -d'"' -f4; }
BUILD_ID=$(field buildId); URL=$(field url); SHA=$(field sha256)
SIZE=$(printf '%s' "$CJ" | tr -d ' \n' | grep -o '"size":[0-9]*' | cut -d: -f2)

[ -n "$BUILD_ID" ] && ok "buildId = $BUILD_ID" || bad "buildId missing"
printf '%s' "$BUILD_ID" | grep -Eq '^[A-Za-z0-9._-]{1,64}$' \
	&& ok "buildId charset is filename-safe (D48)" || bad "buildId charset invalid"
printf '%s' "$SHA" | grep -Eq '^[0-9a-f]{64}$' \
	&& ok "sha256 is 64 lowercase hex" || bad "sha256 malformed: '$SHA'"
[ -n "$SIZE" ] && [ "$SIZE" -gt 0 ] 2>/dev/null \
	&& ok "size = $SIZE" || bad "size missing or non-positive"
case "$URL" in
	https://*) ok "url is https (D53)" ;;
	http://*)  [ "${ALLOW_HTTP:-0}" = 1 ] && ok "url is http (local test only)" \
	                                      || bad "url MUST be https in production (D53)" ;;
	*) bad "url malformed: '$URL'" ;;
esac
[ "$(grep -ci 'cache-control: *no-store' <(curl -sSI -H "$AUTH" "$BASE/ota/current.json"))" -ge 1 ] \
	&& ok "current.json is no-store (rollback takes effect, D26)" \
	|| bad "current.json must be no-store"

if [ -z "$BUILD_ID" ] || [ -z "$SHA" ] || [ -z "$SIZE" ] || [ -z "$URL" ]; then
	echo
	printf '\033[31mcurrent.json is unusable - aborting before the bundle checks.\033[0m\n'
	printf 'Everything below depends on it; running those checks would report meaningless passes.\n'
	printf 'Got: %s\n' "$(head -c 200 "$TMP/current.json" 2>/dev/null || echo '<nothing>')"
	printf '\033[31m%s passed, %s FAILED (aborted early)\033[0m\n' "$PASS" "$FAIL"
	exit 1
fi

echo "bundle"
# Exactly what native does: no Accept-Encoding set by hand (D49).
curl -sS -H "$AUTH" "$URL" -o "$TMP/plain.js"
if body "$TMP/plain.js" "bundle download"; then
	eq "sha256 of downloaded bytes matches" "$(sha256sum "$TMP/plain.js" | cut -d' ' -f1)" "$SHA"
	eq "byte count matches size"            "$(stat -c%s "$TMP/plain.js")"                  "$SIZE"
	[ "$(head -c 26 "$TMP/plain.js")" = 'var __BUNDLE_START_TIME__=' ] \
		&& ok "magic prefix present (D51)" || bad "magic prefix missing"
else
	bad "sha256 of downloaded bytes matches (skipped)"
	bad "byte count matches size (skipped)"
	bad "magic prefix present (skipped)"
fi

# The Java HTTP stack negotiates gzip transparently. The hash must be
# identical either way, or D49 is violated and native can never be fixed.
curl -sS --compressed -H "$AUTH" "$URL" -o "$TMP/gz.js"
if body "$TMP/gz.js" "gzip download"; then
	eq "sha256 identical with transport gzip (D49)" "$(sha256sum "$TMP/gz.js" | cut -d' ' -f1)" "$SHA"
else
	bad "sha256 identical with transport gzip (D49) (skipped)"
fi
# Under gzip, Caddy sends the bundle CHUNKED with no Content-Length at all.
# Native therefore cannot pre-check the size from headers: it must enforce the
# cap while streaming, aborting once bytes written exceed `size` (D49).
GZ_CL=$(curl -sS --compressed -D - -o /dev/null -H "$AUTH" "$URL" | tr -d ' \r' | grep -i '^content-length:' | cut -d: -f2)
if [ -s "$TMP/gz.js" ]; then
	[ -z "$GZ_CL" ] \
		&& ok "gzip GET has no Content-Length (chunked) — native must cap while streaming" \
		|| bad "unexpected Content-Length '$GZ_CL' under gzip; re-check the D49 assumption"
else
	bad "gzip Content-Length check (skipped: nothing downloaded)"
fi
PLAIN_CL=$(curl -sS -H 'Accept-Encoding:' -D - -o /dev/null -H "$AUTH" "$URL" | tr -d ' \r' | grep -i '^content-length:' | cut -d: -f2)
eq "ungzipped GET Content-Length == size" "$PLAIN_CL" "$SIZE"

echo
if [ "$FAIL" -eq 0 ]; then
	printf '\033[32m%s passed, 0 failed — P1 path proven\033[0m\n' "$PASS"; exit 0
else
	printf '\033[31m%s passed, %s FAILED\033[0m\n' "$PASS" "$FAIL"; exit 1
fi
