# stabbur-fixes

What to do on the VPS after pulling, and what to test live. Archived means
implemented and agent-verified (D161) — this list is the part you have to
confirm yourself.

## stabbur fixes (changes `stabbur-prefill-and-settings-fixes`, `examples-sentence-normalisation`)

### Deploy

Standard pull / build / restart, with one thing that is **not** optional:
**`smia-backend` must be rebuilt, not just restarted.** The image gained a
new module (`smia/example_text.py`) and the Dockerfile's COPY list changed;
a container started from the old image crash-loops on
`ModuleNotFoundError: No module named 'example_text'` and every enrichment
call then fails.

```bash
cd ~/tun
git pull
docker compose build smia-backend stabbur-backend
docker compose up -d smia-backend stabbur-backend
docker compose ps        # both healthy, neither Restarting
```

### One-time migration

`stabbur` gains one alembic revision, **`c81f3a9d4b20` — examples sheet
count (K)**. It is applied automatically at boot (serve-before-migrate,
D157), so there is nothing to run by hand. Confirm it landed:

```bash
docker compose exec stabbur-backend alembic current
#   expect: c81f3a9d4b20 (head)

docker compose exec postgres psql -U tunadmin -d stabbur -c '\d settings' \
  | grep examples
#   expect a column examples_sheet_count and TWO new check constraints:
#     ck_settings_examples_sheet_count
#     ck_settings_examples_count_within_sheet_count
```

What it does: adds one nullable column bounded 1–10, plus a constraint that
Sentences per provider never exceeds it. **No backfill, nothing destructive,
and the downgrade is clean** — every existing row keeps a NULL sheet count,
which reads as `max(5, your current Sentences per provider)`. So if your
Sentences per provider is 2 you will see a sheet count of 5; if it is 8 you
will see 8.

If `alembic current` shows the old revision and the container is healthy,
the database was unreachable at boot — check `docker compose logs
stabbur-backend | grep "schema not ready"`.

smia has **no** migration. Nothing is purged: entries already in smia's
lookup cache are normalised on their next read, because the normalisation
happens on the way out and the cache still stores the provider's raw answer.

### Live flows to test

**Settings — the drag (item 1).** Open `/stabbur/#/settings` → Provider
order. Drag a provider by its handle to a new position and let go. It should
stay where you dropped it the instant you release, the numbers should read
1…n immediately, and *Saving…* then *✓ Saved* should appear beside that
list's own title. Reload: the new order is still there. Then focus a handle
(Tab to it) and press Arrow Up — same thing, and focus stays on the handle.
Do this on a Translations · de list and check Translations · en is untouched
after a reload.

**Settings — speed (item 1).** Toggle a provider's switch off and on a few
times quickly. Each one should feel immediate, and the status should say
Saved rather than hanging. This is the one that was slow because every read
*and* every save waited on smia counting its dictionary tables; the
catalogue is now reused for up to a minute.

**Settings — the Examples section (items 3/4).** It is now called
**Examples** and has three counts: Providers to ask, Sentences per provider,
and **Sentences in the suggestion sheet**. Try to raise Sentences per
provider above the sheet count — the `+` should be greyed out and say why.
Same for lowering the sheet count below it.

**Prefill speed and progressiveness (item 2).** Open a triage note with
empty fields and press Prefill. Fields should now appear **one at a time as
each answers**, rather than all at the end — in particular the translation
should not wait for audio. Prefill five or six notes in a row and watch for
anything that still takes 5–10 seconds, or any field that stays empty while
the button keeps spinning. **This is the item that most needs your eyes: the
intermittent failure we could trace here is a 502 from one translations
provider, contained to its own field, and this machine has no outbound DNS
so the real HTTP providers (google, bing, lexin, ordbokene) could not be
exercised at all.** If you still see a whole prefill come back empty, that
is a new backlog item and we want the browser's network log for it.

**Examples append (item 5).** On a note that already has an example, press
Prefill. The existing rows must stay, unchanged and first, with new
sentences added after them — and pressing Prefill again must add nothing.
Then edit one row to lower case with no full stop, matching a sentence its
first provider returns, and Prefill again: no second copy should appear.
Finally choose **Force prefill** from the ⋯ tray — that still replaces.

**The Examples sheet (items 3/4/6).** Open the sparkle beside Examples.
Every candidate should read as a sentence: capital first letter, full stop
at the end. A candidate the note already holds should read **On note** and
be greyed out; pressing Use on another should flip it to On note, and
deleting that row from the note should make it usable again. Open a
provider's ✎ query row — it now has a count stepper for that provider, for
this note only. Change it and press Enter (or the rerun arrow): only that
provider is re-asked. Go to the next note and the count is back to the
Settings value.

**One thing to look at specifically**, because it is the only normalisation
rule we had to choose rather than read off the design: a quoted example comes
back as `«Kom hit».` — the full stop goes *after* the closing quote. If you
want it inside, that is a one-line backlog item.
