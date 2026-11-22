# System-Wide Master Backlog

## Quick Log (Manual Dump)

## Triage & Planned Packages

> Last triaged 2026-11-22.

### Builder publish pipeline robustness
projects: mjolnir

[bug] projector throws on a verb note whose `inflections` is an empty object `{}` — it enters the verb branch and `ensurePrefix` throws on undefined. `inflections: null` is the projector's own "none" input and works. Found 2026-11-16 while building flush-record-atomicity (four rollover pipeline test fixtures were failing at HEAD on any database because of it); the fixtures were corrected, the latent projector bug deliberately NOT fixed as out of that change's scope.
[bug] builder `probeDurationMs` (`mjolnir/builder/src/audioSnapshot.js`) runs `ffprobe` with no try/catch, so ONE note with `audio_sel_ms` whose blob ffprobe cannot read fails the WHOLE publish — which contradicts D-F1 ("one bad note must not fail the whole publish"). Found 2026-11-18 by the flush-record-atomicity verification; confirmed byte-identical at pre-change commit 9ab7a814, so it is pre-existing and NOT caused by that change. Since flush-record-atomicity landed, such a failure at least consumes no occurrences.

### Hub OTA pull ingest
projects: mjolnir

[bug] hub's OTA pull ingest keys its file cursor on PATH ONLY (`mjolnir/hub/src/otaPulls.js` ~131), with no inode/mtime check for the uncompressed log. `start = prev.offset <= stat.size ? prev.offset : 0`, so if Caddy rolls `ota-pulls.log` and the replacement grows PAST the previous offset before the next 60s tick, those first bytes are skipped and never re-read. The content-derived dedup key protects against double-counting, not against skipping. Found by review 2026-11-21; negligible at 8 MiB roll_size and the observed OTA volume, so deliberately NOT fixed in the `ota-pull-tracking` change. Fix would be keying the cursor on (inode, size) or re-reading from 0 when the inode changes.
[ux] hub awaits `maybeIngest()` INSIDE the Publish-history and Pulls page renders, and `ingestPulls` uses readFileSync/gunzipSync plus up to n/500 sequential INSERT round trips. On the first render after a hub restart the cursor map is empty, so every rolled `.gz` is decompressed and re-parsed synchronously on the request path. Bounded by real OTA traffic (~16 requests/day) so currently invisible; found by review 2026-11-21 and left alone deliberately. Fix would be ingesting off the request path entirely and letting the page read whatever is already in the table.

### Assembly tab
projects: mjolnir

[ux] assembly update patches to be more standartized (do not hardcode endpoint for both, let audio url endpon also be specified ), infer fillable envs from the patches.
[ux] assembly when picking bundle from catalogue its not obvious if its loading or anything, there is no progress marker
[ux] assembly compare doesn't work at all
[ux] assembly also include our custom companions in the explore tab

### smia provider data, PoS ownership & responses
projects: smia

2. ipa should be merged on smia side
[ux] smia ui put provider healtch below the manual try it
[bug] fix filmot, shadow/phonexa lab works somehow?, why not filmot?
[ux] smia translations dictcc merge same text(translations) entries by joining context with "/" but verify that the stabbur can properly parse the PoS with such merge
[ux] smia source should specify name of the human, smia ui nice ux idea: can we somehow add within the json response text field small play buttons, near "sha256" that will play the audio when pressed, instead of placing them below the response field
[ux] smia dictcc doesn't deduplicate the same audios from different langs? for "stille" there is context "stille om"x2 with 2 identical(?) audios, their sha is different however, how so?
[idea] fuzzy search for pygmalion, since there are a lot of similar audios?, maybe even for inflected ones, but the requests are only for lemma?
[ux] dict_cc is very slow for audio(tts) now after we fetch every audio? At least the context and link should (theoretically) be available even before we load audio.
[bug] smia/stabbur dict_cc when asked "rett" it has the same audio for both adv and adj, however in the stabbur it presented as only as adverb, even if the original PoS was adjective, it will not pick it, since its adverb
[bug] maybe we should move the PoS picking logic to smia, since each providers know how to pick their PoS, at least order them in the result .
[bug] provider pygmalion no entry for målende, målene

### stabbur suggestion panel & prefill
projects: stabbur

1. stabbur examples/translations store as separate rows, not joined by "/", just make the ux easier to edit, view those multiple translations
[ux] stabbur audio suggestion rehaul, filmot and forvo should be smaller, no input field, url input should be removed and there should be just a button, that says: url from clipboard? forvo and filmot push down
[ux] stabbur the providers don't fill examples correctly.
[ux] stabbur provider priority should reflect the same order in the suggestion list, even if no prefill is done

### stabbur triage, editor & phone layout
projects: stabbur

