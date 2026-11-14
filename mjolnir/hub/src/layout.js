// hub's page chrome: its own rail, and the shared shell.
//
// This file used to carry ~330 lines — the whole design system, duplicated
// byte-for-byte in builder/src/layout.js, under D46's "vendored CSS, not a
// package" rule as restated by D80. zone-isolation 4.1 moved the shell, the
// stylesheet and the cross-zone navigation to libs/jsservice/layout.js, which
// both processes import; see that file's header for why D46's reason (cross-
// repo coupling) no longer applies in a single repository. What is left here
// is the only thing that was ever hub-specific: which pages are in hub's rail.
//
// The design system itself is still the mockup from
// tun/docs/13-operator-console-ux.md, unchanged.
import { renderShell as renderSharedShell, renderRail, escapeHtml } from "../../../libs/jsservice/layout.js";

const NAV = [
  { group: "Content", items: [{ href: "/mjolnir/cards", label: "Cards" }] },
  {
    group: "OTA",
    items: [
      { href: "/mjolnir/ota", label: "Logic bundles" },
      { href: "/mjolnir", label: "Publish history" },
    ],
  },
  // These three pages are actually rendered by builder's own code
  // (`buildForecastBody`/`buildScheduleBody`/`buildLogsBody`, imported
  // directly — same monorepo, same shared Postgres, D-P3) — hub just wraps
  // them in its own shell so the nav/design stays one consistent place
  // instead of a separately-styled service with its own top-bar/rail.
  // Reversed from an earlier iframe-based "unified console" design that
  // doubled chrome and broke the device-dark workbench look the operator
  // preferred — see D109.
  {
    group: "Builder",
    items: [
      { href: "/mjolnir/builder/forecast", label: "Forecast & publish" },
      { href: "/mjolnir/builder/schedule", label: "Schedule" },
      { href: "/mjolnir/builder/logs", label: "Run log" },
      { href: "/mjolnir/decks", label: "Decks" },
    ],
  },
  {
    group: "Device",
    items: [
      { href: "/mjolnir/device", label: "Sync" },
      { href: "/mjolnir/device/insights", label: "Insights" },
    ],
  },
  {
    group: "Tools",
    items: [
      { href: "/mjolnir/catalogue", label: "Catalogue" },
      // The workbench is its own tabbed app (Explorer/Compare/Editor/
      // Patches/Assemble) — opening it in a new tab, not framed inline, is
      // the operator's stated preference and avoids nesting one tab bar
      // inside another.
      { href: "/mjolnir/workbench/", label: "Bundle workbench", target: "_blank" },
    ],
  },
];

export function renderShell({ title, activeHref, body }) {
  return renderSharedShell({
    title,
    activeHref,
    body,
    brand: "mjølnir · hub",
    activeZone: "/mjolnir",
    rail: (href) => renderRail(NAV, href),
  });
}

export { escapeHtml };
