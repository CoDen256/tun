# System-Wide Master Backlog

## Quick Log (Manual Dump)
 

[BUG] pg_dump doesn't support ordering of rows. When builder updates card content, it updates each row's updated time, even if the row wasn't updated. I want it not to update the row, if the content isn't updated, if that doesn't oppose any decision. But even if it updates the content and update time, the postrges has its own order inside and on every run after the builder pg_dump has each time new order of card content and it makes the git to commit it every time, not just the updated field is changed, but the order of the whole table. 
[BUG] builder existing cards whose content would change always has grammar note as updated, but it wasn't updated
[UX] builder add "har" before perfekt inflection always, when minting cards. and å before infinitive inflection of verbs, and in general revise the publishing logic
[UX] The stabbur editing is a little tedious, i want maybe to hard-code some primary suggestion providers and some fallback order, and prefill the fields by click of a button on the editing page and then verify and edit them manually if needed or use different providers if needed, but when i click the button all the fields get populated from hardcoded primary providers.
[IDEA] I want to copy existing database of words to stabbur from: https://docs.google.com/spreadsheets/d/1I90ojRVr0T_hFbeO0LwS1CyfxZFrH6u4/edit?gid=1233824495#gid=1233824495 and https://docs.google.com/spreadsheets/d/1I6mvPbcibs79nMKg3UB9ZiTxtGaMF4PK/edit?gid=73884777#gid=73884777 and prefill it with primary set of providers and add each card as a draft, which i can then review, edit/fix and then set as done
[UX] I want a full triage inbox of reviewing cards, that are drafted. It should have very nice modern desing and very nice UX, so that i can just go over each card one by one, review, kinda like a belt, where i just look at drafted card, edit/fill it(ideally it should always have prefilled values), i might want to delete it or put it in the end of the queue or accept and go to the next drafted.
[UX] stabbur should not save the form across the notes and should collapse the suggest panels on the new note, not let it be open with prefiiled values from the previous one.
[UX] stabbur should have button to reload all the providers after i edited the prompt in "suggest" pill. currently i need to collapse and open it again.
[UX] stabbur transcription/inflections should be only for 1 word, the lemma without any prepositions. translation and audio should be for words + additional prepositions, e.g. "å legge til" should look up "legge til" without "a" for translation and audio, but for transcription and inflection it should look up "legge"
[UX] using multiple translations should append to the existing translation over slash, not adding additional translation (make configurable via settings page, add settings page)
[IDEA]nice graphics and analysis of cards done etc, maybe graylog or just custom dashboard with nice graphics
[IDEA]copy from ankindeck and use ai to resolve existing ones.
[UX]phonexa shadowing should support studying mode where i just press 3 buttons (one makes the audio play, the second compares, the third marks as completed and goes to the next one)
[IDEA]add tab audio recording in hovertranslate
[UX] label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[IDEA] the builder ui for publishing is okaish, but i really want some nice graphical way of representing how the card flow from stabbur to mint to ready to publish with threashold visible and visible when what cards occurances will come, it doesn't necessarily should contain a lot of data, it should be very nice design and very easy to overview and understand

[IDEA] smia should also support some way to provide prepositions, which the verbs/ use, and differentiate between prepositional verbs and verbs/adjectives/nouns with prepositions. "legge til" prepositional verb vs "vente på" / "redd for. But need to think through it. or understand how to standartize it.
[DEV] move to monorepo
[BUG] in the app it shows __MJOLNIR_LABEL_, not the substituted string, as well as data version.
[OVERHAUL/BUG]  The decks are not being published in multiples of 5 per deck. We need a nice UI for the builder to track it.

## Triage & Planned Packages
> Managed by System Overseer AI


---

## Archive / Done