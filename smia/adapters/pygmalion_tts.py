"""
adapters/pygmalion_tts.py — the `pygmalion` /tts provider: real human
recordings of ~180 Norwegian words in seven dialect areas, from NTNU's
Pygmalion / LearnNoW pronunciation course, imported once from the committed
corpus (`scripts/import_pygmalion.py`) into `pygmalion_audio` + the audio cache.

Candidate shape reuses what `dictcc_api` already returns — `{sha256, source,
voice}` — and invents no new field: `source` is `"human"` and `voice` carries
the speaker's dialect (`Oslo`, `Bergen`, `Sandnessjøen`, …). One candidate per
recording, never a pick (CLAUDE.md: candidates, not one answer).

Coverage is tiny and mostly minimal-pair words, so a miss is the normal
outcome: `{"candidates": []}`, not an error. Matching runs in tiers, and the
first tier with rows answers — tiers are never mixed (tts-candidate-matching):

  1. exact: the casefolded, trimmed text equals the stored word;
  2. `normalize_match_key(text)` equals the stored `match_key` (articles, `å`,
     ` + ` compounds, case and punctuation are ignored on both sides);
  3. as tier 2, with trailing particles/prepositions/reflexive dropped from
     the query (`stille opp` -> `stille`).

A tier-2/3 candidate carries `context` = the stored word verbatim (`ei avis`,
`Hallo!`) so the caller sees it is not an exact hit; a tier-1 candidate
carries none. No inflection — that is `/inflect`'s job.
"""

from __future__ import annotations

from sqlalchemy import func, select

from db.models import PygmalionAudio
from db.session import session_scope
from norwegian import normalize_match_key, strip_trailing_particles
from registry import registry

# Oslo is the reference variety (~86% of the data) so it leads; this is a
# deterministic display order, not a preference — every recording is returned.
_FIRST_DIALECT = "Oslo"


def pygmalion_audio_count(db) -> int:
    """Live recording count for `/providers` (provider-catalog spec)."""
    return db.execute(select(func.count()).select_from(PygmalionAudio)).scalar()


_COLUMNS = (
    PygmalionAudio.word, PygmalionAudio.text, PygmalionAudio.dialect,
    PygmalionAudio.take, PygmalionAudio.sha256,
)


def _rows(db, column, value):
    return db.execute(select(*_COLUMNS).where(column == value)).all()


class PygmalionTtsAdapter:
    def lookup(self, input_dict: dict) -> dict:
        if input_dict.get("lang", "nb") != "nb":
            return {"candidates": []}
        text = input_dict["text"]

        fuzzy = False
        with session_scope() as db:
            rows = _rows(db, PygmalionAudio.word, text.strip().casefold())
            if not rows:
                key = normalize_match_key(text)
                if key:
                    fuzzy = True
                    rows = _rows(db, PygmalionAudio.match_key, key)
                    stripped = strip_trailing_particles(key)
                    if not rows and stripped != key:
                        rows = _rows(db, PygmalionAudio.match_key, stripped)

        rows.sort(key=lambda r: (r.dialect != _FIRST_DIALECT, r.dialect, r.word, r.take))
        candidates, seen = [], set()
        for row in rows:
            if row.sha256 in seen:
                continue
            seen.add(row.sha256)
            candidate = {"sha256": row.sha256, "source": "human", "voice": row.dialect}
            if fuzzy:
                candidate["context"] = row.text or row.word
            candidates.append(candidate)
        return {"candidates": candidates}


registry.register("tts", "pygmalion", PygmalionTtsAdapter(), count=pygmalion_audio_count)
