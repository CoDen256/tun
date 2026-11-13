#!/usr/bin/env bash
# Build the patched Mjølnir APK from the pinned clean base.
#
#   MJOLNIR_OTA_URL=https://host/ota/current.json \
#   MJOLNIR_OTA_TOKEN=<token> \
#   ANDROID_DEBUG_KEYSTORE_PASS=android \
#   apk/build.sh [--stage-only]
#
# Pipeline:
#   1. copy base/smali.mjolnir.merged  ->  build/deploy/smali.mjolnir.merged  (untracked)
#   2. substitute the OTA URL/token placeholders (D64) into the native patch
#   3. overlay the patched smali onto the staged tree
#   4. `at bl -fvazs` -> apktool b, zipalign, sign with ~/.android/debug.keystore
#   5. gate the built dex: no placeholder may survive (D64)
#
# The base is never written to. Re-running is safe: build/deploy is recreated
# from scratch every time, so a half-finished run can never contaminate the next.
set -euo pipefail

cd "$(dirname "$0")/.."
REPO="$PWD"
BASE="$REPO/base/smali.mjolnir.merged"
DEPLOY="$REPO/build/deploy"
STAGE="$DEPLOY/smali.mjolnir.merged"   # `at bl` derives the apk name from this
STAGE_ONLY=0
[ "${1:-}" = "--stage-only" ] && STAGE_ONLY=1

: "${MJOLNIR_OTA_URL:?set MJOLNIR_OTA_URL (https://…/ota/current.json)}"
: "${MJOLNIR_OTA_TOKEN:?set MJOLNIR_OTA_TOKEN}"
[ -d "$BASE" ] || { echo "missing base: $BASE" >&2; exit 1; }

# The signing key must be the one the installed app already carries, or Android
# refuses the upgrade. Verified 2026-10-20: debug.keystore matches the install.
KS="${ANDROID_KEYSTORE:-$HOME/.android/debug.keystore}"
[ -f "$KS" ] || { echo "missing keystore: $KS" >&2; exit 1; }

echo "[1/5] staging base -> $STAGE"
rm -rf "$DEPLOY"
mkdir -p "$DEPLOY"
cp -a "$BASE" "$STAGE"

echo "[2/5] substituting OTA placeholders (D64)"
SUBST="$DEPLOY/.subst"
MJOLNIR_OTA_URL="$MJOLNIR_OTA_URL" MJOLNIR_OTA_TOKEN="$MJOLNIR_OTA_TOKEN" \
  "$REPO/patches/native/substitute.sh" "$SUBST"

echo "[3/5] overlaying the native patch"
# Two files land here: the new OtaPackage and the edited LazyHolder. Both must
# actually overwrite something/land somewhere — a silently missed overlay would
# produce a clean-looking APK with no OTA in it at all.
LAZY='smali_classes4/expo/modules/ExpoModulesPackageList$LazyHolder.smali'
OTAP='smali_classes4/com/lightblitzlearning/ota/OtaPackage.smali'
[ -f "$STAGE/$LAZY" ] || { echo "base is missing $LAZY — wrong base?" >&2; exit 1; }
cp -a "$SUBST/smali_classes4/." "$STAGE/smali_classes4/"
[ -f "$STAGE/$OTAP" ] || { echo "overlay failed: $OTAP not staged" >&2; exit 1; }
grep -q 'OtaPackage' "$STAGE/$LAZY" || { echo "overlay failed: LazyHolder is not the patched one" >&2; exit 1; }
LEFT=$( { grep -rl '__MJOLNIR_OTA_' "$STAGE" || true; } )
[ -z "$LEFT" ] || { echo "REFUSING: placeholders survive in the staged tree:" >&2; echo "$LEFT" >&2; exit 1; }
rm -rf "$SUBST"
echo "      ok: OtaPackage staged, LazyHolder patched, no placeholders left"

if [ "$STAGE_ONLY" = 1 ]; then
	echo "staged only (--stage-only): $STAGE"
	exit 0
fi

echo "[4/5] at bl -fvazs (apktool b -> zipalign -> sign)"
: "${ANDROID_DEBUG_KEYSTORE_PASS:?set ANDROID_DEBUG_KEYSTORE_PASS (debug keystore password, usually 'android')}"
at bl -fvazs "$STAGE" -k "$KS"

# `at bl` signs to signed.aligned.<name>.apk then renames to signed.<name>.apk.
# Glob rather than hardcode, so a change in that naming fails loudly here
# instead of silently gating/installing the wrong (unsigned) artifact.
APK=$(ls -1 "$DEPLOY"/signed.*.apk 2>/dev/null | head -1 || true)
if [ -z "$APK" ] || [ ! -f "$APK" ]; then
	echo "build produced no signed apk in $DEPLOY; found:" >&2
	ls -1 "$DEPLOY"/*.apk >&2 2>/dev/null || echo "  (none)" >&2
	exit 1
fi

echo "[5/5] gating the built dex (D64)"
DEXDIR="$DEPLOY/.dexcheck"
rm -rf "$DEXDIR"; mkdir -p "$DEXDIR"
unzip -o -q "$APK" 'classes*.dex' -d "$DEXDIR"
for d in "$DEXDIR"/classes*.dex; do
	"$REPO/patches/native/substitute.sh" --check-dex "$d"
done
rm -rf "$DEXDIR"

echo
echo "OK: $APK"
echo "    signer $(apksigner verify --print-certs "$APK" 2>/dev/null | grep -i 'certificate SHA-256' | head -1 | awk '{print $NF}')"
echo "    sha256 $(sha256sum "$APK" | cut -d' ' -f1)"
echo "    install:  at in '$APK'    (or: adb install -r '$APK')"
