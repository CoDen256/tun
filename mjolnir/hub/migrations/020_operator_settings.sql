-- card-preview-popup task 6.1 (design.md §6): the operator chose
-- server-side persistence over browser storage for the Cards page's view
-- state (source/filters/sort/page size/page) and the popup preferences
-- (device/theme/font size/default direction/drawer width+height/active
-- tab/tools open). One flat key -> JSON value table, no user column —
-- there is exactly one operator (D159/D160) — with an updated-at so a
-- stale row is at least inspectable.
CREATE TABLE operator_settings (
  key         TEXT PRIMARY KEY,
  value       JSONB NOT NULL,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
