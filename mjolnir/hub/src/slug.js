// A small, local, filesystem-safe slug — lowercase, non-alphanumerics
// collapsed to a single hyphen, trimmed to a sane length. For free-text,
// human-typed strings (a label) — OTA download names (D-C7) alike. No
// dependency needed for something this constrained.
export function slugify(text) {
  return String(text)
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 40);
}

// Filesystem-safe without lowercasing or touching dots — a version string
// (base_version, e.g. "1.5.12") is already a safe, meaningful filename
// component as-is; running it through `slugify` replaces every "." with
// "-" (found live: "1.5.12" -> "1-5-12" in `logic_bundles.file_path`,
// D110's own test only caught this once it ran against a real database —
// every dot in every base_version was silently mangled before this).
// Collapses anything NOT already filename-safe to a single hyphen, same
// trimming/length cap as `slugify`, but leaves `.`/case alone.
export function versionSlug(text) {
  return String(text)
    .replace(/[^A-Za-z0-9._-]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 40);
}
