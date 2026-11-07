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
[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[IDEA] the builder ui for publishing is okaish, but i really want some nice graphical way of representing how the card flow from stabbur to mint to ready to publish with threashold visible and visible when what cards occurances will come, it doesn't necessarily should contain a lot of data, it should be very nice design and very easy to overview and understand

[IDEA] smia should also support some way to provide prepositions, which the verbs/ use, and differentiate between prepositional verbs and verbs/adjectives/nouns with prepositions. "legge til" prepositional verb vs "vente på" / "redd for. But need to think through it. or understand how to standartize it.
[DEV] move to monorepo
[BUG] in the app it shows __MJOLNIR_LABEL_, not the substituted string, as well as data version.
[OVERHAUL/BUG]  The decks are not being published in multiples of 5 per deck. We need a nice UI for the builder to track it.
[UX] fix smia dictcc parsing in general, among everything: don't add {n}/{f}/{m}
[UX] stabbur when rewriting prompt per provider, let it be prefiiled with the suggestion prompt for  all providers
[UX] smia filmot link for multiword should search them in a quotes: https://filmot.com/search/%22fastsatt%20av%22/1?lang=no&hideDeleted=1&gridView=1&
[UX] stabbur allow paste custom link to be loaded(youtube), not only via filmot/forvo, they should act as providers, who just refer to the other page, but down i would have a "url provider" so to say, where i just paste any link (youtube+timecode/mp3/wav) and it knows what to do, how to find the audio, either by downloading the video (as in filmot) or just directly the file (like forvo), so url entry is not tied to that particular providers. the providers just suggest to look there.
[UX] builder should have the stats of the shipping, per deck, not in total, the flow and the quick numbers should be seen per deck. but it still have to say the amount of elligible cards from stabbur and what amount goes to which deck., plus the strip should contain also markers for the cards that are going to be shipped after i click publish, the newly eligible cards and the ones that are newly eligible and staged, should also be marked somehow, and the newly eligible pending as well. Maybe just put some icon on them, leave them as is, just that i see that those are the ones that are going to be added after this publish. also the ones that are going to be drained should be marked as well.
[IDEA] i should track what bundle and when each bundle was pulled and display it in the ui, if that's not difficult.
[UX] in logs the json is still pretty prints the whole deck, which spams the logs
[UX] assembly tab should allow search by module number
## Triage & Planned Packages
> Managed by System Overseer AI

### 🔴 CRITICAL PATH (Blocking)

#### Package: `data-integrity-and-deck-publishing`
**Repos:** stabbur, builder  
**Severity:** Critical — blocks reliable backups, git history, and card publishing workflow  
**Items:**
- [BUG] pg_dump row ordering — deterministic ordering needed to prevent spurious commits
- [OVERHAUL/BUG] Deck publishing multiples of 5 — enforce & track in builder UI
- [IDEA] Card flow visualization & progress tracking — stabbur → mint → ready → publish with thresholds & timing
- [BUG] __MJOLNIR_LABEL_ substitution — env var not resolving, shows raw string in app

**Dependencies:** None (these are independent blockers)  
**Estimate:** 4–5 tasks: pg_dump fix, deck publishing enforcement, builder visualization UI, label substitution fix

---

### 🟡 HIGH PRIORITY (Core Feature Gaps)

#### Package: `stabbur-content-acquisition-and-triage`
**Repos:** stabbur, smia  
**Type:** Feature + UX improvements  
**Rationale:** Content acquisition is bottleneck; bulk import + streamlined triage accelerate card creation  
**Items:**
- [IDEA] Import from Google Sheets (copy existing word database) + prefill with provider suggestions → add as drafts
- [IDEA] Import from AnkiDeck + use AI to resolve conflicts
- [UX] Full triage inbox UI — review drafted cards with modern UX (edit, delete, queue, accept)
- [UX] Prefill suggestion providers hardcoded + button click to auto-populate
- [UX] Form should not persist across notes; suggestion panels collapse on new note
- [UX] Button to reload all providers after editing prompt in "suggest" pill
- [UX] Multiple translations should append over slash (configurable via settings page)
- [BUG] Grammar note marked as updated even when content unchanged (builder)

**Dependencies:** Partially blocks phonexa shadowing flow (needs content first)  
**Estimate:** 7–9 tasks (bulk import routes, triage UI, stabbur UX, one builder grammar fix, one settings feature)

---

#### Package: `builder-grammar-standardization`
**Repos:** builder, smia  
**Type:** Bug fixes + grammar rules  
**Rationale:** Ensures consistent inflection output; blocks reliable card publishing  
**Items:**
- [UX] Add "har" before perfekt inflection; add "å" before infinitive of verbs — revise publishing logic and substantives have to have article
- [UX] Transcription/inflections only for lemma (no prepositions); translation/audio include full phrase + prepositions
- [UX] Builder env vars (label, patch rev) should prefill with auto-incremented values, not just show them

**Dependencies:** Depends on smia prepositions clarification (IDEA below)  
**Estimate:** 3 tasks (builder inflection logic, smia word-lemma boundary)

---

### 🟢 MEDIUM PRIORITY (UX Polish + Features)

#### Package: `phonexa-study-mode`
**Repos:** phonexa  
**Type:** UX feature  
**Rationale:** Improves learning flow; standalone from other repos  
**Items:**
- [UX] Shadowing should support "study mode" — 3 buttons: play audio, compare, mark complete & next

**Dependencies:** None (can start anytime; benefits from stabbur content pipeline)  
**Estimate:** 1 task

---

#### Package: `hovertranslate-audio`
**Repos:** hovertranslate  
**Type:** Feature  
**Rationale:** Extends capture client capability; standalone  
**Items:**
- [IDEA] Add tab for audio recording in hovertranslate

**Dependencies:** None  
**Estimate:** 1 task

---

#### Package: `smia-prepositions-design`
**Repos:** smia  
**Type:** Design + implementation  
**Rationale:** Unlocks prepositional verb handling; clarifies word-lemma boundaries  
**Items:**
- [IDEA] Support prepositions in smia; differentiate prepositional verbs ("legge til") from phrases ("vente på", "redd for")

**Dependencies:** Blocks clarity on builder grammar standardization package (above)  
**Estimate:** 1 design task + 1–2 implementation tasks

---

### 🔵 BACKLOG (Design-Phase or Blocked)

#### Package: `monorepo-migration`
**Repos:** All  
**Type:** Infrastructure  
**Severity:** Major refactor  
**Rationale:** Dev ergonomics; currently deprioritized  
**Items:**
- [DEV] Move to monorepo

**Dependencies:** Likely blocked until critical path stabilizes  
**Estimate:** 10+ tasks (infra, CI/CD, build tooling)

---

## Dependency Map

```
┌─ data-integrity-and-deck-publishing ──────────┐
│  (includes pg_dump fix, deck multiples,       │
│   progress visualization, label substitution) │
│
├─ builder-grammar-standardization
│  └─ smia-prepositions-design (blocks full implementation)
│
├─ stabbur-content-acquisition-and-triage ─────┐
│  (Google Sheets + AnkiDeck import routes)     │
│  ├─ phonexa-study-mode                       │ (benefits from content)
│
├─ phonexa-study-mode
├─ hovertranslate-audio
│
└─ monorepo-migration (blocked until above mature)
```

---

## Archive / Done