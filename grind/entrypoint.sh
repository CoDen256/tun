#!/bin/sh
# grind — the gateway's entrypoint. Derives the operator password hash at
# START, from OPERATOR_TOKEN, so that no hash is ever stored in a file.
#
# WHAT CONSUMES IT: caddy/Caddyfile's `(operator_gate)` snippet, as
# `basic_auth { operator {$OPERATOR_HASH} }`, imported by every operator
# zone. Until unified-auth 3.1 nothing read this variable at all — the
# derivation ran on every boot and the Caddyfile still used the hand-made
# PHONEXA_AUTH_HASH, so the whole file was inert. It is not any more; if this
# variable stops being exported, every operator zone falls back to the
# Caddyfile's locked default and rejects everything.
#
# THIS RETIRES P35 AND P36 OUTRIGHT, and both were real outages:
#
#   P36  a bcrypt hash contains `$`, which compose interpolates. Both
#        `HASH=$2a$14$abc...` and `HASH="$2a$14$abc..."` reached the container
#        as `$2a$14.DEF/ghi` — compose expanded `$abc` to the empty string.
#        The result still LOOKS like a bcrypt hash, so the only symptom was
#        "every login fails" with a perfectly valid hash sitting in .env.
#   P35  the valueless compose key form resolves from the .env of whichever
#        project you ran `docker compose` in, so under `include:` a hash set
#        in the child repo's .env reached the container ABSENT, Caddy fell
#        back to its locked default, and every request 401'd — indistinguish-
#        able from a wrong password.
#
# Neither can recur, because nothing types or carries a hash any more. The
# operator sets ONE value, OPERATOR_TOKEN, and this derives from it.
#
# ROTATION becomes real too: previously, changing OPERATOR_TOKEN did not
# change the hash, so the old password kept working and nothing said so.
set -eu

: "${OPERATOR_TOKEN:?grind needs OPERATOR_TOKEN — the one operator credential}"

# ---------------------------------------------------------------------------
# TOKEN VALIDATION — added 2026-11-14 after independent review (P51, P52).
#
# Everything below this file originally asserted was about the derived HASH.
# Nothing asserted anything about the TOKEN, and the token is interpolated
# VERBATIM into the Caddyfile as `{$OPERATOR_TOKEN}` / `{$OTA_TOKEN}` — inside
# a quoted matcher, in blocks that include the DEVICE PLANE:
#
#     @bad_token      not header Authorization "Bearer {$OTA_TOKEN}"
#     @sync_bad_token not header Authorization "Bearer {$OPERATOR_TOKEN}"
#
# Two live failures came out of that, and both land on the device, which is
# why they are checked here rather than anywhere else:
#
#   P51  a `"` in the token makes `caddy adapt` fail on the Caddyfile. Every
#        guard in this file passed (they all examine the hash, which is fine),
#        Caddy then died parsing its config, and `restart: unless-stopped`
#        turned that into an infinite crash loop — with /ota/*, /blob/*,
#        /audio-manifest/* and /mjolnir/userdata/* ALL DOWN, because the
#        gateway is the only process on the device path. DEPLOY.md now calls
#        rotating this value routine, so a fat-fingered quote is a plausible
#        way to take the field APK offline.
#
#   P52  the single character `*` is Caddy's "header present, with ANY value"
#        form. `OPERATOR_TOKEN=*` compiles to `not header Authorization "*"`,
#        so `Authorization: Bearer anythingatall` passes the device gate. The
#        token does not fail closed when it is degenerate — it fails OPEN.
#        (Only the exact value `*`; `abc*def` is matched literally.)
#
# So: validate before Caddy ever starts, and fail LOUDLY naming the offending
# character. A clear fatal at boot is strictly better than a crash loop, and
# far better than a gate that is open.
#
# The charset is an allow-list on purpose. A deny-list of "characters Caddy
# treats specially" is a thing you get wrong once and never notice; this
# accepts hex, base64url, and the `changeme`-class values the field device and
# the dev stack actually carry, and rejects everything else — `"` `\` `{` `}`
# `*` `$` whitespace and newlines included.
TOKEN_CHARS='A-Za-z0-9._~+/=-'

