"""Tests for GET /providers, GET /health (task 8.1-8.2) and the UI served
at the prefix root (unified-auth 5.1), which is NO LONGER exempt from auth
(unified-auth 4.5 deleted every carve-out)."""

from __future__ import annotations

import cache
from app import app as real_app
from db.session import session_scope
from registry import registry


def _client():
    return real_app.test_client()


AUTH = {"Authorization": "Bearer test-token"}


def test_providers_catalog_lists_registered_adapters(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().get("/providers", headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    assert "ordbank" in body["inflections"]


def test_providers_catalog_reports_counts_for_table_backed_providers_only(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().get("/providers", headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    counts = body["counts"]
    # ordbank (table-backed) reports a count, even if 0 in a fresh test db.
    assert "ordbank" in counts["inflections"]
    assert isinstance(counts["inflections"]["ordbank"], int)
    # dictcc_api (live-call provider, no local table) reports no count.
    assert "dictcc_api" not in counts.get("translations", {})


def test_health_reflects_requests_and_cache_hits(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    registry.register("testkind", "only", type("A", (), {"lookup": lambda self, i: {"ok": True}})())

    with session_scope() as db:
        cache.run_lookup(db, "testkind", "only", {"x": 1})
    with session_scope() as db:
        cache.run_lookup(db, "testkind", "only", {"x": 1})  # cache hit

    resp = _client().get("/health", headers=AUTH)
    rows = resp.get_json()
    row = next(r for r in rows if r["kind"] == "testkind" and r["provider"] == "only")
    assert row["requestsCount"] == 2
    assert row["successCount"] == 1
    assert row["hitCount"] == 1


def test_ui_index_and_assets_now_require_a_credential():
    # unified-auth 4.5 deleted the /ui carve-out and 5.1 moved the page from
    # /ui to the prefix root. There is nothing to paste a token into any more,
    # so there is no chicken-and-egg left to carve out for: the operator is
    # already authenticated at the gateway by the time the page loads.
    c = _client()
    assert c.get("/").status_code == 401
    assert c.get("/static/ui.css").status_code == 401
    assert c.get("/static/ui.js").status_code == 401


def test_ui_index_and_assets_are_served_at_the_prefix_root_when_authorized(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    c = _client()
    assert c.get("/", headers=AUTH).status_code == 200
    assert c.get("/static/ui.css", headers=AUTH).status_code == 200
    assert c.get("/static/ui.js", headers=AUTH).status_code == 200


def test_the_gateway_marker_is_accepted_instead_of_a_token():
    # No INTERNAL_TOKEN configured at all: the marker is the whole credential.
    c = _client()
    assert c.get("/providers", headers={"X-Tun-Operator": "1"}).status_code == 200


def test_api_routes_still_require_auth_under_ui_unrelated_paths():
    c = _client()
    assert c.get("/providers").status_code == 401


def test_missing_server_token_is_401_not_500(monkeypatch):
    monkeypatch.delenv("INTERNAL_TOKEN", raising=False)
    resp = _client().get("/providers", headers=AUTH)
    assert resp.status_code == 401
