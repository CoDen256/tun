#!/bin/sh
# Creates the five databases and five roles, idempotently, ON EVERY BOOT.
#
# WHY NOT /docker-entrypoint-initdb.d: Postgres runs that directory ONLY when
# it initialises a fresh data directory. If a first attempt half-fails and the
# volume survives, a re-run creates no databases, no roles, applies no
# passwords and never creates `shadow` — which zone-isolation then assumes
# exists — and the only symptom is per-service authentication failures with
# nothing in the logs. The same mechanism is why one Postgres password cannot
# be changed in place (monorepo-merge design.md, "Data hazard").
#
# So this runs as a one-shot service on every `up`, and is idempotent by
# construction: every statement is guarded by a catalog check. Verify by
# running it twice — the second run must be a no-op and still exit 0.
#
# ROLE PASSWORDS are DERIVED, not typed: each is "<POSTGRES_PASSWORD>_<db>".
# One value in the root .env, five distinct role passwords, and compose can
# build each DATABASE_URL by the same concatenation. Distinct matters: with one
# shared password any service could authenticate as another role and reach its
# database, since a password is what the server checks, not which container
# asked. POSTGRES_PASSWORD must stay URL-safe (no @ : / ? # %) because it is
# embedded in a connection URL.
set -eu

: "${POSTGRES_PASSWORD:?bootstrap needs POSTGRES_PASSWORD}"
: "${PGHOST:=postgres}"
export PGUSER=tunadmin
export PGPASSWORD="$POSTGRES_PASSWORD"

DATABASES="mjolnir stabbur smia phonexa shadow"
CONN_LIMIT="${PG_ROLE_CONNECTION_LIMIT:-20}"

log() { echo "[bootstrap] $*"; }

# Second defence behind the health check's `-h 127.0.0.1` (see compose.yaml).
# `depends_on: service_healthy` is satisfied by the LAST recorded probe, so a
# daemon restart, a resume from suspend, or a cluster still finishing its
# entrypoint can all hand us a server that is not yet accepting TCP. Every
# statement below is idempotent, so waiting costs nothing and a refused
# connection costs eight services their boot.
for attempt in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
  if pg_isready -q -d postgres; then break; fi
  if [ "$attempt" = 15 ]; then
    log "FATAL: $PGHOST not accepting connections after 30s"
    exit 1
  fi
  [ "$attempt" = 1 ] && log "waiting for $PGHOST to accept connections"
  sleep 2
done

for db in $DATABASES; do
  pw="${POSTGRES_PASSWORD}_${db}"

  # Role. ALTER on every run so a rotated POSTGRES_PASSWORD actually takes
  # effect — unlike the server's own POSTGRES_PASSWORD, which is applied only
  # at initdb and is exactly the trap that made the four per-database keys
  # necessary in the first place.
  # Ask, and check that the ASKING worked — `psql ... | grep -q 1` cannot tell
  # "no such role" from "the query never ran": a connection error yields empty
  # output, grep returns 1, and control falls into the CREATE branch as if the
  # role were absent. Under `set -e` the `if` condition is never fatal, so the
  # failure is swallowed and only the CREATE that follows aborts the script.
  if ! role_exists=$(psql -d postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='$db'"); then
    log "FATAL: cannot query pg_roles for $db"
    exit 1
  fi
  if [ "$role_exists" = 1 ]; then
    psql -q -d postgres -c "ALTER ROLE \"$db\" LOGIN PASSWORD '$pw' CONNECTION LIMIT $CONN_LIMIT"
    log "role $db: updated"
  else
    psql -q -d postgres -c "CREATE ROLE \"$db\" LOGIN PASSWORD '$pw' CONNECTION LIMIT $CONN_LIMIT"
    log "role $db: created"
  fi

  # Database. CREATE DATABASE cannot run inside a transaction or a DO block,
  # hence the shell-level guard rather than SQL.
  if psql -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$db'" | grep -q 1; then
    log "database $db: exists"
  else
    psql -q -d postgres -c "CREATE DATABASE \"$db\" OWNER \"$db\""
    log "database $db: created"
  fi

  # Isolation: each role reaches ONLY its own database. This, not the password,
  # is what makes "a bad migration in one service cannot touch another" true,
  # and it is what task 6.3 verifies.
  psql -q -d postgres -c "REVOKE ALL ON DATABASE \"$db\" FROM PUBLIC"
  psql -q -d postgres -c "GRANT ALL ON DATABASE \"$db\" TO \"$db\""

  # SCHEMA OWNERSHIP, re-asserted on EVERY run — this is the self-healing the
  # whole "runs every boot" design exists for, and it is not theoretical.
  #
  # Since Postgres 15 the `public` schema is owned by `pg_database_owner` and
  # no longer grants CREATE to PUBLIC. Restoring a dump as the SUPERUSER with a
  # `DROP SCHEMA public CASCADE; CREATE SCHEMA public;` in front of it — the
  # obvious way to make a restore repeatable — recreates `public` owned by the
  # superuser instead, and the service role silently loses CREATE. The symptom
  # is not a permission error at connect time: the service starts, connects
  # fine, and then its migration dies inside `RangeVarGetCreationNamespace`
  # with no mention of privileges. Hit exactly that during this change's own
  # end-to-end test.
  #
  # Making the role OWN the schema (not merely be granted on it) means a
  # restore can never leave it unable to migrate, and a re-run of this script
  # repairs a database that was restored carelessly.
  psql -q -d "$db" -c "ALTER SCHEMA public OWNER TO \"$db\""
  psql -q -d "$db" -c "GRANT ALL ON SCHEMA public TO \"$db\""

  # The same hazard one level down: a dump restored BY THE SUPERUSER leaves
  # every table, sequence and view owned by the superuser, and the service role
  # then gets "permission denied for table alembic_version" / "for table
  # schema_migrations" the moment it tries to migrate. The service starts and
  # connects fine first, so it looks like a migration bug, not a privilege one.
  #
  # The documented procedure is to restore AS THE SERVICE ROLE (the dumps are
  # --no-owner precisely so objects land owned by whoever restores them). This
  # loop is the safety net for when that is forgotten: bounded to the public
  # schema of this one database, and a no-op when ownership is already right.
  psql -q -d "$db" -tAc "
    SELECT format('ALTER TABLE public.%I OWNER TO %I;', tablename, '$db')
      FROM pg_tables  WHERE schemaname='public' AND tableowner <> '$db'
    UNION ALL
    SELECT format('ALTER SEQUENCE public.%I OWNER TO %I;', sequencename, '$db')
      FROM pg_sequences WHERE schemaname='public' AND sequenceowner <> '$db'
    UNION ALL
    SELECT format('ALTER VIEW public.%I OWNER TO %I;', viewname, '$db')
      FROM pg_views   WHERE schemaname='public' AND viewowner <> '$db'
  " | grep . | psql -q -d "$db" -f - || true
done

log "done: $(psql -d postgres -tAc "SELECT count(*) FROM pg_database WHERE datistemplate=false") databases, $(psql -d postgres -tAc "SELECT count(*) FROM pg_roles WHERE rolcanlogin AND rolname <> 'tunadmin'") service roles"
