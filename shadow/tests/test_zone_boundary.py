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


def test_shadow_mounts_no_data_volume():
    """Shadow stores no audio — it must mount no DATA volume (task 3.4).

    The first version asserted `"    volumes:" not in compose`, which could
    never pass: shadow legitimately mounts `../libs:/libs:ro` so one relative
    import resolves in both the repo and the container. A test that forbids
    the string rather than the thing fails on a correct implementation, which
    is worse than no test — it trains you to ignore a red suite.

    What actually matters: no NAMED volume (a data store) and no bind mount
    of phonexa's audio tree. A read-only bind of shared source is neither.
    """
    compose = (ROOT / "compose.yaml").read_text()
    assert "\nvolumes:" not in compose, "a top-level volumes: block means shadow declares a data store"
    for forbidden in ("phonexa_audio", "audio-data", "/data/audio"):
        assert forbidden not in compose, f"shadow must not mount {forbidden}"
    # Every mount it does declare must be read-only shared source.
    mounts = [l.strip() for l in compose.splitlines() if l.strip().startswith("- ") and ":" in l and "/" in l]
    for m in mounts:
        if m.startswith("- \"") or m.startswith("- '"):
            continue  # a published port, not a mount
        assert m.endswith(":ro"), f"shadow mount is not read-only: {m}"


def test_shadow_does_not_import_phonexa_models():
    """The only link to phonexa is HTTP, in one file.

    Checks IMPORT STATEMENTS, parsed, rather than substrings anywhere in the
    file. The first version grepped for "parselmouth" and failed on a prose
    comment explaining that shadow deliberately does NOT need it — a test
    that cannot tell code from a comment about code.
    """
    import ast

    for name in ("app.py", "shadowing.py"):
        path = ROOT / name
        if not path.exists():
            continue
        tree = ast.parse(path.read_text())
        imported = set()
        for node in ast.walk(tree):
            if isinstance(node, ast.Import):
                imported.update(a.name.split(".")[0] for a in node.names)
            elif isinstance(node, ast.ImportFrom):
                if node.module:
                    imported.add(node.module.split(".")[0])
                imported.update(a.name for a in node.names)
        for forbidden in ("parselmouth", "formanter", "get_audio_store", "ShadowingMedia_phonexa"):
            assert forbidden not in imported, f"{name} imports {forbidden} from phonexa's domain"


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
