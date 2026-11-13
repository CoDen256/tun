#!/usr/bin/env bash
# Enforces the standards that D151 and D152 state, so drift is a failed check
# rather than a discovery. Run it from the repository root.
#
#   bin/check-standards.sh
#
# Exit 0 = conformant. Any violation prints the file and the offending value.
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
note() { printf '  %s\n' "$*"; }
bad() { printf '\033[31mFAIL\033[0m %s\n' "$*"; fail=1; }
ok()  { printf '\033[32m ok \033[0m %s\n' "$*"; }

# --- D151: no configuration key appears in two .env files -----------------
envs=$(ls .env.example */.env.example 2>/dev/null)
dupes=$(for f in $envs; do
          grep -hoE '^[A-Z_][A-Z0-9_]*=' "$f" 2>/dev/null | tr -d '=' | sed "s|^|$f |"
        done | awk '{print $2}' | sort | uniq -d)
if [ -n "$dupes" ]; then
  bad "D151: these keys are defined in more than one .env.example:"
  for k in $dupes; do note "$k -> $(grep -l "^$k=" $envs | tr '\n' ' ')"; done
else
  ok "D151: no configuration key is defined in two .env.example files"
fi

# --- D151: values that must be derived, never typed ------------------------
dead='STABBUR_UPSTREAM|SMIA_UPSTREAM|PHONEXA_UPSTREAM|STABBUR_BASE_URL|STABBUR_UI_BASE|SMIA_BASE_URL|PHONEXA_AUTH_HASH'
if hits=$(grep -nE "^($dead)=" $envs 2>/dev/null); then
  bad "D151: these are derivable or retired and must not be in any .env:"; note "$hits"
else
  ok "D151: no retired or derivable value is typed into a .env"
fi

# --- D152: no container_name, no external network -------------------------
if hits=$(grep -rnE '^\s*(container_name:|external:\s*true)' --include=compose.yaml --include=compose.override.yaml . 2>/dev/null); then
  bad "D152: container_name / external network found:"; note "$hits"
else
  ok "D152: no container_name and no external network"
fi
# Only non-comment lines: the compose files legitimately explain in comments
# that the network was removed and why (D104's trap is worth remembering).
if hits=$(grep -rn 'tun-shared' --include=compose.yaml --include=compose.override.yaml . 2>/dev/null | grep -vE ':[0-9]+:\s*#'); then
  bad "D150: tun-shared network still referenced:"; note "$hits"
else
  ok "D150: no tun-shared reference"
fi

# --- D152: every long-running service restarts -----------------------------
for f in */compose.yaml; do
  svcs=$(grep -cE '^  [a-z][a-z0-9-]*:' "$f")
  rs=$(grep -c 'restart: unless-stopped' "$f")
  [ "$rs" -ge 1 ] || bad "D152: $f declares no restart policy"
done
ok "D152: restart policies present"

# --- D152: nothing but the gateway publishes a public port -----------------
if command -v docker >/dev/null && [ -f .env ]; then
  leak=$(docker compose config --format json 2>/dev/null | python3 -c "
import sys,json
try: d=json.load(sys.stdin)
except Exception: sys.exit(0)
for n,s in d.get('services',{}).items():
    for p in s.get('ports') or []:
        ip=p.get('host_ip','0.0.0.0')
        if n!='caddy' and ip not in ('127.0.0.1','::1'):
            print(f'{n} {ip}:{p.get(\"published\")}')
")
  if [ -n "$leak" ]; then bad "D152: non-gateway service publishes a public port:"; note "$leak"
  else ok "D152: only the gateway publishes publicly"; fi
fi

# --- D153: OpenSpec change ids are bare slugs ------------------------------
if hits=$(ls -d openspec/changes/[0-9]* */openspec/changes/[0-9]* 2>/dev/null); then
  bad "D153: dated change ids (the CLI's --change flag rejects these):"; note "$hits"
else
  ok "D153: all active change ids are bare slugs"
fi

# --- no CI (D152) ----------------------------------------------------------
hits=$(find . -path ./.git -prune -o -path '*/.github/workflows/*' -type f -print 2>/dev/null)
if [ -n "$hits" ]; then
  bad "D152: a CI workflow exists:"; note "$hits"
else
  ok "D152: no CI workflow"
fi

echo
[ $fail -eq 0 ] && echo "all standards checks passed" || echo "standards violations above"
exit $fail
