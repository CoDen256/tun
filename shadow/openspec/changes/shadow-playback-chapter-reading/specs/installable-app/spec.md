# Spec Delta

## Purpose
shadow can be installed from a mobile or desktop browser as a standalone
app window, without any packaged binary, while staying behind the
operator-plane gate.

## ADDED Requirements

### Requirement: shadow is installable from the browser
shadow SHALL publish a web app manifest naming the app "shadow", scoped to
and starting at shadow's own prefix, with standalone display and icons, so
that a supporting browser offers to install it. The installed app SHALL open
shadow without browser chrome. No offline capability is required, and the
operator credential gate SHALL be unchanged.

#### Scenario: The browser offers installation
- **WHEN** shadow is opened in Chrome on Android or desktop
- **THEN** the browser offers "Install app" for shadow
- **AND** the manifest is served successfully behind the operator gate

#### Scenario: The installed app is standalone
- **WHEN** the installed app is launched
- **THEN** shadow opens on its Library without an address bar
