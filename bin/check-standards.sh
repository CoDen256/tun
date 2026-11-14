#!/usr/bin/env bash
# Enforces the standards D150-D153 state, so drift is a failed check rather
# than a discovery. Run from the repository root.
#
#   bin/check-standards.sh
#
# EXIT CODES MATTER — DEPLOY.md treats this as a gate:
#   0  every check ran and passed
#   1  a real violation
#   2  a check could not be run (no docker, no .env). NOT a pass.
#
# Rewritten 2026-11-13 after independent review found the previous version
# fail-OPEN on its most security-relevant check: the port-leak test piped
# `docker compose config` into python with `except: sys.exit(0)`, so ANY
# config failure produced an empty result and printed " ok ". It was also
# gated on `[ -f .env ]` and skipped in silence on a fresh clone, while the
# summary still read "all standards checks passed". A gate that cannot fail is
# worse than no gate.
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0; skipped=0
note() { printf '     %s\n' "$*"; }
bad()  { printf '\033[31mFAIL\033[0m %s\n' "$*"; fail=1; }
ok()   { printf '\033[32m ok \033[0m %s\n' "$*"; }
skip() { printf '\033[33mSKIP\033[0m %s\n' "$*"; skipped=1; }

# Every compose file, including the root compose.dev.yaml the old version's
# --include globs silently excluded.
COMPOSE_FILES=$(find . -path ./.git -prune -o -name 'compose*.yaml' -type f -print 2>/dev/null | grep -v '/base/')
# .env.example at ANY depth — the old depth-1 glob missed
# mjolnir/hub/.env.example, which types a DATABASE_URL that D151 forbids.
ENV_FILES=$(find . -path ./.git -prune -o -name '.env.example' -type f -print 2>/dev/null)

# --- D151: no configuration key in two .env.example files -------------------
dupes=$(for f in $ENV_FILES; do
          grep -hoE '^[[:space:]]*#?[[:space:]]*[A-Z_][A-Z0-9_]*=' "$f" 2>/dev/null \
            | tr -d '#=' | tr -d '[:blank:]'
        done | sort | uniq -d)
if [ -n "$dupes" ]; then
  bad "D151: keys defined in more than one .env.example:"
  for k in $dupes; do note "$k -> $(grep -lE "^[[:space:]]*#?[[:space:]]*$k=" $ENV_FILES | tr '\n' ' ')"; done
else
  ok "D151: no configuration key is defined in two .env.example files ($(echo $ENV_FILES | wc -w) files, commented keys included)"
fi

# --- D151: derivable or retired values must not be typed anywhere ----------
# PHONEXA_AUTH_HASH joined the list with `unified-auth` 3.3, which is the
# "add it then" the previous version of this comment pointed at: the gateway
# entrypoint now derives the operator hash from OPERATOR_TOKEN at start, no
# compose file interpolates the variable, and nothing anywhere may type a hash
# again. (It was deliberately absent before that, because it was then neither
# derivable nor retired.)
dead='STABBUR_UPSTREAM|SMIA_UPSTREAM|PHONEXA_UPSTREAM|STABBUR_BASE_URL|STABBUR_UI_BASE|SMIA_BASE_URL|DATABASE_URL|PHONEXA_AUTH_HASH'
hits=$(grep -nE "^[[:space:]]*#?[[:space:]]*($dead)=" $ENV_FILES 2>/dev/null)
if [ -n "$hits" ]; then bad "D151: derivable/retired values typed into a .env.example:"; note "$hits"
else ok "D151: no retired or derivable value is typed into any .env.example"; fi

# --- D152/D150: file-level prohibitions across EVERY compose file ----------
hits=$(grep -nE '^[[:space:]]*(container_name:|external:[[:space:]]*true)' $COMPOSE_FILES 2>/dev/null)
if [ -n "$hits" ]; then bad "D152: container_name / external network:"; note "$hits"
else ok "D152: no container_name and no external network (all $(echo $COMPOSE_FILES | wc -w) compose files)"; fi

hits=$(grep -nE 'tun-shared' $COMPOSE_FILES 2>/dev/null | grep -vE ':[0-9]+:[[:space:]]*#')
if [ -n "$hits" ]; then bad "D150: tun-shared referenced outside a comment:"; note "$hits"
else ok "D150: no tun-shared reference outside comments"; fi

# --- D153: active change ids are bare slugs --------------------------------
# Archives keep their dated names on purpose (D153) — they are historical
# record, are not addressable by `openspec --change` either way, and renaming
# them would break every document citing them. This check is therefore about
# ACTIVE changes only, and its message says so rather than implying more.
hits=$(find . -path ./.git -prune -o -path '*/openspec/changes/*' -name '.openspec.yaml' -print 2>/dev/null \
        | grep -v '/archive/' | xargs -r -n1 dirname 2>/dev/null \
        | xargs -r -n1 basename 2>/dev/null | grep -E '^[0-9]')
if [ -n "$hits" ]; then bad "D153: dated ACTIVE change ids (openspec --change rejects these):"; note "$hits"
else ok "D153: every ACTIVE change id is a bare slug (archives keep dated names by decision)"; fi

# --- D152: no CI ------------------------------------------------------------
hits=$(find . -path ./.git -prune -o -path '*/.github/workflows/*' -type f -print 2>/dev/null)
if [ -n "$hits" ]; then bad "D152: a CI workflow exists:"; note "$hits"
else ok "D152: no CI workflow"; fi

# --- service-level checks, from the RENDERED config (authoritative) --------
# These cannot be done by grepping text: a service's effective restart policy,
# ports and healthcheck are the result of merging every included fragment.
if ! command -v docker >/dev/null 2>&1; then
  skip "D152 service-level checks: docker not available — restart policies, port exposure and healthchecks NOT verified"
elif [ ! -f .env ]; then
  skip "D152 service-level checks: no .env at the repo root — cannot render the config, so restart policies, port exposure and healthchecks are NOT verified (cp .env.example .env)"
else
  rendered=$(docker compose config --format json 2>/dev/null)
  if [ -z "$rendered" ]; then
    bad "D152 service-level checks: 'docker compose config' produced NOTHING — the project does not render. This is a violation, not a skip:"
    note "$(docker compose config 2>&1 | head -4)"
  else
    result=$(printf '%s' "$rendered" | python3 "$(dirname "$0")/_check_services.py" 2>&1)
    if printf '%s' "$result" | grep -q '^P:'; then
      bad "D152: service-level violations in the rendered config:"
      printf '%s' "$result" | grep '^P:' | sed 's/^P:/     /'
    else
      ok "D152: every service restarts, only the gateway publishes publicly, every backend has a healthcheck ($(printf '%s' "$result" | grep SERVICES= | cut -d= -f2) services)"
    fi
  fi
fi

echo
if [ "$fail" -ne 0 ]; then echo "standards VIOLATIONS above"; exit 1; fi
if [ "$skipped" -ne 0 ]; then echo "no violations found, but some checks could NOT be run — this is not a pass"; exit 2; fi
echo "all standards checks passed"
