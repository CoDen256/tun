# System-Wide Master Backlog

## Quick Log (Manual Dump)
[ux] builder "s" is replaced with space when i hover over any card to see its contents. 
[ux] builder should have proper diff display between old content and new content of cards that update their content. it actually shows the old content i guess and i have no idea what have changed.
[ux] stabbur settings drag and drop not working and in general the whole settings page is very slow and not responsive
[ux] stabbur for prefill ask the number from settings providers, but when opened a suggestion drawer it should ask for more sentences.
[ux] stabbur example prefiiling should add examples when one is already there, but do not repeat

## Triage & Planned Packages

[idea] how about, after the 1000 cards are minted for C30, we rethink how to create pending occurances. 
The point is, there is nothing about the content or order of currently created cards that actually influences how they appear in the resulting deck.
In theory we could mint every card there is possible to mint and assign the occurances even before the stabbur actually has those cards available.
WE could in theory create a grid of cards and their occurences before hand, with no need to calculate each time different pending count or keeping the state of staged/shipped etc.
The card is just a number, not its contents.
We could mint every C31000...C31999 card beforehand, without any content, define the order. When building just iterate over each ocuurance stop where we can't create any occurence anymore, since the content was not yet filled and that's it.
But is it worth it? is it just trying to make everything perfect? 
[bug] fix filmot youtube clip parsing shadow/phonexa lab works somehow?, why not filmot?, btw shadow yt-dlp not working currently, but it did work properly before.


> Last triaged 2026-11-22.


### Hover translate fixes
[ux] the translation popup has way to big text and it has different size each time, probably because of the original subtitle font
[ux] i need to be able to create a note just by entering enter/ctrl enter when in that popup, so i entered the text and then just
[ux] add on screen buttons to start/stop recording., since its hard to remember what key to press, also i hope there is a keybinding to open "new card" popup
[ux] when selecting it should open a popup with that text prefilled and context as well, not send it immediately to stabbur

### Builder bugs, not manually added
projects: mjolnir

[bug] projector throws on a verb note whose `inflections` is an empty object `{}` — it enters the verb branch and `ensurePrefix` throws on undefined. `inflections: null` is the projector's own "none" input and works. Found 2026-11-16 while building flush-record-atomicity (four rollover pipeline test fixtures were failing at HEAD on any database because of it); the fixtures were corrected, the latent projector bug deliberately NOT fixed as out of that change's scope.
[bug] builder `probeDurationMs` (`mjolnir/builder/src/audioSnapshot.js`) runs `ffprobe` with no try/catch, so ONE note with `audio_sel_ms` whose blob ffprobe cannot read fails the WHOLE publish — which contradicts D-F1 ("one bad note must not fail the whole publish"). Found 2026-11-18 by the flush-record-atomicity verification; confirmed byte-identical at pre-change commit 9ab7a814, so it is pre-existing and NOT caused by that change. Since flush-record-atomicity landed, such a failure at least consumes no occurrences.
[bug] hub's OTA pull ingest keys its file cursor on PATH ONLY (`mjolnir/hub/src/otaPulls.js` ~131), with no inode/mtime check for the uncompressed log. `start = prev.offset <= stat.size ? prev.offset : 0`, so if Caddy rolls `ota-pulls.log` and the replacement grows PAST the previous offset before the next 60s tick, those first bytes are skipped and never re-read. The content-derived dedup key protects against double-counting, not against skipping. Found by review 2026-11-21; negligible at 8 MiB roll_size and the observed OTA volume, so deliberately NOT fixed in the `ota-pull-tracking` change. Fix would be keying the cursor on (inode, size) or re-reading from 0 when the inode changes.
[ux] hub awaits `maybeIngest()` INSIDE the Publish-history and Pulls page renders, and `ingestPulls` uses readFileSync/gunzipSync plus up to n/500 sequential INSERT round trips. On the first render after a hub restart the cursor map is empty, so every rolled `.gz` is decompressed and re-parsed synchronously on the request path. Bounded by real OTA traffic (~16 requests/day) so currently invisible; found by review 2026-11-21 and left alone deliberately. Fix would be ingesting off the request path entirely and letting the page read whatever is already in the table.

### Assembly tab
projects: mjolnir

[ux] assembly update patches to be more standartized (do not hardcode endpoint for both, let audio url endpon also be specified ), infer fillable envs from the patches.
[ux] assembly when picking bundle from catalogue its not obvious if its loading or anything, there is no progress marker
[ux] assembly compare doesn't work at all, when loading two files it just thinks a lot and then not displaying anything
[ux] assembly also include our custom companions in the explore tab, so that i can actually inspect all the contents of the bundle

### smia provider data, PoS ownership & responses

projects: smia, stabbur
[bug] make stabbur not solve most of the problems of particular smia providers, and move the logic to smia
EXAMPLES:
[bug]
IPA:
[bug] ipa should be merged on smia side, all the " " automatic joining should be done on smia side, if the providers don't support whole phrase.
TRANSLATIONS
[ux] smia translations dictcc should merge same text(translations) entries by joining context with "/" but verify that the stabbur can properly parse the PoS with such merge
TTS
[ux] smia dictcc doesn't deduplicate the same audios from different langs? for "stille" there is context "stille om"x2 with 2 identical(?) audios, their sha is different however, how so?
[ux] dict_cc is very slow for audio(tts) now after we fetch every audio? At least the context and link should (theoretically) be available even before we load audio.
[bug] smia/stabbur dict_cc when asked "rett" it has the same audio for both adv and adj, however in the stabbur it presented as only as adverb, even if the original PoS was adjective, it will not pick it, since its adverb
TRANSLATION/AUDIO
[bug] maybe we should move the PoS picking logic to smia, since each providers know how to pick their PoS, at least order them in the result .
UI

### Pronunciation, tonelag & minimal-pair exercise notes
projects: stabbur, mjolnir

[idea/rehaul] create pronounciatikn/audio for context of words (builder, but also kinda stabbur should allow attaching more audio per note)
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
[idea] use caslt/pygmalion data and create our own platform of sound training, or at least make an easy to navigate index to the calst excercises
[content] y/i listening pairs, use calst for generating pronounciation/listening exercises notes, using existing pygmalion/calst data

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
[ux] phone ui , put pull for nav/name of book, chapter nav, "more", exit and sentence on one/two lines to make it more compact
[ux] phone shadow  should provide installable "app", if that's easy to do?in