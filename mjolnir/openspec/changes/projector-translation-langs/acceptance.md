# Acceptance — projector-translation-langs

- **M01** In the builder's **card preview**, open a word note that carries
  **two English translations**. The **E face shows one line**, the two values
  joined by " / " — not two lines.
- **M02** In the same preview, a note with one English and one German
  translation shows **two lines**, one per language.
- **M03** A note with two English and two German translations shows **two
  lines**: "en1 / en2" and "de1 / de2".
- **M04** A note that has at most one translation per language renders
  exactly as it did before this change (compare against the card as minted
  today).
- **M05** A **forecast** runs and reports no unexpected deck deltas; only the
  E face of multi-value notes differs.
