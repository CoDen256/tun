#!/usr/bin/env bash
# Regenerate smali_classes4/com/lightblitzlearning/ota/OtaPackage.smali from the
# reviewed Java source. Only OtaPackage is dexed — the expo/react types under
# src/ are compile-only stubs mirroring the base interfaces (NOT shipped).
#
# Pipeline: javac (against android.jar + stubs) -> d8 -> baksmali.
# The committed .smali is what the APK pipeline assembles; the .java is for review.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
SRC="$HERE/src"
OUT="$HERE/smali_classes4"

ANDROID_JAR="${ANDROID_JAR:-$HOME/Android/Sdk/platforms/android-34/android.jar}"
# Invoke d8 via its jar directly — the `d8` wrapper carries a /bin/bash shebang
# that does not exist on this host.
D8_JAR="${D8_JAR:-$(ls "$HOME"/Android/Sdk/build-tools/*/lib/d8.jar 2>/dev/null | sort -V | tail -1)}"
[ -f "$ANDROID_JAR" ] || { echo "android.jar not found: $ANDROID_JAR" >&2; exit 1; }
[ -f "$D8_JAR" ] || { echo "d8.jar not found (set D8_JAR=...)" >&2; exit 1; }

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "[1/4] javac -> $WORK/classes"
mkdir -p "$WORK/classes"
# -XDstringConcat=inline forces StringBuilder (no invokedynamic bootstrap methods
# in the dex, so baksmali output stays a single self-contained class).
find "$SRC" -name '*.java' > "$WORK/sources.txt"
javac -source 8 -target 8 -XDstringConcat=inline \
      -cp "$ANDROID_JAR" -d "$WORK/classes" @"$WORK/sources.txt" 2> >(grep -v 'bootstrap class path' >&2 || true)

echo "[2/4] d8 OtaPackage -> $WORK/dex (min-api 23)"
mkdir -p "$WORK/dex"
java -cp "$D8_JAR" com.android.tools.r8.D8 \
      --min-api 23 --lib "$ANDROID_JAR" --classpath "$WORK/classes" --output "$WORK/dex" \
      "$WORK/classes/com/lightblitzlearning/ota/OtaPackage.class"

echo "[3/4] baksmali -> $WORK/smali"
baksmali disassemble --api 23 "$WORK/dex/classes.dex" -o "$WORK/smali"

echo "[4/4] install -> $OUT"
mkdir -p "$OUT/com/lightblitzlearning/ota"
cp "$WORK/smali/com/lightblitzlearning/ota/OtaPackage.smali" \
   "$OUT/com/lightblitzlearning/ota/OtaPackage.smali"

# Guard: d8 must not have emitted extra classes (lambdas / inner / synthetic).
EXTRA="$(find "$WORK/smali" -name '*.smali' | wc -l)"
if [ "$EXTRA" -ne 1 ]; then
  echo "WARNING: expected exactly 1 smali class, got $EXTRA:" >&2
  find "$WORK/smali" -name '*.smali' >&2
  exit 1
fi

echo "OK: $OUT/com/lightblitzlearning/ota/OtaPackage.smali"
