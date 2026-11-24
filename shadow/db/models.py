"""
db/models.py — shadow's own ORM models.

Split out of phonexa (zone-isolation task 3.2). These tables were the ONLY
ones in phonexa's schema that belong to the shadowing domain, and exactly
one foreign key crossed the domain boundary —
`shadowing_media.user_id -> users.id`. That FK is GONE here, per D42 (no
cross-service foreign keys): `users` and `settings` stayed with phonexa,
and `user_id` is a plain integer in this database.

What that costs, named so it is a decision and not a surprise: nothing in
THIS database can validate that a `user_id` exists, and `ON DELETE CASCADE`
no longer removes a profile's media when the profile is deleted in phonexa.
shadowing.py therefore asks phonexa whether the profile exists (see
phonexa_client.verify_user) instead of relying on a local FK, and falls
back to accepting the id when phonexa is unreachable — losing a validation
is the degradation we accept rather than losing the page.
(CORRECTION, 2026-11-24, D168: no longer — shadow is single-user, the
owner id is pinned once by migration in `shadow_owner` below, and phonexa
is never asked about users.)

CORRECTION, 2026-11-15 (shadow-studying-mode). THIS FILE USED TO SAY AUDIO
IS NEVER STORED SERVER-SIDE. That is no longer true, and the stale claim is
corrected here rather than deleted. shadow now stores exactly ONE mono Opus
master per book, transcoded once on upload; see audio.py for why that does
not bring back the failure the original revert was about (a decode PER
REQUEST). Two things did NOT change and are load-bearing:

  * the learner's recordings are still never persisted, anywhere, in any
    form — they live in the browser for the session and nowhere else;
  * the audio volume is deliberately NOT in the backup set. This database
    holds split configs, boundaries, progress, the cursor and transcripts,
    which are the irreplaceable things; masters are re-uploadable.

THE SHAPE OF PROGRESS ALSO CHANGED. `ShadowingSegment.done` is no longer
the source of truth: a book owns a set of completed TIME RANGES
(`ShadowingProgressRange`), and a sentence reads as done when its whole
span is covered. That is what carries progress across split configs — see
progress.py for the rule and design.md §4 for why.
"""

from __future__ import annotations

import datetime

