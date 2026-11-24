"""
Chapter editing in Prepare, server half (shadow-playback-chapter-reading
D15, task 9.1; acceptance A9.1, A9.2, A9.6).

Start a new chapter at a sentence, merge a chapter with the next one, set a
title. The properties that matter, as tests:

  * NO sentence span and NO progress range changes, ever;
  * chapters renumber densely and sentences re-parent in time order;
  * Undo — the inverse operation — restores the chapters exactly;
  * each edit counts on ITS config's manualEditCount and on no other
    config; an undo takes the count back down; re-analysis resets it;
  * titles appear in the book payload and the chapter manifest.

SQLite in-process, no cluster:  cd shadow && python -m pytest
"""

import pathlib
import sys

import pytest
import sqlalchemy as sa

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

pytest.importorskip('flask')

OWNER = 7


@pytest.fixture()
def env(monkeypatch, tmp_path):
    from flask import Flask
    from sqlalchemy.orm import Session, sessionmaker
    from sqlalchemy.pool import StaticPool

    import appsettings
    import audio
    import shadowing
    from db.models import (Base, ShadowingMedia, ShadowingProgressRange, ShadowingSegment,
                           ShadowingSplitConfig, ShadowOwner)

    engine = sa.create_engine('sqlite://', connect_args={'check_same_thread': False},
                              poolclass=StaticPool)
    Base.metadata.create_all(engine)
    maker = sessionmaker(bind=engine, expire_on_commit=False, class_=Session)
    for module in (appsettings, shadowing):
        monkeypatch.setattr(module, 'get_sessionmaker', lambda: maker)
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    prechunks = []
    monkeypatch.setattr(shadowing, '_start_prechunk',
                        lambda config_id, **kw: prechunks.append((config_id, kw)))
    appsettings._reset_owner_cache()

    # One book, two configs. Config A: 3 chapters of 4/6/3 sentences, each
    # sentence 1 s, tiling the book. Config B: one chapter, the same audio.
    with maker() as db:
        db.add(ShadowOwner(id=1, user_id=OWNER))
        media = ShadowingMedia(user_id=OWNER, fingerprint='b:1', original_filename='bok',
                               duration_ms=13_000, audio_state='ready')
        db.add(media)
        db.flush()
        a = ShadowingSplitConfig(media_id=media.id, name='A', is_active=True,
                                 sentence_silence_ms=400, chapter_silence_ms=2500)
        b = ShadowingSplitConfig(media_id=media.id, name='B', is_active=False,
                                 sentence_silence_ms=400, chapter_silence_ms=2500)
        db.add_all([a, b])
        db.flush()
        t = 0
        for ci, n in enumerate((4, 6, 3)):
            ch = ShadowingSegment(media_id=media.id, config_id=a.id, kind='chapter',
                                  order_index=ci, start_ms=t, end_ms=t + n * 1000)
            db.add(ch)
            db.flush()
            for si in range(n):
                db.add(ShadowingSegment(
                    media_id=media.id, config_id=a.id, kind='sentence', parent_segment_id=ch.id,
                    order_index=si, start_ms=t + si * 1000, end_ms=t + (si + 1) * 1000,
                    speech_start_ms=t + si * 1000 + 100, speech_end_ms=t + (si + 1) * 1000 - 100))
            t += n * 1000
        chb = ShadowingSegment(media_id=media.id, config_id=b.id, kind='chapter',
                               order_index=0, start_ms=0, end_ms=13_000)
        db.add(chb)
        db.flush()
        for si in range(13):
            db.add(ShadowingSegment(media_id=media.id, config_id=b.id, kind='sentence',
                                    parent_segment_id=chb.id, order_index=si,
                                    start_ms=si * 1000, end_ms=(si + 1) * 1000))
        db.add(ShadowingProgressRange(media_id=media.id, user_id=OWNER, start_ms=0, end_ms=6000))
        db.commit()
        ids = {'media': media.id, 'a': a.id, 'b': b.id}

    app = Flask(__name__)
    app.register_blueprint(shadowing.shadowing_bp)
    app.register_blueprint(appsettings.settings_bp)

    class Env:
        pass
    e = Env()
    e.client, e.maker, e.ids, e.prechunks = app.test_client(), maker, ids, prechunks
    yield e
    appsettings._reset_owner_cache()