[bug] stabbur triage: after a merge on the triage belt, the absorbed notes stay in the in-memory `triageQueue`. Similar-note matches are very often other drafts in the same queue, so advancing lands on a row whose note was just hard-deleted and every PATCH/accept against it 404s. PRE-EXISTING (identical before the `stabbur-merge-fixes` change — confirmed at 925386bd), but that change makes merging much more prominent (take text/lemma, operation labels, save-and-merge), so it will be hit more often. Fix: drop the absorbed ids from `triageQueue` in `commitSimilarMerge`'s tail, where it currently only refreshes the survivor.
[ux] stabbur grammar detail: the usage list requests `limit: 200` while `rule.usage_count` is uncapped, so a rule referenced by 300 notes reads "300 notes reference this rule" above a list of 200. Either page the list or say it is showing the first 200.
[ux] convenient phone portrait display for stabbur. Designed 2026-11-16 in the `full-sweep` "Stabbur merging & dict.cc translations" design session, then deliberately DEFERRED out of that package so the operator can take it later; the four changes it would have touched shipped without it. What was settled there, so it need not be re-derived: four pages need portrait layouts — Triage, Notes list, Note editor/detail, Settings. Triage: the queue selector collapses to a native `<select>`, the belt stays but shortens, and the verdict bar pins to the bottom of the viewport as a thumb-reachable row (Delete / Skip / Previous as glyphs, "Ready & next" taking the remaining width). Notes list: the table becomes stacked rows — the two glyph columns (status, audio) stay on the right of the headword, and type/PoS/translation/updated fold into one dim secondary line; the pager shrinks to `‹ 2 ›` plus the count. Note editor: the two-column detail grid collapses to one column, similar-notes and merge included. Settings: single column. Nothing about the DATA changes — this is layout only. Mockup of the intended portrait treatment: `stabbur/openspec/changes/stabbur-triage-queues/mockups/stabbur-merge-dictcc.html` (the "Portrait" blocks on the Triage and Notes list tabs).
[ux] stabbur duplicate note button

### Pronunciation, tonelag & minimal-pair exercise notes
projects: stabbur, mjolnir

[idea/rehaul] create pronounciatikn/audio for context of words (builder, but also kinda stabbur should allow attaching more audio per note)
[content] y/i listening pairs, use calst for generating pronounciation/listening exercises notes
[idea] stabbur tonelag exercises and pronounciation/hear exercises(i/y, li/ly) type (that will produce special cards in mjolnir)
a) tonelag notes: i put two identically sounding words, difference only in the tone (visible in IPA) (e.g. lyse/lyset). This is one note / might be separate entity. We might also use tone sketch, like calst does (--/) or (\\/) but make it pretty
- i can provide as many audio as i want for each of the word, selecting primary one for pronounciation cards
- produces pronounciation cards(N=read out:text, E=ipa+contour, X=translation, A=E) x 2 (N occ.) for each (use primary audio)
- produces "listening" cards (N=identify word that you hear, E=text+ipa+contour, X=translation, A=N) x 2 (N occ.) x Num of Audios for each (important to have some kind of spacing between two N's of this type) 
- separate deck C21?
b) sound traning notes: i put two contrasting sounds/words, that are easy to mix up (e.g. li/ly or sky/ski)
- the same concept as (a) actually, same mjolnir pronounciation and listening cards with the same stuff, just no contour, the concept is the same
so a type of tricky phonetic words, minimal pair which are hard to distinguish (either by toneme, or vowel/consonant), create cards for pronounciation of those and create cards for identifying those,
-> actually ignore the pair, let's do any tuple of hard to distinguish sounds, so listening cards are created for each distinct sound x for each audio, pronounciation cards are created for each distinct sound.
-> For example ultimate disambiguation tuple(toneme(1/2),vowel(i/y),length(v,v:)): sinet/sine/sinnet/sinne/synet/syne/syndet/sydne

### Card audio loudness normalization
projects: mjolnir, stabbur

[bug] some of the mjolnir cards are too loud, some are too quite in relation to the stock volume. we hae to standartize it, but where? 

### Shadow playback, splitting & chapter reading
projects: shadow

[bug] shadow study doesn't trimmed merged/split sentences good enough
[ux]  shadow pause/stop button needs to be added, but only as a secondary button. When picking where to split, when its already playing it doesn't stop or show the line where to split. I would reverse and put the line only after i pressed "split"
[bug] shadow replay feature doesn't work for prepare/explore
[ux] shadow explore plays audio laggily still, the live line doesn't match and it sometimes silenced
[ux] the shadow website constantly has icon of using my mic, even if record not pressed. 
[ux] shadow add chapterwise read where it will automatically read sentence by sentence of the whole chapter, probably even not trimming, but when stopped at a sentence it should play trimmed and then i would be able to continue as usual
[ux] add option to split chapter anywhere
[ux] opening a new sentence should play it immediately
[ux] ready, next is a little laggy, waitning for something

### Shadow phone UI & installable app
projects: shadow

[ux] phone ui , put pull for nav/name of book, chapter nav, "more", exit and sentence on one/two lines to make it more compact
[ux] phone shadow  should provide installable "app", if that's easy to do?

## Package dependencies

- **smia provider data, PoS ownership & responses** before **stabbur suggestion panel & prefill** — the suggestion list orders and prefills from what smia returns; where PoS picking lives and whether dict.cc contexts are joined is settled in the smia package and consumed by the stabbur one.
- **stabbur triage, editor & phone layout** before **stabbur suggestion panel & prefill** before **Pronunciation, tonelag & minimal-pair exercise notes** — all three land in the single `stabbur/ui/ui.js`, so their builds must run in this order; design sessions are still parallel-safe.
- **Shadow playback, splitting & chapter reading** before **Shadow phone UI & installable app** — the phone compaction re-lays-out the same study/explore chrome the playback package changes.
