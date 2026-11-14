#!/usr/bin/env bash
# Enforces the standards D150-D153 state, so drift is a failed check rather
# than a discovery. Run from the repository root.
#
#   bin/check-standards.sh
#
# EXIT CODES MATTER — DEPLOY.md treats this as a gate:
#   0  every check ran and passed
#   1  a real violation
#   2  a check could not be run (no docker, no .env, no python3, no inputs).
#      NOT a pass.
#
# Rewritten 2026-11-13 after independent review found the previous version
# fail-OPEN on its most security-relevant check: the port-leak test piped
# `docker compose config` into python with `except: sys.exit(0)`, so ANY
# config failure produced an empty result and printed " ok ". It was also
# gated on `[ -f .env ]` and skipped in silence on a fresh clone, while the
# summary still read "all standards checks passed". A gate that cannot fail is
# worse than no gate.
#
# HARDENED AGAIN 2026-11-14, after a second review found THE SAME SHAPE still
# here, twice (P51, P52), plus a port check that matched one of six publish
# syntaxes (P53):
#
#   * the rendered-config block captured python3's stderr into the result and
#     decided on `grep -q '^P:'` alone, so a missing python3, a deleted helper
#     or a syntax error in it printed ` ok ... ( services)` — note the empty
#     count — and exited 0, silently disabling all three rendered-config
#     rules. Proven with `PATH=/tmp/nopy:$PATH bash bin/check-standards.sh`.
#   * COMPOSE_FILES / ENV_FILES come from `find`. Empty lists leave `grep -nE
#     pat $FILES` with no file operand, so grep READS STDIN and every check
#     reports green over zero inputs. Proven in a tree containing only bin/.
#
# THE RULE THIS FILE NOW FOLLOWS, everywhere: a check that did not run is
# reported as UNVERIFIED (exit 2). Only a check that ran over a non-empty
# input may print ` ok `. An empty input is itself a failure signal.
set -uo pipefail
cd "$(dirname "$0")/.."
BIN="$(dirname "$0")"
fail=0; skipped=0
note() { printf '     %s\n' "$*"; }
bad()  { printf '\033[31mFAIL\033[0m %s\n' "$*"; fail=1; }
ok()   { printf '\033[32m ok \033[0m %s\n' "$*"; }
skip() { printf '\033[33mSKIP\033[0m %s\n' "$*"; skipped=1; }
# Louder than SKIP on purpose: SKIP reads as "not applicable here", this reads
# as "the gate did not run". Both exit 2; only this one is a defect.
unverified() { printf '\033[33mUNVERIFIED\033[0m %s\n' "$*"; skipped=1; }

# Every compose file, including the root compose.dev.yaml the old version's
# --include globs silently excluded, and every per-project
# compose.override.yaml (the `compose*.yaml` glob matches them — which the
# 2026-11-14 review doubted and which is asserted below rather than assumed).
COMPOSE_FILES=$(find . -path ./.git -prune -o -name 'compose*.yaml' -type f -print 2>/dev/null | grep -v '/base/')
# .env.example at ANY depth — the old depth-1 glob missed
# mjolnir/hub/.env.example, which types a DATABASE_URL that D151 forbids.
ENV_FILES=$(find . -path ./.git -prune -o -name '.env.example' -type f -print 2>/dev/null)

# --- the inputs themselves, asserted before anything consumes them ---------
# `grep -nE pat $EMPTY` reads STDIN. Seven green lines over zero files is
# exactly the "failure reports success" shape this file exists to stop, so the
# lists are checked once, here, and every block below runs only over a
# non-empty list.
have_compose=1; have_env=1
if [ -z "$COMPOSE_FILES" ]; then
  unverified "no compose file found under $PWD — the D150/D152 file-level rules and the 4.7 port scan did NOT run (is this the repository root?)"
  have_compose=0
fi
if [ -z "$ENV_FILES" ]; then
  unverified "no .env.example found under $PWD — the two D151 rules did NOT run (is this the repository root?)"
  have_env=0
fi
# Every per-project override must be in the list: that is where a dev port is
# added, and the 4.7 scan is the only layer that sees them (the rendered
# config below is the root project, which does not load them).
overrides_on_disk=$(find . -path ./.git -prune -o -name 'compose.override.yaml' -type f -print 2>/dev/null | wc -l)
overrides_scanned=$(printf '%s\n' "$COMPOSE_FILES" | grep -c 'compose\.override\.yaml$')
if [ "$overrides_on_disk" -ne "$overrides_scanned" ]; then
  unverified "the compose file list covers $overrides_scanned of $overrides_on_disk compose.override.yaml files on disk — the 4.7 port scan has blind spots"
  have_compose=0
fi

