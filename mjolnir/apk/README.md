# apk

Decompile → patch → rebuild → re-sign pipeline scripts.

The build **workspace** (`/home/coden/rev/mjolnir/`) is disposable scratch and is
deliberately not part of this repo — only the scripts and the patch sources
(`../patches/native/`) are versioned.

The workspace once held two divergent, confusingly-named bundle lineages
across two app versions — resolved by untangling blobs (`tun/docs/07-decisions.md`
D58/D59). **Resolution: don't use the workspace as a base at all.**
`base/smali.mjolnir.merged` in this repo is the single pinned, clean, unpatched
v1.5.12 base (D60) that every patch builds on — see `apk/build.sh`.
