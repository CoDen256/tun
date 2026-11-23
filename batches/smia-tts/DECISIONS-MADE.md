# smia-tts
- [smia tts provider data and ui] chose an adaptive saturation stop K = max(2, ceil(ln0.01/ln(1−draw/(pool+1)))) over a fixed K — because it bounds the chance of a missed word at 1% for any pool size (947: 20 zero-gain draws)
- [smia tts provider data and ui] chose a 120-request cap per (exercise, dialect) over 80 — because 947 alone needed 47 samples
- [smia tts provider data and ui] chose sequential 0.5–1.0 s pacing with one 90 s-timeout retry over parallel requests — because CALST answers in ~3.5 s and politeness outranks the ~15–20 h full-crawl duration
- [smia tts provider data and ui] chose cache key sha256([method,path,data,{dialect,sample}]) while keeping the legacy key for GETs and Oslo sample 0 — because the committed LAS cache is then reused without a request
- [smia tts provider data and ui] chose dialect discovery from /account/settings' `l2d` select (8 Norwegian dialects; 9–12 are other languages, excluded) over a hardcoded list — because it fails loudly if CALST changes
- [smia tts provider data and ui] chose crawling Oslo first, then the other 7 dialects, over one 8-dialect run — because Oslo alone carries every reported missing word and finishes in ~2.5 h
