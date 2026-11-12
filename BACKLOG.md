# System-Wide Master Backlog

## Quick Log (Manual Dump)
[ux] styrke dict_cc for audio should return more audios, 
[ux] stabbur when asking dict_cc should filter by PoS, because he picks the wrong PoS sometimes 
[ux] stabbur ignore variety field do something, can't se anything there
[ux] merging removes everything not saved,also mergingg should add context add translation, nor replace them.
[ux] builder should have number of cards/occurances in the descriptions
[ux] presens + missing prepositions of original text.
[ux] use card grid everywhere, improve it

## Triage & Planned Packages
> Managed by System Overseer AI. Last triaged 2026-11-08.

### mjolnir

#### Builder: Card Content / DB Integrity
[BUG] pg_dump doesn't support ordering of rows. When builder updates card content, it updates each row's updated time, even if the row wasn't updated. I want it not to update the row, if the content isn't updated, if that doesn't oppose any decision. But even if it updates the content and update time, the postrges has its own order inside and on every run after the builder pg_dump has each time new order of card content and it makes the git to commit it every time, not just the updated field is changed, but the order of the whole table. 
[BUG] builder existing cards whose content would change always has grammar note as updated, but it wasn't updated

#### Builder: Publishing Flow & Deck UI
[UX] builder should have the stats of the shipping, per deck, not in total, the flow and the quick numbers should be seen per deck. but it still have to say the amount of elligible cards from stabbur and what amount goes to which deck., plus the strip should contain also markers for the cards that are going to be shipped after i click publish, the newly eligible cards and the ones that are newly eligible and staged, should also be marked somehow, and the newly eligible pending as well. Maybe just put some icon on them, leave them as is, just that i see that those are the ones that are going to be added after this publish. also the ones that are going to be drained should be marked as well.
[UX] card preview should be better reflecting the actuall css used in mjolnir so that i don't need to publish and view it in the app to see how it looks like

#### Assembly Tab
[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[UX] assembly tab should allow search by module number

#### Bundle Tracking
[IDEA] i should track what bundle and when each bundle was pulled and display it in the ui, if that's not difficult.

### stabbur

#### Editing & Suggestion Providers
[UX] The stabbur editing is a little tedious, i want maybe to hard-code some primary suggestion providers and some fallback order, and prefill the fields by click of a button on the editing page and then verify and edit them manually if needed or use different providers if needed, but when i click the button all the fields get populated from hardcoded primary providers.
[UX] stabbur should not save the form across the notes and should collapse the suggest panels on the new note, not let it be open with prefiiled values from the previous one.
[UX] stabbur should have button to reload all the providers after i edited the prompt in "suggest" pill. currently i need to collapse and open it again.
[UX] stabbur transcription/inflections should be only for 1 word, the lemma without any prepositions. translation and audio should be for words + additional prepositions, e.g. "å legge til" should look up "legge til" without "a" for translation and audio, but for transcription and inflection it should look up "legge"
[UX] using multiple translations should append to the existing translation over slash, not adding additional translation (make configurable via settings page, add settings page)
[UX] stabbur when rewriting prompt per provider, let it be prefiiled with the suggestion prompt for  all providers
[UX] stabbur allow paste custom link to be loaded(youtube), not only via filmot/forvo, they should act as providers, who just refer to the other page, but down i would have a "url provider" so to say, where i just paste any link (youtube+timecode/mp3/wav) and it knows what to do, how to find the audio, either by downloading the video (as in filmot) or just directly the file (like forvo), so url entry is not tied to that particular providers. the providers just suggest to look there.

#### Content Import / Bulk Draft
[IDEA] I want to copy existing database of words to stabbur from: https://docs.google.com/spreadsheets/d/1I90ojRVr0T_hFbeO0LwS1CyfxZFrH6u4/edit?gid=1233824495#gid=1233824495 and https://docs.google.com/spreadsheets/d/1I6mvPbcibs79nMKg3UB9ZiTxtGaMF4PK/edit?gid=73884777#gid=73884777 and prefill it with primary set of providers and add each card as a draft, which i can then review, edit/fix and then set as done
[IDEA]copy from ankindeck and use ai to resolve existing ones.

#### Triage Inbox
[UX] I want a full triage inbox of reviewing cards, that are drafted. It should have very nice modern desing and very nice UX, so that i can just go over each card one by one, review, kinda like a belt, where i just look at drafted card, edit/fill it(ideally it should always have prefilled values), i might want to delete it or put it in the end of the queue or accept and go to the next drafted.

### smia

#### Linguistics / Parsing
[IDEA] smia should also support some way to provide prepositions, which the verbs/ use, and differentiate between prepositional verbs and verbs/adjectives/nouns with prepositions. "legge til" prepositional verb vs "vente på" / "redd for. But need to think through it. or understand how to standartize it.
[UX] fix smia dictcc parsing in general, among everything: don't add {n}/{f}/{m}
[UX] smia filmot link for multiword should search them in a quotes: https://filmot.com/search/%22fastsatt%20av%22/1?lang=no&hideDeleted=1&gridView=1&

### phonexa

#### UX
[UX]phonexa shadowing should support studying mode where i just press 3 buttons (one makes the audio play, the second compares, the third marks as completed and goes to the next one)

### hover-translate

#### Ideas
[IDEA]add tab audio recording in hovertranslate

### Cross-Repo / Ecosystem

#### Dev
[DEV] move to monorepo

## Archive / Done
