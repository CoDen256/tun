"""
The split's invariants, as tests rather than as prose.

These are deliberately database-free: they assert the SHAPE of the zone
boundary, which is what a careless edit would break. Behaviour that needs a
real cluster is verified in the change's own verification tasks, not here.

    cd shadow && python -m pytest
"""

import pathlib

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent


def test_no_cross_service_foreign_key_on_user_id():
    """D42: `users` lives in phonexa's database, so nothing here may point at it."""
    models = (ROOT / "db" / "models.py").read_text()
    assert 'ForeignKey("users.id"' not in models
    assert "ForeignKey('users.id'" not in models
    # And the column still exists, as a plain integer.
    assert "user_id: Mapped[int] = mapped_column(Integer, nullable=False, index=True)" in models


def test_shadow_declares_no_volumes():
    """Shadow stores no audio — it must mount nothing (task 3.4)."""
    compose = (ROOT / "compose.yaml").read_text()
    assert "\nvolumes:" not in compose
    assert "    volumes:" not in compose


def test_shadow_does_not_import_phonexa_models():
    """The only link to phonexa is HTTP, in one file."""
    for name in ("app.py", "shadowing.py"):
        src = (ROOT / name).read_text()
        for forbidden in ("ShadowingMedia, ShadowingSegment, User", "get_audio_store", "parselmouth"):
            assert forbidden not in src, f"{name} still references {forbidden}"


@pytest.mark.parametrize("route", [
    "/api/v1/shadowing/media",
    "/transcribe",
    "/transcribe/providers",
    "/api/v1/youtube-extract",
])
def test_moved_routes_are_registered(route):
    import sys
    sys.path.insert(0, str(ROOT))
    from app import app  # noqa: PLC0415

    rules = {r.rule for r in app.url_map.iter_rules()}
    assert route in rules
