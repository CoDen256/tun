## 1. Investigate stock module 953/956

- [x] 1.1 Confirm the exact current source of the `createStore`/
      `applyMiddleware`/`u.logger` call in
      `index.android.bundle.exploded/953.js` matches what's quoted in
      design.md — re-pull if the base bundle has moved.
- [x] 1.2 Confirm module 956's `createLogger` export signature/option
      names (`stateTransformer`, `actionTransformer`, `collapsed`,
      `diff`) against the real bundled `redux-logger` source, not just
      the public npm docs for the version it was built from.
- [x] 1.3 Grep `deckStats`/`settings`/`auth` state and common action
      payloads for non-JSON-safe values (Dates, functions, circular
      refs) that could throw or serialize oddly under `JSON.stringify`.

## 2. Author the patch pair

- [x] 2.1 Create `patches/js/953-store-setup.baseline.js` capturing the
      stock store-setup call verbatim.
- [x] 2.2 Create `patches/js/953-store-setup.edited.js` replacing
      `u.logger` with `u.createLogger({ collapsed: true, diff: false,
      stateTransformer: JSON.stringify, actionTransformer: JSON.stringify })`
      per design.md's D1.
- [x] 2.3 Address any non-JSON-safe values found in 1.3 (e.g. a custom
      transformer step before `JSON.stringify`, if needed) before
      finalizing the edited file.

## 3. Verify

- [x] 3.1 Rebuild/reassemble the patched APK via the existing
      `bundle-tool assemble` pipeline with the new patch pair included.
- [x] 3.2 Run the app, dispatch a representative action (e.g. the same
      `PASSED_INITIAL_ONBOARDING` action seen in the original logcat
      capture), and confirm `adb logcat` shows one single-line JSON entry
      per `%c action`/`%c prev state`/`%c next state`, not a multi-line
      tree.
- [x] 3.3 Confirm logging volume/content is otherwise unchanged (same
      actions fire, same state values present, just reformatted).
- [x] 3.4 Confirm no runtime error is introduced if `JSON.stringify`
      encounters a value found in task 1.3.

## 4. Document

- [x] 4.1 Note the new patch pair (module 953) in whatever manifest or
      README lists which modules this project patches, if one exists.
- [x] 4.2 Update the `adb logcat` debugging guidance (wherever the
      project documents the `-s ReactNativeJS:V | grep ...` convention,
      e.g. alongside D63 or in a debugging doc) to mention the Redux
      state/action stream is now single-line JSON too.
