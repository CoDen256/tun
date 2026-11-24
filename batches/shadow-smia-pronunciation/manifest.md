# shadow-smia-pronunciation

Batch opened 2026-11-24 from three triaged packages.

## Dependencies

- `smia provider data, PoS ownership & responses` before `Pronunciation, tonelag & minimal-pair exercise notes` — both change stabbur's note/import path (`stabbur/scripts/import/merge.py`, `stabbur/ui/ui.js`, `stabbur/db/models.py`), so the smia package's provider/PoS contract lands first.
- `Shadow playback, splitting & chapter reading` — no dependency; shadow-only, parallel-safe with both.

## Status

| package | status |
|---|---|
| smia provider data, PoS ownership & responses | pending |
| Pronunciation, tonelag & minimal-pair exercise notes | pending |
| Shadow playback, splitting & chapter reading | pending |

## Packages

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

## Dropped / deferred

(none)
