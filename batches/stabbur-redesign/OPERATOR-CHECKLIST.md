# stabbur-redesign

## Stabbur editor redesign
- `stabbur/openspec/changes/archive/<date>-stabbur-editor-redesign`
- `mjolnir/openspec/changes/archive/<date>-projector-examples-column`

This touches stabbur (UI rewrite, schema and data migration) and the
mjolnir builder (the projector reads `examples`). The device plane, the APK,
grind, smia and hover-translate are untouched.

### Deploy: order matters, and both go out in one rollout

**1. Take a fresh backup before anything else.** The migration is
irreversible, and its `downgrade` refuses. Run:
```bash
docker compose run --rm -e RUN_ONCE=1 backup
```
Confirm the run finished and that the backup repo has a new commit dated now.

**2. Record the before numbers** (stabbur database):
```sql
SELECT count(*) AS notes_with_context FROM notes WHERE coalesce(trim(context_text),'') <> '';
SELECT count(*) AS slash_rows FROM notes, jsonb_array_elements(translations) t WHERE t->>'text' LIKE '% / %';
SELECT count(*) AS total_notes FROM notes;
```

**3. Deploy stabbur**, which also runs the migration:
```bash
git pull
docker compose build stabbur-backend
docker compose up -d stabbur-backend
```
The service serves before it migrates (D157). Watch
`docker compose logs -f stabbur-backend` until the alembic upgrade to
revision `d5e1a7c39f20` reports done. The health check stays "degraded"
until then.

**4. Verify the migration:**
```sql
-- expect 0
SELECT count(*) FROM notes, jsonb_array_elements(translations) t WHERE t->>'text' LIKE '% / %';
-- expect the notes_with_context figure from step 2
SELECT count(*) FROM notes WHERE jsonb_array_length(examples) > 0;
-- expect: no context_text column on notes; translation_merge_mode gone from settings;
--         theme / value_color / value_color_custom present
\d notes
\d settings
-- expect the total_notes figure from step 2 (nothing deleted)
SELECT count(*) FROM notes;
-- eyeball a note you know had several context lines
SELECT text, examples, translations FROM notes WHERE text = '<a word you know>';
```
`captures.context_text` stays, and is still filled.

**5. Then deploy the builder.** Never do this first: a builder without
stabbur's migration drops examples from every card.
```bash
docker compose build mjolnir-builder
docker compose up -d mjolnir-builder
```

**6. Before the next publish, run a forecast** and open a word or expression
card that has examples in the card preview. The X face shows each example on
its own line.
- Notes whose old context had blank lines or padded lines lose those empty
  lines on the next publish. That is expected.
- No other face should differ.
- This is **projector-examples-column C05**. It could not be verified in the
  build sandbox (no hub stack), so this is its first real check.

**Rollback:** restore the step-1 dump into the stabbur database and redeploy
the previous images of `stabbur-backend` and `mjolnir-builder`.

### Flows to test live (phone and desktop)
1. **Look and settings.**
   - Open stabbur. It should have the new cool, minimal look.
   - Settings → Appearance is the first section. Switch the theme
     (Auto / Light / Dark) and the value colour (four swatches plus a custom
     one), then reload on the phone too. The choice is kept on both
     devices, with no flash of the wrong theme.
   - Provider order has seven lists, Part of speech and Text from audio
     included.
2. **Triage on the phone.**
   - Four tabs (Word / Sound / Meaning / Grammar) with done-markers that
     update while you type.
   - The bottom bar is Delete, Previous, ⋯, Prefill icon, "Ready & next".
     Skip, Duplicate note, Send to back and Save are in ⋯.
   - Run Prefill, then open a few ✨ sheets.
3. **Triage on desktop.**
   - No tabs: three columns plus a grammar line.
   - The keys D S T R E M L work.
4. **Suggestion sheets.**
   - Providers appear in your Settings order, as separate boxes.
   - Override one provider's query and rerun only that provider.
   - Scroll a sheet and click inside it. It must not jump or replay its
     animation.
   - On an adjective, the matching-PoS rows come first with a small tag.
   - forvo and filmot are links at the bottom of the audio sheet.
5. **Audio.**
   - Copy a real mp3 URL, then press **Use URL from clipboard**. The audio
     attaches.
   - Copy plain text, then press it again. It says "Clipboard holds no URL".
   - This is **C35**. The sandbox has no DNS, so this is its first real
     check.
6. **Translations and examples.**
   - Every translation and every example is its own row.
   - Using a suggestion adds a row and never joins text with " / ".
7. **Merge.**
   - From the similar sheet, merge both ways ("Into this note" / "This note
     into …"), and check the survivor's values.
   - In triage, merge the current draft into a later draft, skip to it, and
     check that the merged values are still there.
   - On a ready note, "This note into …" is disabled.
8. **Duplicate.**
   - From a note, the copy opens as a draft labelled "copy of …", with its
     audio playable.
   - From triage, the copy comes up next in the queue.
9. **Notes list.**
   - Filter adjectives with no audio. Chips appear and the count matches.
   - Sort by least complete.
   - "Triage these" opens a belt over exactly those notes.
10. **Grammar.** A rule's explanation shows rendered (tables, lists).
    "Edit HTML" shows the source, and a saved edit renders.
11. **Real smia.** The sheets were only exercised against a fake smia in the
    sandbox. Check that every provider kind (PoS, IPA, translations,
    inflections, examples, audio, text from audio) returns and renders real
    candidates.

### Open item for you
**C28** is BLOCKED and needs your ruling. Should the ✨ count badges show
as soon as a note opens? That would mean looking up every field on every
open, which contradicts the existing "suggestions fire only on explicit
operator action" rule. As built, the note and new-note pages show counts
only after Prefill or after opening that field's sheet. Triage, with prefill
on open, shows them straight away.

### Known follow-ups (not blocking)
- A settings change made in another tab appears only after that tab is
  reloaded.
- An `href="#"` link inside a grammar explanation navigates away from the
  rule page.
