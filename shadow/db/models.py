"""
db/models.py — shadow's own ORM models.

Split out of phonexa (zone-isolation task 3.2). These two tables were the
ONLY ones in phonexa's schema that belong to the shadowing domain, and
exactly one foreign key crossed the domain boundary —
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
"""

from __future__ import annotations

import datetime

from sqlalchemy import (
    Boolean,
    ForeignKey,
    Integer,
    SmallInteger,
    Text,
    UniqueConstraint,
    func,
)
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class ShadowingMedia(Base):
    """
    One long-audio file (audiobook/video audio) a user is shadowing — audio
    bytes are NEVER stored server-side (decoding/storing a multi-hour file
    here was tried and reverted: it meant a multi-GB server-side decode on
    upload, again on split, and again on every single chapter-audio
    request, since nothing was cached between requests). Instead, `fingerprint`
    (a client-computed hash of file size + a few sampled byte ranges — see
    js/shadow.js's computeFingerprint, never the whole file) is how a
    re-uploaded file is recognized as "the same one": POST
    /api/v1/shadowing/media/find-or-create looks up (user_id, fingerprint)
    and returns the existing row (with its segments/progress) instead of
    creating a new one. Segmentation itself runs client-side (js/vad.js);
    this table only ever receives the resulting ms boundaries.

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

    # Last-used segmentation sliders — re-shown pre-filled when reopened.
    sentence_silence_ms: Mapped[int | None] = mapped_column(Integer)
    chapter_silence_ms: Mapped[int | None] = mapped_column(Integer)

    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    segments: Mapped[list["ShadowingSegment"]] = relationship(
        back_populates="media", cascade="all, delete-orphan", order_by="ShadowingSegment.order_index"
    )


class ShadowingSegment(Base):
    """
    One chapter or sentence of a ShadowingMedia's segmentation. Chapters and
    sentences share one table (kind='chapter'|'sentence') rather than two,
    with chapters as the (parent_segment_id IS NULL) top level and sentences
    pointing at their containing chapter — real relational rows, not a JSONB
    array, because manual split/merge is per-row CRUD and ordering/
    containment queries benefit from an indexed FK + order_index.
    `done`/`text` are the only durable "progress" — the user's own recorded
    take is deliberately never persisted (stays ephemeral client-side, to
    keep storage bounded for multi-hour books).

    Both of this table's foreign keys stay: they are WITHIN the shadowing
    domain, which is the whole point of the split.
    """
    __tablename__ = "shadowing_segments"

    id: Mapped[int] = mapped_column(primary_key=True)
    media_id: Mapped[int] = mapped_column(ForeignKey("shadowing_media.id", ondelete="CASCADE"), nullable=False)
    kind: Mapped[str] = mapped_column(Text, nullable=False)  # 'chapter'|'sentence'
    parent_segment_id: Mapped[int | None] = mapped_column(ForeignKey("shadowing_segments.id", ondelete="CASCADE"))
    order_index: Mapped[int] = mapped_column(Integer, nullable=False, default=0)
    start_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    end_ms: Mapped[int] = mapped_column(Integer, nullable=False)
    text: Mapped[str | None] = mapped_column(Text)  # transcript
    done: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    created_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime.datetime] = mapped_column(server_default=func.now(), onupdate=func.now())

    media: Mapped["ShadowingMedia"] = relationship(back_populates="segments")
    parent: Mapped["ShadowingSegment | None"] = relationship(remote_side=[id])
