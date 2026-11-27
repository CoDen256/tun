# System-Wide Master Backlog

## Quick Log (Manual Dump)

## Triage & Planned Packages

> Last triaged 2026-11-24.

[idea] alternate the audios when minting cards if available more audios, this should allow to support more audios per note.
[idea] how about, after the 1000 cards are minted for C30, we rethink how to create pending occurances. 
The point is, there is nothing about the content or order of currently created cards that actually influences how they appear in the resulting deck.
In theory we could mint every card there is possible to mint and assign the occurances even before the stabbur actually has those cards available.
WE could in theory create a grid of cards and their occurences before hand, with no need to calculate each time different pending count or keeping the state of staged/shipped etc.
The card is just a number, not its contents.
We could mint every C31000...C31999 card beforehand, without any content, define the order. When building just iterate over each ocuurance stop where we can't create any occurence anymore, since the content was not yet filled and that's it.
But is it worth it? is it just trying to make everything perfect? 
[bug] fix filmot youtube clip parsing shadow/phonexa lab works somehow?, why not filmot?, btw shadow yt-dlp not working currently, but it did work properly before.
[idea] cut the git repo, cut the size of pygmalion audio

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

### Card audio loudness normalization
projects: mjolnir, stabbur

[bug] some of the mjolnir cards are too loud, some are too quite in relation to the stock volume. we hae to standartize it, but where? 