check_token() { # check_token <NAME> <value>
  _name=$1; _val=$2

  if [ -z "$_val" ]; then
    echo "grind: FATAL $_name is empty. It is interpolated into the Caddyfile's" >&2
    echo "grind:       Authorization matcher; an empty value does not fail closed." >&2
    exit 1
  fi

  # Degenerate values that make the matcher stop being a credential check.
  if [ "$_val" = "*" ]; then
    echo "grind: FATAL $_name is the single character '*'." >&2
    echo "grind:       Caddy reads \`header Authorization \"*\"\` as 'header PRESENT, any" >&2
    echo "grind:       value', so this does not gate the device plane — it OPENS it to" >&2
    echo "grind:       any Authorization header at all. P52." >&2
    exit 1
  fi

  # Name the offending character rather than saying "invalid". The operator is
  # looking at a .env line and needs to know WHICH byte to fix.
  _bad=$(printf '%s' "$_val" | tr -d "$TOKEN_CHARS")
  if [ -n "$_bad" ]; then
    echo "grind: FATAL $_name contains character(s) that are not allowed in a token: [$_bad]" >&2
    echo "grind:       This value is interpolated verbatim into caddy/Caddyfile as" >&2
    echo "grind:       \`not header Authorization \"Bearer {\$$_name}\"\`. A quote breaks" >&2
    echo "grind:       \`caddy adapt\` outright, and with restart: unless-stopped that is an" >&2
    echo "grind:       INFINITE CRASH LOOP that takes the whole DEVICE PLANE down with it" >&2
    echo "grind:       (/ota/*, /blob/*, /audio-manifest/*, /mjolnir/userdata/*). P51." >&2
    echo "grind:       Allowed: letters, digits, and . _ ~ + / = -" >&2
    exit 1
  fi

  # Minimum length. Deliberately 8 and not 32: the token in the field APK's
  # bundle and the documented local values are short by history
  # (`changeme`, `testtoken`), and this guard must never be the thing that
  # bricks the device plane. 8 rejects the typo-and-stub class (``, `x`,
  # `tok`); the WARN below is where the real target lives.
  if [ "${#_val}" -lt 8 ]; then
    echo "grind: FATAL $_name is ${#_val} characters. Minimum is 8." >&2
    echo "grind:       These are meant to be 32-byte random tokens; a short one is a" >&2
    echo "grind:       stub or a typo, and it gates the device plane." >&2
    exit 1
  fi
  if [ "${#_val}" -lt 24 ]; then
    echo "grind: WARN  $_name is only ${#_val} characters — it is meant to be a" >&2
    echo "grind:       32-byte random token. Not fatal (the field APK carries a short" >&2
    echo "grind:       one and cannot be rolled back), but rotate it on the next" >&2
    echo "grind:       bundle publish. See P48." >&2
  fi
}

check_token OPERATOR_TOKEN "$OPERATOR_TOKEN"
# OTA_TOKEN gates /ota/* — the same interpolation, the same two failures, and
# the one path that has no process and no database behind it. Checked here
# because `grind/compose.yaml` passes it to this container and nothing else
# ever looks at it.
: "${OTA_TOKEN:?grind needs OTA_TOKEN — the /ota/* bearer credential}"
check_token OTA_TOKEN "$OTA_TOKEN"
# ---------------------------------------------------------------------------

# Cost 10 EXPLICITLY, not caddy's default of 14. The credential is a 32-byte
# random token, so its ENTROPY is what resists guessing; a high cost factor
# only burns CPU on every request to defend against a dictionary attack on
# something that is in no dictionary. basic_auth verifies the hash on EVERY
# request, so this is per-request CPU, not a one-off.
#
# `--bcrypt-cost` must be passed: omitting it silently gives 14, which is how
# the original hand-made hashes were cost 14 without anyone choosing it. The
# assertion below checks the cost actually landed, because "silently ignored
# flag" is this repository's most common failure shape.
OPERATOR_HASH="$(caddy hash-password --algorithm bcrypt --bcrypt-cost 10 --plaintext "$OPERATOR_TOKEN")"
export OPERATOR_HASH