def chapters(env, config='a'):
    """[(order_index, title, [sentence (start,end), ...]), ...]"""
    from db.models import ShadowingSegment
    with env.maker() as db:
        chs = (db.query(ShadowingSegment).filter_by(config_id=env.ids[config], kind='chapter')
               .order_by(ShadowingSegment.order_index).all())
        out = []
        for ch in chs:
            sents = (db.query(ShadowingSegment).filter_by(parent_segment_id=ch.id)
                     .order_by(ShadowingSegment.order_index).all())
            assert [s.order_index for s in sents] == list(range(len(sents)))
            assert all(ch.start_ms <= s.start_ms and s.end_ms <= ch.end_ms for s in sents)
            if sents:
                assert ch.start_ms == sents[0].start_ms and ch.end_ms == sents[-1].end_ms
            out.append((ch.order_index, ch.title, [(s.start_ms, s.end_ms) for s in sents]))
        return out


def spans_and_progress(env):
    from db.models import ShadowingProgressRange, ShadowingSegment
    with env.maker() as db:
        spans = sorted((s.id, s.config_id, s.start_ms, s.end_ms, s.speech_start_ms, s.speech_end_ms)
                       for s in db.query(ShadowingSegment).filter_by(kind='sentence').all())
        ranges = sorted((r.start_ms, r.end_ms, r.user_id)
                        for r in db.query(ShadowingProgressRange).all())
    return spans, ranges


def chapter_id(env, index, config='a'):
    from db.models import ShadowingSegment
    with env.maker() as db:
        return (db.query(ShadowingSegment)
                .filter_by(config_id=env.ids[config], kind='chapter', order_index=index).one().id)


def sentence_id(env, chapter_index, sentence_index):
    from db.models import ShadowingSegment
    with env.maker() as db:
        return (db.query(ShadowingSegment)
                .filter_by(parent_segment_id=chapter_id(env, chapter_index), order_index=sentence_index)
                .one().id)


def edits(env, config='a'):
    for c in env.client.get(f'/api/v1/shadowing/media/{env.ids["media"]}/configs').get_json():
        if c['id'] == env.ids[config]:
            return c['manualEditCount']


def done_count(env):
    return env.client.get(f'/api/v1/shadowing/media/{env.ids["media"]}').get_json()['doneCount']


# ── start a new chapter at a sentence (A9.1, A9.2) ─────────────────────

def test_break_starts_a_chapter_at_the_sentence_and_renumbers(env):
    before_spans = spans_and_progress(env)
    before_done = done_count(env)
    # chapter 2 (index 1), sentence 5 (index 4)
    r = env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 1)}/break',
                        json={'sentenceId': sentence_id(env, 1, 4)})
    assert r.status_code == 200, r.get_json()
    body = r.get_json()
    after = chapters(env)
    assert len(after) == 4
    assert [len(c[2]) for c in after] == [4, 4, 2, 3]
    assert after[2][2][0] == (8000, 9000)          # former sentence 5 starts chapter 3
    assert body['second']['startMs'] == 8000 and body['first']['endMs'] == 8000
    assert body['config']['chapterCount'] == 4
    assert spans_and_progress(env) == before_spans  # no span, no range
    assert done_count(env) == before_done


