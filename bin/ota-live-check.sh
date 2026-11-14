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
#   1. unauthenticated reachability FROM THIS LAPTOP, per route's OWN contract:
#        /ota/*            MUST 401 — bearer-gated (contract §3).
#        /audio-manifest/* MUST 200 — deliberately UNauthenticated (D-P1:
#                          the prefetch companion cannot read the OTA token
#                          back, so it fetches a plain copy; the buildId that
#                          selects it is already in the bundle in plaintext).
#        /blob/<sha256>    MUST 200 — same reasoning, the hash IS the
#                          capability. The sha is taken from the manifest
#                          fetched a line earlier, so this probe is real and
#                          not a hardcoded guess.
#      A 502 means the gateway is up but the device path is broken; a 000
#      means the host is unreachable. Both are "OTA is down" for the phone.
#   2. the same three routes FROM THE HANDSET'S OWN RADIO, via `/system/bin/curl`
#      in the device shell, with a cache-busting query string.
#
# WHAT PROBE 2 PROVES, AND WHAT IT DOES NOT — read this before trusting it.
#
#   It proves: the phone, over its own network (not the USB cable, not this
#   laptop's DNS or routing), can open a fresh connection to the live gateway
#   and get the contracted status back for all three device routes.
#
#   It does NOT prove the baked OTA token still works. `/ota/*` is the only
#   token-gated route, the token lives in the frozen native patch, and native
#   emits no logcat breadcrumb for the refresh (its one Log.i reports tier
#   selection, not the network). There is nothing observable from outside the
#   app that distinguishes "token accepted" from "token rejected", and this
#   script will not read the secret to manufacture one. An honest narrow check
#   beats a broad false one.
#
# HISTORY — WHY PROBE 2 IS SHAPED THIS WAY (2026-11-14, independent review).
# Probe 2 used to *be* the app: launch it, grep logcat for the audio
# prefetcher's "manifest ok". That probe passed with both radios off:
#
#     adb shell svc wifi disable; adb shell svc data disable
#     # Active default network: none; ping 1.1.1.1 -> Network is unreachable
#     bash bin/ota-live-check.sh   ->  "reached the LIVE device plane"; EXIT=0
#
# `/audio-manifest/*` is `max-age=31536000, immutable` BY DESIGN (D-P1), so
# okhttp served the whole thing out of its HTTP cache. The probe was therefore
# unfalsifiable for a YEAR after its first success — it would have passed with
# the server down, DNS broken or the token revoked. Its header also claimed the
# app's fetch was "the only end-to-end proof that the live token still opens
# the live device plane", three lines under the sentence saying that route is
# unauthenticated. No token was ever exercised. Both are gone.
#
# The app launch is still performed, because "the app's OTA/prefetch machinery
# runs at all" is worth knowing — but it is reported for what it is, and the
# reachability verdict comes from the device-shell probe, which cannot be
# served from any cache.
#
# EXIT CODES
#   0  device plane OK
#   1  device plane DEGRADED — something contracted is broken
#   2  COULD NOT VERIFY — a probe could not be run (adb device offline or
#      unauthorized, app not installed, no curl on the device, a loopback base
#      url the phone cannot reach). Never silently a pass.
#
# Usage:  bash bin/ota-live-check.sh [base-url]        (default: production)
#         OTA_LIVE_BUILD=<buildId> overrides the manifest probed (default the
#         build the field device is on).
set -uo pipefail

BASE="${1:-https://coden256.dev}"
BUILD="${OTA_LIVE_BUILD:-b000052}"
PKG=com.lightblitzlearning.mjolnir
rc=0

say()  { printf '%s\n' "$*"; }
fail() { printf '  ** FAIL ** %s\n' "$*"; rc=1; }
# COULD-NOT-VERIFY never upgrades to a pass and never masks a real failure.
cnv()  { printf '  ** COULD NOT VERIFY ** %s\n' "$*"; [ "$rc" -eq 0 ] && rc=2; return 0; }

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
# Keep the BODY: the sha256s in it are the only honest input to the /blob probe.
MANIFEST=$(mktemp); trap 'rm -f "$MANIFEST"' EXIT
code=$(curl -s -o "$MANIFEST" -w '%{http_code}' --max-time 15 "$BASE/audio-manifest/$BUILD.json" 2>/dev/null)
case "$code" in
  200) say "  /audio-manifest/$BUILD.json -> 200 (unauthenticated by design, D-P1)" ;;
  000) fail "/audio-manifest -> no response (host unreachable / TLS failed)" ;;
  5*)  fail "/audio-manifest -> $code (gateway up but device path BROKEN)" ;;
  401) fail "/audio-manifest -> 401; the prefetcher has no token and will now fail (D-P1 broken)" ;;
  404) fail "/audio-manifest -> 404; the published manifest is missing from /srv" ;;
  *)   fail "/audio-manifest -> $code (expected 200)" ;;