from sqlalchemy import (
    JSON,
    BigInteger,
    Boolean,
    CheckConstraint,
    ForeignKey,
    Index,
    Integer,
    SmallInteger,
    Text,
    UniqueConstraint,
    func,
)
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class ShadowingMedia(Base):
    """
    One book: a long audio file (audiobook/video audio) the operator is
    shadowing, and — since shadow-studying-mode — the one mono Opus master
    stored for it on the server (`audio_path`, relative to
    SHADOW_AUDIO_DIR). Exactly one audio artefact per book; nothing is ever
    stored per sentence.

    `fingerprint` survives, but its JOB CHANGED. It used to be the resume
    mechanism: the browser held the file, computed a cheap hash of it, and
    asked "have you seen this before" so a re-opened file kept its
    segments. Resume is now server-side by construction — the audio is
    here — so the fingerprint is only re-upload DEDUPLICATION: offering the
    same file twice finds the existing book (and, mid-upload, resumes the
    same temp file) instead of making a second copy of a multi-GB book.

    `user_id` is a plain integer, NOT a foreign key: the `users` table lives
    in phonexa's database (D42, see the module docstring).
    """
    __tablename__ = "shadowing_media"
    __table_args__ = (UniqueConstraint("user_id", "fingerprint"),)

    id: Mapped[int] = mapped_column(primary_key=True)
    # phonexa's users.id. No FK — different database, different service.
    user_id: Mapped[int] = mapped_column(Integer, nullable=False, index=True)

    fingerprint: Mapped[str] = mapped_column(Text, nullable=False)
    original_filename: Mapped[str | None] = mapped_column(Text)
    file_size_bytes: Mapped[int | None] = mapped_column()
    duration_ms: Mapped[int | None] = mapped_column(Integer)
    sample_rate_hz: Mapped[int | None] = mapped_column(Integer)
    channels: Mapped[int | None] = mapped_column(SmallInteger)

    # Last-used segmentation sliders. Kept on the book as the DEFAULTS a new
    # split config starts from; the authoritative per-config values live on
    # ShadowingSplitConfig, because a book now holds several configs.
    sentence_silence_ms: Mapped[int | None] = mapped_column(Integer)
    chapter_silence_ms: Mapped[int | None] = mapped_column(Integer)

    # The stored master (shadow-studying-mode). Relative to SHADOW_AUDIO_DIR
    # so the volume can be remounted anywhere; NULL for a pre-change book
    # whose audio only ever existed in the browser — those rows keep their
    # segments and progress and ask for a re-upload.
    audio_path: Mapped[str | None] = mapped_column(Text)
    audio_bytes: Mapped[int | None] = mapped_column(BigInteger)
    # 'absent' | 'transcoding' | 'ready' | 'failed' — what the Library row
    # shows while the one-time transcode runs, and what it shows if it fails.
    audio_state: Mapped[str] = mapped_column(Text, nullable=False, default='absent')
    audio_error: Mapped[str | None] = mapped_column(Text)
    title: Mapped[str | None] = mapped_column(Text)

    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    segments: Mapped[list["ShadowingSegment"]] = relationship(
        back_populates="media", cascade="all, delete-orphan", order_by="ShadowingSegment.order_index"
    )
    configs: Mapped[list["ShadowingSplitConfig"]] = relationship(
        back_populates="media", cascade="all, delete-orphan", order_by="ShadowingSplitConfig.id"
    )
    progress_ranges: Mapped[list["ShadowingProgressRange"]] = relationship(
        back_populates="media", cascade="all, delete-orphan", order_by="ShadowingProgressRange.start_ms"
    )
    cursors: Mapped[list["ShadowingCursor"]] = relationship(
        back_populates="media", cascade="all, delete-orphan"
    )

    @property
    def active_config(self) -> "ShadowingSplitConfig | None":
        for c in self.configs:
            if c.is_active:
                return c
        return self.configs[0] if self.configs else None


class ShadowingSegment(Base):
    """
    One chapter or sentence of ONE SPLIT CONFIG's segmentation. Chapters and
    sentences share one table (kind='chapter'|'sentence') rather than two,
    with chapters as the (parent_segment_id IS NULL) top level and sentences
    pointing at their containing chapter — real relational rows, not a JSONB
    array, because manual split/merge is per-row CRUD and ordering/
    containment queries benefit from an indexed FK + order_index.

    `config_id` is new in shadow-studying-mode: a book holds several named
    configs and these rows belong to one of them, so re-analysing one
    config cannot disturb another's manual edits.

    `text` (a transcript fetched on demand from smia) is durable progress.
    `done` IS NOT, ANY MORE — it is a FROZEN LEGACY COLUMN. Doneness is
    derived from the book's completed time ranges
    (`ShadowingProgressRange`), which is what lets progress survive a
    re-split and carry across configs. The column is kept, not dropped, so
    the pre-migration state stays readable and the lossless conversion
    stays auditable (acceptance criterion 19); nothing reads it and nothing
    writes it.

    The user's own recorded take is still never persisted — ephemeral,
    client-side, by design.
    """
    __tablename__ = "shadowing_segments"

    id: Mapped[int] = mapped_column(primary_key=True)
    media_id: Mapped[int] = mapped_column(ForeignKey("shadowing_media.id", ondelete="CASCADE"), nullable=False)
    config_id: Mapped[int] = mapped_column(
        ForeignKey("shadowing_split_configs.id", ondelete="CASCADE"), nullable=False, index=True
    )
    kind: Mapped[str] = mapped_column(Text, nullable=False)  # 'chapter'|'sentence'
    parent_segment_id: Mapped[int | None] = mapped_column(ForeignKey("shadowing_segments.id", ondelete="CASCADE"))
    order_index: Mapped[int] = mapped_column(Integer, nullable=False, default=0)
    start_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    end_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    # WHERE SPEECH ACTUALLY IS inside [start_ms, end_ms) — a PLAYBACK AND
    # DISPLAY attribute and nothing else (shadow-studying-refinements §2).
    # Nullable: NULL means "not computed", which every reader renders as the
    # full span, so a pre-change row and a failed detection both degrade to
    # no trimming. Recomputed by every analysis and by split/merge.
    #
    # These two columns MUST NEVER be copied into start_ms/end_ms. Doneness,
    # the coverage rule, merge, split and cross-config carry-over all read the
    # full span; narrowing the stored span would leave the silence between two
    # sentences belonging to no sentence, unmarkable forever. That is a tier-3
    # tripwire in design.md, not a refactor.
    speech_start_ms: Mapped[int | None] = mapped_column(Integer)
    speech_end_ms: Mapped[int | None] = mapped_column(Integer)
    text: Mapped[str | None] = mapped_column(Text)  # transcript
    # A chapter's optional title (shadow-playback-chapter-reading D15).
    # Chapters only; always NULL on a sentence. The chapter NUMBER stays
    # automatic (its order_index) — this is the words after it.
    title: Mapped[str | None] = mapped_column(Text)
    # Frozen legacy column — see the class docstring. Not read, not written.
    done: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    media: Mapped["ShadowingMedia"] = relationship(back_populates="segments")
    config: Mapped["ShadowingSplitConfig"] = relationship(back_populates="segments")
    parent: Mapped["ShadowingSegment | None"] = relationship(remote_side=[id])


