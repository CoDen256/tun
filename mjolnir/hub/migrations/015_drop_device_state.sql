-- D-C1/D-C2's own device_state mechanism (per-device build/audio-cache
-- status for hub's operator console) was never actually populated: nothing
-- on the device ever attached activeBuildId/pendingBuildId/audioCached/
-- audioTotal/lastFetchError to the sync PATCH, so the table stayed
-- permanently empty in practice. Confirmed this was pure net-new tooling
-- with no equivalent in the original app's own backend (which is keyed
-- solely by Firebase uid, D-S1) — not worth the client-side work to
-- finish. Operator's explicit call: drop it rather than build out the
-- missing client half.
DROP TABLE device_state;