# Runs a python helper and refuses to interpret anything it did not actually
# produce. $1 = helper path, $2 = human name for the message, rest = argv.
# stdin is whatever the caller pipes in. Sets HELPER_OUT / HELPER_RC.
run_helper() {
  local helper="$1" label="$2"; shift 2
  local errfile; errfile=$(mktemp)
  if ! command -v python3 >/dev/null 2>&1; then
    HELPER_RC=127; HELPER_OUT=""; HELPER_ERR="python3 is not on PATH"
    rm -f "$errfile"; return 127
  fi
  if [ ! -f "$helper" ]; then
    HELPER_RC=126; HELPER_OUT=""; HELPER_ERR="$helper is missing"
    rm -f "$errfile"; return 126
  fi
  HELPER_OUT=$(python3 "$helper" "$@" 2>"$errfile"); HELPER_RC=$?
  HELPER_ERR=$(head -5 "$errfile")
  rm -f "$errfile"
  return "$HELPER_RC"
}

# --- D151: no configuration key in two .env.example files -------------------
if [ "$have_env" -eq 1 ]; then
dupes=$(for f in $ENV_FILES; do
          grep -hoE '^[[:space:]]*#?[[:space:]]*[A-Z_][A-Z0-9_]*=' "$f" 2>/dev/null \
            | tr -d '#=' | tr -d '[:blank:]'
        done | sort | uniq -d)
if [ -n "$dupes" ]; then
  bad "D151: keys defined in more than one .env.example:"
  for k in $dupes; do note "$k -> $(grep -lE "^[[:space:]]*#?[[:space:]]*$k=" $ENV_FILES </dev/null | tr '\n' ' ')"; done
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
#
# STABBUR_AUTH_TOKEN and SMIA_AUTH_TOKEN joined it with `unified-auth` 4.6:
# there is ONE internal token now (INTERNAL_TOKEN) and the two per-pair names
# are retired. They are listed here so neither can be retyped into a
# .env.example and quietly become a second credential nobody reads.
#
# The four per-database passwords joined it 2026-11-14. postgres-consolidation
# replaced them with the single POSTGRES_PASSWORD months ago and no compose
# file has interpolated one since — but all four were still sitting in the
# live root .env, reading as four live credentials in the file D151 made
# authoritative. Listed here so they cannot be retyped.
dead='STABBUR_UPSTREAM|SMIA_UPSTREAM|PHONEXA_UPSTREAM|STABBUR_BASE_URL|STABBUR_UI_BASE|SMIA_BASE_URL|DATABASE_URL|PHONEXA_AUTH_HASH|STABBUR_AUTH_TOKEN|SMIA_AUTH_TOKEN|MJOLNIR_POSTGRES_PASSWORD|STABBUR_POSTGRES_PASSWORD|SMIA_POSTGRES_PASSWORD|PHONEXA_POSTGRES_PASSWORD'
hits=$(grep -nE "^[[:space:]]*#?[[:space:]]*($dead)=" $ENV_FILES </dev/null 2>/dev/null)
if [ -n "$hits" ]; then bad "D151: derivable/retired values typed into a .env.example:"; note "$hits"
else ok "D151: no retired or derivable value is typed into any .env.example"; fi
fi

# --- D152/D150: file-level prohibitions across EVERY compose file ----------
if [ "$have_compose" -eq 1 ]; then
hits=$(grep -nE '^[[:space:]]*(container_name:|external:[[:space:]]*true)' $COMPOSE_FILES </dev/null 2>/dev/null)
if [ -n "$hits" ]; then bad "D152: container_name / external network:"; note "$hits"
else ok "D152: no container_name and no external network (all $(echo $COMPOSE_FILES | wc -w) compose files)"; fi

# --- unified-auth 4.7: nothing but the gateway leaves the loopback ---------
# THE MARKER-HEADER TRUST MODEL DEPENDS ON THIS, which is why it is a check
# and not a convention. Services accept `X-Tun-Operator` as proof that the
# gateway authenticated the caller (libs/pyservice/auth.py,
# libs/jsservice/auth.js). The gateway strips any inbound copy, so the only
# way to forge one is to reach a service WITHOUT going through the gateway.
# The marker is checked for PRESENCE, not value, so one reachable port is a
# total bypass of every zone.
#
# Text-level and over EVERY compose file, deliberately: the rendered-config
# check below sees only the root project, so a per-project
# `compose.override.yaml` — which is exactly where a dev port is added —
# is invisible to it. grind/compose.yaml is the one file allowed a public
# mapping, because publishing 80/443 is what a gateway is.
#
# The matching lives in bin/_check_ports.py, which understands all six
# publish syntaxes. The awk one-liner that used to be here understood one
# (P53).
scan_files=$(for f in $COMPOSE_FILES; do
               case "$f" in ./grind/compose.yaml) continue;; esac
               printf '%s\n' "$f"
             done)
