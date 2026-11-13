#!/bin/sh
# grind — the gateway's entrypoint. Derives the operator password hash at
# START, from OPERATOR_TOKEN, so that no hash is ever stored in a file.
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
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
