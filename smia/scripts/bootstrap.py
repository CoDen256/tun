"""
scripts/bootstrap.py — smia's container entrypoint (`CMD` in `Dockerfile`),
and now one of three identical spellings of the same mechanism
(libs/pyservice/bootstrap.py).

It used to be: `alembic upgrade head`, then import each provider's data whose
table is still empty, THEN exec the Flask app — so with Postgres unreachable
the container died before binding 5055 and `/smia` answered 502, and on a
genuinely empty database nothing listened for as long as ~9M rows took to
import.

Now: bind the port first, migrate in the background behind a readiness flag,
and import providers AFTER readiness rather than ahead of it. The split is
deliberate and is the one place this file differs from stabbur's and
phonexa's: "ready" means the schema is current, which is true the moment
alembic finishes. An import is seeding, not schema — gating readiness on it
would report smia as degraded for an hour of perfectly correct serving, and a
failing import would be retried every five seconds forever.

Still imported only if the target table is empty, so a restart against a
populated database re-imports nothing. Missing source files (e.g. `providers/`
not bind-mounted) are warned about, not fatal — the service serves with those
providers simply returning no candidates, same as any other "unknown word"
response.
"""

from __future__ import annotations

import glob
import os
import sys

from sqlalchemy import text
from sqlalchemy.exc import OperationalError

from pyservice.bootstrap import create_bootstrap, register_db_guard, register_health
from pyservice.migrate import upgrade_head

from app import app  # Flask app + its auth hook, registered before the guard below

from db.session import get_engine
from scripts import (
    import_dictcc_static,
    import_ipadict,
    import_kaikki,
    import_leipzig,
    import_nst,
    import_ordbank,
    import_pygmalion,
    import_tatoeba,
    import_wikipron,
)

# dict.cc's dump filenames are download tokens, not stable names (e.g.
# "cnsfdgcgdd-8413511861-79ieio.txt") — identify NO-EN/NO-DE/DE-EN by each
# file's own header line instead of assuming a filename.
_DICTCC_PAIR_HEADERS = {
    "# NO-EN vocabulary database": "no_en",
    "# NO-DE vocabulary database": "no_de",
    "# DE-EN vocabulary database": "de_en",
}


def _find_dictcc_static_args() -> list[str]:
    args = []
    for path in sorted(glob.glob("providers/dict/*.txt")):
        with open(path, encoding="utf-8") as f:
            first_line = f.readline().strip()
        # The real dump's first line is itself two tab-separated columns
        # ("# NO-EN vocabulary database\tcompiled by dict.cc"), not the bare
        # key alone — an exact-equality match against the whole line never
        # matched any real file (confirmed: only ever silently masked by an
        # already-populated table skipping this check entirely on every
        # prior run; a genuinely empty database hits this for real).
        header = first_line.split("\t", 1)[0]
        pair = _DICTCC_PAIR_HEADERS.get(header)
        if pair:
            args += [path, pair]
    if not args:
        raise FileNotFoundError("no providers/dict/*.txt files with a recognized NO-EN/NO-DE/DE-EN header")
    return args


def _corpus_partition_empty(corpora: list[str]):
    """Returns an `is_empty` check scoped to a `corpus_sentence` partition
    — `tatoeba`/`leipzig` share one table (design D4), so a plain
    table-wide emptiness check would make importing one skip the other."""
    def _check() -> bool:
        engine = get_engine()
        with engine.connect() as conn:
            return (
                conn.execute(
                    text("SELECT COUNT(*) FROM corpus_sentence WHERE corpus = ANY(:corpora)"),
                    {"corpora": corpora},
                ).scalar()
                == 0
            )
    return _check


_IMPORTS = [
    ("ordbank_fullform", import_ordbank.run, ["providers/nbno/20220201_norsk_ordbank_nob_2005.tar.gz"]),
    ("kaikki_entry", import_kaikki.run, ["providers/kaikii/nb.jsonl"]),
    (
        "nst_lexicon",
        import_nst.run,
        ["providers/nbno/nb_uttale_tillegg.zip", "providers/nbno/nb_uttale_leksika.zip"],
    ),
    ("ipa_dict_entry", import_ipadict.run, ["providers/open-dict/nb.txt"]),
    ("wikipron_entry", import_wikipron.run, ["providers/wikipron/nob_latn_broad.tsv"]),
    ("pygmalion_audio", import_pygmalion.run, ["providers/pygmalion/audio/manifest.jsonl"]),
    ("dictcc_static_entry", import_dictcc_static.run, _find_dictcc_static_args),
    (
        _corpus_partition_empty(["tatoeba"]),
        import_tatoeba.run,
        ["providers/tatoeba/nob_sentences.tsv.bz2"],
    ),
    (
        _corpus_partition_empty(["web_2020", "news_2013", "wikipedia_2014"]),
        import_leipzig.run,
        [
            "providers/leipzig/nob-no_web_2020_1M.tar.gz",
            "providers/leipzig/nob_news_2013_1M.tar.gz",
            "providers/leipzig/nob_wikipedia_2014_1M.tar.gz",
        ],
    ),
]


def _table_is_empty(table: str) -> bool:
    engine = get_engine()
    with engine.connect() as conn:
        return conn.execute(text(f"SELECT COUNT(*) FROM {table}")).scalar() == 0


def _import_providers() -> None:
    """Runs once, after the schema is ready, on the bootstrap thread.

    Every failure is caught here rather than allowed to propagate: an
    exception escaping this function would be caught by the bootstrap loop,
    which would mark smia NOT ready and retry — re-running alembic and every
    import on a five-second interval. One broken provider dump must cost that
    provider's candidates, nothing else.
    """
    for table, run, args in _IMPORTS:
        label = table.__name__ if callable(table) else table
        try:
            is_empty = table() if callable(table) else _table_is_empty(table)
            if not is_empty:
                print(f"[bootstrap] {label} already populated, skipping import", file=sys.stderr)
                continue
            resolved_args = args() if callable(args) else args
            run(*resolved_args)
        except FileNotFoundError as exc:
            print(f"[bootstrap] skipping {run.__module__}: {exc}", file=sys.stderr)
        except Exception as exc:  # noqa: BLE001 — see the docstring
            print(f"[bootstrap] import {label} FAILED, continuing: {exc}", file=sys.stderr)


def main() -> None:
    # smia owns the `smia` database's migrations outright — nothing else
    # writes that schema.
    boot = create_bootstrap(
        name="smia-backend",
        prepare=upgrade_head,
        on_ready=_import_providers,
    )
    boot.start()

    register_health(app, boot)

    # Guard everything except the UI shell. smia is a lookup service: every
    # route other than /ui reads the cache tables or the provider tables, so
    # the default is the guard and the exemption is the short list. /ui itself
    # is read off disk (and is already auth-exempt for the same reason), so
    # the console still renders and shows the degraded state rather than
    # disappearing behind a 502.
    register_db_guard(
        app,
        boot,
        exempt=("/ui",),
        db_errors=(OperationalError,),
    )

    # use_reloader=False even in debug: the reloader forks a second process,
    # and two bootstrap threads would race one migration table.
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5055, debug=debug, use_reloader=False)


if __name__ == "__main__":
    main()