esac

# /blob/<sha256> — listed in this header's contract since the route existed and
# never actually probed until 2026-11-14. The sha comes out of the manifest
# just downloaded, so a blob store that lost its files cannot pass.
BLOB_SHA=$(grep -o '[0-9a-f]\{64\}' "$MANIFEST" 2>/dev/null | head -1)
if [ -z "$BLOB_SHA" ]; then
  cnv "/blob/* not probed: no sha256 in the manifest (empty manifest, or it was not downloaded)"
else
  code=$(curl -s -I -o /dev/null -w '%{http_code}' --max-time 15 "$BASE/blob/$BLOB_SHA" 2>/dev/null)
  case "$code" in
    200) say "  /blob/${BLOB_SHA:0:12}... -> 200 (content-addressed, from this build's manifest)" ;;
    000) fail "/blob -> no response (host unreachable / TLS failed)" ;;
    5*)  fail "/blob -> $code (gateway up but device path BROKEN)" ;;
    404) fail "/blob/$BLOB_SHA -> 404; the manifest names audio that is NOT in the blob store" ;;
    *)   fail "/blob -> $code (expected 200)" ;;
  esac
fi

# --- probe 2: the handset's own radio ---------------------------------------
# Everything below honours $BASE. The old probe ignored it entirely: passing a
# dead base url printed two "** FAIL ** host unreachable" AND "handset: reached
# the LIVE device plane" in the same run.
handset_probe() {
  if ! command -v adb >/dev/null 2>&1; then
    say "  (no adb on this machine - unauthenticated probe only; NOT a full proof)"
    return 0
  fi

  # `adb devices | sed -n 2p` is NON-EMPTY for an `offline` or `unauthorized`
  # device. The old script then failed `pm list packages`, printed "not
  # installed - skipping", left rc at 0 and reported "device plane OK".
  local state
  state=$(adb devices 2>/dev/null | sed -n '2p' | awk '{print $2}')
  if [ -z "$state" ]; then
    say "  (no handset attached - unauthenticated probe only; NOT a full proof)"
    return 0
  fi
  if [ "$state" != "device" ]; then
    cnv "adb reports the handset as '$state' (not 'device') - no device-side probe is possible"
    return 0
  fi

  if ! adb shell pm list packages 2>/dev/null | grep -q "$PKG"; then
    cnv "handset attached but $PKG is NOT installed - the end-to-end probe cannot run"
    return 0
  fi

  # The device-side HTTP client. Present on this handset (/system/bin/curl);
  # its absence is could-not-verify, never a pass.
  if ! adb shell command -v curl >/dev/null 2>&1; then
    cnv "no curl in the device shell - cannot probe the device plane from the handset"
    return 0
  fi

  # A loopback base is this laptop, not a host the phone has any route to.
  # Refusing it is the honest answer; pretending the handset verified it is
  # exactly the bug this rewrite removes.
  case "$BASE" in
    *://localhost*|*://127.*|*://\[::1\]*|*://0.0.0.0*)
      cnv "base url $BASE is loopback - unreachable from the handset, so the device-side probe is skipped"
      return 0 ;;
  esac

  # THE FALSIFIABLE CORE. Fresh connections from the phone's own radio, with a
  # cache-buster on the immutable routes. No HTTP cache, no okhttp, no app.
  local cb dcode
  cb="live=$(date +%s)-$RANDOM"
  dcode=$(adb shell "curl -s -o /dev/null -w '%{http_code}' --max-time 20 '$BASE/ota/current.json?$cb'" 2>/dev/null | tr -d '\r\n')
  case "$dcode" in
    401) say "  handset -> $BASE/ota/current.json : 401 (the phone reached the LIVE gate just now)" ;;
    "")  fail "handset could not run curl against $BASE (no output at all)" ;;
    000) fail "handset -> /ota/current.json : NO RESPONSE. The phone has no route to the live device plane (radios off, DNS, or the host is down)" ;;
    *)   fail "handset -> /ota/current.json : $dcode (expected 401 from the live gate)" ;;
  esac

  dcode=$(adb shell "curl -s -o /dev/null -w '%{http_code}' --max-time 20 '$BASE/audio-manifest/$BUILD.json?$cb'" 2>/dev/null | tr -d '\r\n')
  case "$dcode" in
    200) say "  handset -> $BASE/audio-manifest/$BUILD.json : 200 (cache-busted, so this is a real round trip)" ;;
    "")  fail "handset could not run curl against the manifest route (no output at all)" ;;
    000) fail "handset -> /audio-manifest : NO RESPONSE. The prefetcher would fail on this phone right now" ;;
    *)   fail "handset -> /audio-manifest : $dcode (expected 200)" ;;
  esac

  if [ -n "$BLOB_SHA" ]; then
    dcode=$(adb shell "curl -s -I -o /dev/null -w '%{http_code}' --max-time 20 '$BASE/blob/$BLOB_SHA?$cb'" 2>/dev/null | tr -d '\r\n')
    case "$dcode" in
      200) say "  handset -> $BASE/blob/${BLOB_SHA:0:12}... : 200 (audio is fetchable from the phone)" ;;
      "")  fail "handset could not run curl against the blob route (no output at all)" ;;
      000) fail "handset -> /blob : NO RESPONSE. Audio prefetch would fail on this phone right now" ;;
      *)   fail "handset -> /blob : $dcode (expected 200)" ;;
    esac
  fi

  # --- the app itself: liveness of the machinery, NOT of the network --------
  say "  handset: launching the app to confirm its OTA/prefetch machinery runs..."
  # force-stop FIRST. Without it `monkey` merely foregrounds a running
  # instance, the startup OTA/prefetch pass never re-runs, and the probe
  # reports "no device-plane activity" for an app that is perfectly fine.
  adb shell am force-stop "$PKG" >/dev/null 2>&1
  sleep 2
  adb logcat -c >/dev/null 2>&1
  adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
  sleep 30
  local log
  log=$(adb logcat -d 2>/dev/null | grep -iE 'mjolnir-ota-debug|mjolnir-audio-prefetch' | tail -8)
  # READ THIS AS: the companion ran and resolved its manifest. It may have been
  # served from okhttp's immutable cache (D-P1), so it is NOT evidence that the
  # phone reached the network — the device-shell probes above are.
  if printf '%s' "$log" | grep -qE 'manifest ok|cache check|sweep complete'; then
    say "  handset: $(printf '%s' "$log" | grep -E 'manifest ok|cache check' | tail -1 | sed 's/.*mjolnir-audio-prefetch..//')"
    say "  handset: prefetch machinery ran (manifest resolved; may be okhttp's cache - not a reachability claim)"
  else
    fail "handset reported no device-plane activity in 30s (the app's OTA/prefetch companion did not run)"
  fi
  local devstate
  devstate=$(printf '%s' "$log" | grep 'ota-debug' | tail -1)
  [ -n "$devstate" ] && say "  handset state: ${devstate#*ota-debug\', \'}"

  # Leave no residue. Each launch writes an attempt-<id>-N marker; left
  # alone they accumulate on every run of this check. They are inert while
  # boot-ok-<id> exists (contract §4: quarantine is attempts >= 2 AND no
  # boot-ok), so this is tidiness, not safety - but a health check that
  # mutates the thing it measures is a bad health check. Keep -1 so the
  # directory matches the state the device was found in; never touch
  # `active`, `boot-ok-*` or any bundle.
  local active m
  active=$(adb shell run-as "$PKG" cat files/mjolnir-ota/active 2>/dev/null | tr -d "\r\n")
  if [ -n "$active" ] && adb shell run-as "$PKG" ls "files/mjolnir-ota/boot-ok-$active" >/dev/null 2>&1; then
    for m in $(adb shell run-as "$PKG" ls files/mjolnir-ota/ 2>/dev/null | tr -d "\r" \
               | grep -E "^attempt-$active-[0-9]+$" | grep -v -- "-1$"); do
      adb shell run-as "$PKG" rm -f "files/mjolnir-ota/$m" >/dev/null 2>&1
    done
    say "  handset: attempt markers trimmed (boot-ok present; active=$active untouched)"
  fi
}

handset_probe

case "$rc" in
  0) say "=== device plane OK ===" ;;
  2) say "=== device plane NOT FULLY VERIFIED - a probe could not be run (see above) ===" ;;
  *) say "=== DEVICE PLANE DEGRADED - do not leave it in this state ===" ;;
esac
exit "$rc"