if [ -z "$scan_files" ]; then
  unverified "unified-auth 4.7: no non-gateway compose file to scan — the port check did NOT run"
elif ! run_helper "$BIN/_check_ports.py" "port scan" $scan_files; then
  unverified "unified-auth 4.7: the port check could not run (exit $HELPER_RC) — port exposure is NOT verified: ${HELPER_ERR:-no output}"
elif printf '%s\n' "$HELPER_OUT" | grep -q '^P:'; then
  bad "unified-auth 4.7: a non-gateway service publishes outside the loopback interface:"
  printf '%s\n' "$HELPER_OUT" | grep '^P:' | sed 's/^P:/     /'
elif ! printf '%s\n' "$HELPER_OUT" | grep -q '^FILES=[1-9]'; then
  unverified "unified-auth 4.7: the port check reported no scanned files — NOT verified"
else
  ok "unified-auth 4.7: only grind/compose.yaml publishes publicly; every other mapping is loopback, and no service uses host networking ($(printf '%s\n' "$HELPER_OUT" | sed -n 's/^FILES=//p') files, all publish syntaxes)"
fi

hits=$(grep -nE 'tun-shared' $COMPOSE_FILES </dev/null 2>/dev/null | grep -vE ':[0-9]+:[[:space:]]*#')
if [ -n "$hits" ]; then bad "D150: tun-shared referenced outside a comment:"; note "$hits"
else ok "D150: no tun-shared reference outside comments"; fi
fi

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

# --- the backup's smia exclusions must rest on files that exist ------------
# Not a D-number: a correction. backup/entrypoint.sh excluded fifteen smia
# tables on the written grounds that every one is rebuilt from `providers/`,
# "which is itself tracked in git". Two of those archives are not in the tree
# at all, so three tables are excluded from the backup with nothing anywhere
# to rebuild them from. Found by RUNNING the import, which printed
# "[bootstrap] skipping scripts.import_nst: No such file ...". A claim about
# files is checkable against files; this makes it so.
run_helper "$BIN/_check_backup_sources.py" "backup source check"
if [ "$HELPER_RC" -ne 0 ]; then
  unverified "backup sources: the helper did not run (exit $HELPER_RC) — smia's exclusion list is NOT verified: ${HELPER_ERR:-no output}"
else
  sources=$(printf '%s\n' "$HELPER_OUT" | sed -n 's/^SOURCES=//p')
  printf '%s\n' "$HELPER_OUT" | grep '^N:' | sed 's/^N:/     note: /'
  if printf '%s\n' "$HELPER_OUT" | grep -q '^P:'; then
    bad "backup: smia excludes a table from the backup whose source file is not in the tree:"
    printf '%s\n' "$HELPER_OUT" | grep '^P:' | sed 's/^P:/     /'
  elif [ -z "$sources" ] || [ "$sources" -eq 0 ]; then
    unverified "backup sources: zero provider paths were examined — nothing is verified"
  else
    ok "backup: every provider path smia names is present, or acknowledged absent with the tables it leaves unbacked ($sources paths)"
  fi
fi

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
    # stderr is NOT folded into the result and the exit status IS consulted:
    # the previous version did the opposite of both and printed ` ok ` with an
    # empty service count when python3 was unavailable (P51).
    printf '%s' "$rendered" > /tmp/.tun-rendered.$$
    run_helper "$BIN/_check_services.py" "service checks" </tmp/.tun-rendered.$$
    rm -f /tmp/.tun-rendered.$$
    count=$(printf '%s\n' "$HELPER_OUT" | sed -n 's/^SERVICES=//p')
    if [ "$HELPER_RC" -ne 0 ]; then
      unverified "D152 service-level checks: the helper did not run (exit $HELPER_RC) — restart policies, port exposure and healthchecks are NOT verified: ${HELPER_ERR:-no output}"
    elif printf '%s\n' "$HELPER_OUT" | grep -q '^P:'; then
      bad "D152: service-level violations in the rendered config:"
      printf '%s\n' "$HELPER_OUT" | grep '^P:' | sed 's/^P:/     /'
    elif [ -z "$count" ] || [ "$count" -eq 0 ]; then
      # Zero services is not "all good", it is "nothing was examined".
      unverified "D152 service-level checks: the rendered config yielded ${count:-no} services — nothing was examined, so NOTHING is verified"
    else
      ok "D152: every service restarts, only the gateway publishes publicly, every backend has a healthcheck and none uses host networking ($count services)"
    fi
  fi
fi

echo
if [ "$fail" -ne 0 ]; then echo "standards VIOLATIONS above"; exit 1; fi
if [ "$skipped" -ne 0 ]; then echo "no violations found, but some checks could NOT be run — this is not a pass"; exit 2; fi
echo "all standards checks passed"
