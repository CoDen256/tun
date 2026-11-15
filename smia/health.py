"""
health.py — per-provider health tracking backing `GET /health`
(provider-catalog spec, task 8.2). Purely observational: `cache.run_lookup`
calls `record_request`/`record_success`/`record_failure` but never reads
this data back to make a routing decision — "no fallback or fan-out" and
"health must not influence provider choice" both hold regardless of what
this module records.
"""

from __future__ import annotations

import datetime

from sqlalchemy import text

from sqlalchemy.dialects.postgresql import insert as pg_insert

from db.models import ProviderHealth


def record_request(db, kind: str, provider: str) -> None:
    # UPSERT, not query-then-insert. `uq_provider_health_kind_provider` makes
    # the old shape a race with a 500 at the end of it, and this runs on EVERY
    # lookup rather than only on a cache miss - so it is the more exposed of
    # the two paths that had this bug. Counting is done in SQL
    # (`requests_count + 1`) so two concurrent requests cannot both read the
    # same value and write the same increment.
    db.execute(
        pg_insert(ProviderHealth.__table__)
        .values(kind=kind, provider=provider, requests_count=1, success_count=0, failure_count=0)
        .on_conflict_do_update(
            constraint="uq_provider_health_kind_provider",
            set_={"requests_count": ProviderHealth.__table__.c.requests_count + 1},
        )
    )
    db.commit()


def record_success(db, kind: str, provider: str) -> None:
    # Atomic increment. Read-modify-write lost counts under concurrency: two
    # requests both read N and both write N+1.
    db.execute(
        ProviderHealth.__table__.update()
        .where(
            (ProviderHealth.__table__.c.kind == kind)
            & (ProviderHealth.__table__.c.provider == provider)
        )
        .values(
            success_count=ProviderHealth.__table__.c.success_count + 1,
            last_success_at=datetime.datetime.now(datetime.timezone.utc),
        )
    )
    db.commit()


def record_failure(db, kind: str, provider: str, message: str) -> None:
    db.execute(
        ProviderHealth.__table__.update()
        .where(
            (ProviderHealth.__table__.c.kind == kind)
            & (ProviderHealth.__table__.c.provider == provider)
        )
        .values(
            failure_count=ProviderHealth.__table__.c.failure_count + 1,
            last_failure_at=datetime.datetime.now(datetime.timezone.utc),
            last_failure_message=message,
        )
    )
    db.commit()


def get_all(db) -> list[dict]:
    rows = db.execute(
        text(
            """
            SELECT kind, provider, requests_count, success_count, failure_count,
                   last_success_at, last_failure_at, last_failure_message
            FROM provider_health
            ORDER BY kind, provider
            """
        )
    ).all()
    return [
        {
            "kind": kind,
            "provider": provider,
            "requestsCount": requests_count,
            "successCount": success_count,
            "failureCount": failure_count,
            "hitCount": max(requests_count - success_count - failure_count, 0),
            "lastSuccessAt": last_success_at.isoformat() if last_success_at else None,
            "lastFailureAt": last_failure_at.isoformat() if last_failure_at else None,
            "lastFailureMessage": last_failure_message,
        }
        for (
            kind, provider, requests_count, success_count, failure_count,
            last_success_at, last_failure_at, last_failure_message,
        ) in rows
    ]