class ShadowingSplitConfig(Base):
    """
    One named segmentation of a book: its two silence thresholds, its
    boundary rows and its manual edits. A book may hold several; exactly one
    is active, and Study and Explore always operate on the active one.

    Why several (design.md §5): the previous model replaced the single
    segmentation destructively, so trying a different silence threshold cost
    the operator both the old boundaries AND the progress attached to them.
    Progress no longer lives in a config at all — it lives on the book as
    time ranges — so no config operation can discard it, and experimenting
    with thresholds is finally free.

    `is_active` is a plain boolean rather than a pointer on the book because
    activation is a config-scoped operation; the service enforces "exactly
    one" on write.
    """
    __tablename__ = "shadowing_split_configs"

    id: Mapped[int] = mapped_column(primary_key=True)
    media_id: Mapped[int] = mapped_column(
        ForeignKey("shadowing_media.id", ondelete="CASCADE"), nullable=False, index=True
    )
    name: Mapped[str] = mapped_column(Text, nullable=False)
    sentence_silence_ms: Mapped[int] = mapped_column(Integer, nullable=False, default=400)
    chapter_silence_ms: Mapped[int] = mapped_column(Integer, nullable=False, default=2000)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    # 'idle' | 'running' | 'failed' — the Library/Prepare "analysing…" state.
    analysis_state: Mapped[str] = mapped_column(Text, nullable=False, default='idle')
    analysis_error: Mapped[str | None] = mapped_column(Text)
    # Hand edits since the last analysis: sentence split/merge and chapter
    # break/merge/title. What Prepare's "✎ N manual edits" shows and what a
    # re-analysis discards (it resets this to 0 with the rows it rebuilds).
    manual_edit_count: Mapped[int] = mapped_column(Integer, nullable=False, default=0,
                                                   server_default='0')
    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    media: Mapped["ShadowingMedia"] = relationship(back_populates="configs")
    segments: Mapped[list["ShadowingSegment"]] = relationship(
        back_populates="config", cascade="all, delete-orphan", order_by="ShadowingSegment.order_index"
    )


class ShadowingProgressRange(Base):
    """
    One completed time range on a book, for one user. THE source of truth
    for doneness (design.md §4).

    A sentence — in ANY split config — reads as done when its entire span is
    covered by these rows. That single rule gives, for free and all
    intended: progress carried across configs, a conjunctive merge (the
    merged span is only covered if both halves were), a preserving split,
    and bulk marking from Explore that is immediately visible everywhere.

    The set is normalised on every write (progress.py): sorted,
    non-overlapping, and non-adjacent, so marking 500 consecutive sentences
    done stores ONE row rather than 500 and the table cannot grow without
    bound.

    Per (media, user) because a book belongs to a profile but the ranges are
    progress, and progress is a person's.
    """
    __tablename__ = "shadowing_progress_ranges"
    __table_args__ = (Index("ix_shadowing_progress_media_user", "media_id", "user_id"),)

    id: Mapped[int] = mapped_column(primary_key=True)
    media_id: Mapped[int] = mapped_column(
        ForeignKey("shadowing_media.id", ondelete="CASCADE"), nullable=False
    )
    user_id: Mapped[int] = mapped_column(Integer, nullable=False)
    start_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    end_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())

    media: Mapped["ShadowingMedia"] = relationship(back_populates="progress_ranges")