def test_undo_of_a_break_restores_the_chapters_exactly(env):
    before = chapters(env)
    first = chapter_id(env, 1)
    env.client.post(f'/api/v1/shadowing/chapters/{first}/break',
                    json={'sentenceId': sentence_id(env, 1, 4)})
    assert edits(env) == 1
    r = env.client.post(f'/api/v1/shadowing/chapters/{first}/merge-next', json={'undo': True})
    assert r.status_code == 200
    assert chapters(env) == before
    assert edits(env) == 0


def test_a_chapter_cannot_start_at_its_own_first_sentence(env):
    r = env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 1)}/break',
                        json={'sentenceId': sentence_id(env, 1, 0)})
    assert r.status_code == 400


def test_break_refuses_a_sentence_of_another_chapter(env):
    r = env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 0)}/break',
                        json={'sentenceId': sentence_id(env, 1, 3)})
    assert r.status_code == 400


def test_a_break_drops_only_its_own_chunk_and_warms_the_config(env, tmp_path):
    import audio
    ch = chapter_id(env, 1)
    other = chapter_id(env, 2)
    d = audio.chunks_dir(env.ids['media'])
    d.mkdir(parents=True, exist_ok=True)
    mine = d / f'ch-v2-{ch}-4000-10000.opus'
    theirs = d / f'ch-v2-{other}-10000-13000.opus'
    mine.write_bytes(b'x')
    theirs.write_bytes(b'x')
    env.client.post(f'/api/v1/shadowing/chapters/{ch}/break', json={'sentenceId': sentence_id(env, 1, 2)})
    assert not mine.exists() and theirs.exists()
    assert env.prechunks[-1] == (env.ids['a'], {'supersede': True})
    # The shortened chapter now addresses a different chunk key.
    assert audio.chunk_path(env.ids['media'], ch, 4000, 6000) != mine


# ── merge with the next chapter (A9.4) ─────────────────────────────────

def test_merge_with_next_joins_and_renumbers(env):
    before_spans = spans_and_progress(env)
    r = env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 0)}/merge-next', json={})
    assert r.status_code == 200
    after = chapters(env)
    assert [len(c[2]) for c in after] == [10, 3]
    assert [c[0] for c in after] == [0, 1]
    assert spans_and_progress(env) == before_spans
    assert edits(env) == 1


def test_the_last_chapter_has_no_next(env):
    r = env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 2)}/merge-next', json={})
    assert r.status_code == 400


def test_merge_title_rules_and_undo_restores_both_titles(env):
    first, second = chapter_id(env, 0), chapter_id(env, 1)
    env.client.patch(f'/api/v1/shadowing/chapters/{second}', json={'title': 'Andre del'})
    before = chapters(env)
    r = env.client.post(f'/api/v1/shadowing/chapters/{first}/merge-next', json={}).get_json()
    assert r['merged']['title'] == 'Andre del'      # first had none → second's wins
    assert r['firstTitle'] is None and r['secondTitle'] == 'Andre del'
    undo = env.client.post(f'/api/v1/shadowing/chapters/{first}/break', json={
        'sentenceId': r['boundarySentenceId'], 'firstTitle': r['firstTitle'],
        'title': r['secondTitle'], 'undo': True})
    assert undo.status_code == 200
    assert chapters(env) == before
    assert edits(env) == 1   # the title only; merge + its undo cancel


def test_the_first_chapters_title_wins_on_merge(env):
    first, second = chapter_id(env, 0), chapter_id(env, 1)
    env.client.patch(f'/api/v1/shadowing/chapters/{first}', json={'title': 'Første'})
    env.client.patch(f'/api/v1/shadowing/chapters/{second}', json={'title': 'Andre'})
    r = env.client.post(f'/api/v1/shadowing/chapters/{first}/merge-next', json={}).get_json()
    assert r['merged']['title'] == 'Første'


def test_sentences_across_a_chapter_boundary_say_merge_the_chapters_first(env):
    r = env.client.post('/api/v1/shadowing/segments/merge', json={
        'segmentIdA': sentence_id(env, 0, 3), 'segmentIdB': sentence_id(env, 1, 0)})
    assert r.status_code == 400
    assert 'merge the chapters first' in r.get_json()['error']


