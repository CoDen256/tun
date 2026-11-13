"""
db/session.py — engine/session factory.

DATABASE_URL is the only thing that differs between local dev and deploy —
it is derived in compose.yaml from POSTGRES_PASSWORD and typed nowhere
(D151/D155): postgresql+psycopg2://shadow:<pw>_shadow@postgres:5432/shadow.
The default below is for a native run against a loopback cluster only.

Copied from phonexa/db/session.py when shadow was split out; identical
except for the database/role in the fallback URL.
"""

from __future__ import annotations

import os

from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker

DATABASE_URL = os.environ.get(
    "DATABASE_URL", "postgresql+psycopg2://shadow:shadow@localhost:5432/shadow"
)

_engine = None
_SessionLocal = None


def get_engine():
    global _engine
    if _engine is None:
        _engine = create_engine(DATABASE_URL, future=True)
    return _engine


def get_sessionmaker():
    global _SessionLocal
    if _SessionLocal is None:
        _SessionLocal = sessionmaker(bind=get_engine(), expire_on_commit=False, class_=Session)
    return _SessionLocal