class ShadowingCursor(Base):
    """
    Where the operator stopped, as a TIME POSITION on the book — not a
    segment id.

    A segment id would not survive a re-split (the row is gone) and would
    not be meaningful in another config. A position is resolved, on open, to
    whichever sentence contains it in whatever config is active, so "carry
    on where I left off" survives both. It lives on the server, per user, so
    the desktop and the phone share one place in the book — which is the
    reason this whole change exists.
    """
    __tablename__ = "shadowing_cursors"
    __table_args__ = (UniqueConstraint("media_id", "user_id"),)

    id: Mapped[int] = mapped_column(primary_key=True)
    media_id: Mapped[int] = mapped_column(
        ForeignKey("shadowing_media.id", ondelete="CASCADE"), nullable=False
    )
    user_id: Mapped[int] = mapped_column(Integer, nullable=False)
    position_ms: Mapped[int] = mapped_column(Integer, nullable=False, default=0)
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    media: Mapped["ShadowingMedia"] = relationship(back_populates="cursors")


class ShadowingUpload(Base):
    """
    A resumable upload in flight: the temp file on disk, how many bytes have
    landed, and what it is for.

    It is a row and not just a file because the client must be able to ask
    "how much of this do you already have" after its tab died, and because
    an abandoned upload needs a record to sweep (audio.sweep_abandoned_uploads
    deletes the .part; this row goes with it). A single 1 GB POST was
    rejected in design: it gives no honest progress and no recovery.
    """
    __tablename__ = "shadowing_uploads"

    id: Mapped[str] = mapped_column(Text, primary_key=True)  # server-minted uuid4 hex
    user_id: Mapped[int] = mapped_column(Integer, nullable=False, index=True)
    fingerprint: Mapped[str] = mapped_column(Text, nullable=False, index=True)
    original_filename: Mapped[str | None] = mapped_column(Text)
    size_bytes: Mapped[int] = mapped_column(BigInteger, nullable=False)
    received_bytes: Mapped[int] = mapped_column(BigInteger, nullable=False, default=0)
    # 'receiving' | 'transcoding' | 'done' | 'failed'
    state: Mapped[str] = mapped_column(Text, nullable=False, default='receiving')
    error: Mapped[str | None] = mapped_column(Text)
    media_id: Mapped[int | None] = mapped_column(Integer)
    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())


class ShadowOwner(Base):
    """The ONE owner id (D168), pinned once by migration e5b9c2d47a10 from
    the data's single distinct `user_id`. Exactly one row (id = 1). Every
    request uses this id server-side; a client-sent `userId` is ignored.
    Nothing writes this table after the migration."""
    __tablename__ = "shadow_owner"
    __table_args__ = (CheckConstraint("id = 1", name="shadow_owner_single_row"),)

    id: Mapped[int] = mapped_column(SmallInteger, primary_key=True)
    user_id: Mapped[int] = mapped_column(Integer, nullable=False)
    pinned_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())


class ShadowSetting(Base):
    """One preference of the owner, key -> JSON value (D168, D165).

    In shadow's own database so `shadow.sql` dumps it. A key with no row
    means "not stored yet": the default applies and the one-time import from
    phonexa may still fill it (appsettings.py). Once a row exists phonexa is
    never consulted for that key again. The theme is NOT here — it is per
    device."""
    __tablename__ = "shadow_settings"

    key: Mapped[str] = mapped_column(Text, primary_key=True)
    value: Mapped[dict] = mapped_column(JSON().with_variant(JSONB(), "postgresql"), nullable=False)
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())
