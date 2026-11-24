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
| Shadow playback, splitting & chapter reading | building — `shadow/openspec/changes/shadow-playback-chapter-reading`; implemented + reviewed + review fixes (0d64e20a); server-observable criteria PASS (A1.2–1.5, A6.1, A7.1 manifest, A7.3, A9.1–9.4/9.6–9.8 server halves); **UI criteria NOT RUN — awaiting a connected Chrome** (dev gateway :8080, operator/testoperator) |

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

we need to polish the current state and fix optimization/bugs of the shadow:
[bug] shadow study doesn't trim the previously merged/split sentences good enough, they don't have that trim, that normal sentences have.
[ux]  shadow pause button needs to be added, but only as a secondary button in the tray.
[ux] When picking where to split, when its already playing it doesn't stop or show the line where to split, also its buggy a little bit. I would reverse it and put the line only after i pressed "split"
?[bug] shadow pause/stop/play feature doesn't work for prepare/explore as it works for normal sentence
[ux] shadow explore still has lags when playing the sentences, the live line doesn't match and it sometimes silenced completely
[ux] the shadow website constantly has icon of using my mic after i used it once, even if record not pressed.

new ideas
[rehaul] the settings page should match the design of the shadowing in general, currently it uses old phonexa design, make it also good minimalistic and cool. 
Put following in the settings: theme, trim silence toggle, stt provider. Also manage users in the settings, to allow deleting/adding renaming
[idea] shadow add chapterwise: this is needed for me to allow to read the audiobook exactly as it's recorded,without trims, just the natural tempo. but with the ability to stop at any given moment, exercise that sentence (as usual shadowing with trimming etc) and then resume the usual audiobook tempo 
this will:automatically read sentence by sentence of the whole chapter, just as if i am pressing continue all the time(don't mark as ready), but when stopped at a sentence it should play trimmed and then i would be able to continue as usual
+ settings option that says whether to trim/not trim settings when played in the audiobook mode.
+ the audiomode should be visibly on the sreen, that it's currently being played automatically without my intervention, going from one sentence to the other and playing it with the live line etc
+ also think through the phone ui, how audio mode is gonna work there
[ux] add option to split chapter anywhere in the prepare tab, so that i can customize chapters as i want.
[ux] opening a new sentence should play it immediately (can be toggled of in the settings, this does not apply to audiobook mode, this is separate, as if i am reading it usually.) 
[ux] (ready, next) is a little laggy, waitning for something, want to check if the performance could be improved
[ux] phone ui , put pull for nav/name of book, chapter nav, "more", exit and sentence on one/two lines to make it more compact (the upper part)
[ux] phone shadow  should provide installable "app", if that's easy to do?

## Dropped / deferred

- *Shadow playback…* — "manage users in the settings, to allow deleting/adding renaming": **dropped**. The operator chose to make shadow single-user instead (ADR D168), so there are no profiles left to manage.
- *Shadow playback…* — re-trimming sentences merged/split before the 2026-11-17 fix: **dropped**. Those rows are disposable; the operator re-analyses a book when it matters. Only parity for new edits is built.

## Builder's judgment (tier-2, from design sessions)

- *Shadow playback…*:
  - how the old `settings.html` redirects to the in-app Settings screen;
  - the PWA icon artwork;
  - the wake-lock fallback when the API is unavailable;
  - the boundary-crossing detection for continuous audiobook playback (within acceptance A10.4's 300 ms).

  Everything visible is fixed by `mockups/`, to be implemented **1-1**.
