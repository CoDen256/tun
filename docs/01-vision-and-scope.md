# Vision and scope

## The problem

Three working tools exist, none of them connected:

- **phonexa** — phonetics practice/analysis (IPA charts, formant lab, shadowing,
  live mic tracking). Postgres-backed. Knows about *sounds*.
- **mjølnir** (modded) — spaced-repetition card app for Norwegian. Decompiled
  Expo/React-Native APK, content baked into `index.android.bundle`. Knows about
  *meanings*.
- **hover-translate** — MV3 extension translating video subtitles on hover
  (YouTube, Cineby). Knows about *content you are actually consuming*.

Nothing flows between them. Content encountered in the wild never becomes
something you study; study progress is invisible; audio is locked in an APK.

## The primary loop (what "done" looks like for v1)

> Hover/select a Norwegian sentence on YouTube → translation appears → save →
> the sentence (with the real audio from that video) arrives in Mjølnir as a
> spaced-repetition card.

Everything else is an extension of this loop.

## The five modules

```
hover-translate ──capture──► stabbur ──publish──► mjolnir-hub ──OTA──► Mjølnir
   (capture)                 (triage,            (device-facing)      (device)
                              decks, publish)
                                 │
                                 ├──enrich──► smia (inflect/ipa/tts/stt/translate)
                                 │
                              phonexa (phonetics lab — optional deep-dive on any clip)
```

## Scope boundaries (deliberate)

- **No new UI inside Mjølnir.** The app's screens stay as-is. All authoring and
  browsing happens in phonexa/stabbur or the extension.
- **No Firebase.** Progress backup goes to our own server, mirroring the
  Firestore document shape so the app-side change stays minimal.
- **No link between recall progress and pronunciation progress.** Mjølnir card
  scheduling and phonexa pronunciation practice are tracked separately and are
  not fed into each other. (Revisit later if desired — see `09-open-questions.md`.)
- **Single user.** Auth is a shared-secret token to keep strangers out, not an
  identity system. No per-user modelling in the new services.
- **One APK build, forever.** After the one-time native patch, every future
  change ships as a JS bundle + audio blobs over the network.

## Content sources

| Source | Audio | Notes |
|---|---|---|
| YouTube | ✅ server-side `yt-dlp` + `ffmpeg` slice | phonexa already runs this for Shadowing |
| Audiobooks | ✅ promote a `ShadowingSegment` | browser uploads only that slice |
| Arbitrary web text | ❌ → TTS | extension supports any-page text selection |
| Netflix | ❌ EME-protected, `tabCapture` yields silence | → Forvo or TTS |
| Cineby | ❓ depends on player | investigate |
