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
      { href: "/mjolnir/builder/forecast", label: "Ship strips" },
      { href: "/mjolnir/builder/schedule", label: "Schedule" },
      { href: "/mjolnir/builder/logs", label: "Run log" },
      { href: "/mjolnir/decks", label: "Decks" },
    ],
  },
  {
    group: "Device",
    items: [
      { href: "/mjolnir/device", label: "Sync" },
      // ota-pull-tracking 4.1: what the device actually FETCHED, observed at
      // the gateway. It sits in this group next to Sync and Insights because
      // it answers the same question about the same handset from the other
      // direction — those two read what the device reported, this one reads
      // what the gateway served, which is the only half that survived D126.
      { href: "/mjolnir/device/pulls", label: "Pulls" },
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

// Hub serves two different things and the tab should say which. The Device
// group is the console for mjolnir-sync — a separate process on the device
// plane (D158) that serves JSON to the handset and no page of its own, so its
// mark would otherwise have nowhere to appear. Everything else gets the
// hammer. One operator with eight tabs open can tell the sync pages from the
// build pages without reading any of them.
function iconFor(activeHref) {
  return activeHref && activeHref.startsWith("/mjolnir/device")
    ? "mjolnir-sync"
    : "mjolnir-hub";
}

export function renderShell({ title, activeHref, body }) {
  return renderSharedShell({
    title,
    activeHref,
    body,
    brand: "mjølnir · hub",
    activeZone: "/mjolnir",
    icon: iconFor(activeHref),
    rail: (href) => renderRail(NAV, href),
  });
}

export { escapeHtml };
