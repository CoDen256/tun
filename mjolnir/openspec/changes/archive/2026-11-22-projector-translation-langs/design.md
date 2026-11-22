# Design — projector-translation-langs

## D1 — Group by language, join within one

`translationsHtml(note)` today is:

```js
const lines = note.translations.map((t) => `${t.text}`);
return `<div class="center">${lines.join("<br>")}</div>`;
```

It becomes: walk `note.translations` once, keyed by `t.lang`, keeping the
order in which each language is **first seen**; within a language keep the
values in stored order. Each language yields one line, its values joined by
` / `. The lines are joined by `<br>` inside the same `<div class="center">`
wrapper.

Properties this keeps:
- **Pure and stateless** (builder-pipeline's existing requirement): same
  input, same output; nothing is read or written.
- **Byte-identical for today's data.** With one value per language, each
  group has one value, the join is a no-op, and the language order is the
  stored order — exactly the current output.
- A translation with no language (`lang` empty or absent) groups under one
  no-language bucket rather than being dropped, so no value can disappear.

## D2 — The separator

` / ` with spaces, which is what the operator reads on the card and what the
stored rows were split from. stabbur's splitter accepts a slash with or
without spaces; the card always presents the spaced form.

## D3 — Ordering stays the operator's

No sort by language code, no preferred-language-first rule. The order is the
order the rows sit in the note, which is the order stabbur's editor shows —
so the card matches the editor.
