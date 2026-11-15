# System-Wide Master Backlog

## Quick Log (Manual Dump)

[REHAUL] builder UI new version. Completely new from the scratch in addition to "forecost and publish". Should have similar concept, but it should be based on the ship strip of occurances.
[BUG] builder flush-record-atomicity
[UX] card preview should be better reflecting the actuall css used in mjolnir so that i don't need to publish and view it in the app to see how it looks like, we need to use exactly the design in mjolnir to render the cards
[ux] builder should have number of cards/occurances in the descriptions of decks. 
[REHAUL] builder should add the time of build and it should be displayed in the app version. Rethink the logic and data versionning
[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[UX] assembly tab should allow search by module number
[IDEA] sync i should track what bundle and when each bundle was pulled and display it in the ui, if that's not difficult.
[BUG] the mjolnir syncing of devices is nice, but i think the tun-backup gonna explode from the syncing of the deckstats. i think we have to have one mutable userdata per user and use git to track changes instead of saving the new userdata everytime.
[ux] stabbur ignore variety field do something, can't se anything there
[ux] merging removes everything not saved,also mergingg should add context add translation, not replace them.
[REHAUL] rethink dictcc parsing and stabbur displaying of translations. also dict_cc audios not everyone is present and stabbur when asking dict_cc should filter by PoS, because he picks the wrong PoS sometimes
[UX] smia filmot link for multiword should search them in a quotes: https://filmot.com/search/%22fastsatt%20av%22/1?lang=no&hideDeleted=1&gridView=1&
[OVERHAUL] shadow shadowing should support studying mode where i just press 3 buttons (one makes the audio play, the second compares, the third marks as completed and goes to the next one) RETHINK THE DESIGN

[IDEA] explore smia/providers/calst, we need to download all the audio files from the manifest, check whether pygmalion has exactly the same stuff 
but is a subset of calst, combine them into one or extend pygmalion tts from all those 