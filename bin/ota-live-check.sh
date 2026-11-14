#!/usr/bin/env bash
# ota-live-check.sh — is the DEVICE PLANE healthy, right now, for the real phone?
#
# Operator requirement (2026-11-14): OTA may go down DURING work on OTA, but it
# must never be left broken afterwards, and it must stay reachable with the
# SAME token the field device already carries. This is the check that proves
# it, and it is meant to be run after every phase — not only when touching OTA.
#
# It deliberately asserts NOTHING about tokens it cannot see. It never reads a
# secret. Two independent probes:
#
#   1. unauthenticated reachability, per route's OWN contract:
#        /ota/*            MUST 401 — bearer-gated (contract §3).
#        /audio-manifest/* MUST 200 — deliberately UNauthenticated (D-P1:
#                          the prefetch companion cannot read the OTA token
#                          back, so it fetches a plain copy; the buildId that
#                          selects it is already in the bundle in plaintext).
#        /blob/*           same reasoning — the hash IS the capability.
#      A 502 means the gateway is up but the device path is broken; a 000
#      means the host is unreachable. Both are "OTA is down" for the phone.
#   2. the handset itself, if attached — the app holds the real token in its
#      bundle, so its own audio-manifest fetch is the only end-to-end proof
#      that the live token still opens the live device plane.
#
# Usage:  bash bin/ota-live-check.sh [base-url]        (default: production)
set -uo pipefail

BASE="${1:-https://coden256.dev}"
PKG=com.lightblitzlearning.mjolnir
rc=0

say() { printf '%s\n' "$*"; }
fail() { printf '  ** FAIL ** %s\n' "$*"; rc=1; }

say "=== device plane @ $BASE ==="

# --- probe 1: the gate answers, and answers correctly, with no credential ---
# /ota/* is bearer-gated: unauthenticated MUST be 401.
code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 15 "$BASE/ota/current.json" 2>/dev/null)
case "$code" in
  401) say "  /ota/current.json -> 401 (gate up, correctly closed)" ;;
  000) fail "/ota/current.json -> no response (host unreachable / TLS failed)" ;;
  5*)  fail "/ota/current.json -> $code (gateway up but device path BROKEN)" ;;
  200) fail "/ota/current.json -> 200 WITHOUT a token (gate is OPEN - security regression)" ;;
  *)   fail "/ota/current.json -> $code (expected 401)" ;;
esac

# /audio-manifest/* is unauthenticated BY DESIGN (D-P1). 200 is the pass.
code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 15 "$BASE/audio-manifest/b000052.json" 2>/dev/null)
case "$code" in
  200) say "  /audio-manifest/b000052.json -> 200 (unauthenticated by design, D-P1)" ;;
  000) fail "/audio-manifest -> no response (host unreachable / TLS failed)" ;;
  5*)  fail "/audio-manifest -> $code (gateway up but device path BROKEN)" ;;
  401) fail "/audio-manifest -> 401; the prefetcher has no token and will now fail (D-P1 broken)" ;;
  404) fail "/audio-manifest -> 404; the published manifest is missing from /srv" ;;
  *)   fail "/audio-manifest -> $code (expected 200)" ;;
esac

# --- probe 2: the real handset, which carries the real token ---
if command -v adb >/dev/null 2>&1 && [ -n "$(adb devices 2>/dev/null | sed -n '2p')" ]; then
  if adb shell pm list packages 2>/dev/null | grep -q "$PKG"; then
    say "  handset attached; launching the app to exercise the real token..."
    # force-stop FIRST. Without it `monkey` merely foregrounds a running
    # instance, the startup OTA/prefetch pass never re-runs, and the probe
    # reports "no device-plane activity" for an app that is perfectly fine.
    adb shell am force-stop "$PKG" >/dev/null 2>&1
    sleep 2
    adb logcat -c >/dev/null 2>&1
    adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
    sleep 30
    log=$(adb logcat -d 2>/dev/null | grep -iE 'mjolnir-ota-debug|mjolnir-audio-prefetch' | tail -8)
    # Any of these proves the app reached the live device plane and got real
    # content back. 'sweep complete'/'cache check' appear when the manifest
    # was already fetched and satisfied, which is still a successful round
    # trip - treating only 'manifest ok' as the pass made this flaky.
    if printf '%s' "$log" | grep -qE 'manifest ok|cache check|sweep complete'; then
      say "  handset: $(printf '%s' "$log" | grep -E 'manifest ok|cache check' | tail -1 | sed 's/.*mjolnir-audio-prefetch..//')"
      say "  handset: reached the LIVE device plane and got real content"
    else
      fail "handset reported no device-plane activity in 30s (plane may be unreachable from the phone)"
    fi
    state=$(printf '%s' "$log" | grep 'ota-debug' | tail -1)
    [ -n "$state" ] && say "  handset state: ${state#*ota-debug\', \'}"

    # Leave no residue. Each launch writes an attempt-<id>-N marker; left
    # alone they accumulate on every run of this check. They are inert while
    # boot-ok-<id> exists (contract §4: quarantine is attempts >= 2 AND no
    # boot-ok), so this is tidiness, not safety - but a health check that
    # mutates the thing it measures is a bad health check. Keep -1 so the
    # directory matches the state the device was found in; never touch
    # `active`, `boot-ok-*` or any bundle.
    active=$(adb shell run-as "$PKG" cat files/mjolnir-ota/active 2>/dev/null | tr -d "\r\n")
    if [ -n "$active" ] && adb shell run-as "$PKG" ls "files/mjolnir-ota/boot-ok-$active" >/dev/null 2>&1; then
      for m in $(adb shell run-as "$PKG" ls files/mjolnir-ota/ 2>/dev/null | tr -d "\r" \
                 | grep -E "^attempt-$active-[0-9]+$" | grep -v -- "-1$"); do
        adb shell run-as "$PKG" rm -f "files/mjolnir-ota/$m" >/dev/null 2>&1
      done
      say "  handset: attempt markers trimmed (boot-ok present; active=$active untouched)"
    fi
  else
    say "  (handset attached but $PKG not installed - skipping end-to-end probe)"
  fi
else
  say "  (no handset attached - unauthenticated probe only; NOT a full proof)"
fi

if [ "$rc" -eq 0 ]; then
  say "=== device plane OK ==="
else
  say "=== DEVICE PLANE DEGRADED - do not leave it in this state ==="
fi
exit "$rc"
