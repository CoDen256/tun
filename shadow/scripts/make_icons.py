"""
scripts/make_icons.py — draws shadow's PWA icons (shadow-playback-chapter-
reading task 5.1). Pure standard library, so it runs anywhere:

    cd shadow && python3 scripts/make_icons.py

Writes icons/icon-192.png, icons/icon-512.png and icons/icon-maskable-512.png.
The PNGs are committed; this script is how they were made and how to remake
them, not a build step.

The artwork: the nav's brand mark (a small rounded square in the accent
colour, css/studio.css `.nav-brand .mark`) on an accent field, drawn twice —
a solid square and a fainter one offset behind it, i.e. a voice and its
shadow. Full-bleed background, so the same drawing is safe as a maskable
icon; the maskable variant only shrinks the motif into the 80 % safe zone.
"""

from __future__ import annotations

import pathlib
import struct
import zlib

ACCENT = (0x0D, 0x7F, 0x72)   # --accent in css/studio.css
INK = (0xFF, 0xFF, 0xFF)      # --accent-ink

OUT = pathlib.Path(__file__).resolve().parent.parent / 'icons'


def _rounded_square_cover(x: float, y: float, x0: float, y0: float, size: float,
                          radius: float) -> float:
    """Coverage (0..1) of pixel centre (x, y) by a rounded square, with a
    one-pixel soft edge for anti-aliasing."""
    cx = min(max(x, x0 + radius), x0 + size - radius)
    cy = min(max(y, y0 + radius), y0 + size - radius)
    d = ((x - cx) ** 2 + (y - cy) ** 2) ** 0.5 - radius
    return max(0.0, min(1.0, 0.5 - d))


def draw(size: int, motif: float) -> bytes:
    """RGBA rows. `motif` is the front square's side as a fraction of size."""
    side = size * motif
    radius = side * 0.24
    offset = side * 0.22
    # the pair (front + shadow) is centred as a whole
    x_front = (size - side - offset) / 2
    y_front = x_front
    x_back, y_back = x_front + offset, y_front + offset
    rows = []
    for py in range(size):
        row = bytearray([0])  # filter: none
        for px in range(size):
            x, y = px + 0.5, py + 0.5
            back = _rounded_square_cover(x, y, x_back, y_back, side, radius) * 0.38
            front = _rounded_square_cover(x, y, x_front, y_front, side, radius)
            a = front + back * (1 - front)
            rgb = [round(c * (1 - a) + i * a) for c, i in zip(ACCENT, INK)]
            row += bytes(rgb + [255])
        rows.append(bytes(row))
    return b''.join(rows)


def png(size: int, raw: bytes) -> bytes:
    def chunk(tag: bytes, data: bytes) -> bytes:
        return (struct.pack('>I', len(data)) + tag + data
                + struct.pack('>I', zlib.crc32(tag + data) & 0xFFFFFFFF))
    header = struct.pack('>IIBBBBB', size, size, 8, 6, 0, 0, 0)  # 8-bit RGBA
    return (b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', header)
            + chunk(b'IDAT', zlib.compress(raw, 9)) + chunk(b'IEND', b''))


def main() -> None:
    OUT.mkdir(exist_ok=True)
    for name, size, motif in (('icon-192.png', 192, 0.46),
                              ('icon-512.png', 512, 0.46),
                              ('icon-maskable-512.png', 512, 0.36)):
        (OUT / name).write_bytes(png(size, draw(size, motif)))
        print('wrote', OUT / name)


if __name__ == '__main__':
    main()
