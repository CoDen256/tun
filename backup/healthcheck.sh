#!/usr/bin/env bash
# Is this service actually backing anything up?
#
# THE DEFECT THIS EXISTS FOR, measured 2026-11-14:
#
#   docker compose logs backup
#     cloning git@github.com:example/tun-backup.git (first run)...
#     Load key "/root/.ssh/id_backup": error in libcrypto
#     git@github.com: Permission denied (publickey).
#     FATAL clone failed ... run failed, will retry next interval
#     sleeping 86400s, next run at 2026-11-15T13:04:19Z
#   docker exec tun-backup-1 ls /data   ->  known_hosts only, no repo
#   docker compose ps backup            ->  Up 7 hours
#
# The error path was already correct — it refused to claim success. What was
# missing is that nothing OUTSIDE the log could tell the difference: `backup`
# was listed in bin/_check_services.py's NO_HEALTHCHECK_BY_DESIGN, so a
# service that had backed up nothing for seven hours was indistinguishable
# from a working one and check-standards.sh reported green.
#
# "Up" is not the predicate. "A whole run finished, recently" is, and the
# only honest evidence of that is the stamp entrypoint.sh writes AFTER the
# push returns — never before, never on a failure path.
#
# Exit 0 = a run completed within one interval plus a grace margin.
# Exit 1 = it has never completed, or not recently enough. Nothing in this
# stack `depends_on: service_healthy` the backup, so unhealthy cascades
# nowhere: it is a flag for a human and for `docker compose ps`.
set -u

STAMP="/data/last-success"
INTERVAL="${BACKUP_INTERVAL_SECONDS:-86400}"
# A quarter of the interval. The run itself takes minutes (five dumps and a
# push), so the stamp is always written somewhat after the cycle begins; a
# margin stops a healthy service flapping unhealthy for the length of its own
# run. It is deliberately a fraction of the interval and not a constant, so
# shortening BACKUP_INTERVAL_SECONDS tightens the check with it.
GRACE=$(( INTERVAL / 4 ))
LIMIT=$(( INTERVAL + GRACE ))

if [ ! -f "$STAMP" ]; then
  echo "UNHEALTHY: no backup has ever completed (no $STAMP) — check 'docker compose logs backup'"
  exit 1
fi

last=$(cat "$STAMP" 2>/dev/null || echo 0)
case "$last" in
  ''|*[!0-9]*)
    echo "UNHEALTHY: $STAMP is not a timestamp"
    exit 1
    ;;
esac

age=$(( $(date -u +%s) - last ))
if [ "$age" -gt "$LIMIT" ]; then
  echo "UNHEALTHY: last successful backup was ${age}s ago, limit is ${LIMIT}s"
  exit 1
fi

echo "ok: last successful backup ${age}s ago (limit ${LIMIT}s)"
exit 0