# ── titles (A9.8) ──────────────────────────────────────────────────────

def test_title_set_clear_and_shown_in_book_and_manifest(env):
    ch = chapter_id(env, 2)
    r = env.client.patch(f'/api/v1/shadowing/chapters/{ch}', json={'title': '  Første del '})
    assert r.status_code == 200 and r.get_json()['chapter']['title'] == 'Første del'
    assert r.get_json()['previousTitle'] is None
    book = env.client.get(f'/api/v1/shadowing/media/{env.ids["media"]}').get_json()
    assert next(s for s in book['segments'] if s['id'] == ch)['title'] == 'Første del'
    assert all(s['title'] is None for s in book['segments'] if s['kind'] == 'sentence')
    assert env.client.get(f'/api/v1/shadowing/chapters/{ch}/manifest').get_json()['title'] == 'Første del'
    # the title moves with its chapter across a break before it
    env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 1)}/break',
                    json={'sentenceId': sentence_id(env, 1, 2)})
    assert chapters(env)[3][1] == 'Første del'
    r = env.client.patch(f'/api/v1/shadowing/chapters/{ch}', json={'title': '   '})
    assert r.get_json()['chapter']['title'] is None
    assert edits(env) == 3


def test_setting_the_same_title_is_not_an_edit(env):
    ch = chapter_id(env, 0)
    env.client.patch(f'/api/v1/shadowing/chapters/{ch}', json={'title': 'X'})
    env.client.patch(f'/api/v1/shadowing/chapters/{ch}', json={'title': 'X'})
    assert edits(env) == 1


def test_a_title_is_refused_on_a_sentence(env):
    r = env.client.patch(f'/api/v1/shadowing/chapters/{sentence_id(env, 0, 0)}', json={'title': 'x'})
    assert r.status_code == 404


# ── scope: the active config only (A9.6) ───────────────────────────────

def test_edits_belong_to_one_config(env):
    before_b = chapters(env, 'b')
    env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 1)}/break',
                    json={'sentenceId': sentence_id(env, 1, 4)})
    env.client.post(f'/api/v1/shadowing/chapters/{chapter_id(env, 0)}/merge-next', json={})
    assert chapters(env, 'b') == before_b
    assert edits(env, 'a') == 2 and edits(env, 'b') == 0


def test_sentence_split_and_merge_count_as_manual_edits():
    """Structure, not behaviour: split needs ffmpeg for the window, so this
    asserts the counting call is in both handlers."""
    import ast
    tree = ast.parse((ROOT / 'shadowing.py').read_text())
    for name in ('split_shadowing_segment', 'merge_shadowing_segments',
                 'break_chapter', 'merge_chapter_with_next', 'patch_chapter'):
        fn = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == name)
        assert '_count_edit' in ast.unparse(fn), name


def test_reanalysis_resets_the_edit_count_and_discards_titles():
    import ast
    tree = ast.parse((ROOT / 'shadowing.py').read_text())
    fn = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == '_analysis_job')
    src = ast.unparse(fn)
    assert 'manual_edit_count = 0' in src
    # every row of the config is deleted and rebuilt, titles included
    assert "filter_by(config_id=config_id).delete()" in src


def test_a_duplicate_carries_titles_and_the_count(env):
    ch = chapter_id(env, 0)
    env.client.patch(f'/api/v1/shadowing/chapters/{ch}', json={'title': 'T'})
    r = env.client.post(f'/api/v1/shadowing/configs/{env.ids["a"]}/duplicate', json={})
    assert r.status_code == 201 and r.get_json()['manualEditCount'] == 1
    got = env.client.get(f'/api/v1/shadowing/configs/{r.get_json()["id"]}').get_json()
    assert [s['title'] for s in got['segments'] if s['kind'] == 'chapter'][0] == 'T'
