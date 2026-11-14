#!/usr/bin/env bash
# D64: substitute the baked-in OTA URL/token placeholders and REFUSE to emit
# smali in which either survives.
#
#   MJOLNIR_OTA_URL=https://host MJOLNIR_OTA_TOKEN=... patches/native/substitute.sh <out-dir>
#   patches/native/substitute.sh --check-dex <file.dex>      # post-build gate
#
# An unsubstituted placeholder ships an APK whose every OTA fetch 401s forever,
# indistinguishable on-device from a server outage — and the native half is
# frozen, so it is unfixable. Both gates are free; discovering it after signing
# is not.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
URL_PH='__MJOLNIR_OTA_URL__'
TOK_PH='__MJOLNIR_OTA_TOKEN__'

if [ "${1:-}" = "--check-dex" ]; then
	DEX=${2:?usage: substitute.sh --check-dex <file.dex>}
	[ -f "$DEX" ] || { echo "no such dex: $DEX" >&2; exit 1; }
	# `|| true`: grep finding nothing is the success case and must not trip set -e.
	FOUND=$( { strings -a "$DEX" | grep -c -e "$URL_PH" -e "$TOK_PH" || true; } )
	if [ "$FOUND" != 0 ]; then
		echo "REFUSING: $FOUND placeholder string(s) survive in $DEX (D64)." >&2
		echo "          Every OTA fetch would 401 forever, silently, in frozen code." >&2
		exit 1
	fi
	echo "dex clean: no OTA placeholders in $(basename "$DEX")"
	exit 0
fi

OUT=${1:?usage: substitute.sh <out-dir>   (or --check-dex <file.dex>)}
: "${MJOLNIR_OTA_URL:?set MJOLNIR_OTA_URL}"
: "${MJOLNIR_OTA_TOKEN:?set MJOLNIR_OTA_TOKEN}"

case "$MJOLNIR_OTA_URL" in
	https://*) ;;
	*) echo "refusing: MJOLNIR_OTA_URL must be https (D53) — got '$MJOLNIR_OTA_URL'" >&2; exit 1 ;;
esac
# Native reads these as Java string literals; a quote or backslash would alter
# the smali's meaning rather than its value.
case "$MJOLNIR_OTA_URL$MJOLNIR_OTA_TOKEN" in
	*'"'*|*'\'*) echo "refusing: url/token must not contain quotes or backslashes" >&2; exit 1 ;;
esac

rm -rf "$OUT"; mkdir -p "$OUT"
cp -r "$HERE/smali_classes4" "$OUT/"

URL="$MJOLNIR_OTA_URL" TOK="$MJOLNIR_OTA_TOKEN" OUTDIR="$OUT" python3 - <<'PY'
import os, pathlib
url, tok, out = os.environ['URL'], os.environ['TOK'], os.environ['OUTDIR']
n = 0
for p in pathlib.Path(out).rglob('*.smali'):
    s = p.read_text(encoding='utf-8')
    if '__MJOLNIR_OTA_' not in s:
        continue
    p.write_text(s.replace('__MJOLNIR_OTA_URL__', url).replace('__MJOLNIR_OTA_TOKEN__', tok),
                 encoding='utf-8')
    n += 1
print(f'substituted in {n} file(s)')
PY

LEFT=$( { grep -rl -e "$URL_PH" -e "$TOK_PH" "$OUT" || true; } )
if [ -n "$LEFT" ]; then
	echo "REFUSING: placeholders survive after substitution (D64):" >&2
	echo "$LEFT" >&2
	exit 1
fi
echo "smali clean: no OTA placeholders left under $OUT"
echo "NEXT: assemble, then gate the dex:  $0 --check-dex <classes.dex>"
