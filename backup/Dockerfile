# compose-backup-service: single-client-version image (D-U3/postgres-17-upgrade
# unifies mjolnir-postgres and stabbur-postgres on postgres:17-alpine, and
# phonexa-postgres is postgres:17-alpine too — so one postgresql-client-17
# install covers all three, with no PGDG dual-version dance needed (that was
# confirmed workable but deliberately avoided, see design.md). Adding
# phonexa to the backup set (D147) therefore needs NO change to this file;
# phonexa moving to PG 17 is precisely what keeps that true. bash, git and
# findutils are already here, which is all the audio-mirror loop needs.
FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg lsb-release git openssh-client bash \
    && install -d /usr/share/postgresql-common/pgdg \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc \
        -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc \
    && echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" \
        > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends postgresql-client-17 \
    && ln -s /usr/lib/postgresql/17/bin/pg_dump /usr/local/bin/pg_dump \
    && apt-get purge -y --auto-remove curl gnupg \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