# Sanity, because a silently-wrong hash is this file's whole reason to exist:
# bcrypt hashes start `$2a$`/`$2b$`/`$2y$` and are 60 characters.
case "$OPERATOR_HASH" in
  '$2'?'$'*) ;;
  *) echo "grind: FATAL derived hash does not look like bcrypt: '${OPERATOR_HASH}'" >&2; exit 1 ;;
esac
if [ "${#OPERATOR_HASH}" -ne 60 ]; then
  echo "grind: FATAL derived hash is ${#OPERATOR_HASH} chars, expected 60" >&2
  exit 1
fi
case "$OPERATOR_HASH" in
  '$2'?'$10$'*) ;;
  *) echo "grind: FATAL --bcrypt-cost 10 did not take effect: '${OPERATOR_HASH%%\$*}'" >&2
     echo "grind: a silently-ignored flag is the failure shape this repo keeps hitting" >&2
     exit 1 ;;
esac

echo "grind: derived the operator hash from OPERATOR_TOKEN (bcrypt, cost 10)"

# ---------------------------------------------------------------------------
# THE OTA PULL LOG, AND WHY ITS PATH IS PROBED HERE RATHER THAN TYPED IN THE
# CADDYFILE (ota-pull-tracking 2.2).
#
# caddy/Caddyfile declares a second, named access logger (`ota_pulls`) that
# writes /ota/* requests to a file on a shared volume, which mjolnir-hub
# ingests read-only. Observing the device plane is permitted; becoming a
# DEPENDENCY of it is not (D166).
#
# MEASURED 2026-11-20, with that volume mounted `:ro` by mistake:
#
#   {"level":"error","msg":"loading initial config: loading new config:
#    setting up custom log 'ota_pulls': opening log writer ...:
#    open /var/log/caddy/ota-pulls.log: read-only file system"}
#   tun-caddy-1   restarting
#
# Caddy opens and validates every log writer at config-load time and refuses
# to start if one of them fails — there is no "optional output" and no
# degraded mode. With `restart: unless-stopped` that is an infinite crash
# loop, and because the gateway is the ONLY process on the device path it
# takes /ota/*, /blob/*, /audio-manifest/* and /mjolnir/userdata/* down with
# it. A misplaced `:ro` on a LOGGING volume must never be able to do that.
#
# So the writability of the log directory is decided HERE, in shell, where a
# failure can be reported and worked around instead of being fatal:
#
#   writable   -> the real path, hub ingests it, pull tracking works.
#   not        -> a container-local path, nothing ingests it, a loud WARN
#                 says exactly that, and the DEVICE PLANE IS UNAFFECTED.
#
# The fallback is deliberately inside the container's own writable layer and
# not /dev/null: `roll_size` on /dev/null would have Caddy rename the device
# node.
OTA_PULL_LOG_DIR=/var/log/caddy
OTA_PULL_LOG="$OTA_PULL_LOG_DIR/ota-pulls.log"
if ! { mkdir -p "$OTA_PULL_LOG_DIR" 2>/dev/null && touch "$OTA_PULL_LOG" 2>/dev/null; }; then
  OTA_PULL_LOG=/tmp/ota-pulls-fallback.log
  echo "grind: WARN  $OTA_PULL_LOG_DIR is not writable, so OTA pull tracking is OFF." >&2
  echo "grind:       Writing the OTA access log to $OTA_PULL_LOG instead, which NOTHING" >&2
  echo "grind:       ingests: mjolnir-hub's Pulls page will stop gaining rows (already" >&2
  echo "grind:       recorded rows are safe — the table is the record, the file is only" >&2
  echo "grind:       transport). Check that the \`ota_pull_log\` volume is mounted" >&2
  echo "grind:       READ-WRITE here and read-only in mjolnir-hub, not the other way" >&2
  echo "grind:       round. The device plane is unaffected and is still being served." >&2
  touch "$OTA_PULL_LOG" 2>/dev/null || true
fi
export OTA_PULL_LOG
echo "grind: OTA pull log -> $OTA_PULL_LOG"

exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
