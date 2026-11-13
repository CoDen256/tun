// builder's page chrome: its own rail, and the shared shell.
//
// Was a byte-for-byte copy of hub/src/layout.js's stylesheet (D46's "vendored
// CSS, not a package", restated by D80 for these two services specifically).
// zone-isolation 4.1 moved the shell, the stylesheet and the cross-zone
// navigation into libs/jsservice/layout.js — read that file's header for the
// reversal and its rationale. builder and hub remain separate processes; they
// now share a module, not a runtime.
import { renderShell as renderSharedShell, renderRail, escapeHtml } from "../../../libs/jsservice/layout.js";

const NAV = [
  {
    group: "Builder",
    items: [
      { href: "/builder", label: "Forecast & publish" },
      { href: "/builder/schedule", label: "Schedule" },
      { href: "/builder/logs", label: "Run log" },
    ],
  },
];

export function renderShell({ title, activeHref, body }) {
  return renderSharedShell({
    title,
    activeHref,
    body,
    brand: "mjølnir · builder",
    activeZone: "/builder",
    rail: (href) => renderRail(NAV, href),
  });
}

export { escapeHtml };
