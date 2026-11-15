# Mockups

`bundle-pulls-option-a-accepted.html` — published as an Artifact and clicked
through by the operator on 2026-11-15.

It contains **two** placements. **Option A was accepted**: a dedicated
`/mjolnir/device/pulls` page, a third item in the Device rail group — stat
tiles, the per-build table, and the pull log timeline.

**Option B (the compact panel on the existing Sync page) was rejected** and is
retained in the file only as the record of what was considered. Do not build
it. The deciding argument is in `design.md`: the Sync page is account-scoped
and pull data has no account dimension, so the panel had to disclaim the uid
selector sitting directly above it.

Build the page from Option A's markup and classes. Two details in it are
requirements, not decoration, and are covered by `acceptance.md`:

- never-pulled builds are visibly flagged, including the just-published one
- the page states that a download is not an activation, and that the recorded
  address is an address rather than a device or account
